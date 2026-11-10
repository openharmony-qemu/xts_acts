/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#ifdef TEST_SHARED_ARRAY_BUFFER
// Must be defined before including jsvm.h to enable experimental JSVM APIs.
#define JSVM_EXPERIMENTAL

#include "jsvmtest.h"

#include <pthread.h>

// test for OH_JSVM_CreateSharedArrayBuffer / OH_JSVM_IsSharedArrayBuffer /
// OH_JSVM_GetSharedArrayBufferInfo
TEST(SharedArrayBufferCreate)
{
    constexpr size_t bufferSize = 64;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    CHECK(data != nullptr);

    bool isSharedArrayBuffer = false;
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, sab, &isSharedArrayBuffer));
    CHECK(isSharedArrayBuffer);

    // a SharedArrayBuffer is not a plain ArrayBuffer
    bool isArrayBuffer = true;
    JSVMTEST_CALL(OH_JSVM_IsArraybuffer(env, sab, &isArrayBuffer));
    CHECK(!isArrayBuffer);

    // the data output parameter is optional
    JSVM_Value sabNoData = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, nullptr, &sabNoData));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, sabNoData, &isSharedArrayBuffer));
    CHECK(isSharedArrayBuffer);

    void *infoData = nullptr;
    size_t byteLength = 0;
    size_t maxByteLength = 0;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, &infoData, &byteLength, &maxByteLength));
    CHECK(infoData == data);
    CHECK(byteLength == bufferSize);
    CHECK(maxByteLength == bufferSize);

    // all info output parameters are optional
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, nullptr, nullptr, nullptr));

    // native memory behind the SharedArrayBuffer is readable and writable
    auto *bytes = static_cast<uint8_t *>(data);
    bytes[0] = 0x2A;
    bytes[bufferSize - 1] = 0x24;
    CHECK(bytes[0] == 0x2A);
    CHECK(bytes[bufferSize - 1] == 0x24);
}

// test for TypedArray / DataView views over a SharedArrayBuffer
TEST(SharedArrayBufferViews)
{
    constexpr size_t bufferSize = 64;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    static_cast<uint8_t *>(data)[0] = 0x2A;

    // typed array over a SharedArrayBuffer
    JSVM_Value typedArray = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateTypedarray(env, JSVM_UINT8_ARRAY, bufferSize, sab, 0, &typedArray));
    bool isTypedArray = false;
    JSVMTEST_CALL(OH_JSVM_IsTypedarray(env, typedArray, &isTypedArray));
    CHECK(isTypedArray);

    JSVM_TypedarrayType type = JSVM_INT8_ARRAY;
    size_t length = 0;
    void *typedArrayData = nullptr;
    JSVM_Value typedArrayBuffer = nullptr;
    size_t byteOffset = 0;
    JSVMTEST_CALL(OH_JSVM_GetTypedarrayInfo(
        env, typedArray, &type, &length, &typedArrayData, &typedArrayBuffer, &byteOffset));
    CHECK(type == JSVM_UINT8_ARRAY);
    CHECK(length == bufferSize);
    CHECK(typedArrayData == data);
    CHECK(byteOffset == 0);
    bool bufferIsShared = false;
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, typedArrayBuffer, &bufferIsShared));
    CHECK(bufferIsShared);

    // typed array with a byte offset into the SharedArrayBuffer
    JSVM_Value offsetArray = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateTypedarray(env, JSVM_UINT16_ARRAY, 4, sab, 8, &offsetArray));
    JSVMTEST_CALL(OH_JSVM_GetTypedarrayInfo(
        env, offsetArray, &type, &length, &typedArrayData, &typedArrayBuffer, &byteOffset));
    CHECK(type == JSVM_UINT16_ARRAY);
    CHECK(length == 4);
    CHECK(static_cast<uint8_t *>(typedArrayData) == static_cast<uint8_t *>(data) + 8);
    CHECK(byteOffset == 8);
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, typedArrayBuffer, &bufferIsShared));
    CHECK(bufferIsShared);

    // out-of-range length throws a RangeError
    JSVM_Value view = nullptr;
    JSVM_Status status = OH_JSVM_CreateTypedarray(env, JSVM_UINT8_ARRAY, bufferSize + 1, sab, 0, &view);
    CHECK(status == JSVM_GENERIC_FAILURE);
    JSVM_Value exception = nullptr;
    CHECK(OH_JSVM_GetAndClearLastException(env, &exception) == JSVM_OK);
    CHECK(exception != nullptr);

    // byteOffset + length beyond the buffer throws a RangeError
    status = OH_JSVM_CreateTypedarray(env, JSVM_UINT8_ARRAY, 1, sab, bufferSize, &view);
    CHECK(status == JSVM_GENERIC_FAILURE);
    CHECK(OH_JSVM_GetAndClearLastException(env, &exception) == JSVM_OK);

    // misaligned byteOffset throws a RangeError
    status = OH_JSVM_CreateTypedarray(env, JSVM_UINT16_ARRAY, 1, sab, 1, &view);
    CHECK(status == JSVM_GENERIC_FAILURE);
    CHECK(OH_JSVM_GetAndClearLastException(env, &exception) == JSVM_OK);

    // data view over a SharedArrayBuffer
    JSVM_Value dataView = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateDataview(env, bufferSize, sab, 0, &dataView));
    bool isDataView = false;
    JSVMTEST_CALL(OH_JSVM_IsDataview(env, dataView, &isDataView));
    CHECK(isDataView);

    size_t dataViewByteLength = 0;
    void *dataViewData = nullptr;
    JSVM_Value dataViewBuffer = nullptr;
    size_t dataViewByteOffset = 0;
    JSVMTEST_CALL(OH_JSVM_GetDataviewInfo(
        env, dataView, &dataViewByteLength, &dataViewData, &dataViewBuffer, &dataViewByteOffset));
    CHECK(dataViewByteLength == bufferSize);
    CHECK(dataViewData == data);
    CHECK(dataViewByteOffset == 0);
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, dataViewBuffer, &bufferIsShared));
    CHECK(bufferIsShared);

    // data view with a byte offset into the SharedArrayBuffer
    JSVMTEST_CALL(OH_JSVM_CreateDataview(env, 8, sab, 8, &dataView));
    JSVMTEST_CALL(OH_JSVM_GetDataviewInfo(
        env, dataView, &dataViewByteLength, &dataViewData, &dataViewBuffer, &dataViewByteOffset));
    CHECK(dataViewByteLength == 8);
    CHECK(static_cast<uint8_t *>(dataViewData) == static_cast<uint8_t *>(data) + 8);
    CHECK(dataViewByteOffset == 8);

    // byteLength beyond the buffer throws a RangeError
    status = OH_JSVM_CreateDataview(env, bufferSize + 1, sab, 0, &view);
    CHECK(status == JSVM_PENDING_EXCEPTION);
    CHECK(OH_JSVM_GetAndClearLastException(env, &exception) == JSVM_OK);

    // byteOffset + byteLength beyond the buffer throws a RangeError
    status = OH_JSVM_CreateDataview(env, 1, sab, bufferSize, &view);
    CHECK(status == JSVM_PENDING_EXCEPTION);
    CHECK(OH_JSVM_GetAndClearLastException(env, &exception) == JSVM_OK);

    // a huge byteOffset must not wrap around in the bounds check
    status = OH_JSVM_CreateDataview(env, 1, sab, SIZE_MAX, &view);
    CHECK(status == JSVM_PENDING_EXCEPTION);
    CHECK(OH_JSVM_GetAndClearLastException(env, &exception) == JSVM_OK);

    // JS sees the same memory through both view kinds
    jsvm::SetProperty(jsvm::Global(), jsvm::Str("sab"), sab);
    jsvm::Run(R"JS(
        const u8 = new Uint8Array(sab);
        if (u8.length !== 64 || u8[0] !== 0x2A) {
            throw new Error('bad Uint8Array over SharedArrayBuffer');
        }
        u8[1] = 0x33;
        const dv = new DataView(sab);
        if (dv.getUint8(0) !== 0x2A || dv.getUint8(1) !== 0x33) {
            throw new Error('bad DataView over SharedArrayBuffer');
        }
        dv.setUint8(2, 0x44);
    )JS");
    CHECK(static_cast<uint8_t *>(data)[1] == 0x33);
    CHECK(static_cast<uint8_t *>(data)[2] == 0x44);
}

