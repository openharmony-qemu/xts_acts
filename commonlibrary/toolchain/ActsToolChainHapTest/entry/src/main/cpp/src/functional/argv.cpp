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

#include <climits>
#include <cstdio>
#include "test.h"

#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))

static int ArgvTestWithArgs(int argc, char** argv)
{
    char buf[PATH_MAX];
    TEST(argc == 1, "argc should be 1\n");
    TEST(argv[0] != nullptr, "argv[0] should not be nullptr\n");
    TEST(argv[1] == nullptr, "argv[1] should be nullptr\n");
    TEST(argv[0][0] != 0, "argv[0] should not be empty\n");
    TEST(snprintf(buf, sizeof buf, "%s", argv[0]) < sizeof buf,
         "argv[0] is not a valid PATH\n"); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    return T_STATUS;
}

int ArgvTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ArgvTestWithArgs(1, libcArgvStub);
}
