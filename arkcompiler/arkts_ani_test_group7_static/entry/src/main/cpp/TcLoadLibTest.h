/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ARKTS_ANI_TEST_TC_LOADLIB_TEST_H
#define ARKTS_ANI_TEST_TC_LOADLIB_TEST_H
#include "Common.h"
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_loadlib {
inline ani_int g_loadLibNativeCallCount = 0;
}
ani_int add(ani_env *env, ani_int a, ani_int b)
{
    (void)env;
    ani_tc_loadlib::g_loadLibNativeCallCount++;
    std::cout << "add called, a: " << a << ", b: " << b
              << ", call count: " << ani_tc_loadlib::g_loadLibNativeCallCount << std::endl;
    return a + b;
}
ani_int getLoadLibNativeCallCount(ani_env *env)
{
    (void)env;
    std::cout << "getLoadLibNativeCallCount called, count: "
              << ani_tc_loadlib::g_loadLibNativeCallCount << std::endl;
    return ani_tc_loadlib::g_loadLibNativeCallCount;
}
#endif