// test for OH_JSVM_GetSharedArrayBufferBackingStore / OH_JSVM_RetainBackingStore /
// OH_JSVM_ReleaseBackingStore / OH_JSVM_GetBackingStoreInfo /
// OH_JSVM_CreateSharedArrayBufferFromBackingStore
TEST(SharedArrayBufferBackingStore)
{
    constexpr size_t bufferSize = 64;
    constexpr uint8_t marker = 0x5A;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    static_cast<uint8_t *>(data)[0] = marker;

    JSVM_BackingStore backingStore = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));
    CHECK(backingStore != nullptr);

    void *backingData = nullptr;
    size_t byteLength = 0;
    size_t maxByteLength = 0;
    bool isShared = false;
    bool isResizable = true;
    JSVMTEST_CALL(OH_JSVM_GetBackingStoreInfo(
        backingStore, &backingData, &byteLength, &maxByteLength, &isShared, &isResizable));
    CHECK(backingData == data);
    CHECK(byteLength == bufferSize);
    CHECK(maxByteLength == bufferSize);
    CHECK(isShared);
    CHECK(!isResizable);

    // all info output parameters are optional
    JSVMTEST_CALL(OH_JSVM_GetBackingStoreInfo(backingStore, nullptr, nullptr, nullptr, nullptr, nullptr));

    JSVM_BackingStore retainedStore = nullptr;
    CHECK(OH_JSVM_RetainBackingStore(backingStore, &retainedStore) == JSVM_OK);
    CHECK(retainedStore != nullptr);

    // an independent SharedArrayBuffer sharing the same memory
    JSVM_Value secondSab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBufferFromBackingStore(env, retainedStore, &secondSab));
    bool isSharedArrayBuffer = false;
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, secondSab, &isSharedArrayBuffer));
    CHECK(isSharedArrayBuffer);
    void *secondData = nullptr;
    size_t secondByteLength = 0;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, secondSab, &secondData, &secondByteLength, nullptr));
    CHECK(secondData == data);
    CHECK(secondByteLength == bufferSize);
    CHECK(static_cast<uint8_t *>(secondData)[0] == marker);

    // writes through one view are visible through the other
    static_cast<uint8_t *>(secondData)[1] = 0xC3;
    CHECK(static_cast<uint8_t *>(data)[1] == 0xC3);

    CHECK(OH_JSVM_ReleaseBackingStore(retainedStore) == JSVM_OK);
    CHECK(OH_JSVM_ReleaseBackingStore(backingStore) == JSVM_OK);

    // the source SharedArrayBuffer keeps the memory alive after all native handles are released
    CHECK(static_cast<uint8_t *>(data)[0] == marker);
}

// test for invalid arguments of the SharedArrayBuffer interfaces
TEST(SharedArrayBufferInvalidArgs)
{
    constexpr size_t bufferSize = 16;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));

    JSVM_Value object = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateObject(env, &object));
    void *arrayBufferData = nullptr;
    JSVM_Value arrayBuffer = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateArraybuffer(env, bufferSize, &arrayBufferData, &arrayBuffer));

    // null mandatory output parameters
    CHECK(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, nullptr) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_IsSharedArrayBuffer(env, sab, nullptr) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_IsSharedArrayBuffer(env, nullptr, nullptr) == JSVM_INVALID_ARG);

    // IsSharedArrayBuffer is a predicate: non-SharedArrayBuffer values are not an error
    bool isSharedArrayBuffer = true;
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, object, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, arrayBuffer, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    // SharedArrayBuffer specific interfaces reject plain objects and non-shared ArrayBuffers
    CHECK(OH_JSVM_GetSharedArrayBufferInfo(env, object, nullptr, nullptr, nullptr) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_GetSharedArrayBufferInfo(env, arrayBuffer, nullptr, nullptr, nullptr) == JSVM_INVALID_ARG);
    JSVM_BackingStore backingStore = nullptr;
    CHECK(OH_JSVM_GetSharedArrayBufferBackingStore(env, object, &backingStore) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_GetSharedArrayBufferBackingStore(env, arrayBuffer, &backingStore) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, nullptr) == JSVM_INVALID_ARG);

    // views reject values that are neither ArrayBuffer nor SharedArrayBuffer
    JSVM_Value view = nullptr;
    CHECK(OH_JSVM_CreateTypedarray(env, JSVM_UINT8_ARRAY, 1, object, 0, &view) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_CreateDataview(env, 1, object, 0, &view) == JSVM_INVALID_ARG);

    // a SharedArrayBuffer is not detachable
    CHECK(OH_JSVM_DetachArraybuffer(env, sab) == JSVM_ARRAYBUFFER_EXPECTED);

    // backing store handle interfaces reject null handles and null outputs
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));
    CHECK(OH_JSVM_RetainBackingStore(nullptr, nullptr) == JSVM_INVALID_ARG);
    JSVM_BackingStore retainedStore = nullptr;
    CHECK(OH_JSVM_RetainBackingStore(backingStore, nullptr) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_RetainBackingStore(nullptr, &retainedStore) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_ReleaseBackingStore(nullptr) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_GetBackingStoreInfo(nullptr, nullptr, nullptr, nullptr, nullptr, nullptr) == JSVM_INVALID_ARG);
    JSVM_Value fromStore = nullptr;
    CHECK(OH_JSVM_CreateSharedArrayBufferFromBackingStore(env, backingStore, nullptr) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_CreateSharedArrayBufferFromBackingStore(env, nullptr, &fromStore) == JSVM_INVALID_ARG);

    CHECK(OH_JSVM_ReleaseBackingStore(backingStore) == JSVM_OK);
}

