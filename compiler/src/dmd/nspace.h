
/* Compiler implementation of the D programming language
 * Copyright (C) 1999-2023 by The D Language Foundation, All Rights Reserved
 * written by Walter Bright
 * https://www.digitalmars.com
 * Distributed under the Boost Software License, Version 1.0.
 * https://www.boost.org/LICENSE_1_0.txt
 * https://github.com/dlang/dmd/blob/master/src/dmd/nspace.h
 */

#pragma once

#include "dsymbol.h"

/* A namespace corresponding to a C++ namespace.
 * Implies extern(C++).
 */

class Nspace final : public ScopeDsymbol
{
  public:
    Expression *identExp;
    Nspace *syntaxCopy(Dsymbol *s) override;
    void setScope(Scope *sc) override;
    Dsymbol *search(const Loc &loc, Identifier *ident, int flags = SearchLocalsOnly) override;
    bool hasPointers() override;
    void setFieldOffset(AggregateDeclaration *ad, FieldState& fieldState, bool isunion) override;
    const char *kind() const override;
    Nspace *isNspace() override { return this; }
    void accept(Visitor *v) override { v->visit(this); }
};
