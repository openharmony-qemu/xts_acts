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
constexpr size_t K_HCREATE_INVALID_SIZE = static_cast<size_t>(-1);
constexpr size_t K_HSEARCH_BUCKET_COUNT = 13U;
constexpr int kHsearchVal0 = 0;
constexpr int kHsearchVal1 = 1;
constexpr int kHsearchVal2 = 2;
constexpr int kHsearchVal3 = 3;
constexpr int kHsearchVal4 = 4;
constexpr int kHsearchVal5 = 5;
constexpr int kHsearchVal6 = 6;
constexpr int kHsearchVal7 = 7;
constexpr int kHsearchVal8 = 8;
constexpr int kHsearchVal9 = 9;
constexpr int kHsearchVal10 = 10;
constexpr intptr_t kHsearchWant7 = 7;
constexpr intptr_t kHsearchWant10 = 10;
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

    if (hcreate(K_HCREATE_INVALID_SIZE) || errno != ENOMEM) {
        t_error("hcreate((size_t)-1) should fail with ENOMEM got %s\n", strerror(errno));
    }
    if (!hcreate(K_HSEARCH_BUCKET_COUNT)) {
        t_error("hcreate(%zu) failed\n", K_HSEARCH_BUCKET_COUNT);
    }
    e = HsearchSet("", kHsearchVal0);
    e = HsearchSet("a", kHsearchVal1);
    e = HsearchSet("b", kHsearchVal2);
    e = HsearchSet("abc", kHsearchVal3);
    e = HsearchSet("cd", kHsearchVal4);
    e = HsearchSet("e", kHsearchVal5);
    e = HsearchSet("ef", kHsearchVal6);
    e = HsearchSet("g", kHsearchVal7);
    e = HsearchSet("h", kHsearchVal8);
    e = HsearchSet("iiiiiiiiii", kHsearchVal9);
    if (!HsearchGet("a")) {
        t_error("hsearch FIND a failed\n");
    }
    if (HsearchGet("c")) {
        t_error("hsearch FIND c should fail\n");
    }
    e = HsearchSet("g", kHsearchVal10);
    if (e && HsearchData(e) != kHsearchWant7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", HsearchData(e));
    }
    e = HsearchSet("g", kHsearchVal10);
    if (e && HsearchData(e) != kHsearchWant7) {
        t_error("hsearch ENTER g 10 returned data %d, wanted 7\n", HsearchData(e));
    }
    e = HsearchSet("j", kHsearchVal10);
    if (e && HsearchData(e) != kHsearchWant10) {
        t_error("hsearch ENTER j 10 returned data %d, wanted 10\n", HsearchData(e));
    }
    hdestroy();
    return T_STATUS;
}

int SearchHsearchTest(void)
{
    return SearchHsearchTestImpl();
}