// test that a backing store handle survives the destruction of its source VM
// and can rebuild a SharedArrayBuffer in another VM
TEST(SharedArrayBufferCrossVM)
{
    constexpr size_t bufferSize = 32;
    constexpr uint8_t marker = 0x5A;
    JSVM_BackingStore backingStore = nullptr;
    void *sourceData = nullptr;

    JSVM_VM sourceVm = nullptr;
    JSVM_Env sourceEnv = nullptr;
    JSVM_VMScope sourceVmScope = nullptr;
    JSVM_EnvScope sourceEnvScope = nullptr;
    JSVM_HandleScope sourceHandleScope = nullptr;
    CHECK(OH_JSVM_CreateVM(nullptr, &sourceVm) == JSVM_OK);
    CHECK(OH_JSVM_OpenVMScope(sourceVm, &sourceVmScope) == JSVM_OK);
    CHECK(OH_JSVM_CreateEnv(sourceVm, 0, nullptr, &sourceEnv) == JSVM_OK);
    CHECK(OH_JSVM_OpenEnvScope(sourceEnv, &sourceEnvScope) == JSVM_OK);
    CHECK(OH_JSVM_OpenHandleScope(sourceEnv, &sourceHandleScope) == JSVM_OK);

    JSVM_Value sourceSab = nullptr;
    CHECK(OH_JSVM_CreateSharedArrayBuffer(sourceEnv, bufferSize, &sourceData, &sourceSab) == JSVM_OK);
    CHECK(sourceData != nullptr);
    static_cast<uint8_t *>(sourceData)[0] = marker;
    CHECK(OH_JSVM_GetSharedArrayBufferBackingStore(sourceEnv, sourceSab, &backingStore) == JSVM_OK);
    CHECK(backingStore != nullptr);

    CHECK(OH_JSVM_CloseHandleScope(sourceEnv, sourceHandleScope) == JSVM_OK);
    CHECK(OH_JSVM_CloseEnvScope(sourceEnv, sourceEnvScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyEnv(sourceEnv) == JSVM_OK);
    CHECK(OH_JSVM_CloseVMScope(sourceVm, sourceVmScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyVM(sourceVm) == JSVM_OK);

    // the handle keeps the shared memory alive after the source VM is gone
    void *survivingData = nullptr;
    size_t survivingByteLength = 0;
    bool isShared = false;
    CHECK(OH_JSVM_GetBackingStoreInfo(
              backingStore, &survivingData, &survivingByteLength, nullptr, &isShared, nullptr) == JSVM_OK);
    CHECK(survivingData == sourceData);
    CHECK(survivingByteLength == bufferSize);
    CHECK(isShared);
    CHECK(static_cast<uint8_t *>(survivingData)[0] == marker);

    // rebuild a SharedArrayBuffer from the backing store in another VM
    JSVM_Value targetSab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBufferFromBackingStore(env, backingStore, &targetSab));
    void *targetData = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, targetSab, &targetData, nullptr, nullptr));
    CHECK(targetData == sourceData);
    CHECK(static_cast<uint8_t *>(targetData)[0] == marker);

    // releasing the native handle must not invalidate the target SharedArrayBuffer
    CHECK(OH_JSVM_ReleaseBackingStore(backingStore) == JSVM_OK);
    static_cast<uint8_t *>(targetData)[1] = marker;
    void *targetDataAfterRelease = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, targetSab, &targetDataAfterRelease, nullptr, nullptr));
    CHECK(targetDataAfterRelease == sourceData);
    CHECK(static_cast<uint8_t *>(targetDataAfterRelease)[1] == marker);
}

static JSVM_Value NoopCallback(JSVM_Env env, JSVM_CallbackInfo info)
{
    (void)env;
    (void)info;
    return nullptr;
}

// test that OH_JSVM_IsSharedArrayBuffer rejects every non-SharedArrayBuffer value kind
TEST(SharedArrayBufferTypeChecks)
{
    JSVM_Value value = nullptr;
    bool isSharedArrayBuffer = true;

    // primitive types
    JSVMTEST_CALL(OH_JSVM_CreateInt32(env, 42, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    JSVMTEST_CALL(OH_JSVM_CreateDouble(env, 3.14, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    JSVMTEST_CALL(OH_JSVM_CreateStringUtf8(env, "hello", JSVM_AUTO_LENGTH, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    JSVMTEST_CALL(OH_JSVM_GetBoolean(env, true, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    JSVMTEST_CALL(OH_JSVM_GetNull(env, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    JSVMTEST_CALL(OH_JSVM_GetUndefined(env, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    JSVMTEST_CALL(OH_JSVM_CreateSymbol(env, nullptr, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    JSVMTEST_CALL(OH_JSVM_CreateBigintInt64(env, 42, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    // reference types
    JSVMTEST_CALL(OH_JSVM_CreateArray(env, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);

    static JSVM_CallbackStruct noopCallback = {NoopCallback, nullptr};
    JSVMTEST_CALL(OH_JSVM_CreateFunction(env, "noop", JSVM_AUTO_LENGTH, &noopCallback, &value));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, value, &isSharedArrayBuffer));
    CHECK(!isSharedArrayBuffer);
}

// test that a failed detach leaves the SharedArrayBuffer fully usable
TEST(SharedArrayBufferDetachUsability)
{
    constexpr size_t bufferSize = 64;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));

    CHECK(OH_JSVM_DetachArraybuffer(env, sab) == JSVM_ARRAYBUFFER_EXPECTED);

    bool isSharedArrayBuffer = false;
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, sab, &isSharedArrayBuffer));
    CHECK(isSharedArrayBuffer);

    void *infoData = nullptr;
    size_t byteLength = 0;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, &infoData, &byteLength, nullptr));
    CHECK(infoData == data);
    CHECK(byteLength == bufferSize);

    auto *words = static_cast<uint32_t *>(data);
    words[0] = 0xDEADBEEF;
    CHECK(words[0] == 0xDEADBEEF);
}

// test SharedArrayBuffer creation over boundary sizes
TEST(SharedArrayBufferBoundarySizes)
{
    bool isSharedArrayBuffer = false;
    size_t byteLength = 0;

    // zero length
    JSVM_Value empty = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, 0, nullptr, &empty));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, empty, &isSharedArrayBuffer));
    CHECK(isSharedArrayBuffer);
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, empty, nullptr, &byteLength, nullptr));
    CHECK(byteLength == 0);

    // single byte
    void *singleData = nullptr;
    JSVM_Value single = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, 1, &singleData, &single));
    CHECK(singleData != nullptr);
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, single, nullptr, &byteLength, nullptr));
    CHECK(byteLength == 1);
    static_cast<uint8_t *>(singleData)[0] = 0x42;
    CHECK(static_cast<uint8_t *>(singleData)[0] == 0x42);

    // large buffers stay writable up to their very last bytes
    const size_t largeSizes[] = {8 * 1024 * 1024, 16 * 1024 * 1024};
    for (size_t size : largeSizes) {
        void *data = nullptr;
        JSVM_Value sab = nullptr;
        JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, size, &data, &sab));
        CHECK(data != nullptr);
        JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, nullptr, &byteLength, nullptr));
        CHECK(byteLength == size);
        auto *tail = reinterpret_cast<uint32_t *>(static_cast<uint8_t *>(data) + size - sizeof(uint32_t));
        *tail = 0xCAFEBABE;
        CHECK(*tail == 0xCAFEBABE);
    }

    // an overflowing length fails the allocation without side effects
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    CHECK(OH_JSVM_CreateSharedArrayBuffer(env, SIZE_MAX, &data, &sab) == JSVM_GENERIC_FAILURE);
    CHECK(data == nullptr);
    CHECK(sab == nullptr);

    // an invalid result pointer is rejected before the allocation
    CHECK(OH_JSVM_CreateSharedArrayBuffer(env, SIZE_MAX, &data, nullptr) == JSVM_INVALID_ARG);
}

