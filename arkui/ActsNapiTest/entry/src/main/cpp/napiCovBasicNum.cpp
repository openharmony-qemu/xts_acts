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

#include "napi/native_api.h"
#include "common/native_common.h"
#include <thread>
#include <atomic>

static const int32_t STABLE_LOOP_COUNT = 10;
static const int32_t BASIC_NUM_TEST_VALUE = 42;
static const double BASIC_NUM_TEST_DOUBLE_VALUE = 3.14;

static napi_value CreateInt32Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_int32(env, BASIC_NUM_TEST_VALUE, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateInt32MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_int32(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateInt32MultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, BASIC_NUM_TEST_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateInt32Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value napiRet = nullptr;
        napi_status status = napi_create_int32(newEnv, BASIC_NUM_TEST_VALUE, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateInt32Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_int32(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateUint32Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_uint32(env, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateUint32Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_uint32(env, BASIC_NUM_TEST_VALUE, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateUint32MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_uint32(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateUint32MultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value result = nullptr;
    napi_status status = napi_create_uint32(env, BASIC_NUM_TEST_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateUint32Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value napiRet = nullptr;
        napi_status status = napi_create_uint32(newEnv, BASIC_NUM_TEST_VALUE, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateUint32Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_uint32(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateInt64Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_int64(env, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateInt64Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_int64(env, 123456789012LL, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateInt64MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_int64(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateInt64MultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value result = nullptr;
    napi_status status = napi_create_int64(env, 123456789012LL, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateInt64Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value napiRet = nullptr;
        napi_status status = napi_create_int64(newEnv, 123456789012LL, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateInt64Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_int64(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDoubleAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_double(env, 0.0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateDoubleRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value result = nullptr;
    napi_status status = napi_create_double(env, BASIC_NUM_TEST_DOUBLE_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateDoubleStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_double(env, BASIC_NUM_TEST_DOUBLE_VALUE, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateDoubleMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_double(savedEnv, 0.0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDoubleMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value result = nullptr;
    napi_status status = napi_create_double(env, BASIC_NUM_TEST_DOUBLE_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateDoubleRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value napiRet = nullptr;
        napi_status status = napi_create_double(newEnv, BASIC_NUM_TEST_DOUBLE_VALUE, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDoubleWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_double(savedEnv, 0.0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueInt32Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_value_int32(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetValueInt32Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value num = nullptr;
        napi_create_int32(env, BASIC_NUM_TEST_VALUE, &num);
        int32_t val = 0;
        napi_status status = napi_get_value_int32(env, num, &val);
        int32_t singleRet = (status == napi_ok && val == 42) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueInt32MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_int32(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueInt32MultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value num = nullptr;
    napi_create_int32(env, BASIC_NUM_TEST_VALUE, &num);
    int32_t val = 0;
    napi_status status = napi_get_value_int32(env, num, &val);
    int32_t ret = (status == napi_ok && val == 42) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueInt32Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value num = nullptr;
        napi_create_int32(newEnv, BASIC_NUM_TEST_VALUE, &num);
        int32_t val = 0;
        napi_status status = napi_get_value_int32(newEnv, num, &val);
        int32_t ret = (status == napi_ok && val == 42) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueInt32Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_int32(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueUint32Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_value_uint32(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetValueUint32Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value num = nullptr;
        napi_create_uint32(env, BASIC_NUM_TEST_VALUE, &num);
        uint32_t val = 0;
        napi_status status = napi_get_value_uint32(env, num, &val);
        int32_t singleRet = (status == napi_ok && val == 42) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueUint32MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_uint32(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueUint32MultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value num = nullptr;
    napi_create_uint32(env, BASIC_NUM_TEST_VALUE, &num);
    uint32_t val = 0;
    napi_status status = napi_get_value_uint32(env, num, &val);
    int32_t ret = (status == napi_ok && val == 42) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueUint32Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value num = nullptr;
        napi_create_uint32(newEnv, BASIC_NUM_TEST_VALUE, &num);
        uint32_t val = 0;
        napi_status status = napi_get_value_uint32(newEnv, num, &val);
        int32_t ret = (status == napi_ok && val == 42) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueUint32Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_uint32(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueInt64Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value num = nullptr;
        napi_create_int64(env, 123456789012LL, &num);
        int64_t val = 0;
        napi_status status = napi_get_value_int64(env, num, &val);
        int32_t singleRet = (status == napi_ok && val == 123456789012LL) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueInt64MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_int64(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueInt64MultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value num = nullptr;
    napi_create_int64(env, 123456789012LL, &num);
    int64_t val = 0;
    napi_status status = napi_get_value_int64(env, num, &val);
    int32_t ret = (status == napi_ok && val == 123456789012LL) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueInt64Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value num = nullptr;
        napi_create_int64(newEnv, 123456789012LL, &num);
        int64_t val = 0;
        napi_status status = napi_get_value_int64(newEnv, num, &val);
        int32_t ret = (status == napi_ok && val == 123456789012LL) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueInt64Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_int64(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueDoubleAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_value_double(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetValueDoubleRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value num = nullptr;
    napi_create_double(env, BASIC_NUM_TEST_DOUBLE_VALUE, &num);
    double val = 0.0;
    napi_status status = napi_get_value_double(env, num, &val);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetValueDoubleStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value num = nullptr;
        napi_create_double(env, BASIC_NUM_TEST_DOUBLE_VALUE, &num);
        double val = 0.0;
        napi_status status = napi_get_value_double(env, num, &val);
        int32_t singleRet = (status == napi_ok && val > 3.0) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueDoubleMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_double(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueDoubleMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value num = nullptr;
    napi_create_double(env, BASIC_NUM_TEST_DOUBLE_VALUE, &num);
    double val = 0.0;
    napi_status status = napi_get_value_double(env, num, &val);
    int32_t ret = (status == napi_ok && val > 3.0) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueDoubleRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value num = nullptr;
        napi_create_double(newEnv, BASIC_NUM_TEST_DOUBLE_VALUE, &num);
        double val = 0.0;
        napi_status status = napi_get_value_double(newEnv, num, &val);
        int32_t ret = (status == napi_ok && val > 3.0) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueDoubleWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_double(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBoolAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_value_bool(env, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetValueBoolStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value bVal = nullptr;
        napi_get_boolean(env, true, &bVal);
        bool val = false;
        napi_status status = napi_get_value_bool(env, bVal, &val);
        int32_t singleRet = (status == napi_ok && val) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueBoolMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bool(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBoolMultiCtx(napi_env env, napi_callback_info info)
{
    napi_env ctxEnv = nullptr;
        napi_status ctxStatus = napi_create_ark_context(env, &ctxEnv);
    if (ctxStatus != napi_ok) {
        return Ret(env, 0);
    }
    napi_status swStatus = napi_switch_ark_context(env);
    if (swStatus != napi_ok) {
        napi_destroy_ark_context(env);
        return Ret(env, 0);
    }
    napi_value bVal = nullptr;
    napi_get_boolean(env, true, &bVal);
    bool val = false;
    napi_status status = napi_get_value_bool(env, bVal, &val);
    int32_t ret = (status == napi_ok && val) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueBoolRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value bVal = nullptr;
        napi_get_boolean(newEnv, true, &bVal);
        bool val = false;
        napi_status status = napi_get_value_bool(newEnv, bVal, &val);
        int32_t ret = (status == napi_ok && val) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBoolWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bool(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_property_descriptor initDescriptors[] = {
    DECLARE_NAPI_FUNCTION("createInt32Stable", CreateInt32Stable),
    DECLARE_NAPI_FUNCTION("createInt32MultiThread", CreateInt32MultiThread),
    DECLARE_NAPI_FUNCTION("createInt32MultiCtx", CreateInt32MultiCtx),
    DECLARE_NAPI_FUNCTION("createInt32Runtime", CreateInt32Runtime),
    DECLARE_NAPI_FUNCTION("createInt32Worker", CreateInt32Worker),
    DECLARE_NAPI_FUNCTION("createUint32Abnormal", CreateUint32Abnormal),
    DECLARE_NAPI_FUNCTION("createUint32Stable", CreateUint32Stable),
    DECLARE_NAPI_FUNCTION("createUint32MultiThread", CreateUint32MultiThread),
    DECLARE_NAPI_FUNCTION("createUint32MultiCtx", CreateUint32MultiCtx),
    DECLARE_NAPI_FUNCTION("createUint32Runtime", CreateUint32Runtime),
    DECLARE_NAPI_FUNCTION("createUint32Worker", CreateUint32Worker),
    DECLARE_NAPI_FUNCTION("createInt64Abnormal", CreateInt64Abnormal),
    DECLARE_NAPI_FUNCTION("createInt64Stable", CreateInt64Stable),
    DECLARE_NAPI_FUNCTION("createInt64MultiThread", CreateInt64MultiThread),
    DECLARE_NAPI_FUNCTION("createInt64MultiCtx", CreateInt64MultiCtx),
    DECLARE_NAPI_FUNCTION("createInt64Runtime", CreateInt64Runtime),
    DECLARE_NAPI_FUNCTION("createInt64Worker", CreateInt64Worker),
    DECLARE_NAPI_FUNCTION("createDoubleAbnormal", CreateDoubleAbnormal),
    DECLARE_NAPI_FUNCTION("createDoubleRetVal", CreateDoubleRetVal),
    DECLARE_NAPI_FUNCTION("createDoubleStable", CreateDoubleStable),
    DECLARE_NAPI_FUNCTION("createDoubleMultiThread", CreateDoubleMultiThread),
    DECLARE_NAPI_FUNCTION("createDoubleMultiCtx", CreateDoubleMultiCtx),
    DECLARE_NAPI_FUNCTION("createDoubleRuntime", CreateDoubleRuntime),
    DECLARE_NAPI_FUNCTION("createDoubleWorker", CreateDoubleWorker),
    DECLARE_NAPI_FUNCTION("getValueInt32Abnormal", GetValueInt32Abnormal),
    DECLARE_NAPI_FUNCTION("getValueInt32Stable", GetValueInt32Stable),
    DECLARE_NAPI_FUNCTION("getValueInt32MultiThread", GetValueInt32MultiThread),
    DECLARE_NAPI_FUNCTION("getValueInt32MultiCtx", GetValueInt32MultiCtx),
    DECLARE_NAPI_FUNCTION("getValueInt32Runtime", GetValueInt32Runtime),
    DECLARE_NAPI_FUNCTION("getValueInt32Worker", GetValueInt32Worker),
    DECLARE_NAPI_FUNCTION("getValueUint32Abnormal", GetValueUint32Abnormal),
    DECLARE_NAPI_FUNCTION("getValueUint32Stable", GetValueUint32Stable),
    DECLARE_NAPI_FUNCTION("getValueUint32MultiThread", GetValueUint32MultiThread),
    DECLARE_NAPI_FUNCTION("getValueUint32MultiCtx", GetValueUint32MultiCtx),
    DECLARE_NAPI_FUNCTION("getValueUint32Runtime", GetValueUint32Runtime),
    DECLARE_NAPI_FUNCTION("getValueUint32Worker", GetValueUint32Worker),
    DECLARE_NAPI_FUNCTION("getValueInt64Stable", GetValueInt64Stable),
    DECLARE_NAPI_FUNCTION("getValueInt64MultiThread", GetValueInt64MultiThread),
    DECLARE_NAPI_FUNCTION("getValueInt64MultiCtx", GetValueInt64MultiCtx),
    DECLARE_NAPI_FUNCTION("getValueInt64Runtime", GetValueInt64Runtime),
    DECLARE_NAPI_FUNCTION("getValueInt64Worker", GetValueInt64Worker),
    DECLARE_NAPI_FUNCTION("getValueDoubleAbnormal", GetValueDoubleAbnormal),
    DECLARE_NAPI_FUNCTION("getValueDoubleRetVal", GetValueDoubleRetVal),
    DECLARE_NAPI_FUNCTION("getValueDoubleStable", GetValueDoubleStable),
    DECLARE_NAPI_FUNCTION("getValueDoubleMultiThread", GetValueDoubleMultiThread),
    DECLARE_NAPI_FUNCTION("getValueDoubleMultiCtx", GetValueDoubleMultiCtx),
    DECLARE_NAPI_FUNCTION("getValueDoubleRuntime", GetValueDoubleRuntime),
    DECLARE_NAPI_FUNCTION("getValueDoubleWorker", GetValueDoubleWorker),
    DECLARE_NAPI_FUNCTION("getValueBoolAbnormal", GetValueBoolAbnormal),
    DECLARE_NAPI_FUNCTION("getValueBoolStable", GetValueBoolStable),
    DECLARE_NAPI_FUNCTION("getValueBoolMultiThread", GetValueBoolMultiThread),
    DECLARE_NAPI_FUNCTION("getValueBoolMultiCtx", GetValueBoolMultiCtx),
    DECLARE_NAPI_FUNCTION("getValueBoolRuntime", GetValueBoolRuntime),
    DECLARE_NAPI_FUNCTION("getValueBoolWorker", GetValueBoolWorker),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(initDescriptors) / sizeof(initDescriptors[0]), initDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napiCovBasicNum",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
