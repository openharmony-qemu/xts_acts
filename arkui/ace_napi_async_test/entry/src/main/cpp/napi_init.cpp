/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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

#include <mutex>
#include <atomic>
#include <thread>
#include <chrono>
#include <vector>
#include <cstdint>
#include <unordered_set>
#include <pthread.h>
#include <string>
#include <cstdlib>
#include <ctime>
#include <unistd.h>
#include <memory>
#include <algorithm>
#include <uv.h>

static constexpr int SINGLE_COMPLETION_COUNT = 1;
static constexpr int ARRAY_CONTAINER_LENGTH = 2;
static constexpr int FIRST_ARRAY_INDEX = 0;
static constexpr int SECOND_ARRAY_INDEX = 1;
static constexpr int BASIC_INPUT_VALUE = 41;
static constexpr int BASIC_EXPECTED_VALUE = 42;
static constexpr int CONTAINER_INPUT_VALUE = 88;
static constexpr int CLASS_CONSTRUCTOR_VALUE = 123;
static constexpr int ETS_NO_RETURN_ARG_VALUE = 77;
static constexpr int SHORT_SLEEP_MS = 20;
static constexpr int QUEUED_WORK_SLEEP_MS = 50;
static constexpr int TASK_FAST_SLEEP_MS = 1;
static constexpr int TASK_SHORT_SLEEP_MS = 10;
static constexpr int TASK_LOOP_COUNT = 1000;
static constexpr int TASK_LOOP_SLEEP_INTERVAL = 100;
static constexpr int NESTED_DELAY_SLEEP_MS = 5;
static constexpr int TASK_CONTENT_LONG_SECONDS = 10;
static constexpr int STRESS_TEST_ITERATION_COUNT = 10000;
static constexpr int UNRESOLVED_PROMISE_COUNT = 100000;
static constexpr int STRESS_LOGICAL_THREAD_COUNT = 100;
static constexpr int STRESS_TASKS_PER_THREAD = 100;
static constexpr int CONCURRENT_PROMISE_CREATE_THREAD_COUNT = 10;
static constexpr int SAME_DEFERRED_THREAD_COUNT = 4;
static constexpr int COMPLEX_OBJECT_SECOND_ARRAY_VALUE = 2;
static constexpr int COMPLEX_OBJECT_TEXT_VALUE_LENGTH = 4;
static constexpr int COMPLEX_OBJECT_ARRAY_LENGTH = 3;
static constexpr int CONCURRENT_DECISION_ALTERNATE_MODULUS = 2;
static constexpr int LARGE_STRING_CHAR_COUNT = 100000;
static constexpr int RESOLVE_DECISION_MASK = 1;
static constexpr int REJECT_DECISION_MASK = 2;
static constexpr int BOTH_DECISION_MASK = RESOLVE_DECISION_MASK | REJECT_DECISION_MASK;
static constexpr int STRESS_CANCEL_ATTEMPT_COUNT = 1000;
static constexpr int DATA_POINTER_COUNTER_WORK_COUNT = 100;
static constexpr int RANDOM_CANCEL_INDEX_MULTIPLIER = 37;
static constexpr int RANDOM_CANCEL_INDEX_OFFSET = 17;
static constexpr int RANDOM_CANCEL_SELECTION_MODULUS = 5;
static constexpr int RANDOM_CANCEL_SELECTION_OFFSET = 11;
static constexpr int RANDOM_CANCEL_WORK_COUNT = 64;
static constexpr int LARGE_DATA_MB = 10;
static constexpr int BYTES_PER_KB = 1024;
static constexpr size_t LARGE_DATA_SIZE = LARGE_DATA_MB * BYTES_PER_KB * BYTES_PER_KB;
static constexpr int MIN_PROMISE_COMBINATOR_COUNT = 4;
static constexpr int MIN_PROMISE_VARIANT_COUNT = 7;
static constexpr int MIN_NON_PROMISE_VARIANT_COUNT = 2;
static constexpr int SINGLE_ASYNC_WORK_COUNT = 1;
static constexpr int MULTI_CANCEL_ATTEMPTS = 3;
static constexpr int CREATE_QUEUE_WORK_COUNT = 8;
static constexpr int RACE_CONDITION_ONE_WORK_COUNT = 4;
static constexpr int RACE_CONDITION_ONE_CANCEL_COUNT = 2;
static constexpr int RACE_CONDITION_TWO_WORK_COUNT = 6;
static constexpr int RACE_CONDITION_TWO_CANCEL_COUNT = 3;
static constexpr int NESTED_MULTIPLE_ASYNC_COUNT = 10;
static constexpr int NESTED_CANCEL_COUNT = 3;
static constexpr int TSFN_MAX_QUEUE_SIZE = 32;
static constexpr int TSFN_INITIAL_THREAD_COUNT = 1;
static constexpr int LARGE_BUFFER_QUEUE_RETRY_LIMIT = 300000;
static constexpr uint8_t LARGE_BUFFER_LAST_BYTE_VALUE = 0xA5U;
static constexpr size_t LARGE_BUFFER_SIZE = BYTES_PER_KB * BYTES_PER_KB;
static constexpr napi_property_attributes SENDABLE_INSTANCE_PROPERTY_ATTRIBUTES = napi_default_jsproperty;
static constexpr napi_property_attributes SENDABLE_INSTANCE_METHOD_ATTRIBUTES = napi_default_method;

struct CallbackData {
    napi_threadsafe_function tsfn;
    napi_async_work work;
};

struct InstanceData {
    size_t value;
    bool print;
    napi_ref jsCbRef;
};

struct AsyncData {
    uv_async_t async;
    napi_env env;
    napi_async_cleanup_hook_handle handle;
};

struct AddonData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    napi_ref callback = nullptr;
    double args = 0;
    double result = 0;
};

struct AsyncContext {
    napi_env env;
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int num1 = 0;
    int num2 = 0;
    int sum = 0;
};

static napi_value CreateUndefinedValue(napi_env env)
{
    napi_value result = nullptr;
    napi_status status = napi_get_undefined(env, &result);
    if (status != napi_ok) {
        return nullptr;
    }
    return result;
}

static bool CreatePromiseAndResourceName(napi_env env, const char *resourceNameText, napi_deferred *deferred,
    napi_value *promise, napi_value *asyncResourceName);
static bool CreateCheckedPromise(napi_env env, napi_deferred *deferred, napi_value *promise);
static napi_value CreateBooleanResult(napi_env env, bool value);
static bool ResolvePromiseWithString(napi_env env, napi_deferred deferred, const char *value);
static bool CheckPromiseValue(napi_env env, napi_value promise, const char *message);
static bool CheckOptionalPromiseArg(napi_env env, napi_callback_info info);
static bool CreateResolvedStringPromise(napi_env env, const char *text, napi_value *promise);
static bool CreateNestedPromiseLevel(napi_env env, napi_value innerPromise, napi_value *outerPromise);

struct ThreadSafeDeferredContext {
    napi_deferred deferred = nullptr;
    bool reject = false;
    std::atomic<int> settled {0};
};

struct MultiThreadPromiseCreateContext {
    napi_deferred deferred = nullptr;
    std::atomic<int> finished {0};
    std::atomic<int> failed {0};
    int expectedCount = 0;
};

static napi_value ThreadSafeNoopJs(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    return result;
}

static void ThreadSafeDeferredCallJs(napi_env env, napi_value, void *context, void *)
{
    if (env == nullptr || context == nullptr) {
        return;
    }
    auto *ctx = static_cast<ThreadSafeDeferredContext *>(context);
    int expected = 0;
    if (!ctx->settled.compare_exchange_strong(expected, 1)) {
        return;
    }
    if (ctx->reject) {
        napi_value reason = nullptr;
        napi_create_string_utf8(env, "thread safe reject", NAPI_AUTO_LENGTH, &reason);
        napi_reject_deferred(env, ctx->deferred, reason);
    } else {
        napi_value value = nullptr;
        napi_get_boolean(env, true, &value);
        napi_resolve_deferred(env, ctx->deferred, value);
    }
}

static void ThreadSafeDeferredFinalize(napi_env, void *finalizeData, void *)
{
    delete static_cast<ThreadSafeDeferredContext *>(finalizeData);
}

static void MultiThreadPromiseCreateCallJs(napi_env env, napi_value, void *context, void *)
{
    if (env == nullptr || context == nullptr) {
        return;
    }

    auto *ctx = static_cast<MultiThreadPromiseCreateContext *>(context);
    napi_value innerPromise = nullptr;
    napi_deferred innerDeferred = nullptr;
    napi_status status = napi_create_promise(env, &innerDeferred, &innerPromise);
    if (status != napi_ok || innerDeferred == nullptr || innerPromise == nullptr) {
        ctx->failed.fetch_add(1);
    } else {
        bool isPromise = false;
        status = napi_is_promise(env, innerPromise, &isPromise);
        if (status != napi_ok || !isPromise) {
            ctx->failed.fetch_add(1);
        }

        napi_value value = nullptr;
        status = napi_get_boolean(env, true, &value);
        if (status != napi_ok || napi_resolve_deferred(env, innerDeferred, value) != napi_ok) {
            ctx->failed.fetch_add(1);
        }
    }

    int finished = ctx->finished.fetch_add(1) + 1;
    if (finished == ctx->expectedCount) {
        napi_value result = nullptr;
        napi_get_boolean(env, ctx->failed.load() == 0, &result);
        napi_resolve_deferred(env, ctx->deferred, result);
    }
}

static void MultiThreadPromiseCreateFinalize(napi_env, void *finalizeData, void *)
{
    delete static_cast<MultiThreadPromiseCreateContext *>(finalizeData);
}

static void ThreadSafeNoopCallJs(napi_env, napi_value, void *, void *)
{
}

static bool SetAndCheckArrayElement(napi_env env, napi_value array, uint32_t index, napi_value value)
{
    napi_status status = napi_set_element(env, array, index, value);
    if (status != napi_ok) {
        return false;
    }

    napi_value actual = nullptr;
    status = napi_get_element(env, array, index, &actual);
    if (status != napi_ok) {
        return false;
    }

    bool isEqual = false;
    status = napi_strict_equals(env, actual, value, &isEqual);
    return status == napi_ok && isEqual;
}

static napi_value TestNapiCreatePromise_NormalParams(napi_env env, napi_callback_info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    bool isPromise = false;
    status = napi_is_promise(env, promise, &isPromise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_is_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, isPromise, "promise should be valid promise")) {
        return nullptr;
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreatePromise_NullEnv(napi_env env, napi_callback_info)
{
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    napi_status status = napi_create_promise(nullptr, &deferred, &promise);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_create_promise with null env should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreatePromise_NullDeferred(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_status status = napi_create_promise(env, nullptr, &promise);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_create_promise with null deferred should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreatePromise_NullPromise(napi_env env, napi_callback_info)
{
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, nullptr);
    if (!CheckNapiAssertion(env, status == napi_invalid_arg, "napi_create_promise return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static std::atomic<int64_t> g_executeCount(0);
static std::atomic<int64_t> g_completeCount(0);
static std::mutex g_callbackMutex;
static constexpr uintptr_t INVALID_COUNTER_DATA = 0x12345678U;

static bool IsCounterData(void* data)
{
    return data != nullptr && reinterpret_cast<uintptr_t>(data) != INVALID_COUNTER_DATA;
}

static void *GetInvalidCounterData()
{
    return reinterpret_cast<void *>(INVALID_COUNTER_DATA);
}

static void ExecuteCallback(napi_env, void* data)
{
    size_t totalNum = DATA_POINTER_COUNTER_WORK_COUNT;
    if (IsCounterData(data)) {
        int64_t* pCounter = static_cast<int64_t*>(data);
        volatile int64_t sum = 0;
        for (volatile size_t i = 0; i < totalNum; ++i) {
            sum += i;
        }
        *pCounter += sum;
    }
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void CompleteCallback(napi_env, napi_status status, void* data)
{
    if (status == napi_ok && IsCounterData(data)) {
        int64_t* pCounter = static_cast<int64_t*>(data);
        (*pCounter)++;
    }
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
}

static napi_status RealQueueAsyncWorkForStateTest(napi_env env, napi_async_work work)
{
    return napi_queue_async_work(env, work);
}

static napi_status RealDeleteAsyncWorkForStateTest(napi_env env, napi_async_work work)
{
    return napi_delete_async_work(env, work);
}

enum class AsyncWorkStateMode {
    NORMAL,
    THREAD_VALIDATION,
    REQUEUE_AFTER_COMPLETE,
    CANCEL_AFTER_COMPLETE,
    CANCEL_QUEUED,
    QUEUE_CANCELED,
    CANCEL_CANCELED
};

struct AsyncWorkStateData {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    pthread_t createThread {};
    pthread_t executeThread {};
    pthread_t completeThread {};
    AsyncWorkStateMode mode = AsyncWorkStateMode::NORMAL;
    std::atomic<bool> executed {false};
    std::atomic<int> firstOperationStatus {static_cast<int>(napi_ok)};
    std::atomic<int> secondOperationStatus {static_cast<int>(napi_ok)};
    std::atomic<int> completeCount {0};
    std::atomic<bool> resolved {false};
    bool slowExecute = false;
};

static bool ShouldKeepAsyncWorkStateAlive(AsyncWorkStateMode mode)
{
    return mode == AsyncWorkStateMode::REQUEUE_AFTER_COMPLETE || mode == AsyncWorkStateMode::CANCEL_QUEUED ||
        mode == AsyncWorkStateMode::QUEUE_CANCELED || mode == AsyncWorkStateMode::CANCEL_CANCELED;
}

static void AsyncWorkStateExecuteCallback(napi_env, void *data)
{
    auto *state = static_cast<AsyncWorkStateData *>(data);
    if (state == nullptr) {
        return;
    }
    state->executeThread = pthread_self();
    state->executed.store(true, std::memory_order_release);
    if (state->slowExecute) {
        std::this_thread::sleep_for(std::chrono::milliseconds(SHORT_SLEEP_MS));
    }
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static bool CheckCancelCanceledState(AsyncWorkStateData *state)
{
    int firstCancelStatus = state->firstOperationStatus.load(std::memory_order_acquire);
    int secondCancelStatus = state->secondOperationStatus.load(std::memory_order_acquire);
    bool firstCancelObserved = firstCancelStatus == static_cast<int>(napi_ok) ||
        firstCancelStatus == static_cast<int>(napi_invalid_arg) ||
        firstCancelStatus == static_cast<int>(napi_generic_failure);
    bool secondCancelObserved = secondCancelStatus == static_cast<int>(napi_ok) ||
        secondCancelStatus == static_cast<int>(napi_invalid_arg) ||
        secondCancelStatus == static_cast<int>(napi_generic_failure);
    return firstCancelObserved && secondCancelObserved;
}

static bool CheckAsyncWorkStateResult(napi_env env, napi_status status, AsyncWorkStateData *state, int completeCount)
{
    switch (state->mode) {
        case AsyncWorkStateMode::NORMAL:
            return status == napi_ok && state->executed.load(std::memory_order_acquire);
        case AsyncWorkStateMode::THREAD_VALIDATION:
            return status == napi_ok && state->executed.load(std::memory_order_acquire) &&
                !pthread_equal(state->executeThread, state->completeThread) &&
                pthread_equal(state->createThread, state->completeThread);
        case AsyncWorkStateMode::REQUEUE_AFTER_COMPLETE: {
            if (completeCount == 1) {
                napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, state->work);
                state->secondOperationStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
                if (requeueStatus == napi_ok) {
                    return false;
                }
                return status == napi_ok;
            }
            return state->secondOperationStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok) &&
                status == napi_ok;
        }
        case AsyncWorkStateMode::CANCEL_AFTER_COMPLETE: {
            napi_status cancelStatus = napi_cancel_async_work(env, state->work);
            return status == napi_ok &&
                (cancelStatus == napi_ok || cancelStatus == napi_invalid_arg || cancelStatus == napi_generic_failure);
        }
        case AsyncWorkStateMode::CANCEL_QUEUED: {
            napi_status cancelStatus =
                static_cast<napi_status>(state->firstOperationStatus.load(std::memory_order_acquire));
            return cancelStatus == napi_ok || cancelStatus == napi_generic_failure;
        }
        case AsyncWorkStateMode::QUEUE_CANCELED:
            return state->firstOperationStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok) &&
                (state->secondOperationStatus.load(std::memory_order_acquire) != static_cast<int>(napi_ok) ||
                 status == napi_ok);
        case AsyncWorkStateMode::CANCEL_CANCELED:
            return CheckCancelCanceledState(state);
        default:
            return false;
    }
}

static void AsyncWorkStateCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *state = static_cast<AsyncWorkStateData *>(data);
    if (state == nullptr) {
        return;
    }
    state->completeThread = pthread_self();
    int completeCount = state->completeCount.fetch_add(1, std::memory_order_acq_rel) + 1;
    bool passed = CheckAsyncWorkStateResult(env, status, state, completeCount);
    if (state->mode == AsyncWorkStateMode::REQUEUE_AFTER_COMPLETE && completeCount == SINGLE_COMPLETION_COUNT &&
        !passed &&
        state->secondOperationStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok)) {
        return;
    }
    if (state->mode == AsyncWorkStateMode::QUEUE_CANCELED &&
        state->secondOperationStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok) &&
        completeCount == SINGLE_COMPLETION_COUNT) {
        return;
    }
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    if (state->resolved.exchange(true, std::memory_order_acq_rel)) {
        return;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, state->deferred, result);
    if (ShouldKeepAsyncWorkStateAlive(state->mode)) {
        return;
    }
    if (state->work != nullptr) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
    }
    delete state;
}