// test the optional outputs and stability of OH_JSVM_GetSharedArrayBufferInfo
TEST(SharedArrayBufferInfoOptions)
{
    constexpr size_t bufferSize = 64;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));

    // each optional output can be skipped independently
    size_t byteLength = 0;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, nullptr, &byteLength, nullptr));
    CHECK(byteLength == bufferSize);

    void *infoData = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, &infoData, nullptr, nullptr));
    CHECK(infoData == data);
    static_cast<uint8_t *>(infoData)[0] = 0x7E;
    CHECK(static_cast<uint8_t *>(data)[0] == 0x7E);

    // repeated queries return a stable data pointer and byte length
    void *firstData = nullptr;
    size_t firstLength = 0;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, &firstData, &firstLength, nullptr));
    void *secondData = nullptr;
    size_t secondLength = 0;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, &secondData, &secondLength, nullptr));
    CHECK(firstData == secondData);
    CHECK(firstLength == secondLength);
    CHECK(firstLength == bufferSize);
}

// test that several SharedArrayBuffers own independent memory
TEST(SharedArrayBufferMultiple)
{
    void *data1 = nullptr;
    void *data2 = nullptr;
    void *data3 = nullptr;
    JSVM_Value sab1 = nullptr;
    JSVM_Value sab2 = nullptr;
    JSVM_Value sab3 = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, 1, &data1, &sab1));
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, 1024, &data2, &sab2));
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, 4096, &data3, &sab3));
    CHECK(data1 != nullptr);
    CHECK(data2 != nullptr);
    CHECK(data3 != nullptr);
    CHECK(data1 != data2);
    CHECK(data1 != data3);
    CHECK(data2 != data3);

    size_t length1 = 0;
    size_t length2 = 0;
    size_t length3 = 0;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab1, nullptr, &length1, nullptr));
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab2, nullptr, &length2, nullptr));
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab3, nullptr, &length3, nullptr));
    CHECK(length1 == 1);
    CHECK(length2 == 1024);
    CHECK(length3 == 4096);

    // writing to one buffer never affects the others
    static_cast<uint8_t *>(data1)[0] = 0x11;
    static_cast<uint8_t *>(data2)[0] = 0x22;
    static_cast<uint8_t *>(data3)[0] = 0x33;
    CHECK(static_cast<uint8_t *>(data1)[0] == 0x11);
    CHECK(static_cast<uint8_t *>(data2)[0] == 0x22);
    CHECK(static_cast<uint8_t *>(data3)[0] == 0x33);
}

// test that every typed array type can be created over a SharedArrayBuffer
TEST(SharedArrayBufferTypedArrayTypes)
{
    constexpr size_t bufferSize = 80;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));

    struct ViewSpec {
        JSVM_TypedarrayType type;
        size_t length;
    };
    const ViewSpec specs[] = {
        {JSVM_INT8_ARRAY, 80},     {JSVM_UINT8_ARRAY, 80},     {JSVM_INT16_ARRAY, 40},
        {JSVM_UINT16_ARRAY, 40},   {JSVM_INT32_ARRAY, 20},     {JSVM_UINT32_ARRAY, 20},
        {JSVM_FLOAT32_ARRAY, 20},  {JSVM_FLOAT64_ARRAY, 10},   {JSVM_BIGINT64_ARRAY, 10},
        {JSVM_BIGUINT64_ARRAY, 10},
    };
    for (const auto &spec : specs) {
        JSVM_Value view = nullptr;
        JSVMTEST_CALL(OH_JSVM_CreateTypedarray(env, spec.type, spec.length, sab, 0, &view));
        bool isTypedarray = false;
        JSVMTEST_CALL(OH_JSVM_IsTypedarray(env, view, &isTypedarray));
        CHECK(isTypedarray);
        JSVM_TypedarrayType type = JSVM_INT8_ARRAY;
        size_t length = 0;
        void *viewData = nullptr;
        JSVM_Value viewBuffer = nullptr;
        size_t byteOffset = 0;
        JSVMTEST_CALL(OH_JSVM_GetTypedarrayInfo(
            env, view, &type, &length, &viewData, &viewBuffer, &byteOffset));
        CHECK(type == spec.type);
        CHECK(length == spec.length);
        CHECK(viewData == data);
        CHECK(byteOffset == 0);
        bool bufferIsShared = false;
        JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, viewBuffer, &bufferIsShared));
        CHECK(bufferIsShared);
    }
}

// test that typed array and data view creation reject non-buffer values of every kind
TEST(SharedArrayBufferNonBufferViews)
{
    JSVM_Value number = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateInt32(env, 42, &number));
    JSVM_Value string = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateStringUtf8(env, "test", JSVM_AUTO_LENGTH, &string));
    JSVM_Value undefined = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetUndefined(env, &undefined));

    JSVM_Value view = nullptr;
    for (JSVM_Value value : {number, string, undefined}) {
        CHECK(OH_JSVM_CreateTypedarray(env, JSVM_UINT8_ARRAY, 1, value, 0, &view) == JSVM_INVALID_ARG);
        CHECK(OH_JSVM_CreateDataview(env, 1, value, 0, &view) == JSVM_INVALID_ARG);
    }
}

