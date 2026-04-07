/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <cwchar>
#include "test.h"

static void CheckWcsstrNotFound(const wchar_t* s, const wchar_t* sub)
{
    wchar_t* p = const_cast<wchar_t*>(s);
    wchar_t* q = wcsstr(p, sub);
    if (q) {
        t_error("wcsstr(%ls,%ls) returned str+%d, wanted 0\n", s, sub, q - p);
    }
}

static void CheckWcsstrFoundAt(const wchar_t* s, const wchar_t* sub, int n)
{
    wchar_t* p = const_cast<wchar_t*>(s);
    wchar_t* q = wcsstr(p, sub);
    if (q == 0) {
        t_error("wcsstr(%ls,%ls) returned 0, wanted str+%d\n", s, sub, n);
    } else if (q - p != n) {
        t_error("wcsstr(%ls,%ls) returned str+%d, wanted str+%d\n", s, sub, q - p, n);
    }
}

static int WcsstrTestImpl(void)
{
    CheckWcsstrNotFound(L"", L"a");
    CheckWcsstrNotFound(L"a", L"aa");
    CheckWcsstrNotFound(L"a", L"b");
    CheckWcsstrNotFound(L"aa", L"ab");
    CheckWcsstrNotFound(L"aa", L"aaa");
    CheckWcsstrNotFound(L"abba", L"aba");
    CheckWcsstrNotFound(L"abc abc", L"abcd");
    CheckWcsstrNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-56-7-8-");
    CheckWcsstrNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-5+6-7-8-");
    CheckWcsstrNotFound(L"_ _ _\xff_ _ _", L"_\x7f_");
    CheckWcsstrNotFound(L"_ _ _\x7f_ _ _", L"_\xff_");
    CheckWcsstrFoundAt(L"", L"", 0);
    CheckWcsstrFoundAt(L"abcd", L"", 0);
    CheckWcsstrFoundAt(L"abcd", L"a", 0);
    CheckWcsstrFoundAt(L"abcd", L"b", 1);
    CheckWcsstrFoundAt(L"abcd", L"c", 2);
    CheckWcsstrFoundAt(L"abcd", L"d", 3);
    CheckWcsstrFoundAt(L"abcd", L"ab", 0);
    CheckWcsstrFoundAt(L"abcd", L"bc", 1);
    CheckWcsstrFoundAt(L"abcd", L"cd", 2);
    CheckWcsstrFoundAt(L"ababa", L"baba", 1);
    CheckWcsstrFoundAt(L"ababab", L"babab", 1);
    CheckWcsstrFoundAt(L"abababa", L"bababa", 1);
    CheckWcsstrFoundAt(L"abababab", L"bababab", 1);
    CheckWcsstrFoundAt(L"ababababa", L"babababa", 1);
    CheckWcsstrFoundAt(L"abbababab", L"bababa", 2);
    CheckWcsstrFoundAt(L"abbababab", L"ababab", 3);
    CheckWcsstrFoundAt(L"abacabcabcab", L"abcabcab", 4);
    CheckWcsstrFoundAt(L"nanabanabanana", L"aba", 3);
    CheckWcsstrFoundAt(L"nanabanabanana", L"ban", 4);
    CheckWcsstrFoundAt(L"nanabanabanana", L"anab", 1);
    CheckWcsstrFoundAt(L"nanabanabanana", L"banana", 8);
    CheckWcsstrFoundAt(L"_ _\xff_ _", L"_\xff_", 2);
    return T_STATUS;
}

int WcsstrTest(void)
{
    return WcsstrTestImpl();
}
