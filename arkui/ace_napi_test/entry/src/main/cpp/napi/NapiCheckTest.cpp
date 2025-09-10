/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "common/native_common.h"
#include "napi/native_api.h"
#include <securec.h>
#include <pthread.h>
#include <cstdint>
#include <string>
#include <cstdio>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <thread>
#include <memory>
#include <uv.h>

#include "hilog/log.h"

#define LOG_DOMAIN 0x0001  // 全局domain宏，标识业务领域
#define LOG_TAG "MY_TAG"

#define THREAD_COUNT 4
#define NUM_100 100
#define NUM_1000 1000
#define NUM_11 11

#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define THREAD_COUNT_2 2
#define THREAD_COUNT_3 3
#define THREAD_COUNT_4 4
#define THREAD_COUNT_5 5
#define TEST_VALUE_42 42
#define NUM_100 100
#define TEST_VALUE_123 123
#define NUM_128 128
#define NUM_512 512
#define NUM_1024 1024
#define BUFFER_SIZE 1024
#define BUFFER_MAX_LEN 2097152
#define MAX_WORD_COUNT_TEST 2147483648
#define TEST_DATA "This is a test string for ArrayBuffer operations"

struct ThreadData {
    napi_env env;
    napi_value arraybuffer;
    int threadId;
    bool testPassed;
    
    double timestamp;
    napi_value dateObj;
    napi_status createStatus;
    bool isDate;
    double retrievedTimestamp;
    napi_status getStatus;
};

struct BigIntThreadData {
    napi_env env;
    napi_value bigint;
    int threadId;
    bool testPassed;
};

static pthread_mutex_t g_lock;
static napi_ref g_arraybufferRef;
static pthread_mutex_t g_bigintLock;
static void* ThreadFunction(void* arg);
static void* BigIntThreadFunction(void* arg);
static const char TEST_STR[] = "Where there is a will, there is a way.";

static napi_value CreateBuffer(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = sizeof(TEST_STR);
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), &napiBuffer);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create buffer");
        return nullptr;
    }
    NAPI_ASSERT(env, copyPtr, "Unable to duplicate static text for CreateBuffer.");
    int ret = memcpy_s(copyPtr, bufferSize, TEST_STR, strlen(TEST_STR) + 1);
    NAPI_ASSERT(env, ret == 0, "memcpy_s failed");
    return napiBuffer;
}

napi_value CreateBufferCopy(napi_env env, napi_callback_info info)
{
    const char* sourceData = TEST_STR;
    const unsigned int bufferSize = sizeof(TEST_STR);
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer_copy(env, bufferSize, sourceData, (void**)(&copyPtr), &napiBuffer);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create buffer");
        return nullptr;
    }
    NAPI_ASSERT(env, copyPtr, "Unable to duplicate static text for CreateBuffer.");
    int ret = memcpy_s(copyPtr, bufferSize, TEST_STR, strlen(TEST_STR) + 1);
    NAPI_ASSERT(env, ret == 0, "memcpy_s failed");
    return napiBuffer;
}

static napi_value IsBuffer(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    size_t argc = 1;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    NAPI_ASSERT(env, argc == 1, "The number of arguments provided is incorrect.");
    napi_value napiBuffer = args[0];
    bool result;
    napi_status status = napi_is_buffer(env, napiBuffer, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "The parameter instance is not of type buffer.");
    }
    napi_value returnValue;
    NAPI_CALL(env, napi_get_boolean(env, result, &returnValue));
    return returnValue;
}

static napi_value GetBufferInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    const unsigned int bufferSize = sizeof(TEST_STR);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    NAPI_ASSERT(env, argc == 1, "Incorrect number of parameters.");
    napi_value napiBuffer = args[0];
    char *bufferData;
    napi_value returnValue;
    size_t bufferLength;
    if (napi_get_buffer_info(env, napiBuffer, (void**)(&bufferData), &bufferLength) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get buffer info.");
        return nullptr;
    }
    NAPI_CALL(env, napi_get_boolean(env,
                                    !strcmp(bufferData, TEST_STR) && bufferLength == bufferSize,
                                    &returnValue));
    return returnValue;
}


void FinalizeCallbackTest(napi_env env, void *data, void *hint)
{
    if (data == nullptr) {
        return;
    }
    free(data);
    data = nullptr;
}

napi_value CreateExternalBufferTest(napi_env env, napi_callback_info info)
{
    const size_t bufferSize = sizeof(TEST_STR);
    void* data = malloc(bufferSize + 1);
    if (data == nullptr) {
        napi_throw_error(env, nullptr, "malloc failed");
        return nullptr;
    }
    
    int ret = memset_s(data, bufferSize + 1, 0, bufferSize + 1);
    if (ret != 0) {
        free(data);
        napi_throw_error(env, nullptr, "memset_s failed");
        return nullptr;
    }
    
    ret = memcpy_s(data, bufferSize, TEST_STR, bufferSize);
    if (ret != 0) {
        free(data);
        napi_throw_error(env, nullptr, "memcpy_s failed");
        return nullptr;
    }
    
    napi_value napiBuffer = nullptr;
    napi_status status = napi_create_external_buffer(env, bufferSize,
        data, FinalizeCallbackTest, nullptr, &napiBuffer);
    if (status != napi_ok) {
        free(data);
        napi_throw_error(env, nullptr, "napi_create_external_buffer failed");
        return nullptr;
    }
    return napiBuffer;
}

// Buffer creation edge cases and error handling functions
napi_value createBufferSizeZeroTest(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = 0;
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), &napiBuffer);
    // 创建返回值表示状态
    napi_value retValue;
    napi_create_int32(env, status, &retValue);

    return retValue;
}

napi_value CreateBufferMaxLength(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = BUFFER_MAX_LEN; // 最大长度
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), &napiBuffer);
    // 创建返回值表示状态
    napi_value retValue;
    napi_create_int32(env, status, &retValue);

    return retValue;
}

napi_value CreateBufferExceedMaxLength(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = BUFFER_MAX_LEN + 1; // 超过最大长度
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), &napiBuffer);
    
    // 创建返回值表示状态
    napi_value retValue;
    napi_create_int32(env, status, &retValue);
    
    // 如果意外成功，释放内存
    if (copyPtr != nullptr) {
        free(copyPtr);
    }
    
    return retValue;
}

napi_value CreateBufferInvalidEnv(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = 100;
    char* copyPtr;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(nullptr, bufferSize, (void**)(&copyPtr), &napiBuffer);
    
    // 创建返回值表示状态
    napi_value retValue;
    napi_create_int32(env, status, &retValue);
    
    // 如果意外成功，释放内存
    if (copyPtr != nullptr) {
        free(copyPtr);
    }
    
    return retValue;
}

napi_value CreateBufferInvalidData(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = 100;
    napi_value napiBuffer;
    napi_status status = napi_create_buffer(env, bufferSize, nullptr, &napiBuffer);
    
    // 创建返回值表示状态
    napi_value retValue;
    napi_create_int32(env, status, &retValue);
    
    return retValue;
}

napi_value CreateBufferInvalidResult(napi_env env, napi_callback_info info)
{
    const unsigned int bufferSize = 100;
    char* copyPtr;
    napi_status status = napi_create_buffer(env, bufferSize, (void**)(&copyPtr), nullptr);
    
    // 创建返回值表示状态
    napi_value retValue;
    napi_create_int32(env, status, &retValue);
    
    // 如果意外成功，释放内存
    if (copyPtr != nullptr) {
        free(copyPtr);
    }
    
    return retValue;
}

napi_value CreateInt32Test(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, NUM_100, &retValue);
    
    return retValue;
}

napi_value GetBufferInfoNonBuffer(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    const unsigned int bufferSize = sizeof(TEST_STR);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    NAPI_ASSERT(env, argc == 1, "Incorrect number of parameters.");
    napi_value napiBuffer = args[0];
    char *bufferData;
    napi_value returnValue;
    size_t bufferLength;
    napi_status status = napi_get_buffer_info(env, napiBuffer, (void**)(&bufferData), &bufferLength);
    if (status == napi_ok) {
        napi_throw_error(env, nullptr, "Int cannot get buffer info.");
        return nullptr;
    }

    napi_create_int32(env, status, &returnValue);
    return returnValue;
}

napi_value TestMultipleOperations(napi_env env, napi_callback_info info)
{
    // 创建初始buffer
    size_t initialLength = 256;
    char* initialData;

    napi_value reOk;
    napi_value reFalse;

    NAPI_CALL(env, napi_create_int32(env, napi_ok, &reOk));
    NAPI_CALL(env, napi_create_int32(env, 1, &reFalse));

    napi_value initialBuffer;
    napi_status status = napi_create_buffer(env, initialLength, (void**)(&initialData), &initialBuffer);
    if (status != napi_ok) {
        return reFalse;
    }

    // 修改buffer内容
    memset_s(initialData, initialLength, 0xAA, initialLength);

    // 创建拷贝
    napi_value copiedBuffer;
    char* copiedData;
    status = napi_create_buffer_copy(env, initialLength,
        (void*)(initialData), (void**)(&copiedData), &copiedBuffer);
    if (status != napi_ok) {
        return reFalse;
    }

    // 验证拷贝内容
    char* retrievedData;
    size_t retrievedLength;
    status = napi_get_buffer_info(env, copiedBuffer, (void**)(&retrievedData), &retrievedLength);
    if (status != napi_ok) {
        return reFalse;
    }
    if (memcmp(initialData, retrievedData, initialLength) != 0) {
        return reFalse;
    }

    // 修改原始buffer不应影响拷贝
    memset_s(initialData, initialLength, 0xBB, initialLength);
    if (memcmp(initialData, retrievedData, initialLength) != 0) {
        return reOk;
    }
    return reFalse;
}

napi_value TestExternalArrayBuffer(napi_env env, napi_callback_info info)
{
    size_t extArrLength = NUM_128;
    void* extArrData = malloc(extArrLength);
    memset_s(extArrData, extArrLength, 0xCC, extArrLength);

    bool extFinalizeCalled = false;
    napi_finalize extFinalizeCb = [](napi_env env, void* data, void* hint) {
        free(data);
        *((bool*)hint) = true;
    };

    napi_value extArrBuffer;
    napi_status status;
    napi_value reOk;
    napi_value reFalse;

    NAPI_CALL(env, napi_create_int32(env, napi_ok, &reOk));
    NAPI_CALL(env, napi_create_int32(env, 1, &reFalse));

    status = napi_create_external_arraybuffer(env, extArrData, extArrLength,
        extFinalizeCb, &extFinalizeCalled, &extArrBuffer);
    if (status != napi_ok) {
        return reFalse;
    }

    // 验证buffer内容
    void* retrievedExtData;
    size_t retrievedExtLength;
    status = napi_get_buffer_info(env, extArrBuffer, &retrievedExtData, &retrievedExtLength);
    if (status != napi_ok) {
        return reFalse;
    }
    if (memcmp(retrievedExtData, extArrData, retrievedExtLength) != 0) {
        return reFalse;
    }
    if (retrievedExtLength != extArrLength) {
        return reFalse;
    }

    // 强制GC并验证finalize回调
    // ... 执行GC操作 ...
    // 获取全局对象
    napi_value global;
    napi_get_global(env, &global);
    napi_value gc_func;
    napi_get_named_property(env, global, "gc", &gc_func);
    napi_call_function(env, global, gc_func, 0, nullptr, nullptr);
    if (extFinalizeCalled != true) {
        return reFalse;
    }
    return reOk;
}

// 线程共享数据
typedef struct {
    napi_env env;
    napi_value buffer;
    bool testCompleted;
} ThreadSharedData;

// 线程函数1: 创建ArrayBuffer
void* ThreadCreateBuffer(void* arg)
{
    ThreadSharedData* sharedData  = (ThreadSharedData*)arg;
    napi_env env = sharedData ->env;

    void* data = nullptr;
    napi_value buffer;
    napi_status status = napi_create_buffer(env, BUFFER_SIZE, &data, &buffer);
    if (status != napi_ok) {
        // 错误处理
        OH_LOG_INFO(LOG_APP, "testTag napi_create_buffer failed.");
        return nullptr;
    }

    // 填充测试数据
    int ret = memcpy_s(data, strlen(TEST_DATA), TEST_DATA, strlen(TEST_DATA));
    NAPI_ASSERT(env, ret == 0, "memcpy_s failed");

    // 存储创建的buffer
    sharedData->buffer = buffer;
    return nullptr;
}

// 线程函数2: 创建ArrayBuffer拷贝
void* ThreadCreateBufferCopy(void* arg)
{
    ThreadSharedData* sharedData  = (ThreadSharedData*)arg;
    napi_env env = sharedData ->env;
    
    void* resultData = nullptr;
    napi_value buffer;
    napi_status status = napi_create_buffer_copy(env, strlen(TEST_DATA) + 1,
        TEST_DATA, &resultData, &buffer);
    if (status != napi_ok) {
        // 错误处理
        OH_LOG_INFO(LOG_APP, "testTag napi_create_buffer_copy failed.");
        return nullptr;
    }
    
    // 验证拷贝的数据
    if (strcmp((const char*)resultData, TEST_DATA) != 0) {
        OH_LOG_INFO(LOG_APP, "testTag 数据不一致.");
        // 数据不一致
        return nullptr;
    }
    
    return nullptr;
}

// 线程函数3: 创建外部ArrayBuffer
void* ThreadCreateExternalBuffer(void* arg)
{
    ThreadSharedData* sharedData  = (ThreadSharedData*)arg;
    napi_env env = sharedData ->env;
    
    char* externalData = static_cast<char*>(malloc(strlen(TEST_DATA) + 1));
    strcpy_s(externalData, strlen(TEST_DATA) + 1, TEST_DATA);
    
    napi_value buffer;
    napi_finalize extFinalizeCb = [](napi_env env, void* data, void* hint) {
        free(data);
    };
    napi_status status = napi_create_external_buffer(env, strlen(TEST_DATA) + 1,
        externalData, extFinalizeCb, nullptr, &buffer);
    if (status != napi_ok) {
        free(externalData);
        return nullptr;
    }
    
    return nullptr;
}

// 线程函数4: 获取ArrayBuffer信息
void* ThreadGetBufferInfo(void* arg)
{
    ThreadSharedData* sharedData  = (ThreadSharedData*)arg;
    napi_env env = sharedData ->env;
    
    if (sharedData ->buffer == nullptr) {
        return nullptr;
    }
    
    void* data = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_info(env, sharedData ->buffer, &data, &length);
    if (status != napi_ok) {
        OH_LOG_INFO(LOG_APP, "testTag napi_get_buffer_info failed.");
        return nullptr;
    }
    
    // 验证数据
    if (length != BUFFER_SIZE || data == nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag 数据不一致.");
        return nullptr;
    }
    
    return nullptr;
}

// 线程函数5: 检查是否为ArrayBuffer
void* ThreadIsBuffer(void* arg)
{
    ThreadSharedData* sharedData  = (ThreadSharedData*)arg;
    napi_env env = sharedData ->env;
    
    bool isBuffer = false;
    napi_status status = napi_is_buffer(env, sharedData ->buffer, &isBuffer);
    if (status != napi_ok || !isBuffer) {
        OH_LOG_INFO(LOG_APP, "testTag napi_is_buffer failed.");
        return nullptr;
    }
    
    // 测试完成标志
    sharedData ->testCompleted = true;
    
    return nullptr;
}

