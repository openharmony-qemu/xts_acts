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

#include <pthread.h>
#include <unistd.h>
#include "functionalext.h"

static pthread_spinlock_t g_lock = 0;
static int count = 0;

static void *thread1(void *arg)
{
    int ret = pthread_spin_trylock(&g_lock);
    EXPECT_EQ("pthread_spin_trylock_0100", ret, CMPFLAG);
    ++count;
    ret = pthread_spin_unlock(&g_lock);
    return const_cast<char *>("success");
}

static void *thread2(void *arg)
{
    int ret = pthread_spin_lock(&g_lock);
    EXPECT_EQ("pthread_spin_trylock_0200", ret, CMPFLAG);

    ret = pthread_spin_trylock(&g_lock);
    EXPECT_EQ("pthread_spin_trylock_0200", ret, EBUSY);
    ret = pthread_spin_unlock(&g_lock);
    return const_cast<char *>("success");
}

/**
 * @tc.name      : pthread_spin_trylock_0100
 * @tc.desc      : Verify that the attempt to lock is successful under multi-threading(success)
 * @tc.level     : Level 0
 */
void pthread_spin_trylock_0100(void)
{
    pthread_t thread;
    void *rev;

    int ret = pthread_spin_init(&g_lock, PTHREAD_PROCESS_PRIVATE);

    EXPECT_EQ("pthread_spin_trylock_0100", ret, CMPFLAG);
    ret = pthread_create(&thread, NULL, thread1, NULL);
    if (ret != 0) {
        EXPECT_EQ("pthread_spin_trylock_0100", ret, CMPFLAG);
        return;
    }

    ret = pthread_spin_lock(&g_lock);
    EXPECT_EQ("pthread_spin_trylock_0100", ret, CMPFLAG);

    ++count;
    ret = pthread_spin_unlock(&g_lock);

    pthread_join(thread, &rev);
    EXPECT_STREQ("pthread_spin_trylock_0100", static_cast<char *>(rev), "success");
    EXPECT_EQ("pthread_spin_trylock_0100", count, 2);
}

/**
 * @tc.name      : pthread_spin_trylock_0200
 * @tc.desc      : Verify that the attempt to lock is successful under multi-threading(failed)
 * @tc.level     : Level 2
 */
void pthread_spin_trylock_0200(void)
{
    pthread_t thread;
    void *rev;

    int ret = pthread_spin_init(&g_lock, PTHREAD_PROCESS_PRIVATE);

    EXPECT_EQ("pthread_spin_trylock_0200", ret, CMPFLAG);
    ret = pthread_create(&thread, NULL, thread2, NULL);
    if (ret != 0) {
        EXPECT_EQ("pthread_spin_trylock_0200", ret, CMPFLAG);
        return;
    }

    pthread_join(thread, &rev);
    pthread_spin_destroy(&g_lock);
}

static int PthreadSpinTrylockTestImpl(void)
{
    pthread_spin_trylock_0100();
    pthread_spin_trylock_0200();

    return g_tStatus;
}

int PthreadSpinTrylockTest(void)
{
    return PthreadSpinTrylockTestImpl();
}


