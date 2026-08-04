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

#ifndef ARKTS_ANI_TEST_TC_ARRAYBUFFER_TEST_H
#define ARKTS_ANI_TEST_TC_ARRAYBUFFER_TEST_H
#include "Common.h"
#include <atomic>
#include <cstdint>
#include <iostream>
#include <mutex>
#include <thread>
#include <vector>
namespace ani_tc_arraybuffer {
inline uint8_t *g_savedArrayBufferData = nullptr;
inline size_t g_savedArrayBufferSize = 0;
inline std::mutex g_arrayBufferMutex;
constexpr size_t ARRAYBUFFER_UINT32_SIZE = sizeof(uint32_t);
constexpr size_t ARRAYBUFFER_UNALIGNED_UINT32_MIN_SIZE = sizeof(uint32_t) + 1;
constexpr uint32_t ARRAYBUFFER_MODIFY_UINT32_VALUE = 0x12345678;
constexpr uint8_t ARRAYBUFFER_LARGE_FIRST_VALUE = 0x11;
constexpr uint8_t ARRAYBUFFER_LARGE_LAST_VALUE = 0x22;
constexpr uint8_t ARRAYBUFFER_TYPED_ARRAY_FIRST_VALUE = 0xAB;
constexpr uint8_t ARRAYBUFFER_BYTE_MASK = 0xFF;
inline void CopyBytes(void *dst, const void *src, size_t size)
{
    if (dst == nullptr || src == nullptr) {
        return;
    }
    auto *dstBytes = static_cast<uint8_t *>(dst);
    const auto *srcBytes = static_cast<const uint8_t *>(src);
    for (size_t i = 0; i < size; i++) {
        dstBytes[i] = srcBytes[i];
    }
}
}
ani_int test_ArrayBufferReadUint32(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK ||
        data == nullptr || size < ani_tc_arraybuffer::ARRAYBUFFER_UINT32_SIZE) {
        return -1;
    }
    uint32_t value = 0;
    ani_tc_arraybuffer::CopyBytes(&value, data, sizeof(value));
    return static_cast<ani_int>(value);
}
void test_ArrayBufferModifyUint32(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK ||
        data == nullptr || size < ani_tc_arraybuffer::ARRAYBUFFER_UINT32_SIZE) {
        return;
    }
    uint32_t value = ani_tc_arraybuffer::ARRAYBUFFER_MODIFY_UINT32_VALUE;
    ani_tc_arraybuffer::CopyBytes(data, &value, sizeof(value));
}
ani_int test_ArrayBufferGetSize(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK) {
        return -1;
    }
    return static_cast<ani_int>(size);
}
ani_boolean test_ArrayBufferExpectBuffer(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    ani_status status = env->ArrayBuffer_GetInfo(buffer, &data, &size);
    std::cout << "ArrayBuffer_GetInfo status: " << status << ", size: " << size << std::endl;
    return status == ANI_OK;
}
ani_boolean test_ArrayBufferDetached(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    ani_status status = env->ArrayBuffer_GetInfo(buffer, &data, &size);
    std::cout << "Detached ArrayBuffer_GetInfo status: " << status
              << ", data: " << data << ", size: " << size << std::endl;
    return status != ANI_OK || data == nullptr;
}
ani_int test_ArrayBufferReadRawBytes(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK || data == nullptr) {
        return -1;
    }
    uint8_t *bytes = static_cast<uint8_t *>(data);
    ani_int sum = 0;
    for (size_t i = 0; i < size; i++) {
        sum += bytes[i];
    }
    return sum;
}
ani_boolean test_ArrayBufferModifyByte(ani_env *env, ani_object object, ani_arraybuffer buffer,
    ani_int offset, ani_int value)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK || data == nullptr) {
        return ANI_FALSE;
    }
    if (offset < 0 || static_cast<size_t>(offset) >= size) {
        return ANI_FALSE;
    }
    uint8_t *bytes = static_cast<uint8_t *>(data);
    bytes[offset] = static_cast<uint8_t>(value);
    return ANI_TRUE;
}
ani_boolean test_ArrayBufferWriteWithBoundsCheck(ani_env *env, ani_object object, ani_arraybuffer buffer,
    ani_int offset, ani_int value)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK || data == nullptr) {
        return ANI_FALSE;
    }
    if (offset < 0 || static_cast<size_t>(offset) >= size) {
        return ANI_FALSE;
    }
    static_cast<uint8_t *>(data)[offset] = static_cast<uint8_t>(value);
    return ANI_TRUE;
}
ani_boolean test_ArrayBufferZeroSize(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    ani_status status = env->ArrayBuffer_GetInfo(buffer, &data, &size);
    std::cout << "Zero-size ArrayBuffer status: " << status
              << ", data: " << data << ", size: " << size << std::endl;
    return status == ANI_OK && size == 0;
}
ani_boolean test_ArrayBufferTypedSignature(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    return env->ArrayBuffer_GetInfo(buffer, &data, &size) == ANI_OK;
}
ani_boolean test_ArrayBufferSaveDataPointer(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK || data == nullptr) {
        return ANI_FALSE;
    }
    ani_tc_arraybuffer::g_savedArrayBufferData = static_cast<uint8_t *>(data);
    ani_tc_arraybuffer::g_savedArrayBufferSize = size;
    return ANI_TRUE;
}
ani_int test_ArrayBufferUseSavedPointer(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    if (ani_tc_arraybuffer::g_savedArrayBufferData == nullptr ||
        ani_tc_arraybuffer::g_savedArrayBufferSize == 0) {
        return -1;
    }
    return static_cast<ani_int>(ani_tc_arraybuffer::g_savedArrayBufferData[0]);
}
ani_arraybuffer test_ArrayBufferCreateNative(ani_env *env, ani_object object, ani_int size)
{
    (void)object;
    if (size < 0) {
        return nullptr;
    }
    void *data = nullptr;
    ani_arraybuffer buffer {};
    if (env->CreateArrayBuffer(static_cast<size_t>(size), &data, &buffer) != ANI_OK || data == nullptr) {
        return nullptr;
    }
    uint8_t *bytes = static_cast<uint8_t *>(data);
    for (ani_int i = 0; i < size; i++) {
        bytes[i] = static_cast<uint8_t>(i & ani_tc_arraybuffer::ARRAYBUFFER_BYTE_MASK);
    }
    return buffer;
}
ani_boolean test_ArrayBufferLargeBuffer(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK || data == nullptr) {
        return ANI_FALSE;
    }
    if (size == 0) {
        return ANI_FALSE;
    }
    uint8_t *bytes = static_cast<uint8_t *>(data);
    bytes[0] = ani_tc_arraybuffer::ARRAYBUFFER_LARGE_FIRST_VALUE;
    bytes[size - 1] = ani_tc_arraybuffer::ARRAYBUFFER_LARGE_LAST_VALUE;
    return bytes[0] == ani_tc_arraybuffer::ARRAYBUFFER_LARGE_FIRST_VALUE &&
        bytes[size - 1] == ani_tc_arraybuffer::ARRAYBUFFER_LARGE_LAST_VALUE;
}
ani_int test_ArrayBufferMultiThreadWrite(ani_env *env, ani_object object, ani_arraybuffer buffer,
    ani_int threadCount, ani_int increment)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK ||
        data == nullptr || size < sizeof(int32_t)) {
        return -1;
    }
    auto *counter = reinterpret_cast<std::atomic<int32_t> *>(data);
    counter->store(0);
    std::vector<std::thread> threads;
    for (ani_int i = 0; i < threadCount; i++) {
        threads.emplace_back([counter, increment]() {
            for (ani_int j = 0; j < increment; j++) {
                counter->fetch_add(1);
            }
        });
    }
    for (auto &thread : threads) {
        thread.join();
    }
    return counter->load();
}
ani_boolean test_ArrayBufferFillBytes(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK || data == nullptr) {
        return ANI_FALSE;
    }
    uint8_t *bytes = static_cast<uint8_t *>(data);
    for (size_t i = 0; i < size; i++) {
        bytes[i] = static_cast<uint8_t>(i & ani_tc_arraybuffer::ARRAYBUFFER_BYTE_MASK);
    }
    return ANI_TRUE;
}
ani_boolean test_ArrayBufferModifyTypedArrayBuffer(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK || data == nullptr || size == 0) {
        return ANI_FALSE;
    }
    static_cast<uint8_t *>(data)[0] = ani_tc_arraybuffer::ARRAYBUFFER_TYPED_ARRAY_FIRST_VALUE;
    return ANI_TRUE;
}
ani_boolean test_ArrayBufferEmptyNoCrash(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    ani_status status = env->ArrayBuffer_GetInfo(buffer, &data, &size);
    return status == ANI_OK && size == 0;
}
ani_int test_ArrayBufferReadUnalignedUint32(ani_env *env, ani_object object, ani_arraybuffer buffer)
{
    (void)object;
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(buffer, &data, &size) != ANI_OK ||
        data == nullptr || size < ani_tc_arraybuffer::ARRAYBUFFER_UNALIGNED_UINT32_MIN_SIZE) {
        return -1;
    }
    uint32_t value = 0;
    auto *offsetData = static_cast<uint8_t *>(data) + 1;
    ani_tc_arraybuffer::CopyBytes(&value, offsetData, sizeof(value));
    return static_cast<ani_int>(value);
}
#endif
