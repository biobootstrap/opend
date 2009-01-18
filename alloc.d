/**Allocation functions.
 * Author:  David Simcha
 *
 * Copyright (c) 2009, David Simcha
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 *     * Neither the name of the authors nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*/

module dstats.alloc;

import std.traits, core.memory, core.thread;

version(unittest) {
    import std.stdio;
    void main() {}
}

template IsType(T, Types...) {
    // Original idea by Burton Radons, modified
    static if (Types.length == 0)
        const bool IsType = false;
    else
        const bool IsType = is(T == Types[0]) || IsType!(T, Types[1 .. $]);
}

template ArrayType1(T: T[]) {
    alias T ArrayType1;
}

template isReferenceType(Types...) {  //Thanks to Bearophile.
    static if (Types.length == 0) {
        const bool isReferenceType = false;
    } else static if (Types.length == 1) {
        static if (IsType!(Mutable!(Types[0]), bool, byte, ubyte, short, ushort,
                           int, uint, long, ulong, float, double, real, ifloat,
                           idouble, ireal, cfloat, cdouble, creal, char, dchar,
                           wchar) ) {
            const bool isReferenceType = false;
        } else static if ( is(Types[0] == struct) ) {
            const bool isReferenceType =
                       isReferenceType!(FieldTypeTuple!(Types[0]));
        } else static if (isStaticArray!(Types[0])) {
            const bool isReferenceType = isReferenceType!(ArrayType1!(Types[0]));
        } else
            const bool isReferenceType = true;
    } else
        const bool isReferenceType = isReferenceType!(Types[0]) |
                                     isReferenceType!(Types[1 .. $]);
} // end isReferenceType!()

unittest {
    static assert(!isReferenceType!(typeof("Foo"[0])));
    static assert(isReferenceType!(uint*));
    static assert(!isReferenceType!(typeof([0,1,2])));
    struct noPtrs {
        uint f;
        uint b;
    }
    struct ptrs {
        uint* f;
        uint b;
    }
    static assert(!isReferenceType!(noPtrs));
    static assert(isReferenceType!(ptrs));
    pragma(msg, "Passed isReferenceType unittest");
}

template blockAttribute(T) {
    static if(isReferenceType!(T))
        enum blockAttribute = 0;
    else enum blockAttribute = GC.BlkAttr.NO_SCAN;
}

///Returns a new array of type T w/o initializing elements.
T[] newVoid(T)(size_t length) {
    T* ptr = cast(T*) GC.malloc(length * T.sizeof, blockAttribute!(T));
    return ptr[0..length];
}

void lengthVoid(T)(ref T[] input, int newLength) {
    input.lengthVoid(cast(size_t) newLength);
}

///Lengthens an array w/o initializing new elements.
void lengthVoid(T)(ref T[] input, size_t newLength) {
    if(newLength <= input.length ||
       GC.sizeOf(input.ptr) >= newLength * T.sizeof) {
        input = input.ptr[0..newLength];  //Don't realloc if I don't have to.
    } else {
        T* newPtr = cast(T*) GC.realloc(input.ptr,
                             T.sizeof * newLength, blockAttribute!(T));
        input = newPtr[0..newLength];
    }
}

void reserve(T)(ref T[] input, int newLength) {
    input.reserve(cast(size_t) newLength);
}

/**Reserves more space for an array w/o changing its length or initializing
 * the space.*/
void reserve(T)(ref T[] input, size_t newLength) {
    if(newLength <= input.length || capacity(input.ptr) >= newLength * T.sizeof)
        return;
    T* newPtr = cast(T*) GC.realloc(input.ptr, T.sizeof * newLength);
    staticSetTypeInfo!(T)(newPtr);
    input = newPtr[0..input.length];
}

///Appends to an array, deleting the old array if it has to be realloced.
void appendDelOld(T, U)(ref T[] to, U from)
if(is(Mutable!(T) : Mutable!(U)) || is(Mutable!(T[0]) : Mutable!(U))) {
    auto oldPtr = to.ptr;
    to ~= from;
    if(oldPtr != to.ptr)
        delete oldPtr;
}

unittest {
    uint[] foo;
    foo.appendDelOld(5);
    foo.appendDelOld(4);
    foo.appendDelOld(3);
    foo.appendDelOld(2);
    foo.appendDelOld(1);
    assert(foo == cast(uint[]) [5,4,3,2,1]);
    writefln("Passed appendDelOld test.");
}

// C functions, marked w/ nothrow.
extern(C) nothrow int printf(in char *,...);
extern(C) nothrow void exit(int);
extern(C) nothrow void* malloc(size_t);
extern(C) nothrow void* realloc(void*, size_t);
extern(C) nothrow void* free(void*);
alias malloc cstdmalloc;
alias realloc cstdrealloc;
alias free cfree;

/**TempAlloc struct.  See TempAlloc project on Scrapple.*/
struct TempAlloc {
    struct block {
        void* space;
        size_t used;
        block* prev;

        void freeAll() {
            if(prev !is null)
                prev.freeAll();
            if(space !is null)
                cfree(space);
            cfree(&this);
        }
    }

