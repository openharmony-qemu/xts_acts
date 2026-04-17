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

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "test.h"

#define BUFFER_SIZE 64
#define THREAD_COUNT 100
#define READ_COUNT 1
#define WRITE_COUNT 1

static const char *path = "/data/storage/el2/base/cache/test.txt";

void *child_func(void *p)
{
    char buf[BUFFER_SIZE];

    FILE *filep = fopen(path, "r+");
    if (filep == nullptr) {
        t_error("%s fopen failed\n", __func__);
    }

    flockfile(filep);

    if (fseek(filep, 0L, SEEK_SET) == -1) {
        t_error("%s fseek failed\n", __func__);
    }
    int ret = fread(buf, BUFFER_SIZE, READ_COUNT, filep);

    int count = atoi(buf);
    ++count;

    sprintf(buf, "%d", count);
    if (fseek(filep, 0L, SEEK_SET) == -1) {
        t_error("%s fseek failed\n", __func__);
    }
    ret = fwrite(buf, strlen(buf), WRITE_COUNT, filep);

    funlockfile(filep);

    fclose(filep);
    return nullptr;
}

/**
 * @tc.name      : funlockfile_0100
 * @tc.desc      : Mutual exclusion has been tested in the test case of flockfile, so this test case tests that threads
 *                 cannot be mutually exclusive for the case where each thread fopens a descriptor
 * @tc.level     : Level 0
 */
void funlockfile_0100(void)
{
    pthread_t tid[THREAD_COUNT];

    for (int i = 0; i < THREAD_COUNT; i++) {
        if (pthread_create(tid + i, nullptr, child_func, nullptr) != 0) {
            t_error("%s pthread_create failed\n", __func__);
        }
    }

    for (int j = 0; j < THREAD_COUNT; j++) {
        if (pthread_join(tid[j], nullptr) != 0) {
            t_error("%s pthread_join failed\n", __func__);
        }
    }
}

static int FunlockfileTestImpl(int argc, char *argv[])
{
    FILE *fp = fopen(path, "w+");
    if (fp == nullptr) {
        t_error("%s fopen failed\n", __func__);
    }
    fclose(fp);

    funlockfile_0100();

    remove(path);
    return g_tStatus;
}

int FunlockfileTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FunlockfileTestImpl(1, libcArgv);
}