// test data view edge cases over a SharedArrayBuffer
TEST(SharedArrayBufferDataViewEdge)
{
    constexpr size_t bufferSize = 64;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));

    // an empty data view is allowed
    JSVM_Value emptyView = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateDataview(env, 0, sab, 0, &emptyView));
    bool isDataview = false;
    JSVMTEST_CALL(OH_JSVM_IsDataview(env, emptyView, &isDataview));
    CHECK(isDataview);
    size_t viewLength = 999;
    JSVM_Value viewBuffer = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetDataviewInfo(env, emptyView, &viewLength, nullptr, &viewBuffer, nullptr));
    CHECK(viewLength == 0);
    bool bufferIsShared = false;
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, viewBuffer, &bufferIsShared));
    CHECK(bufferIsShared);

    // every optional output of GetDataviewInfo can be skipped independently
    JSVM_Value dataView = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateDataview(env, bufferSize, sab, 0, &dataView));
    JSVMTEST_CALL(OH_JSVM_GetDataviewInfo(env, dataView, &viewLength, nullptr, nullptr, nullptr));
    CHECK(viewLength == bufferSize);
    void *viewData = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetDataviewInfo(env, dataView, nullptr, &viewData, nullptr, nullptr));
    CHECK(viewData == data);
    JSVMTEST_CALL(OH_JSVM_GetDataviewInfo(env, dataView, nullptr, nullptr, &viewBuffer, nullptr));
    JSVMTEST_CALL(OH_JSVM_IsSharedArrayBuffer(env, viewBuffer, &bufferIsShared));
    CHECK(bufferIsShared);

    // JS reads and writes values of several types through a data view over the SharedArrayBuffer
    jsvm::SetProperty(jsvm::Global(), jsvm::Str("sab"), sab);
    JSVM_Value result = jsvm::Run(R"JS(
        const dv = new DataView(sab);
        dv.setFloat32(0, 1.5, true);
        dv.setInt32(4, 42, true);
        dv.setUint8(8, 200);
        `${dv.getFloat32(0, true)}_${dv.getInt32(4, true)}_${dv.getUint8(8)}`
    )JS");
    CHECK(jsvm::ToString(result) == "1.5_42_200");
}

// test that independent Retain handles survive each other's release
TEST(SharedArrayBufferRetainIndependence)
{
    constexpr size_t bufferSize = 64;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    JSVM_BackingStore backingStore = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));

    // every Retain call returns a new independent handle
    JSVM_BackingStore handleA = nullptr;
    JSVM_BackingStore handleB = nullptr;
    JSVM_BackingStore handleC = nullptr;
    JSVMTEST_CALL(OH_JSVM_RetainBackingStore(backingStore, &handleA));
    JSVMTEST_CALL(OH_JSVM_RetainBackingStore(backingStore, &handleB));
    JSVMTEST_CALL(OH_JSVM_RetainBackingStore(backingStore, &handleC));
    CHECK(handleA != nullptr);
    CHECK(handleB != nullptr);
    CHECK(handleC != nullptr);
    CHECK(handleA != handleB);
    CHECK(handleA != handleC);
    CHECK(handleB != handleC);

    // releasing one handle leaves the others untouched
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(handleA));
    void *infoData = nullptr;
    size_t byteLength = 0;
    bool isShared = false;
    for (JSVM_BackingStore store : {backingStore, handleB, handleC}) {
        JSVMTEST_CALL(OH_JSVM_GetBackingStoreInfo(store, &infoData, &byteLength, nullptr, &isShared, nullptr));
        CHECK(infoData == data);
        CHECK(byteLength == bufferSize);
        CHECK(isShared);
    }

    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(handleB));
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(handleC));

    // a released reference can be taken again and still shares the memory
    JSVM_BackingStore retainedAgain = nullptr;
    JSVMTEST_CALL(OH_JSVM_RetainBackingStore(backingStore, &retainedAgain));
    JSVMTEST_CALL(OH_JSVM_GetBackingStoreInfo(retainedAgain, &infoData, &byteLength, nullptr, &isShared, nullptr));
    CHECK(infoData == data);
    CHECK(byteLength == bufferSize);
    CHECK(isShared);
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(retainedAgain));
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(backingStore));
}

// test a Retain/Release stress loop over a large SharedArrayBuffer
TEST(SharedArrayBufferRetainStress)
{
    constexpr size_t bufferSize = 16 * 1024 * 1024;
    constexpr int iterations = 1000;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    JSVM_BackingStore backingStore = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));

    for (int i = 0; i < iterations; i++) {
        JSVM_BackingStore handle = nullptr;
        JSVMTEST_CALL(OH_JSVM_RetainBackingStore(backingStore, &handle));
        JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(handle));
    }

    // the original handle is still valid after the stress loop
    void *infoData = nullptr;
    size_t byteLength = 0;
    JSVMTEST_CALL(OH_JSVM_GetBackingStoreInfo(backingStore, &infoData, &byteLength, nullptr, nullptr, nullptr));
    CHECK(infoData == data);
    CHECK(byteLength == bufferSize);
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(backingStore));
}

// test that backing store handles survive garbage collection of the source SharedArrayBuffer
TEST(SharedArrayBufferGcSurvival)
{
    constexpr size_t bufferSize = 64;
    constexpr uint8_t marker = 0x5A;
    JSVM_BackingStore backingStore = nullptr;
    JSVM_BackingStore retainedStore = nullptr;
    void *data = nullptr;
    {
        jsvm::HandleScope scope(env);
        JSVM_Value sab = nullptr;
        JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
        static_cast<uint8_t *>(data)[0] = marker;
        JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));
        JSVMTEST_CALL(OH_JSVM_RetainBackingStore(backingStore, &retainedStore));
    }

    // drop the last JavaScript reference and force a garbage collection
    jsvm::TryTriggerGC();
    jsvm::TryTriggerGC();

    // both native handles keep the shared memory alive after the collection
    for (JSVM_BackingStore store : {backingStore, retainedStore}) {
        void *infoData = nullptr;
        size_t byteLength = 0;
        bool isShared = false;
        JSVMTEST_CALL(OH_JSVM_GetBackingStoreInfo(store, &infoData, &byteLength, nullptr, &isShared, nullptr));
        CHECK(infoData == data);
        CHECK(byteLength == bufferSize);
        CHECK(isShared);
        CHECK(static_cast<uint8_t *>(infoData)[0] == marker);
        static_cast<uint8_t *>(infoData)[1] = 0xC3;
    }
    CHECK(static_cast<uint8_t *>(data)[1] == 0xC3);

    // the retained handle can still be released after the collection
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(retainedStore));
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(backingStore));
}