    final class State {
         uint nblocks;
         uint nfree;
         size_t totalAllocs;
         size_t frameIndex;
         void*[] lastAlloc;
         block* current;
         block* freelist;

         ~this() {
            cfree(lastAlloc.ptr);
            if(current !is null)  // Should never be null, but better to be safe.
                current.freeAll();
            if(freelist !is null)
                freelist.freeAll();
         }
    }

    // core.thread.Thread.thread_needLock() is nothrow (read the code if you
    // don't believe me) but not marked as such because nothrow is such a new
    // feature in D.  This is a workaround until that gets fixed.
    static enum tnl = cast(bool function() nothrow) &thread_needLock;

    enum blockSize = 4U * 1024U * 1024U;
    enum nBookKeep = 1_048_576;
    enum alignBytes = 16U;
    static __thread State state;
    static State mainThreadState;

    static void die() nothrow {
        printf("TempAlloc error: Out of memory.\0".ptr);
        exit(1);
    }

    static void doubleSize(ref void*[] lastAlloc) nothrow {
        size_t newSize = lastAlloc.length * 2;
        void** ptr = cast(void**) crealloc(lastAlloc.ptr, newSize);
        return ptr[0..newSize];
    }

    static void* cmalloc(size_t size) nothrow {
        void* ret = cstdmalloc(size);
        if(ret is null) {
            try { GC.collect(); } catch {}
            ret = cstdmalloc(size);

            if(ret is null)
                die();
        }
        return ret;
    }

    static void* crealloc(void* ptr, size_t size) nothrow {
        void* ret = cstdrealloc(ptr, size);
        if(ret is null) {
            try { GC.collect(); } catch {}
            ret = cstdrealloc(ptr, size);

            if(ret is null)
                die();
        }
        return ret;
    }

    static size_t getAligned(size_t nbytes) pure nothrow {
        size_t rem = nbytes % alignBytes;
        return (rem == 0) ? nbytes : nbytes - rem + alignBytes;
    }

    static State stateInit() nothrow {
        State stateCopy;
        try {
            stateCopy = new State;
        } catch { die; }

        with(stateCopy) {
            current = cast(block*) cmalloc(block.sizeof);
            *current = block.init;
            current.space = cmalloc(blockSize);
            lastAlloc = (cast(void**) cmalloc(nBookKeep))[0..nBookKeep / (void*).sizeof];
            nblocks++;
        }

        state = stateCopy;
        if(!tnl())
            mainThreadState = stateCopy;
        return stateCopy;
    }

    /**Allows caller to cache the state class on the stack and pass it in as a
     * parameter.  This is ugly, but results in a speed boost that can be
     * significant in some cases because it avoids a thread-local storage
     * lookup.  Also used internally.*/
    static State getState() nothrow {
        // Believe it or not, even with builtin TLS, the thread_needLock()
        // is worth it to avoid the TLS lookup.
        State stateCopy = (tnl()) ?
                          state :
                          mainThreadState;
        return (stateCopy is null) ? stateInit : stateCopy;
    }

    /**Initializes a frame, i.e. marks the current allocation position.
     * Memory past the position at which this was last called will be
     * freed when frameFree() is called.  Returns a reference to the
     * State class in case the caller wants to cache it for speed.*/
    static State frameInit() nothrow {
        return frameInit(getState);
    }

    /**Same as frameInit() but uses stateCopy cached on stack by caller
     * to avoid a thread-local storage lookup.  Strictly a speed hack.*/
    static State frameInit(State stateCopy) nothrow {
        with(stateCopy) {
        if(totalAllocs == lastAlloc.length) // Should happen very infrequently.
            doubleSize(lastAlloc);
        lastAlloc[totalAllocs] = cast(void*) frameIndex;
        frameIndex = totalAllocs;
        totalAllocs++;
        }
        return stateCopy;
    }

    /**Frees all memory allocated by TempAlloc since the last call to
     * frameInit().*/
    static void frameFree() nothrow {
        frameFree(getState);
    }

    /**Same as frameFree() but uses stateCopy cached on stack by caller
    * to avoid a thread-local storage lookup.  Strictly a speed hack.*/
    static void frameFree(State stateCopy) nothrow {
        with(stateCopy) {
        while(totalAllocs > frameIndex + 1) {
            free(stateCopy);
        }
        frameIndex = cast(size_t) lastAlloc[--totalAllocs];
        }
    }

    /**Purely a convenience overload, forwards arguments to TempAlloc.malloc().*/
    static void* opCall(T...)(T args) nothrow {
        return TempAlloc.malloc(args);
    }

    /**Allocates nbytes bytes on the TempAlloc stack.  NOT safe for real-time
     * programming, since if there's not enough space on the current block,
     * a new one will automatically be created.  Also, very large objects
     * (currently over 4MB) will simply be heap-allocated.
     *
     * Bugs:  Memory allocated by TempAlloc is not scanned by the GC.
     * This is necessary for performance and to avoid false pointer issues.
     * Do not store the only reference to a GC-allocated object in
     * TempAlloc-allocated memory.*/
    static void* malloc(size_t nbytes) nothrow {
        return malloc(nbytes, getState);
    }

