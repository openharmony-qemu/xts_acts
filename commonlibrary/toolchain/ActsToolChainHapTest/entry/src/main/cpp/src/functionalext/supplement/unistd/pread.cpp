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

#include <cstdlib>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include "functionalext.h"

#define TEST_BUFFER_SIZE 64
#define TEST_DIR_PATH "/data/storage/el2/base/files"
#define TEST_FILE_PATH "/data/storage/el2/base/files/pread_test.txt"
#define DIR_MODE_0777 0777
#define FILE_MODE_0777 0777

/**
 * @tc.name      : pread_0100
 * @tc.desc      : Read data from a file into a buffer
 * @tc.level     : Level 1
 */
void pread_0100(void)
{
    const char *txt = "This is pread_0100 test.";
    char buffer[TEST_BUFFER_SIZE];
    memset(buffer, 0x0, sizeof(buffer));
    
    mkdir(TEST_DIR_PATH, DIR_MODE_0777);
    int fd = open(TEST_FILE_PATH, O_RDWR | O_CREAT | O_TRUNC, FILE_MODE_0777);
    if (fd < 0) {
        EXPECT_STRLT("pread_0100", 0, fd);
        return;
    }
    
    pwrite(fd, txt, strlen(txt), 0);
    lseek(fd, 0, SEEK_SET);
    size_t cnt = pread(fd, buffer, TEST_BUFFER_SIZE, 0);
    EXPECT_EQ("pread_0100", cnt, strlen(txt));
    EXPECT_STREQ("pread_0100", txt, buffer);
    close(fd);
    remove(TEST_FILE_PATH);
}

/**
 * @tc.name      : pread_0200
 * @tc.desc      : The current position is at the end, read data from a file into a buffer
 * @tc.level     : Level 1
 */
void pread_0200(void)
{
    const char *txt = "This is pread_0200 test.";
    char buffer[TEST_BUFFER_SIZE];
    memset(buffer, 0x0, sizeof(buffer));
    
    mkdir(TEST_DIR_PATH, DIR_MODE_0777);
    int fd = open(TEST_FILE_PATH, O_RDWR | O_CREAT | O_TRUNC, FILE_MODE_0777);
    if (fd < 0) {
        EXPECT_STRLT("pread_0200", 0, fd);
        return;
    }
    
    pwrite(fd, txt, strlen(txt), 0);
    size_t cnt = pread(fd, buffer, TEST_BUFFER_SIZE, 0);
    EXPECT_EQ("pread_0200", cnt, strlen(txt));
    EXPECT_STREQ("pread_0200", txt, buffer);
    close(fd);
    remove(TEST_FILE_PATH);
}

/**
 * @tc.name      : pread_0300
 * @tc.desc      : The current position is at the end, read the following data
 * @tc.level     : Level 2
 */
void pread_0300(void)
{
    const char *txt = "This is pread_0300 test.";
    char buffer[TEST_BUFFER_SIZE];
    memset(buffer, 0x0, sizeof(buffer));
    
    mkdir(TEST_DIR_PATH, DIR_MODE_0777);
    int fd = open(TEST_FILE_PATH, O_RDWR | O_CREAT | O_TRUNC, FILE_MODE_0777);
    if (fd < 0) {
        EXPECT_STRLT("pread_0300", 0, fd);
        return;
    }
    
    pwrite(fd, txt, strlen(txt), 0);
    size_t cnt = pread(fd, buffer, TEST_BUFFER_SIZE, strlen(txt));
    EXPECT_EQ("pread_0300", cnt, 0);
    close(fd);
    remove(TEST_FILE_PATH);
}

static int PreadTest_impl(void)
{
    pread_0100();
    pread_0200();
    pread_0300();
    return g_tStatus;
}

int PreadTest(void)
{
    return PreadTest_impl();
}
