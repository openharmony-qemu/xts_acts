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

// WARNING: failed to inject status
#include <poll.h>
#include <type_traits>
#include "libc_test_shim.h"
#define TYPE_PUN(t) static_cast<std::add_pointer_t<t>>(nullptr);
#define FIELD(x, t, n) \
    do {               \
        t* y = &(x).n; \
    } while (0)
#define IGNORE_POLL_CONST(n) \
    switch (0) {             \
        case 0:              \
            (void)(n);       \
        default:             \
            break;           \
    }
static void PollFortifyBody()
{
    TYPE_PUN(nfds_t)
    {
        struct pollfd x;
        FIELD(x, int, fd);
        FIELD(x, short, events);
        FIELD(x, short, revents);
    }
    IGNORE_POLL_CONST(POLLIN)
    IGNORE_POLL_CONST(POLLRDNORM)
    IGNORE_POLL_CONST(POLLRDBAND)
    IGNORE_POLL_CONST(POLLPRI)
    IGNORE_POLL_CONST(POLLOUT)
    IGNORE_POLL_CONST(POLLWRNORM)
    IGNORE_POLL_CONST(POLLWRBAND)
    IGNORE_POLL_CONST(POLLERR)
    IGNORE_POLL_CONST(POLLHUP)
    IGNORE_POLL_CONST(POLLNVAL)
    {
        int (*p)(struct pollfd[], nfds_t, int) = poll;
    }
}

int PollTest()
{
    PollFortifyBody();
    return SUCCESS_CODE;
}
