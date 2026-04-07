/* Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <cstring>
#include <ctime>
#include "test.h"

namespace {
constexpr int K_HOURS_PER_DAY = 24;
} // namespace

/**
 * @tc.name      : memset_0100
 * @tc.desc      : test __gmtime64 method
 * @tc.level     : Level 1
 */
#define BST (+1)
#define CCT (+8)

void Gmtime640100(void)
{
    time_t rawtime;
    struct tm* info;

    (void)time(&rawtime);
    info = gmtime(&rawtime);

    if (info == nullptr) {
        t_error("%s __gmtime64 error get result is %2d\n", __func__, (info->tm_hour + CCT) % K_HOURS_PER_DAY);
    }
}

int Gmtime64Test()
{
    Gmtime640100();
    return T_STATUS;
}