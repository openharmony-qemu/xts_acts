/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_DYNAMIC_H
#define ARKTS_ANI_TEST_NATIVETEST01_DYNAMIC_H

#include "AniTestBase.h"

inline ani_int DynAdd([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    return a + b;
}

inline ani_int DynSub([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    return a - b;
}

ani_boolean testAniDynamicRegistration([[maybe_unused]] ani_env *env)
{
    ani_module module = nullptr;
    if (env->FindModule(NATIVE_BINDINGS_MODULE, &module) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_function addFn = nullptr;
    ani_function subFn = nullptr;
    if (env->Module_FindFunction(module, "dynAdd", "ii:i", &addFn) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Module_FindFunction(module, "dynSub", "ii:i", &subFn) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int addResult = 0;
    ani_int addA = 3;
    ani_int addB = 5;
    ani_int addExpected = 8;
    if (env->Function_Call_Int(addFn, &addResult, addA, addB) != ANI_OK || addResult != addExpected) {
        return ANI_FALSE;
    }
    ani_int subResult = 0;
    ani_int subA = 10;
    ani_int subB = 4;
    ani_int subExpected = 6;
    if (env->Function_Call_Int(subFn, &subResult, subA, subB) != ANI_OK || subResult != subExpected) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

#endif