// test rebuilding a SharedArrayBuffer in a second environment of the same VM
TEST(SharedArrayBufferSameVMMultiEnv)
{
    constexpr size_t bufferSize = 64;
    constexpr int32_t marker = 0x12345678;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    JSVM_BackingStore backingStore = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));

    JSVM_Env secondEnv = nullptr;
    CHECK(OH_JSVM_CreateEnv(vm, 0, nullptr, &secondEnv) == JSVM_OK);
    JSVM_EnvScope secondEnvScope;
    CHECK(OH_JSVM_OpenEnvScope(secondEnv, &secondEnvScope) == JSVM_OK);
    JSVM_HandleScope secondHandleScope;
    CHECK(OH_JSVM_OpenHandleScope(secondEnv, &secondHandleScope) == JSVM_OK);

    JSVM_Value secondSab = nullptr;
    CHECK(OH_JSVM_CreateSharedArrayBufferFromBackingStore(secondEnv, backingStore, &secondSab) == JSVM_OK);
    bool isSharedArrayBuffer = false;
    CHECK(OH_JSVM_IsSharedArrayBuffer(secondEnv, secondSab, &isSharedArrayBuffer) == JSVM_OK);
    CHECK(isSharedArrayBuffer);

    // typed arrays in both environments share the same memory
    JSVM_Value firstView = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateTypedarray(
        env, JSVM_INT32_ARRAY, bufferSize / sizeof(int32_t), sab, 0, &firstView));
    JSVM_TypedarrayType type = JSVM_INT8_ARRAY;
    size_t length = 0;
    void *firstViewData = nullptr;
    JSVM_Value viewBuffer = nullptr;
    size_t byteOffset = 0;
    JSVMTEST_CALL(OH_JSVM_GetTypedarrayInfo(
        env, firstView, &type, &length, &firstViewData, &viewBuffer, &byteOffset));
    static_cast<int32_t *>(firstViewData)[0] = marker;

    JSVM_Value secondView = nullptr;
    CHECK(OH_JSVM_CreateTypedarray(
        secondEnv, JSVM_INT32_ARRAY, bufferSize / sizeof(int32_t), secondSab, 0, &secondView) == JSVM_OK);
    void *secondViewData = nullptr;
    CHECK(OH_JSVM_GetTypedarrayInfo(
        secondEnv, secondView, &type, &length, &secondViewData, &viewBuffer, &byteOffset) == JSVM_OK);
    CHECK(static_cast<int32_t *>(secondViewData)[0] == marker);

    // native writes on one side are visible through the view on the other side
    static_cast<uint16_t *>(data)[3] = 0xBEEF;
    CHECK(*reinterpret_cast<uint16_t *>(static_cast<uint8_t *>(secondViewData) + 6) == 0xBEEF);

    // both environments expose the very same data pointer
    void *firstData = nullptr;
    void *secondData = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferInfo(env, sab, &firstData, nullptr, nullptr));
    CHECK(OH_JSVM_GetSharedArrayBufferInfo(secondEnv, secondSab, &secondData, nullptr, nullptr) == JSVM_OK);
    CHECK(firstData == secondData);
    CHECK(firstData == data);

    CHECK(OH_JSVM_CloseHandleScope(secondEnv, secondHandleScope) == JSVM_OK);
    CHECK(OH_JSVM_CloseEnvScope(secondEnv, secondEnvScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyEnv(secondEnv) == JSVM_OK);
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(backingStore));
}

struct TargetVmSession {
    JSVM_VM vm = nullptr;
    JSVM_VMScope vmScope = nullptr;
    JSVM_Env env = nullptr;
    JSVM_EnvScope envScope = nullptr;
    JSVM_HandleScope handleScope = nullptr;
    JSVM_Value sab = nullptr;
};

static void OpenTargetVmSession(JSVM_BackingStore backingStore, TargetVmSession &session)
{
    CHECK(OH_JSVM_CreateVM(nullptr, &session.vm) == JSVM_OK);
    CHECK(OH_JSVM_OpenVMScope(session.vm, &session.vmScope) == JSVM_OK);
    CHECK(OH_JSVM_CreateEnv(session.vm, 0, nullptr, &session.env) == JSVM_OK);
    CHECK(OH_JSVM_OpenEnvScope(session.env, &session.envScope) == JSVM_OK);
    CHECK(OH_JSVM_OpenHandleScope(session.env, &session.handleScope) == JSVM_OK);
    CHECK(OH_JSVM_CreateSharedArrayBufferFromBackingStore(session.env, backingStore, &session.sab) == JSVM_OK);
}

