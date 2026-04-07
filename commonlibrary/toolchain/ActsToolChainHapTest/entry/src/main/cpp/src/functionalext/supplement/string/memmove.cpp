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
#include "test.h"

namespace {
constexpr size_t K_ABCDEFGH_WITH_NUL = 9U;
constexpr size_t K_HELLO_WORLD_WITH_NUL = 11U;
constexpr size_t K_OVERLAP_FORWARD_LEN = 7U;
constexpr size_t K_OVERLAP_REVERSE_LEN = 9U;
} // namespace

char g_one[50];
char g_two[50];

/**
 * @tc.name      : Memmove0100
 * @tc.desc      : The source address and the destination address are equal, and no copying is performed.
 * @tc.level     : Level 1
 */
void Memmove0100(void)
{
    memset(g_one, 0, sizeof(g_one)); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */

    (void)snprintf(g_one, sizeof(g_one), "%s", "abcdefgh"); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    memmove(g_one, g_one, K_ABCDEFGH_WITH_NUL); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    if (strcmp(g_one, "abcdefgh")) {
        t_error("%s memmove failed\n", __func__);
    }
}

/**
 * @tc.name      : Memmove0200
 * @tc.desc      : The source address and the destination address do not overlap, copy it.
 * @tc.level     : Level 0
 */
void Memmove0200(void)
{
    memset(g_one, 0, sizeof(g_one)); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    memset(g_two, 0, sizeof(g_two)); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */

    (void)snprintf(g_one, sizeof(g_one), "%s", "helloWorld"); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    (void)snprintf(g_two, sizeof(g_two), "%s", "foo"); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    memmove(g_two, g_one, K_HELLO_WORLD_WITH_NUL); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    if (strcmp(g_one, "helloWorld")) {
        t_error("%s memmove failed\n", __func__);
    }
    if (strcmp(g_two, "helloWorld")) {
        t_error("%s memmove failed\n", __func__);
    }
}

/**
 * @tc.name      : Memmove0300
 * @tc.desc      : The first address of dest is less than the first address of src, and forward copy is performed.
 * @tc.level     : Level 1
 */
void Memmove0300(void)
{
    memset(g_one, 0, sizeof(g_one)); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */

    (void)snprintf(g_one, sizeof(g_one), "%s", "abcdefgh"); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    memmove(g_one + 1, g_one + 2, K_OVERLAP_FORWARD_LEN); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    if (strcmp(g_one, "acdefgh")) {
        t_error("%s memmove failed\n", __func__);
    }
}

/**
 * @tc.name      : Memmove0400
 * @tc.desc      : The first address of dest is greater than the first address of src, and reverse copy is performed.
 * @tc.level     : Level 1
 */
void Memmove0400(void)
{
    memset(g_one, 0, sizeof(g_one)); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */

    (void)snprintf(g_one, sizeof(g_one), "%s", "abcdefgh"); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    memmove(g_one + 1, g_one, K_OVERLAP_REVERSE_LEN); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    if (strcmp(g_one, "aabcdefgh")) {
        t_error("%s memmove failed\n", __func__);
    }
}

static int MemmoveTestImpl(int argc, char* argv[])
{
    Memmove0100();
    Memmove0200();
    Memmove0300();
    Memmove0400();

    return T_STATUS;
}

int MemmoveTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return MemmoveTestImpl(1, libcArgvStub);
}
