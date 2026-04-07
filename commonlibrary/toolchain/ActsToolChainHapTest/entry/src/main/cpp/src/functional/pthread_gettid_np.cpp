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

#include <cerrno>
#include <cstdio>
#include <cstring>
#include <pthread.h>
#include <unistd.h>
#include "libc_test_shim.h"

#define TEST(st, c, ...)                                      \
    do {                                                      \
        if (!(c)) {                                           \
            LibcTestError(&(st), #c " failed: " __VA_ARGS__); \
        }                                                     \
    } while (0)

void* PthreadTest(void* arg)
{
    *((pid_t*)arg) = gettid();
    return nullptr;
}

int PthreadGettidNpTest()
{
    int status = SUCCESS_CODE;

    TEST(status, gettid() == pthread_gettid_np(pthread_self()), "pthread_gettid_np() is failed\n");

    pid_t tid;
    pthread_t t;
    pthread_create(&t, nullptr, PthreadTest, &tid);
    pid_t recvResult = pthread_gettid_np(t);
    TEST(status, pthread_join(t, nullptr) == 0, "pthread_join is failed\n");

    TEST(status, tid == recvResult, "the tid of pthread or tid of pthread_gettid_np() is wrong\n");
    return SUCCESS_CODE;
}
