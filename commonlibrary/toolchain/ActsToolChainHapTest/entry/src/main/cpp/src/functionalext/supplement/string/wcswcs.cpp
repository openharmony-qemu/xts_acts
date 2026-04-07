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

#define N(s, sub)                                                                  \
    {                                                                              \
        wchar_t* p = s;                                                            \
        wchar_t* q = wcswcs(p, sub);                                               \
        if (q)                                                                     \
            t_error("wcswcs(%s,%s) returned str+%d, wanted 0\n", #s, #sub, q - p); \
    }

#define t(s, sub, n)                                                                         \
    {                                                                                        \
        wchar_t* p = s;                                                                      \
        wchar_t* q = wcswcs(p, sub);                                                         \
        if (q == 0)                                                                          \
            t_error("wcswcs(%s,%s) returned 0, wanted str+%d\n", #s, #sub, (n));             \
        else if (q - p != (n))                                                               \
            t_error("wcswcs(%s,%s) returned str+%d, wanted str+%d\n", #s, #sub, q - p, (n)); \
    }

/**
 * @tc.name      : Wcswcs0100
 * @tc.desc      : test the wcswcs method to find the first occurrence of the second wide string from the first wide
 *                 string
 * @tc.level     : Level 0
 */
void Wcswcs0100(void)
{
    t(L"", L"", 0) t(L"abcd", L"", 0) t(L"abcd", L"a", 0) t(L"abcd", L"b", 1) t(L"abcd", L"c", 2) t(L"abcd", L"d", 3)
        t(L"abcd", L"ab", 0) t(L"abcd", L"bc", 1) t(L"abcd", L"cd", 2) t(L"ababa", L"baba", 1) t(L"ababab", L"babab", 1)
            t(L"abababa", L"bababa", 1) t(L"abababab", L"bababab", 1) t(L"ababababa", L"babababa", 1)
                t(L"abbababab", L"bababa", 2) t(L"abbababab", L"ababab", 3) t(L"abacabcabcab", L"abcabcab", 4)
                    t(L"nanabanabanana", L"aba", 3) t(L"nanabanabanana", L"ban", 4) t(L"nanabanabanana", L"anab", 1)
                        t(L"nanabanabanana", L"banana", 8) t(L"_ _\xff_ _", L"_\xff_", 2)
}

/**
 * @tc.name      : Wcswcs0200
 * @tc.desc      : test the result of the wcswcs method when the second substring cannot be found from the first
 * substring
 * @tc.level     : Level 1
 */
void Wcswcs0200(void)
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
}

/**
 * @tc.name      : Wcswcs0300
 * @tc.desc      : test wcswcs with overlapping patterns and edge cases
 * @tc.level     : Level 1
 */
void Wcswcs0300(void)
{
    // Overlapping pattern tests
    t(L"aaaabaaaa", L"aaa", 0) t(L"mississippi", L"issi", 1) t(L"abcabcabc", L"abcabc", 0)
        t(L"ababababab", L"ababab", 0)

        // Edge cases
        t(L"x", L"x", 0) t(L"xy", L"xy", 0) t(L"xyz", L"yz", 1) t(L"a\0b", L"a", 0) // String containing null character
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

    t(longStr, L"abc", 0) t(longStr, L"bca", 1) t(longStr, L"abcabc", 0)

    // test long pattern
    {
        const wchar_t lit[] = L"abcabcabcabc";
        size_t j = 0;
        for (; lit[j] != L'\0' && j + 1 < static_cast<size_t>(K_PATTERN_BUF_ELEMS); ++j) {
            pattern[j] = lit[j];
        }
        pattern[j] = L'\0';
    }
    t(longStr, pattern, 0)
}

/**
 * @tc.name      : Wcswcs0500
 * @tc.desc      : test wcswcs with whitespace characters and control characters
 * @tc.level     : Level 1
 */
void Wcswcs0500(void)
{
    // Whitespace character tests
    t(L"hello world", L" ", 5) t(L"tab\ttab", L"\t", 3) t(L"new\nline", L"\n", 3) t(L"carriage\rreturn", L"\r", 8)

        // Mixed whitespace characters
        t(L"a b c d", L" c ", 3) t(L"test\t\n\rstring", L"\t\n\r", 4)
}

/**
 * @tc.name      : Wcswcs0600
 * @tc.desc      : test wcswcs with repeated characters and patterns
 * @tc.level     : Level 0
 */
void Wcswcs0600(void)
{
    // Repeated character tests
    t(L"aaaaaaaaaa", L"aaa", 0) t(L"aaaaaaaaaa", L"aaaaa", 0) t(L"ababababab", L"abab", 0) t(L"abcabcabc", L"bcab", 1)

        // Partial matches that ultimately fail
        N(L"abcdeabcdf", L"abcdg") // Should not find "abcdg"
        N(L"xyzxyzx", L"xyzb")
}

/**
 * @tc.name      : Wcswcs0700
 * @tc.desc      : test wcswcs with case sensitivity and character variations
 * @tc.level     : Level 1
 */
void Wcswcs0700(void)
{
    // Case sensitivity tests
    t(L"Hello World", L"World", 6) N(L"Hello WORLD", L"World")

        // Special character variants
        t(L"café au lait", L"é", 3) t(L"naïve approach", L"ï", 2) t(L"über", L"ü", 0)
}

/**
 * @tc.name      : Wcswcs0800
 * @tc.desc      : test wcswcs performance with partial matches and near misses
 * @tc.level     : Level 2
 */
void Wcswcs0800(void)
{
    // Partial match tests
    t(L"abcdefghijklmnopqrstuvwxyz", L"xyz", 23) t(L"abcdeffghijkl", L"ffg", 5) t(L"abracadabra", L"dab", 6)

        // Close but not exact matches
        N(L"abcdefgh", L"abcdeg") N(L"hello world", L"worlds") N(L"programming", L"programmer")

        // Pattern longer than the string
        N(L"short", L"this pattern is much longer than the string")
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
