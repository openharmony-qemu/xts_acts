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
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <search.h>
#include "test.h"

namespace {
constexpr size_t K_HSEARCH_BUCKET_COUNT = 13U;
} // namespace

#define set(out_e, k, v)                                                                                             \
    do {                                                                                                             \
        (out_e) = hsearch((ENTRY){ .key = (k), .data = reinterpret_cast<void*>(static_cast<uintptr_t>(v)) }, ENTER); \
        if (!(out_e) || strcmp((out_e)->key, (k)) != 0)                                                              \
            t_error("hsearch ENTER %s %d failed\n", (k), (v));                                                       \
    } while (0)

#define get(k) hsearch((ENTRY){ .key = (k), .data = nullptr }, FIND)

#define getdata(e) reinterpret_cast<intptr_t>((e)->data)

static int SearchHsearchTestImpl()
{
    ENTRY* e;

    if (hcreate(-1) || errno != ENOMEM) {
        t_error("hcreate((size_t)-1) should fail with ENOMEM got %s\n", strerror(errno));
    }
    if (!hcreate(K_HSEARCH_BUCKET_COUNT)) {
        t_error("hcreate(13) failed\n");
    }
    set(e, "", 0);
    set(e, "a", 1);
    set(e, "b", 2);
    set(e, "abc", 3);
    set(e, "cd", 4);
    set(e, "e", 5);
    set(e, "ef", 6);
    set(e, "g", 7);
    set(e, "h", 8);
    set(e, "iiiiiiiiii", 9);
    if (!get("a")) {
        t_error("hsearch FIND a failed\n");
    }
    if (get("c")) {
        t_error("hsearch FIND c should fail\n");
    }
    set(e, "g", 10);
    if (e && getdata(e) != 7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", getdata(e));
    }
    set(e, "g", 10);
    if (e && getdata(e) != 7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", getdata(e));
    }
    set(e, "j", 10);
    if (e && getdata(e) != 10) {
        t_error("hsearch ENTER j 10 returned data %d, wanted 10\n", getdata(e));
    }
    hdestroy();
    return T_STATUS;
}

int SearchHsearchTest(void)
{
    return SearchHsearchTestImpl();
}