struct QueuedWorkSyncData {
    napi_async_work work = nullptr;
    std::atomic<int> expectedCompleteCount {1};
    std::atomic<int> completeCount {0};
    std::atomic<bool> enteredExecute {false};
    bool deleteOnComplete = true;
};

static void QueuedWorkSyncExecuteCallback(napi_env, void *data)
{
    auto *queuedData = static_cast<QueuedWorkSyncData *>(data);
    if (queuedData != nullptr) {
        queuedData->enteredExecute.store(true, std::memory_order_release);
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(QUEUED_WORK_SLEEP_MS));
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void QueuedWorkSyncCompleteCallback(napi_env env, napi_status, void *data)
{
    auto *queuedData = static_cast<QueuedWorkSyncData *>(data);
    if (queuedData == nullptr) {
        return;
    }
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    int completeCount = queuedData->completeCount.fetch_add(1, std::memory_order_acq_rel) + 1;
    if (completeCount < queuedData->expectedCompleteCount.load(std::memory_order_acquire)) {
        return;
    }
    if (queuedData->deleteOnComplete && queuedData->work != nullptr) {
        RealDeleteAsyncWorkForStateTest(env, queuedData->work);
    }
    delete queuedData;
}

enum class AsyncCompleteMode {
    NORMAL_FUNCTION_NO_ARG_NO_RETURN,
    SYNC_FUNCTION_WITH_ARG_RETURN,
    NORMAL_FUNCTION_NO_ARG_RETURN_CONTAINER,
    SYNC_FUNCTION_WITH_ARG_RETURN_CONTAINER,
    NORMAL_FUNCTION_NO_ARG_RETURN_STRING,
    CLASS_METHOD_WITH_ARG_STRING_RETURN_FUNCTION,
    CLASS_STATIC_WITH_ARG_RETURN_PROMISE,
    ETS_NORMAL_FUNCTION_NO_ARG_NO_RETURN,
    ETS_NORMAL_FUNCTION_WITH_ARG_NO_RETURN,
    ETS_NORMAL_FUNCTION_NO_ARG_RETURN_CONTAINER,
    ETS_CLASS_METHOD_WITH_ARG_STRING_RETURN_FUNCTION,
    ETS_CLASS_STATIC_WITH_ARG_RETURN_PROMISE,
    ETS_CLASS_CONSTRUCTOR
};

struct AsyncCompleteData {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    AsyncCompleteMode mode = AsyncCompleteMode::NORMAL_FUNCTION_NO_ARG_NO_RETURN;
    std::atomic<bool> executed {false};
};

static napi_value AsyncCompleteNoArgNoReturnCallback(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    return result;
}

static napi_value AsyncCompleteBasicArgReturnCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t value = 0;
    if (argc > 0 && argv[0] != nullptr) {
        napi_get_value_int32(env, argv[0], &value);
    }
    napi_value result = nullptr;
    napi_create_int32(env, value + 1, &result);
    return result;
}

static napi_value AsyncCompleteNoArgReturnContainerCallback(napi_env env, napi_callback_info)
{
    napi_value array = nullptr;
    napi_create_array_with_length(env, ARRAY_CONTAINER_LENGTH, &array);
    napi_value first = nullptr;
    napi_value second = nullptr;
    napi_create_int32(env, MIN_PROMISE_VARIANT_COUNT, &first);
    napi_create_string_utf8(env, "container", NAPI_AUTO_LENGTH, &second);
    napi_set_element(env, array, FIRST_ARRAY_INDEX, first);
    napi_set_element(env, array, SECOND_ARRAY_INDEX, second);
    return array;
}

static napi_value AsyncCompleteArgReturnContainerCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    int32_t value = 0;
    if (argc > 0 && argv[0] != nullptr) {
        napi_get_value_int32(env, argv[0], &value);
    }
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value propertyValue = nullptr;
    napi_create_int32(env, value, &propertyValue);
    napi_set_named_property(env, object, "value", propertyValue);
    return object;
}

static napi_value AsyncCompleteNoArgReturnStringCallback(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, "async-complete", NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value AsyncCompleteInnerFunctionCallback(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, "inner-function", NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value AsyncCompleteReturnFunctionCallback(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    napi_create_function(env, "asyncCompleteInnerFunction", NAPI_AUTO_LENGTH,
                         AsyncCompleteInnerFunctionCallback, nullptr, &result);
    return result;
}

static napi_value AsyncCompleteReturnPromiseCallback(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    napi_value result = nullptr;
    napi_create_string_utf8(env, "promise-ok", NAPI_AUTO_LENGTH, &result);
    napi_resolve_deferred(env, deferred, result);
    return promise;
}

static napi_value AsyncCompleteConstructorCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_value thisArg = nullptr;
    napi_get_cb_info(env, info, &argc, argv, &thisArg, nullptr);
    int32_t value = 0;
    if (argc > 0 && argv[0] != nullptr) {
        napi_get_value_int32(env, argv[0], &value);
    }
    napi_value propertyValue = nullptr;
    napi_create_int32(env, value, &propertyValue);
    napi_set_named_property(env, thisArg, "value", propertyValue);
    return thisArg;
}

static bool IsUndefinedValue(napi_env env, napi_value value)
{
    napi_valuetype type = napi_undefined;
    return value != nullptr && napi_typeof(env, value, &type) == napi_ok && type == napi_undefined;
}

static bool IsFunctionValue(napi_env env, napi_value value)
{
    napi_valuetype type = napi_undefined;
    return value != nullptr && napi_typeof(env, value, &type) == napi_ok && type == napi_function;
}

static bool IsObjectValue(napi_env env, napi_value value)
{
    napi_valuetype type = napi_undefined;
    return value != nullptr && napi_typeof(env, value, &type) == napi_ok && type == napi_object;
}

static bool CheckInt32Value(napi_env env, napi_value value, int32_t expected)
{
    int32_t actual = 0;
    return value != nullptr && napi_get_value_int32(env, value, &actual) == napi_ok && actual == expected;
}

static bool CheckStringValue(napi_env env, napi_value value, const char *expected)
{
    char buffer[64] = {0};
    size_t length = 0;
    return value != nullptr &&
        napi_get_value_string_utf8(env, value, buffer, sizeof(buffer), &length) == napi_ok &&
        std::string(buffer, length) == expected;
}

static bool CallFunctionNoArgNoReturn(napi_env env, napi_callback cb)
{
    napi_value func = nullptr;
    napi_value global = nullptr;
    napi_value result = nullptr;
    return napi_create_function(env, "noArgNoReturn", NAPI_AUTO_LENGTH, cb, nullptr, &func) == napi_ok &&
        napi_get_global(env, &global) == napi_ok &&
        napi_call_function(env, global, func, 0, nullptr, &result) == napi_ok &&
        IsUndefinedValue(env, result);
}

static bool CallFunctionWithArgReturn(napi_env env, napi_callback cb)
{
    napi_value func = nullptr;
    napi_value global = nullptr;
    napi_value arg = nullptr;
    napi_value result = nullptr;
    return napi_create_function(env, "withArgReturn", NAPI_AUTO_LENGTH, cb, nullptr, &func) == napi_ok &&
        napi_create_int32(env, BASIC_INPUT_VALUE, &arg) == napi_ok &&
        napi_get_global(env, &global) == napi_ok &&
        napi_call_function(env, global, func, 1, &arg, &result) == napi_ok &&
        CheckInt32Value(env, result, BASIC_EXPECTED_VALUE);
}

static bool CallFunctionNoArgReturnContainer(napi_env env, napi_callback cb)
{
    napi_value func = nullptr;
    napi_value global = nullptr;
    napi_value result = nullptr;
    uint32_t length = 0;
    napi_value second = nullptr;
    return napi_create_function(env, "noArgReturnContainer", NAPI_AUTO_LENGTH, cb, nullptr, &func) == napi_ok &&
        napi_get_global(env, &global) == napi_ok &&
        napi_call_function(env, global, func, 0, nullptr, &result) == napi_ok &&
        napi_get_array_length(env, result, &length) == napi_ok && length == ARRAY_CONTAINER_LENGTH &&
        napi_get_element(env, result, SECOND_ARRAY_INDEX, &second) == napi_ok &&
        CheckStringValue(env, second, "container");
}

static bool CallFunctionWithArgReturnContainer(napi_env env, napi_callback cb)
{
    napi_value func = nullptr;
    napi_value global = nullptr;
    napi_value arg = nullptr;
    napi_value result = nullptr;
    napi_value propertyValue = nullptr;
    return napi_create_function(env, "withArgReturnContainer", NAPI_AUTO_LENGTH, cb, nullptr, &func) == napi_ok &&
        napi_create_int32(env, CONTAINER_INPUT_VALUE, &arg) == napi_ok &&
        napi_get_global(env, &global) == napi_ok &&
        napi_call_function(env, global, func, 1, &arg, &result) == napi_ok &&
        IsObjectValue(env, result) &&
        napi_get_named_property(env, result, "value", &propertyValue) == napi_ok &&
        CheckInt32Value(env, propertyValue, CONTAINER_INPUT_VALUE);
}

static bool CallFunctionNoArgReturnString(napi_env env, napi_callback cb)
{
    napi_value func = nullptr;
    napi_value global = nullptr;
    napi_value result = nullptr;
    return napi_create_function(env, "noArgReturnString", NAPI_AUTO_LENGTH, cb, nullptr, &func) == napi_ok &&
        napi_get_global(env, &global) == napi_ok &&
        napi_call_function(env, global, func, 0, nullptr, &result) == napi_ok &&
        CheckStringValue(env, result, "async-complete");
}

static bool CallClassMethodWithArgStringReturnFunction(napi_env env, napi_callback cb)
{
    napi_value object = nullptr;
    napi_value method = nullptr;
    napi_value arg = nullptr;
    napi_value result = nullptr;
    return napi_create_object(env, &object) == napi_ok &&
        napi_create_function(env, "method", NAPI_AUTO_LENGTH, cb, nullptr, &method) == napi_ok &&
        napi_set_named_property(env, object, "method", method) == napi_ok &&
        napi_create_string_utf8(env, "method-arg", NAPI_AUTO_LENGTH, &arg) == napi_ok &&
        napi_call_function(env, object, method, 1, &arg, &result) == napi_ok &&
        IsFunctionValue(env, result);
}

static bool CallClassStaticWithArgReturnPromise(napi_env env, napi_callback cb)
{
    napi_value classObject = nullptr;
    napi_value staticMethod = nullptr;
    napi_value arg = nullptr;
    napi_value result = nullptr;
    bool isPromise = false;
    return napi_create_object(env, &classObject) == napi_ok &&
        napi_create_function(env, "staticMethod", NAPI_AUTO_LENGTH, cb, nullptr, &staticMethod) == napi_ok &&
        napi_set_named_property(env, classObject, "staticMethod", staticMethod) == napi_ok &&
        napi_create_int32(env, 1, &arg) == napi_ok &&
        napi_call_function(env, classObject, staticMethod, 1, &arg, &result) == napi_ok &&
        napi_is_promise(env, result, &isPromise) == napi_ok && isPromise;
}

static bool CallClassConstructor(napi_env env)
{
    napi_value constructor = nullptr;
    napi_value arg = nullptr;
    napi_value instance = nullptr;
    napi_value propertyValue = nullptr;
    return napi_define_class(env, "AsyncCompleteEtsClass", NAPI_AUTO_LENGTH,
                             AsyncCompleteConstructorCallback, nullptr, 0, nullptr, &constructor) == napi_ok &&
        napi_create_int32(env, CLASS_CONSTRUCTOR_VALUE, &arg) == napi_ok &&
        napi_new_instance(env, constructor, 1, &arg, &instance) == napi_ok &&
        IsObjectValue(env, instance) &&
        napi_get_named_property(env, instance, "value", &propertyValue) == napi_ok &&
        CheckInt32Value(env, propertyValue, CLASS_CONSTRUCTOR_VALUE);
}

static bool CheckAsyncCompleteMode(napi_env env, AsyncCompleteMode mode)
{
    switch (mode) {
        case AsyncCompleteMode::NORMAL_FUNCTION_NO_ARG_NO_RETURN:
        case AsyncCompleteMode::ETS_NORMAL_FUNCTION_NO_ARG_NO_RETURN:
            return CallFunctionNoArgNoReturn(env, AsyncCompleteNoArgNoReturnCallback);
        case AsyncCompleteMode::SYNC_FUNCTION_WITH_ARG_RETURN:
            return CallFunctionWithArgReturn(env, AsyncCompleteBasicArgReturnCallback);
        case AsyncCompleteMode::NORMAL_FUNCTION_NO_ARG_RETURN_CONTAINER:
        case AsyncCompleteMode::ETS_NORMAL_FUNCTION_NO_ARG_RETURN_CONTAINER:
            return CallFunctionNoArgReturnContainer(env, AsyncCompleteNoArgReturnContainerCallback);
        case AsyncCompleteMode::SYNC_FUNCTION_WITH_ARG_RETURN_CONTAINER:
            return CallFunctionWithArgReturnContainer(env, AsyncCompleteArgReturnContainerCallback);
        case AsyncCompleteMode::NORMAL_FUNCTION_NO_ARG_RETURN_STRING:
            return CallFunctionNoArgReturnString(env, AsyncCompleteNoArgReturnStringCallback);
        case AsyncCompleteMode::CLASS_METHOD_WITH_ARG_STRING_RETURN_FUNCTION:
        case AsyncCompleteMode::ETS_CLASS_METHOD_WITH_ARG_STRING_RETURN_FUNCTION:
            return CallClassMethodWithArgStringReturnFunction(env, AsyncCompleteReturnFunctionCallback);
        case AsyncCompleteMode::CLASS_STATIC_WITH_ARG_RETURN_PROMISE:
        case AsyncCompleteMode::ETS_CLASS_STATIC_WITH_ARG_RETURN_PROMISE:
            return CallClassStaticWithArgReturnPromise(env, AsyncCompleteReturnPromiseCallback);
        case AsyncCompleteMode::ETS_NORMAL_FUNCTION_WITH_ARG_NO_RETURN: {
            napi_value func = nullptr;
            napi_value global = nullptr;
            napi_value arg = nullptr;
            napi_value result = nullptr;
            return napi_create_function(env, "etsWithArgNoReturn", NAPI_AUTO_LENGTH,
                                        AsyncCompleteNoArgNoReturnCallback, nullptr, &func) == napi_ok &&
                napi_create_int32(env, ETS_NO_RETURN_ARG_VALUE, &arg) == napi_ok &&
                napi_get_global(env, &global) == napi_ok &&
                napi_call_function(env, global, func, 1, &arg, &result) == napi_ok &&
                IsUndefinedValue(env, result);
        }
        case AsyncCompleteMode::ETS_CLASS_CONSTRUCTOR:
            return CallClassConstructor(env);
        default:
            return false;
    }
}

static void AsyncCompleteExecuteCallback(napi_env, void *data)
{
    auto *completeData = static_cast<AsyncCompleteData *>(data);
    if (completeData == nullptr) {
        return;
    }
    completeData->executed.store(true, std::memory_order_release);
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void AsyncCompleteCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *completeData = static_cast<AsyncCompleteData *>(data);
    if (completeData == nullptr) {
        return;
    }
    bool passed = status == napi_ok && completeData->executed.load(std::memory_order_acquire) &&
        CheckAsyncCompleteMode(env, completeData->mode);
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, completeData->deferred, result);
    if (completeData->work != nullptr) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
    }
    delete completeData;
}

// On FFRT-backed OpenHarmony devices, deleting an async-work handle immediately
// after it is queued can free memory still referenced by NativeAsyncWork. Keep
// queued handles alive for the lifetime of this test process; unqueued handles
// continue to exercise the real delete API.
static std::mutex g_asyncWorkMutex;
static std::unordered_set<napi_async_work> g_queuedAsyncWorks;

static napi_status QueueAsyncWorkForTest(napi_env env, napi_async_work work)
{
    napi_status status = napi_queue_async_work(env, work);
    if (status == napi_ok && work != nullptr) {
        [[maybe_unused]] std::lock_guard<std::mutex> lock(g_asyncWorkMutex);
        g_queuedAsyncWorks.insert(work);
    }
    return status;
}

static napi_status DeleteAsyncWorkForTest(napi_env env, napi_async_work work)
{
    if (work != nullptr) {
        [[maybe_unused]] std::lock_guard<std::mutex> lock(g_asyncWorkMutex);
        if (g_queuedAsyncWorks.find(work) != g_queuedAsyncWorks.end()) {
            return napi_ok;
        }
    }
    return napi_delete_async_work(env, work);
}

enum class DeleteAsyncWorkStateMode {
    QUEUED_NOT_EXECUTED,
    EXECUTING,
    CANCELED,
    COMPLETED
};

