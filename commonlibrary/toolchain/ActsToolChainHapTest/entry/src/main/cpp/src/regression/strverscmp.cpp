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

// leading zero handling according to the manual
#include "Strverscmp.h"
#include <cstring>
#include "libc_test_shim.h"
#define ASSERT(st, x)                             \
    do {                                          \
        if (!(x)) {                               \
            LibcTestError(&(st), #x " failed\n"); \
        }                                         \
    } while (0)

int StrverscmpTest()
{
    int status = SUCCESS_CODE;

    ASSERT(status, Strverscmp("", "") == 0);
    ASSERT(status, Strverscmp("a", "a") == 0);
    ASSERT(status, Strverscmp("a", "b") < 0);
    ASSERT(status, Strverscmp("b", "a") > 0);
    ASSERT(status, Strverscmp("000", "00") < 0);
    ASSERT(status, Strverscmp("00", "000") > 0);
    ASSERT(status, Strverscmp("a0", "a") > 0);
    ASSERT(status, Strverscmp("00", "01") < 0);
    ASSERT(status, Strverscmp("01", "010") < 0);
    ASSERT(status, Strverscmp("010", "09") < 0);
    ASSERT(status, Strverscmp("09", "0") < 0);
    ASSERT(status, Strverscmp("9", "10") < 0);
    ASSERT(status, Strverscmp("0a", "0") > 0);
    ASSERT(status, Strverscmp("foobar-1.1.2", "foobar-1.1.3") < 0);
    ASSERT(status, Strverscmp("foobar-1.1.2", "foobar-1.01.3") > 0);
    return status;
}
