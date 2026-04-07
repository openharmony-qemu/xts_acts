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

#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "test.h"

namespace {
constexpr size_t K_SIZEOF_LONG32 = 4U;
constexpr size_t K_SIZEOF_LONG64 = 8U;
} // namespace

static const char* STRTOL_TEST_MSG = "";

/* r = place to store result
 * f = function call to test (or any expression)
 * x = expected result
 * m = message to print on failure (with formats for r & x)
 **/

#define TEST(r, f, x, m)                                           \
    do {                                                           \
        errno = 0;                                                 \
        STRTOL_TEST_MSG = #f;                                      \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", STRTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

#define TEST2(r, f, x, m)                                          \
    do {                                                           \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", STRTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

static void StrtolTestLongAs32Bits(int& i, long& l, unsigned long& ul, char*& s, char*& c)
{
    TEST(l, strtol(s = "2147483648", &c, 0), 2147483647L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l, strtol(s = "-2147483649", &c, 0), -2147483647L - 1, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 11, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, strtoul(s = "4294967296", &c, 0), 4294967295UL, "uncaught overflow %lu != %lu");
    TEST2(i, c - s, 10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, strtoul(s = "-1", &c, 0), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2", &c, 0), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2147483648", &c, 0), -2147483648UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 11, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2147483649", &c, 0), -2147483649UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 11, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-4294967296", &c, 0), 4294967295UL, "uncaught negative overflow %lu != %lu");
    TEST2(i, c - s, 11, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "spurious errno %d != %d");
}

static void StrtolTestLongAs64Bits(int& i, long& l, unsigned long& ul, char*& s, char*& c)
{
    TEST(l, strtol(s = "9223372036854775808", &c, 0), 9223372036854775807L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 19, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l, strtol(s = "-9223372036854775809", &c, 0), -9223372036854775807L - 1, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, strtoul(s = "18446744073709551616", &c, 0), 18446744073709551615UL, "uncaught overflow %lu != %lu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, strtoul(s = "-1", &c, 0), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-2", &c, 0), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-9223372036854775808", &c, 0), -9223372036854775808UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, strtoul(s = "-9223372036854775809", &c, 0), -9223372036854775809UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul,
         strtoul(s = "-18446744073709551616", &c, 0),
         18446744073709551615UL,
         "uncaught negative overflow %lu != %lu");
    TEST2(i, c - s, 21, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "spurious errno %d != %d");
}

static void StrtolTestLongWidthCases(int& i, long& l, unsigned long& ul, char*& s, char*& c)
{
    if (sizeof(long) == K_SIZEOF_LONG32) {
        StrtolTestLongAs32Bits(i, l, ul, s, c);
    } else if (sizeof(long) == K_SIZEOF_LONG64) {
        StrtolTestLongAs64Bits(i, l, ul, s, c);
    } else {
        t_error("sizeof(long) == %d, not implemented\n", static_cast<int>(sizeof(long)));
    }
}

static void StrtolTestLongLongAs64Bits(int& i, long long& ll, unsigned long long& ull, char*& s, char*& c)
{
    TEST(ll, strtoll(s = "9223372036854775808", &c, 0), 9223372036854775807LL, "uncaught overflow %lld != %lld");
    TEST2(i, c - s, 19, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ll, strtoll(s = "-9223372036854775809", &c, 0), -9223372036854775807LL - 1, "uncaught overflow %lld != %lld");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ull, strtoull(s = "18446744073709551616", &c, 0), 18446744073709551615ULL, "uncaught overflow %llu != %llu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ull, strtoull(s = "-1", &c, 0), -1ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ull, strtoull(s = "-2", &c, 0), -2ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ull, strtoull(s = "-9223372036854775808", &c, 0), -9223372036854775808ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ull, strtoull(s = "-9223372036854775809", &c, 0), -9223372036854775809ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ull,
         strtoull(s = "-18446744073709551616", &c, 0),
         18446744073709551615ULL,
         "uncaught negative overflow %llu != %llu");
    TEST2(i, c - s, 21, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "spurious errno %d != %d");
}

static void StrtolTestLongLongWidthCases(int& i, long long& ll, unsigned long long& ull, char*& s, char*& c)
{
    if (sizeof(long long) == K_SIZEOF_LONG64) {
        StrtolTestLongLongAs64Bits(i, ll, ull, s, c);
    } else {
        t_error("sizeof(long long) == %d, not implemented\n", static_cast<int>(sizeof(long long)));
    }
}

static void StrtolTestRadixEtcCases(int& i, long& l, char*& s, char*& c)
{
    TEST(l, strtol("z", nullptr, 36), 35, "%ld != %ld");
    TEST(l, strtol("00010010001101000101011001111000", nullptr, 2), 0x12345678, "%ld != %ld");
    TEST(l, strtol(s = "0F5F", &c, 16), 0x0f5f, "%ld != %ld");

    TEST(l, strtol(s = "0xz", &c, 16), 0, "%ld != %ld");
    TEST2(i, c - s, 1, "wrong final position %ld != %ld");

    TEST(l, strtol(s = "0x1234", &c, 16), 0x1234, "%ld != %ld");
    TEST2(i, c - s, 6, "wrong final position %ld != %ld");

    c = nullptr;
    TEST(l, strtol(s = "123", &c, 37), 0, "%ld != %ld");
    TEST2(i, c - s, 0, "wrong final position %d != %d");
    TEST2(i, errno, EINVAL, "%d != %d");

    TEST(l, strtol(s = "  15437", &c, 8), 015437, "%ld != %ld");
    TEST2(i, c - s, 7, "wrong final position %d != %d");

    TEST(l, strtol(s = "  1", &c, 0), 1, "%ld != %ld");
    TEST2(i, c - s, 3, "wrong final position %d != %d");
}

static int StrtolTestImpl(void)
{
    int i;
    long l;
    unsigned long ul;
    long long ll;
    unsigned long long ull;
    char *s, *c;

    TEST(l, atol("2147483647"), 2147483647L, "max 32bit signed %ld != %ld");
    TEST(l, strtol("2147483647", nullptr, 0), 2147483647L, "max 32bit signed %ld != %ld");
    TEST(ul, strtoul("4294967295", nullptr, 0), 4294967295UL, "max 32bit unsigned %lu != %lu");

    StrtolTestLongWidthCases(i, l, ul, s, c);
    StrtolTestLongLongWidthCases(i, ll, ull, s, c);
    StrtolTestRadixEtcCases(i, l, s, c);
    return T_STATUS;
}

int StrtolTest(void)
{
    return StrtolTestImpl();
}