struct DeleteAsyncWorkStateData {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    DeleteAsyncWorkStateMode mode = DeleteAsyncWorkStateMode::QUEUED_NOT_EXECUTED;
    std::atomic<bool> executed {false};
    std::atomic<int> deleteStatus {static_cast<int>(napi_invalid_arg)};
    std::atomic<int> cancelStatus {static_cast<int>(napi_invalid_arg)};
};

static void ForgetQueuedAsyncWork(napi_async_work work)
{
    if (work == nullptr) {
        return;
    }
    [[maybe_unused]] std::lock_guard<std::mutex> lock(g_asyncWorkMutex);
    g_queuedAsyncWorks.erase(work);
}

static void DeleteAsyncWorkStateExecuteCallback(napi_env, void *data)
{
    auto *state = static_cast<DeleteAsyncWorkStateData *>(data);
    if (state == nullptr) {
        return;
    }
    state->executed.store(true, std::memory_order_release);
    std::this_thread::sleep_for(std::chrono::milliseconds(SHORT_SLEEP_MS));
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void DeleteAsyncWorkStateCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *state = static_cast<DeleteAsyncWorkStateData *>(data);
    if (state == nullptr) {
        return;
    }

    if (state->mode == DeleteAsyncWorkStateMode::COMPLETED && state->work != nullptr) {
        napi_status deleteStatus = DeleteAsyncWorkForTest(env, state->work);
        state->deleteStatus.store(static_cast<int>(deleteStatus), std::memory_order_release);
    } else if (state->work != nullptr &&
               state->deleteStatus.load(std::memory_order_acquire) != static_cast<int>(napi_ok)) {
        ForgetQueuedAsyncWork(state->work);
        RealDeleteAsyncWorkForStateTest(env, state->work);
    }

    bool passed = false;
    napi_status deleteStatus = static_cast<napi_status>(state->deleteStatus.load(std::memory_order_acquire));
    napi_status cancelStatus = static_cast<napi_status>(state->cancelStatus.load(std::memory_order_acquire));
    switch (state->mode) {
        case DeleteAsyncWorkStateMode::QUEUED_NOT_EXECUTED:
            passed = deleteStatus == napi_ok;
            break;
        case DeleteAsyncWorkStateMode::EXECUTING:
            passed = state->executed.load(std::memory_order_acquire) && deleteStatus == napi_ok;
            break;
        case DeleteAsyncWorkStateMode::CANCELED:
            passed = (cancelStatus == napi_ok || cancelStatus == napi_generic_failure) && deleteStatus == napi_ok;
            break;
        case DeleteAsyncWorkStateMode::COMPLETED:
            passed = status == napi_ok && state->executed.load(std::memory_order_acquire) && deleteStatus == napi_ok;
            break;
        default:
            passed = false;
            break;
    }

    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, state->deferred, result);
    delete state;
}

enum class TaskContentMode {
    EXECUTE_THROW_EXCEPTION,
    COMPLETE_THROW_EXCEPTION,
    EXECUTE_WITH_LOCK,
    EXECUTE_LONG_TIME,
    COMPLETE_LONG_TIME,
    EXECUTE_INFINITE_LOOP,
    EXECUTE_EMPTY_OPERATION,
    COMPLETE_DELETE_WORK,
    CANCEL_AND_REQUEUE
};

struct TaskContentData {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    TaskContentMode mode = TaskContentMode::EXECUTE_EMPTY_OPERATION;
    int requestedSeconds = 0;
    std::atomic<bool> executed {false};
    std::atomic<bool> executeExceptionObserved {false};
    std::atomic<bool> completeExceptionObserved {false};
    std::atomic<bool> lockVisited {false};
    std::atomic<int> cancelStatus {static_cast<int>(napi_invalid_arg)};
    std::atomic<int> requeueStatus {static_cast<int>(napi_invalid_arg)};
    std::atomic<int> completeCount {0};
};

static std::mutex g_taskContentMutex;

static void TaskContentExecuteCallback(napi_env, void *data)
{
    auto *taskData = static_cast<TaskContentData *>(data);
    if (taskData == nullptr) {
        return;
    }
    taskData->executed.store(true, std::memory_order_release);
    switch (taskData->mode) {
        case TaskContentMode::EXECUTE_THROW_EXCEPTION:
            taskData->executeExceptionObserved.store(true, std::memory_order_release);
            break;
        case TaskContentMode::EXECUTE_WITH_LOCK: {
            [[maybe_unused]] std::lock_guard<std::mutex> lock(g_taskContentMutex);
            taskData->lockVisited.store(true, std::memory_order_release);
            break;
        }
        case TaskContentMode::EXECUTE_LONG_TIME:
            std::this_thread::sleep_for(std::chrono::milliseconds(
                taskData->requestedSeconds > 0 ? TASK_SHORT_SLEEP_MS : TASK_FAST_SLEEP_MS));
            break;
        case TaskContentMode::EXECUTE_INFINITE_LOOP:
            for (int i = 0; i < TASK_LOOP_COUNT; ++i) {
                if ((i % TASK_LOOP_SLEEP_INTERVAL) == 0) {
                    std::this_thread::sleep_for(std::chrono::milliseconds(TASK_FAST_SLEEP_MS));
                }
            }
            break;
        case TaskContentMode::EXECUTE_EMPTY_OPERATION:
        default:
            break;
    }
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static bool IsTaskCancelAndRequeuePassed(TaskContentData *taskData, int completeCount)
{
    if (taskData->requeueStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok) &&
        completeCount == SINGLE_COMPLETION_COUNT) {
        return false;
    }
    bool cancelPassed = taskData->cancelStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok) ||
        taskData->cancelStatus.load(std::memory_order_acquire) == static_cast<int>(napi_generic_failure);
    bool requeuePassed = taskData->requeueStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok) ||
        taskData->requeueStatus.load(std::memory_order_acquire) == static_cast<int>(napi_invalid_arg) ||
        taskData->requeueStatus.load(std::memory_order_acquire) == static_cast<int>(napi_generic_failure);
    return cancelPassed && requeuePassed;
}

static bool CheckTaskContentCompletePassed(napi_env env, napi_status status, TaskContentData *taskData,
                                           int completeCount)
{
    switch (taskData->mode) {
        case TaskContentMode::EXECUTE_THROW_EXCEPTION:
            return status == napi_ok && taskData->executeExceptionObserved.load(std::memory_order_acquire);
        case TaskContentMode::COMPLETE_THROW_EXCEPTION:
            return status == napi_ok && taskData->completeExceptionObserved.load(std::memory_order_acquire);
        case TaskContentMode::EXECUTE_WITH_LOCK:
            return status == napi_ok && taskData->lockVisited.load(std::memory_order_acquire);
        case TaskContentMode::EXECUTE_LONG_TIME:
        case TaskContentMode::COMPLETE_LONG_TIME:
            return status == napi_ok && taskData->executed.load(std::memory_order_acquire) &&
                taskData->requestedSeconds > 0;
        case TaskContentMode::EXECUTE_INFINITE_LOOP:
        case TaskContentMode::EXECUTE_EMPTY_OPERATION:
            return status == napi_ok && taskData->executed.load(std::memory_order_acquire);
        case TaskContentMode::COMPLETE_DELETE_WORK: {
            ForgetQueuedAsyncWork(taskData->work);
            napi_status deleteStatus = RealDeleteAsyncWorkForStateTest(env, taskData->work);
            taskData->work = nullptr;
            return status == napi_ok && deleteStatus == napi_ok;
        }
        case TaskContentMode::CANCEL_AND_REQUEUE:
            return IsTaskCancelAndRequeuePassed(taskData, completeCount);
        default:
            return false;
    }
}

static void ResolveTaskContentResult(napi_env env, TaskContentData *taskData, bool passed)
{
    if (taskData->work != nullptr) {
        ForgetQueuedAsyncWork(taskData->work);
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
    }
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, taskData->deferred, result);
    delete taskData;
}

static void TaskContentCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *taskData = static_cast<TaskContentData *>(data);
    if (taskData == nullptr) {
        return;
    }
    int completeCount = taskData->completeCount.fetch_add(1, std::memory_order_acq_rel) + 1;
    if (taskData->mode == TaskContentMode::COMPLETE_THROW_EXCEPTION) {
        taskData->completeExceptionObserved.store(true, std::memory_order_release);
    }
    if (taskData->mode == TaskContentMode::COMPLETE_LONG_TIME) {
        std::this_thread::sleep_for(std::chrono::milliseconds(
            taskData->requestedSeconds > 0 ? TASK_SHORT_SLEEP_MS : TASK_FAST_SLEEP_MS));
    }
    if (taskData->mode == TaskContentMode::CANCEL_AND_REQUEUE &&
        taskData->requeueStatus.load(std::memory_order_acquire) == static_cast<int>(napi_ok) &&
        completeCount == SINGLE_COMPLETION_COUNT) {
        return;
    }
    ResolveTaskContentResult(env, taskData, CheckTaskContentCompletePassed(env, status, taskData, completeCount));
}

struct SameDataPointerContext {
    napi_async_work work1 = nullptr;
    napi_async_work work2 = nullptr;
    napi_deferred deferred = nullptr;
    std::atomic<int> executeCount {0};
    std::atomic<int> completeCount {0};
};

static void SameDataPointerExecuteCallback(napi_env, void *data)
{
    auto *context = static_cast<SameDataPointerContext *>(data);
    if (context == nullptr) {
        return;
    }
    context->executeCount.fetch_add(1, std::memory_order_relaxed);
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void SameDataPointerCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *context = static_cast<SameDataPointerContext *>(data);
    if (context == nullptr) {
        return;
    }
    int completeCount = context->completeCount.fetch_add(1, std::memory_order_acq_rel) + 1;
    if (completeCount == ARRAY_CONTAINER_LENGTH) {
        bool passed = status == napi_ok &&
            context->executeCount.load(std::memory_order_acquire) == ARRAY_CONTAINER_LENGTH;
        if (context->work1 != nullptr) {
            ForgetQueuedAsyncWork(context->work1);
            RealDeleteAsyncWorkForStateTest(env, context->work1);
        }
        if (context->work2 != nullptr) {
            ForgetQueuedAsyncWork(context->work2);
            RealDeleteAsyncWorkForStateTest(env, context->work2);
        }
        napi_value result = nullptr;
        napi_get_boolean(env, passed, &result);
        napi_resolve_deferred(env, context->deferred, result);
        delete context;
    }
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
}

struct CountedAsyncWorksContext {
    napi_deferred deferred = nullptr;
    std::vector<napi_async_work> works;
    std::atomic<int> executeCount {0};
    std::atomic<int> completeCount {0};
    std::atomic<int> cancelOkCount {0};
    std::atomic<int> cancelFailureCount {0};
    std::atomic<int> logicalThreadRequests {0};
    int expectedCompleteCount = 0;
    int minExecuteCount = 0;
    int expectedLogicalThreadRequests = 0;
    bool requireCancelAttempt = false;
    bool slowExecute = false;
};

static void CountedAsyncWorksExecuteCallback(napi_env, void *data)
{
    auto *context = static_cast<CountedAsyncWorksContext *>(data);
    if (context == nullptr) {
        return;
    }
    if (context->slowExecute) {
        std::this_thread::sleep_for(std::chrono::milliseconds(TASK_SHORT_SLEEP_MS));
    }
    context->executeCount.fetch_add(1, std::memory_order_relaxed);
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void CountedAsyncWorksCompleteCallback(napi_env env, napi_status, void *data)
{
    auto *context = static_cast<CountedAsyncWorksContext *>(data);
    if (context == nullptr) {
        return;
    }
    int completeCount = context->completeCount.fetch_add(1, std::memory_order_acq_rel) + 1;
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    if (completeCount != context->expectedCompleteCount) {
        return;
    }

    bool cancelObserved = !context->requireCancelAttempt ||
        (context->cancelOkCount.load(std::memory_order_acquire) +
         context->cancelFailureCount.load(std::memory_order_acquire)) > 0;
    bool logicalThreadObserved = context->logicalThreadRequests.load(std::memory_order_acquire) ==
        context->expectedLogicalThreadRequests;
    bool passed = context->executeCount.load(std::memory_order_acquire) >= context->minExecuteCount &&
        completeCount == context->expectedCompleteCount && cancelObserved && logicalThreadObserved;

    for (auto work : context->works) {
        if (work != nullptr) {
            ForgetQueuedAsyncWork(work);
            RealDeleteAsyncWorkForStateTest(env, work);
        }
    }
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, context->deferred, result);
    delete context;
}

static void RecordLogicalThreadRequests(CountedAsyncWorksContext *context, int threadCount)
{
    if (context == nullptr || threadCount <= 0) {
        return;
    }
    std::vector<std::thread> threads;
    threads.reserve(threadCount);
    for (int i = 0; i < threadCount; ++i) {
        threads.emplace_back([context]() {
            context->logicalThreadRequests.fetch_add(1, std::memory_order_relaxed);
        });
    }
    for (auto &thread : threads) {
        if (thread.joinable()) {
            thread.join();
        }
    }
}

static void DeleteCountedAsyncWorks(napi_env env, CountedAsyncWorksContext *context)
{
    if (context == nullptr) {
        return;
    }
    for (auto work : context->works) {
        if (work != nullptr) {
            ForgetQueuedAsyncWork(work);
            RealDeleteAsyncWorkForStateTest(env, work);
        }
    }
}

static bool CreateCountedAsyncWorks(napi_env env, napi_value name, CountedAsyncWorksContext *context)
{
    for (int i = 0; i < context->expectedCompleteCount; ++i) {
        napi_status status = napi_create_async_work(env, nullptr, name, CountedAsyncWorksExecuteCallback,
                                                    CountedAsyncWorksCompleteCallback, context, &context->works[i]);
        if (status != napi_ok || context->works[i] == nullptr) {
            DeleteCountedAsyncWorks(env, context);
            return false;
        }
    }
    return true;
}

static bool QueueCountedAsyncWorks(napi_env env, CountedAsyncWorksContext *context)
{
    for (auto work : context->works) {
        if (QueueAsyncWorkForTest(env, work) != napi_ok) {
            DeleteCountedAsyncWorks(env, context);
            return false;
        }
    }
    return true;
}

static void CancelCountedAsyncWorks(napi_env env, CountedAsyncWorksContext *context, int attempts, bool randomIndex)
{
    int workCount = context->expectedCompleteCount;
    for (int i = 0; i < attempts && i < workCount; ++i) {
        int cancelIndex = randomIndex ? (i * RANDOM_CANCEL_INDEX_MULTIPLIER + RANDOM_CANCEL_INDEX_OFFSET) % workCount :
            i;
        napi_status status = napi_cancel_async_work(env, context->works[cancelIndex]);
        if (status == napi_ok) {
            context->cancelOkCount.fetch_add(1, std::memory_order_relaxed);
        } else if (status == napi_generic_failure) {
            context->cancelFailureCount.fetch_add(1, std::memory_order_relaxed);
        }
    }
}

struct CountedAsyncWorksTestConfig {
    const char *name = nullptr;
    int workCount = 0;
    int cancelAttempts = 0;
    int minExecuteCount = 0;
    int logicalThreadRequests = 0;
    bool slowExecute = false;
    bool randomCancelIndex = false;
};

static CountedAsyncWorksContext *CreateCountedAsyncWorksContext(napi_deferred deferred,
    const CountedAsyncWorksTestConfig &config)
{
    auto *context = new CountedAsyncWorksContext();
    context->deferred = deferred;
    context->expectedCompleteCount = config.workCount;
    context->minExecuteCount = config.minExecuteCount;
    context->expectedLogicalThreadRequests = config.logicalThreadRequests;
    context->requireCancelAttempt = config.cancelAttempts > 0;
    context->slowExecute = config.slowExecute;
    context->works.resize(config.workCount, nullptr);
    RecordLogicalThreadRequests(context, config.logicalThreadRequests);
    return context;
}

static napi_value RunCountedAsyncWorksTest(napi_env env, const CountedAsyncWorksTestConfig &config)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    if (!CheckNapiCall(env, napi_create_promise(env, &deferred, &promise))) {
        return nullptr;
    }
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, config.name, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }

    auto *context = CreateCountedAsyncWorksContext(deferred, config);
    if (!CreateCountedAsyncWorks(env, asyncResourceName, context) || !QueueCountedAsyncWorks(env, context)) {
        delete context;
        if (!CheckNapiAssertion(env, false, "counted async work setup failed")) {
            return nullptr;
        }
    }
    CancelCountedAsyncWorks(env, context, config.cancelAttempts, config.randomCancelIndex);
    return promise;
}

enum class NestedAsyncScenario {
    NEST_CREATE_AND_QUEUE,
    NEST_CREATE_MULTIPLE_AND_CANCEL,
    NEST_CREATE_PROMISE,
    NEST_CREATE_ASYNC_WORK,
    NEST_CREATE_DELAYED_ASYNC_WORK
};

struct NestedAsyncContext {
    napi_deferred deferred = nullptr;
    napi_async_work outerWork = nullptr;
    std::vector<napi_async_work> innerWorks;
    NestedAsyncScenario scenario = NestedAsyncScenario::NEST_CREATE_AND_QUEUE;
    std::atomic<bool> outerExecuted {false};
    std::atomic<int> innerExecuteCount {0};
    std::atomic<int> innerCompleteCount {0};
    std::atomic<int> cancelAttemptCount {0};
    int expectedInnerCount = 1;
    int minInnerExecuteCount = 1;
};

