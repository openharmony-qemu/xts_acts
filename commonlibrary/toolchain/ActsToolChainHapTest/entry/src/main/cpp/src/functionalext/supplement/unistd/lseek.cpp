/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include "functionalext.h"


#ifdef __arm__
extern "C" off64_t lseek64(int, off64_t, int);
#else
#define lseek64 lseek
#endif

#define TEST_BUFFER_SIZE 4
#define DIR_MODE_0777 0777
#define FILE_MODE_0777 0777

typedef void (*TEST_FUN)();
const int FILE_ZERO = 0;
const int FILE_NEGA = -1;
const int FILE_EIGHT = 8;
const int FILE_TEN = 10;
const int FILE_TWENTWO = 22;
const int FILE_THIRTYTHREE = 33;

/**
 * @tc.name      : lseek64_0100
 * @tc.desc      : Determine whether the file read position is as expected
 * @tc.level     : Level 2
 */
void Lseek640100(void)
{
    off_t dataArry[TEST_BUFFER_SIZE] = {1, 2, 4, 8};
    off_t offset = 0;
    const char *dirPath = "/data/storage/el2/base/files";
    const char *filePath = "/data/storage/el2/base/files/lseek64_function_test.c";
    mkdir(dirPath, DIR_MODE_0777);
    int fd = open(filePath, O_RDWR | O_CREAT, FILE_MODE_0777);
    if (fd < 0) {
        t_error("open file failed\n");
        return;
    }
    for (int i = 0; i < TEST_BUFFER_SIZE; i++) {
        lseek64(fd, 0, SEEK_SET);
        offset = lseek64(fd, dataArry[i], SEEK_SET);
        if (offset != dataArry[i]) {
            EXPECT_FALSE("lseek64_0100", 1);
        }
    }
    close(fd);
    int ret = access(filePath, F_OK);
    if (ret != -1) {
        ret = remove(filePath);
    }
}

/**
 * @tc.name      : lseek_0100
 * @tc.desc      : Verify that the file pointer is moved to the beginning of the file
 * @tc.level     : Level 0
 */
void Lseek0100(void)
{
    char *wrstring = "This is a test sample!";
    const char *dirPath = "/data/storage/el2/base/files";
    const char *filePath = "/data/storage/el2/base/files/readtest.txt";
    mkdir(dirPath, DIR_MODE_0777);
    int fd = open(filePath, O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_STRLT("lseek_0100", 0, fd);
    int retWrite = write(fd, wrstring, sizeof(wrstring));
    off_t data = lseek(fd, 0L, SEEK_SET);
    EXPECT_EQ("lseek_0100", (int)data, FILE_ZERO);
    close(fd);
    remove(filePath);
}

/**
 * @tc.name      : lseek_0200
 * @tc.desc      : Verify that the file pointer is moved anywhere in the file
 * @tc.level     : Level 0
 */
void Lseek0200(void)
{
    char *wrstring = "This is a test sample!";
    const char *dirPath = "/data/storage/el2/base/files";
    const char *filePath = "/data/storage/el2/base/files/readtest.txt";
    mkdir(dirPath, DIR_MODE_0777);
    int fd = open(filePath, O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_STRLT("lseek_0200", 0, fd);
    int retWrite = write(fd, wrstring, sizeof(wrstring));
    off_t data = lseek(fd, 8L, SEEK_SET);
    EXPECT_EQ("lseek_0200", (int)data, FILE_EIGHT);
    close(fd);
    remove(filePath);
}

/**
 * @tc.name      : lseek_0300
 * @tc.desc      : Verify moves the file pointer to the current file position
 * @tc.level     : Level 0
 */
void Lseek0300(void)
{
    char *wrstring = "This is a test sample!";
    const char *dirPath = "/data/storage/el2/base/files";
    const char *filePath = "/data/storage/el2/base/files/readtest.txt";
    mkdir(dirPath, DIR_MODE_0777);
    int fd = open(filePath, O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_STRLT("lseek_0300", 0, fd);
    int retWrite = write(fd, wrstring, sizeof(wrstring));
    off_t data = lseek(fd, 10L, SEEK_SET);
    data = lseek(fd, 0L, SEEK_CUR);
    EXPECT_EQ("lseek_0300", (int)data, FILE_TEN);
    close(fd);
    remove(filePath);
}

/**
 * @tc.name      : lseek_0400
 * @tc.desc      : Verify that the file pointer is moved to the end of the file
 * @tc.level     : Level 0
 */
void Lseek0400(void)
{
    char str[] = "This is a test sample!";
    const char *dirPath = "/data/storage/el2/base/files";
    const char *filePath = "/data/storage/el2/base/files/readtest.txt";
    mkdir(dirPath, DIR_MODE_0777);
    int fd = open(filePath, O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_STRLT("lseek_0400", 0, fd);
    int retWrite = write(fd, str, sizeof(str));
    off_t data = lseek(fd, -1L, SEEK_END);
    EXPECT_EQ("lseek_0400", (int)data, FILE_TWENTWO);
    close(fd);
    remove(filePath);
}

/**
 * @tc.name      : lseek_0500
 * @tc.desc      : Verify that the move file pointer position is past the start position
 * @tc.level     : Level 2
 */
void Lseek0500(void)
{
    char str[] = "This is a test sample!";
    const char *dirPath = "/data/storage/el2/base/files";
    const char *filePath = "/data/storage/el2/base/files/readtest.txt";
    mkdir(dirPath, DIR_MODE_0777);
    int fd = open(filePath, O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_STRLT("lseek_0500", 0, fd);
    int retWrite = write(fd, str, sizeof(str));
    off_t data = lseek(fd, -10L, SEEK_SET);
    EXPECT_EQ("lseek_0500", (int)data, FILE_NEGA);
    close(fd);
    remove(filePath);
}

/**
 * @tc.name      : lseek_0600
 * @tc.desc      : Verify that the moved file pointer position is past the end position
 * @tc.level     : Level 1
 */
void Lseek0600(void)
{
    char str[] = "This is a test sample!";
    const char *dirPath = "/data/storage/el2/base/files";
    const char *filePath = "/data/storage/el2/base/files/readtest.txt";
    mkdir(dirPath, DIR_MODE_0777);
    int fd = open(filePath, O_RDWR | O_CREAT, FILE_MODE_0777);
    EXPECT_STRLT("lseek_0600", 0, fd);
    int retWrite = write(fd, str, sizeof(str));
    off_t data = lseek(fd, 10L, SEEK_END);
    EXPECT_EQ("lseek_0600", (int)data, FILE_THIRTYTHREE);
    close(fd);
    remove(filePath);
}

static TEST_FUN g_gFunArray[] = {
    Lseek640100,
    Lseek0100,
    Lseek0200,
    Lseek0300,
    Lseek0400,
    Lseek0500,
    Lseek0600,
};

static int LseekTestImpl(void)
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return g_tStatus;
}

int LseekTest(void)
{
    return LseekTestImpl();
}
