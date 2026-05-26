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
#include "functionalext.h"

extern "C" void __cxa_finalize(void *dso);

static const int32_t FINALIZE_INIT_LEN = 0;
static const int32_t FINALIZE_INCREASE_LEN = 1;
static int32_t g_finalizeFlag = 0;

void FinalizeFunc()
{
    g_finalizeFlag++;
}

/**
 * @tc.name:      cxa_finalize_0100
 * @tc.desc:      Verify cxa finalize process success.
 * @tc.level:     level 0.
 */
void cxa_finalize_0100(void)
{
    int ret = atexit(FinalizeFunc);
    EXPECT_EQ("cxa_finalize_0100", ret, 0);
    __cxa_finalize(NULL);
    EXPECT_EQ("cxa_finalize_0100", g_finalizeFlag, FINALIZE_INCREASE_LEN);
}

int ACxaFinalizeTest(void)
{
    cxa_finalize_0100();
    return g_tStatus;
}
