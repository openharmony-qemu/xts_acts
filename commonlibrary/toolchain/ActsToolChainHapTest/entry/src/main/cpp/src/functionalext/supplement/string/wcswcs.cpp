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

#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr int K_ABC_REPEAT_BLOCKS = 33;
constexpr int K_ABC_TRIPLET_LEN = 3;
constexpr int K_LONG_WCS_BUF_ELEMS = 100;
constexpr int K_LONG_WCS_NUL_INDEX = 99;
constexpr int K_PATTERN_BUF_ELEMS = 20;
} // namespace

static void ExpectNotFound(const wchar_t* s, const wchar_t* sub)
{
    const wchar_t* p = s;
    const wchar_t* q = wcswcs(const_cast<wchar_t*>(p), sub);
    if (q != nullptr) {
        t_error("wcswcs returned str+%d, wanted nullptr\n", static_cast<int>(q - p));
    }
}

static void ExpectFoundAt(const wchar_t* s, const wchar_t* sub, int n)
{
    const wchar_t* p = s;
    const wchar_t* q = wcswcs(const_cast<wchar_t*>(p), sub);
    if (q == nullptr) {
        t_error("wcswcs returned nullptr, wanted str+%d\n", n);
    } else if (q - p != n) {
        t_error("wcswcs returned str+%d, wanted str+%d\n", static_cast<int>(q - p), n);
    }
}

/**
 * @tc.name      : Wcswcs0100
 * @tc.desc      : test the wcswcs method to find the first occurrence of the second wide string from the first wide
 *                 string
 * @tc.level     : Level 0
 */
void Wcswcs0100(void)
{
    ExpectFoundAt(L"", L"", 0);
    ExpectFoundAt(L"abcd", L"", 0);
    ExpectFoundAt(L"abcd", L"a", 0);
    ExpectFoundAt(L"abcd", L"b", 1);
    ExpectFoundAt(L"abcd", L"c", 2);
    ExpectFoundAt(L"abcd", L"d", 3);
    ExpectFoundAt(L"abcd", L"ab", 0);
    ExpectFoundAt(L"abcd", L"bc", 1);
    ExpectFoundAt(L"abcd", L"cd", 2);
    ExpectFoundAt(L"ababa", L"baba", 1);
    ExpectFoundAt(L"ababab", L"babab", 1);
    ExpectFoundAt(L"abababa", L"bababa", 1);
    ExpectFoundAt(L"abababab", L"bababab", 1);
    ExpectFoundAt(L"ababababa", L"babababa", 1);
    ExpectFoundAt(L"abbababab", L"bababa", 2);
    ExpectFoundAt(L"abbababab", L"ababab", 3);
    ExpectFoundAt(L"abacabcabcab", L"abcabcab", 4);
    ExpectFoundAt(L"nanabanabanana", L"aba", 3);
    ExpectFoundAt(L"nanabanabanana", L"ban", 4);
    ExpectFoundAt(L"nanabanabanana", L"anab", 1);
    ExpectFoundAt(L"nanabanabanana", L"banana", 8);
    ExpectFoundAt(L"_ _\xff_ _", L"_\xff_", 2);
}

/**
 * @tc.name      : Wcswcs0200
 * @tc.desc      : test the result of the wcswcs method when the second substring cannot be found from the first
 * substring
 * @tc.level     : Level 1
 */
void Wcswcs0200(void)
{
    ExpectNotFound(L"", L"a");
    ExpectNotFound(L"a", L"aa");
    ExpectNotFound(L"a", L"b");
    ExpectNotFound(L"aa", L"ab");
    ExpectNotFound(L"aa", L"aaa");
    ExpectNotFound(L"abba", L"aba");
    ExpectNotFound(L"abc abc", L"abcd");
    ExpectNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-56-7-8-");
    ExpectNotFound(L"0-1-2-3-4-5-6-7-8-9", L"-3-4-5+6-7-8-");
    ExpectNotFound(L"_ _ _\xff_ _ _", L"_\x7f_");
    ExpectNotFound(L"_ _ _\x7f_ _ _", L"_\xff_");
}

/**
 * @tc.name      : Wcswcs0300
 * @tc.desc      : test wcswcs with overlapping patterns and edge cases
 * @tc.level     : Level 1
 */
void Wcswcs0300(void)
{
    // Overlapping pattern tests
    ExpectFoundAt(L"aaaabaaaa", L"aaa", 0);
    ExpectFoundAt(L"mississippi", L"issi", 1);
    ExpectFoundAt(L"abcabcabc", L"abcabc", 0);
    ExpectFoundAt(L"ababababab", L"ababab", 0);

    // Edge cases
    ExpectFoundAt(L"x", L"x", 0);
    ExpectFoundAt(L"xy", L"xy", 0);
    ExpectFoundAt(L"xyz", L"yz", 1);
    ExpectFoundAt(L"a\0b", L"a", 0); // String containing null character
}

