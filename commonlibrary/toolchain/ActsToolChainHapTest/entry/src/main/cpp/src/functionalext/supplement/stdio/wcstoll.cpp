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

static const char* WCSTOLL_TEST_MSG = "";

#define TEST(r, f, x, m)                                            \
    do {                                                            \
        errno = 0;                                                  \
        WCSTOLL_TEST_MSG = #f;                                      \
        (r) = (f);                                                  \
        if ((r) != (x)) {                                           \
            t_error("%s failed (" m ")\n", WCSTOLL_TEST_MSG, r, x); \
        }                                                           \
    } while (0)

#define TEST2(r, f, x, m)                                           \
    do {                                                            \
        (r) = (f);                                                  \
        if ((r) != (x)) {                                           \
            t_error("%s failed (" m ")\n", WCSTOLL_TEST_MSG, r, x); \
        }                                                           \
    } while (0)

/**
 * @tc.name      : Wcstoll0100
 * @tc.desc      : Convert wide string "2147483647" to long long type
 * @tc.level     : Level 0
 */
void Wcstoll0100(void)
{
    long long ll;
    TEST(ll, wcstoll(L"2147483647", nullptr, 0), 2147483647LL, "expect signed %lld != %lld");
}

/**
 * @tc.name      : Wcstoll0200
 * @tc.desc      : Convert wide string "10" to long long type
 * @tc.level     : Level 0
 */
void Wcstoll0200(void)
{
    long long ll;
    TEST(ll, wcstoll(L"10", nullptr, 0), 10LL, "expect signed %lld != %lld");
}

/**
 * @tc.name      : Wcstoll0300
 * @tc.desc      : Convert wide string "z" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0300(void)
{
    long long ll;
    TEST(ll, wcstoll(L"z", nullptr, 36), 35LL, "%lld != %lld");
}

/**
 * @tc.name      : Wcstoll0400
 * @tc.desc      : Convert wide string "00010010001101000101011001111000" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0400(void)
{
    long long ll;
    TEST(ll, wcstoll(L"00010010001101000101011001111000", nullptr, 2), 0x12345678, "%lld != %lld");
}

/**
 * @tc.name      : Wcstoll0500
 * @tc.desc      : Convert wide string "0xz" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0500(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"0xz";
    TEST(ll, wcstoll(s, &c, 16), 0, "%lld != %lld");
    TEST2(i, c - s, 1, "wrong final position %lld != %lld");
}

/**
 * @tc.name      : Wcstoll0600
 * @tc.desc      : Convert wide string "0x1234" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0600(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"0x1234";
    TEST(ll, wcstoll(s, &c, 16), 0x1234, "%lld != %ld");
    TEST2(i, c - s, 6, "wrong final position %lld != %lld");
}

/**
 * @tc.name      : Wcstoll0700
 * @tc.desc      : Convert wide string "9223372036854775808" to long long type exceeds the maximum value of the type
 * @tc.level     : Level 2
 */
void Wcstoll0700(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"9223372036854775808";
    TEST(ll, wcstoll(s, &c, 0), 9223372036854775807LL, "uncaught overflow %lld != %lld");
    TEST2(i, c - s, 19, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
}

/**
 * @tc.name      : Wcstoll0800
 * @tc.desc      : Convert wide string "-9223372036854775809" to long long type exceeds the maximum value of the type
 * @tc.level     : Level 2
 */
void Wcstoll0800(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"-9223372036854775809";
    TEST(ll, wcstoll(s, &c, 0), -9223372036854775807LL - 1, "overflow %lld != %lld");
    TEST2(i, c - s, 20, "wrong final position %d != %d");
    TEST2(i, errno, ERANGE, "missing errno %d != %d");
}

static int WcstollTestImpl(int argc, char* argv[])
{
    Wcstoll0100();
    Wcstoll0200();
    Wcstoll0300();
    Wcstoll0400();
    Wcstoll0500();
    Wcstoll0600();
    Wcstoll0700();
    Wcstoll0800();
    return T_STATUS;
}

int WcstollTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstollTestImpl(1, libcArgvStub);
}
