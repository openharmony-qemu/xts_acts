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

// commit: 1a9a2ff7b0daf99100db53440a0b18b2801566ca 2011-02-13
// pthread_exit should call cancelation handlers
#include <cstring>
#include <pthread.h>
#include "libc_test_shim.h"
static void Cleanup(void* arg)
{
    *(int*)arg = 1;
}

static void* Start(void* arg)
{
    pthread_cleanup_push(Cleanup, arg);
    pthread_exit(nullptr); /* NOLINT(G.FUU.06 禁用pthread_exit、ExitThread函数【C】) */
    pthread_cleanup_pop(0);
    return arg;
}

int PthreadExitCancelTest()
{
    pthread_t td;
    int status = SUCCESS_CODE;
    int arg = 0;
    int r;

    r = pthread_create(&td, nullptr, Start, &arg);
    if (r != 0) {
        LibcTestError(&status, "pthread_create(&td, nullptr, Start, &arg) failed: %s\n", strerror(r));
    }
    r = pthread_join(td, nullptr);
    if (r != 0) {
        LibcTestError(&status, "pthread_join(td, nullptr) failed: %s\n", strerror(r));
    }
    if (status) {
        LibcTestError(&status, "expected 0 thread exit status, got 0x%lx\n", static_cast<long>(status));
    }
    if (arg != 1) {
        LibcTestError(&status, "Cleanup Handler failed to run\n");
    }
    return status;
}
