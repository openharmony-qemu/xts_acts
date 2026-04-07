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

// fgets must not modify the buffer on eof
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "libc_test_shim.h"
#define ASSERT(st, c)                                \
    do {                                             \
        if (!(c))                                    \
            LibcTestError(&(st), "%s failed\n", #c); \
    } while (0)

int FgetsEofTest()
{
    int status = SUCCESS_CODE;

    char buf[] = "test";
    char s[10];
    FILE* f;

    ASSERT(status, (f = fmemopen(buf, sizeof buf, "r")) != nullptr);
    ASSERT(status, fgets(s, sizeof s, f) == s);
    ASSERT(status, strcmp(s, buf) == 0);
    ASSERT(status, fgets(s, sizeof s, f) == nullptr);
    if (s[0] != 't') {
        LibcTestError(&status, "fgets modified the buffer after eof\n");
    }
    return status;
}
