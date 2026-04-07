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
#include <cwchar>
#include "test.h"

namespace {
constexpr size_t K_SIZEOF_LONG32 = 4U;
constexpr size_t K_SIZEOF_LONG64 = 8U;
} // namespace

static const char* WCSTOL_TEST_MSG = "";

#define TEST(r, f, x, m)                                           \
    do {                                                           \
        errno = 0;                                                 \
        WCSTOL_TEST_MSG = #f;                                      \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", WCSTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

#define TEST2(r, f, x, m)                                          \
    do {                                                           \
        (r) = (f);                                                 \
        if ((r) != (x)) {                                          \
            t_error("%s failed (" m ")\n", WCSTOL_TEST_MSG, r, x); \
        }                                                          \
    } while (0)

static void WcstolTestLongAs32Bits(int& i, long& l, unsigned long& ul, wchar_t*& s, wchar_t*& c)
{
    TEST(l, wcstol(s = L"2147483648", &c, 0), 2147483647L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l, wcstol(s = L"-2147483649", &c, 0), -2147483647L - 1, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 11, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, wcstoul(s = L"4294967296", &c, 0), 4294967295UL, "uncaught overflow %lu != %lu");
    TEST2(i, c - s, 10, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, wcstoul(s = L"-1", &c, 0), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2", &c, 0), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2147483648", &c, 0), -2147483648UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 11, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2147483649", &c, 0), -2147483649UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 11, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
}

static void WcstolTestLongAs64Bits(int& i, long& l, unsigned long& ul, wchar_t*& s, wchar_t*& c)
{
    TEST(l, wcstol(s = L"9223372036854775808", &c, 0), 9223372036854775807L, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 19, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(l, wcstol(s = L"-9223372036854775809", &c, 0), -9223372036854775807L - 1, "uncaught overflow %ld != %ld");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, wcstoul(s = L"18446744073709551616", &c, 0), 18446744073709551615UL, "uncaught overflow %lu != %lu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
    TEST(ul, wcstoul(s = L"-1", &c, 0), -1UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-2", &c, 0), -2UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-9223372036854775808", &c, 0), -9223372036854775808UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
    TEST(ul, wcstoul(s = L"-9223372036854775809", &c, 0), -9223372036854775809UL, "rejected negative %lu != %lu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
}

static void WcstolTestLongWidthCases(int& i, long& l, unsigned long& ul, wchar_t*& s, wchar_t*& c)
{
    if (sizeof(long) == K_SIZEOF_LONG32) {
        WcstolTestLongAs32Bits(i, l, ul, s, c);
    } else if (sizeof(long) == K_SIZEOF_LONG64) {
        WcstolTestLongAs64Bits(i, l, ul, s, c);
    } else {
        t_error("sizeof(long) == %d, not implemented\n", static_cast<int>(sizeof(long)));
    }
}

static void WcstolTestRadixEtcCases(int& i, long& l, wchar_t*& s, wchar_t*& c)
{
    TEST(l, wcstol(L"z", nullptr, 36), 35, "%ld != %ld");
    TEST(l, wcstol(L"00010010001101000101011001111000", nullptr, 2), 0x12345678, "%ld != %ld");

    TEST(l, wcstol(s = L"0xz", &c, 16), 0, "%ld != %ld");
    TEST2(i, c - s, 1, "wrong final position %ld != %ld");

    TEST(l, wcstol(s = L"0x1234", &c, 16), 0x1234, "%ld != %ld");
    TEST2(i, c - s, 6, "wrong final position %ld != %ld");

    c = nullptr;
    TEST(l, wcstol(s = L"123", &c, 37), 0, "%ld != %ld");
    TEST2(i, c - s, 0, "wrong final position %d != %d");
    TEST2(i, errno, EINVAL, "%d != %d");
}

static int WcstolTestImpl(void)
{
    int i;
    long l;
    unsigned long ul;
    wchar_t *s, *c;

    TEST(l, wcstol(L"2147483647", nullptr, 0), 2147483647L, "max 32bit signed %ld != %ld");
    TEST(ul, wcstoul(L"4294967295", nullptr, 0), 4294967295UL, "max 32bit unsigned %lu != %lu");

    WcstolTestLongWidthCases(i, l, ul, s, c);
    WcstolTestRadixEtcCases(i, l, s, c);
    return T_STATUS;
}

int WcstolTest(void)
{
    return WcstolTestImpl();
}
