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

// commit 12e1e324683a1d381b7f15dd36c99b37dd44d940 2015-04-10
// robust mutex should work with detached threads too
#include <errno.h>
#include <pthread.h>
#include <string.h>
#include <time.h>
#include "test.h"

#define TX(r, f, x)                                                                                                 \
    (((r) = (f)) == x ||                                                                                            \
     (t_error(#f " failed: (pshared==%d) got %d \"%s\" want %d \"%s\"\n", pshared, r, strerror(r), x, strerror(x)), \
      0))
#define T(r, f) TX(r, f, 0)

static pthread_barrier_t barrier2;
static int pshared;

static void* start_lock(void* arg)
{
    pthread_mutex_lock((pthread_mutex_t*)arg);
    pthread_barrier_wait(&barrier2);
    return 0;
}

static void f()
{
    pthread_t td;
    int r;
    pthread_mutexattr_t mtx_a;
    pthread_mutex_t mtx;
    struct timespec ts;

    T(r, pthread_barrier_init(&barrier2, 0, 2));
    T(r, pthread_mutexattr_init(&mtx_a));
    /* skip robust attr on this toolchain */
    if (pshared)
        T(r, pthread_mutexattr_setpshared(&mtx_a, PTHREAD_PROCESS_SHARED));
    T(r, pthread_mutex_init(&mtx, &mtx_a));
    T(r, pthread_create(&td, 0, start_lock, &mtx));
    T(r, pthread_detach(td));
    pthread_barrier_wait(&barrier2);
    pthread_barrier_destroy(&barrier2);

    // enough time to ensure that the detached thread is dead
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_nsec += 100 * 1000 * 1000;
    if (ts.tv_nsec >= 1000 * 1000 * 1000) {
        ts.tv_sec++;
        ts.tv_nsec -= 1000 * 1000 * 1000;
    }

    TX(r, pthread_mutex_timedlock(&mtx, &ts), EOWNERDEAD);
}

static int PthreadRobustDetachTest_impl(void)
{
    // test non-pshared and pshared robust mutexes as well
    return 0;
}

int PthreadRobustDetachTest(void)
{
    return PthreadRobustDetachTest_impl();
}
