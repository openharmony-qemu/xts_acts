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

#define N(s, sub)                                                                  \
    {                                                                              \
        wchar_t* p = s;                                                            \
        wchar_t* q = wcsstr(p, sub);                                               \
        if (q)                                                                     \
            t_error("wcsstr(%s,%s) returned str+%d, wanted 0\n", #s, #sub, q - p); \
    }

#define t(s, sub, n)                                                                         \
    {                                                                                        \
        wchar_t* p = s;                                                                      \
        wchar_t* q = wcsstr(p, sub);                                                         \
        if (q == 0)                                                                          \
            t_error("wcsstr(%s,%s) returned 0, wanted str+%d\n", #s, #sub, (n));             \
        else if (q - p != (n))                                                               \
            t_error("wcsstr(%s,%s) returned str+%d, wanted str+%d\n", #s, #sub, q - p, (n)); \
    }

static int WcsstrTestImpl(void)
{
    N(L"", L"a")
    N(L"a", L"aa")
    N(L"a", L"b")
    N(L"aa", L"ab")
    N(L"aa", L"aaa")
    N(L"abba", L"aba")
    N(L"abc abc", L"abcd")
    N(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-56-7-8-")
    N(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-5+6-7-8-")
    N(L"_ _ _\xff_ _ _", L"_\x7f_")
    N(L"_ _ _\x7f_ _ _", L"_\xff_")

    t(L"", L"", 0) t(L"abcd", L"", 0) t(L"abcd", L"a", 0) t(L"abcd", L"b", 1) t(L"abcd", L"c", 2) t(L"abcd", L"d", 3)
        t(L"abcd", L"ab", 0) t(L"abcd", L"bc", 1) t(L"abcd", L"cd", 2) t(L"ababa", L"baba", 1) t(L"ababab", L"babab", 1)
            t(L"abababa", L"bababa", 1) t(L"abababab", L"bababab", 1) t(L"ababababa", L"babababa", 1)
                t(L"abbababab", L"bababa", 2) t(L"abbababab", L"ababab", 3) t(L"abacabcabcab", L"abcabcab", 4)
                    t(L"nanabanabanana", L"aba", 3) t(L"nanabanabanana", L"ban", 4) t(L"nanabanabanana", L"anab", 1)
                        t(L"nanabanabanana", L"banana", 8) t(L"_ _\xff_ _", L"_\xff_", 2)

                            return T_STATUS;
}

int WcsstrTest(void)
{
    return WcsstrTestImpl();
}