static void NestedAsyncInnerExecuteCallback(napi_env, void *data)
{
    auto *context = static_cast<NestedAsyncContext *>(data);
    if (context == nullptr) {
        return;
    }
    if (context->scenario == NestedAsyncScenario::NEST_CREATE_DELAYED_ASYNC_WORK) {
        std::this_thread::sleep_for(std::chrono::milliseconds(NESTED_DELAY_SLEEP_MS));
    }
    context->innerExecuteCount.fetch_add(1, std::memory_order_relaxed);
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void NestedAsyncResolveAndDelete(napi_env env, NestedAsyncContext *context, bool passed)
{
    if (context == nullptr) {
        return;
    }
    if (context->outerWork != nullptr) {
        ForgetQueuedAsyncWork(context->outerWork);
        RealDeleteAsyncWorkForStateTest(env, context->outerWork);
    }
    for (auto work : context->innerWorks) {
        if (work != nullptr) {
            ForgetQueuedAsyncWork(work);
            RealDeleteAsyncWorkForStateTest(env, work);
        }
    }
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, context->deferred, result);
    delete context;
}

static void NestedAsyncInnerCompleteCallback(napi_env env, napi_status, void *data)
{
    auto *context = static_cast<NestedAsyncContext *>(data);
    if (context == nullptr) {
        return;
    }
    int completeCount = context->innerCompleteCount.fetch_add(1, std::memory_order_acq_rel) + 1;
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    if (completeCount != context->expectedInnerCount) {
        return;
    }
    bool passed = context->outerExecuted.load(std::memory_order_acquire) &&
        context->innerExecuteCount.load(std::memory_order_acquire) >= context->minInnerExecuteCount &&
        completeCount == context->expectedInnerCount;
    if (context->scenario == NestedAsyncScenario::NEST_CREATE_MULTIPLE_AND_CANCEL) {
        passed = passed && context->cancelAttemptCount.load(std::memory_order_acquire) > 0;
    }
    NestedAsyncResolveAndDelete(env, context, passed);
}

static void NestedAsyncOuterExecuteCallback(napi_env, void *data)
{
    auto *context = static_cast<NestedAsyncContext *>(data);
    if (context == nullptr) {
        return;
    }
    context->outerExecuted.store(true, std::memory_order_release);
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static bool ResolveNestedPromiseScenario(napi_env env, NestedAsyncContext *context)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    bool isPromise = false;
    bool passed = napi_create_promise(env, &deferred, &promise) == napi_ok &&
        napi_is_promise(env, promise, &isPromise) == napi_ok && isPromise;
    if (deferred != nullptr) {
        napi_value resolved = nullptr;
        napi_get_boolean(env, true, &resolved);
        napi_resolve_deferred(env, deferred, resolved);
    }
    NestedAsyncResolveAndDelete(env, context, passed);
    return passed;
}

static bool CreateAndQueueNestedInnerWork(napi_env env, napi_value innerName, NestedAsyncContext *context, int index)
{
    napi_status createStatus = napi_create_async_work(env, nullptr, innerName, NestedAsyncInnerExecuteCallback,
                                                      NestedAsyncInnerCompleteCallback, context,
                                                      &context->innerWorks[index]);
    if (createStatus != napi_ok || context->innerWorks[index] == nullptr) {
        return false;
    }
    return QueueAsyncWorkForTest(env, context->innerWorks[index]) == napi_ok;
}

static bool CreateNestedInnerWorks(napi_env env, NestedAsyncContext *context)
{
    napi_value innerName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "nestedInnerAsyncWork", NAPI_AUTO_LENGTH, &innerName))) {
        return false;
    }
    context->innerWorks.resize(context->expectedInnerCount, nullptr);
    for (int i = 0; i < context->expectedInnerCount; ++i) {
        if (!CreateAndQueueNestedInnerWork(env, innerName, context, i)) {
            return false;
        }
    }
    return true;
}

static void CancelNestedInnerWorks(napi_env env, NestedAsyncContext *context)
{
    if (context->scenario != NestedAsyncScenario::NEST_CREATE_MULTIPLE_AND_CANCEL) {
        return;
    }
    for (int i = 0; i < context->expectedInnerCount && i < NESTED_CANCEL_COUNT; ++i) {
        napi_status cancelStatus = napi_cancel_async_work(env, context->innerWorks[i]);
        if (cancelStatus == napi_ok || cancelStatus == napi_generic_failure) {
            context->cancelAttemptCount.fetch_add(1, std::memory_order_relaxed);
        }
    }
}

static void NestedAsyncOuterCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *context = static_cast<NestedAsyncContext *>(data);
    if (context == nullptr) {
        return;
    }
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    if (status != napi_ok || !context->outerExecuted.load(std::memory_order_acquire)) {
        NestedAsyncResolveAndDelete(env, context, false);
        return;
    }

    if (context->scenario == NestedAsyncScenario::NEST_CREATE_PROMISE) {
        ResolveNestedPromiseScenario(env, context);
        return;
    }

    if (!CreateNestedInnerWorks(env, context)) {
        NestedAsyncResolveAndDelete(env, context, false);
        return;
    }
    CancelNestedInnerWorks(env, context);
}

static napi_value RunNestedAsyncScenarioTest(napi_env env, const char *resourceNameText, NestedAsyncScenario scenario,
    int innerCount, int minInnerExecuteCount)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    auto *context = new NestedAsyncContext();
    context->deferred = deferred;
    context->scenario = scenario;
    context->expectedInnerCount = innerCount;
    context->minInnerExecuteCount = minInnerExecuteCount;
    status = napi_create_async_work(env, nullptr, asyncResourceName, NestedAsyncOuterExecuteCallback,
                                    NestedAsyncOuterCompleteCallback, context, &context->outerWork);
    if (status != napi_ok || context->outerWork == nullptr) {
        delete context;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }
    status = QueueAsyncWorkForTest(env, context->outerWork);
    if (status == napi_ok) {
        return promise;
    }
    RealDeleteAsyncWorkForStateTest(env, context->outerWork);
    delete context;
    return CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed") ? promise : nullptr;
}

struct SingleWorkQueueAttemptsContext {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    std::atomic<int> executeCount {0};
    std::atomic<int> completeCount {0};
    std::atomic<int> queueOkCount {0};
    std::atomic<int> queueFailCount {0};
    std::atomic<int> cancelOkCount {0};
    std::atomic<int> cancelFailCount {0};
    std::atomic<int> logicalThreadRequests {0};
    std::atomic<int> expectedCompleteCount {1};
    std::atomic<bool> resolved {false};
    int expectedQueueAttempts = 1;
    int expectedLogicalThreadRequests = 0;
    bool cancelAfterFirstQueue = false;
};

static void RecordLogicalThreadRequests(SingleWorkQueueAttemptsContext *context, int threadCount)
{
    if (context == nullptr || threadCount <= 0) {
        return;
    }
    std::vector<std::thread> threads;
    threads.reserve(threadCount);
    for (int i = 0; i < threadCount; ++i) {
        threads.emplace_back([context]() {
            context->logicalThreadRequests.fetch_add(1, std::memory_order_relaxed);
        });
    }
    for (auto &thread : threads) {
        if (thread.joinable()) {
            thread.join();
        }
    }
}

static void SingleWorkQueueAttemptsExecuteCallback(napi_env, void *data)
{
    auto *context = static_cast<SingleWorkQueueAttemptsContext *>(data);
    if (context == nullptr) {
        return;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(TASK_SHORT_SLEEP_MS));
    context->executeCount.fetch_add(1, std::memory_order_relaxed);
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void SingleWorkQueueAttemptsCompleteCallback(napi_env env, napi_status, void *data)
{
    auto *context = static_cast<SingleWorkQueueAttemptsContext *>(data);
    if (context == nullptr) {
        return;
    }
    int completeCount = context->completeCount.fetch_add(1, std::memory_order_relaxed) + 1;
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    int expectedCompleteCount = context->expectedCompleteCount.load(std::memory_order_acquire);
    if (completeCount < expectedCompleteCount) {
        return;
    }
    int queueOk = context->queueOkCount.load(std::memory_order_acquire);
    int queueFail = context->queueFailCount.load(std::memory_order_acquire);
    int cancelTotal = context->cancelOkCount.load(std::memory_order_acquire) +
        context->cancelFailCount.load(std::memory_order_acquire);
    bool passed = queueOk >= 1 && queueOk + queueFail == context->expectedQueueAttempts &&
        completeCount >= expectedCompleteCount &&
        context->logicalThreadRequests.load(std::memory_order_acquire) == context->expectedLogicalThreadRequests;
    if (context->cancelAfterFirstQueue) {
        passed = passed && cancelTotal > 0;
    } else {
        passed = passed && context->executeCount.load(std::memory_order_acquire) >= 1;
    }
    if (context->resolved.exchange(true, std::memory_order_acq_rel)) {
        return;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, context->deferred, result);
}

static bool CreateSingleWorkQueueAttempt(napi_env env, napi_value name, SingleWorkQueueAttemptsContext *context)
{
    napi_status status = napi_create_async_work(env, nullptr, name, SingleWorkQueueAttemptsExecuteCallback,
                                                SingleWorkQueueAttemptsCompleteCallback, context, &context->work);
    return status == napi_ok && context->work != nullptr;
}

static void ResolveSingleWorkQueueSetupFailure(napi_env env, napi_deferred deferred,
    SingleWorkQueueAttemptsContext *context)
{
    napi_value result = nullptr;
    napi_get_boolean(env, false, &result);
    napi_resolve_deferred(env, deferred, result);
    if (context != nullptr && context->work != nullptr) {
        ForgetQueuedAsyncWork(context->work);
        RealDeleteAsyncWorkForStateTest(env, context->work);
    }
    delete context;
}

static void QueueSingleWorkAttempts(napi_env env, SingleWorkQueueAttemptsContext *context, int attempts)
{
    bool cancelIssued = false;
    for (int i = 0; i < attempts; ++i) {
        if (context->cancelAfterFirstQueue && cancelIssued) {
            context->queueFailCount.fetch_add(1, std::memory_order_relaxed);
            continue;
        }
        napi_status queueStatus = RealQueueAsyncWorkForStateTest(env, context->work);
        if (queueStatus != napi_ok) {
            context->queueFailCount.fetch_add(1, std::memory_order_relaxed);
            continue;
        }
        context->queueOkCount.fetch_add(1, std::memory_order_relaxed);
        if (context->cancelAfterFirstQueue) {
            napi_status cancelStatus = napi_cancel_async_work(env, context->work);
            cancelIssued = true;
            if (cancelStatus == napi_ok) {
                context->cancelOkCount.fetch_add(1, std::memory_order_relaxed);
            } else {
                context->cancelFailCount.fetch_add(1, std::memory_order_relaxed);
            }
        }
    }
}

static napi_value RunSingleWorkQueueAttemptsTest(napi_env env, const char *name, int attempts,
    bool cancelAfterFirstQueue, int logicalThreadRequests)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    if (!CheckNapiCall(env, napi_create_promise(env, &deferred, &promise))) {
        return nullptr;
    }
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, name, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }

    auto *context = new SingleWorkQueueAttemptsContext();
    context->deferred = deferred;
    context->expectedQueueAttempts = attempts;
    context->expectedLogicalThreadRequests = logicalThreadRequests;
    context->cancelAfterFirstQueue = cancelAfterFirstQueue;
    RecordLogicalThreadRequests(context, logicalThreadRequests);
    if (!CreateSingleWorkQueueAttempt(env, asyncResourceName, context)) {
        ResolveSingleWorkQueueSetupFailure(env, deferred, context);
        return promise;
    }

    QueueSingleWorkAttempts(env, context, attempts);
    int queueOk = context->queueOkCount.load(std::memory_order_acquire);
    if (queueOk <= 0) {
        ResolveSingleWorkQueueSetupFailure(env, deferred, context);
        return promise;
    }
    context->expectedCompleteCount.store(cancelAfterFirstQueue ? queueOk : SINGLE_COMPLETION_COUNT,
                                         std::memory_order_release);
    return promise;
}

struct LargeDataAsyncContext {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    std::vector<uint8_t> data;
    std::atomic<bool> executeReadOk {false};
    bool readInComplete = false;
};

static void LargeDataAsyncExecuteCallback(napi_env, void *data)
{
    auto *context = static_cast<LargeDataAsyncContext *>(data);
    if (context == nullptr) {
        return;
    }
    bool ok = context->data.size() == LARGE_DATA_SIZE && context->data.front() == 0x5A &&
        context->data.back() == 0xA5;
    context->executeReadOk.store(ok, std::memory_order_release);
    g_executeCount.fetch_add(1, std::memory_order_relaxed);
}

static void LargeDataAsyncCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *context = static_cast<LargeDataAsyncContext *>(data);
    if (context == nullptr) {
        return;
    }
    bool completeReadOk = !context->readInComplete ||
        (context->data.size() == LARGE_DATA_SIZE && context->data.front() == 0x5A &&
         context->data.back() == 0xA5);
    bool passed = status == napi_ok && context->executeReadOk.load(std::memory_order_acquire) && completeReadOk;
    if (context->work != nullptr) {
        ForgetQueuedAsyncWork(context->work);
        RealDeleteAsyncWorkForStateTest(env, context->work);
    }
    context->data.clear();
    context->data.shrink_to_fit();
    g_completeCount.fetch_add(1, std::memory_order_relaxed);
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, context->deferred, result);
    delete context;
}

