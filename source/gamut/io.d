/**
I/O streams in FreeImage.

Copyright: Copyright Guillaume Piolat 2022
License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
*/
module gamut.io;

import core.stdc.stdio;
public import core.stdc.config: c_long;
public import core.stdc.stdio: SEEK_SET, SEEK_CUR, SEEK_END;

nothrow @nogc:


// Limits of I/O in gamut.
// This is because FreeImage callbakcs are modelled upon C stdlib functions, some of those use c_long or int.
enum size_t GAMUT_MAX_POSSIBLE_MEMORY_OFFSET = 0x7fff_ffff;       /// Can't open file larger than this much bytes
enum size_t GAMUT_MAX_POSSIBLE_SIMULTANEOUS_READ = 0x7fff_ffff;   /// Can't read more bytes than this at once
enum size_t GAMUT_MAX_POSSIBLE_SIMULTANEOUS_WRITE = 0x7fff_ffff;  /// Can't write more bytes than this at once


/// FreeImage has the unique feature to load a bitmap from an arbitrary source. This source 
/// might for example be a cabinet file, a zip file or an Internet stream. Handling of these arbitrary 
/// sources is not directly handled in the FREEIMAGE.DLL, but can be easily added by using a 
/// FreeImageIO structure as defined in FREEIMAGE.H.
/// FreeImageIO is a structure that contains 4 function pointers: one to read from a source, one 
/// to write to a source, one to seek in the source and one to tell where in the source we 
/// currently are. When you populate the FreeImageIO structure with pointers to functions and 
/// pass that structure to FreeImage_LoadFromHandle, FreeImage will call your functions to 
/// read, seek and tell in a file. The handle-parameter (third parameter from the left) is used in 
/// this to differentiate between different contexts, e.g. different files or different Internet streams.
struct FreeImageIO
{
    ReadProc  read;
    WriteProc write;
    SeekProc  seek;
    TellProc  tell;
    EofProc   eof;

    /// Skip bytes.
    /// Returns: true if it was possible to skip those bytes. false if there was an I/O error, or end of file.
    /// Limitations: `nbytes` must be from 0 to 0x7fffffff
    bool skipBytes(fi_handle handle, int nbytes) nothrow @nogc @trusted
    {
        assert(nbytes >= 0 && nbytes <= GAMUT_MAX_POSSIBLE_SIMULTANEOUS_READ);
        return seek(handle, nbytes, SEEK_CUR) == 0;
    }

    /// Seek to beginning of the I/O stream.
    /// Returns: true if successful.
    bool rewind(fi_handle handle) nothrow @nogc @trusted
    {
        return seek(handle, 0, SEEK_SET) == 0;
    }
}


alias fi_handle = void*;

// Note: those function pointers made to be binary compatible with ftell/fseek/fwrite/fread/feof.
extern(C) @system
{
    /// I/O read function, modelled on fread.
    ///
    /// Some details from the Linux man pages:
    ///
    /// "On success, fread() and fwrite() return the number of items read
    ///  or written.  This number equals the number of bytes transferred
    ///  only when size is 1.  If an error occurs, or the end of the file
    ///  is reached, the return value is a short item count (or zero).
    ///
    ///  The file position indicator for the stream is advanced by the
    ///  number of bytes successfully read or written.
    ///
    ///  fread() does not distinguish between end-of-file and error, and
    ///  callers must use feof() and ferror() to determine which
    ///  occurred.
    ///
    /// Params:
    ///    buffer Where to read. Must be able to hold `size` * `count` bytes.
    ///    size Size of elements to read in stream.
    ///    count Number of elements to read in stream.
    ///
    /// Returns: 
    ///    Number of item successfully read. If return value != `count`, there was an error.
    ///
    /// Limitations: it is forbidden to ask more than 0x7fffffff bytes at once.
    alias ReadProc = size_t function(void* buffer, size_t size, size_t count, fi_handle handle);

    alias WriteProc = size_t function(void* buffer, size_t size, size_t count, fi_handle handle);
    
    // Origin: position from which offset is added
    //   SEEK_SET = beginning of file.
    //   SEEK_CUR = Current position of file pointer.
    //   SEEK_END = end of file.
    // This function returns zero if successful, or else it returns a non-zero value.
    alias SeekProc = int function(fi_handle handle, c_long offset, int origin);

    // Tells where we are in the file. -1 if error.
    alias TellProc = c_long function(fi_handle handle);

    /// From Linux man:
    /// "The function `feof()` tests the end-of-file indicator for the stream pointed to by stream, 
    ///  returning nonzero if it is set."
    alias EofProc = int function(fi_handle handle);
}

package void setupFreeImageIOForFile(ref FreeImageIO io) @trusted
{
    io.read  = cast(ReadProc) &fread;
    io.write = cast(WriteProc) &fwrite;
    io.seek  = cast(SeekProc) &fseek;
    io.tell  = cast(TellProc) &ftell;
    io.eof   = cast(EofProc) &feof;
}
