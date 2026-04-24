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

// commit 3af2edee150484940916eba1984f78c3b965dd05 2014-02-07
// fix ftello result for append streams with unflushed output
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "libc_test_shim.h"
#define ASSERT(c)                                                                   \
    do {                                                                            \
        errno = 0;                                                                  \
        if (!(c))                                                                   \
            LibcTestError(&status, "%s failed (errno: %s)\n", #c, strerror(errno)); \
    } while (0)

int ftello_unflushed_appendTest()
{
    int status = SUCCESS_CODE;

    char tmp[] = "/data/storage/el2/base/cache/testsuite-XXXXXX";
    int fd;
    FILE* f;
    off_t off;

    ASSERT((fd = mkstemp(tmp)) > 2);
    ASSERT(write(fd, "abcd", 4) == 4);
    ASSERT(close(fd) == 0);

    ASSERT((fd = open(tmp, O_WRONLY)) > 2);
    ASSERT(f = fdopen(fd, "a"));
    if (f) {
        ASSERT(fwrite("efg", 1, 3, f) == 3);
        ASSERT((off = ftello(f)) != -1);
        if (off != 7)
            LibcTestError(&status, "ftello is broken before flush: got %lld, want 7\n", static_cast<long long>(off));
        ASSERT(fflush(f) == 0);
        ASSERT((off = ftello(f)) != -1);
        if (off != 7)
            LibcTestError(&status, "ftello is broken after flush: got %lld, want 7\n", static_cast<long long>(off));
        ASSERT(fclose(f) == 0);
    }
    if (fd > 2)
        ASSERT(unlink(tmp) == 0);
    return status;
}
