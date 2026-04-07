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

// zero compression for the last field in an ipv6 address is (probably) allowed
// https://tools.ietf.org/html/rfc4291#section-2.2
// but further fields shouldnt buffer overflow
#include <arpa/inet.h>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include "libc_test_shim.h"

namespace {
constexpr int K_IPV6_TXT_BUF_LEN = 50;
constexpr int K_IPV6_WORD_COUNT = 8;
constexpr int K_IPV6_COLON_FIELD_STRIDE = 5;
constexpr size_t K_IPV6_ADDR_BYTES = 16U;
constexpr int K_INET_PTON_SUCCESS = 1;
constexpr int K_INET_PTON_REJECT = 0;
constexpr int K_IPV6_BYTE_PAIR_SHIFT = 8;
constexpr int K_IPV6_PAIR_BYTE_STRIDE = 2;
} // namespace

static void Txt(char* s, unsigned char* buf)
{
    int i;
    (void)snprintf(s,
                   K_IPV6_TXT_BUF_LEN,
                   "%04x",
                   buf[0] << K_IPV6_BYTE_PAIR_SHIFT | buf[1]); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    for (i = 1; i < K_IPV6_WORD_COUNT; i++) {
        (void)snprintf(
            s + K_IPV6_COLON_FIELD_STRIDE * i,
            K_IPV6_TXT_BUF_LEN - K_IPV6_COLON_FIELD_STRIDE * static_cast<unsigned>(i),
            ":%04x",
            buf[K_IPV6_PAIR_BYTE_STRIDE * i] << K_IPV6_BYTE_PAIR_SHIFT |
                buf[K_IPV6_PAIR_BYTE_STRIDE * i + 1]); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    }
}

int InetPtonEmptyLastFieldTest()
{
    int status = SUCCESS_CODE;

    char s[K_IPV6_TXT_BUF_LEN], sw[K_IPV6_TXT_BUF_LEN];
    unsigned char buf[K_IPV6_ADDR_BYTES];
    unsigned char want[K_IPV6_ADDR_BYTES] = { 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 0 };
    char* addr;

    addr = "1:2:3:4:5:6:7::";
    if (inet_pton(AF_INET6, addr, buf) != K_INET_PTON_SUCCESS || memcmp(buf, want, K_IPV6_ADDR_BYTES) != 0) {
        Txt(s, buf);
        Txt(sw, want);
        LibcTestError(&status, "inet_pton(%s) returned %s, wanted %s\n", addr, s, sw);
    }

    addr = "1:2:3:4:5:6:7::9:10:11:12:13:14:15:16:17:18:19:20";
    if (inet_pton(AF_INET6, addr, buf) != K_INET_PTON_REJECT) {
        Txt(s, buf);
        LibcTestError(&status, "inet_pton(%s) returned %s, wanted a failure\n", addr, s);
    }
    return status;
}
