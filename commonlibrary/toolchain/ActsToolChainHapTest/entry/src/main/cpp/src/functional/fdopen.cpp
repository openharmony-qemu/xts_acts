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

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "libc_test_shim.h"
#define TEST(c)                                                            \
    do {                                                                   \
        errno = 0;                                                         \
        if (!(c))                                                          \
            LibcTestError(&status, "%s failed (errno = %d)\n", #c, errno); \
    } while (0)

void fdopen_1(int& status)
{
    char tmp[] = "/data/storage/el2/base/cache/testsuite-XXXXXX";
    char foo[6];
    int fd;
    FILE* f;

    TEST((fd = mkstemp(tmp)) > 2);
    TEST(write(fd, "hello", 6) == 6);
    TEST(f = fdopen(fd, "rb"));
    if (f) {
        TEST(ftello(f) == 6);
        TEST(fseeko(f, 0, SEEK_SET) == 0);
        TEST(fgets(foo, sizeof foo, f));
        if (strcmp(foo, "hello") != 0) {
            LibcTestError(&status, "fgets read back: \"%s\"; wanted: \"hello\"\n", foo);
        }
        fclose(f);
    }
    if (fd > 2) {
        TEST(unlink(tmp) != -1);
    }
}

void fdopen_2(int& status)
{
    FILE* f = fdopen(-1, "w");
    TEST(f == nullptr);
    printf("f == %p\n", f);
}

int FdopenTest()
{
    int status = SUCCESS_CODE;

    fdopen_1(status);
    fdopen_2(status);
    return status;
}
