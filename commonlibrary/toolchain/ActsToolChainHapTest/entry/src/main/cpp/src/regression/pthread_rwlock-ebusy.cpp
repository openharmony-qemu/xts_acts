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

// commit: e5dd18319bbd47c89aac5e1571771958a43e067d 2011-03-08
// pthread_rwlock_try* should fail with EBUSY
#include <errno.h>
#include <pthread.h>
#include <string.h>
#include "test.h"

#define T(f)       \
    if ((r = (f))) \
    t_error(#f " failed: %s\n", strerror(r))

static void* tryrdlock(void* arg)
{
    int r = pthread_rwlock_tryrdlock((pthread_rwlock_t*)arg);
    if (r != EBUSY)
        t_error("tryrdlock for wrlocked lock returned %s, want EBUSY\n", strerror(r));
    return 0;
}

static void* trywrlock(void* arg)
{
    int r = pthread_rwlock_trywrlock((pthread_rwlock_t*)arg);
    if (r != EBUSY)
        t_error("trywrlock for rdlocked lock returned %s, want EBUSY\n", strerror(r));
    return 0;
}

static int PthreadRwlockEbusyTest_impl(void)
{
    pthread_t t;
    pthread_rwlock_t rw = PTHREAD_RWLOCK_INITIALIZER;
    void* p;
    int r;

    T(pthread_rwlock_rdlock(&rw));
    T(pthread_create(&t, 0, trywrlock, &rw));
    T(pthread_join(t, &p));
    T(pthread_rwlock_unlock(&rw));

    T(pthread_rwlock_wrlock(&rw));
    T(pthread_create(&t, 0, tryrdlock, &rw));
    T(pthread_join(t, &p));
    T(pthread_rwlock_unlock(&rw));

    return t_status;
}

int PthreadRwlockEbusyTest(void)
{
    return PthreadRwlockEbusyTest_impl();
}