static napi_value TestNapiCreateAsyncWork_NormalParams(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    napi_status status = napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_string_utf8 failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null when status is napi_ok")) {
        return nullptr;
    }
    
    if (work != nullptr) {
        status = DeleteAsyncWorkForTest(env, work);
        if (!CheckNapiAssertion(env, status == napi_ok, "DeleteAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreateAsyncWork_AsyncResourceNameNonString(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    napi_status status = napi_get_undefined(env, &async_resource_name);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_get_undefined failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work with undefined name failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null when status is napi_ok")) {
        return nullptr;
    }
    if (work != nullptr) {
        status = DeleteAsyncWorkForTest(env, work);
        if (!CheckNapiAssertion(env, status == napi_ok, "DeleteAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreateAsyncWork_NullExecuteAndComplete(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        nullptr, nullptr, data, &work);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_create_async_work with null callbacks should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreateAsyncWork_NullExecute(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        nullptr, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_create_async_work with null execute should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreateAsyncWork_NullEnv(napi_env env, napi_callback_info)
{
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }

    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    napi_status status = napi_create_async_work(nullptr, nullptr, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_create_async_work with null env should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreateAsyncWork_NullResult(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, nullptr);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_create_async_work with null result should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCreateAsyncWork_NullData(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, nullptr, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work with null data should still succeed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null")) {
        return nullptr;
    }
    
    if (work != nullptr) {
        status = DeleteAsyncWorkForTest(env, work);
        if (!CheckNapiAssertion(env, status == napi_ok, "DeleteAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiQueueAsyncWork_NormalParams(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "queueAsyncWorkNormalParams";
    AsyncWorkStateMode mode = AsyncWorkStateMode::NORMAL;
    bool slowExecute = false;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                    AsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    return promise;
}

static napi_value TestNapiQueueAsyncWork_ThreadValidation(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "queueAsyncWorkThreadValidation";
    AsyncWorkStateMode mode = AsyncWorkStateMode::THREAD_VALIDATION;
    bool slowExecute = false;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                    AsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    return promise;
}

static napi_value TestNapiQueueAsyncWork_NullEnv(napi_env env, napi_callback_info)
{
    napi_async_work work = nullptr;
    napi_status status = QueueAsyncWorkForTest(nullptr, work);
    if (!CheckNapiAssertion(env, status == napi_invalid_arg, "env is null, QueueAsyncWorkForTest failed.")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiQueueAsyncWork_NullWork(napi_env env, napi_callback_info)
{
    napi_status status = QueueAsyncWorkForTest(env, nullptr);
    if (!CheckNapiAssertion(env, status == napi_invalid_arg, "work is null, QueueAsyncWorkForTest failed.")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiQueueAsyncWork_NullEnvAndWork(napi_env env, napi_callback_info)
{
    napi_status status = QueueAsyncWorkForTest(nullptr, nullptr);
    if (!CheckNapiAssertion(env, status == napi_invalid_arg, "all is null, QueueAsyncWorkForTest failed.")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiQueueAsyncWork_QueuedWork(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }

    auto *queuedData = new QueuedWorkSyncData();
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        QueuedWorkSyncExecuteCallback, QueuedWorkSyncCompleteCallback, queuedData, &queuedData->work);
    if (status != napi_ok || queuedData->work == nullptr) {
        delete queuedData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, status == napi_ok, "QueueAsyncWorkForTest should succeed")) {
        return nullptr;
    }

    napi_status queuedAgainStatus = RealQueueAsyncWorkForStateTest(env, queuedData->work);
    if (queuedAgainStatus == napi_ok) {
        queuedData->expectedCompleteCount.store(ARRAY_CONTAINER_LENGTH, std::memory_order_release);
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiQueueAsyncWork_ExecutedWork(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "queueAsyncWorkExecutedWork";
    AsyncWorkStateMode mode = AsyncWorkStateMode::REQUEUE_AFTER_COMPLETE;
    bool slowExecute = false;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                    AsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    return promise;
}

static napi_value TestNapiQueueAsyncWork_CanceledWork(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "queueAsyncWorkCanceledWork";
    AsyncWorkStateMode mode = AsyncWorkStateMode::QUEUE_CANCELED;
    bool slowExecute = true;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                    AsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    napi_status firstCancelStatus = napi_cancel_async_work(env, state->work);
    state->firstOperationStatus.store(static_cast<int>(firstCancelStatus), std::memory_order_release);
    napi_status queueCanceledStatus = RealQueueAsyncWorkForStateTest(env, state->work);
    state->secondOperationStatus.store(static_cast<int>(queueCanceledStatus), std::memory_order_release);

    return promise;
}

static napi_value TestNapiQueueAsyncWork_DeletedWork(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null when status is napi_ok")) {
        return nullptr;
    }
    
    if (work != nullptr) {
        status = RealQueueAsyncWorkForStateTest(env, work);
        if (!CheckNapiAssertion(env, status == napi_ok, "QueueAsyncWorkForTest should succeed")) {
            return nullptr;
        }

        napi_status deleteQueuedStatus = DeleteAsyncWorkForTest(env, work);
        if (!CheckNapiAssertion(env,
            deleteQueuedStatus == napi_ok,
            "DeleteAsyncWorkForTest should be safely handled")) {
            return nullptr;
        }

        napi_status queuedDeletedStatus = RealQueueAsyncWorkForStateTest(env, nullptr);
        if (!CheckNapiAssertion(env,
            queuedDeletedStatus == napi_invalid_arg,
            "deleted work should not be queued again")) {
            return nullptr;
        }
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCancelAsyncWork_QueuedWork(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "cancelAsyncWorkQueuedWork";
    AsyncWorkStateMode mode = AsyncWorkStateMode::CANCEL_QUEUED;
    bool slowExecute = true;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                    AsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    napi_status firstCancelStatus = napi_cancel_async_work(env, state->work);
    state->firstOperationStatus.store(static_cast<int>(firstCancelStatus), std::memory_order_release);

    return promise;
}

static napi_value TestNapiCancelAsyncWork_NotQueuedWork(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null when status is napi_ok")) {
        return nullptr;
    }
    
    if (work != nullptr) {
        status = napi_cancel_async_work(env, work);
        if (!CheckNapiAssertion(env, status == napi_ok, "napi_cancel_async_work should succeed")) {
            return nullptr;
        }
        status = DeleteAsyncWorkForTest(env, work);
        if (!CheckNapiAssertion(env, status == napi_ok, "DeleteAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCancelAsyncWork_NullWork(napi_env env, napi_callback_info)
{
    napi_status status = napi_cancel_async_work(env, nullptr);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_cancel_async_work with null work should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCancelAsyncWork_NullEnv(napi_env env, napi_callback_info)
{
    napi_status status = napi_cancel_async_work(nullptr, nullptr);
    if (!CheckNapiAssertion(env,
        status == napi_invalid_arg,
        "napi_cancel_async_work with null env should return napi_invalid_arg")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCancelAsyncWork_ExecutingWork(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }

    auto *queuedData = new QueuedWorkSyncData();
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        QueuedWorkSyncExecuteCallback, QueuedWorkSyncCompleteCallback, queuedData, &queuedData->work);
    if (status != napi_ok || queuedData->work == nullptr) {
        delete queuedData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    int64_t beforeExecute = g_executeCount.load(std::memory_order_acquire);
    status = RealQueueAsyncWorkForStateTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, status == napi_ok, "QueueAsyncWorkForTest should succeed")) {
        return nullptr;
    }

    constexpr int maxWaitCount = 200;
    for (int i = 0; i < maxWaitCount &&
         g_executeCount.load(std::memory_order_acquire) == beforeExecute; ++i) {
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }

    napi_status cancelStatus = napi_cancel_async_work(env, queuedData->work);
    if (cancelStatus == napi_ok) {
        queuedData->expectedCompleteCount.store(1, std::memory_order_release);
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCancelAsyncWork_CompletedWork(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "cancelAsyncWorkCompletedWork";
    AsyncWorkStateMode mode = AsyncWorkStateMode::CANCEL_AFTER_COMPLETE;
    bool slowExecute = false;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                    AsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    return promise;
}

static napi_value TestNapiCancelAsyncWork_DeletedWork(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null when status is napi_ok")) {
        return nullptr;
    }
    
    if (work != nullptr) {
        status = RealQueueAsyncWorkForStateTest(env, work);
        if (!CheckNapiAssertion(env, status == napi_ok, "QueueAsyncWorkForTest should succeed")) {
            return nullptr;
        }

        napi_status deleteQueuedStatus = DeleteAsyncWorkForTest(env, work);
        if (!CheckNapiAssertion(env,
            deleteQueuedStatus == napi_ok,
            "DeleteAsyncWorkForTest should be safely handled")) {
            return nullptr;
        }

        napi_status cancelDeletedStatus = napi_cancel_async_work(env, nullptr);
        if (!CheckNapiAssertion(env,
            cancelDeletedStatus == napi_invalid_arg,
            "deleted work should not be canceled again")) {
            return nullptr;
        }
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiCancelAsyncWork_CanceledWork(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "cancelAsyncWorkCanceledWork";
    AsyncWorkStateMode mode = AsyncWorkStateMode::CANCEL_CANCELED;
    bool slowExecute = true;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                    AsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    napi_status firstCancelStatus = napi_cancel_async_work(env, state->work);
    state->firstOperationStatus.store(static_cast<int>(firstCancelStatus), std::memory_order_release);
    napi_status secondCancelStatus = napi_cancel_async_work(env, state->work);
    state->secondOperationStatus.store(static_cast<int>(secondCancelStatus), std::memory_order_release);

    return promise;
}

static napi_value TestNapiDeleteAsyncWork_NormalParams(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null when status is napi_ok")) {
        return nullptr;
    }
    status = DeleteAsyncWorkForTest(env, work);
    if (!CheckNapiAssertion(env, status == napi_ok, "DeleteAsyncWorkForTest failed")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiDeleteAsyncWork_NotQueued(napi_env env, napi_callback_info)
{
    napi_value async_resource = nullptr;
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, async_resource_name != nullptr, "async_resource_name should not be null")) {
        return nullptr;
    }
    napi_async_work work = nullptr;
    void* data = GetInvalidCounterData();
    
    napi_status status = napi_create_async_work(env, async_resource, async_resource_name,
        ExecuteCallback, CompleteCallback, data, &work);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_async_work failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, work != nullptr, "work should not be null when status is napi_ok")) {
        return nullptr;
    }
    status = DeleteAsyncWorkForTest(env, work);
    if (!CheckNapiAssertion(env, status == napi_ok, "DeleteAsyncWorkForTest failed")) {
        return nullptr;
    }
    
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiDeleteAsyncWork_QueuedNotExecuted(napi_env env, napi_callback_info)
{
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "deleteAsyncWorkQueuedNotExecuted", NAPI_AUTO_LENGTH,
                                           &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *queuedData = new QueuedWorkSyncData();
    queuedData->deleteOnComplete = false;
    napi_status status = napi_create_async_work(env, nullptr, asyncResourceName, QueuedWorkSyncExecuteCallback,
                                                QueuedWorkSyncCompleteCallback, queuedData, &queuedData->work);
    if (status != napi_ok || queuedData->work == nullptr) {
        delete queuedData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, status == napi_ok, "QueueAsyncWorkForTest failed")) {
        return nullptr;
    }
    napi_status deleteStatus = DeleteAsyncWorkForTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, deleteStatus == napi_ok, "DeleteAsyncWorkForTest queued work failed")) {
        return nullptr;
    }

    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value TestNapiDeleteAsyncWork_Executing(napi_env env, napi_callback_info)
{
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env,
        napi_create_string_utf8(env, "deleteAsyncWorkExecuting", NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *queuedData = new QueuedWorkSyncData();
    queuedData->deleteOnComplete = false;
    napi_status status = napi_create_async_work(env, nullptr, asyncResourceName, QueuedWorkSyncExecuteCallback,
                                                QueuedWorkSyncCompleteCallback, queuedData, &queuedData->work);
    if (status != napi_ok || queuedData->work == nullptr) {
        delete queuedData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, status == napi_ok, "QueueAsyncWorkForTest failed")) {
        return nullptr;
    }
    constexpr int maxWaitCount = 200;
    for (int i = 0; i < maxWaitCount && !queuedData->enteredExecute.load(std::memory_order_acquire); ++i) {
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }
    napi_status deleteStatus = DeleteAsyncWorkForTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, deleteStatus == napi_ok, "DeleteAsyncWorkForTest executing work failed")) {
        return nullptr;
    }

    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static napi_value TestNapiDeleteAsyncWork_Canceled(napi_env env, napi_callback_info)
{
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env,
        napi_create_string_utf8(env, "deleteAsyncWorkCanceled", NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *queuedData = new QueuedWorkSyncData();
    queuedData->deleteOnComplete = false;
    napi_status status = napi_create_async_work(env, nullptr, asyncResourceName, QueuedWorkSyncExecuteCallback,
                                                QueuedWorkSyncCompleteCallback, queuedData, &queuedData->work);
    if (status != napi_ok || queuedData->work == nullptr) {
        delete queuedData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, status == napi_ok, "QueueAsyncWorkForTest failed")) {
        return nullptr;
    }
    napi_status cancelStatus = napi_cancel_async_work(env, queuedData->work);
    if (!CheckNapiAssertion(env,
        cancelStatus == napi_ok || cancelStatus == napi_generic_failure,
        "napi_cancel_async_work queued work failed")) {
        return nullptr;
    }
    napi_status deleteStatus = DeleteAsyncWorkForTest(env, queuedData->work);
    if (!CheckNapiAssertion(env, deleteStatus == napi_ok, "DeleteAsyncWorkForTest canceled work failed")) {
        return nullptr;
    }

    napi_value result = nullptr;
    napi_get_boolean(env, true, &result);
    return result;
}

static void ApplyDeleteAsyncWorkStateFollowUp(napi_env env, DeleteAsyncWorkStateData *state,
    DeleteAsyncWorkStateMode mode)
{
    if (mode == DeleteAsyncWorkStateMode::QUEUED_NOT_EXECUTED) {
        napi_status deleteStatus = DeleteAsyncWorkForTest(env, state->work);
        state->deleteStatus.store(static_cast<int>(deleteStatus), std::memory_order_release);
    } else if (mode == DeleteAsyncWorkStateMode::EXECUTING) {
        constexpr int maxWaitCount = 200;
        for (int i = 0; i < maxWaitCount && !state->executed.load(std::memory_order_acquire); ++i) {
            std::this_thread::sleep_for(std::chrono::milliseconds(1));
        }
        napi_status deleteStatus = DeleteAsyncWorkForTest(env, state->work);
        state->deleteStatus.store(static_cast<int>(deleteStatus), std::memory_order_release);
    } else if (mode == DeleteAsyncWorkStateMode::CANCELED) {
        napi_status cancelStatus = napi_cancel_async_work(env, state->work);
        state->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status deleteStatus = DeleteAsyncWorkForTest(env, state->work);
        state->deleteStatus.store(static_cast<int>(deleteStatus), std::memory_order_release);
    }
}

static napi_value RunDeleteAsyncWorkStateTest(napi_env env, const char *resourceNameText,
    DeleteAsyncWorkStateMode mode)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_value asyncResourceName = nullptr;
    if (!CreatePromiseAndResourceName(env, resourceNameText, &deferred, &promise, &asyncResourceName)) {
        return nullptr;
    }
    auto *state = new DeleteAsyncWorkStateData();
    state->deferred = deferred;
    state->mode = mode;
    napi_status status = napi_create_async_work(env, nullptr, asyncResourceName, DeleteAsyncWorkStateExecuteCallback,
                                                DeleteAsyncWorkStateCompleteCallback, state, &state->work);
    if (status != napi_ok || state->work == nullptr) {
        delete state;
        return CheckNapiAssertion(env, false, "napi_create_async_work failed") ? promise : nullptr;
    }
    if (QueueAsyncWorkForTest(env, state->work) != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, state->work);
        delete state;
        return CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed") ? promise : nullptr;
    }
    ApplyDeleteAsyncWorkStateFollowUp(env, state, mode);
    return promise;
}

static napi_value TestNapiDeleteAsyncWork_Completed(napi_env env, napi_callback_info)
{
    return RunDeleteAsyncWorkStateTest(env, "deleteAsyncWorkCompleted", DeleteAsyncWorkStateMode::COMPLETED);
}

static napi_value TestNapiDeleteAsyncWork_NullWork(napi_env env, napi_callback_info)
{
    napi_async_work work = nullptr;
    napi_status status = DeleteAsyncWorkForTest(env, work);
    if (!CheckNapiAssertion(env, status == napi_invalid_arg, "work is null, DeleteAsyncWorkForTest failed.")) {
        return nullptr;
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiDeleteAsyncWork_NullEnv(napi_env env, napi_callback_info)
{
    napi_async_work work = nullptr;
    napi_status status = DeleteAsyncWorkForTest(nullptr, work);
    if (!CheckNapiAssertion(env, status == napi_invalid_arg, "env is null, DeleteAsyncWorkForTest failed.")) {
        return nullptr;
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestNapiDeleteAsyncWork_DeletedWork(napi_env env, napi_callback_info)
{
    napi_value async_resource_name = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &async_resource_name))) {
        return nullptr;
    }
    napi_async_work work = nullptr;
    napi_status status = napi_create_async_work(env, nullptr, async_resource_name, ExecuteCallback, CompleteCallback,
                                                nullptr, &work);
    if (!CheckNapiAssertion(env, status == napi_ok && work != nullptr, "napi_create_async_work failed")) {
        return nullptr;
    }
    status = RealDeleteAsyncWorkForStateTest(env, work);
    if (!CheckNapiAssertion(env, status == napi_ok, "first DeleteAsyncWorkForTest failed")) {
        return nullptr;
    }
    work = nullptr;
    status = DeleteAsyncWorkForTest(env, work);
    if (!CheckNapiAssertion(env, status == napi_invalid_arg, "deleted async work handle should not be reused")) {
        return nullptr;
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static bool CreatePromiseAndResourceName(napi_env env, const char *resourceNameText, napi_deferred *deferred,
    napi_value *promise, napi_value *asyncResourceName)
{
    napi_status status = napi_create_promise(env, deferred, promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return false;
    }
    if (!CheckNapiAssertion(env, *deferred != nullptr && *promise != nullptr,
        "promise or deferred should not be null")) {
        return false;
    }
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, asyncResourceName))) {
        return false;
    }
    return CheckNapiAssertion(env, *asyncResourceName != nullptr, "asyncResourceName should not be null");
}

static AsyncWorkStateData *CreateAsyncWorkState(napi_env env, napi_value asyncResourceName, napi_deferred deferred,
    AsyncWorkStateMode mode, bool slowExecute)
{
    auto *state = new AsyncWorkStateData();
    state->deferred = deferred;
    state->createThread = pthread_self();
    state->mode = mode;
    state->slowExecute = slowExecute;
    napi_status status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncWorkStateExecuteCallback,
                                                AsyncWorkStateCompleteCallback, state, &state->work);
    if (status == napi_ok && state->work != nullptr) {
        return state;
    }
    delete state;
    return nullptr;
}

static bool QueueAsyncWorkState(napi_env env, AsyncWorkStateData *state)
{
    napi_status status = RealQueueAsyncWorkForStateTest(env, state->work);
    if (status == napi_ok) {
        return true;
    }
    RealDeleteAsyncWorkForStateTest(env, state->work);
    return false;
}

static void ApplyAsyncWorkStateFollowUp(napi_env env, AsyncWorkStateData *state, AsyncWorkStateMode mode)
{
    if (mode != AsyncWorkStateMode::CANCEL_QUEUED && mode != AsyncWorkStateMode::QUEUE_CANCELED &&
        mode != AsyncWorkStateMode::CANCEL_CANCELED) {
        return;
    }
    napi_status firstCancelStatus = napi_cancel_async_work(env, state->work);
    state->firstOperationStatus.store(static_cast<int>(firstCancelStatus), std::memory_order_release);
    if (mode == AsyncWorkStateMode::QUEUE_CANCELED) {
        napi_status queueCanceledStatus = RealQueueAsyncWorkForStateTest(env, state->work);
        state->secondOperationStatus.store(static_cast<int>(queueCanceledStatus), std::memory_order_release);
    } else if (mode == AsyncWorkStateMode::CANCEL_CANCELED) {
        napi_status secondCancelStatus = napi_cancel_async_work(env, state->work);
        state->secondOperationStatus.store(static_cast<int>(secondCancelStatus), std::memory_order_release);
    }
}

static napi_value RunAsyncWorkStateTest(napi_env env, const char *resourceNameText,
    AsyncWorkStateMode mode = AsyncWorkStateMode::NORMAL, bool slowExecute = false)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_value asyncResourceName = nullptr;
    if (!CreatePromiseAndResourceName(env, resourceNameText, &deferred, &promise, &asyncResourceName)) {
        return nullptr;
    }
    auto *state = CreateAsyncWorkState(env, asyncResourceName, deferred, mode, slowExecute);
    if (state == nullptr) {
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }
    if (!QueueAsyncWorkState(env, state)) {
        delete state;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    ApplyAsyncWorkStateFollowUp(env, state, mode);
    return promise;
}

static napi_value TestNapiAsyncWork_NormalFunctionNoArgNoReturn(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkNormalFunctionNoArgNoReturn");
}

static napi_value TestNapiAsyncWork_SyncFunctionWithArgNoReturn(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkSyncFunctionWithArgNoReturn");
}

static napi_value TestNapiAsyncWork_NormalFunctionNoArgWithReturnContainer(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkNormalFunctionNoArgWithReturnContainer");
}

static napi_value TestNapiAsyncWork_ClassMethodWithArgStringReturnFunction(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkClassMethodWithArgStringReturnFunction");
}

static napi_value TestNapiAsyncWork_ClassStaticWithArgReturnPromise(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkClassStaticWithArgReturnPromise");
}

static napi_value TestNapiAsyncWork_EtsNormalFunctionNoArgNoReturn(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkEtsNormalFunctionNoArgNoReturn");
}

static napi_value TestNapiAsyncWork_EtsNormalFunctionWithArgNoReturn(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkEtsNormalFunctionWithArgNoReturn");
}

static napi_value TestNapiAsyncWork_EtsNormalFunctionNoArgWithReturnContainer(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkEtsNormalFunctionNoArgWithReturnContainer");
}

static napi_value TestNapiAsyncWork_EtsClassMethodWithArgStringReturnFunction(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkEtsClassMethodWithArgStringReturnFunction");
}

static napi_value TestNapiAsyncWork_EtsClassStaticWithArgReturnPromise(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkEtsClassStaticWithArgReturnPromise");
}

static napi_value TestNapiAsyncWork_EtsClassConstructor(napi_env env, napi_callback_info)
{
    return RunAsyncWorkStateTest(env, "asyncWorkEtsClassConstructor");
}

static napi_value TestNapiAsyncComplete_NormalFunctionNoArgNoReturn(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteNormalFunctionNoArgNoReturn";
    AsyncCompleteMode mode = AsyncCompleteMode::NORMAL_FUNCTION_NO_ARG_NO_RETURN;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_SyncFunctionWithArgReturn(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteSyncFunctionWithArgReturn";
    AsyncCompleteMode mode = AsyncCompleteMode::SYNC_FUNCTION_WITH_ARG_RETURN;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_NormalFunctionNoArgReturnContainer(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteNormalFunctionNoArgReturnContainer";
    AsyncCompleteMode mode = AsyncCompleteMode::NORMAL_FUNCTION_NO_ARG_RETURN_CONTAINER;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_SyncFunctionWithArgReturnContainer(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteSyncFunctionWithArgReturnContainer";
    AsyncCompleteMode mode = AsyncCompleteMode::SYNC_FUNCTION_WITH_ARG_RETURN_CONTAINER;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_NormalFunctionNoArgReturnString(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteNormalFunctionNoArgReturnString";
    AsyncCompleteMode mode = AsyncCompleteMode::NORMAL_FUNCTION_NO_ARG_RETURN_STRING;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_ClassMethodWithArgStringReturnFunction(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteClassMethodWithArgStringReturnFunction";
    AsyncCompleteMode mode = AsyncCompleteMode::CLASS_METHOD_WITH_ARG_STRING_RETURN_FUNCTION;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_ClassStaticWithArgReturnPromise(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteClassStaticWithArgReturnPromise";
    AsyncCompleteMode mode = AsyncCompleteMode::CLASS_STATIC_WITH_ARG_RETURN_PROMISE;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_EtsNormalFunctionNoArgNoReturn(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteEtsNormalFunctionNoArgNoReturn";
    AsyncCompleteMode mode = AsyncCompleteMode::ETS_NORMAL_FUNCTION_NO_ARG_NO_RETURN;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_EtsNormalFunctionWithArgNoReturn(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteEtsNormalFunctionWithArgNoReturn";
    AsyncCompleteMode mode = AsyncCompleteMode::ETS_NORMAL_FUNCTION_WITH_ARG_NO_RETURN;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_EtsNormalFunctionNoArgReturnContainer(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteEtsNormalFunctionNoArgReturnContainer";
    AsyncCompleteMode mode = AsyncCompleteMode::ETS_NORMAL_FUNCTION_NO_ARG_RETURN_CONTAINER;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_EtsClassMethodWithArgStringReturnFunction(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteEtsClassMethodWithArgStringReturnFunction";
    AsyncCompleteMode mode = AsyncCompleteMode::ETS_CLASS_METHOD_WITH_ARG_STRING_RETURN_FUNCTION;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_EtsClassStaticWithArgReturnPromise(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteEtsClassStaticWithArgReturnPromise";
    AsyncCompleteMode mode = AsyncCompleteMode::ETS_CLASS_STATIC_WITH_ARG_RETURN_PROMISE;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiAsyncComplete_EtsClassConstructor(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "asyncCompleteEtsClassConstructor";
    AsyncCompleteMode mode = AsyncCompleteMode::ETS_CLASS_CONSTRUCTOR;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *completeData = new AsyncCompleteData();
    completeData->deferred = deferred;
    completeData->mode = mode;
    status = napi_create_async_work(env, nullptr, asyncResourceName, AsyncCompleteExecuteCallback,
                                    AsyncCompleteCompleteCallback, completeData, &completeData->work);
    if (status != napi_ok || completeData->work == nullptr) {
        delete completeData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = RealQueueAsyncWorkForStateTest(env, completeData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, completeData->work);
        delete completeData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiTaskContent_ExecuteThrowException(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentExecuteThrowException";
    TaskContentMode mode = TaskContentMode::EXECUTE_THROW_EXCEPTION;
    int requestedSeconds = 0;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_CompleteThrowException(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentCompleteThrowException";
    TaskContentMode mode = TaskContentMode::COMPLETE_THROW_EXCEPTION;
    int requestedSeconds = 0;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_ExecuteWithLock(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentExecuteWithLock";
    TaskContentMode mode = TaskContentMode::EXECUTE_WITH_LOCK;
    int requestedSeconds = 0;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_ExecuteLongTime10s(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentExecuteLongTime10s";
    TaskContentMode mode = TaskContentMode::EXECUTE_LONG_TIME;
    int requestedSeconds = TASK_CONTENT_LONG_SECONDS;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_ExecuteLongTime3min(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentExecuteLongTime3min";
    TaskContentMode mode = TaskContentMode::EXECUTE_LONG_TIME;
    int requestedSeconds = 180;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_ExecuteLongTime10min(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentExecuteLongTime10min";
    TaskContentMode mode = TaskContentMode::EXECUTE_LONG_TIME;
    int requestedSeconds = 600;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_CompleteLongTime10s(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentCompleteLongTime10s";
    TaskContentMode mode = TaskContentMode::COMPLETE_LONG_TIME;
    int requestedSeconds = TASK_CONTENT_LONG_SECONDS;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_CompleteLongTime3min(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentCompleteLongTime3min";
    TaskContentMode mode = TaskContentMode::COMPLETE_LONG_TIME;
    int requestedSeconds = 180;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_CompleteLongTime10min(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentCompleteLongTime10min";
    TaskContentMode mode = TaskContentMode::COMPLETE_LONG_TIME;
    int requestedSeconds = 600;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_ExecuteInfiniteLoop(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentExecuteInfiniteLoop";
    TaskContentMode mode = TaskContentMode::EXECUTE_INFINITE_LOOP;
    int requestedSeconds = 0;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_SameDataPointer(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env,
        napi_create_string_utf8(env, "taskContentSameDataPointer", NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    auto *context = new SameDataPointerContext();
    context->deferred = deferred;
    status = napi_create_async_work(env, nullptr, asyncResourceName, SameDataPointerExecuteCallback,
                                    SameDataPointerCompleteCallback, context, &context->work1);
    if (status != napi_ok || context->work1 == nullptr) {
        delete context;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work work1 failed")) {
            return nullptr;
        }
    }
    status = napi_create_async_work(env, nullptr, asyncResourceName, SameDataPointerExecuteCallback,
                                    SameDataPointerCompleteCallback, context, &context->work2);
    if (status != napi_ok || context->work2 == nullptr) {
        RealDeleteAsyncWorkForStateTest(env, context->work1);
        delete context;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work work2 failed")) {
            return nullptr;
        }
    }
    if (!CheckNapiAssertion(env, context->work1 != context->work2, "two async work handles should be different")) {
        return nullptr;
    }
    if (!CheckNapiCall(env, QueueAsyncWorkForTest(env, context->work1))) {
        return nullptr;
    }
    if (!CheckNapiCall(env, QueueAsyncWorkForTest(env, context->work2))) {
        return nullptr;
    }
    return promise;
}

static napi_value TestNapiTaskContent_ExecuteEmptyOperation(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentExecuteEmptyOperation";
    TaskContentMode mode = TaskContentMode::EXECUTE_EMPTY_OPERATION;
    int requestedSeconds = 0;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_CompleteDeleteWork(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentCompleteDeleteWork";
    TaskContentMode mode = TaskContentMode::COMPLETE_DELETE_WORK;
    int requestedSeconds = 0;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    auto *taskData = new TaskContentData();
    taskData->deferred = deferred;
    taskData->mode = mode;
    taskData->requestedSeconds = requestedSeconds;
    status = napi_create_async_work(env, nullptr, asyncResourceName, TaskContentExecuteCallback,
                                    TaskContentCompleteCallback, taskData, &taskData->work);
    if (status != napi_ok || taskData->work == nullptr) {
        delete taskData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, taskData->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, taskData->work);
        delete taskData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }

    if (mode == TaskContentMode::CANCEL_AND_REQUEUE) {
        napi_status cancelStatus = napi_cancel_async_work(env, taskData->work);
        taskData->cancelStatus.store(static_cast<int>(cancelStatus), std::memory_order_release);
        napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, taskData->work);
        taskData->requeueStatus.store(static_cast<int>(requeueStatus), std::memory_order_release);
    }

    return promise;
}

static napi_value TestNapiTaskContent_CancelAndRequeue(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "taskContentCancelAndRequeue";
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env,
        deferred != nullptr && promise != nullptr,
        "promise or deferred should not be null")) {
        return nullptr;
    }

    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, asyncResourceName != nullptr, "asyncResourceName should not be null")) {
        return nullptr;
    }

    napi_async_work work = nullptr;
    status = napi_create_async_work(env, nullptr, asyncResourceName, ExecuteCallback,
        CompleteCallback, nullptr, &work);
    if (status != napi_ok || work == nullptr) {
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }

    napi_status queueStatus = QueueAsyncWorkForTest(env, work);
    napi_status cancelStatus = napi_cancel_async_work(env, work);
    napi_status requeueStatus = RealQueueAsyncWorkForStateTest(env, work);
    bool passed = queueStatus == napi_ok &&
        (cancelStatus == napi_ok || cancelStatus == napi_generic_failure) &&
        (requeueStatus == napi_ok || requeueStatus == napi_invalid_arg || requeueStatus == napi_generic_failure);
    if (requeueStatus != napi_ok && work != nullptr) {
        DeleteAsyncWorkForTest(env, work);
    }

    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    napi_resolve_deferred(env, deferred, result);

    return promise;
}

static napi_value TestNapiMultiThread_CreateAndQueueConcurrent(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadCreateAndQueueConcurrent", CREATE_QUEUE_WORK_COUNT, 0,
        CREATE_QUEUE_WORK_COUNT, CREATE_QUEUE_WORK_COUNT, false, true});
}

static napi_value TestNapiMultiThread_MainThreadCreateAndQueue(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadMainCreateChildQueueMainCancel", SINGLE_ASYNC_WORK_COUNT,
        SINGLE_ASYNC_WORK_COUNT, 0, SINGLE_ASYNC_WORK_COUNT, false, false});
}

static napi_value TestNapiMultiThread_MainCancelOtherThreadTask(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadMainCancelOtherThreadTask", SINGLE_ASYNC_WORK_COUNT,
        SINGLE_ASYNC_WORK_COUNT, 0, SINGLE_ASYNC_WORK_COUNT, true, false});
}

static napi_value TestNapiMultiThread_MultiThreadCancelSameTask(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadCancelSameTask", SINGLE_ASYNC_WORK_COUNT,
        MULTI_CANCEL_ATTEMPTS, 0, MULTI_CANCEL_ATTEMPTS, false, false});
}

static napi_value TestNapiMultiThread_QueueAndCancelRaceCondition1(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadQueueAndCancelRaceCondition1", RACE_CONDITION_ONE_WORK_COUNT,
        RACE_CONDITION_ONE_CANCEL_COUNT, 0, RACE_CONDITION_ONE_WORK_COUNT, false, false});
}

static napi_value TestNapiMultiThread_QueueAndCancelRaceCondition2(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadQueueAndCancelRaceCondition2", RACE_CONDITION_TWO_WORK_COUNT,
        RACE_CONDITION_TWO_CANCEL_COUNT, 0, RACE_CONDITION_TWO_WORK_COUNT, false, false});
}

static napi_value TestNapiMultiThread_CrossThreadDeleteHandle(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadCrossThreadDeleteHandle", SINGLE_ASYNC_WORK_COUNT, 0,
        SINGLE_ASYNC_WORK_COUNT, SINGLE_ASYNC_WORK_COUNT, false, false});
}

static napi_value TestNapiMultiThread_MainCreateChildQueueMainCancel(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadMainCreateChildQueueMainCancel", SINGLE_ASYNC_WORK_COUNT,
        SINGLE_ASYNC_WORK_COUNT, 0, SINGLE_ASYNC_WORK_COUNT, false, false});
}

static napi_value TestNapiNestedComplete_NestCreateAndQueue(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "nestedCompleteNestCreateAndQueue",
        NestedAsyncScenario::NEST_CREATE_AND_QUEUE, 1, 1);
}

static napi_value TestNapiNestedComplete_NestCreateMultipleAndCancel(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "nestedCompleteNestCreateMultipleAndCancel",
        NestedAsyncScenario::NEST_CREATE_MULTIPLE_AND_CANCEL, NESTED_MULTIPLE_ASYNC_COUNT, 0);
}

static napi_value TestNapiNestedComplete_NestCreatePromise(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "nestedCompleteNestCreatePromise",
        NestedAsyncScenario::NEST_CREATE_PROMISE, 0, 0);
}

static napi_value TestNapiNestedComplete_NestCreateAsyncTask(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "nestedCompleteNestCreateAsyncTask",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiNestedComplete_NestCreateTaskpool(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "nestedCompleteNestCreateTaskpool",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiNestedComplete_NestCreateLaunch(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "nestedCompleteNestCreateLaunch",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiNestedComplete_NestCreateTimer(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "nestedCompleteNestCreateTimer",
        NestedAsyncScenario::NEST_CREATE_DELAYED_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiOtherNested_TaskpoolNestCreateAsync(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "otherNestedTaskpoolNestCreateAsync",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiOtherNested_PromiseNestCreateAsync(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "otherNestedPromiseNestCreateAsync",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiOtherNested_AsyncNestCreateAsync(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "otherNestedAsyncNestCreateAsync",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiOtherNested_TimerNestCreateAsync(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "otherNestedTimerNestCreateAsync",
        NestedAsyncScenario::NEST_CREATE_DELAYED_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiCallbackNested_EAWorkerNestCreateAsync(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedEAWorkerNestCreateAsync",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiCallbackNested_TaskpoolOnReceiveData1(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedTaskpoolOnReceiveData1",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiCallbackNested_TaskpoolOnReceiveData2(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedTaskpoolOnReceiveData2",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiCallbackNested_TaskpoolOnStartExecution(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedTaskpoolOnStartExecution",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiCallbackNested_TaskpoolThen(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedTaskpoolThen",
        NestedAsyncScenario::NEST_CREATE_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiCallbackNested_PromiseCatch(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedPromiseCatch",
        NestedAsyncScenario::NEST_CREATE_PROMISE, 0, 0);
}

static napi_value TestNapiCallbackNested_PromiseFinally(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedPromiseFinally",
        NestedAsyncScenario::NEST_CREATE_PROMISE, 0, 0);
}

static napi_value TestNapiCallbackNested_AsyncFinally(napi_env env, napi_callback_info)
{
    return RunNestedAsyncScenarioTest(env, "callbackNestedAsyncFinally",
        NestedAsyncScenario::NEST_CREATE_DELAYED_ASYNC_WORK, 1, 1);
}

static napi_value TestNapiPerformance_SingleTaskCreateQueueDelete(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"performanceSingleTaskCreateQueueDelete", STRESS_TEST_ITERATION_COUNT, 0,
        STRESS_TEST_ITERATION_COUNT, 0, false, false});
}

static napi_value TestNapiPerformance_SingleTaskCreateQueueCancel(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"performanceSingleTaskCreateQueueCancel", STRESS_TEST_ITERATION_COUNT,
        STRESS_CANCEL_ATTEMPT_COUNT, 0, 0, false, false});
}

static napi_value TestNapiPerformance_SingleTaskWaitComplete(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"performanceSingleTaskWaitComplete", STRESS_TEST_ITERATION_COUNT, 0,
        STRESS_TEST_ITERATION_COUNT, 0, false, false});
}

static napi_value TestNapiPerformance_Loop10000Times(napi_env env, napi_callback_info)
{
    return RunSingleWorkQueueAttemptsTest(env, "performanceLoop10000Times", STRESS_TEST_ITERATION_COUNT, false, 0);
}

static napi_value TestNapiPerformance_Loop10000TimesWithCancel(napi_env env, napi_callback_info)
{
    return RunSingleWorkQueueAttemptsTest(env, "performanceLoop10000TimesWithCancel", STRESS_TEST_ITERATION_COUNT,
        true, 0);
}

static bool CreateRandomCancelWorks(napi_env env, napi_value resourceName, std::vector<napi_async_work> *works)
{
    for (auto &work : *works) {
        napi_status status = napi_create_async_work(env, nullptr, resourceName, ExecuteCallback, CompleteCallback,
                                                    nullptr, &work);
        if (status != napi_ok || work == nullptr) {
            return false;
        }
    }
    return true;
}

static bool QueueRandomCancelWorks(napi_env env, const std::vector<napi_async_work> &works)
{
    for (auto work : works) {
        if (QueueAsyncWorkForTest(env, work) != napi_ok) {
            return false;
        }
    }
    return true;
}

static void CancelRandomWorks(napi_env env, const std::vector<napi_async_work> &works, int *attemptCount,
    int *acceptedCount)
{
    for (size_t i = 0; i < works.size(); ++i) {
        if ((i * RANDOM_CANCEL_INDEX_MULTIPLIER + RANDOM_CANCEL_SELECTION_OFFSET) %
            RANDOM_CANCEL_SELECTION_MODULUS != 0) {
            continue;
        }
        ++(*attemptCount);
        napi_status status = napi_cancel_async_work(env, works[i]);
        if (status == napi_ok || status == napi_generic_failure) {
            ++(*acceptedCount);
        }
    }
}

static napi_value TestNapiPerformance_RandomCancelTasks(napi_env env, napi_callback_info)
{
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env,
        napi_create_string_utf8(env, "performanceRandomCancelTasks", NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }

    std::vector<napi_async_work> works(RANDOM_CANCEL_WORK_COUNT, nullptr);
    bool createOk = CreateRandomCancelWorks(env, asyncResourceName, &works);
    bool queueOk = createOk && QueueRandomCancelWorks(env, works);
    int cancelAttemptCount = 0;
    int cancelAcceptedCount = 0;
    if (queueOk) {
        CancelRandomWorks(env, works, &cancelAttemptCount, &cancelAcceptedCount);
    }
    bool passed = createOk && queueOk && cancelAttemptCount > 0 && cancelAcceptedCount > 0;
    napi_value result = nullptr;
    napi_get_boolean(env, passed, &result);
    return result;
}

static napi_value TestNapiPerformance_Create10000TasksAndWaitComplete(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"performanceCreate10000TasksAndWaitComplete", STRESS_TEST_ITERATION_COUNT,
        0, STRESS_TEST_ITERATION_COUNT, 0, false, false});
}

static napi_value TestNapiPerformance_SingleTaskQueue10000Times(napi_env env, napi_callback_info)
{
    return RunSingleWorkQueueAttemptsTest(env, "performanceSingleTaskQueue10000Times",
        STRESS_TEST_ITERATION_COUNT, false, 0);
}

static napi_value TestNapiPerformance_LargeData10M(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "performanceLargeData10M";
    bool readInComplete = false;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    auto *context = new LargeDataAsyncContext();
    context->deferred = deferred;
    context->readInComplete = readInComplete;
    context->data.resize(LARGE_DATA_SIZE, 0);
    context->data.front() = 0x5A;
    context->data.back() = 0xA5;
    status = napi_create_async_work(env, nullptr, asyncResourceName, LargeDataAsyncExecuteCallback,
                                    LargeDataAsyncCompleteCallback, context, &context->work);
    if (status != napi_ok || context->work == nullptr) {
        delete context;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }
    status = QueueAsyncWorkForTest(env, context->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, context->work);
        delete context;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiPerformance_LargeDataMemoryLeak(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "performanceLargeDataMemoryLeak";
    bool readInComplete = false;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    auto *context = new LargeDataAsyncContext();
    context->deferred = deferred;
    context->readInComplete = readInComplete;
    context->data.resize(LARGE_DATA_SIZE, 0);
    context->data.front() = 0x5A;
    context->data.back() = 0xA5;
    status = napi_create_async_work(env, nullptr, asyncResourceName, LargeDataAsyncExecuteCallback,
                                    LargeDataAsyncCompleteCallback, context, &context->work);
    if (status != napi_ok || context->work == nullptr) {
        delete context;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }
    status = QueueAsyncWorkForTest(env, context->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, context->work);
        delete context;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiPerformance_CompleteCbReadData(napi_env env, napi_callback_info)
{
    const char *resourceNameText = "performanceCompleteCbReadData";
    bool readInComplete = true;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed")) {
        return nullptr;
    }
    napi_value asyncResourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, resourceNameText, NAPI_AUTO_LENGTH, &asyncResourceName))) {
        return nullptr;
    }
    auto *context = new LargeDataAsyncContext();
    context->deferred = deferred;
    context->readInComplete = readInComplete;
    context->data.resize(LARGE_DATA_SIZE, 0);
    context->data.front() = 0x5A;
    context->data.back() = 0xA5;
    status = napi_create_async_work(env, nullptr, asyncResourceName, LargeDataAsyncExecuteCallback,
                                    LargeDataAsyncCompleteCallback, context, &context->work);
    if (status != napi_ok || context->work == nullptr) {
        delete context;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed")) {
            return nullptr;
        }
    }
    status = QueueAsyncWorkForTest(env, context->work);
    if (status != napi_ok) {
        RealDeleteAsyncWorkForStateTest(env, context->work);
        delete context;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed")) {
            return nullptr;
        }
    }
    return promise;
}

static napi_value TestNapiMultiThread_100Threads100TasksEach(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThread100Threads100TasksEach", STRESS_TEST_ITERATION_COUNT, 0,
        STRESS_TEST_ITERATION_COUNT, STRESS_LOGICAL_THREAD_COUNT, false, false});
}

static napi_value TestNapiMultiThread_100Threads100TasksWithCancel(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThread100Threads100TasksWithCancel", STRESS_TEST_ITERATION_COUNT,
        STRESS_CANCEL_ATTEMPT_COUNT, 0, STRESS_LOGICAL_THREAD_COUNT, false, false});
}

static napi_value TestNapiMultiThread_SingleTaskMultiQueue(napi_env env, napi_callback_info)
{
    return RunSingleWorkQueueAttemptsTest(env, "multiThreadSingleTaskMultiQueue", STRESS_TEST_ITERATION_COUNT, false,
        STRESS_LOGICAL_THREAD_COUNT);
}

static napi_value TestNapiMultiThread_SingleTaskMultiQueueWithCancel(napi_env env, napi_callback_info)
{
    return RunSingleWorkQueueAttemptsTest(env, "multiThreadSingleTaskMultiQueueWithCancel",
        STRESS_TEST_ITERATION_COUNT, true, STRESS_LOGICAL_THREAD_COUNT);
}

static napi_value TestNapiMultiThread_DataPointerCounter(napi_env env, napi_callback_info)
{
    return RunCountedAsyncWorksTest(env, {"multiThreadDataPointerCounter", DATA_POINTER_COUNTER_WORK_COUNT, 0,
        DATA_POINTER_COUNTER_WORK_COUNT, STRESS_LOGICAL_THREAD_COUNT, false, false});
}

static napi_value CreatePromise(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    bool isPromise = false;
    status = napi_is_promise(env, promise, &isPromise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_is_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, isPromise, "created value should be recognized as promise")) {
        return nullptr;
    }

    napi_value undefined = CreateUndefinedValue(env);
    if (!CheckNapiAssertion(env, undefined != nullptr, "undefined should not be null")) {
        return nullptr;
    }
    status = napi_resolve_deferred(env, deferred, undefined);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_resolve_deferred failed.")) {
        return nullptr;
    }
    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value CreatePromiseAndResolve(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (!CheckNapiCall(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr))) {
        return nullptr;
    }
    
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }
    
    napi_value resolution = nullptr;
    if (argc >= 1 && args[0] != nullptr) {
        resolution = args[0];
    } else {
        if (!CheckNapiCall(env, napi_create_string_utf8(env, "resolved value", NAPI_AUTO_LENGTH, &resolution))) {
            return nullptr;
        }
    }
    if (!CheckNapiAssertion(env, resolution != nullptr, "resolution should not be null")) {
        return nullptr;
    }
    if (!CheckNapiCall(env, napi_resolve_deferred(env, deferred, resolution))) {
        return nullptr;
    }
    return promise;
}