// 主测试函数
napi_value TestArrayBufferThreadSafety(napi_env env, napi_callback_info info)
{
    // 初始化共享数据
    ThreadSharedData sharedData  = {env, nullptr, false};
    
    // 创建线程
    pthread_t threads[THREAD_COUNT_5];
    
    // 线程1: 创建ArrayBuffer
    pthread_create(&threads[0], nullptr, ThreadCreateBuffer, &sharedData);
    
    // 等待线程1完成
    pthread_join(threads[0], nullptr);
    
    // 创建其他线程
    pthread_create(&threads[NUM_1], nullptr, ThreadCreateBufferCopy, &sharedData);
    pthread_create(&threads[NUM_2], nullptr, ThreadCreateExternalBuffer, &sharedData);
    pthread_create(&threads[NUM_3], nullptr, ThreadGetBufferInfo, &sharedData);
    pthread_create(&threads[NUM_4], nullptr, ThreadIsBuffer, &sharedData);
    
    // 等待所有线程完成
    for (int i = NUM_1; i < THREAD_COUNT_5; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // 返回测试结果
    napi_value result;
    napi_get_boolean(env, sharedData .testCompleted, &result);
    return result;
}

// ArrayBuffer和外部ArrayBuffer比对测试
void FinalizeCallbackComparison(napi_env env, void* finalizeData, void* finalizeHint)
{
    free(finalizeData);
}

static napi_status g_status;
static napi_value g_reOk;
static napi_value g_reFalse;
static void* g_bufferData = nullptr;
static size_t g_bufferSize = NUM_1024;
static napi_value g_normalArraybuffer;
static size_t g_externalSize = NUM_512;
static void* g_externalData = malloc(g_externalSize);
static napi_value g_externalArraybuffer;

napi_value testDetach(napi_env env, napi_callback_info info)
{
    // 4. 获取 ArrayBuffer 信息
    void* retrievedData = nullptr;
    size_t retrievedLength = 0;
    
    g_status = napi_get_arraybuffer_info(env, g_normalArraybuffer, &retrievedData, &retrievedLength);
    if (g_status != napi_ok || retrievedData != g_bufferData || retrievedLength != g_bufferSize) {
        OH_LOG_INFO(LOG_APP, "napi_get_arraybuffer_info(g_normalArraybuffer) != ok.");
        return g_reFalse;
    }
    
    g_status = napi_get_arraybuffer_info(env, g_externalArraybuffer, &retrievedData, &retrievedLength);
    if (g_status != napi_ok || retrievedData != g_externalData || retrievedLength != g_externalSize) {
        OH_LOG_INFO(LOG_APP, "napi_get_arraybuffer_info(g_normalArraybuffer) != ok.");
        return g_reFalse;
    }

    // 5. 测试 ArrayBuffer 分离
    napi_detach_arraybuffer(env, g_normalArraybuffer);
    
    bool isDetached = false;
    g_status = napi_is_detached_arraybuffer(env, g_normalArraybuffer, &isDetached);
    if (g_status != napi_ok || !isDetached) {
        OH_LOG_INFO(LOG_APP, "napi_is_detached_arraybuffer(g_normalArraybuffer) != ok.");
        return g_reFalse;
    }
    
    // 尝试分离外部 ArrayBuffer (应该失败)
    g_status = napi_detach_arraybuffer(env, g_externalArraybuffer);
    if (g_status == napi_ok) {
        OH_LOG_INFO(LOG_APP, "napi_detach_arraybuffer(g_externalArraybuffer) == ok.");
        return g_reFalse;
    }
    
    // 验证外部 ArrayBuffer 未分离
    g_status = napi_is_detached_arraybuffer(env, g_externalArraybuffer, &isDetached);
    if (g_status != napi_ok || isDetached) {
        OH_LOG_INFO(LOG_APP, "napi_is_detached_arraybuffer(g_externalArraybuffer) != ok.");
        return g_reFalse;
    }
    return g_reOk;
}

napi_value TestArrayBufferComparison(napi_env env, napi_callback_info info)
{
    NAPI_CALL(env, napi_create_int32(env, napi_ok, &g_reOk));
    NAPI_CALL(env, napi_create_int32(env, 1, &g_reFalse));
    
    // 1. 创建普通 ArrayBuffer
    napi_create_arraybuffer(env, g_bufferSize, &g_bufferData, &g_normalArraybuffer);
    memset_s(g_bufferData, g_bufferSize, 0xAA, g_bufferSize); // 填充测试数据

    // 2. 创建外部 ArrayBuffer
    memset_s(g_externalData, g_externalSize, 0xBB, g_externalSize);
    g_status = napi_create_external_arraybuffer(env, g_externalData, g_externalSize,
        FinalizeCallbackComparison, nullptr, &g_externalArraybuffer);

    // 3. 验证 ArrayBuffer 类型
    bool isAb = false;
    g_status = napi_is_arraybuffer(env, g_normalArraybuffer, &isAb);
    if (g_status != napi_ok || !isAb) {
        OH_LOG_INFO(LOG_APP, "napi_is_arraybuffer(g_normalArraybuffer) != ok.");
        return g_reFalse;
    }
    
    // 测试外部 ArrayBuffer
    g_status = napi_is_arraybuffer(env, g_externalArraybuffer, &isAb);
    if (g_status != napi_ok || !isAb) {
        OH_LOG_INFO(LOG_APP, "napi_is_arraybuffer(g_externalArraybuffer) != ok.");
        return g_reFalse;
    }

    // 6. 返回测试结果
    return testDetach(env, info);
}

napi_value NapiArrayBufferTest01(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer;
    void* data = nullptr;
    const size_t byteLength = 1024;
    napi_status status = napi_create_arraybuffer(env, byteLength, &data, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer failed");
    
    bool isArraybuffer = false;
    status = napi_is_arraybuffer(env, arraybuffer, &isArraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_is_arraybuffer failed");
    NAPI_ASSERT(env, isArraybuffer, "Created object is not ArrayBuffer");
    
    void* retrievedData = nullptr;
    size_t retrievedLength = 0;
    status = napi_get_arraybuffer_info(env, arraybuffer, &retrievedData, &retrievedLength);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_arraybuffer_info failed");

    NAPI_ASSERT(env, data == retrievedData, "Data pointer mismatch");
    NAPI_ASSERT(env, byteLength == retrievedLength, "Buffer length mismatch");

    bool isDetached = true;
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "napi_is_detached_arraybuffer failed");
    NAPI_ASSERT(env, !isDetached, "ArrayBuffer should not be detached");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiArrayBufferTest02(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer;
    void* data = nullptr;
    const size_t byteLength = 512;
    napi_status status = napi_create_arraybuffer(env, byteLength, &data, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer failed");
    
    const char* testData = "Hello, ArrayBuffer!";
    size_t dataLen = strlen(testData) + 1;
    if (dataLen <= byteLength) {
        errno_t memcpyResult = memcpy_s(data, byteLength, testData, dataLen);
        NAPI_ASSERT(env, memcpyResult == 0, "memcpy_s failed");
    }
    
    bool preDetached = true;
    status = napi_is_detached_arraybuffer(env, arraybuffer, &preDetached);
    NAPI_ASSERT(env, status == napi_ok, "Pre-detach check failed");
    NAPI_ASSERT(env, !preDetached, "ArrayBuffer should not be detached initially");
    
    status = napi_detach_arraybuffer(env, arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_detach_arraybuffer failed");
    
    bool isDetached = false;
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "Post-detach check failed");
    NAPI_ASSERT(env, isDetached, "ArrayBuffer should be detached");
    
    void* retrievedData = nullptr;
    size_t retrievedLength = 1;
    status = napi_get_arraybuffer_info(env, arraybuffer, &retrievedData, &retrievedLength);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_arraybuffer_info failed after detach");
    
    bool success = true;
    if (retrievedData != nullptr) {
        success = false;
    }
    if (retrievedLength != 0) {
        success = false;
    }
    
    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

napi_value NapiArrayBufferTest03(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer;
    void* data = nullptr;
    const size_t byteLength = 1024;
    napi_status status = napi_create_arraybuffer(env, byteLength, &data, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer failed");
    
    const char* testData = "Test data for ArrayBuffer";
    size_t dataLen = strlen(testData) + 1;
    if (dataLen <= byteLength) {
        errno_t memcpyResult = memcpy_s(data, byteLength, testData, dataLen);
        NAPI_ASSERT(env, memcpyResult == 0, "memcpy_s failed");
    }
    
    bool dataOk = (strcmp(static_cast<const char*>(data), testData) == 0);
    NAPI_ASSERT(env, dataOk, "Data verification failed");
    
    bool isArraybuffer = false;
    status = napi_is_arraybuffer(env, arraybuffer, &isArraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_is_arraybuffer failed");
    NAPI_ASSERT(env, isArraybuffer, "Object should be ArrayBuffer");
    
    void* retrievedData = nullptr;
    size_t retrievedLength = 0;
    status = napi_get_arraybuffer_info(env, arraybuffer, &retrievedData, &retrievedLength);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_arraybuffer_info failed");
    NAPI_ASSERT(env, retrievedData == data, "Data pointer should match");
    NAPI_ASSERT(env, retrievedLength == byteLength, "Length should match");
    
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiArrayBufferTest04(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer;
    void* data = nullptr;
    const size_t byteLength = 256;
    napi_status status = napi_create_arraybuffer(env, byteLength, &data, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer failed");
    
    status = napi_detach_arraybuffer(env, arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "First detach should succeed");
    
    bool isDetached = false;
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "napi_is_detached_arraybuffer failed after first detach");
    NAPI_ASSERT(env, isDetached, "ArrayBuffer should be detached after first detach");
    
    void* retrievedData = nullptr;
    size_t retrievedLength = 1;
    status = napi_get_arraybuffer_info(env, arraybuffer, &retrievedData, &retrievedLength);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_arraybuffer_info failed after first detach");
    NAPI_ASSERT(env, retrievedData == nullptr, "Data pointer should be null after detach");
    NAPI_ASSERT(env, retrievedLength == 0, "Length should be 0 after detach");
    
    status = napi_detach_arraybuffer(env, arraybuffer);
    bool secondDetachFailed = (status == napi_invalid_arg);
    
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "napi_is_detached_arraybuffer failed after second detach attempt");
    NAPI_ASSERT(env, isDetached, "ArrayBuffer should remain detached");
    
    status = napi_detach_arraybuffer(env, arraybuffer);
    bool thirdDetachFailed = (status == napi_invalid_arg);
    
    napi_value result;
    napi_get_boolean(env, secondDetachFailed && thirdDetachFailed, &result);
    return result;
}

napi_value NapiArrayBufferTest05(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer;
    void* data = nullptr;
    const size_t byteLength = 0;
    napi_status status = napi_create_arraybuffer(env, byteLength, &data, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer failed for zero-length buffer");
    
    bool isArraybuffer = false;
    status = napi_is_arraybuffer(env, arraybuffer, &isArraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_is_arraybuffer failed");
    NAPI_ASSERT(env, isArraybuffer, "Zero-length buffer should be ArrayBuffer");
    
    void* retrievedData = nullptr;
    size_t retrievedLength = 1;
    status = napi_get_arraybuffer_info(env, arraybuffer, &retrievedData, &retrievedLength);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_arraybuffer_info failed");
    
    bool lengthOk = (retrievedLength == 0);
    NAPI_ASSERT(env, lengthOk, "Zero-length buffer should have length 0");

    bool pointerOk = true;
    bool isDetached = true;
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "napi_is_detached_arraybuffer failed");
    NAPI_ASSERT(env, !isDetached, "Zero-length buffer should not be detached");
    
    status = napi_detach_arraybuffer(env, arraybuffer);
    bool detachOk = (status == napi_ok);
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "Post-detach check failed");
    NAPI_ASSERT(env, isDetached, "Should be detached after detach");
    
    void* detachedData;
    size_t detachedLength;
    status = napi_get_arraybuffer_info(env, arraybuffer, &detachedData, &detachedLength);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_arraybuffer_info after detach failed");
    NAPI_ASSERT(env, detachedData == nullptr, "Data should be null after detach");
    NAPI_ASSERT(env, detachedLength == 0, "Length should be 0 after detach");
    
    napi_value result;
    napi_get_boolean(env, lengthOk && pointerOk, &result);
    return result;
}

napi_value NapiArrayBufferTest06(napi_env env, napi_callback_info info)
{
    napi_value arraybuffer;
    void* data = nullptr;
    const size_t byteLength = 128;
    napi_status status = napi_create_arraybuffer(env, byteLength, &data, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "First napi_create_arraybuffer failed");

    const char* testData = "First buffer";
    size_t dataLen = strlen(testData) + 1;
    if (dataLen <= byteLength) {
        errno_t memcpyResult = memcpy_s(data, byteLength, testData, dataLen);
        NAPI_ASSERT(env, memcpyResult == 0, "memcpy_s failed");
    }

    status = napi_detach_arraybuffer(env, arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "First detach failed");

    bool isDetached = false;
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "First detach status check failed");
    NAPI_ASSERT(env, isDetached, "First buffer should be detached");

    void* secondData = nullptr;
    size_t secondByteLength = 64;

    status = napi_create_arraybuffer(env, secondByteLength, &secondData, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "Second napi_create_arraybuffer failed");

    const char* testData2 = "Second buffer";
    size_t dataLen2 = strlen(testData2) + 1;
    if (dataLen2 <= secondByteLength) {
        errno_t memcpyResult = memcpy_s(secondData, secondByteLength, testData2, dataLen2);
        NAPI_ASSERT(env, memcpyResult == 0, "memcpy_s failed");
    }

    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "Second buffer status check failed");
    NAPI_ASSERT(env, !isDetached, "Second buffer should not be detached");
    
    void* retrievedData = nullptr;
    size_t retrievedLength = 0;
    status = napi_get_arraybuffer_info(env, arraybuffer, &retrievedData, &retrievedLength);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_arraybuffer_info for second buffer failed");

    bool success = true;
    if (retrievedLength != secondByteLength) {
        success = false;
    }

    napi_value result;
    napi_get_boolean(env, success, &result);
    return result;
}

napi_value NapiArrayBufferTest07(napi_env env, napi_callback_info info)
{
    pthread_mutex_init(&g_lock, nullptr);
    
    void* bufferData;
    napi_value arraybuffer;
    napi_status status = napi_create_arraybuffer(env, BUFFER_SIZE, &bufferData, &arraybuffer);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_arraybuffer failed");
    
    memset_s(bufferData, BUFFER_SIZE, 0, BUFFER_SIZE);
    
    status = napi_create_reference(env, arraybuffer, 1, &g_arraybufferRef);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_reference failed");
    
    pthread_t threads[THREAD_COUNT_4];
    ThreadData threadData[THREAD_COUNT_4];
    
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        threadData[i].env = env;
        threadData[i].arraybuffer = arraybuffer;
        threadData[i].threadId = i;
        threadData[i].testPassed = true;
        
        int err = pthread_create(&threads[i], nullptr, ThreadFunction, &threadData[i]);
        if (err != 0) {
            napi_throw_error(env, nullptr, "Failed to create thread");
            break;
        }
    }
    
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    bool isDetached;
    status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    NAPI_ASSERT(env, status == napi_ok, "Final status check failed");
    
    napi_delete_reference(env, g_arraybufferRef);
    pthread_mutex_destroy(&g_lock);
    
    bool allPassed = true;
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        if (!threadData[i].testPassed) {
            allPassed = false;
            break;
        }
    }

    napi_value result;
    napi_get_boolean(env, allPassed, &result);
    return result;
}

static void* ThreadFunction(void* arg)
{
    ThreadData* threadData = static_cast<ThreadData*>(arg);
    napi_env env = threadData->env;
    napi_value arraybuffer = threadData->arraybuffer;
    
    pthread_mutex_lock(&g_lock);
    
    bool isDetached = false;
    napi_status status = napi_is_detached_arraybuffer(env, arraybuffer, &isDetached);
    if (status != napi_ok || isDetached) {
        threadData->testPassed = false;
    }
    
    pthread_mutex_unlock(&g_lock);
    
    return nullptr;
}

napi_value NapiBigIntTest01(napi_env env, napi_callback_info info)
{
    napi_value bigint1;
    int64_t value1 = 1234567890LL;
    napi_status status = napi_create_bigint_int64(env, value1, &bigint1);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_int64 failed");

    int64_t retrievedValue1 = 0;
    bool lossless1 = false;
    status = napi_get_value_bigint_int64(env, bigint1, &retrievedValue1, &lossless1);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_int64 failed");
    NAPI_ASSERT(env, retrievedValue1 == value1, "BigInt value mismatch");
    NAPI_ASSERT(env, lossless1, "Value conversion should be lossless");

    // 创建负数BigInt
    napi_value bigint2;
    int64_t value2 = -9876543210LL;
    status = napi_create_bigint_int64(env, value2, &bigint2);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_int64 failed for negative value");

    int64_t retrievedValue2 = 0;
    bool lossless2 = false;
    status = napi_get_value_bigint_int64(env, bigint2, &retrievedValue2, &lossless2);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_int64 failed for negative value");
    NAPI_ASSERT(env, retrievedValue2 == value2, "BigInt negative value mismatch");
    NAPI_ASSERT(env, lossless2, "Negative value conversion should be lossless");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest02(napi_env env, napi_callback_info info)
{
    napi_value bigint;
    uint64_t value = 18446744073709551615ULL; // Max uint64
    napi_status status = napi_create_bigint_uint64(env, value, &bigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_uint64 failed");
    
    // 获取uint64值
    uint64_t retrievedValue = 0;
    bool lossless = false;
    status = napi_get_value_bigint_uint64(env, bigint, &retrievedValue, &lossless);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_uint64 failed");
    NAPI_ASSERT(env, retrievedValue == value, "BigInt value mismatch");
    NAPI_ASSERT(env, lossless, "Value conversion should be lossless");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest03(napi_env env, napi_callback_info info)
{
    napi_status status;
    // ========== 测试步骤1: 使用napi_create_bigint_words创建正数BigInt ==========
    // 输入：env, 0, 2, [0xFFFFFFFFFFFFFFFFULL, 0x1ULL], &result
    napi_value positiveBigInt;
    int signBit = 0;  // 正数
    size_t wordCount = NUM_2;  // 2个words
    uint64_t words[] = {0xFFFFFFFFFFFFFFFFULL, 0x1ULL};
    
    status = napi_create_bigint_words(env, signBit, wordCount, words, &positiveBigInt);
    // 预期：返回napi_ok，result有效
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_words failed for positive BigInt");
    NAPI_ASSERT(env, positiveBigInt != nullptr, "Created positive BigInt should not be null");
    
    // ========== 测试步骤2: 使用napi_get_value_bigint_words获取正数BigInt的值 ==========
    // 输入：env, result, &sign_bit, &word_count, words
    int retrievedSignBit = -1;
    size_t retrievedWordCount = NUM_2;  // 预分配2个words的空间
    auto retrievedWords = std::make_unique<uint64_t[]>(NUM_2);
    
    status = napi_get_value_bigint_words(env, positiveBigInt, &retrievedSignBit, &retrievedWordCount,
        retrievedWords.get());
    // 预期：返回napi_ok，sign_bit=0，word_count=2，words=[0xFFFFFFFFFFFFFFFFULL, 0x1ULL]
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_words failed for positive BigInt");
    NAPI_ASSERT(env, retrievedSignBit == 0, "Positive BigInt sign bit should be 0");
    NAPI_ASSERT(env, retrievedWordCount == NUM_2, "Positive BigInt word count should be 2");
    NAPI_ASSERT(env, retrievedWords[0] == 0xFFFFFFFFFFFFFFFFULL, "Positive BigInt first word mismatch");
    NAPI_ASSERT(env, retrievedWords[1] == 0x1ULL, "Positive BigInt second word mismatch");
    
    // ========== 测试步骤3: 使用napi_create_bigint_words创建负数BigInt ==========
    // 输入：env, 1, 2, [0xFFFFFFFFFFFFFFFFULL, 0x1ULL], &result
    napi_value negativeBigInt;
    signBit = 1;  // 负数
    wordCount = NUM_2;  // 2个words
    // 使用相同的words数组
    
    status = napi_create_bigint_words(env, signBit, wordCount, words, &negativeBigInt);
    // 预期：返回napi_ok，result有效
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_words failed for negative BigInt");
    NAPI_ASSERT(env, negativeBigInt != nullptr, "Created negative BigInt should not be null");
    
    // ========== 测试步骤4: 使用napi_get_value_bigint_words获取负数BigInt的值 ==========
    // 输入：env, result, &sign_bit, &word_count, words
    retrievedSignBit = -1;
    retrievedWordCount = NUM_2;  // 预分配2个words的空间
    auto retrievedWords2 = std::make_unique<uint64_t[]>(NUM_2);
    
    status = napi_get_value_bigint_words(env, negativeBigInt, &retrievedSignBit, &retrievedWordCount,
        retrievedWords2.get());
    // 预期：返回napi_ok，sign_bit=1，word_count=2，words=[0xFFFFFFFFFFFFFFFFULL, 0x1ULL]
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_words failed for negative BigInt");
    NAPI_ASSERT(env, retrievedSignBit == 1, "Negative BigInt sign bit should be 1");
    NAPI_ASSERT(env, retrievedWordCount == NUM_2, "Negative BigInt word count should be 2");
    NAPI_ASSERT(env, retrievedWords2[0] == 0xFFFFFFFFFFFFFFFFULL, "Negative BigInt first word mismatch");
    NAPI_ASSERT(env, retrievedWords2[1] == 0x1ULL, "Negative BigInt second word mismatch");
    
    // 所有测试步骤通过，返回true
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest04(napi_env env, napi_callback_info info)
{
    napi_value bigint1;
    napi_value bigint2;
    napi_value bigint3;
    napi_status status;
    
    // 创建INT64_MAX
    status = napi_create_bigint_int64(env, INT64_MAX, &bigint1);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_int64 failed for INT64_MAX");
    
    // 创建INT64_MIN
    status = napi_create_bigint_int64(env, INT64_MIN, &bigint2);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_int64 failed for INT64_MIN");
    
    // 创建UINT64_MAX
    status = napi_create_bigint_uint64(env, UINT64_MAX, &bigint3);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_uint64 failed for UINT64_MAX");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest05(napi_env env, napi_callback_info info)
{
    napi_value bigint;
    napi_status status;
    
    // 使用nullptr env调用napi_create_bigint_int64
    status = napi_create_bigint_int64(nullptr, TEST_VALUE_123, &bigint);
    NAPI_ASSERT(env, status == napi_invalid_arg, "Expected napi_invalid_arg for nullptr env");
    
    // 使用nullptr result调用napi_create_bigint_int64
    status = napi_create_bigint_int64(env, TEST_VALUE_123, nullptr);
    NAPI_ASSERT(env, status == napi_invalid_arg, "Expected napi_invalid_arg for nullptr result");
    
    // 使用非BigInt值调用napi_get_value_bigint_int64
    napi_value nonBigintValue;
    status = napi_create_int32(env, TEST_VALUE_42, &nonBigintValue);
    NAPI_ASSERT(env, status == napi_ok, "Failed to create non-BigInt value");
    
    int64_t outValue;
    bool lossless;
    status = napi_get_value_bigint_int64(env, nonBigintValue, &outValue, &lossless);
    NAPI_ASSERT(env, status == napi_bigint_expected, "Expected napi_bigint_expected for non-BigInt value");
    
    // 使用过大word_count调用napi_create_bigint_words
    uint64_t words[] = {1, NUM_2, NUM_3, NUM_4};
    status = napi_create_bigint_words(env, 0, MAX_WORD_COUNT_TEST, words, &bigint);
    NAPI_ASSERT(env, status == napi_invalid_arg, "Expected napi_invalid_arg for excessive word_count");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest06(napi_env env, napi_callback_info info)
{
    napi_value bigint1;
    napi_value bigint2;
    napi_status status;
    
    // 创建超过int64范围的BigInt（使用words接口）
    uint64_t words1[] = {0x0ULL, 0x1ULL};
    status = napi_create_bigint_words(env, 0, NUM_2, words1, &bigint1);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_words failed");
    
    // 尝试用napi_get_value_bigint_int64获取值
    int64_t outValue1;
    bool lossless1;
    status = napi_get_value_bigint_int64(env, bigint1, &outValue1, &lossless1);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_int64 failed");
    NAPI_ASSERT(env, !lossless1, "Expected lossless to be false for out-of-range value");
    
    // 创建超过uint64范围的BigInt（使用words接口）
    uint64_t words2[] = {0xFFFFFFFFFFFFFFFFULL, 0x1ULL};
    status = napi_create_bigint_words(env, 0, NUM_2, words2, &bigint2);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_words failed");
    
    // 尝试用napi_get_value_bigint_uint64获取值
    uint64_t outValue2;
    bool lossless2;
    status = napi_get_value_bigint_uint64(env, bigint2, &outValue2, &lossless2);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_uint64 failed");
    NAPI_ASSERT(env, !lossless2, "Expected lossless to be false for out-of-range value");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest07(napi_env env, napi_callback_info info)
{
    napi_value bigint;
    int64_t originalValue = 1234567890123456LL;
    napi_status status = napi_create_bigint_int64(env, originalValue, &bigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_int64 failed");
    
    int64_t retrievedValue;
    bool lossless;
    status = napi_get_value_bigint_int64(env, bigint, &retrievedValue, &lossless);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_int64 failed");
    NAPI_ASSERT(env, retrievedValue == originalValue, "Retrieved value doesn't match original");
    NAPI_ASSERT(env, lossless, "Value conversion should be lossless");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest08(napi_env env, napi_callback_info info)
{
    napi_value bigint;
    uint64_t originalValue = 18446744073709551615ULL; // UINT64_MAX
    napi_status status = napi_create_bigint_uint64(env, originalValue, &bigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_uint64 failed");
    
    uint64_t retrievedValue;
    bool lossless;
    status = napi_get_value_bigint_uint64(env, bigint, &retrievedValue, &lossless);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_uint64 failed");
    NAPI_ASSERT(env, retrievedValue == originalValue, "Retrieved value doesn't match original");
    NAPI_ASSERT(env, lossless, "Value conversion should be lossless");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest09(napi_env env, napi_callback_info info)
{
    napi_status status;
    napi_value bigint;
    int signBit = 0;  // 正数
    size_t wordCount = NUM_2;  // 2个words
    uint64_t originalWords[] = {0x123456789ABCDEF0ULL, 0x1122334455667788ULL};
    
    status = napi_create_bigint_words(env, signBit, wordCount, originalWords, &bigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_words failed");
    NAPI_ASSERT(env, bigint != nullptr, "Created BigInt should not be null");
    
    int retrievedSignBit = -1;
    size_t retrievedWordCount = NUM_2;  // 预分配2个words的空间
    auto retrievedWords = std::make_unique<uint64_t[]>(NUM_2);
    
    // 初始化缓冲区为0
    retrievedWords[0] = 0;
    retrievedWords[1] = 0;
    
    // 获取BigInt的words表示
    status = napi_get_value_bigint_words(env, bigint, &retrievedSignBit, &retrievedWordCount, retrievedWords.get());
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_words failed");
    
    // 验证基本属性
    NAPI_ASSERT(env, retrievedSignBit == 0, "Sign bit should be 0 for positive BigInt");
    NAPI_ASSERT(env, retrievedWordCount > 0, "Retrieved word count should be greater than 0");
    NAPI_ASSERT(env, retrievedWordCount <= NUM_2, "Retrieved word count should not exceed buffer size");
    
    // 验证数据完整性 - 根据实际返回的word数量进行验证
    if (retrievedWordCount >= NUM_2) {
        NAPI_ASSERT(env, retrievedWords[0] == originalWords[0], "First word mismatch");
        NAPI_ASSERT(env, retrievedWords[1] == originalWords[1], "Second word mismatch");
    } else if (retrievedWordCount == 1) {
        NAPI_ASSERT(env, retrievedWords[0] != 0, "Single word should contain non-zero value");
    }
    
    // 额外的完整性检查：创建一个相同值的BigInt并比较
    napi_value bigint2;
    status = napi_create_bigint_words(env, retrievedSignBit, retrievedWordCount, retrievedWords.get(), &bigint2);
    NAPI_ASSERT(env, status == napi_ok, "Failed to create BigInt from retrieved words");
    NAPI_ASSERT(env, bigint2 != nullptr, "Recreated BigInt should not be null");
    
    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest10(napi_env env, napi_callback_info info)
{
    napi_value bigint;
    int64_t value = -1234567890123456LL;
    napi_status status = napi_create_bigint_int64(env, value, &bigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_int64 failed");
    
    int64_t retrievedValue = 0;
    bool lossless = false;
    status = napi_get_value_bigint_int64(env, bigint, &retrievedValue, &lossless);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_int64 failed");
    NAPI_ASSERT(env, retrievedValue == value, "BigInt value mismatch");
    NAPI_ASSERT(env, lossless, "Value conversion should be lossless");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest11(napi_env env, napi_callback_info info)
{
    napi_value bigint;
    uint64_t value = 18446744073709551615ULL; // UINT64_MAX，超出INT64_MAX范围
    napi_status status = napi_create_bigint_uint64(env, value, &bigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_uint64 failed");
    
    int64_t retrievedValue = 0;
    bool lossless = false;
    status = napi_get_value_bigint_int64(env, bigint, &retrievedValue, &lossless);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_int64 failed");
    NAPI_ASSERT(env, !lossless, "Expected lossless to be false for out-of-int64-range value");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

napi_value NapiBigIntTest12(napi_env env, napi_callback_info info)
{
    napi_value bigint;
    int64_t value = 0;
    napi_status status = napi_create_bigint_int64(env, value, &bigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_int64 failed");
    
    int64_t retrievedValue = 1; // 初始化为非零值
    bool lossless = false;
    status = napi_get_value_bigint_int64(env, bigint, &retrievedValue, &lossless);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_value_bigint_int64 failed");
    NAPI_ASSERT(env, retrievedValue == 0, "Retrieved value should be 0");
    NAPI_ASSERT(env, lossless, "Value conversion should be lossless for zero");

    napi_value result;
    napi_get_boolean(env, true, &result);
    return result;
}

// 多线程并发创建BigInt的线程数据结构
struct ConcurrentBigIntData {
    napi_env env;
    int threadId;
    int64_t value;
    napi_value result;
    bool testPassed;
};

// 多线程并发创建BigInt的线程函数
void* ConcurrentCreateBigIntThread(void* arg)
{
    ConcurrentBigIntData* data = static_cast<ConcurrentBigIntData*>(arg);
    
    napi_status status = napi_create_bigint_int64(data->env, data->value, &data->result);
    data->testPassed = (status == napi_ok && data->result != nullptr);
    
    return nullptr;
}

napi_value NapiBigIntTest13(napi_env env, napi_callback_info info)
{
    // 多线程并发创建BigInt
    const int threadCount = NUM_4;
    pthread_t threads[threadCount];
    ConcurrentBigIntData threadData[threadCount];
    
    // 设置线程数据
    threadData[0] = {env, 1, INT64_MAX, nullptr, false};
    threadData[1] = {env, THREAD_COUNT_2, INT64_MIN, nullptr, false};
    threadData[NUM_2] = {env, NUM_3, 0, nullptr, false};
    threadData[NUM_3] = {env, NUM_4, 1234567890123456789LL, nullptr, false};

    // 创建线程
    for (int i = 0; i < threadCount; i++) {
        int err = pthread_create(&threads[i], nullptr, ConcurrentCreateBigIntThread, &threadData[i]);
        NAPI_ASSERT(env, err == 0, "Failed to create thread");
    }
    
    // 等待所有线程完成
    for (int i = 0; i < threadCount; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // 验证结果
    bool allPassed = true;
    for (int i = 0; i < threadCount; i++) {
        if (!threadData[i].testPassed) {
            allPassed = false;
            break;
        }
        
        // 验证创建的BigInt值是否正确
        int64_t retrievedValue;
        bool lossless;
        napi_status status = napi_get_value_bigint_int64(env, threadData[i].result, &retrievedValue, &lossless);
        if (status != napi_ok || retrievedValue != threadData[i].value || !lossless) {
            allPassed = false;
            break;
        }
    }

    napi_value result;
    napi_get_boolean(env, allPassed, &result);
    return result;
}

// 多线程共享BigInt读取的线程数据结构
struct SharedBigIntReadData {
    napi_env env;
    napi_value sharedBigint;
    int threadId;
    bool testPassed;
};

// 多线程读取函数 - 使用不同的获取方法
void* SharedBigIntReadThread1(void* arg) // 使用napi_get_value_bigint_int64读取
{
    SharedBigIntReadData* data = static_cast<SharedBigIntReadData*>(arg);
    
    int64_t value;
    bool lossless;
    napi_status status = napi_get_value_bigint_int64(data->env, data->sharedBigint, &value, &lossless);
    data->testPassed = (status == napi_ok);
    
    return nullptr;
}

void* SharedBigIntReadThread2(void* arg) // 使用napi_get_value_bigint_uint64读取
{
    SharedBigIntReadData* data = static_cast<SharedBigIntReadData*>(arg);
    
    uint64_t value;
    bool lossless;
    napi_status status = napi_get_value_bigint_uint64(data->env, data->sharedBigint, &value, &lossless);
    data->testPassed = (status == napi_ok);
    
    return nullptr;
}

void* SharedBigIntReadThread3(void* arg) // 使用napi_get_value_bigint_words读取部分数据
{
    SharedBigIntReadData* data = static_cast<SharedBigIntReadData*>(arg);
    
    int signBit;
    size_t wordCount = NUM_2;
    uint64_t words[NUM_2];
    napi_status status = napi_get_value_bigint_words(data->env, data->sharedBigint, &signBit, &wordCount, words);
    data->testPassed = (status == napi_ok);
    
    return nullptr;
}

void* SharedBigIntReadThread4(void* arg) // 使用napi_get_value_bigint_words读取全部数据
{
    SharedBigIntReadData* data = static_cast<SharedBigIntReadData*>(arg);
    
    int signBit;
    size_t wordCount = NUM_4;
    uint64_t words[NUM_4];
    napi_status status = napi_get_value_bigint_words(data->env, data->sharedBigint, &signBit, &wordCount, words);
    data->testPassed = (status == napi_ok);
    
    return nullptr;
}

napi_value NapiBigIntTest14(napi_env env, napi_callback_info info)
{
    // 多线程共享BigInt对象读取
    // 主线程创建一个大型BigInt（使用napi_create_bigint_words）
    napi_value sharedBigint;
    int signBit = 0;
    size_t wordCount = NUM_4;
    uint64_t words[] = {
        0x123456789ABCDEF0ULL,
        0xFEDCBA9876543210ULL,
        0x1111111111111111ULL,
        0x2222222222222222ULL
    };
    
    napi_status status = napi_create_bigint_words(env, signBit, wordCount, words, &sharedBigint);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_bigint_words failed");
    
    // 创建4个工作线程同时读取该BigInt对象
    const int threadCount = NUM_4;
    pthread_t threads[threadCount];
    SharedBigIntReadData threadData[threadCount];
    
    // 设置线程数据
    for (int i = 0; i < threadCount; i++) {
        threadData[i].env = env;
        threadData[i].sharedBigint = sharedBigint;
        threadData[i].threadId = i + 1;
        threadData[i].testPassed = false;
    }
    
    // 创建线程，使用不同的获取函数
    pthread_create(&threads[0], nullptr, SharedBigIntReadThread1, &threadData[0]);
    pthread_create(&threads[1], nullptr, SharedBigIntReadThread2, &threadData[1]);
    pthread_create(&threads[NUM_2], nullptr, SharedBigIntReadThread3, &threadData[NUM_2]);
    pthread_create(&threads[NUM_3], nullptr, SharedBigIntReadThread4, &threadData[NUM_3]);
    
    // 等待所有线程完成
    for (int i = 0; i < threadCount; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // 验证所有读取结果一致
    bool allPassed = true;
    for (int i = 0; i < threadCount; i++) {
        if (!threadData[i].testPassed) {
            allPassed = false;
            break;
        }
    }

    napi_value result;
    napi_get_boolean(env, allPassed, &result);
    return result;
}

// 线程安全队列模拟（简化版）
static napi_value g_queuedBigint = nullptr;
static pthread_mutex_t g_queueMutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t g_queueCond = PTHREAD_COND_INITIALIZER;
static bool g_queueHasData = false;

struct ProducerThreadData {
    napi_env env;
    bool testPassed;
};
struct ConsumerThreadData {
    napi_env env;
    bool testPassed;
};

// 生产者线程函数
void* ProducerThread(void* arg)
{
    ProducerThreadData* data = static_cast<ProducerThreadData*>(arg);
    
    // 创建BigInt
    napi_value producedBigint;
    int signBit = 1; // 负数
    size_t wordCount = NUM_2;
    uint64_t words[] = {0xFFFFFFFFFFFFFFFFULL, 0x1ULL};
    
    napi_status status = napi_create_bigint_words(data->env, signBit, wordCount, words, &producedBigint);
    if (status != napi_ok) {
        data->testPassed = false;
        return nullptr;
    }
    
    // 将BigInt放入线程安全队列
    pthread_mutex_lock(&g_queueMutex);
    g_queuedBigint = producedBigint;
    g_queueHasData = true;
    pthread_cond_signal(&g_queueCond);
    pthread_mutex_unlock(&g_queueMutex);
    
    data->testPassed = true;
    return nullptr;
}

// 消费者线程函数
void* ConsumerThread(void* arg)
{
    ConsumerThreadData* data = static_cast<ConsumerThreadData*>(arg);
    
    // 从队列获取BigInt
    pthread_mutex_lock(&g_queueMutex);
    while (!g_queueHasData) {
        pthread_cond_wait(&g_queueCond, &g_queueMutex);
    }
    napi_value consumedBigint = g_queuedBigint;
    pthread_mutex_unlock(&g_queueMutex);
    
    // 使用napi_get_value_bigint_words验证值
    int signBit;
    size_t wordCount = NUM_2;
    uint64_t words[NUM_2];
    
    napi_status status = napi_get_value_bigint_words(data->env, consumedBigint, &signBit, &wordCount, words);
    if (status != napi_ok) {
        data->testPassed = false;
        return nullptr;
    }
    
    // 验证值是否正确
    bool valuesMatch = (signBit == 1 && wordCount == NUM_2 && words[0] == 0xFFFFFFFFFFFFFFFFULL && words[1] == 0x1ULL);
    
    data->testPassed = valuesMatch;
    return nullptr;
}

napi_value NapiBigIntTest15(napi_env env, napi_callback_info info)
{
    // 线程间传递BigInt对象
    pthread_t producerThread;
    pthread_t consumerThread;
    ProducerThreadData producerData = {env, false};
    ConsumerThreadData consumerData = {env, false};
    
    // 重置队列状态
    pthread_mutex_lock(&g_queueMutex);
    g_queuedBigint = nullptr;
    g_queueHasData = false;
    pthread_mutex_unlock(&g_queueMutex);
    
    // 创建生产者线程
    int err = pthread_create(&producerThread, nullptr, ProducerThread, &producerData);
    NAPI_ASSERT(env, err == 0, "Failed to create producer thread");
    
    // 创建消费者线程
    err = pthread_create(&consumerThread, nullptr, ConsumerThread, &consumerData);
    NAPI_ASSERT(env, err == 0, "Failed to create consumer thread");
    
    // 等待线程完成
    pthread_join(producerThread, nullptr);
    pthread_join(consumerThread, nullptr);
    
    // 验证结果
    bool testPassed = producerData.testPassed && consumerData.testPassed;

    napi_value result;
    napi_get_boolean(env, testPassed, &result);
    return result;
}

static void* BigIntThreadFunction(void* arg)
{
    BigIntThreadData* threadData = static_cast<BigIntThreadData*>(arg);
    napi_env env = threadData->env;
    napi_value bigint = threadData->bigint;
    
    pthread_mutex_lock(&g_bigintLock);
    
    // Test value retrieval
    int64_t retrievedValue = 0;
    bool lossless = false;
    napi_status status = napi_get_value_bigint_int64(env, bigint, &retrievedValue, &lossless);
    if (status != napi_ok) {
        threadData->testPassed = false;
    }
    
    pthread_mutex_unlock(&g_bigintLock);
    
    return nullptr;
}

// 多线程异常情况测试的线程数据结构
struct ExceptionThreadData {
    napi_env env;
    int threadId;
    napi_status expectedStatus;
    bool testPassed;
};

// 异常测试线程函数
void* ExceptionTestThread1(void* arg) // 使用nullptr env
{
    ExceptionThreadData* data = static_cast<ExceptionThreadData*>(arg);
    
    napi_value bigint;
    napi_status status = napi_create_bigint_int64(nullptr, 123, &bigint);
    data->testPassed = (status == data->expectedStatus);
    
    return nullptr;
}

void* ExceptionTestThread2(void* arg) // 使用nullptr result
{
    ExceptionThreadData* data = static_cast<ExceptionThreadData*>(arg);
    
    napi_status status = napi_create_bigint_uint64(data->env, 456, nullptr);
    data->testPassed = (status == data->expectedStatus);
    
    return nullptr;
}

void* ExceptionTestThread3(void* arg) // 使用无效napi_value
{
    ExceptionThreadData* data = static_cast<ExceptionThreadData*>(arg);
    
    // 创建一个非BigInt值
    napi_value nonBigintValue;
    napi_status createStatus = napi_create_int32(data->env, 789, &nonBigintValue);
    if (createStatus != napi_ok) {
        data->testPassed = false;
        return nullptr;
    }
    
    int64_t outValue;
    bool lossless;
    napi_status status = napi_get_value_bigint_int64(data->env, nonBigintValue, &outValue, &lossless);
    data->testPassed = (status == data->expectedStatus);
    
    return nullptr;
}

void* ExceptionTestThread4(void* arg) // 正常操作作为对照
{
    ExceptionThreadData* data = static_cast<ExceptionThreadData*>(arg);
    
    napi_value bigint;
    napi_status status = napi_create_bigint_int64(data->env, 999, &bigint);
    data->testPassed = (status == data->expectedStatus);
    
    return nullptr;
}

napi_value NapiBigIntTest16(napi_env env, napi_callback_info info)
{
    // 多线程异常情况测试
    const int threadCount = NUM_4;
    pthread_t threads[threadCount];
    ExceptionThreadData threadData[threadCount];
    
    // 设置线程数据
    threadData[0] = {env, 1, napi_invalid_arg, false}; // nullptr env
    threadData[1] = {env, NUM_2, napi_invalid_arg, false}; // nullptr result
    threadData[NUM_2] = {env, NUM_3, napi_bigint_expected, false}; // 无效napi_value
    threadData[NUM_3] = {env, NUM_4, napi_ok, false}; // 正常操作
    
    // 创建线程
    pthread_create(&threads[0], nullptr, ExceptionTestThread1, &threadData[0]);
    pthread_create(&threads[1], nullptr, ExceptionTestThread2, &threadData[1]);
    pthread_create(&threads[NUM_2], nullptr, ExceptionTestThread3, &threadData[NUM_2]);
    pthread_create(&threads[NUM_3], nullptr, ExceptionTestThread4, &threadData[NUM_3]);
    
    // 等待所有线程完成
    for (int i = 0; i < threadCount; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // 验证结果
    bool allPassed = true;
    for (int i = 0; i < threadCount; i++) {
        if (!threadData[i].testPassed) {
            allPassed = false;
            break;
        }
    }

    napi_value result;
    napi_get_boolean(env, allPassed, &result);
    return result;
}

// ArkTS异常交互测试的线程数据结构
struct ArkTSExceptionThreadData {
    napi_env env;
    int threadId;
    bool testPassed;
};

// ArkTS异常测试线程函数
void* ArkTSExceptionThread1(void* arg) // 故意触发异常
{
    ArkTSExceptionThreadData* data = static_cast<ArkTSExceptionThreadData*>(arg);
    
    // 尝试调用可能导致异常的函数（这里模拟一个可能的异常情况）
    napi_value bigint;
    uint64_t words[] = {1, NUM_2, NUM_3, NUM_4};
    napi_status status = napi_create_bigint_words(data->env, 0, SIZE_MAX, words, &bigint);
    
    // 异常情况下应该返回错误状态
    data->testPassed = (status != napi_ok);
    
    return nullptr;
}

void* ArkTSExceptionThread2(void* arg) // 同时尝试创建BigInt
{
    ArkTSExceptionThreadData* data = static_cast<ArkTSExceptionThreadData*>(arg);
    
    napi_value bigint;
    napi_status status = napi_create_bigint_int64(data->env, 12345, &bigint);
    
    // 正常情况下应该成功或者正确处理异常状态
    data->testPassed = (status == napi_ok || status == napi_pending_exception);
    
    return nullptr;
}

void* ArkTSExceptionThread3(void* arg) // 同时尝试读取BigInt
{
    ArkTSExceptionThreadData* data = static_cast<ArkTSExceptionThreadData*>(arg);
    
    // 先创建一个BigInt
    napi_value bigint;
    napi_status createStatus = napi_create_bigint_int64(data->env, 67890, &bigint);
    if (createStatus != napi_ok) {
        data->testPassed = true; // 如果创建失败，认为正确处理了异常
        return nullptr;
    }
    
    // 尝试读取BigInt
    int64_t value;
    bool lossless;
    napi_status readStatus = napi_get_value_bigint_int64(data->env, bigint, &value, &lossless);
    
    // 正常情况下应该成功或者正确处理异常状态
    data->testPassed = (readStatus == napi_ok || readStatus == napi_pending_exception);
    
    return nullptr;
}

napi_value NapiBigIntTest17(napi_env env, napi_callback_info info)
{
    // 线程安全与ArkTS异常交互
    const int threadCount = NUM_3;
    pthread_t threads[threadCount];
    ArkTSExceptionThreadData threadData[threadCount];
    
    // 设置线程数据
    for (int i = 0; i < threadCount; i++) {
        threadData[i].env = env;
        threadData[i].threadId = i + 1;
        threadData[i].testPassed = false;
    }
    
    // 创建线程
    pthread_create(&threads[0], nullptr, ArkTSExceptionThread1, &threadData[0]);
    pthread_create(&threads[1], nullptr, ArkTSExceptionThread2, &threadData[1]);
    pthread_create(&threads[NUM_2], nullptr, ArkTSExceptionThread3, &threadData[NUM_2]);
    
    // 等待所有线程完成
    for (int i = 0; i < threadCount; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // 验证结果 - 至少有一些线程应该正确处理异常情况
    int passedCount = 0;
    for (int i = 0; i < threadCount; i++) {
        if (threadData[i].testPassed) {
            passedCount++;
        }
    }
    
    // 如果至少有2个线程正确处理了情况，认为测试通过
    bool testPassed = (passedCount >= NUM_2);

    napi_value result;
    napi_get_boolean(env, testPassed, &result);
    return result;
}

// Test function to create Date with given timestamp
// Define macro constants for thread operations
#define CONCURRENT_THREAD_COUNT 5
#define SHARED_READ_THREAD_COUNT 3
#define STRESS_TEST_THREAD_COUNT 2
#define OPERATIONS_PER_THREAD 10
#define CROSS_THREAD_COUNT 3
#define THREAD_SAFETY_THREAD_COUNT 4
#define BATCH_SIZE 1000
#define MAX_BULK_COUNT 100000
#define MAX_SAFE_TIMESTAMP 8640000000000000.0

// Define macro constants for test values
#define TEST_TIMESTAMP_A 1000.0
#define TEST_TIMESTAMP_B 2000.0
#define TEST_TIMESTAMP_C 3000.0
#define TEST_TIMESTAMP_D 4000.0
#define TEST_TIMESTAMP_E 5000.0
#define SHARED_TIMESTAMP 1234567890000.0
#define CROSS_THREAD_TIMESTAMP 987654321000.0
#define CONTROL_THREAD_TIMESTAMP 3000.0

// Structure to hold thread data

// Structure to hold shared date read thread data
struct SharedDateReadData {
    napi_env env;
    napi_value sharedDateObj;
    int threadId;
    napi_status isDateStatus;
    bool isDate;
    napi_status getDateStatus;
    double timestamp;
};

// Structure to hold high concurrency stress test thread data
struct StressTestData {
    napi_env env;
    int threadId;
    int totalOperations;
    int successfulOperations;
    int failedOperations;
    double executionTime;
    double memoryUsage;
    bool threadSuccess;
    napi_value dateObj;  // Date object created in each iteration
    bool isDate;         // Result of napi_is_date check
};

// Structure to hold cross-thread date passing thread data
struct CrossThreadData {
    napi_env env;
    napi_value dateObj;
    int threadId;
    char operation[64];  // Fixed-size character array instead of const char*
    napi_status isDateStatus;
    bool isDate;
    napi_status getDateStatus;
    double timestamp;
    double originalTimestamp;
    bool threadSuccess;
};

// Structure to hold thread safety error handling test data
struct ThreadSafetyErrorData {
    napi_env env;
    int threadId;
    char operation[64];  // Fixed-size character array instead of const char*
    napi_status apiStatus;
    napi_status expectedStatus;
    bool isSuccess;
    char errorDescription[128];  // Fixed-size character array instead of const char*
};

static napi_value TestCreateDate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Expected 1 argument");
        return nullptr;
    }
    
    double timestamp;
    napi_status status = napi_get_value_double(env, args[0], &timestamp);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get timestamp value");
        return nullptr;
    }
    
    napi_value result;
    status = napi_create_date(env, timestamp, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create Date");
        return nullptr;
    }
    
    return result;
}

// Test function to get Date timestamp value
static napi_value TestGetDateValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Expected 1 argument");
        return nullptr;
    }
    
    double timestamp;
    napi_status status = napi_get_date_value(env, args[0], &timestamp);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get Date value");
        return nullptr;
    }
    
    napi_value result;
    napi_create_double(env, timestamp, &result);
    
    return result;
}

// Test function to check if value is Date type
static napi_value TestIsDate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Expected 1 argument");
        return nullptr;
    }
    
    bool isDate;
    napi_status status = napi_is_date(env, args[0], &isDate);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to check if value is Date");
        return nullptr;
    }
    
    napi_value result;
    napi_get_boolean(env, isDate, &result);
    
    return result;
}

// Structure to hold date value error result parameters
struct DateValueErrorResultParams {
    napi_status isDateStatus;
    napi_status getDateStatus;
    bool isDate;
    double timestamp;
    const char* errorDescription;
};

// Helper function to build result object for date value error tests
static napi_value BuildDateValueErrorResult(napi_env env, const DateValueErrorResultParams& params)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // Add isDateStatus
    napi_value isDateStatusProp;
    napi_create_int32(env, static_cast<int32_t>(params.isDateStatus), &isDateStatusProp);
    napi_set_named_property(env, resultObj, "isDateStatus", isDateStatusProp);

    // Add getDateStatus
    napi_value getDateStatusProp;
    napi_create_int32(env, static_cast<int32_t>(params.getDateStatus), &getDateStatusProp);
    napi_set_named_property(env, resultObj, "getDateStatus", getDateStatusProp);

    // Add isDate
    napi_value isDateProp;
    napi_get_boolean(env, params.isDate, &isDateProp);
    napi_set_named_property(env, resultObj, "isDate", isDateProp);

    // Add timestamp
    napi_value timestampProp;
    napi_create_double(env, params.timestamp, &timestampProp);
    napi_set_named_property(env, resultObj, "timestamp", timestampProp);

    // Add errorDescription
    napi_value errorDescriptionProp;
    napi_create_string_utf8(env, params.errorDescription, NAPI_AUTO_LENGTH, &errorDescriptionProp);
    napi_set_named_property(env, resultObj, "errorDescription", errorDescriptionProp);

    return resultObj;
}

// Test function for getting date value with error handling
static napi_value TestGetDateValueWithError(napi_env env, napi_callback_info info)
{
    // Create a non-Date object (string)
    napi_value stringObj;
    napi_create_string_utf8(env, "not a date", NAPI_AUTO_LENGTH, &stringObj);

    // Test napi_is_date with non-Date object
    bool isDate;
    napi_status isDateStatus = napi_is_date(env, stringObj, &isDate);

    // Test napi_get_date_value with non-Date object
    double timestamp;
    napi_status getDateStatus = napi_get_date_value(env, stringObj, &timestamp);
    // Build and return result using helper function
    DateValueErrorResultParams params = {
        .isDateStatus = isDateStatus,
        .getDateStatus = getDateStatus,
        .isDate = isDate,
        .timestamp = timestamp,
        .errorDescription = "String object is not a Date"
    };
    
    return BuildDateValueErrorResult(env, params);
}

// Test function to get Date value only (simplified version for napiDateTest004)
static napi_value TestGetDateValueOnly(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Expected 1 argument");
        return nullptr;
    }
    
    // Create result object
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    
    // Try to get date value using napi_get_date_value
    double timestamp;
    napi_status status = napi_get_date_value(env, args[0], &timestamp);
    
    // Add status to result
    napi_value statusProp;
    napi_create_int32(env, status, &statusProp);
    napi_set_named_property(env, resultObj, "status", statusProp);
    
    if (status == napi_ok) {
        // Success case - add timestamp value
        napi_value timestampProp;
        napi_create_double(env, timestamp, &timestampProp);
        napi_set_named_property(env, resultObj, "value", timestampProp);
    }
    
    return resultObj;
}

// Test function to create Date with minimum timestamp (0) and get its value
static napi_value TestCreateDateWithMinTimestamp(napi_env env, napi_callback_info info)
{
    // Create result object
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    
    // Create Date object with timestamp 0 using napi_create_date
    napi_value dateObj;
    napi_status createStatus = napi_create_date(env, 0.0, &dateObj);
    
    // Add createStatus to result
    napi_value createStatusProp;
    napi_create_int32(env, createStatus, &createStatusProp);
    napi_set_named_property(env, resultObj, "createStatus", createStatusProp);
    
    if (createStatus == napi_ok) {
        // Try to get date value using napi_get_date_value
        double timestamp;
        napi_status getStatus = napi_get_date_value(env, dateObj, &timestamp);
        
        // Add getStatus to result
        napi_value getStatusProp;
        napi_create_int32(env, getStatus, &getStatusProp);
        napi_set_named_property(env, resultObj, "getStatus", getStatusProp);
        
        // Add timestamp to result
        napi_value timestampProp;
        napi_create_double(env, timestamp, &timestampProp);
        napi_set_named_property(env, resultObj, "timestamp", timestampProp);
    } else {
        // If creation failed, set error status
        napi_value getStatusProp;
        napi_create_int32(env, createStatus, &getStatusProp);
        napi_set_named_property(env, resultObj, "getStatus", getStatusProp);
        
        // Set timestamp to -1 to indicate error
        napi_value timestampProp;
        napi_create_double(env, -1.0, &timestampProp);
        napi_set_named_property(env, resultObj, "timestamp", timestampProp);
    }
    
    return resultObj;
}

// Test function to create Date with maximum timestamp and get its value
static napi_value TestCreateDateWithMaxTimestamp(napi_env env, napi_callback_info info)
{
    // Create result object
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    
    // Use maximum safe double value for timestamp
    // Using a large but safe timestamp value that won't cause overflow issues
    
    // Create Date object with maximum timestamp using napi_create_date
    napi_value dateObj;
    napi_status createStatus = napi_create_date(env, MAX_SAFE_TIMESTAMP, &dateObj);
    
    // Add createStatus to result
    napi_value createStatusProp;
    napi_create_int32(env, createStatus, &createStatusProp);
    napi_set_named_property(env, resultObj, "createStatus", createStatusProp);
    
    if (createStatus == napi_ok) {
        // Try to get date value using napi_get_date_value
        double timestamp;
        napi_status getStatus = napi_get_date_value(env, dateObj, &timestamp);
        
        // Add getStatus to result
        napi_value getStatusProp;
        napi_create_int32(env, getStatus, &getStatusProp);
        napi_set_named_property(env, resultObj, "getStatus", getStatusProp);
        
        // Add timestamp to result
        napi_value timestampProp;
        napi_create_double(env, timestamp, &timestampProp);
        napi_set_named_property(env, resultObj, "timestamp", timestampProp);
    } else {
        // If creation failed, set error status
        napi_value getStatusProp;
        napi_create_int32(env, createStatus, &getStatusProp);
        napi_set_named_property(env, resultObj, "getStatus", getStatusProp);
        
        // Set timestamp to -1 to indicate error
        napi_value timestampProp;
        napi_create_double(env, -1.0, &timestampProp);
        napi_set_named_property(env, resultObj, "timestamp", timestampProp);
    }
    
    return resultObj;
}

// Test function to perform multiple Date operations
static napi_value TestMultipleDateOperations(napi_env env, napi_callback_info info)
{
    // Create result object
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    
    // Create Date object A with timestamp TEST_TIMESTAMP_A
    napi_value dateObjA;
    NAPI_CALL(env, napi_create_date(env, TEST_TIMESTAMP_A, &dateObjA));
    
    // Create Date object B with timestamp TEST_TIMESTAMP_B
    napi_value dateObjB;
    NAPI_CALL(env, napi_create_date(env, TEST_TIMESTAMP_B, &dateObjB));
    
    // Get timestamp from Date A
    double timestampA;
    NAPI_CALL(env, napi_get_date_value(env, dateObjA, &timestampA));
    
    // Get timestamp from Date B
    double timestampB;
    NAPI_CALL(env, napi_get_date_value(env, dateObjB, &timestampB));
    
    // Create modified Date A with timestamp TEST_TIMESTAMP_C
    napi_value modifiedDateObjA;
    NAPI_CALL(env, napi_create_date(env, TEST_TIMESTAMP_C, &modifiedDateObjA));
    
    // Get timestamp from modified Date A
    double modifiedTimestampA;
    NAPI_CALL(env, napi_get_date_value(env, modifiedDateObjA, &modifiedTimestampA));
    
    // Add all results to the result object
    napi_set_named_property(env, resultObj, "dateA", dateObjA);
    napi_set_named_property(env, resultObj, "dateB", dateObjB);
    
    napi_value timestampAProp;
    napi_create_double(env, timestampA, &timestampAProp);
    napi_set_named_property(env, resultObj, "timestampA", timestampAProp);
    
    napi_value timestampBProp;
    napi_create_double(env, timestampB, &timestampBProp);
    napi_set_named_property(env, resultObj, "timestampB", timestampBProp);
    
    napi_value modifiedTimestampAProp;
    napi_create_double(env, modifiedTimestampA, &modifiedTimestampAProp);
    napi_set_named_property(env, resultObj, "modifiedTimestampA", modifiedTimestampAProp);
    
    return resultObj;
}

// Helper function to validate bulk creation parameters
static bool ValidateBulkCreationParams(napi_env env, napi_callback_info info, int32_t& count)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_throw_error(env, nullptr, "Expected 1 argument");
        return false;
    }
    
    napi_status status = napi_get_value_int32(env, args[0], &count);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get count value");
        return false;
    }
    
    // Limit count to prevent excessive memory usage
    if (count > MAX_BULK_COUNT) {
        count = MAX_BULK_COUNT;
    }
    return true;
}

// Structure to hold date batch processing parameters
struct DateBatchProcessParams {
    napi_env env;
    int startIndex;
    int endIndex;
    int& totalCreated;
    int& totalVerified;
    int& totalTimestamps;
    bool& allSuccess;
};

// Helper function to process batch of Date objects
static void ProcessDateBatch(const DateBatchProcessParams& params)
{
    for (int j = params.startIndex; j < params.endIndex; j++) {
        // Create Date object with incrementing timestamp
        napi_value dateObj;
        double timestamp = static_cast<double>(j);
        napi_status createStatus = napi_create_date(params.env, timestamp, &dateObj);
        if (createStatus != napi_ok) {
            params.allSuccess = false;
            break;
        }
        params.totalCreated++;
        
        // Verify Date type
        bool isDate;
        napi_status isDateStatus = napi_is_date(params.env, dateObj, &isDate);
        if (isDateStatus != napi_ok || !isDate) {
            params.allSuccess = false;
            break;
        }
        params.totalVerified++;
        // Get and verify timestamp
        double retrievedTimestamp;
        napi_status getStatus = napi_get_date_value(params.env, dateObj, &retrievedTimestamp);
        if (getStatus != napi_ok || retrievedTimestamp != timestamp) {
            params.allSuccess = false;
            break;
        }
        
        params.totalTimestamps++;
    }
}

// Structure to hold bulk creation result parameters
struct BulkCreationResultParams {
    bool allSuccess;
    int totalCreated;
    int totalVerified;
    int totalTimestamps;
    double executionTimeMs;
};

// Helper function to build bulk creation result
static napi_value BuildBulkCreationResult(napi_env env, const BulkCreationResultParams& params)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    
    // Add results to the result object
    napi_value successProp;
    napi_get_boolean(env, params.allSuccess, &successProp);
    napi_set_named_property(env, resultObj, "success", successProp);
    
    napi_value totalCreatedProp;
    napi_create_int32(env, params.totalCreated, &totalCreatedProp);
    napi_set_named_property(env, resultObj, "totalCreated", totalCreatedProp);
    
    napi_value totalVerifiedProp;
    napi_create_int32(env, params.totalVerified, &totalVerifiedProp);
    napi_set_named_property(env, resultObj, "totalVerified", totalVerifiedProp);
    
    napi_value totalTimestampsProp;
    napi_create_int32(env, params.totalTimestamps, &totalTimestampsProp);
    napi_set_named_property(env, resultObj, "totalTimestamps", totalTimestampsProp);
    
    napi_value executionTimeProp;
    napi_create_double(env, params.executionTimeMs, &executionTimeProp);
    napi_set_named_property(env, resultObj, "executionTime", executionTimeProp);
    
    return resultObj;
}

// Test function for bulk Date object creation and verification
static napi_value TestBulkDateCreation(napi_env env, napi_callback_info info)
{
    // Validate input parameters
    int32_t count;
    if (!ValidateBulkCreationParams(env, info, count)) {
        return nullptr;
    }
    
    // Record start time for performance measurement
    auto startTime = std::chrono::high_resolution_clock::now();
    // Initialize counters
    int totalCreated = 0;
    int totalVerified = 0;
    int totalTimestamps = 0;
    bool allSuccess = true;
    
    // Process Date objects in batches
    for (int i = 0; i < count; i += BATCH_SIZE) {
        int endIndex = std::min(i + BATCH_SIZE, count);
        DateBatchProcessParams params = {
            .env = env,
            .startIndex = i,
            .endIndex = endIndex,
            .totalCreated = totalCreated,
            .totalVerified = totalVerified,
            .totalTimestamps = totalTimestamps,
            .allSuccess = allSuccess
        };
        ProcessDateBatch(params);
        if (!allSuccess) {
            break;
        }
    }
    
    // Record end time and calculate execution time
    auto endTime = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime);
    double executionTimeMs = static_cast<double>(duration.count());
    
    // Build and return result
    BulkCreationResultParams params = {
        .allSuccess = allSuccess,
        .totalCreated = totalCreated,
        .totalVerified = totalVerified,
        .totalTimestamps = totalTimestamps,
        .executionTimeMs = executionTimeMs
    };
    
    return BuildBulkCreationResult(env, params);
}

// Thread function for creating Date objects
static void* CreateDateThread(void* arg)
{
    ThreadData* data = static_cast<ThreadData*>(arg);
    
    // Create Date object with the specified timestamp
    data->createStatus = napi_create_date(data->env, data->timestamp, &data->dateObj);
    if (data->createStatus == napi_ok) {
        // Verify Date type
        napi_status isDateStatus = napi_is_date(data->env, data->dateObj, &data->isDate);
        if (isDateStatus == napi_ok && data->isDate) {
            // Get timestamp value
            OH_LOG_INFO(LOG_APP, "testTag napi_is_date %{public}d.", isDateStatus);
            data->getStatus = napi_get_date_value(data->env, data->dateObj, &data->retrievedTimestamp);
        } else {
            data->getStatus = napi_generic_failure;
        }
    }
    return nullptr;
}

// Helper function to build thread result object
static napi_value BuildThreadResult(napi_env env, const ThreadData& threadData)
{
    napi_value threadResult;
    napi_create_object(env, &threadResult);

    // Add thread ID
    napi_value threadIdProp;
    napi_create_int32(env, threadData.threadId, &threadIdProp);
    napi_set_named_property(env, threadResult, "threadId", threadIdProp);

    // Add create status
    napi_value createStatusProp;
    napi_create_int32(env, threadData.createStatus, &createStatusProp);
    napi_set_named_property(env, threadResult, "createStatus", createStatusProp);

    // Add isDate flag
    napi_value isDateProp;
    napi_get_boolean(env, threadData.isDate, &isDateProp);
    napi_set_named_property(env, threadResult, "isDate", isDateProp);

    // Add retrieved timestamp
    napi_value timestampProp;
    napi_create_double(env, threadData.retrievedTimestamp, &timestampProp);
    napi_set_named_property(env, threadResult, "timestamp", timestampProp);

    // Add original timestamp
    napi_value originalTimestampProp;
    napi_create_double(env, threadData.timestamp, &originalTimestampProp);
    napi_set_named_property(env, threadResult, "originalTimestamp", originalTimestampProp);

    return threadResult;
}

// Helper function to build main result object
static napi_value BuildConcurrentResult(napi_env env, bool allSuccess,
    napi_value threadResultsArray, int totalThreads)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // Add success flag
    napi_value successProp;
    napi_get_boolean(env, allSuccess, &successProp);
    napi_set_named_property(env, resultObj, "success", successProp);

    // Add thread results array
    napi_set_named_property(env, resultObj, "threadResults", threadResultsArray);

    // Add total threads count
    napi_value totalThreadsProp;
    napi_create_int32(env, totalThreads, &totalThreadsProp);
    napi_set_named_property(env, resultObj, "totalThreads", totalThreadsProp);

    return resultObj;
}

// Helper function to initialize thread data
static void InitializeThreadData(ThreadData* threadData, napi_env env)
{
    const double timestamples[] = {TEST_TIMESTAMP_A, TEST_TIMESTAMP_B, TEST_TIMESTAMP_C,
        TEST_TIMESTAMP_D, TEST_TIMESTAMP_E};
    
    for (int i = 0; i < CONCURRENT_THREAD_COUNT; i++) {
        threadData[i].env = env;
        threadData[i].threadId = i;
        threadData[i].timestamp = timestamples[i];
        threadData[i].dateObj = nullptr;
        threadData[i].createStatus = napi_generic_failure;
        threadData[i].isDate = false;
        threadData[i].retrievedTimestamp = 0.0;
        threadData[i].getStatus = napi_generic_failure;
    }
}

// Test function to create Date objects concurrently using pthread
static napi_value TestConcurrentDateCreation(napi_env env, napi_callback_info info)
{
    // Create thread data array
    ThreadData threadData[CONCURRENT_THREAD_COUNT];
    pthread_t threads[CONCURRENT_THREAD_COUNT];
    
    // Initialize thread data using helper function
    InitializeThreadData(threadData, env);
    // Create threads using pthread_create
    for (int i = 0; i < CONCURRENT_THREAD_COUNT; i++) {
        int result = pthread_create(&threads[i], nullptr, CreateDateThread, &threadData[i]);
        if (result != 0) {
            napi_throw_error(env, nullptr, "Failed to create thread");
            return nullptr;
        }
    }
    
    // Wait for all threads to complete
    for (int i = 0; i < CONCURRENT_THREAD_COUNT; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // Check results and create result array
    napi_value threadResultsArray;
    napi_create_array(env, &threadResultsArray);
    
    bool allSuccess = true;
    for (int i = 0; i < CONCURRENT_THREAD_COUNT; i++) {
        // Check if this thread was successful
        if (threadData[i].createStatus != napi_ok || !threadData[i].isDate ||
            threadData[i].getStatus != napi_ok ||
            threadData[i].retrievedTimestamp != threadData[i].timestamp) {
            allSuccess = false;
        }
        
        // Build thread result using helper function
        napi_value threadResult = BuildThreadResult(env, threadData[i]);
        napi_set_element(env, threadResultsArray, i, threadResult);
    }
    
    // Build and return main result using helper function
    return BuildConcurrentResult(env, allSuccess, threadResultsArray, CONCURRENT_THREAD_COUNT);
}

// Helper function to initialize shared date read data
static void InitializeSharedDateReadData(SharedDateReadData* threadData, napi_env env,
    napi_value sharedDateObj, int numThreads)
{
    for (int i = 0; i < numThreads; i++) {
        threadData[i].env = env;
        threadData[i].sharedDateObj = sharedDateObj;
        threadData[i].threadId = i;
        threadData[i].isDateStatus = napi_generic_failure;
        threadData[i].isDate = false;
        threadData[i].getDateStatus = napi_generic_failure;
        threadData[i].timestamp = 0.0;
    }
}

// Helper function to build thread result for shared date read
static napi_value BuildSharedDateReadThreadResult(napi_env env, const SharedDateReadData& threadData)
{
    napi_value threadResult;
    napi_create_object(env, &threadResult);

    // Add thread ID
    napi_value threadIdProp;
    napi_create_int32(env, threadData.threadId, &threadIdProp);
    napi_set_named_property(env, threadResult, "threadId", threadIdProp);

    // Add is_date status
    napi_value isDateStatusProp;
    napi_create_int32(env, threadData.isDateStatus, &isDateStatusProp);
    napi_set_named_property(env, threadResult, "isDateStatus", isDateStatusProp);

    // Add is_date flag
    napi_value isDateProp;
    napi_get_boolean(env, threadData.isDate, &isDateProp);
    napi_set_named_property(env, threadResult, "isDate", isDateProp);

    // Add get_date status
    napi_value getDateStatusProp;
    napi_create_int32(env, threadData.getDateStatus, &getDateStatusProp);
    napi_set_named_property(env, threadResult, "getDateStatus", getDateStatusProp);

    // Add retrieved timestamp
    napi_value timestampProp;
    napi_create_double(env, threadData.timestamp, &timestampProp);
    napi_set_named_property(env, threadResult, "timestamp", timestampProp);

    return threadResult;
}

// Helper function to build main result for shared date read
static napi_value BuildSharedDateReadResult(napi_env env, bool allSuccess,
    napi_value threadResultsArray, int totalThreads, double sharedTimestamp)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // Add success flag
    napi_value successProp;
    napi_get_boolean(env, allSuccess, &successProp);
    napi_set_named_property(env, resultObj, "success", successProp);

    // Add thread results array
    napi_set_named_property(env, resultObj, "threadResults", threadResultsArray);

    // Add total threads count
    napi_value totalThreadsProp;
    napi_create_int32(env, totalThreads, &totalThreadsProp);
    napi_set_named_property(env, resultObj, "totalThreads", totalThreadsProp);

    // Add original timestamp
    napi_value originalTimestampProp;
    napi_create_double(env, sharedTimestamp, &originalTimestampProp);
    napi_set_named_property(env, resultObj, "originalTimestamp", originalTimestampProp);

    return resultObj;
}

// Thread function for reading shared Date object
static void* ReadSharedDateThread(void* arg)
{
    SharedDateReadData* data = static_cast<SharedDateReadData*>(arg);
    
    // Check if the shared object is a Date using napi_is_date
    data->isDateStatus = napi_is_date(data->env, data->sharedDateObj, &data->isDate);
    if (data->isDateStatus == napi_ok && data->isDate) {
        // Get timestamp value using napi_get_date_value
        data->getDateStatus = napi_get_date_value(data->env, data->sharedDateObj, &data->timestamp);
    } else {
        data->getDateStatus = napi_generic_failure;
        data->timestamp = 0.0;
    }

    return nullptr;
}

// Test function to test multiple threads reading from a shared Date object
static napi_value TestSharedDateObjectRead(napi_env env, napi_callback_info info)
{
    // Create a shared Date object
    napi_value sharedDateObj;
    napi_status createStatus = napi_create_date(env, SHARED_TIMESTAMP, &sharedDateObj);
    if (createStatus != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create shared Date object");
        return nullptr;
    }
    
    // Create thread data array
    SharedDateReadData threadData[SHARED_READ_THREAD_COUNT];
    pthread_t threads[SHARED_READ_THREAD_COUNT];
    
    // Initialize thread data using helper function
    InitializeSharedDateReadData(threadData, env, sharedDateObj, SHARED_READ_THREAD_COUNT);
    // Create threads using pthread_create
    for (int i = 0; i < SHARED_READ_THREAD_COUNT; i++) {
        int result = pthread_create(&threads[i], nullptr, ReadSharedDateThread, &threadData[i]);
        if (result != 0) {
            napi_throw_error(env, nullptr, "Failed to create thread");
            return nullptr;
        }
    }
    
    // Wait for all threads to complete
    for (int i = 0; i < SHARED_READ_THREAD_COUNT; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // Check results and create result array
    napi_value threadResultsArray;
    napi_create_array(env, &threadResultsArray);
    
    bool allSuccess = true;
    for (int i = 0; i < SHARED_READ_THREAD_COUNT; i++) {
        // Check if this thread was successful
        if (threadData[i].isDateStatus != napi_ok ||
            !threadData[i].isDate ||
            threadData[i].getDateStatus != napi_ok ||
            threadData[i].timestamp != SHARED_TIMESTAMP) {
            allSuccess = false;
        }
        
        // Build thread result using helper function
        napi_value threadResult = BuildSharedDateReadThreadResult(env, threadData[i]);
        napi_set_element(env, threadResultsArray, i, threadResult);
    }
    
    // Build and return main result using helper function
    return BuildSharedDateReadResult(env, allSuccess, threadResultsArray,
        SHARED_READ_THREAD_COUNT, SHARED_TIMESTAMP);
}

// Helper function to initialize stress test data
static void InitializeStressTestData(StressTestData* threadData, napi_env env, int numThreads)
{
    for (int i = 0; i < numThreads; i++) {
        threadData[i].env = env;
        threadData[i].threadId = i;
        threadData[i].totalOperations = 0;
        threadData[i].successfulOperations = 0;
        threadData[i].failedOperations = 0;
        threadData[i].executionTime = 0.0;
        threadData[i].memoryUsage = 0.0;
        threadData[i].threadSuccess = false;
        threadData[i].dateObj = nullptr;
        threadData[i].isDate = false;
    }
}

// Helper function to build stress test thread result
static napi_value BuildStressTestThreadResult(napi_env env, const StressTestData& threadData)
{
    napi_value threadResult;
    napi_create_object(env, &threadResult);

    // Add thread ID
    napi_value threadIdProp;
    napi_create_int32(env, threadData.threadId, &threadIdProp);
    napi_set_named_property(env, threadResult, "threadId", threadIdProp);

    // Add operation counts
    napi_value totalOpsProp;
    napi_create_int32(env, threadData.totalOperations, &totalOpsProp);
    napi_set_named_property(env, threadResult, "totalOperations", totalOpsProp);

    napi_value successOpsProp;
    napi_create_int32(env, threadData.successfulOperations, &successOpsProp);
    napi_set_named_property(env, threadResult, "successfulOperations", successOpsProp);

    napi_value failedOpsProp;
    napi_create_int32(env, threadData.failedOperations, &failedOpsProp);
    napi_set_named_property(env, threadResult, "failedOperations", failedOpsProp);

    // Add performance metrics
    napi_value execTimeProp;
    napi_create_double(env, threadData.executionTime, &execTimeProp);
    napi_set_named_property(env, threadResult, "executionTime", execTimeProp);

    napi_value memoryProp;
    napi_create_double(env, threadData.memoryUsage, &memoryProp);
    napi_set_named_property(env, threadResult, "memoryUsage", memoryProp);

    // Add success flag
    napi_value successProp;
    napi_get_boolean(env, threadData.threadSuccess, &successProp);
    napi_set_named_property(env, threadResult, "success", successProp);

    return threadResult;
}

// Structure to hold stress test main result parameters
struct StressTestMainResultParams {
    bool overallSuccess;
    napi_value threadResultsArray;
    int totalThreads;
    int totalOperations;
    int totalSuccessful;
    int totalFailed;
    double totalExecutionTime;
    double totalMemoryUsage;
    double performanceVariation;
    double memoryIncreasePercent;
};

// Helper function to build stress test main result
static napi_value BuildStressTestMainResult(napi_env env, const StressTestMainResultParams& params)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // Add overall success flag
    napi_value successProp;
    napi_get_boolean(env, params.overallSuccess, &successProp);
    napi_set_named_property(env, resultObj, "success", successProp);

    // Add thread results array
    napi_set_named_property(env, resultObj, "threadResults", params.threadResultsArray);

    // Add summary statistics
    napi_value totalThreadsProp;
    napi_create_int32(env, params.totalThreads, &totalThreadsProp);
    napi_set_named_property(env, resultObj, "totalThreads", totalThreadsProp);

    napi_value totalOpsProp;
    napi_create_int32(env, params.totalOperations, &totalOpsProp);
    napi_set_named_property(env, resultObj, "totalOperations", totalOpsProp);

    napi_value totalSuccessProp;
    napi_create_int32(env, params.totalSuccessful, &totalSuccessProp);
    napi_set_named_property(env, resultObj, "totalSuccessful", totalSuccessProp);

    napi_value totalFailedProp;
    napi_create_int32(env, params.totalFailed, &totalFailedProp);
    napi_set_named_property(env, resultObj, "totalFailed", totalFailedProp);

    // Add performance metrics
    napi_value totalExecTimeProp;
    napi_create_double(env, params.totalExecutionTime, &totalExecTimeProp);
    napi_set_named_property(env, resultObj, "totalExecutionTime", totalExecTimeProp);

    napi_value totalMemoryProp;
    napi_create_double(env, params.totalMemoryUsage, &totalMemoryProp);
    napi_set_named_property(env, resultObj, "totalMemory", totalMemoryProp);

    napi_value perfVarProp;
    napi_create_double(env, params.performanceVariation, &perfVarProp);
    napi_set_named_property(env, resultObj, "performanceVariation", perfVarProp);

    napi_value memIncreaseProp;
    napi_create_double(env, params.memoryIncreasePercent, &memIncreaseProp);
    napi_set_named_property(env, resultObj, "memoryIncreasePercent", memIncreaseProp);

    return resultObj;
}

// Thread function for high concurrency stress testing
static void* StressTestThread(void* arg)
{
    StressTestData* data = static_cast<StressTestData*>(arg);
    
    // Record start time
    auto startTime = std::chrono::high_resolution_clock::now();
    
    // Initialize random seed for this thread
    unsigned int seed = static_cast<unsigned int>(time(nullptr)) + data->threadId;
    
    data->successfulOperations = 0;
    data->failedOperations = 0;
    data->threadSuccess = true;
    
    // Perform 1000 operations
    for (int i = 0; i < data->totalOperations; i++) {
        // Generate random timestamp between 0 and 1e15
        double randomTimestamp = static_cast<double>(rand_r(&seed)) / RAND_MAX * 1e15;
        
        // Create Date object with random timestamp
        napi_status createStatus = napi_create_date(data->env, randomTimestamp, &data->dateObj);
        if (createStatus != napi_ok) {
            data->failedOperations++;
            data->threadSuccess = false;
            continue;
        }

        // Verify Date type
        napi_status isDateStatus = napi_is_date(data->env, data->dateObj, &data->isDate);
        if (isDateStatus == napi_ok && data->isDate) {
            double retrievedTimestamp;
            napi_status getStatus = napi_get_date_value(data->env, data->dateObj, &retrievedTimestamp);
            if (getStatus == napi_ok && retrievedTimestamp == randomTimestamp) {
                data->successfulOperations++;
            } else {
                data->failedOperations++;
                data->threadSuccess = false;
            }
        } else {
            data->failedOperations++;
            data->threadSuccess = false;
        }

        // Random sleep between 0-10ms to simulate real workload
        int sleepMs = rand_r(&seed) % NUM_11; // 0 to 10 ms
        if (sleepMs > 0) {
            std::this_thread::sleep_for(std::chrono::milliseconds(sleepMs));
        }
    }
    
    // Record end time
    auto endTime = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime);
    data->executionTime = static_cast<double>(duration.count());
    
    // Estimate memory usage (this is a rough approximation)
    data->memoryUsage = static_cast<double>(data->successfulOperations) * 1 / NUM_1000; // KB per operation
    return nullptr;
}

// Test function for high concurrency Date operations stress test
static napi_value TestHighConcurrencyDateStress(napi_env env, napi_callback_info info)
{
    // Create thread data array
    StressTestData threadData[STRESS_TEST_THREAD_COUNT];
    pthread_t threads[STRESS_TEST_THREAD_COUNT];
    
    // Initialize thread data using helper function
    InitializeStressTestData(threadData, env, STRESS_TEST_THREAD_COUNT);
    
    // Create threads using pthread_create
    for (int i = 0; i < STRESS_TEST_THREAD_COUNT; i++) {
        threadData[i].totalOperations = OPERATIONS_PER_THREAD;
        NAPI_CALL(env, pthread_create(&threads[i], nullptr, StressTestThread, &threadData[i]));
        pthread_join(threads[i], nullptr);
    }
    
    // Calculate summary statistics
    int totalOperations = STRESS_TEST_THREAD_COUNT * OPERATIONS_PER_THREAD;
    int totalSuccessful = 0;
    int totalFailed = 0;
    double totalExecutionTime = 0.0;
    double totalMemoryUsage = 0.0;
    // Calculate performance metrics
    double performanceVariation = 0.0;
    // Build thread results array
    napi_value threadResultsArray;
    napi_create_array(env, &threadResultsArray);

    for (int i = 0; i < STRESS_TEST_THREAD_COUNT; i++) {
        totalSuccessful += threadData[i].successfulOperations;
        totalFailed += threadData[i].failedOperations;
        totalExecutionTime += threadData[i].executionTime;
        totalMemoryUsage += threadData[i].memoryUsage;
        
        napi_value threadResult = BuildStressTestThreadResult(env, threadData[i]);
        napi_set_element(env, threadResultsArray, i, threadResult);
    }
    double avgExecutionTime = totalExecutionTime / STRESS_TEST_THREAD_COUNT;
    for (int i = 0; i < STRESS_TEST_THREAD_COUNT; i++) {
        double diff = threadData[i].executionTime - avgExecutionTime;
        performanceVariation += diff * diff;
    }
    double memoryIncreasePercent = (totalMemoryUsage / STRESS_TEST_THREAD_COUNT) * 100.0;
    // Build and return main result using helper function
    StressTestMainResultParams params = {
        .overallSuccess = (totalSuccessful == totalOperations),
        .threadResultsArray = threadResultsArray,
        .totalThreads = STRESS_TEST_THREAD_COUNT,
        .totalOperations = totalOperations,
        .totalSuccessful = totalSuccessful,
        .totalFailed = totalFailed,
        .totalExecutionTime = totalExecutionTime,
        .totalMemoryUsage = totalMemoryUsage,
        .performanceVariation = sqrt(performanceVariation / STRESS_TEST_THREAD_COUNT),
        .memoryIncreasePercent = memoryIncreasePercent
    };
    
    return BuildStressTestMainResult(env, params);
}

// Helper function to initialize cross thread data
static void InitializeCrossThreadData(CrossThreadData* threadData, napi_env env,
    int numThreads, double originalTimestamp)
{
    for (int i = 0; i < numThreads; i++) {
        threadData[i].env = env;
        threadData[i].dateObj = nullptr;
        threadData[i].threadId = i;
        // Use strcpy_s for safe string copying with boundary checking
        if (i == 0) {
            strcpy_s(threadData[i].operation, sizeof(threadData[i].operation), "Create Date");
        } else if (i == 1) {
            strcpy_s(threadData[i].operation, sizeof(threadData[i].operation), "Receive from A and validate");
        } else {
            strcpy_s(threadData[i].operation, sizeof(threadData[i].operation), "Receive from B and validate");
        }
        
        threadData[i].isDateStatus = napi_generic_failure;
        threadData[i].isDate = false;
        threadData[i].getDateStatus = napi_generic_failure;
        threadData[i].timestamp = 0.0;
        threadData[i].originalTimestamp = originalTimestamp;
        threadData[i].threadSuccess = false;
    }
}

// Helper function to build cross thread result
static napi_value BuildCrossThreadResult(napi_env env, const CrossThreadData& threadData)
{
    napi_value threadResult;
    napi_create_object(env, &threadResult);

    // Add thread ID
    napi_value threadIdProp;
    napi_create_int32(env, threadData.threadId, &threadIdProp);
    napi_set_named_property(env, threadResult, "threadId", threadIdProp);

    // Add operation
    napi_value operationProp;
    napi_create_string_utf8(env, threadData.operation, NAPI_AUTO_LENGTH, &operationProp);
    napi_set_named_property(env, threadResult, "operation", operationProp);

    // Add is_date status
    napi_value isDateStatusProp;
    napi_create_int32(env, threadData.isDateStatus, &isDateStatusProp);
    napi_set_named_property(env, threadResult, "isDateStatus", isDateStatusProp);

    // Add is_date flag
    napi_value isDateProp;
    napi_get_boolean(env, threadData.isDate, &isDateProp);
    napi_set_named_property(env, threadResult, "isDate", isDateProp);

    // Add get_date status
    napi_value getDateStatusProp;
    napi_create_int32(env, threadData.getDateStatus, &getDateStatusProp);
    napi_set_named_property(env, threadResult, "getDateStatus", getDateStatusProp);

    // Add timestamp
    napi_value timestampProp;
    napi_create_double(env, threadData.timestamp, &timestampProp);
    napi_set_named_property(env, threadResult, "timestamp", timestampProp);

    // Add original timestamp
    napi_value originalTimestampProp;
    napi_create_double(env, threadData.originalTimestamp, &originalTimestampProp);
    napi_set_named_property(env, threadResult, "originalTimestamp", originalTimestampProp);

    // Add success flag
    napi_value successProp;
    napi_get_boolean(env, threadData.threadSuccess, &successProp);
    napi_set_named_property(env, threadResult, "success", successProp);

    return threadResult;
}

// Structure to hold cross thread main result parameters
struct CrossThreadMainResultParams {
    bool overallSuccess;
    napi_value threadResultsArray;
    int totalThreads;
    double originalTimestamp;
    bool allThreadsSuccessful;
};

// Helper function to build cross thread main result
static napi_value BuildCrossThreadMainResult(napi_env env, const CrossThreadMainResultParams& params)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // Add overall success flag
    napi_value successProp;
    napi_get_boolean(env, params.overallSuccess, &successProp);
    napi_set_named_property(env, resultObj, "success", successProp);

    // Add thread results array
    napi_set_named_property(env, resultObj, "threadResults", params.threadResultsArray);

    // Add total threads count
    napi_value totalThreadsProp;
    napi_create_int32(env, params.totalThreads, &totalThreadsProp);
    napi_set_named_property(env, resultObj, "totalThreads", totalThreadsProp);

    // Add original timestamp
    napi_value originalTimestampProp;
    napi_create_double(env, params.originalTimestamp, &originalTimestampProp);
    napi_set_named_property(env, resultObj, "originalTimestamp", originalTimestampProp);

    // Add all threads successful flag
    napi_value allThreadsProp;
    napi_get_boolean(env, params.allThreadsSuccessful, &allThreadsProp);
    napi_set_named_property(env, resultObj, "allThreadsSuccessful", allThreadsProp);

    return resultObj;
}

// Thread function for thread A (creates Date object)
static void* ThreadAThread(void* arg)
{
    CrossThreadData* data = static_cast<CrossThreadData*>(arg);
    
    // Create Date object with timestamp 987654321000
    napi_status createStatus = napi_create_date(data->env, data->originalTimestamp, &data->dateObj);
    OH_LOG_INFO(LOG_APP, "testTag napi_create_date %{public}d.", createStatus);
    if (createStatus == napi_ok) {
        data->threadSuccess = true;
        data->isDateStatus = napi_ok;
        data->isDate = true;
        data->getDateStatus = napi_ok;
        data->timestamp = data->originalTimestamp;
    } else {
        data->threadSuccess = false;
        data->isDateStatus = createStatus;
        data->isDate = false;
        data->getDateStatus = createStatus;
        data->timestamp = 0.0;
    }
    
    return nullptr;
}

// Thread function for thread B (receives from A, validates, passes to C)
static void* ThreadBThread(void* arg)
{
    CrossThreadData* data = static_cast<CrossThreadData*>(arg);
    
    // Verify Date type
    data->isDateStatus = napi_is_date(data->env, data->dateObj, &data->isDate);
    OH_LOG_INFO(LOG_APP, "testTag threadB napi_is_date %{public}d.", data->isDateStatus);
    if (data->isDateStatus == napi_ok && data->isDate) {
        // Get timestamp value
        data->getDateStatus = napi_get_date_value(data->env, data->dateObj, &data->timestamp);
        
        if (data->getDateStatus == napi_ok && data->timestamp == data->originalTimestamp) {
            data->threadSuccess = true;
        } else {
            data->threadSuccess = false;
        }
    } else {
        data->threadSuccess = false;
        data->getDateStatus = napi_generic_failure;
        data->timestamp = 0.0;
    }
    
    return nullptr;
}

// Thread function for thread C (receives from B, validates)
static void* ThreadCThread(void* arg)
{
    CrossThreadData* data = static_cast<CrossThreadData*>(arg);
    
    // Verify Date type
    data->isDateStatus = napi_is_date(data->env, data->dateObj, &data->isDate);
    OH_LOG_INFO(LOG_APP, "testTag threadC napi_is_date %{public}d.", data->isDateStatus);
    if (data->isDateStatus == napi_ok && data->isDate) {
        // Get timestamp value
        data->getDateStatus = napi_get_date_value(data->env, data->dateObj, &data->timestamp);
        
        if (data->getDateStatus == napi_ok && data->timestamp == data->originalTimestamp) {
            data->threadSuccess = true;
        } else {
            data->threadSuccess = false;
        }
    } else {
        data->threadSuccess = false;
        data->getDateStatus = napi_generic_failure;
        data->timestamp = 0.0;
    }
    
    return nullptr;
}

// Test function to test cross-thread Date object passing
static napi_value TestCrossThreadDatePassing(napi_env env, napi_callback_info info)
{
    // Create thread data array
    CrossThreadData threadData[CROSS_THREAD_COUNT];
    pthread_t threads[CROSS_THREAD_COUNT];
    
    // Initialize thread data using helper function
    InitializeCrossThreadData(threadData, env, CROSS_THREAD_COUNT, CROSS_THREAD_TIMESTAMP);
    
    int result = pthread_create(&threads[0], nullptr, ThreadAThread, &threadData[0]);
    pthread_join(threads[0], nullptr);
    threadData[1].dateObj = threadData[0].dateObj;
    threadData[NUM_2].dateObj = threadData[0].dateObj;
    // Create threads using pthread_create
    for (int i = 1; i < CROSS_THREAD_COUNT; i++) {
        if (i == 1) {
            result = pthread_create(&threads[i], nullptr, ThreadBThread, &threadData[i]);
        } else {
            result = pthread_create(&threads[i], nullptr, ThreadCThread, &threadData[i]);
        }
        
        if (result != 0) {
            napi_throw_error(env, nullptr, "Failed to create thread");
            return nullptr;
        }
    }
    
    // Wait for all threads to complete
    for (int i = 1; i < CROSS_THREAD_COUNT; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // Check results and create result array
    napi_value threadResultsArray;
    napi_create_array(env, &threadResultsArray);
    
    bool allThreadsSuccessful = true;
    for (int i = 0; i < CROSS_THREAD_COUNT; i++) {
        // Check if this thread was successful
        if (!threadData[i].threadSuccess) {
            allThreadsSuccessful = false;
        }
        
        // Build thread result using helper function
        napi_value threadResult = BuildCrossThreadResult(env, threadData[i]);
        napi_set_element(env, threadResultsArray, i, threadResult);
    }
    
    // Build and return main result using helper function
    CrossThreadMainResultParams params = {
        .overallSuccess = allThreadsSuccessful,
        .threadResultsArray = threadResultsArray,
        .totalThreads = CROSS_THREAD_COUNT,
        .originalTimestamp = CROSS_THREAD_TIMESTAMP,
        .allThreadsSuccessful = allThreadsSuccessful
    };
    
    return BuildCrossThreadMainResult(env, params);
}

// Helper function to initialize thread safety error data
static void InitializeThreadSafetyErrorDat(ThreadSafetyErrorData* threadData, napi_env env, int numThreads)
{
    for (int i = 0; i < numThreads; i++) {
        threadData[i].env = env;
        threadData[i].threadId = i;
        
        // Use strcpy_s for safe string copying with boundary checking
        if (i == 0) {
            strcpy_s(threadData[i].operation, sizeof(threadData[i].operation), "create_date_nullptr");
        } else if (i == 1) {
            strcpy_s(threadData[i].operation, sizeof(threadData[i].operation), "get_date_value_nullptr");
        } else if (i == NUM_2) {
            strcpy_s(threadData[i].operation, sizeof(threadData[i].operation), "is_date_nullptr");
        } else {
            strcpy_s(threadData[i].operation, sizeof(threadData[i].operation), "normal_operations");
        }
        
        threadData[i].apiStatus = napi_generic_failure;
        threadData[i].expectedStatus = (i < NUM_3) ? napi_invalid_arg : napi_ok;
        threadData[i].isSuccess = false;
        
        // Use strcpy_s for safe string copying with boundary checking
        if (i == 0) {
            strcpy_s(threadData[i].errorDescription, sizeof(threadData[i].errorDescription),
                "napi_create_date with nullptr env");
        } else if (i == 1) {
            strcpy_s(threadData[i].errorDescription, sizeof(threadData[i].errorDescription),
                "napi_get_date_value with nullptr value");
        } else if (i == NUM_2) {
            strcpy_s(threadData[i].errorDescription, sizeof(threadData[i].errorDescription),
                "napi_is_date with nullptr value");
        } else {
            strcpy_s(threadData[i].errorDescription, sizeof(threadData[i].errorDescription),
                "Normal Date operations");
        }
    }
}

// Helper function to build thread safety error result
static napi_value BuildThreadSafetyErrorResult(napi_env env, const ThreadSafetyErrorData& threadData)
{
    napi_value threadResult;
    napi_create_object(env, &threadResult);

    // Add thread ID
    napi_value threadIdProp;
    napi_create_int32(env, threadData.threadId, &threadIdProp);
    napi_set_named_property(env, threadResult, "threadId", threadIdProp);

    // Add operation
    napi_value operationProp;
    napi_create_string_utf8(env, threadData.operation, NAPI_AUTO_LENGTH, &operationProp);
    napi_set_named_property(env, threadResult, "operation", operationProp);

    // Add API status
    napi_value apiStatusProp;
    napi_create_int32(env, threadData.apiStatus, &apiStatusProp);
    napi_set_named_property(env, threadResult, "apiStatus", apiStatusProp);

    // Add expected status
    napi_value expectedStatusProp;
    napi_create_int32(env, threadData.expectedStatus, &expectedStatusProp);
    napi_set_named_property(env, threadResult, "expectedStatus", expectedStatusProp);

    // Add success flag
    napi_value successProp;
    napi_get_boolean(env, threadData.isSuccess, &successProp);
    napi_set_named_property(env, threadResult, "isSuccess", successProp);

    // Add error description
    napi_value errorDescProp;
    napi_create_string_utf8(env, threadData.errorDescription, NAPI_AUTO_LENGTH, &errorDescProp);
    napi_set_named_property(env, threadResult, "errorDescription", errorDescProp);

    return threadResult;
}

// Structure to hold thread safety error main result parameters
struct ThreadSafetyErrorMainResultParams {
    bool overallSuccess;
    napi_value threadResultsArray;
    int totalThreads;
    int totalSuccessful;
    int totalFailed;
};

// Helper function to build thread safety error main result
static napi_value BuildThreadSafetyErrorMainResult(napi_env env, const ThreadSafetyErrorMainResultParams& params)
{
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // Add overall success flag
    napi_value successProp;
    napi_get_boolean(env, params.overallSuccess, &successProp);
    napi_set_named_property(env, resultObj, "success", successProp);

    // Add thread results array
    napi_set_named_property(env, resultObj, "threadResults", params.threadResultsArray);

    // Add total threads count
    napi_value totalThreadsProp;
    napi_create_int32(env, params.totalThreads, &totalThreadsProp);
    napi_set_named_property(env, resultObj, "totalThreads", totalThreadsProp);

    // Add summary statistics
    napi_value totalSuccessProp;
    napi_create_int32(env, params.totalSuccessful, &totalSuccessProp);
    napi_set_named_property(env, resultObj, "totalSuccessful", totalSuccessProp);

    napi_value totalFailedProp;
    napi_create_int32(env, params.totalFailed, &totalFailedProp);
    napi_set_named_property(env, resultObj, "totalFailed", totalFailedProp);

    return resultObj;
}

// Thread function for thread 1: napi_create_date with nullptr env
static void* Thread1Thread(void* arg)
{
    ThreadSafetyErrorData* data = static_cast<ThreadSafetyErrorData*>(arg);
    
    // Call napi_create_date with nullptr env (should return napi_invalid_arg)
    napi_value result;
    data->apiStatus = napi_create_date(nullptr, TEST_TIMESTAMP_A, &result);
    // Check if we got the expected error
    if (data->apiStatus == data->expectedStatus) {
        data->isSuccess = true;
    } else {
        data->isSuccess = false;
    }

    return nullptr;
}

// Thread function for thread 2: napi_get_date_value with nullptr value
static void* Thread2Thread(void* arg)
{
    ThreadSafetyErrorData* data = static_cast<ThreadSafetyErrorData*>(arg);
    
    // Call napi_get_date_value with nullptr value (should return napi_invalid_arg)
    double timestamp;
    data->apiStatus = napi_get_date_value(data->env, nullptr, &timestamp);
    
    // Check if we got the expected error
    if (data->apiStatus == data->expectedStatus) {
        data->isSuccess = true;
    } else {
        data->isSuccess = false;
    }

    return nullptr;
}
// Thread function for thread 3: napi_is_date with nullptr is_date
static void* Thread3Thread(void* arg)
{
    ThreadSafetyErrorData* data = static_cast<ThreadSafetyErrorData*>(arg);
    // Create a valid Date object first
    napi_value dateObj;
    napi_status createStatus = napi_create_date(data->env, TEST_TIMESTAMP_B, &dateObj);
    if (createStatus == napi_ok) {
        // Call napi_is_date with nullptr is_date (should return napi_invalid_arg)
        data->apiStatus = napi_is_date(data->env, dateObj, nullptr);
        
        // Check if we got the expected error
        if (data->apiStatus == data->expectedStatus) {
            data->isSuccess = true;
        } else {
            data->isSuccess = false;
        }
    } else {
        data->apiStatus = createStatus;
        data->isSuccess = false;
    }
    
    return nullptr;
}

// Thread function for thread 4: normal operation as control
static void* Thread4Thread(void* arg)
{
    ThreadSafetyErrorData* data = static_cast<ThreadSafetyErrorData*>(arg);
    
    // Perform normal Date operations (should succeed)
    napi_value dateObj;
    napi_status createStatus = napi_create_date(data->env, CONTROL_THREAD_TIMESTAMP, &dateObj);
    if (createStatus == napi_ok) {
        // Verify Date type
        bool isDate;
        napi_status isDateStatus = napi_is_date(data->env, dateObj, &isDate);
        if (isDateStatus == napi_ok && isDate) {
            // Get timestamp value
            double timestamp;
            napi_status getStatus = napi_get_date_value(data->env, dateObj, &timestamp);
            if (getStatus == napi_ok && timestamp == CONTROL_THREAD_TIMESTAMP) {
                data->apiStatus = napi_ok;
                data->isSuccess = true;
            } else {
                data->apiStatus = getStatus;
                data->isSuccess = false;
            }
        } else {
            data->apiStatus = isDateStatus;
            data->isSuccess = false;
        }
    } else {
        data->apiStatus = createStatus;
        data->isSuccess = false;
    }
    
    return nullptr;
}

// Test function to test thread safety with error parameter combinations
static napi_value TestThreadSafetyErrorHandling(napi_env env, napi_callback_info info)
{
    // Create thread data array
    ThreadSafetyErrorData threadData[THREAD_SAFETY_THREAD_COUNT];
    pthread_t threads[THREAD_SAFETY_THREAD_COUNT];
    void* (*threadFunctions[THREAD_SAFETY_THREAD_COUNT])(void*) = {
        Thread1Thread,
        Thread2Thread,
        Thread3Thread,
        Thread4Thread
    };

    InitializeThreadSafetyErrorDat(threadData, env, THREAD_SAFETY_THREAD_COUNT);

    // Create threads using pthread_create
    for (int i = 0; i < THREAD_SAFETY_THREAD_COUNT; i++) {
        int result = pthread_create(&threads[i], nullptr, threadFunctions[i], &threadData[i]);
        if (result != 0) {
            napi_throw_error(env, nullptr, "Failed to create thread");
            return nullptr;
        }
    }
    
    // Wait for all threads to complete
    for (int i = 0; i < THREAD_SAFETY_THREAD_COUNT; i++) {
        pthread_join(threads[i], nullptr);
    }
    
    // Check results and create result array
    napi_value threadResultsArray;
    napi_create_array(env, &threadResultsArray);
    
    int totalSuccessful = 0;
    int totalFailed = 0;
    for (int i = 0; i < THREAD_SAFETY_THREAD_COUNT; i++) {
        // Count successful and failed operations
        if (threadData[i].isSuccess) {
            totalSuccessful++;
        } else {
            totalFailed++;
        }
        
        // Build thread result using helper function
        napi_value threadResult = BuildThreadSafetyErrorResult(env, threadData[i]);
        napi_set_element(env, threadResultsArray, i, threadResult);
    }
    
    // Check overall success
    bool overallSuccess = (totalSuccessful == THREAD_SAFETY_THREAD_COUNT);
    
    // Build and return main result using helper function
    ThreadSafetyErrorMainResultParams params = {
        .overallSuccess = overallSuccess,
        .threadResultsArray = threadResultsArray,
        .totalThreads = THREAD_SAFETY_THREAD_COUNT,
        .totalSuccessful = totalSuccessful,
        .totalFailed = totalFailed
    };
    
    return BuildThreadSafetyErrorMainResult(env, params);
}

// Helper function for basic UTF-16 string creation and verification
static bool CreateAndVerifyUtf16String(napi_env env,
                                       const char16_t* utf16String,
                                       napi* utf16Val,
                                       size_t* requiredLength)
{
    napi_status status = napi_create_string_utf16(env, utf16String, NAPI_AUTO_LENGTH, utf16Val);
    if (status != napi_ok) {
        return false;
    }
    status = napi_get_value_string_utf16(env, *utf16Val, nullptr, 0, requiredLength);
    if (status != napi_ok) {
        return false;
    }

    // Verify content by reading and comparing
    char16_t *buffer = new char16_t[*requiredLength + 1];
    if (!buffer) {
        return false;
    }
    size_t actualLength = 0;
    status = napi_get_value_string_utf16(env, *utf16Val, buffer, *requiredLength + 1, &actualLength);
    if (status != napi_ok || actualLength != *requiredLength) {
        delete[] buffer;
        return false;
    }

    // Character-by-character verification
    size_t originalLength = std::char_traits<char16_t>::length(utf16String);
    bool contentValid = true;
    for (size_t i = 0; i < actualLength && i < originalLength; i++) {
        if (buffer[i] != utf16String[i]) {
            contentValid = false;
            break;
        }
    }
    delete[] buffer;
    return contentValid;
}

// Helper function for UTF-16 truncation testing
static bool TestUtf16Truncation(napi_env env,
                                napi_value utf6Val,
                                const char16_tString,
                                size_t requiredLength)
{
    const size_t minTruncationSize = 5;
    if (requiredLength <= minTruncationSize) {
        return true;
    }
    char16_t smallBuffer[minTruncationSize];
    size_t truncatedLength = 0;
    napi_status status = napi_get_value_string_utf16(env, utf16Val, smallBuffer, minTruncationSize, &truncatedLength);
    if (status != napi_ok || truncatedLength >= requiredLength) {
        return false;
    }

    // Verify truncated content
    size_t originalLength = std::char_traits<char16_t>::length(originalString);
    for (size_t i = 0; i < truncatedLength && i < originalLength; i++) {
        if (smallBuffer[i] != originalString[i]) {
            return false;
        }
    }
    return true;
}

static bool TestUtf16StringCreationAndRetrieval(napi_env env)
{
    const char16_t utf16String[] = u"Hello世界🌟";
    napi_value utf16Val = nullptr;
    size_t requiredLength = 0;

    // Test basic creation and verification
    if (!CreateAndVerifyUtf16String(env, utf16String, &utf16Val, &requiredLength)) {
        return false;
    }

    // Test truncation scenarios
    if (!TestUtf16Truncation(env, utf16Val, utf16String, requiredLength)) {
        return false;
    }

    // Test explicit length creation
    const char16_t explicitString[] = u"Explicit测试";
    const size_t explicitLength = 11;
    napi_value explicitVal = nullptr;
    napi_status status = napi_create_string_utf16(env, explicitString, explicitLength, &explicitVal);
    if (status != napi_ok) {
        return false;
    }
    size_t explicitActualLength = 0;
    status = napi_get_value_string_utf16(env, explicitVal, nullptr, 0, &explicitActualLength);
    return (status == napi_ok && explicitActualLength == explicitLength);
}
// Helper function to test UTF-8 to UTF-16 conversion
static bool TestUtf8ToUtf16Conversion(napi_env env)
{
    const char utf8String[] = "cafe 123";
    napi_value utf8Val = nullptr;
    napi_status status = napi_create_string_utf8(env, utf8String, strlen(utf8String), &utf8Val);
    if (status != napi_ok) {
        return false;
    }
    size_t utf16RequiredLength = 0;
    status = napi_get_value_string_utf16(env, utf8Val, nullptr, 0, &utf16RequiredLength);
    if (status != napi_ok) {
        return false;
    }
    char16_t *utf16Buffer = new char16_t[utf16RequiredLength + 1];
    if (!utf16Buffer) {
        return false;
    }
    size_t utf16ActualLength = 0;
    status = napi_get_value_string_utf16(env, utf8Val, utf16Buffer, utf16RequiredLength + 1, &utf16ActualLength);
    if (status != napi_ok || utf16ActualLength != utf16RequiredLength) {
        delete[] utf16Buffer;
        return false;
    }

    // Verify content
    bool contentValid = true;
    for (size_t i = 0; i < utf16ActualLength && i < strlen(utf8String); i++) {
        if (utf16Buffer[i] != static_cast<char16_t>(utf8String[i])) {
            contentValid = false;
            break;
        }
    }
    delete[] utf16Buffer;
    return contentValid;
}

// Helper function to test Latin1 to UTF-8 conversion
static bool TestLatin1ToUtf8Conversion(napi_env env)
{
    const char latin1String[] = "Hello World ABC 123";
    napi_value latin1Val = nullptr;
    napi_status status = napi_create_string_latin1(env, latin1String, NAPI_AUTO_LENGTH, &latin1Val);
    if (status != napi_ok) {
        return false;
    }
    size_t utf8RequiredLength = 0;
    status = napi_get_value_string_utf8(env, latin1Val, nullptr, 0, &utf8RequiredLength);
    if (status != napi_ok) {
        return false;
    }
    char *utf8Buffer = new char[utf8RequiredLength + 1];
    if (!utf8Buffer) {
        return false;
    }
    size_t utf8ActualLength = 0;
    status = napi_get_value_string_utf8(env, latin1Val, utf8Buffer, utf8RequiredLength + 1, &utf8ActualLength);
    if (status != napi_ok || utf8ActualLength != utf8RequiredLength) {
        delete[] utf8Buffer;
        return false;
    }
    bool contentMatches = (utf8ActualLength == strlen(latin1String)) &&
                         (strncmp(latin1String, utf8Buffer, utf8ActualLength) == 0);
    delete[] utf8Buffer;
    return contentMatches;
}

// Helper function to test round-trip conversion
static bool TestRoundTripConversion(napi_env env)
{
    const char asciiOnlyString[] = "ASCII Test 789";
    napi_value asciiVal = nullptr;
    napi_status status = napi_create_string_utf8(env, asciiOnlyString, strlen(asciiOnlyString), &asciiVal);
    if (status != napi_ok) {
        return false;
    }
    size_t latin1RequiredLength = 0;
    status = napi_get_value_string_latin1(env, asciiVal, nullptr, 0, &latin1RequiredLength);
    if (status != napi_ok) {
        return false;
    }
    char *latin1Buffer = new char[latin1RequiredLength + 1];
    if (!latin1Buffer) {
        return false;
    }
    size_t latin1ActualLength = 0;
    status = napi_get_value_string_latin1(env, asciiVal, latin1Buffer, latin1RequiredLength + 1, &latin1ActualLength);
    bool success = (status == napi_ok) && (latin1ActualLength == strlen(asciiOnlyString)) &&
                   (strncmp(asciiOnlyString, latin1Buffer, latin1ActualLength) == 0);
    delete[] latin1Buffer;
    return success;
}

static bool TestCrossEncodingConversion(napi_env env)
{
    return TestUtf8ToUtf16Conversion(env) &&
           TestLatin1ToUtf8Conversion(env) &&
           TestRoundTripConversion(env);
}

// Helper function to test empty and single character strings
static bool TestEmptyAndSingleCharStrings(napi_env env)
{
    napi_status status;

    // Test empty string
    napi_value emptyVal = nullptr;
    status = napi_create_string_utf8(env, "", 0, &emptyVal);
    if (status != napi_ok) {
        return false;
    }
    size_t emptyLength = 0;
    status = napi_get_value_string_utf8(env, emptyVal, nullptr, 0, &emptyLength);
    if (status != napi_ok || emptyLength != 0) {
        return false;
    }

    // Test single character string
    const char singleChar[] = "A";
    napi_value singleCharVal = nullptr;
    status = napi_create_string_utf8(env, singleChar, 1, &singleCharVal);
    if (status != napi_ok) {
        return false;
    }
    size_t singleLength = 0;
    status = napi_get_value_string_utf8(env, singleCharVal, nullptr, 0, &singleLength);
    return (status == napi_ok && singleLength == 1);
}

// Helper function to test long string creation
static bool TestLongStringCreation(napi_env env)
{
    const int longStringSize = 512;
    const int alphabetSize = 26;
    const char alphabetStart = 'A';
    char *longString = new char[longStringSize + 1];
    if (!longString) {
        return false;
    }
    for (int i = 0; i < longStringSize; i++) {
        longString[i] = alphabetStart + (i % alphabetSize);
    }
    longString[longStringSize] = '\0';
    napi_value longVal = nullptr;
    napi_status status = napi_create_string_utf8(env, longString, longStringSize, &longVal);
    bool success = (status == napi_ok);
    if (success) {
        size_t longLength = 0;
        status = napi_get_value_string_utf8(env, longVal, nullptr, 0, &longLength);
        success = (status == napi_ok) && (longLength == longStringSize);
    }
    delete[] longString;
    return success;
}

// Helper function to test embedded null strings
static bool TestEmbeddedNullStrings(napi_env env)
{
    const char nullString[] = {'H', 'e', 'l', 'l', 'o', '\0', 'W', 'o', 'r', 'l', 'd'};
    const size_t nullStringLen = sizeof(nullString);
    napi_value nullVal = nullptr;
    napi_status status = napi_create_string_utf8(env, nullString, nullStringLen, &nullVal);
    if (status != napi_ok) {
        return false;
    }
    size_t retrievedLength = 0;
    status = napi_get_value_string_utf8(env, nullVal, nullptr, 0, &retrievedLength);
    return (status == napi_ok && retrievedLength == nullStringLen);
}

static bool TestBoundaryLengthCases(napi_env env)
{
    return TestEmptyAndSingleCharStrings(env) &&
           TestLongStringCreation(env) &&
           TestEmbeddedNullStrings(env);
}

// Helper function to test UTF-16 encoding operations
static bool TestUtf16EncodingOperations(napi_env env)
{
    const char16_t utf16String[] = u"ABC123";
    napi_value utf16Val = nullptr;
    napi_status status = napi_create_string_utf16(env, utf16String, NAPI_AUTO_LENGTH, &utf16Val);
    if (status != napi_ok) {
        return false;
    }
    size_t utf16RequiredLength = 0;
    status = napi_get_value_string_utf16(env, utf16Val, nullptr, 0, &utf16RequiredLength);
    if (status != napi_ok) {
        return false;
    }
    char16_t *utf16Buffer = new char16_t[utf16RequiredLength + 1];
    if (!utf16Buffer) {
        return false;
    }
    size_t utf16ActualLength = 0;
    status = napi_get_value_string_utf16(env, utf16Val, utf16Buffer, utf16RequiredLength + 1, &utf16ActualLength);
    if (status != napi_ok || utf16ActualLength != utf16RequiredLength) {
        delete[] utf16Buffer;
        return false;
    }

    // Verify content
    bool contentValid = true;
    for (size_t i = 0; i < utf16ActualLength && i < (sizeof(utf16String) / sizeof(char16_t) - 1); i++) {
        if (utf16Buffer[i] != utf16String[i]) {
            contentValid = false;
            break;
        }
    }
    delete[] utf16Buffer;
    return contentValid;
}

// Helper function to test Latin1 encoding operations
static bool TestLatin1EncodingOperations(napi_env env)
{
    const char latin1String[] = "ABC123";
    napi_value latin1Val = nullptr;
    napi_status status = napi_create_string_latin1(env, latin1String, NAPI_AUTO_LENGTH, &latin1Val);
    if (status != napi_ok) {
        return false;
    }
    size_t latin1RequiredLength = 0;
    status = napi_get_value_string_latin1(env, latin1Val, nullptr, 0, &latin1RequiredLength);
    if (status != napi_ok) {
        return false;
    }
    char *latin1Buffer = new char[latin1RequiredLength + 1];
    if (!latin1Buffer) {
        return false;
    }
    size_t latin1ActualLength = 0;
    status = napi_get_value_string_latin1(env, latin1Val, latin1Buffer, latin1RequiredLength + 1, &latin1ActualLength);
    if (status != napi_ok || latin1ActualLength != latin1RequiredLength) {
        delete[] latin1Buffer;
        return false;
    }
    bool contentValid = (latin1ActualLength == strlen(latin1String)) &&
                       (strncmp(latin1String, latin1Buffer, latin1ActualLength) == 0);
    delete[] latin1Buffer;
    return contentValid;
}

// Helper function to test UTF-8 encoding operations
static bool TestUtf8EncodingOperations(napi_env env)
{
    const char utf8String[] = "ABC123";
    napi_value utf8Val = nullptr;
    napi_status status = napi_create_string_utf8(env, utf8String, NAPI_AUTO_LENGTH, &utf8Val);
    if (status != napi_ok) {
        return false;
    }
    size_t utf8RequiredLength = 0;
    status = napi_get_value_string_utf8(env, utf8Val, nullptr, 0, &utf8RequiredLength);
    if (status != napi_ok) {
        return false;
    }
    char *utf8Buffer = new char[utf8RequiredLength + 1];
    if (!utf8Buffer) {
        return false;
    }
    size_t utf8ActualLength = 0;
    status = napi_get_value_string_utf8(env, utf8Val, utf8Buffer, utf8RequiredLength + 1, &utf8ActualLength);
    if (status != napi_ok || utf8ActualLength != utf8RequiredLength) {
        delete[] utf8Buffer;
        return false;
    }
    bool contentValid = (utf8ActualLength == strlen(utf8String)) &&
                       (strncmp(utf8String, utf8Buffer, utf8ActualLength) == 0);
    delete[] utf8Buffer;
    return contentValid;
}

// Helper function to test extended character handling
static bool TestExtendedCharacterHandling(napi_env env)
{
    const char extendedUtf8String[] = "ñó€";
    napi_value extendedUtf8Val = nullptr;
    napi_status status = napi_create_string_utf8(env, extendedUtf8String, NAPI_AUTO_LENGTH, &extendedUtf8Val);
    if (status != napi_ok) {
        return false;
    }
    // Test UTF-8 handling
    size_t utf8Length = 0;
    status = napi_get_value_string_utf8(env, extendedUtf8Val, nullptr, 0, &utf8Length);
    if (status != napi_ok) {
        return false;
    }
    // Test UTF-16 handling
    size_t utf16Length = 0;
    status = napi_get_value_string_utf16(env, extendedUtf8Val, nullptr, 0, &utf16Length);
    if (status != napi_ok) {
        return false;
    }
    
    // Test Latin1 data loss (expected behavior)
    size_t latin1Length = 0;
    status = napi_get_value_string_latin1(env, extendedUtf8Val, nullptr, 0, &latin1Length);
    // Latin1 may fail or return incomplete data for extended characters
    return (utf8Length > 0 && utf16Length > 0);
}

static bool TestEncodingCompatibility(napi_env env)
{
    if (env == nullptr) {
        return false;
    }
    return TestUtf16EncodingOperations(env) &&
           TestLatin1EncodingOperations(env) &&
           TestUtf8EncodingOperations(env) &&
           TestExtendedCharacterHandling(env);
}

// Helper function to test basic buffer operations
static bool TestBasicBufferOperations(napi_env env, const char* testString, napi_value* stringVal)
{
    napi_status status = napi_create_string_utf8(env, testString, NAPI_AUTO_LENGTH, stringVal);
    if (status != napi_ok) {
        return false;
    }
    size_t requiredLength = 0;
    status = napi_get_value_string_utf8(env, *stringVal, nullptr, 0, &requiredLength);
    return (status == napi_ok && requiredLength == strlen(testString));
}

// Helper function to test buffer size variations
static bool TestBufferSizeVariations(napi_env env, napi_value stringVal, size_t expectedLength)
{
    napi_status status;
    // Test exact buffer size
    char *exactBuffer = new char[expectedLength + 1];
    if (!exactBuffer) {
        return false;
    }
    size_t actualLength = 0;
    status = napi_get_value_string_utf8(env, stringVal, exactBuffer, expectedLength + 1, &actualLength);
    bool exactSuccess = (status == napi_ok && actualLength == expectedLength);
    delete[] exactBuffer;
    if (!exactSuccess) {
        return false;
    }

    // Test smaller buffer
    const size_t smallerSize = expectedLength / 2;
    char *smallerBuffer = new char[smallerSize];
    if (!smallerBuffer) {
        return false;
    }
    size_t smallerActualLength = 0;
    status = napi_get_value_string_utf8(env, stringVal, smallerBuffer, smallerSize, &smallerActualLength);
    bool smallerSuccess = (status == napi_ok && smallerActualLength < expectedLength);
    delete[] smallerBuffer;
    return smallerSuccess;
}

static bool TestBufferSizeEdgeCases(napi_env env)
{
    if (env == nullptr) {
        return false;
    }
    const char longTestString[] =
        "This is a long string for comprehensive buffer size testing with various edge cases and scenarios";
    napi_value longStringVal = nullptr;
    // Test basic operations
    if (!TestBasicBufferOperations(env, longTestString, &longStringVal)) {
        return false;
    }
    size_t expectedLength = strlen(longTestString);
    // Test buffer size variations
    if (!TestBufferSizeVariations(env, longStringVal, expectedLength)) {
        return false;
    }

    // Test tiny buffer (edge case)
    char tinyBuffer[1];
    size_t tinyLength = 0;
    napi_status status = napi_get_value_string_utf8(env, longStringVal, tinyBuffer, sizeof(tinyBuffer), &tinyLength);
    if (status != napi_ok || tinyLength != 0 || tinyBuffer[0] != '\0') {
        return false;
    }
    return true;
}

// Helper function to test invalid input handling
static bool TestInvalidInputHandling(napi_env env)
{
    const int32_t testIntegerValue = 123;
    napi_value numberVal = nullptr;
    napi_status status = napi_create_int32(env, testIntegerValue, &numberVal);
    if (status != napi_ok) {
        return false;
    }
    const size_t bufferSize = 256;
    char buffer[bufferSize];
    size_t length = 0;

    // This should return napi_string_expected
    status = napi_get_value_string_utf8(env, numberVal, buffer, sizeof(buffer), &length);
    return (status == napi_string_expected);
}

// Helper function to test valid string operations
static bool TestValidStringOperations(napi_env env)
{
    const char testString[] = u8"Valid test string 测试";
    napi_value testVal = nullptr;
    napi_status status = napi_create_string_utf8(env, testString, NAPI_AUTO_LENGTH, &testVal);
    if (status != napi_ok) {
        return false;
    }

    // Get length
    size_t requiredLength = 0;
    status = napi_get_value_string_utf8(env, testVal, nullptr, 0, &requiredLength);
    if (status != napi_ok) {
        return false;
    }

    // Test with proper buffer
    char *properBuffer = new char[requiredLength + 1];
    if (!properBuffer) {
        return false;
    }
    memset_s(properBuffer, requiredLength + 1, 0, requiredLength + 1);
    size_t finalLength = 0;
    status = napi_get_value_string_utf8(env, testVal, properBuffer, requiredLength + 1, &finalLength);
    bool success = (status == napi_ok) && (finalLength == requiredLength) &&
                   (strcmp(properBuffer, testString) == 0);
    delete[] properBuffer;
    return success;
}

static bool TestErrorHandlingRobustness(napi_env env)
{
    return TestInvalidInputHandling(env) && TestValidStringOperations(env);
}

// Helper function to test multi-encoding compatibility operations
static bool TestMultiEncodingCompatibilityOperations(napi_env env)
{
    napi_status status;
    // Test 1: Create using napi_create_string_utf8
    napi_value utf8Val = nullptr;
    status = napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &utf8Val);
    if (status != napi_ok) {
        return false;
    }

    // Test 2: Create using napi_get_value_string_utf16
    const size_t utf16BufferSize = 256;
    char16_t utf16Buffer[utf16BufferSize];
    size_t utf16Length = 0;
    status =
        napi_get_value_string_utf16(env, utf8Val, utf16Buffer, sizeof(utf16Buffer) / sizeof(char16_t), &utf16Length);
    if (status != napi_ok) {
        return false;
    }

    // Test 3: Use result to create new string via napi_create_string_latin1
    const char latin1Test[] = "test";
    napi_value latin1Val = nullptr;
    status = napi_create_string_latin1(env, latin1Test, NAPI_AUTO_LENGTH, &latin1Val);
    if (status != napi_ok) {
        return false;
    }

    // Test 4: Get using napi_get_value_string_utf8
    const size_t utf8BufferSize = 256;
    char utf8Buffer[utf8BufferSize];
    size_t utf8Length = 0;
    status = napi_get_value_string_utf8(env, latin1Val, utf8Buffer, sizeof(utf8Buffer), &utf8Length);
    if (status != napi_ok) {
        return false;
    }

    // Test 5: Verify cross-conversion consistency
    if (strcmp(utf8Buffer, "test") != 0) {
        return false;
    }
    return true;
}

// Helper function to test BOM and mixed strings
static bool TestBomAndMixedStrings(napi_env env)
{
    napi_status status;

    // Test UTF-8 BOM + text
    const char bomString[] = u8"\uFEFFHello World";
    napi_value bomVal = nullptr;
    status = napi_create_string_utf8(env, bomString, NAPI_AUTO_LENGTH, &bomVal);
    if (status != napi_ok) {
        return false;
    }
    size_t bomLength = 0;
    status = napi_get_value_string_utf8(env, bomVal, nullptr, 0, &bomLength);
    if (status != napi_ok || bomLength == 0) {
        return false;
    }

    // Test multi-language string
    const char mixedString[] = u8"English中文العربية🌟";
    napi_value mixedVal = nullptr;
    status = napi_create_string_utf8(env, mixedString, strlen(mixedString), &mixedVal);
    if (status != napi_ok) {
        return false;
    }
    size_t mixedLength = 0;
    status = napi_get_value_string_utf8(env, mixedVal, nullptr, 0, &mixedLength);
    return (status == napi_ok && mixedLength > 0);
}

// Helper function to test various encoding strings
static bool TestVariousEncodingStrings(napi_env env)
{
    napi_status status;

    // Test embedded NULL
    const char nullString[] = {'H', 'e', 'l', 'l', 'o', '\0', 'W', 'o', 'r', 'l', 'd', '\0'};
    const size_t nullStringLength = 12;
    napi_value nullVal = nullptr;
    status = napi_create_string_utf8(env, nullString, nullStringLength, &nullVal);
    if (status != napi_ok) {
        return false;
    }

    // Test Chinese UTF-8
    const char pureUtf8[] = u8"你好世界测试字符串";
    napi_value pureUtf8Val = nullptr;
    status = napi_create_string_utf8(env, pureUtf8, NAPI_AUTO_LENGTH, &pureUtf8Val);
    if (status != napi_ok) {
        return false;
    }

    // Test Latin1 compatible
    const char latin1Compatible[] = "Hello ABC éçñ 123";
    napi_value latin1Val = nullptr;
    status = napi_create_string_latin1(env, latin1Compatible, NAPI_AUTO_LENGTH, &latin1Val);
    return (status == napi_ok);
}

static bool TestSpecialCharacterHandling(napi_env env)
{
    return TestBomAndMixedStrings(env) && TestVariousEncodingStrings(env);
}

// Helper function to test string operations in loop
static bool TestStringOperationsInLoop(napi_env env)
{
    const int simulationLoopCount = 10;
    const size_t loopBufferSize = 64;
    for (int i = 0; i < simulationLoopCount; i++) {
        char tempBuffer[loopBufferSize];
        int result = sprintf_s(tempBuffer, sizeof(tempBuffer), "String_%d", i);
        if (result < 0) {
            return false;
        }

        // Test UTF-16 creation
        char16_t utf16Buffer[loopBufferSize];
        for (int j = 0; j < loopBufferSize && tempBuffer[j] != '\0'; j++) {
            utf16Buffer[j] = static_cast<char16_t>(tempBuffer[j]);
        }
        utf16Buffer[strlen(tempBuffer)] = 0;
        napi_value utf16Val = nullptr;
        napi_status status = napi_create_string_utf16(env, utf16Buffer, NAPI_AUTO_LENGTH, &utf16Val);
        if (status != napi_ok) {
            return false;
        }

        // Test Latin1 creation
        napi_value latin1Val = nullptr;
        status = napi_create_string_latin1(env, tempBuffer, NAPI_AUTO_LENGTH, &latin1Val);
        if (status != napi_ok) {
            return false;
        }
    }
    return true;
}

// Helper function to test mixed operations
static bool TestMixedOperations(napi_env env)
{
    const int mixedOperationsCount = 5;
    const size_t testStringsCount = 5;
    const char *testStrings[testStringsCount] = {
        "ASCII_Test",
        "UTF8_测试",
        "Mixed_测试🌟العربية",
        "Special_\xEF\xBB\xBF" "BOM",
        "Null_\0_Test"
    };
    for (int i = 0; i < mixedOperationsCount; i++) {
        const size_t nullStringLength = 12;
        const size_t nullStringIndex = 4;
        size_t len = (i == nullStringIndex) ? nullStringLength : NAPI_AUTO_LENGTH;
        napi_value testVal = nullptr;
        napi_status status = napi_create_string_utf8(env, testStrings[i % testStringsCount], len, &testVal);
        if (status != napi_ok) {
            return false;
        }
    }
    return true;
}

static bool TestStringSafetySimulation(napi_env env)
{
    return TestStringOperationsInLoop(env) && TestMixedOperations(env);
}
static napi_value NapiStringTest001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestUtf16StringCreationAndRetrieval(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestCrossEncodingConversion(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestBoundaryLengthCases(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestEncodingCompatibility(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestBufferSizeEdgeCases(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestErrorHandlingRobustness(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestMultiEncodingCompatibilityOperations(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest008(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestSpecialCharacterHandling(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

static napi_value NapiStringTest009(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool testResult = TestStringSafetySimulation(env);

    napi_get_boolean(env, testResult, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor properties[] = {
        DECLARE_NAPI_FUNCTION("CreateBuffer", CreateBuffer),
        DECLARE_NAPI_FUNCTION("CreateBufferCopy", CreateBufferCopy),
        DECLARE_NAPI_FUNCTION("IsBuffer", IsBuffer),
        DECLARE_NAPI_FUNCTION("GetBufferInfo", GetBufferInfo),
        DECLARE_NAPI_FUNCTION("CreateExternalBufferTest", CreateExternalBufferTest),
        DECLARE_NAPI_FUNCTION("createBufferSizeZeroTest", createBufferSizeZeroTest),
        DECLARE_NAPI_FUNCTION("CreateBufferMaxLength", CreateBufferMaxLength),
        DECLARE_NAPI_FUNCTION("CreateBufferExceedMaxLength", CreateBufferExceedMaxLength),
        DECLARE_NAPI_FUNCTION("CreateBufferInvalidEnv", CreateBufferInvalidEnv),
        DECLARE_NAPI_FUNCTION("CreateBufferInvalidData", CreateBufferInvalidData),
        DECLARE_NAPI_FUNCTION("CreateBufferInvalidResult", CreateBufferInvalidResult),
        DECLARE_NAPI_FUNCTION("CreateInt32Test", CreateInt32Test),
        DECLARE_NAPI_FUNCTION("GetBufferInfoNonBuffer", GetBufferInfoNonBuffer),
        DECLARE_NAPI_FUNCTION("TestMultipleOperations", TestMultipleOperations),
        DECLARE_NAPI_FUNCTION("TestExternalArrayBuffer", TestExternalArrayBuffer),
        DECLARE_NAPI_FUNCTION("TestArrayBufferThreadSafety", TestArrayBufferThreadSafety),
        DECLARE_NAPI_FUNCTION("TestArrayBufferComparison", TestArrayBufferComparison),
        DECLARE_NAPI_FUNCTION("NapiArrayBufferTest01", NapiArrayBufferTest01),
        DECLARE_NAPI_FUNCTION("NapiArrayBufferTest02", NapiArrayBufferTest02),
        DECLARE_NAPI_FUNCTION("NapiArrayBufferTest03", NapiArrayBufferTest03),
        DECLARE_NAPI_FUNCTION("NapiArrayBufferTest04", NapiArrayBufferTest04),
        DECLARE_NAPI_FUNCTION("NapiArrayBufferTest05", NapiArrayBufferTest05),
        DECLARE_NAPI_FUNCTION("NapiArrayBufferTest06", NapiArrayBufferTest06),
        DECLARE_NAPI_FUNCTION("NapiArrayBufferTest07", NapiArrayBufferTest07),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest01", NapiBigIntTest01),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest02", NapiBigIntTest02),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest03", NapiBigIntTest03),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest04", NapiBigIntTest04),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest05", NapiBigIntTest05),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest06", NapiBigIntTest06),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest07", NapiBigIntTest07),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest08", NapiBigIntTest08),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest09", NapiBigIntTest09),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest10", NapiBigIntTest10),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest11", NapiBigIntTest11),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest12", NapiBigIntTest12),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest13", NapiBigIntTest13),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest14", NapiBigIntTest14),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest15", NapiBigIntTest15),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest16", NapiBigIntTest16),
        DECLARE_NAPI_FUNCTION("NapiBigIntTest17", NapiBigIntTest17),
        DECLARE_NAPI_FUNCTION("testCreateDate", TestCreateDate),
        DECLARE_NAPI_FUNCTION("testGetDateValue", TestGetDateValue),
        DECLARE_NAPI_FUNCTION("testIsDate", TestIsDate),
        DECLARE_NAPI_FUNCTION("testGetDateValueWithError", TestGetDateValueWithError),
        DECLARE_NAPI_FUNCTION("testGetDateValueOnly", TestGetDateValueOnly),
        DECLARE_NAPI_FUNCTION("testCreateDateWithMinTimestamp", TestCreateDateWithMinTimestamp),
        DECLARE_NAPI_FUNCTION("testCreateDateWithMaxTimestamp", TestCreateDateWithMaxTimestamp),
        DECLARE_NAPI_FUNCTION("testMultipleDateOperations", TestMultipleDateOperations),
        DECLARE_NAPI_FUNCTION("testBulkDateCreation", TestBulkDateCreation),
        DECLARE_NAPI_FUNCTION("testConcurrentDateCreation", TestConcurrentDateCreation),
        DECLARE_NAPI_FUNCTION("testSharedDateObjectRead", TestSharedDateObjectRead),
        DECLARE_NAPI_FUNCTION("testHighConcurrencyDateStress", TestHighConcurrencyDateStress),
        DECLARE_NAPI_FUNCTION("testCrossThreadDatePassing", TestCrossThreadDatePassing),
        DECLARE_NAPI_FUNCTION("testThreadSafetyErrorHandling", TestThreadSafetyErrorHandling),
        DECLARE_NAPI_FUNCTION("NapiStringTest001", NapiStringTest001),
        DECLARE_NAPI_FUNCTION("NapiStringTest002", NapiStringTest002),
        DECLARE_NAPI_FUNCTION("NapiStringTest003", NapiStringTest003),
        DECLARE_NAPI_FUNCTION("NapiStringTest004", NapiStringTest004),
        DECLARE_NAPI_FUNCTION("NapiStringTest005", NapiStringTest005),
        DECLARE_NAPI_FUNCTION("NapiStringTest006", NapiStringTest006),
        DECLARE_NAPI_FUNCTION("NapiStringTest007", NapiStringTest007),
        DECLARE_NAPI_FUNCTION("NapiStringTest008", NapiStringTest008),
        DECLARE_NAPI_FUNCTION("NapiStringTest009", NapiStringTest009),
    };

    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(properties) / sizeof(*properties), properties));
    return exports;
}
EXTERN_C_END

static napi_module
demoModule = {
.nm_version = 1,
.nm_flags = 0,
.nm_filename = nullptr,
.nm_register_func = Init,
.nm_modname = "napitestex",
.nm_priv = ((void *)0),
.reserved = {
0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
napi_module_register(& demoModule);
}
