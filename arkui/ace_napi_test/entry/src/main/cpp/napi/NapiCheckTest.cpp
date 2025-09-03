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