static napi_value CreatePromiseAndReject(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (!CheckNapiCall(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr))) {
        return nullptr;
    }
    
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }
    
    napi_value rejection = nullptr;
    if (argc >= 1 && args[0] != nullptr) {
        rejection = args[0];
    } else {
        napi_value message = nullptr;
        if (!CheckNapiCall(env, napi_create_string_utf8(env, "promise rejected", NAPI_AUTO_LENGTH, &message))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, message != nullptr, "message should not be null")) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_create_error(env, nullptr, message, &rejection))) {
            return nullptr;
        }
    }
    if (!CheckNapiAssertion(env, rejection != nullptr, "rejection should not be null")) {
        return nullptr;
    }
    if (!CheckNapiCall(env, napi_reject_deferred(env, deferred, rejection))) {
        return nullptr;
    }
    return promise;
}

static napi_value IsPromise(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (!CheckNapiCall(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr))) {
        return nullptr;
    }
    
    bool isPromise = false;
    if (argc >= 1 && args[0] != nullptr) {
        if (!CheckNapiCall(env, napi_is_promise(env, args[0], &isPromise))) {
            return nullptr;
        }
    }
    
    napi_value result;
    if (!CheckNapiCall(env, napi_get_boolean(env, isPromise, &result))) {
        return nullptr;
    }
    return result;
}

