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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_ARRAY_H
#define ARKTS_ANI_TEST_NATIVETEST01_ARRAY_H

#include "AniTestBase.h"

ani_array testAniArrayDouble([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_array arr)
{
    if (arr == nullptr) {
        return nullptr;
    }
    ani_size len = 0;
    if (env->Array_GetLength(arr, &len) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefined_ref = nullptr;
    if (env->GetUndefined(&undefined_ref) != ANI_OK) {
        return nullptr;
    }
    ani_array result = nullptr;
    if (env->Array_New(len, undefined_ref, &result) != ANI_OK) {
        return nullptr;
    }
    for (ani_size i = 0; i < len; i++) {
        ani_ref elem_ref = nullptr;
        if (env->Array_Get(arr, i, &elem_ref) != ANI_OK) {
            return nullptr;
        }
        ani_double val = 0;
        if (env->Primitive_Unbox_Double((ani_object)elem_ref, &val) != ANI_OK) {
            return nullptr;
        }
        ani_object boxed = nullptr;
        if (env->Primitive_Box_Double(val * ARRAY_DOUBLE_FACTOR, &boxed) != ANI_OK) {
            return nullptr;
        }
        if (env->Array_Set(result, i, (ani_ref)boxed) != ANI_OK) {
            return nullptr;
        }
    }
    return result;
}

ani_arraybuffer testAniMatrixTranspose([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_arraybuffer srcBuf, ani_int rows, ani_int cols)
{
    if (srcBuf == nullptr || rows <= 0 || cols <= 0) {
        return nullptr;
    }
    const size_t maxSize = SIZE_MAX / sizeof(float);
    if (static_cast<size_t>(rows) > maxSize / static_cast<size_t>(cols)) {
        return nullptr;
    }
    void *srcData = nullptr;
    size_t srcSize = 0;
    if (env->ArrayBuffer_GetInfo(srcBuf, &srcData, &srcSize) != ANI_OK) {
        return nullptr;
    }
    size_t expectedSize = static_cast<size_t>(rows) * static_cast<size_t>(cols) * sizeof(float);
    if (srcSize < expectedSize || srcData == nullptr) {
        return nullptr;
    }
    void *dstData = nullptr;
    ani_arraybuffer result = nullptr;
    if (env->CreateArrayBuffer(expectedSize, &dstData, &result) != ANI_OK) {
        return nullptr;
    }
    const float *src = static_cast<const float *>(srcData);
    float *dst = static_cast<float *>(dstData);
    for (int32_t r = 0; r < rows; r++) {
        for (int32_t c = 0; c < cols; c++) {
            dst[c * rows + r] = src[r * cols + c];
        }
    }
    return result;
}

ani_boolean testAniXorEncrypt([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_arraybuffer srcBuf)
{
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(srcBuf, &data, &size) != ANI_OK) {
        return ANI_FALSE;
    }
    if (data == nullptr || size == 0) {
        return ANI_FALSE;
    }
    auto *bytes = static_cast<uint8_t *>(data);
    for (size_t i = 0; i < size; i++) {
        bytes[i] = ~bytes[i];
    }
    return ANI_TRUE;
}

#endif
