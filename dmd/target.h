
/* Compiler implementation of the D programming language
 * Copyright (C) 2013-2019 by The D Language Foundation, All Rights Reserved
 * written by Iain Buclaw
 * http://www.digitalmars.com
 * Distributed under the Boost Software License, Version 1.0.
 * http://www.boost.org/LICENSE_1_0.txt
 * https://github.com/dlang/dmd/blob/master/src/dmd/target.h
 */

#pragma once

// This file contains a data structure that describes a back-end target.
// At present it is incomplete, but in future it should grow to contain
// most or all target machine and target O/S specific information.
#include "globals.h"
#include "tokens.h"

class ClassDeclaration;
class Dsymbol;
class Expression;
class Parameter;
class Type;
class TypeFunction;
class TypeTuple;
class TypeFunction;

struct Target
{
    // D ABI
    unsigned ptrsize;
    unsigned realsize;           // size a real consumes in memory
    unsigned realpad;            // 'padding' added to the CPU real size to bring it up to realsize
    unsigned realalignsize;      // alignment for reals
    unsigned classinfosize;      // size of 'ClassInfo'
    unsigned long long maxStaticDataSize;  // maximum size of static data

    // C ABI
    unsigned c_longsize;         // size of a C 'long' or 'unsigned long' type
    unsigned c_long_doublesize;  // size of a C 'long double'
    unsigned criticalSectionSize; // size of os critical section

    // C++ ABI
    bool reverseCppOverloads;    // with dmc and cl, overloaded functions are grouped and in reverse order
    bool cppExceptions;          // set if catching C++ exceptions is supported
    bool twoDtorInVtable;        // target C++ ABI puts deleting and non-deleting destructor into vtable

    template <typename T>
    struct FPTypeProperties
    {
        real_t max;
        real_t min_normal;
        real_t nan;
        real_t snan;
        real_t infinity;
        real_t epsilon;

        d_int64 dig;
        d_int64 mant_dig;
        d_int64 max_exp;
        d_int64 min_exp;
        d_int64 max_10_exp;
        d_int64 min_10_exp;

        void _init();
    };

    FPTypeProperties<float> FloatProperties;
    FPTypeProperties<double> DoubleProperties;
    FPTypeProperties<real_t> RealProperties;

    void _init(const Param& params);
    // Type sizes and support.
    unsigned alignsize(Type *type);
    unsigned fieldalign(Type *type);
    unsigned critsecsize();
    Type *va_listType();  // get type of va_list
    int isVectorTypeSupported(int sz, Type *type);
    bool isVectorOpSupported(Type *type, TOK op, Type *t2 = NULL);
    // ABI and backend.
    const char *toCppMangle(Dsymbol *s);
    const char *cppTypeInfoMangle(ClassDeclaration *cd);
    const char *cppTypeMangle(Type *t);
    Type *cppParameterType(Parameter *p);
    bool cppFundamentalType(const Type *t, bool& isFundamental);
    LINK systemLinkage();
    TypeTuple *toArgTypes(Type *t);
    bool isReturnOnStack(TypeFunction *tf, bool needsThis);
    d_uns64 parameterSize(const Loc& loc, Type *t);
    Expression *getTargetInfo(const char* name, const Loc& loc);
};

extern Target target;