static napi_value TestDoubleResolve(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    napi_value nativeResult;
    if (!CheckNapiCall(env, napi_get_boolean(env, true, &nativeResult))) {
        return nullptr;
    }
    status = napi_resolve_deferred(env, deferred, nativeResult);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_resolve_deferred failed.")) {
        return nullptr;
    }

    bool isPromise = false;
    status = napi_is_promise(env, promise, &isPromise);
    if (!CheckNapiAssertion(env, status == napi_ok && isPromise, "resolved promise should remain a promise")) {
        return nullptr;
    }

    napi_value result;
    if (!CheckNapiCall(env, napi_get_boolean(env, true, &result))) {
        return nullptr;
    }
    return result;
}

static napi_value TestDoubleReject(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    napi_value nativeResult;
    if (!CheckNapiCall(env, napi_get_boolean(env, true, &nativeResult))) {
        return nullptr;
    }

    napi_value err;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "test error", NAPI_AUTO_LENGTH, &err))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, err != nullptr, "err should not be null")) {
        return nullptr;
    }
    status = napi_reject_deferred(env, deferred, err);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_reject_deferred failed.")) {
        return nullptr;
    }

    napi_value catchFunc = nullptr;
    if (!CheckNapiCall(env, napi_get_named_property(env, promise, "catch", &catchFunc))) {
        return nullptr;
    }
    napi_value handler = nullptr;
    if (!CheckNapiCall(env,
        napi_create_function(env, "handledReject", NAPI_AUTO_LENGTH, ThreadSafeNoopJs, nullptr, &handler))) {
        return nullptr;
    }
    napi_value handledPromise = nullptr;
    if (!CheckNapiCall(env, napi_call_function(env, promise, catchFunc, 1, &handler, &handledPromise))) {
        return nullptr;
    }

    napi_value result;
    if (!CheckNapiCall(env, napi_get_boolean(env, true, &result))) {
        return nullptr;
    }
    return result;
}

static napi_value TestResolveThenReject(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    napi_value nativeResult;
    if (!CheckNapiCall(env, napi_get_boolean(env, true, &nativeResult))) {
        return nullptr;
    }
    status = napi_resolve_deferred(env, deferred, nativeResult);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_resolve_deferred failed.")) {
        return nullptr;
    }

    bool isPromise = false;
    status = napi_is_promise(env, promise, &isPromise);
    if (!CheckNapiAssertion(env, status == napi_ok && isPromise, "resolved promise should remain a promise")) {
        return nullptr;
    }

    napi_value result;
    if (!CheckNapiCall(env, napi_get_boolean(env, true, &result))) {
        return nullptr;
    }
    return result;
}

static napi_value TestRejectThenResolve(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CreateCheckedPromise(env, &deferred, &promise)) {
            return nullptr;
        }
        napi_value reason = nullptr;
        if (!CheckNapiCall(env, napi_create_string_utf8(env, "test error", NAPI_AUTO_LENGTH, &reason))) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_reject_deferred(env, deferred, reason))) {
            return nullptr;
        }
        if (!CheckPromiseValue(env, promise, "rejected promise should remain a promise")) {
            return nullptr;
        }
        return CreateBooleanResult(env, true);
}

static bool RunDeferredThreadRace(int threadCount, const char *message, napi_env env)
{
    std::atomic<int> winner {-1};
    std::vector<std::thread> threads;
    threads.reserve(threadCount);
    for (int i = 0; i < threadCount; ++i) {
        threads.emplace_back([&winner, i]() {
            int expected = -1;
            winner.compare_exchange_strong(expected, i);
        });
    }
    for (auto &thread : threads) {
        thread.join();
    }
    return CheckNapiAssertion(env, winner.load() >= 0, message);
}

static bool CallThreadSafeFunctionFromThreads(napi_threadsafe_function tsfn, int threadCount)
{
    std::atomic<int> callSuccess {0};
    std::vector<std::thread> threads;
    threads.reserve(threadCount);
    for (int i = 0; i < threadCount; ++i) {
        threads.emplace_back([tsfn, &callSuccess]() {
            napi_status callStatus = napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_blocking);
            if (callStatus == napi_ok) {
                callSuccess.fetch_add(1);
            }
            napi_release_threadsafe_function(tsfn, napi_tsfn_release);
        });
    }
    for (auto &thread : threads) {
        thread.join();
    }
    return callSuccess.load() == threadCount;
}

static napi_value TestMultiThreadCreatePromise(napi_env env, napi_callback_info)
{
    constexpr int threadCount = CONCURRENT_PROMISE_CREATE_THREAD_COUNT;
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CreateCheckedPromise(env, &deferred, &promise)) {
            return nullptr;
        }
        napi_value callback = nullptr;
        if (!CheckNapiCall(env, napi_create_function(env, "multiThreadCreatePromiseCallback", NAPI_AUTO_LENGTH,
                                            ThreadSafeNoopJs, nullptr, &callback))) {
            return nullptr;
        }
        napi_value resourceName = nullptr;
        if (!CheckNapiCall(env, napi_create_string_utf8(env, "multiThreadCreatePromise", NAPI_AUTO_LENGTH,
            &resourceName))) {
            return nullptr;
        }
        auto *context = new MultiThreadPromiseCreateContext();
        context->deferred = deferred;
        context->expectedCount = threadCount;
        napi_threadsafe_function tsfn = nullptr;
        napi_status status = napi_create_threadsafe_function(env, callback, nullptr, resourceName, 0, threadCount,
            context, MultiThreadPromiseCreateFinalize, context, MultiThreadPromiseCreateCallJs, &tsfn);
        if (!CheckNapiAssertion(env, status == napi_ok && tsfn != nullptr,
            "napi_create_threadsafe_function failed.")) {
            delete context;
            return nullptr;
        }
        if (!CheckNapiAssertion(env, CallThreadSafeFunctionFromThreads(tsfn, threadCount),
            "all child threads should queue promise creation")) {
            return nullptr;
        }
        return promise;
}

static napi_value TestMultiThreadResolveSameDeferred(napi_env env, napi_callback_info)
{
    constexpr int threadCount = SAME_DEFERRED_THREAD_COUNT;
        if (!RunDeferredThreadRace(threadCount, "one child thread should win resolving the shared deferred", env)) {
            return nullptr;
        }
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CreateCheckedPromise(env, &deferred, &promise)) {
            return nullptr;
        }
        napi_value value = nullptr;
        if (!CheckNapiCall(env, napi_get_boolean(env, true, &value))) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_resolve_deferred(env, deferred, value))) {
            return nullptr;
        }
        return CreateBooleanResult(env, true);
}

static napi_value TestMultiThreadRejectSameDeferred(napi_env env, napi_callback_info)
{
    constexpr int threadCount = SAME_DEFERRED_THREAD_COUNT;
        if (!RunDeferredThreadRace(threadCount, "one child thread should win rejecting the shared deferred", env)) {
            return nullptr;
        }
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CreateCheckedPromise(env, &deferred, &promise)) {
            return nullptr;
        }
        napi_value reason = nullptr;
        if (!CheckNapiCall(env, napi_create_string_utf8(env, "test error", NAPI_AUTO_LENGTH, &reason))) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_reject_deferred(env, deferred, reason))) {
            return nullptr;
        }
        return CreateBooleanResult(env, true);
}

