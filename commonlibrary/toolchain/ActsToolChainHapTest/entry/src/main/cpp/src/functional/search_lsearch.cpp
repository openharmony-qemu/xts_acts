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

#include <cstring>
#include <search.h>
#include "libc_test_shim.h"
#define W 80
static char g_tab[100][W];
static size_t g_nel;

static int LsearchStrcmp(const void* a, const void* b)
{
    return strcmp(static_cast<const char*>(a), static_cast<const char*>(b));
}

#define set(st, k)                                                                 \
    do {                                                                           \
        char* r = static_cast<char*>(lsearch(k, g_tab, &g_nel, W, LsearchStrcmp)); \
        if (strcmp(r, k) != 0)                                                     \
            LibcTestError(&(st), "lsearch %s failed\n", #k);                       \
    } while (0)

#define get(k) lfind(k, g_tab, &g_nel, W, LsearchStrcmp)

int SearchLsearchTest()
{
    int status = SUCCESS_CODE;

    size_t n;

    set(status, "");
    set(status, "a");
    set(status, "b");
    set(status, "abc");
    set(status, "cd");
    set(status, "e");
    set(status, "ef");
    set(status, "g");
    set(status, "h");
    set(status, "iiiiiiiiii");
    if (!get("a")) {
        LibcTestError(&status, "lfind a failed\n");
    }
    if (get("c")) {
        LibcTestError(&status, "lfind c should fail\n");
    }
    n = g_nel;
    set(status, "g");
    if (g_nel != n) {
        LibcTestError(&status, "lsearch g should not modify the table size (%d, was %d)\n", g_nel, n);
    }
    n = g_nel;
    set(status, "j");
    if (g_nel != n + 1) {
        LibcTestError(&status, "lsearch j should increase the table size (%d, was %d)\n", g_nel, n);
    }
    return status;
}
