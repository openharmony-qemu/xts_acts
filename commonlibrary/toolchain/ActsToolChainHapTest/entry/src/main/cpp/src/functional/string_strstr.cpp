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

namespace {
constexpr int kWantStrPlus0 = 0;
constexpr int kWantStrPlus1 = 1;
constexpr int kWantStrPlus2 = 2;
constexpr int kWantStrPlus3 = 3;
constexpr int kWantStrPlus4 = 4;
constexpr int kWantStrPlus8 = 8;
} // namespace

static void CheckStrstrNotFound(const char* s, const char* sub)
{
    char* p = const_cast<char*>(s);
    char* q = strstr(p, sub);
    if (q != nullptr) {
        t_error("strstr(%s,%s) returned str+%d, wanted nullptr\n", s, sub, q - p);
    }
}

static void CheckStrstrFoundAt(const char* s, const char* sub, int n)
{
    char* p = const_cast<char*>(s);
    char* q = strstr(p, sub);
    if (q == nullptr) {
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
    CheckStrstrFoundAt("", "", kWantStrPlus0);
    CheckStrstrFoundAt("abcd", "", kWantStrPlus0);
    CheckStrstrFoundAt("abcd", "a", kWantStrPlus0);
    CheckStrstrFoundAt("abcd", "b", kWantStrPlus1);
    CheckStrstrFoundAt("abcd", "c", kWantStrPlus2);
    CheckStrstrFoundAt("abcd", "d", kWantStrPlus3);
    CheckStrstrFoundAt("abcd", "ab", kWantStrPlus0);
    CheckStrstrFoundAt("abcd", "bc", kWantStrPlus1);
    CheckStrstrFoundAt("abcd", "cd", kWantStrPlus2);
    CheckStrstrFoundAt("ababa", "baba", kWantStrPlus1);
    CheckStrstrFoundAt("ababab", "babab", kWantStrPlus1);
    CheckStrstrFoundAt("abababa", "bababa", kWantStrPlus1);
    CheckStrstrFoundAt("abababab", "bababab", kWantStrPlus1);
    CheckStrstrFoundAt("ababababa", "babababa", kWantStrPlus1);
    CheckStrstrFoundAt("abbababab", "bababa", kWantStrPlus2);
    CheckStrstrFoundAt("abbababab", "ababab", kWantStrPlus3);
    CheckStrstrFoundAt("abacabcabcab", "abcabcab", kWantStrPlus4);
    CheckStrstrFoundAt("nanabanabanana", "aba", kWantStrPlus3);
    CheckStrstrFoundAt("nanabanabanana", "ban", kWantStrPlus4);
    CheckStrstrFoundAt("nanabanabanana", "anab", kWantStrPlus1);
    CheckStrstrFoundAt("nanabanabanana", "banana", kWantStrPlus8);
    CheckStrstrFoundAt("_ _\xff_ _", "_\xff_", kWantStrPlus2);
    return T_STATUS;
}

int StringStrstrTest(void)
{
    return StringStrstrTestImpl();
}