static void CloseTargetVmSession(TargetVmSession &session)
{
    CHECK(OH_JSVM_CloseHandleScope(session.env, session.handleScope) == JSVM_OK);
    CHECK(OH_JSVM_CloseEnvScope(session.env, session.envScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyEnv(session.env) == JSVM_OK);
    CHECK(OH_JSVM_CloseVMScope(session.vm, session.vmScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyVM(session.vm) == JSVM_OK);
}

// test that several VMs rebuilt from one backing store share the same memory
// only one VMScope may be active on a thread at a time, so each target VM is
// created, used and destroyed in its own sequential phase
TEST(SharedArrayBufferMultiVM)
{
    constexpr size_t bufferSize = 128;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    JSVM_BackingStore backingStore = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));

    JSVM_TypedarrayType type = JSVM_INT8_ARRAY;
    size_t length = 0;
    void *viewData = nullptr;
    JSVM_Value viewBuffer = nullptr;
    size_t byteOffset = 0;
    JSVM_Value intView = nullptr;
    JSVM_Value floatView = nullptr;
    JSVM_Value bigView = nullptr;

    // the first VM writes an int32 and a bigint64 through its own views
    {
        TargetVmSession first;
        OpenTargetVmSession(backingStore, first);
        void *targetData = nullptr;
        CHECK(OH_JSVM_GetSharedArrayBufferInfo(first.env, first.sab, &targetData, nullptr, nullptr) == JSVM_OK);
        CHECK(targetData == data);
        CHECK(OH_JSVM_CreateTypedarray(
            first.env, JSVM_INT32_ARRAY, bufferSize / sizeof(int32_t), first.sab, 0, &intView) == JSVM_OK);
        CHECK(OH_JSVM_GetTypedarrayInfo(first.env, intView, &type, &length, &viewData, &viewBuffer, &byteOffset)
              == JSVM_OK);
        static_cast<int32_t *>(viewData)[0] = 0x11111111;
        CHECK(OH_JSVM_CreateTypedarray(
            first.env, JSVM_BIGINT64_ARRAY, (bufferSize - 16) / sizeof(int64_t), first.sab, 16, &bigView)
              == JSVM_OK);
        CHECK(OH_JSVM_GetTypedarrayInfo(first.env, bigView, &type, &length, &viewData, &viewBuffer, &byteOffset)
              == JSVM_OK);
        static_cast<int64_t *>(viewData)[0] = static_cast<int64_t>(0x123456789ABCDEF0);
        CloseTargetVmSession(first);
    }

    // the second VM writes an int32 and a float32 through its own views
    {
        TargetVmSession second;
        OpenTargetVmSession(backingStore, second);
        void *targetData = nullptr;
        CHECK(OH_JSVM_GetSharedArrayBufferInfo(second.env, second.sab, &targetData, nullptr, nullptr) == JSVM_OK);
        CHECK(targetData == data);
        CHECK(OH_JSVM_CreateTypedarray(
            second.env, JSVM_INT32_ARRAY, bufferSize / sizeof(int32_t), second.sab, 0, &intView) == JSVM_OK);
        CHECK(OH_JSVM_GetTypedarrayInfo(second.env, intView, &type, &length, &viewData, &viewBuffer, &byteOffset)
              == JSVM_OK);
        static_cast<int32_t *>(viewData)[1] = 0x22222222;
        CHECK(OH_JSVM_CreateTypedarray(
            second.env, JSVM_FLOAT32_ARRAY, (bufferSize - 8) / sizeof(float), second.sab, 8, &floatView)
              == JSVM_OK);
        CHECK(OH_JSVM_GetTypedarrayInfo(second.env, floatView, &type, &length, &viewData, &viewBuffer, &byteOffset)
              == JSVM_OK);
        static_cast<float *>(viewData)[0] = 3.5f;
        CloseTargetVmSession(second);
    }

    // the third VM reads everything through its own views
    {
        TargetVmSession third;
        OpenTargetVmSession(backingStore, third);
        void *targetData = nullptr;
        CHECK(OH_JSVM_GetSharedArrayBufferInfo(third.env, third.sab, &targetData, nullptr, nullptr) == JSVM_OK);
        CHECK(targetData == data);
        CHECK(OH_JSVM_CreateTypedarray(
            third.env, JSVM_INT32_ARRAY, bufferSize / sizeof(int32_t), third.sab, 0, &intView) == JSVM_OK);
        CHECK(OH_JSVM_GetTypedarrayInfo(third.env, intView, &type, &length, &viewData, &viewBuffer, &byteOffset)
              == JSVM_OK);
        CHECK(static_cast<int32_t *>(viewData)[0] == 0x11111111);
        CHECK(static_cast<int32_t *>(viewData)[1] == 0x22222222);
        CHECK(OH_JSVM_CreateTypedarray(
            third.env, JSVM_FLOAT32_ARRAY, (bufferSize - 8) / sizeof(float), third.sab, 8, &floatView)
              == JSVM_OK);
        CHECK(OH_JSVM_GetTypedarrayInfo(third.env, floatView, &type, &length, &viewData, &viewBuffer, &byteOffset)
              == JSVM_OK);
        CHECK(static_cast<float *>(viewData)[0] == 3.5f);
        CHECK(OH_JSVM_CreateTypedarray(
            third.env, JSVM_BIGINT64_ARRAY, (bufferSize - 16) / sizeof(int64_t), third.sab, 16, &bigView)
              == JSVM_OK);
        CHECK(OH_JSVM_GetTypedarrayInfo(third.env, bigView, &type, &length, &viewData, &viewBuffer, &byteOffset)
              == JSVM_OK);
        CHECK(static_cast<int64_t *>(viewData)[0] == static_cast<int64_t>(0x123456789ABCDEF0));
        CloseTargetVmSession(third);
    }

    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(backingStore));
}

// test rebuilding a zero-length SharedArrayBuffer across VMs
TEST(SharedArrayBufferZeroLengthCrossVM)
{
    JSVM_Value emptySab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, 0, nullptr, &emptySab));
    JSVM_BackingStore backingStore = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, emptySab, &backingStore));

    size_t byteLength = 999;
    bool isShared = false;
    JSVMTEST_CALL(OH_JSVM_GetBackingStoreInfo(backingStore, nullptr, &byteLength, nullptr, &isShared, nullptr));
    CHECK(byteLength == 0);
    CHECK(isShared);

    JSVM_VM targetVm = nullptr;
    JSVM_VMScope targetVmScope;
    JSVM_Env targetEnv = nullptr;
    JSVM_EnvScope targetEnvScope;
    JSVM_HandleScope targetHandleScope;
    CHECK(OH_JSVM_CreateVM(nullptr, &targetVm) == JSVM_OK);
    CHECK(OH_JSVM_OpenVMScope(targetVm, &targetVmScope) == JSVM_OK);
    CHECK(OH_JSVM_CreateEnv(targetVm, 0, nullptr, &targetEnv) == JSVM_OK);
    CHECK(OH_JSVM_OpenEnvScope(targetEnv, &targetEnvScope) == JSVM_OK);
    CHECK(OH_JSVM_OpenHandleScope(targetEnv, &targetHandleScope) == JSVM_OK);

    JSVM_Value targetSab = nullptr;
    CHECK(OH_JSVM_CreateSharedArrayBufferFromBackingStore(targetEnv, backingStore, &targetSab) == JSVM_OK);
    bool isSharedArrayBuffer = false;
    CHECK(OH_JSVM_IsSharedArrayBuffer(targetEnv, targetSab, &isSharedArrayBuffer) == JSVM_OK);
    CHECK(isSharedArrayBuffer);
    size_t targetLength = 999;
    CHECK(OH_JSVM_GetSharedArrayBufferInfo(targetEnv, targetSab, nullptr, &targetLength, nullptr) == JSVM_OK);
    CHECK(targetLength == 0);

    CHECK(OH_JSVM_CloseHandleScope(targetEnv, targetHandleScope) == JSVM_OK);
    CHECK(OH_JSVM_CloseEnvScope(targetEnv, targetEnvScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyEnv(targetEnv) == JSVM_OK);
    CHECK(OH_JSVM_CloseVMScope(targetVm, targetVmScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyVM(targetVm) == JSVM_OK);
    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(backingStore));
}

