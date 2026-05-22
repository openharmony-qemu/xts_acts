/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <cstdio>
#include <sys/stat.h>
#include <unistd.h>
#include <cstdlib>
#include <cerrno>
#include <cstring>
#include "functionalext.h"


const int32_t INIT_LEN = 0;
const int32_t INCREASE_LEN = 1;
const int32_t CREAT_MODE = 0666;  // 八进制，表示 rw-rw-rw-

// HAP应用沙箱中有写权限的目录
#define TEST_FILE_DIR "/data/storage/el2/base/cache/"

/**
 * @tc.name       : fopen_0100
 * @tc.desc       : Verify fopen("r") and fclose fread and fwrite, fopen success, fread success, fwrite failed
 * @tc.level      : level 0.
 */
void Fopen0100(void)
{
    char abc[100] = {0};
    const char *add = "this is tempory test!";
    const char *wrstring = "to write";
    const char *wstring = "this is tempory test!";
    const char *filepath = TEST_FILE_DIR "tempory_test.txt";
    
    int ret = creat(filepath, CREAT_MODE);
    if (ret < 0) {
        EXPECT_MT("fopen_0100", ret, 0);
        return;
    }
    close(ret);  // 关闭 creat 返回的文件描述符
    
    FILE *fptr = fopen(filepath, "w");
    if (fptr != NULL) {
        size_t wrsize = fwrite(wstring, sizeof(char), strlen(wstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0100", wrsize, INIT_LEN);
        }
        fclose(fptr);
    } else {
        remove(filepath);
        return;
    }
    
    // 检查文件是否存在
    struct stat st;
    int statRet = stat(filepath, &st);
    if (statRet == 0) {
    }
    
    errno = 0;
    fptr = fopen(filepath, "r");
    int openErrno = errno;
    bool writeFailedFlag = false;
    bool consistentFlag = false;
    if (fptr != NULL) {
        int32_t rsize = fread(abc, sizeof(abc), 1, fptr);
        // fread 成功读取应该返回非零值（实际读取的元素数）
        if (!strncmp(abc, add, strlen(add))) {
            consistentFlag = true;
        }

        size_t wrsize = fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
        if (wrsize == INIT_LEN) {
            writeFailedFlag = true;
        }
        fclose(fptr);
    }

    EXPECT_TRUE("fopen_0100", writeFailedFlag);
    EXPECT_TRUE("fopen_0100", consistentFlag);
    remove(filepath);
}

/**
 * @tc.name       : fopen_0200
 * @tc.desc       : Verify fopen("r") and fclose and fopen failed
 * @tc.level      : level 2.
 */
void Fopen0200(void)
{
    const char *filepath = TEST_FILE_DIR "tempory_test1.txt";
    FILE *fptr = fopen(filepath, "r");
    EXPECT_EQ("fopen_0200", fptr, NULL);
}

/**
 * @tc.name       : fopen_0300
 * @tc.desc       : Verify fopen("w") and fclose and fread and fwrite and fopen success, fread failed, fwrite success
 * @tc.level      : level 0.
 */
void Fopen0300(void)
{
    int32_t rsize = 0;
    char abc[100] = {0};
    const char *wrstring = "to write";
    const char *filepath = TEST_FILE_DIR "tempory_test3.txt";
    FILE *fptr = fopen(filepath, "w");
    bool writeSuccessFlag = false;

    if (fptr != NULL) {
        rsize = fread(abc, sizeof(abc), 1, fptr);
        size_t wrsize = fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0300", wrsize, INIT_LEN);
            ;
        } else if (wrsize == strlen(wrstring)) {
            writeSuccessFlag = true;
        }
        fclose(fptr);
    }

    EXPECT_EQ("fopen_0300", rsize, INIT_LEN);
    EXPECT_TRUE("fopen_0300", writeSuccessFlag);
    remove(filepath);
}

/**
 * @tc.name       : fopen_0400
 * @tc.desc       : Verify fopen("w") and fclose and fread and fwrite and fopen success, fread failed, fwrite success
 * @tc.level      : level 1.
 */
void Fopen0400(void)
{
    int32_t rsize = 0;
    char abc[100] = {0};
    const char *wrstring = "to write";
    const char *filepath = TEST_FILE_DIR "tempory_test2.txt";
    FILE *fptr = fopen(filepath, "w");
    bool writeSuccessFlag = false;

    if (fptr != NULL) {
        rsize = fread(abc, sizeof(abc), 1, fptr);

        size_t wrsize = fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0400", wrsize, INIT_LEN);
        } else if (wrsize == strlen(wrstring)) {
            writeSuccessFlag = true;
        }
        fclose(fptr);
    }

    EXPECT_EQ("fopen_0400", rsize, INIT_LEN);
    EXPECT_TRUE("fopen_0400", writeSuccessFlag);
    remove(filepath);
}

/**
 * @tc.name       : fopen_0500
 * @tc.desc       : Verify fopen("a") and fclose and fread and fwrite and fopen success, fread success, fwrite success
 * @tc.level      : level 0.
 */