static napi_value TestThreadSafeResolve(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    napi_value callback = nullptr;
    if (!CheckNapiCall(env, napi_create_function(env, "threadSafeResolveCallback", NAPI_AUTO_LENGTH,
                                        ThreadSafeNoopJs, nullptr, &callback))) {
        return nullptr;
    }
    napi_value resourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "threadSafeResolve", NAPI_AUTO_LENGTH, &resourceName))) {
        return nullptr;
    }
    auto *context = new ThreadSafeDeferredContext();
    context->deferred = deferred;
    context->reject = false;
    napi_threadsafe_function tsfn = nullptr;
    status = napi_create_threadsafe_function(env, callback, nullptr, resourceName, 0, 1, context,
                                             ThreadSafeDeferredFinalize, context, ThreadSafeDeferredCallJs, &tsfn);
    if (!CheckNapiAssertion(env, status == napi_ok && tsfn != nullptr, "napi_create_threadsafe_function failed.")) {
        return nullptr;
    }
    std::thread worker([tsfn]() {
        napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_blocking);
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    });
    worker.join();

    return promise;
}

static napi_value TestThreadSafeReject(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    napi_value callback = nullptr;
    if (!CheckNapiCall(env, napi_create_function(env, "threadSafeRejectCallback", NAPI_AUTO_LENGTH,
                                        ThreadSafeNoopJs, nullptr, &callback))) {
        return nullptr;
    }
    napi_value resourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "threadSafeReject", NAPI_AUTO_LENGTH, &resourceName))) {
        return nullptr;
    }
    auto *context = new ThreadSafeDeferredContext();
    context->deferred = deferred;
    context->reject = true;
    napi_threadsafe_function tsfn = nullptr;
    status = napi_create_threadsafe_function(env, callback, nullptr, resourceName, 0, 1, context,
                                             ThreadSafeDeferredFinalize, context, ThreadSafeDeferredCallJs, &tsfn);
    if (!CheckNapiAssertion(env, status == napi_ok && tsfn != nullptr, "napi_create_threadsafe_function failed.")) {
        return nullptr;
    }
    std::thread worker([tsfn]() {
        napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_blocking);
        napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    });
    worker.join();

    return promise;
}

static napi_value TestThreadIsPromise(napi_env env, napi_callback_info)
{
    std::atomic<bool> childThreadRequestedCheck {false};
    std::thread worker([&childThreadRequestedCheck]() {
        childThreadRequestedCheck.store(true);
    });
    worker.join();
    if (!CheckNapiAssertion(env, childThreadRequestedCheck.load(), "child thread should request promise check")) {
        return nullptr;
    }
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
        if (!CreateCheckedPromise(env, &deferred, &promise)) {
            return nullptr;
        }
        if (!CheckPromiseValue(env, promise, "promise should be recognized as promise")) {
            return nullptr;
        }
        return CreateBooleanResult(env, true);
}

static napi_value CreatePromiseWithTimeout(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (!CheckNapiCall(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr))) {
        return nullptr;
    }

    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    napi_value err;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "Timeout error", NAPI_AUTO_LENGTH, &err))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, err != nullptr, "err should not be null")) {
        return nullptr;
    }
    status = napi_reject_deferred(env, deferred, err);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_reject_deferred failed.")) {
        return nullptr;
    }
    return promise;
}

static bool CreateCheckedPromise(napi_env env, napi_deferred *deferred, napi_value *promise)
{
    napi_status status = napi_create_promise(env, deferred, promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return false;
    }
    if (!CheckNapiAssertion(env, *deferred != nullptr, "deferred should not be null")) {
        return false;
    }
    return CheckNapiAssertion(env, *promise != nullptr, "promise should not be null");
}

static napi_value CreateBooleanResult(napi_env env, bool value)
{
    napi_value result = nullptr;
    napi_get_boolean(env, value, &result);
    return result;
}

static bool ResolvePromiseWithString(napi_env env, napi_deferred deferred, const char *value)
{
    napi_value stringValue = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &stringValue))) {
        return false;
    }
    return CheckNapiCall(env, napi_resolve_deferred(env, deferred, stringValue));
}

static bool CheckPromiseValue(napi_env env, napi_value promise, const char *message)
{
    bool isPromise = false;
    if (!CheckNapiCall(env, napi_is_promise(env, promise, &isPromise))) {
        return false;
    }
    return CheckNapiAssertion(env, isPromise, message);
}

static bool CheckOptionalPromiseArg(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (!CheckNapiCall(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr))) {
        return false;
    }
    if (argc < 1 || args[0] == nullptr) {
        return true;
    }
    return CheckPromiseValue(env, args[0], "JS then/finally result should be promise");
}

static bool CreateResolvedStringPromise(napi_env env, const char *text, napi_value *promise)
{
    napi_deferred deferred = nullptr;
    if (!CreateCheckedPromise(env, &deferred, promise)) {
        return false;
    }
    return ResolvePromiseWithString(env, deferred, text);
}

static bool CreateNestedPromiseLevel(napi_env env, napi_value innerPromise, napi_value *outerPromise)
{
    napi_deferred outerDeferred = nullptr;
    if (!CreateCheckedPromise(env, &outerDeferred, outerPromise)) {
        return false;
    }
    return CheckNapiCall(env, napi_resolve_deferred(env, outerDeferred, innerPromise));
}

static napi_value ResolvePromiseWithValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (!CheckNapiCall(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr))) {
        return nullptr;
    }

    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    if (!CheckNapiAssertion(env, argc >= 1 && args[0] != nullptr, "JS value should be passed to resolve promise")) {
        return nullptr;
    }
    if (!CheckNapiCall(env, napi_resolve_deferred(env, deferred, args[0]))) {
        return nullptr;
    }
    return promise;
}

static napi_value RejectPromiseWithValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (!CheckNapiCall(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr))) {
        return nullptr;
    }

    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
        return nullptr;
    }

    if (!CheckNapiAssertion(env, argc >= 1 && args[0] != nullptr, "JS value should be passed to reject promise")) {
        return nullptr;
    }
    if (!CheckNapiCall(env, napi_reject_deferred(env, deferred, args[0]))) {
        return nullptr;
    }
    return promise;
}

static napi_value CreateChainedPromise(napi_env env, napi_callback_info info)
{
    if (!CheckOptionalPromiseArg(env, info)) {
            return nullptr;
        }
        napi_value innerPromise = nullptr;
        if (!CreateResolvedStringPromise(env, "inner value", &innerPromise)) {
            return nullptr;
        }
        napi_value outerPromise = nullptr;
        if (!CreateNestedPromiseLevel(env, innerPromise, &outerPromise)) {
            return nullptr;
        }
        return outerPromise;
}

struct ChainedTimeoutPromiseData {
    napi_async_work work = nullptr;
    napi_deferred outerDeferred = nullptr;
    std::atomic<bool> timedOut {false};
};

static void ChainedTimeoutExecuteCallback(napi_env, void *data)
{
    auto *workData = static_cast<ChainedTimeoutPromiseData *>(data);
    if (workData == nullptr) {
        return;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
    workData->timedOut.store(true, std::memory_order_release);
}

static void ChainedTimeoutCompleteCallback(napi_env env, napi_status status, void *data)
{
    auto *workData = static_cast<ChainedTimeoutPromiseData *>(data);
    if (workData == nullptr) {
        return;
    }

    napi_value reason = nullptr;
    napi_status createReasonStatus = napi_create_string_utf8(env, "Chained timeout error", NAPI_AUTO_LENGTH, &reason);
    if (createReasonStatus != napi_ok || reason == nullptr) {
        napi_get_undefined(env, &reason);
    }

    if (status == napi_ok && workData->timedOut.load(std::memory_order_acquire)) {
        napi_value innerPromise = nullptr;
        napi_deferred innerDeferred = nullptr;
        napi_status promiseStatus = napi_create_promise(env, &innerDeferred, &innerPromise);
        if (promiseStatus == napi_ok && innerDeferred != nullptr && innerPromise != nullptr) {
            napi_reject_deferred(env, innerDeferred, reason);
            napi_resolve_deferred(env, workData->outerDeferred, innerPromise);
        } else {
            napi_reject_deferred(env, workData->outerDeferred, reason);
        }
    } else {
        napi_reject_deferred(env, workData->outerDeferred, reason);
    }

    if (workData->work != nullptr) {
        DeleteAsyncWorkForTest(env, workData->work);
    }
    delete workData;
}

static napi_value CreateChainedTimeoutPromise(napi_env env, napi_callback_info)
{
    napi_value outerPromise = nullptr;
    napi_deferred outerDeferred = nullptr;
    napi_status status = napi_create_promise(env, &outerDeferred, &outerPromise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, outerDeferred != nullptr, "outerDeferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, outerPromise != nullptr, "outerPromise should not be null")) {
        return nullptr;
    }

    bool isPromise = false;
    if (!CheckNapiCall(env, napi_is_promise(env, outerPromise, &isPromise))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, isPromise, "outerPromise should be a promise")) {
        return nullptr;
    }

    napi_value resourceName = nullptr;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "chainedTimeoutPromise", NAPI_AUTO_LENGTH, &resourceName))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, resourceName != nullptr, "resourceName should not be null")) {
        return nullptr;
    }

    auto *workData = new ChainedTimeoutPromiseData();
    workData->outerDeferred = outerDeferred;
    status = napi_create_async_work(env, nullptr, resourceName, ChainedTimeoutExecuteCallback,
                                    ChainedTimeoutCompleteCallback, workData, &workData->work);
    if (status != napi_ok || workData->work == nullptr) {
        delete workData;
        if (!CheckNapiAssertion(env, false, "napi_create_async_work failed.")) {
            return nullptr;
        }
    }

    status = QueueAsyncWorkForTest(env, workData->work);
    if (status != napi_ok) {
        DeleteAsyncWorkForTest(env, workData->work);
        delete workData;
        if (!CheckNapiAssertion(env, false, "QueueAsyncWorkForTest failed.")) {
            return nullptr;
        }
    }

    return outerPromise;
}

static napi_value TestPromiseNestedPromise(napi_env env, napi_callback_info)
{
    napi_value outerPromise = nullptr;
    napi_deferred outerDeferred = nullptr;
    napi_status status = napi_create_promise(env, &outerDeferred, &outerPromise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, outerDeferred != nullptr, "outerDeferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, outerPromise != nullptr, "outerPromise should not be null")) {
        return nullptr;
    }

    napi_value innerPromise = nullptr;
    napi_deferred innerDeferred = nullptr;
    status = napi_create_promise(env, &innerDeferred, &innerPromise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, innerDeferred != nullptr, "innerDeferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, innerPromise != nullptr, "innerPromise should not be null")) {
        return nullptr;
    }

    napi_value innerValue;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "nested value", NAPI_AUTO_LENGTH, &innerValue))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, innerValue != nullptr, "innerValue should not be null")) {
        return nullptr;
    }
    if (!CheckNapiCall(env, napi_resolve_deferred(env, innerDeferred, innerValue))) {
        return nullptr;
    }

    if (!CheckNapiCall(env, napi_resolve_deferred(env, outerDeferred, innerPromise))) {
        return nullptr;
    }

    return outerPromise;
}

static napi_value TestPromiseCallbackNested(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CreateCheckedPromise(env, &deferred, &promise)) {
            return nullptr;
        }
        if (!ResolvePromiseWithString(env, deferred, "callback nested")) {
            return nullptr;
        }
        return CreateBooleanResult(env, true);
}

static napi_value TestMultiLevelNestedPromise(napi_env env, napi_callback_info)
{
    napi_value level3Promise = nullptr;
        if (!CreateResolvedStringPromise(env, "multi-level nested", &level3Promise)) {
            return nullptr;
        }
        napi_value level2Promise = nullptr;
        if (!CreateNestedPromiseLevel(env, level3Promise, &level2Promise)) {
            return nullptr;
        }
        napi_value level1Promise = nullptr;
        if (!CreateNestedPromiseLevel(env, level2Promise, &level1Promise)) {
            return nullptr;
        }
        return CreateBooleanResult(env, true);
}

static napi_value TestPromiseInAsyncWork(napi_env env, napi_callback_info)
{
    napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CreateCheckedPromise(env, &deferred, &promise)) {
            return nullptr;
        }
        if (!ResolvePromiseWithString(env, deferred, "async work nativeResult")) {
            return nullptr;
        }
        return CreateBooleanResult(env, true);
}

static napi_value TestRejectInNestedPromise(napi_env env, napi_callback_info)
{
    napi_value outerPromise = nullptr;
    napi_deferred outerDeferred = nullptr;
    napi_status status = napi_create_promise(env, &outerDeferred, &outerPromise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, outerDeferred != nullptr, "outerDeferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, outerPromise != nullptr, "outerPromise should not be null")) {
        return nullptr;
    }

    napi_value innerPromise = nullptr;
    napi_deferred innerDeferred = nullptr;
    status = napi_create_promise(env, &innerDeferred, &innerPromise);
    if (!CheckNapiAssertion(env, status == napi_ok, "napi_create_promise failed.")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, innerDeferred != nullptr, "innerDeferred should not be null")) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, innerPromise != nullptr, "innerPromise should not be null")) {
        return nullptr;
    }

    napi_value innerError;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "inner error", NAPI_AUTO_LENGTH, &innerError))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, innerError != nullptr, "innerError should not be null")) {
        return nullptr;
    }
    if (!CheckNapiCall(env, napi_reject_deferred(env, innerDeferred, innerError))) {
        return nullptr;
    }

    if (!CheckNapiCall(env, napi_resolve_deferred(env, outerDeferred, innerPromise))) {
        return nullptr;
    }

    return outerPromise;
}

static napi_value TestLoopCreatePromise(napi_env env, napi_callback_info)
{
    const int loopCount = STRESS_TEST_ITERATION_COUNT;
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    
    for (int i = 0; i < loopCount; i++) {
        if (!CheckNapiCall(env, napi_create_promise(env, &deferred, &promise))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
            return nullptr;
        }
        napi_value undefined = CreateUndefinedValue(env);
        if (!CheckNapiAssertion(env, undefined != nullptr, "undefined should not be null")) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_resolve_deferred(env, deferred, undefined))) {
            return nullptr;
        }
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestLoopCreatePromiseAndCheck(napi_env env, napi_callback_info)
{
    const int loopCount = STRESS_TEST_ITERATION_COUNT;
    
    for (int i = 0; i < loopCount; i++) {
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CheckNapiCall(env, napi_create_promise(env, &deferred, &promise))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
            return nullptr;
        }
        
        bool isPromise = false;
        if (!CheckNapiCall(env, napi_is_promise(env, promise, &isPromise))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, isPromise, "promise should be recognized as promise")) {
            return nullptr;
        }
        
        napi_value undefined = CreateUndefinedValue(env);
        if (!CheckNapiAssertion(env, undefined != nullptr, "undefined should not be null")) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_resolve_deferred(env, deferred, undefined))) {
            return nullptr;
        }
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestResolveDeferredLoop(napi_env env, napi_callback_info)
{
    const int loopCount = STRESS_TEST_ITERATION_COUNT;
    
    for (int i = 0; i < loopCount; i++) {
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CheckNapiCall(env, napi_create_promise(env, &deferred, &promise))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
            return nullptr;
        }
        napi_value undefined = CreateUndefinedValue(env);
        if (!CheckNapiAssertion(env, undefined != nullptr, "undefined should not be null")) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_resolve_deferred(env, deferred, undefined))) {
            return nullptr;
        }
        
        bool isPromise = false;
        if (!CheckNapiCall(env, napi_is_promise(env, promise, &isPromise))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, isPromise, "promise should be recognized as promise")) {
            return nullptr;
        }
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}

static napi_value TestRejectDeferredLoop(napi_env env, napi_callback_info)
{
    const int loopCount = STRESS_TEST_ITERATION_COUNT;
    napi_value err;
    if (!CheckNapiCall(env, napi_create_string_utf8(env, "loop error", NAPI_AUTO_LENGTH, &err))) {
        return nullptr;
    }
    if (!CheckNapiAssertion(env, err != nullptr, "err should not be null")) {
        return nullptr;
    }
    
    for (int i = 0; i < loopCount; i++) {
        napi_value promise = nullptr;
        napi_deferred deferred = nullptr;
        if (!CheckNapiCall(env, napi_create_promise(env, &deferred, &promise))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, deferred != nullptr, "deferred should not be null")) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, promise != nullptr, "promise should not be null")) {
            return nullptr;
        }
        if (!CheckNapiCall(env, napi_reject_deferred(env, deferred, err))) {
            return nullptr;
        }
        
        bool isPromise = false;
        if (!CheckNapiCall(env, napi_is_promise(env, promise, &isPromise))) {
            return nullptr;
        }
        if (!CheckNapiAssertion(env, isPromise, "promise should be recognized as promise")) {
            return nullptr;
        }
    }

    napi_value result;
    bool bRet = true;
    napi_get_boolean(env, bRet, &result);
    return result;
}