// test a create/destroy loop of many VMs sharing one backing store
TEST(SharedArrayBufferVMTearDownLoop)
{
    constexpr int roundCount = 10;
    constexpr int vmCount = 10;
    constexpr size_t bufferSize = 64;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));
    JSVM_BackingStore backingStore = nullptr;
    JSVMTEST_CALL(OH_JSVM_GetSharedArrayBufferBackingStore(env, sab, &backingStore));

    for (int round = 0; round < roundCount; round++) {
        for (int i = 0; i < vmCount; i++) {
            JSVM_VM loopVm = nullptr;
            CHECK(OH_JSVM_CreateVM(nullptr, &loopVm) == JSVM_OK);
            JSVM_VMScope loopVmScope;
            CHECK(OH_JSVM_OpenVMScope(loopVm, &loopVmScope) == JSVM_OK);
            JSVM_Env loopEnv = nullptr;
            CHECK(OH_JSVM_CreateEnv(loopVm, 0, nullptr, &loopEnv) == JSVM_OK);
            JSVM_EnvScope loopEnvScope;
            CHECK(OH_JSVM_OpenEnvScope(loopEnv, &loopEnvScope) == JSVM_OK);
            JSVM_HandleScope loopHandleScope;
            CHECK(OH_JSVM_OpenHandleScope(loopEnv, &loopHandleScope) == JSVM_OK);

            JSVM_Value loopSab = nullptr;
            CHECK(OH_JSVM_CreateSharedArrayBufferFromBackingStore(loopEnv, backingStore, &loopSab) == JSVM_OK);
            void *loopData = nullptr;
            CHECK(OH_JSVM_GetSharedArrayBufferInfo(loopEnv, loopSab, &loopData, nullptr, nullptr) == JSVM_OK);
            CHECK(loopData == data);
            uint32_t marker = 0x12340000 + round * 100 + i;
            static_cast<uint32_t *>(loopData)[0] = marker;
            CHECK(static_cast<uint32_t *>(data)[0] == marker);

            CHECK(OH_JSVM_CloseHandleScope(loopEnv, loopHandleScope) == JSVM_OK);
            CHECK(OH_JSVM_CloseEnvScope(loopEnv, loopEnvScope) == JSVM_OK);
            CHECK(OH_JSVM_DestroyEnv(loopEnv) == JSVM_OK);
            CHECK(OH_JSVM_CloseVMScope(loopVm, loopVmScope) == JSVM_OK);
            CHECK(OH_JSVM_DestroyVM(loopVm) == JSVM_OK);
        }
    }

    JSVMTEST_CALL(OH_JSVM_ReleaseBackingStore(backingStore));
}

// test that a value from another VM is rejected without crashing
TEST(SharedArrayBufferCrossEnvValueIsolation)
{
    JSVM_Value strValue = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateStringUtf8(env, "hello_cross_vm", JSVM_AUTO_LENGTH, &strValue));

    JSVM_VM secondVm = nullptr;
    JSVM_VMScope secondVmScope;
    JSVM_Env secondEnv = nullptr;
    JSVM_EnvScope secondEnvScope;
    JSVM_HandleScope secondHandleScope;
    CHECK(OH_JSVM_CreateVM(nullptr, &secondVm) == JSVM_OK);
    CHECK(OH_JSVM_OpenVMScope(secondVm, &secondVmScope) == JSVM_OK);
    CHECK(OH_JSVM_CreateEnv(secondVm, 0, nullptr, &secondEnv) == JSVM_OK);
    CHECK(OH_JSVM_OpenEnvScope(secondEnv, &secondEnvScope) == JSVM_OK);
    CHECK(OH_JSVM_OpenHandleScope(secondEnv, &secondHandleScope) == JSVM_OK);

    JSVM_Value view = nullptr;
    CHECK(OH_JSVM_CreateTypedarray(secondEnv, JSVM_UINT8_ARRAY, 1, strValue, 0, &view) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_CreateDataview(secondEnv, 1, strValue, 0, &view) == JSVM_INVALID_ARG);
    CHECK(OH_JSVM_GetSharedArrayBufferInfo(secondEnv, strValue, nullptr, nullptr, nullptr) == JSVM_INVALID_ARG);

    CHECK(OH_JSVM_CloseHandleScope(secondEnv, secondHandleScope) == JSVM_OK);
    CHECK(OH_JSVM_CloseEnvScope(secondEnv, secondEnvScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyEnv(secondEnv) == JSVM_OK);
    CHECK(OH_JSVM_CloseVMScope(secondVm, secondVmScope) == JSVM_OK);
    CHECK(OH_JSVM_DestroyVM(secondVm) == JSVM_OK);
}

struct ConcurrentMemoryContext {
    void *data = nullptr;
    uint32_t start = 0;
    uint32_t count = 0;
    bool decrement = false;
};

static void *WriteMemoryThread(void *arg)
{
    auto *context = static_cast<ConcurrentMemoryContext *>(arg);
    auto *words = static_cast<uint32_t *>(context->data);
    constexpr int iterations = 1000;
    for (int i = 0; i < iterations; i++) {
        for (uint32_t j = 0; j < context->count; j++) {
            words[context->start + j] = context->decrement ? (0xB0000000 - j) : (0xA0000000 + j);
        }
    }
    return nullptr;
}

static void *ReadMemoryThread(void *arg)
{
    auto *context = static_cast<ConcurrentMemoryContext *>(arg);
    auto *words = static_cast<uint32_t *>(context->data);
    constexpr int iterations = 1000;
    volatile uint32_t sink = 0;
    for (int i = 0; i < iterations; i++) {
        for (uint32_t j = 0; j < context->count; j++) {
            sink = words[j];
        }
    }
    (void)sink;
    return nullptr;
}

// test concurrent native reads and writes of SharedArrayBuffer memory
TEST(SharedArrayBufferConcurrentMemory)
{
    constexpr size_t bufferSize = 1024;
    void *data = nullptr;
    JSVM_Value sab = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateSharedArrayBuffer(env, bufferSize, &data, &sab));

    constexpr uint32_t halfWords = bufferSize / sizeof(uint32_t) / 2;
    ConcurrentMemoryContext writerA;
    writerA.data = data;
    writerA.start = 0;
    writerA.count = halfWords;
    writerA.decrement = false;
    ConcurrentMemoryContext writerB;
    writerB.data = data;
    writerB.start = halfWords;
    writerB.count = halfWords;
    writerB.decrement = true;
    ConcurrentMemoryContext reader;
    reader.data = data;
    reader.start = 0;
    reader.count = halfWords * 2;

    pthread_t threads[3];
    CHECK(pthread_create(&threads[0], nullptr, WriteMemoryThread, &writerA) == 0);
    CHECK(pthread_create(&threads[1], nullptr, WriteMemoryThread, &writerB) == 0);
    CHECK(pthread_create(&threads[2], nullptr, ReadMemoryThread, &reader) == 0);
    for (auto &thread : threads) {
        CHECK(pthread_join(thread, nullptr) == 0);
    }

    // after the threads finish, every word holds the value its writer wrote last
    auto *words = static_cast<uint32_t *>(data);
    for (uint32_t j = 0; j < halfWords; j++) {
        CHECK(words[j] == 0xA0000000 + j);
        CHECK(words[halfWords + j] == 0xB0000000 - j);
    }
}

#endif
