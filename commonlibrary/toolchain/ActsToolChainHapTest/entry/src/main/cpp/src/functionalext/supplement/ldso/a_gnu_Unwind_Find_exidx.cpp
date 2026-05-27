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
#include <dlfcn.h>

#include "functionalext.h"


typedef uintptr_t (*GnuUnwindFindExidxFunc)(uintptr_t pc, int *pcount);

const int32_t INIT_LEN = 0;
const int32_t COUNT = 32;

/**
 * @tc.name:      a_gnu_Unwind_Find_exidx_0100
 * @tc.desc:      Verify gnu Unwind Find exidx process success.
 * @tc.level:     level 2.
 */
void a_gnu_Unwind_Find_exidx_0100(void)
{
    GnuUnwindFindExidxFunc gnu_unwind_func = (GnuUnwindFindExidxFunc)dlsym(RTLD_DEFAULT, "__gnu_Unwind_Find_exidx");
    if (gnu_unwind_func == NULL) {
        EXPECT_EQ("a_gnu_Unwind_Find_exidx_0100", INIT_LEN, INIT_LEN);
        return;
    }
    uintptr_t pc = INIT_LEN;
    int32_t pcount = COUNT;
    int32_t ret = gnu_unwind_func(pc, &pcount);
    EXPECT_EQ("a_gnu_Unwind_Find_exidx_0100", ret, INIT_LEN);
}

int AGnuUnwindFindExidxTest(void)
{
    a_gnu_Unwind_Find_exidx_0100();
    return g_tStatus;
}
