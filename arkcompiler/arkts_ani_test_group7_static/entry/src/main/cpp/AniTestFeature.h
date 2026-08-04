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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_FEATURE_H
#define ARKTS_ANI_TEST_NATIVETEST01_FEATURE_H

#include "AniTestBase.h"

inline bool UnboxElementAt(ani_env *env, ani_array input, ani_size i, ani_double &val)
{
    ani_ref elem_ref = nullptr;
    if (env->Array_Get(input, i, &elem_ref) != ANI_OK) {
        return false;
    }
    if (env->Primitive_Unbox_Double((ani_object)elem_ref, &val) != ANI_OK) {
        return false;
    }
    return true;
}

inline bool BoxAndSet(ani_env *env, ani_double val, ani_array output, ani_size outIdx)
{
    ani_object boxed = nullptr;
    if (env->Primitive_Box_Double(val, &boxed) != ANI_OK) {
        return false;
    }
    if (env->Array_Set(output, outIdx, (ani_ref)boxed) != ANI_OK) {
        return false;
    }
    return true;
}

inline ani_size SampleFeatureArray(ani_env *env, ani_array input, ani_size len, ani_array output)
{
    ani_size outIdx = 0;
    for (ani_size i = 0; i < len; i += FEATURE_SAMPLE_INTERVAL) {
        ani_double val = 0;
        if (!UnboxElementAt(env, input, i, val) || !BoxAndSet(env, val, output, outIdx)) {
            return static_cast<ani_size>(-1);
        }
        outIdx++;
    }
    return outIdx;
}

ani_object testAniFeatureExtract([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_array input)
{
    if (input == nullptr) {
        return nullptr;
    }
    ani_size len = 0;
    if (env->Array_GetLength(input, &len) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefined_ref = nullptr;
    if (env->GetUndefined(&undefined_ref) != ANI_OK) {
        return nullptr;
    }
    ani_size outLen = (len + FEATURE_SAMPLE_INTERVAL - 1) / FEATURE_SAMPLE_INTERVAL;
    if (outLen == 0) {
        outLen = 1;
    }
    ani_array output = nullptr;
    if (env->Array_New(outLen, undefined_ref, &output) != ANI_OK) {
        return nullptr;
    }
    ani_size outIdx = SampleFeatureArray(env, input, len, output);
    if (outIdx == static_cast<ani_size>(-1)) {
        return nullptr;
    }
    ani_object obj = createEmptyObject(env);
    if (obj == nullptr) {
        return nullptr;
    }
    ani_object lenBoxed = nullptr;
    if (env->Primitive_Box_Int(static_cast<int32_t>(outIdx), &lenBoxed) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Ref(obj, "dst", (ani_ref)output) != ANI_OK ||
        env->Object_SetPropertyByName_Ref(obj, "len", (ani_ref)lenBoxed) != ANI_OK) {
        return nullptr;
    }
    return obj;
}

ani_boolean testAniErrorTrigger([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class dummy = nullptr;
    ani_status status = env->FindClass("non.existent.Class", &dummy);
    if (status == ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean hasError = ANI_FALSE;
    env->ExistUnhandledError(&hasError);
    if (hasError == ANI_TRUE) {
        env->ResetError();
    }
    ani_string str = nullptr;
    status = env->String_NewUTF8("after reset", static_cast<ani_size>(strlen("after reset")), &str);
    return (status == ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

#endif
