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

#include <cerrno>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

static const char* WCSTOULL_TEST_MSG = "";

#define TEST(r, f, x, m)                                             \
    do {                                                             \
        errno = 0;                                                   \
        WCSTOULL_TEST_MSG = #f;                                      \
        (r) = (f);                                                   \
        if ((r) != (x)) {                                            \
            t_error("%s failed (" m ")\n", WCSTOULL_TEST_MSG, r, x); \
        }                                                            \
    } while (0)

#define TEST2(r, f, x, m)                                            \
    do {                                                             \
        (r) = (f);                                                   \
        if ((r) != (x)) {                                            \
            t_error("%s failed (" m ")\n", WCSTOULL_TEST_MSG, r, x); \
        }                                                            \
    } while (0)

/**
 * @tc.name      : Wcstoull0100
 * @tc.desc      : Convert wide string to unsigned long long type based on decimal
 * @tc.level     : Level 0
 */
void Wcstoull0100(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"250068492";
    TEST(ull, wcstoull(s, &c, 10), 250068492ULL, "expect unsigned %llu != %llu");
}

/**
 * @tc.name      : Wcstoull0200
 * @tc.desc      : Convert wide string to unsigned long long type based on hexadecimal
 * @tc.level     : Level 1
 */
void Wcstoull0200(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"7b06af00";
    TEST(ull, wcstoull(s, &c, 16), 2064035584ULL, "expect unsigned %llu != %llu");
}

/**
 * @tc.name      : Wcstoull0300
 * @tc.desc      : Convert wide string to unsigned long long type based on binary
 * @tc.level     : Level 1
 */
void Wcstoull0300(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"1100011011110101010001100000";
    TEST(ull, wcstoull(s, &c, 2), 208622688ULL, "expect unsigned %llu != %llu");
}

/**
 * @tc.name      : Wcstoull0400
 * @tc.desc      : Convert wide string to unsigned long long type based on parameter 'base' equal to 0
 * @tc.level     : Level 1
 */
void Wcstoull0400(void)
{
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"0x6fffff";
    TEST(ull, wcstoull(s, &c, 0), 7340031ULL, "expect unsigned %llu != %llu");
}

/**
 * @tc.name      : Wcstoull0500
 * @tc.desc      : Convert wide string to unsigned long long type exceeds the maximum value of the type
 * @tc.level     : Level 2
 */
void Wcstoull0500(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"18446744073709551616";
    TEST(ull, wcstoull(s, &c, 0), 18446744073709551615ULL, "uncaught overflow %llu != %llu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
}

/**
 * @tc.name      : Wcstoull0600
 * @tc.desc      : The converted result value -1 is invalid
 * @tc.level     : Level 2
 */
void Wcstoull0600(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"-1";
    TEST(ull, wcstoull(s, &c, 0), -1ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
}

/**
 * @tc.name      : Wcstoull0700
 * @tc.desc      : The converted result value -2 is invalid
 * @tc.level     : Level 2
 */
void Wcstoull0700(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"-2";
    TEST(ull, wcstoull(s, &c, 0), -2ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, 2, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
}

/**
 * @tc.name      : Wcstoull0800
 * @tc.desc      : The converted result value -9223372036854775808 is invalid
 * @tc.level     : Level 2
 */
void Wcstoull0800(void)
{
    int i;
    unsigned long long ull;
    wchar_t* s;
    wchar_t* c;
    s = L"-9223372036854775808";
    TEST(ull, wcstoull(s, &c, 0), -9223372036854775808ULL, "rejected negative %llu != %llu");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, 0, "spurious errno %d != %d");
}

static int WcstoullTestImpl(int argc, char* argv[])
{
    Wcstoull0100();
    Wcstoull0200();
    Wcstoull0300();
    Wcstoull0400();
    Wcstoull0500();
    Wcstoull0600();
    Wcstoull0700();
    Wcstoull0800();
    return T_STATUS;
}

int WcstoullTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstoullTestImpl(1, libcArgvStub);
}
