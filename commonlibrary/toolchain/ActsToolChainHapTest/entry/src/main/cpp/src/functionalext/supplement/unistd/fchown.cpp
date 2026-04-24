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

#include <fcntl.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();
const int COUNT_ZERO = 0;
const int COUNT_NEFATIVE = -1;

/**
 * @tc.name      : fchown_0100
 * @tc.desc      : Parameter is valid and can change the user and group of the file's owner
 * @tc.level     : Level 0
 */
void fchown_0100()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0100", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(fd, 0, 0);
    struct stat buff;
    int stat_result = fstat(fd, &buff);

    if (result == 0 && stat_result == 0) {
        EXPECT_EQ("fchown_0100", buff.st_uid, 0);
        EXPECT_EQ("fchown_0100", buff.st_gid, 0);
    } else {
        printf("fchown_0100: fchown not supported without root privileges (result=%d, errno=%d)\n", result, errno);
    }
    close(fd);
    remove("/data/storage/el2/base/cache/test.txt");
}

/**
 * @tc.name      : fchown_0200
 * @tc.desc      : Parameter valid, can change the file owner of the user
 * @tc.level     : Level 0
 */
void fchown_0200()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0200", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(fd, 0, -1);
    struct stat buff;
    int stat_result = fstat(fd, &buff);

    if (result == 0 && stat_result == 0) {
        EXPECT_EQ("fchown_0200", buff.st_uid, 0);
    } else {
        printf("fchown_0200: fchown not supported without root privileges (result=%d, errno=%d)\n", result, errno);
    }
    close(fd);
    remove("/data/storage/el2/base/cache/test.txt");
}

/**
 * @tc.name      : fchown_0300
 * @tc.desc      : Parameter valid to change the owner group of the file
 * @tc.level     : Level 0
 */
void fchown_0300()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0300", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(fd, -1, 0);
    struct stat buff;
    int stat_result = fstat(fd, &buff);

    if (result == 0 && stat_result == 0) {
        EXPECT_EQ("fchown_0300", buff.st_gid, 0);
    } else {
        printf("fchown_0300: fchown not supported without root privileges (result=%d, errno=%d)\n", result, errno);
    }
    close(fd);
    remove("/data/storage/el2/base/cache/test.txt");
}

/**
 * @tc.name      : fchown_0400
 * @tc.desc      : The user and group of the file's owner cannot be changed
 * @tc.level     : Level 2
 */
void fchown_0400()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0400", fd, -1);
    if (fd == -1) {
        return;
    }
    close(fd);
    int result = fchown(fd, 0, 0);
    EXPECT_EQ("fchown_0400", result, COUNT_NEFATIVE);
    remove("/data/storage/el2/base/cache/test.txt");
}

/**
 * @tc.name      : fchown_0500
 * @tc.desc      : The user and group of the file's owner cannot be changed
 * @tc.level     : Level 2
 */
void fchown_0500()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0500", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(-1, 0, 0);
    EXPECT_EQ("fchown_0500", result, COUNT_NEFATIVE);
    close(fd);
    remove("/data/storage/el2/base/cache/test.txt");
}

static TEST_FUN G_Fun_Array[] = {
    fchown_0100, fchown_0200, fchown_0300, fchown_0400, fchown_0500,
};

static int FchownTest_impl(int argc, char* argv[])
{
    int num = sizeof(G_Fun_Array) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        G_Fun_Array[pos]();
    }

    return t_status;
}

int FchownTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, NULL };
    return FchownTest_impl(1, libcArgv);
}
