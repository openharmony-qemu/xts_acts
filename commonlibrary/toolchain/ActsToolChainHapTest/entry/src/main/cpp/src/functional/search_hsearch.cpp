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

static ENTRY* HsearchSet(const char* key, int value)
{
    ENTRY in = { .key = const_cast<char*>(key), .data = reinterpret_cast<void*>(static_cast<uintptr_t>(value)) };
    ENTRY* out = hsearch(in, ENTER);
    if (!out || strcmp(out->key, key) != 0) {
        t_error("hsearch ENTER %s %d failed\n", key, value);
    }
    return out;
}

static ENTRY* HsearchGet(const char* key)
{
    ENTRY in = { .key = const_cast<char*>(key), .data = nullptr };
    return hsearch(in, FIND);
}

static intptr_t HsearchData(const ENTRY* e)
{
    return reinterpret_cast<intptr_t>(e->data);
}

static int SearchHsearchTestImpl()
{
    ENTRY* e;

    if (hcreate(-1) || errno != ENOMEM) {
        t_error("hcreate((size_t)-1) should fail with ENOMEM got %s\n", strerror(errno));
    }
    if (!hcreate(K_HSEARCH_BUCKET_COUNT)) {
        t_error("hcreate(13) failed\n");
    }
    e = HsearchSet("", 0);
    e = HsearchSet("a", 1);
    e = HsearchSet("b", 2);
    e = HsearchSet("abc", 3);
    e = HsearchSet("cd", 4);
    e = HsearchSet("e", 5);
    e = HsearchSet("ef", 6);
    e = HsearchSet("g", 7);
    e = HsearchSet("h", 8);
    e = HsearchSet("iiiiiiiiii", 9);
    if (!HsearchGet("a")) {
        t_error("hsearch FIND a failed\n");
    }
    if (HsearchGet("c")) {
        t_error("hsearch FIND c should fail\n");
    }
    e = HsearchSet("g", 10);
    if (e && HsearchData(e) != 7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", HsearchData(e));
    }
    e = HsearchSet("g", 10);
    if (e && HsearchData(e) != 7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", HsearchData(e));
    }
    e = HsearchSet("j", 10);
    if (e && HsearchData(e) != 10) {
        t_error("hsearch ENTER j 10 returned data %d, wanted 10\n", HsearchData(e));
    }
    hdestroy();
    return T_STATUS;
}

int SearchHsearchTest(void)
{
    return SearchHsearchTestImpl();
}
