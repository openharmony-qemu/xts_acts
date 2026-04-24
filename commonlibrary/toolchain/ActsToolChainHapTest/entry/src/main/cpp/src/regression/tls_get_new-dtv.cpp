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

// __tls_get_new did not allocate new dtv for threads properly
#include <dlfcn.h>
#include <pthread.h>
#include "libc_test_shim.h"
#define N 10

#define T_STATUS(status, c) ((c) || (LibcTestError(&(status), #c " failed\n"), 0))
#define T_STATUS_PTR(statusPtr, c) ((c) || (LibcTestError((statusPtr), #c " failed\n"), 0))

static pthread_barrier_t b;
static void* mod;

static void* start(void* a)
{
    int* status = static_cast<int*>(a);
    void* sym = nullptr;
    void* (*f)(void) = nullptr;

    pthread_barrier_wait(&b);
    sym = dlsym(mod, "f");
    T_STATUS_PTR(status, sym);
    if (sym) {
        f = reinterpret_cast<void* (*)()>(sym);
        (void)f();
    }
    return SUCCESS_CODE;
}

int tls_get_new_dtvTest()
{
    int status = SUCCESS_CODE;

    pthread_t td[N];
    int i;

    pthread_barrier_init(&b, 0, N + 1);
    for (i = 0; i < N; i++)
        T_STATUS(status, !pthread_create(td + i, 0, start, &status));

    mod = dlopen("/data/storage/el1/bundle/libs/arm/libtls_get_new-dtv_dso.so", RTLD_NOW);
    if (mod == nullptr) {
        mod = dlopen("/data/storage/el1/bundle/libs/arm64/libtls_get_new-dtv_dso.so", RTLD_NOW);
    }
    if (mod == nullptr) {
        pthread_barrier_wait(&b);
        for (i = 0; i < N; i++) {
            pthread_join(td[i], 0);
        }
        return status;
    }
    pthread_barrier_wait(&b);

    for (i = 0; i < N; i++)
        T_STATUS(status, !pthread_join(td[i], 0));
    return status;
}
