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
#include <sched.h>
#include <unistd.h>
#include "libc_test_shim.h"

struct PthreadGettidArg {
    pid_t tid;
    volatile int canExit;
};

void* PthreadTest(void* arg)
{
    struct PthreadGettidArg* a = (struct PthreadGettidArg*)arg;
    a->tid = gettid();
    while (!a->canExit) {
        sched_yield();
    }
    return nullptr;
}

int PthreadGettidNpTest()
{
    int status = SUCCESS_CODE;

    struct PthreadGettidArg arg = { 0, 0 };
    pthread_t t;
    if (pthread_create(&t, nullptr, PthreadTest, &arg) != 0) {
        LibcTestError(&status, "pthread_create failed\n");
        return status;
    }
    pid_t recvResult = pthread_gettid_np(t);
    arg.canExit = 1;
    if (!(pthread_join(t, nullptr) == 0)) {
        LibcTestError(&status, "pthread_join(t, nullptr) == 0 failed: pthread_join is failed\n");
    }

    if (!(arg.tid == recvResult)) {
        LibcTestError(&status, "tid == recvResult failed: tid=%d recvResult=%d\n", arg.tid, recvResult);
    }
    return status;
}