/**
 * @tc.name      : Wcswcs0400
 * @tc.desc      : test wcswcs with very long strings and patterns
 * @tc.level     : Level 2
 */
void Wcswcs0400(void)
{
    wchar_t longStr[K_LONG_WCS_BUF_ELEMS];
    wchar_t pattern[K_PATTERN_BUF_ELEMS];

    const int INDEX_0 = 0;
    const int INDEX_1 = 1;
    const int INDEX_2 = 2;
    // Generate long string "abcabc...abc"
    for (int i = 0; i < K_ABC_REPEAT_BLOCKS; i++) {
        wchar_t* p = longStr + i * K_ABC_TRIPLET_LEN;
        p[INDEX_0] = L'a';
        p[INDEX_1] = L'b';
        p[INDEX_2] = L'c';
    }
    longStr[K_LONG_WCS_NUL_INDEX] = L'\0';

    ExpectFoundAt(longStr, L"abc", 0);
    ExpectFoundAt(longStr, L"bca", 1);
    ExpectFoundAt(longStr, L"abcabc", 0);

    // test long pattern
    {
        const wchar_t lit[] = L"abcabcabcabc";
        size_t j = 0;
        for (; lit[j] != L'\0' && j + 1 < static_cast<size_t>(K_PATTERN_BUF_ELEMS); ++j) {
            pattern[j] = lit[j];
        }
        pattern[j] = L'\0';
    }
    ExpectFoundAt(longStr, pattern, 0);
}

/**
 * @tc.name      : Wcswcs0500
 * @tc.desc      : test wcswcs with whitespace characters and control characters
 * @tc.level     : Level 1
 */
void Wcswcs0500(void)
{
    // Whitespace character tests
    ExpectFoundAt(L"hello world", L" ", 5);
    ExpectFoundAt(L"tab\ttab", L"\t", 3);
    ExpectFoundAt(L"new\nline", L"\n", 3);
    ExpectFoundAt(L"carriage\rreturn", L"\r", 8);

    // Mixed whitespace characters
    ExpectFoundAt(L"a b c d", L" c ", 3);
    ExpectFoundAt(L"test\t\n\rstring", L"\t\n\r", 4);
}

/**
 * @tc.name      : Wcswcs0600
 * @tc.desc      : test wcswcs with repeated characters and patterns
 * @tc.level     : Level 0
 */
void Wcswcs0600(void)
{
    // Repeated character tests
    ExpectFoundAt(L"aaaaaaaaaa", L"aaa", 0);
    ExpectFoundAt(L"aaaaaaaaaa", L"aaaaa", 0);
    ExpectFoundAt(L"ababababab", L"abab", 0);
    ExpectFoundAt(L"abcabcabc", L"bcab", 1);

    // Partial matches that ultimately fail
    ExpectNotFound(L"abcdeabcdf", L"abcdg"); // Should not find "abcdg"
    ExpectNotFound(L"xyzxyzx", L"xyzb");
}

/**
 * @tc.name      : Wcswcs0700
 * @tc.desc      : test wcswcs with case sensitivity and character variations
 * @tc.level     : Level 1
 */
void Wcswcs0700(void)
{
    // Case sensitivity tests
    ExpectFoundAt(L"Hello World", L"World", 6);
    ExpectNotFound(L"Hello WORLD", L"World");

    // Special character variants
    ExpectFoundAt(L"café au lait", L"é", 3);
    ExpectFoundAt(L"naïve approach", L"ï", 2);
    ExpectFoundAt(L"über", L"ü", 0);
}

/**
 * @tc.name      : Wcswcs0800
 * @tc.desc      : test wcswcs performance with partial matches and near misses
 * @tc.level     : Level 2
 */
void Wcswcs0800(void)
{
    // Partial match tests
    ExpectFoundAt(L"abcdefghijklmnopqrstuvwxyz", L"xyz", 23);
    ExpectFoundAt(L"abcdeffghijkl", L"ffg", 5);
    ExpectFoundAt(L"abracadabra", L"dab", 6);

    // Close but not exact matches
    ExpectNotFound(L"abcdefgh", L"abcdeg");
    ExpectNotFound(L"hello world", L"worlds");
    ExpectNotFound(L"programming", L"programmer");

    // Pattern longer than the string
    ExpectNotFound(L"short", L"this pattern is much longer than the string");
}

static int WcswcsTestImpl(int argc, char* argv[])
{
    Wcswcs0100();
    Wcswcs0200();
    Wcswcs0300();
    Wcswcs0400();
    Wcswcs0500();
    Wcswcs0600();
    Wcswcs0700();
    Wcswcs0800();
    return T_STATUS;
}

int WcswcsTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return WcswcsTestImpl(1, libcArgv);
}
