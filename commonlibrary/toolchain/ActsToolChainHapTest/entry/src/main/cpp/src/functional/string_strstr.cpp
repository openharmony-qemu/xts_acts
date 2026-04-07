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

static void CheckStrstrNotFound(const char* s, const char* sub)
{
    char* p = const_cast<char*>(s);
    char* q = strstr(p, sub);
    if (q) {
        t_error("strstr(%s,%s) returned str+%d, wanted 0\n", s, sub, q - p);
    }
}

static void CheckStrstrFoundAt(const char* s, const char* sub, int n)
{
    char* p = const_cast<char*>(s);
    char* q = strstr(p, sub);
    if (q == 0) {
        t_error("strstr(%s,%s) returned 0, wanted str+%d\n", s, sub, n);
    } else if (q - p != n) {
        t_error("strstr(%s,%s) returned str+%d, wanted str+%d\n", s, sub, q - p, n);
    }
}

static int StringStrstrTestImpl(void)
{
    CheckStrstrNotFound("", "a");
    CheckStrstrNotFound("a", "aa");
    CheckStrstrNotFound("a", "b");
    CheckStrstrNotFound("aa", "ab");
    CheckStrstrNotFound("aa", "aaa");
    CheckStrstrNotFound("abba", "aba");
    CheckStrstrNotFound("abc abc", "abcd");
    CheckStrstrNotFound("0-1-2-3-4-5-6-7-8-9", "-3-4-56-7-8-");
    CheckStrstrNotFound("0-1-2-3-4-5-6-7-8-9", "-3-4-5+6-7-8-");
    CheckStrstrNotFound("_ _ _\xff_ _ _", "_\x7f_");
    CheckStrstrNotFound("_ _ _\x7f_ _ _", "_\xff_");
    CheckStrstrFoundAt("", "", 0);
    CheckStrstrFoundAt("abcd", "", 0);
    CheckStrstrFoundAt("abcd", "a", 0);
    CheckStrstrFoundAt("abcd", "b", 1);
    CheckStrstrFoundAt("abcd", "c", 2);
    CheckStrstrFoundAt("abcd", "d", 3);
    CheckStrstrFoundAt("abcd", "ab", 0);
    CheckStrstrFoundAt("abcd", "bc", 1);
    CheckStrstrFoundAt("abcd", "cd", 2);
    CheckStrstrFoundAt("ababa", "baba", 1);
    CheckStrstrFoundAt("ababab", "babab", 1);
    CheckStrstrFoundAt("abababa", "bababa", 1);
    CheckStrstrFoundAt("abababab", "bababab", 1);
    CheckStrstrFoundAt("ababababa", "babababa", 1);
    CheckStrstrFoundAt("abbababab", "bababa", 2);
    CheckStrstrFoundAt("abbababab", "ababab", 3);
    CheckStrstrFoundAt("abacabcabcab", "abcabcab", 4);
    CheckStrstrFoundAt("nanabanabanana", "aba", 3);
    CheckStrstrFoundAt("nanabanabanana", "ban", 4);
    CheckStrstrFoundAt("nanabanabanana", "anab", 1);
    CheckStrstrFoundAt("nanabanabanana", "banana", 8);
    CheckStrstrFoundAt("_ _\xff_ _", "_\xff_", 2);
    return T_STATUS;
}

int StringStrstrTest(void)
{
    return StringStrstrTestImpl();
}
