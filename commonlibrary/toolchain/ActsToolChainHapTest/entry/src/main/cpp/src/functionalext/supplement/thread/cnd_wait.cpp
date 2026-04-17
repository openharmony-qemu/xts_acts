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
#include <threads.h>
#include "functionalext.h"

#define SUCCESS_CODE (0)
#define SLEEP_SECONDS (2)

static mtx_t g_mtx;
static cnd_t cnd;
void CndWaitfirst(void *arg)
{
    int res = -1;
    mtx_lock(&g_mtx);
    res = cnd_wait(&cnd, &g_mtx);
    EXPECT_EQ("CndWait0100", res, thrd_success);
    mtx_unlock(&g_mtx);
}

/**
 * @tc.name      : CndWait0100
 * @tc.desc      : The parameter is valid and can block the calling thread and release the specified mutex
 * @tc.level     : Level 0
 */
void CndWait0100(void)
{
    thrd_t id1;
    int ret;
    cnd_init(&cnd);
    mtx_init(&g_mtx, 0);
    ret = thrd_create(&id1, reinterpret_cast<thrd_start_t>(CndWaitfirst), reinterpret_cast<void *>(1));
    EXPECT_EQ("CndWait0100", ret, SUCCESS_CODE);
    sleep(SLEEP_SECONDS);
    mtx_lock(&g_mtx);
    cnd_signal(&cnd);
    mtx_unlock(&g_mtx);
    thrd_join(id1, nullptr);
    cnd_destroy(&cnd);
    mtx_destroy(&g_mtx);
}

static int CndWaitTestWithArgs(int argc, char *argv[])
{
    CndWait0100();
    return g_tStatus;
}

int CndWaitTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return CndWaitTestWithArgs(1, libcArgv);
}
