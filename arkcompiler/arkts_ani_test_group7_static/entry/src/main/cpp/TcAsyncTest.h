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

#ifndef ARKTS_ANI_TEST_TC_ASYNC_TEST_H
#define ARKTS_ANI_TEST_TC_ASYNC_TEST_H
#include "Common.h"
#include <atomic>
#include <chrono>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>
#include <vector>
namespace ani_tc_async {
inline std::string g_asyncSavedData;
inline std::atomic<int> g_asyncUniqueId {0};
inline std::atomic<int> g_asyncRaceCounter {0};
inline std::mutex g_asyncMutex;
inline ani_ref g_asyncStoredCallback = nullptr;
constexpr int ASYNC_SLEEP_SHORT_MS = 50;
constexpr int ASYNC_SLEEP_HEAVY_MS = 100;
constexpr int ASYNC_SLEEP_LONG_MS = 2000;
constexpr int ASYNC_RACE_SLEEP_MS = 1;
constexpr ani_int ASYNC_DOUBLE_FACTOR = 2;
constexpr ani_int ASYNC_TRIPLE_FACTOR = 3;
constexpr ani_int ASYNC_INCREMENT_ONE = 1;
constexpr ani_double ASYNC_DOUBLE_FACTOR_D = 2.0;
constexpr int ASYNC_FIBONACCI_BASE_MAX = 1;
constexpr int ASYNC_FIBONACCI_PREVIOUS_ONE = 1;
constexpr int ASYNC_FIBONACCI_PREVIOUS_TWO = 2;
inline void SleepMs(int ms)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(ms));
}
inline std::string AsyncAniStringToStd(ani_env *env, ani_string str)
{
    ani_size size = 0;
    if (env->String_GetUTF8Size(str, &size) != ANI_OK) {
        return "";
    }
    std::vector<char> buffer(size + 1);
    ani_size written = 0;
    if (env->String_GetUTF8(str, buffer.data(), buffer.size(), &written) != ANI_OK) {
        return "";
    }
    return std::string(buffer.data(), written);
}
inline ani_string AsyncStdToAniString(ani_env *env, const std::string &value)
{
    ani_string result {};
    if (env->String_NewUTF8(value.c_str(), value.size(), &result) != ANI_OK) {
        return nullptr;
    }
    return result;
}
void ThrowAsyncError(ani_env *env, const char *message)
{
    ani_string msg = AsyncStdToAniString(env, message);
    ani_class errorCls {};
    ani_method ctor {};
    ani_object errorObj {};
    if (env->FindClass("std.core.Error", &errorCls) != ANI_OK) {
        return;
    }
    if (env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctor) != ANI_OK) {
        return;
    }
    if (env->Object_New(errorCls, ctor, &errorObj, msg) != ANI_OK) {
        return;
    }
    ani_error error = static_cast<ani_error>(errorObj);
    env->ThrowError(error);
}
ani_object CreateResolvedPromiseWithInt(ani_env *env, ani_int value)
{
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (!AssertEqMsg(status, ANI_OK, "Promise_New failed")) {
        return nullptr;
    }
    ani_object boxedValue {};
    status = env->Primitive_Box_Int(value, &boxedValue);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Box_Int failed")) {
        return promise;
    }
    status = env->PromiseResolver_Resolve(resolver, boxedValue);
    if (!AssertEqMsg(status, ANI_OK, "PromiseResolver_Resolve failed")) {
        return promise;
    }
    return promise;
}
ani_object CreateRejectedPromise(ani_env *env, const char *message)
{
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (!AssertEqMsg(status, ANI_OK, "Promise_New failed")) {
        return nullptr;
    }
    ani_string msg = AsyncStdToAniString(env, message);
    ani_class errorCls {};
    ani_method ctor {};
    ani_object errorObj {};
    if (env->FindClass("std.core.Error", &errorCls) != ANI_OK) {
        return promise;
    }
    if (env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctor) != ANI_OK) {
        return promise;
    }
    if (env->Object_New(errorCls, ctor, &errorObj, msg) != ANI_OK) {
        return promise;
    }
    ani_status rejectStatus = env->PromiseResolver_Reject(resolver, static_cast<ani_error>(errorObj));
    if (!AssertEqMsg(rejectStatus, ANI_OK, "PromiseResolver_Reject failed")) {
        return promise;
    }
    return promise;
}
inline int Fibonacci(int n)
{
    if (n <= ASYNC_FIBONACCI_BASE_MAX) {
        return n;
    }
    return Fibonacci(n - ASYNC_FIBONACCI_PREVIOUS_ONE) + Fibonacci(n - ASYNC_FIBONACCI_PREVIOUS_TWO);
}
}
ani_int test_AsyncHeavyTask(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_HEAVY_MS);
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR;
}
ani_boolean test_AsyncHeavyTaskStatus(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_SHORT_MS);
    return input >= 0;
}
ani_int test_AsyncThrowWhenNegative(ani_env *env, ani_object object, ani_int input)
{
    (void)object;
    if (input < 0) {
        ani_tc_async::ThrowAsyncError(env, "Native async input is invalid");
        return 0;
    }
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR;
}
ani_int test_AsyncCompute(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_SHORT_MS);
    return input * ani_tc_async::ASYNC_TRIPLE_FACTOR;
}
void test_AsyncSaveData(ani_env *env, ani_object object, ani_string data)
{
    (void)object;
    ani_tc_async::g_asyncSavedData = ani_tc_async::AsyncAniStringToStd(env, data);
}
ani_boolean test_AsyncCheckSaveData(ani_env *env, ani_object object, ani_string data)
{
    (void)object;
    std::string expected = ani_tc_async::AsyncAniStringToStd(env, data);
    return ani_tc_async::g_asyncSavedData == expected;
}
ani_boolean test_AsyncStringTask(ani_env *env, ani_object object, ani_string param)
{
    (void)object;
    std::string value = ani_tc_async::AsyncAniStringToStd(env, param);
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_SHORT_MS);
    return !value.empty();
}
ani_int test_AsyncLongRunningTask(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_LONG_MS);
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR;
}
ani_object test_AsyncWorkLegacy(ani_env *env, ani_object object, ani_int input)
{
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_SHORT_MS);
    return ani_tc_async::CreateResolvedPromiseWithInt(env, input * ani_tc_async::ASYNC_DOUBLE_FACTOR);
}
ani_object test_AsyncWorkThrowWithoutCatch(ani_env *env, ani_object object)
{
    (void)object;
    return ani_tc_async::CreateRejectedPromise(env, "Native async work rejected without catch");
}
ani_int test_AsyncRaceIncrement(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_RACE_SLEEP_MS);
    return ani_tc_async::g_asyncRaceCounter.fetch_add(
        ani_tc_async::ASYNC_INCREMENT_ONE) + ani_tc_async::ASYNC_INCREMENT_ONE;
}
ani_int test_AsyncGetRaceCounter(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    return ani_tc_async::g_asyncRaceCounter.load();
}
void test_AsyncResetRaceCounter(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_tc_async::g_asyncRaceCounter.store(0);
}
ani_double test_AsyncDoubleTask(ani_env *env, ani_object object, ani_double input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_SHORT_MS);
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR_D;
}
ani_int test_AsyncShortTask(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_RACE_SLEEP_MS);
    return input + ani_tc_async::ASYNC_INCREMENT_ONE;
}
ani_int test_AsyncGetUniqueId(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    return ani_tc_async::g_asyncUniqueId.fetch_add(1) + 1;
}
ani_boolean test_AsyncStoreCallback(ani_env *env, ani_object object, ani_fn_object callback)
{
    (void)object;
    if (ani_tc_async::g_asyncStoredCallback != nullptr) {
        env->GlobalReference_Delete(ani_tc_async::g_asyncStoredCallback);
        ani_tc_async::g_asyncStoredCallback = nullptr;
    }
    if (env->GlobalReference_Create(callback, &ani_tc_async::g_asyncStoredCallback) != ANI_OK) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}
