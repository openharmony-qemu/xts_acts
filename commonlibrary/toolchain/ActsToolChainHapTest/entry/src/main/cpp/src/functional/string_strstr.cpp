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

#include <cstring>
#include "test.h"

#define N(s, sub)                                                                  \
    {                                                                              \
        char* p = s;                                                               \
        char* q = strstr(p, sub);                                                  \
        if (q)                                                                     \
            t_error("strstr(%s,%s) returned str+%d, wanted 0\n", #s, #sub, q - p); \
    }

#define t(s, sub, n)                                                                         \
    {                                                                                        \
        char* p = s;                                                                         \
        char* q = strstr(p, sub);                                                            \
        if (q == 0)                                                                          \
            t_error("strstr(%s,%s) returned 0, wanted str+%d\n", #s, #sub, (n));             \
        else if (q - p != (n))                                                               \
            t_error("strstr(%s,%s) returned str+%d, wanted str+%d\n", #s, #sub, q - p, (n)); \
    }

static int StringStrstrTestImpl(void)
{
    N("", "a")
    N("a", "aa")
    N("a", "b")
    N("aa", "ab")
    N("aa", "aaa")
    N("abba", "aba")
    N("abc abc", "abcd")
    N("0-1-2-3-4-5-6-7-8-9", "-3-4-56-7-8-")
    N("0-1-2-3-4-5-6-7-8-9", "-3-4-5+6-7-8-")
    N("_ _ _\xff_ _ _", "_\x7f_")
    N("_ _ _\x7f_ _ _", "_\xff_")

    t("", "", 0) t("abcd", "", 0) t("abcd", "a", 0) t("abcd", "b", 1) t("abcd", "c", 2) t("abcd", "d", 3)
        t("abcd", "ab", 0) t("abcd", "bc", 1) t("abcd", "cd", 2) t("ababa", "baba", 1) t("ababab", "babab", 1)
            t("abababa", "bababa", 1) t("abababab", "bababab", 1) t("ababababa", "babababa", 1)
                t("abbababab", "bababa", 2) t("abbababab", "ababab", 3) t("abacabcabcab", "abcabcab", 4)
                    t("nanabanabanana", "aba", 3) t("nanabanabanana", "ban", 4) t("nanabanabanana", "anab", 1)
                        t("nanabanabanana", "banana", 8) t("_ _\xff_ _", "_\xff_", 2)

                            return T_STATUS;
}

int StringStrstrTest(void)
{
    return StringStrstrTestImpl();
}