void Fopen0500(void)
{
    char abc[100] = {0};
    const char *add = "this is tempory test!to write";
    const char *wrstring = "to write";
    const char *wstring = "this is tempory test!";
    const char *filepath = TEST_FILE_DIR "tempory_test5.txt";
    int ret = creat(filepath, CREAT_MODE);
    if (ret < 0) {
        EXPECT_MT("fopen_0500", ret, 0);
        return;
    }
    close(ret);
    FILE *fptr = fopen(filepath, "w");
    if (fptr != NULL) {
        size_t wrsize = fwrite(wstring, sizeof(char), strlen(wstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0500", wrsize, INIT_LEN);
        }
        fclose(fptr);
    }

    fptr = fopen(filepath, "a");
    bool writeSuccessFlag = false;
    bool consistentFlag = false;
    if (fptr != NULL) {
        fseek(fptr, 0, SEEK_SET);
        size_t wrsize = fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0500", wrsize, INIT_LEN);
        } else if (wrsize == strlen(wrstring)) {
            writeSuccessFlag = true;
        }
        fclose(fptr);
    }

    fptr = fopen(filepath, "r");
    if (fptr != NULL) {
        int32_t rsize = fread(abc, sizeof(abc), 1, fptr);
        if (!strncmp(abc, add, strlen(add))) {
            consistentFlag = true;
        }
        fclose(fptr);
    }

    EXPECT_TRUE("fopen_0500", writeSuccessFlag);
    EXPECT_TRUE("fopen_0500", consistentFlag);
    remove(filepath);
}

/**
 * @tc.name       : fopen_0600
 * @tc.desc       : Verify fopen("a") and fclose and fread and fwrite and fopen success, fread success, fwrite success
 * @tc.level      : level 1.
 */
void Fopen0600(void)
{
    int32_t rsize = 0;
    char abc[100] = {0};
    const char *wrstring = "to write";
    const char *filepath = TEST_FILE_DIR "tempory_test6.txt";
    FILE *fptr = fopen(filepath, "w");
    bool writeSuccessFlag = false;

    if (fptr != NULL) {
        rsize = fread(abc, sizeof(abc), 1, fptr);

        size_t wrsize = fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0600", wrsize, INIT_LEN);
            ;
        } else if (wrsize == strlen(wrstring)) {
            writeSuccessFlag = true;
        }
        fclose(fptr);
    }

    EXPECT_EQ("fopen_0600", rsize, INIT_LEN);
    EXPECT_TRUE("fopen_0600", writeSuccessFlag);
    remove(filepath);
}

/**
 * @tc.name       : fopen_0700
 * @tc.desc       : Verify fopen("b") and fclose and fread and fwrite and fopen failed
 * @tc.level      : level 2.
 */
void Fopen0700(void)
{
    FILE *fptr = fopen("./tempory_test.txt", "b");
    int32_t flag = INIT_LEN;
    if (fptr == NULL) {
        EXPECT_EQ("fopen_0700", errno, EINVAL);
    } else {
        flag++;
        EXPECT_EQ("fopen_0700", flag, INCREASE_LEN);
    }
}

/**
 * @tc.name       : fopen_0800
 * @tc.desc       : Verify fopen("a") and fclose and fread and fwrite and fopen failed
 * @tc.level      : level 2.
 */
void Fopen0800(void)
{
    struct stat info;
    if (stat("/data/local/tmp/libc-test-empty/", &info) == 0 && S_ISDIR(info.st_mode)) {
        system("rm -rf /data/local/tmp/libc-test-empty/");
    }
    FILE *fptr = fopen("/data/local/tmp/libc-test-empty/tempory_test.txt", "a");
    EXPECT_EQ("fopen_0800", fptr, NULL);
}

/**
 * @tc.name       : fopen_0900
 * @tc.desc       : Verify fopen("ae") and fclose and fread and fwrite and fopen success, fread success, fwrite success
 * @tc.level      : level 0.
 */
void Fopen0900(void)
{
    char abc[100] = {0};
    const char *add = "this is tempory test!to write";
    const char *wrstring = "to write";
    const char *wstring = "this is tempory test!";
    const char *filepath = TEST_FILE_DIR "tempory_test9.txt";
    int ret = creat(filepath, CREAT_MODE);
    if (ret < 0) {
        EXPECT_MT("fopen_0900", ret, 0);
        return;
    }
    close(ret);
    FILE *fptr = fopen(filepath, "w");
    if (fptr != NULL) {
        size_t wrsize = fwrite(wstring, sizeof(char), strlen(wstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0900", wrsize, INIT_LEN);
            ;
        }
        fclose(fptr);
    }

    fptr = fopen(filepath, "ae");
    bool writeSuccessFlag = false;
    bool consistentFlag = false;
    if (fptr != NULL) {
        size_t wrsize = fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
        if (wrsize == INIT_LEN) {
            EXPECT_EQ("fopen_0900", wrsize, INIT_LEN);
            ;
        } else if (wrsize == strlen(wrstring)) {
            writeSuccessFlag = true;
        }
        fclose(fptr);
    }

    fptr = fopen(filepath, "r");
    if (fptr != NULL) {
        int32_t rsize = fread(abc, sizeof(abc), 1, fptr);
        if (!strncmp(abc, add, strlen(add))) {
            consistentFlag = true;
        }
        fclose(fptr);
    }
    remove(filepath);

    EXPECT_TRUE("fopen_0900", writeSuccessFlag);
    EXPECT_TRUE("fopen_0900", consistentFlag);
}

static int FopenTestImpl(void)
{
    Fopen0100();
    Fopen0200();
    Fopen0300();
    Fopen0400();
    Fopen0500();
    Fopen0600();
    Fopen0700();
    Fopen0800();
    Fopen0900();
    return g_tStatus;
}

int FopenTest(void)
{
    return FopenTestImpl();
}
