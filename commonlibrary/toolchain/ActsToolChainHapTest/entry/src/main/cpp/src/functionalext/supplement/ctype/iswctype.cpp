/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cctype>
#include <clocale>
#include <cstdio>
#include <cwchar>
#include "test.h"

void iswctype_test(wchar_t ch, wctype_t wt, char* funcName, int want)
{
    int result = iswctype(ch, wt);
    if (result != want) {
        t_error("%s iswctype get result is %d are not want %d", funcName, result, want);
    }
}

static void IswctypeTestPartOne(wctype_t& wt)
{
    wt = wctype("alnum");
    iswctype_test(L'1', wt, "iswctype_0100", 1);
    wt = wctype("alpha");
    iswctype_test(L'a', wt, "iswctype_0200", 1);
    wt = wctype("blank");
    iswctype_test(L' ', wt, "iswctype_0300", 1);
    wt = wctype("cntrl");
    iswctype_test(L'\n', wt, "iswctype_0400", 1);
    wt = wctype("digit");
    iswctype_test(L'9', wt, "iswctype_0500", 1);
}

static void IswctypeTestPartTwo(wctype_t& wt)
{
    wt = wctype("lower");
    iswctype_test(L'a', wt, "iswctype_0600", 1);
    wt = wctype("print");
    iswctype_test(L'u', wt, "iswctype_0700", 1);
    wt = wctype("punct");
    iswctype_test(L',', wt, "iswctype_0800", 1);
    wt = wctype("upper");
    iswctype_test(L'G', wt, "iswctype_0900", 1);
}

static int IswctypeTestImpl(int argc, char* argv[])
{
    (void)argc;
    (void)argv;
    wctype_t wt;
    IswctypeTestPartOne(wt);
    IswctypeTestPartTwo(wt);
    return T_STATUS;
}

int IswctypeTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return IswctypeTestImpl(1, libcArgvStub);
}