ani_boolean test_AsyncTriggerStoredCallback(ani_env *env, ani_object object, ani_int value)
{
    (void)object;
    if (ani_tc_async::g_asyncStoredCallback == nullptr) {
        return ANI_FALSE;
    }
    ani_object boxed {};
    if (env->Primitive_Box_Int(value, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref argv[ani_tc_async::ASYNC_INCREMENT_ONE] = {boxed};
    ani_ref result {};
    ani_status status = env->FunctionalObject_Call(
        static_cast<ani_fn_object>(ani_tc_async::g_asyncStoredCallback),
        ani_tc_async::ASYNC_INCREMENT_ONE, argv, &result);
    return status == ANI_OK;
}
ani_object test_AsyncThrowInCompleteNoCatch(ani_env *env, ani_object object)
{
    (void)object;
    return ani_tc_async::CreateRejectedPromise(env, "Native complete callback threw without catch");
}
ani_object test_AsyncThrowInCompleteWithCatch(ani_env *env, ani_object object)
{
    (void)object;
    return ani_tc_async::CreateRejectedPromise(env, "Native complete callback threw with catch");
}
ani_int test_AsyncHeavyTaskSync(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_HEAVY_MS);
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR;
}
ani_int test_AsyncThrowSync(ani_env *env, ani_object object, ani_int input)
{
    (void)object;
    if (input < 0) {
        ani_tc_async::ThrowAsyncError(env, "Native sync task error");
        return 0;
    }
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR;
}
ani_int test_AsyncCancelableLongTask(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_LONG_MS);
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR;
}
ani_int test_AsyncFibonacci(ani_env *env, ani_object object, ani_int n)
{
    (void)env;
    (void)object;
    return ani_tc_async::Fibonacci(n);
}
ani_int test_AsyncSerialFibonacci(ani_env *env, ani_object object, ani_int n, ani_int count)
{
    (void)env;
    (void)object;
    int result = 0;
    for (int i = 0; i < count; i++) {
        result += ani_tc_async::Fibonacci(n);
    }
    return result;
}
ani_object test_AsyncWorkLegacyLoop(ani_env *env, ani_object object, ani_int input)
{
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_RACE_SLEEP_MS);
    return ani_tc_async::CreateResolvedPromiseWithInt(env, input + ani_tc_async::ASYNC_INCREMENT_ONE);
}
ani_int test_AsyncTaskpoolCompare(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_RACE_SLEEP_MS);
    return input + ani_tc_async::ASYNC_INCREMENT_ONE;
}
ani_object test_AsyncWorkExecuteThrow(ani_env *env, ani_object object)
{
    (void)object;
    return ani_tc_async::CreateRejectedPromise(env, "Native execute callback threw");
}
ani_int test_AsyncLockedTask(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    std::lock_guard<std::mutex> lock(ani_tc_async::g_asyncMutex);
    ani_tc_async::SleepMs(ani_tc_async::ASYNC_SLEEP_SHORT_MS);
    return input * ani_tc_async::ASYNC_DOUBLE_FACTOR;
}
#endif
