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

#include <pthread.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include "functionalext.h"

#define NSEC_VALUE 1
#define TIMEOUT_SEC 5
#define USEC_TO_NSEC 1000
#define EXPECTED_FLAG 1

static int flag = 0;
static pthread_cond_t gcond;
static pthread_mutex_t gmutex;
struct timespec gtm;

static void *threadfuncA(void *arg)
{
    struct timeval now;
    struct timespec outtime;
    gtm.tv_nsec = NSEC_VALUE;
    pthread_mutex_lock(&gmutex);
    gettimeofday(&now, nullptr);
    outtime.tv_sec = now.tv_sec + TIMEOUT_SEC;
    outtime.tv_nsec = now.tv_usec * USEC_TO_NSEC;
    pthread_cond_timedwait(&gcond, &gmutex, &outtime);
    flag++;
    pthread_mutex_unlock(&gmutex);
    return arg;
}

static void *threadfuncB(void *arg)
{
    pthread_mutex_lock(&gmutex);
    pthread_cond_signal(&gcond);
    pthread_mutex_unlock(&gmutex);
    return arg;
}

/**
 * @tc.name:      pthread_cond_timedwait_0100
 * @tc.desc:      Verify pthread create process success
 * @tc.level:     level 0.
 */
void pthread_cond_timedwait_0100(void)
{
    pthread_t pid1, pid2;
    pthread_create(&pid1, nullptr, threadfuncA, nullptr);
    pthread_create(&pid2, nullptr, threadfuncB, nullptr);
    pthread_join(pid1, nullptr);
    pthread_join(pid2, nullptr);
    EXPECT_EQ("pthread_cond_timedwait_0200", flag, EXPECTED_FLAG);
    pthread_mutex_destroy(&gmutex);
    pthread_cond_destroy(&gcond);
}

static int PthreadCondTimedwaitSupTestImpl(void)
{
    pthread_cond_timedwait_0100();
    return g_tStatus;
}

int PthreadCondTimedwaitSupTest(void)
{
    return PthreadCondTimedwaitSupTestImpl();
}