    /**Same as malloc() but uses stateCopy cached on stack by caller
    * to avoid a thread-local storage lookup.  Strictly a speed hack.*/
    static void* malloc(size_t nbytes, State stateCopy) nothrow {
        nbytes = getAligned(nbytes);
        with(stateCopy) {
            void* ret;
            if(blockSize - current.used >= nbytes) {
                ret = current.space + current.used;
                current.used += nbytes;
            } else if(nbytes > blockSize) {
                ret = cmalloc(nbytes);
            } else if(nfree > 0) {
                block* prev = freelist.prev;
                freelist.prev = current;
                current = freelist;
                freelist = prev;
                current.used = nbytes;
                nfree--;
                nblocks++;
                ret = current.space;
            } else { // Allocate more space.
                block* newBlock = cast(block*) cmalloc(block.sizeof);
                *newBlock = block.init;
                newBlock.space = cmalloc(blockSize);
                nblocks++;
                newBlock.prev = current;
                newBlock.used = nbytes;
                current = newBlock;
                ret = current.space;
            }
            if(totalAllocs == lastAlloc.length) // Should happen very infrequently.
                doubleSize(lastAlloc);
            lastAlloc[totalAllocs++] = ret;
            return ret;
        }
    }

    /**Frees the last piece of memory allocated by TempAlloc.  Since
     * all memory must be allocated and freed in strict LIFO order,
     * there's no need to pass a pointer in.  All bookkeeping for figuring
     * out what to free is done internally.*/
    static void free() nothrow {
        free(getState);
    }

    /**Same as free() but uses stateCopy cached on stack by caller
    * to avoid a thread-local storage lookup.  Strictly a speed hack.*/
    static void free(State stateCopy) nothrow {
        with(stateCopy) {
            void* lastPos = lastAlloc[--totalAllocs];

            // Handle large blocks.
            if(lastPos > current.space + blockSize ||
               lastPos < current.space) {
               cfree(lastPos);
               return;
            }

            size_t diff = (cast(size_t) current.space) + current.used
                             - (cast(size_t) lastPos);
            current.used -= diff;
            if(nblocks > 1 && current.used == 0) {
                block* prev = current.prev;
                current.prev = freelist;
                freelist = current;
                current = prev;
                nblocks--;
                nfree++;

                if(nfree >= nblocks * 2) {
                    foreach(i; 0..nfree / 2) {
                        block* last = freelist;
                        freelist = freelist.prev;
                        cfree(last.space);
                        cfree(last);
                        nfree--;
                    }
                }
            }
        }
    }
}

/**Allocates an array of type T and size size using TempAlloc.
 * Note that appending to this array using the ~= operator,
 * or enlarging it using the .length property, will result in
 * undefined behavior.  This is because, if the array is located
 * at the beginning of a TempAlloc block, the GC will think the
 * capacity is as large as a TempAlloc block, and will overwrite
 * adjacent TempAlloc-allocated data, instead of reallocating it.
 *
 * Bugs: Do not store the only reference to a GC-allocated reference object
 * in an array allocated by newStack because this memory is not
 * scanned by the GC.*/
T[] newStack(T)(size_t size) nothrow {
    size_t bytes = size * T.sizeof;
    T* ptr = cast(T*) TempAlloc.malloc(bytes);
    return ptr[0..size];
}

/**Same as newStack(size_t) but uses stateCopy cached on stack by caller
* to avoid a thread-local storage lookup.  Strictly a speed hack.*/
T[] newStack(T)(size_t size, TempAlloc.State state) nothrow {
    size_t bytes = size * T.sizeof;
    T* ptr = cast(T*) TempAlloc.malloc(bytes, state);
    return ptr[0..size];
}

/**Creates a duplicate of an array on the TempAlloc struct.*/
auto tempdup(T)(T[] data) nothrow {
    alias Mutable!(T) U;
    U[] ret = newStack!(U)(data.length);
    ret[] = data[];
    return ret;
}

/**Same as tempdup(T[]) but uses stateCopy cached on stack by caller
 * to avoid a thread-local storage lookup.  Strictly a speed hack.*/
auto tempdup(T)(T[] data, TempAlloc.State state) nothrow {
    alias Mutable!(T) U;
    U[] ret = newStack!(U)(data.length, state);
    ret[] = data;
    return ret;
}

/**A string to mixin at the beginning of a scope, purely for
 * convenience.  Initializes a TempAlloc frame using frameInit(),
 * and inserts a scope statement to delete this frame at the end
 * of the current scope.
 *
 * Slower than calling free() manually when only a few pieces
 * of memory will be allocated in the current scope, due to the
 * extra bookkeeping involved.  Can be faster, however, when
 * large amounts of allocations, such as arrays of arrays,
 * are allocated, due to caching of data stored in thread-local
 * storage.*/
invariant char[] newFrame =
          "TempAlloc.frameInit; scope(exit) TempAlloc.frameFree;";
