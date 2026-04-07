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

#include <cstddef>
#include <cstring>
#include "libc_test_shim.h"

namespace {
constexpr int K_STRCSPN_ALPHABET_SIZE = 128;
constexpr int K_STRCSPN_FULL_BYTE_LEN = 256;
constexpr int K_ASCII_LOW7_MASK = 127;
} // namespace

#define t_strcspn(st, s, c, n)                                         \
    do {                                                               \
        char* p = s;                                                   \
        char* q = c;                                                   \
        size_t r = strcspn(p, q);                                      \
        if (r != (n)) {                                                \
            LibcTestError(&(st),                                       \
                          "strcspn(%s,%s) returned %lu, wanted %lu\n", \
                          #s,                                          \
                          #c,                                          \
                          static_cast<unsigned long>(r),               \
                          static_cast<unsigned long>(n));              \
        }                                                              \
    } while (0)

int StringStrcspnTest()
{
    int status = SUCCESS_CODE;

    int i;
    char a[K_STRCSPN_ALPHABET_SIZE];
    char s[K_STRCSPN_FULL_BYTE_LEN];

    for (i = 0; i < K_STRCSPN_ALPHABET_SIZE; i++) {
        a[i] = (i + 1) & K_ASCII_LOW7_MASK;
    }
    for (i = 0; i < K_STRCSPN_FULL_BYTE_LEN; i++) {
        *(reinterpret_cast<unsigned char*>(s) + i) = static_cast<unsigned char>(i + 1);
    }

    t_strcspn(status, "", "", 0);
    t_strcspn(status, "a", "", 1);
    t_strcspn(status, "", "a", 0);
    t_strcspn(status, "abc", "cde", 2);
    t_strcspn(status, "abc", "ccc", 2);
    t_strcspn(status, "abc", a, 0);
    t_strcspn(status, "\xff\x80 abc", a, 2);
    t_strcspn(status, s, "\xff", 254);

    return status;
}
