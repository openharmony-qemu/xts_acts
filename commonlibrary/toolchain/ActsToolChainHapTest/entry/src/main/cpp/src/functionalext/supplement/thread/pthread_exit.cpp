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

#include <cstdlib>
#include <pthread.h>
#include <unistd.h>
#include "functionalext.h"

void* ThreadfuncA(void* arg)
{
    (void)arg;
    return const_cast<void*>(static_cast<const void*>("PthreadExit0100"));
}

/**
 * @tc.name      : PthreadExit0100
 * @tc.desc      : Verify pthread_exit process success
 * @tc.level     : Level 1
 */
void PthreadExit0100(void)
{
    pthread_t ph;
    int32_t ret = pthread_create(&ph, nullptr, ThreadfuncA, nullptr);
    void* threadResult = nullptr;
    pthread_join(ph, &threadResult);
    EXPECT_STREQ("PthreadExit0100", static_cast<char*>(threadResult), "PthreadExit0100");
}

static int PthreadExitTestTestImpl(void)
{
    PthreadExit0100();
    return T_STATUS;
}

int PthreadExitTestTest(void)
{
    return PthreadExitTestTestImpl();
}
