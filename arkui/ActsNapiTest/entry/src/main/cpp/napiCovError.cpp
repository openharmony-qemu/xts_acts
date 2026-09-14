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

static const int32_t BUSINESS_ERROR_CODE = 100;
static const int32_t STABLE_LOOP_COUNT = 10;

static napi_value ThrowRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &msg);
    napi_value err = nullptr;
    napi_create_error(env, nullptr, msg, &err);
    napi_status status = napi_throw(env, err);
    int32_t ret = status == napi_ok ? 1 : 0;
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value ThrowStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value msg = nullptr;
        napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &msg);
        napi_value err = nullptr;
        napi_create_error(env, nullptr, msg, &err);
        napi_status status = napi_throw(env, err);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        bool pending = false;
        napi_is_exception_pending(env, &pending);
        if (pending) {
            napi_value ex = nullptr;
            napi_get_and_clear_last_exception(env, &ex);
        }
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ThrowMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &msg);
    napi_value err = nullptr;
    napi_create_error(env, nullptr, msg, &err);
    napi_status status = napi_throw(env, err);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value msg = nullptr;
        napi_create_string_utf8(newEnv, "test", NAPI_AUTO_LENGTH, &msg);
        napi_value err = nullptr;
        napi_create_error(newEnv, nullptr, msg, &err);
        napi_status status = napi_throw(newEnv, err);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_throw_error(env, "100", "test error");
    int32_t ret = status == napi_ok ? 1 : 0;
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_throw_error(env, "100", "test error");
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, pass);
}

static napi_value ThrowErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_throw_error(env, "100", "test error");
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_throw_error(newEnv, "100", "test error");
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowTypeErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_throw_type_error(env, "300", "type error");
    int32_t ret = status == napi_ok ? 1 : 0;
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowTypeErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_throw_type_error(env, "300", "type error");
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, pass);
}

static napi_value ThrowTypeErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_type_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowTypeErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_throw_type_error(env, "300", "type error");
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowTypeErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_throw_type_error(newEnv, "300", "type error");
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowTypeErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_type_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowRangeErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_throw_range_error(env, "400", "range error");
    int32_t ret = status == napi_ok ? 1 : 0;
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowRangeErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_throw_range_error(env, "400", "range error");
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, pass);
}

static napi_value ThrowRangeErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_range_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowRangeErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_throw_range_error(env, "400", "range error");
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowRangeErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_throw_range_error(newEnv, "400", "range error");
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowRangeErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_range_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "E", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "m", NAPI_AUTO_LENGTH, &msg);
    napi_value err = nullptr;
    napi_create_error(env, code, msg, &err);
    bool isErr = false;
    napi_status status = napi_is_error(env, err, &isErr);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value IsErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(env, "E", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(env, "m", NAPI_AUTO_LENGTH, &msg);
        napi_value err = nullptr;
        napi_create_error(env, code, msg, &err);
        bool isErr = false;
        napi_status status = napi_is_error(env, err, &isErr);
        int32_t singleRet = (status == napi_ok && isErr) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "E", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "m", NAPI_AUTO_LENGTH, &msg);
    napi_value err = nullptr;
    napi_create_error(env, code, msg, &err);
    bool isErr = false;
    napi_status status = napi_is_error(env, err, &isErr);
    int32_t ret = (status == napi_ok && isErr) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(newEnv, "E", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(newEnv, "m", NAPI_AUTO_LENGTH, &msg);
        napi_value err = nullptr;
        napi_create_error(newEnv, code, msg, &err);
        napi_value napiRet = nullptr;
        bool isErr = false;
        napi_status status = napi_is_error(newEnv, err, &isErr);
        int32_t ret = (status == napi_ok && isErr) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_error(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "E100", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &msg);
    napi_value result = nullptr;
    napi_status status = napi_create_error(env, code, msg, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(env, "E100", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &msg);
        napi_value result = nullptr;
        napi_status status = napi_create_error(env, code, msg, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_error(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "E100", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "test", NAPI_AUTO_LENGTH, &msg);
    napi_value result = nullptr;
    napi_status status = napi_create_error(env, code, msg, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(newEnv, "E100", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(newEnv, "test", NAPI_AUTO_LENGTH, &msg);
        napi_value napiRet = nullptr;
        napi_status status = napi_create_error(newEnv, code, msg, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_error(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateTypeErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "TE", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "type", NAPI_AUTO_LENGTH, &msg);
    napi_value result = nullptr;
    napi_status status = napi_create_type_error(env, code, msg, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateTypeErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(env, "TE", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(env, "type", NAPI_AUTO_LENGTH, &msg);
        napi_value result = nullptr;
        napi_status status = napi_create_type_error(env, code, msg, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateTypeErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_type_error(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateTypeErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "TE", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "type", NAPI_AUTO_LENGTH, &msg);
    napi_value result = nullptr;
    napi_status status = napi_create_type_error(env, code, msg, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateTypeErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(newEnv, "TE", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(newEnv, "type", NAPI_AUTO_LENGTH, &msg);
        napi_value napiRet = nullptr;
        napi_status status = napi_create_type_error(newEnv, code, msg, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateTypeErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_type_error(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateRangeErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "RE", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "range", NAPI_AUTO_LENGTH, &msg);
    napi_value result = nullptr;
    napi_status status = napi_create_range_error(env, code, msg, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateRangeErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(env, "RE", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(env, "range", NAPI_AUTO_LENGTH, &msg);
        napi_value result = nullptr;
        napi_status status = napi_create_range_error(env, code, msg, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateRangeErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_range_error(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateRangeErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value code = nullptr;
    napi_value msg = nullptr;
    napi_create_string_utf8(env, "RE", NAPI_AUTO_LENGTH, &code);
    napi_create_string_utf8(env, "range", NAPI_AUTO_LENGTH, &msg);
    napi_value result = nullptr;
    napi_status status = napi_create_range_error(env, code, msg, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateRangeErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value code = nullptr;
        napi_value msg = nullptr;
        napi_create_string_utf8(newEnv, "RE", NAPI_AUTO_LENGTH, &code);
        napi_create_string_utf8(newEnv, "range", NAPI_AUTO_LENGTH, &msg);
        napi_value napiRet = nullptr;
        napi_status status = napi_create_range_error(newEnv, code, msg, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateRangeErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_range_error(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetAndClearLastExceptionAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_and_clear_last_exception(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetAndClearLastExceptionRetVal(napi_env env, napi_callback_info info)
{
    napi_value err = nullptr;
    napi_value errMsg = nullptr;
    napi_create_string_utf8(env, "err", NAPI_AUTO_LENGTH, &errMsg);
    napi_create_error(env, nullptr, errMsg, &err);
    napi_throw(env, err);
    napi_status status = napi_get_and_clear_last_exception(env, &err);
    int32_t ret = status == napi_ok ? 1 : 0;
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value GetAndClearLastExceptionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value err = nullptr;
        napi_value errMsg = nullptr;
        napi_create_string_utf8(env, "err", NAPI_AUTO_LENGTH, &errMsg);
        napi_create_error(env, nullptr, errMsg, &err);
        napi_throw(env, err);
        napi_status status = napi_get_and_clear_last_exception(env, &err);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, pass);
}

static napi_value GetAndClearLastExceptionMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_and_clear_last_exception(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetAndClearLastExceptionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value err = nullptr;
    napi_value errMsg = nullptr;
    napi_create_string_utf8(env, "err", NAPI_AUTO_LENGTH, &errMsg);
    napi_create_error(env, nullptr, errMsg, &err);
    napi_throw(env, err);
    napi_status status = napi_get_and_clear_last_exception(env, &err);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value GetAndClearLastExceptionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value err = nullptr;
        napi_value errMsg = nullptr;
        napi_create_string_utf8(newEnv, "err", NAPI_AUTO_LENGTH, &errMsg);
        napi_create_error(newEnv, nullptr, errMsg, &err);
        napi_throw(newEnv, err);
        napi_status status = napi_get_and_clear_last_exception(newEnv, &err);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetAndClearLastExceptionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_and_clear_last_exception(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsExceptionPendingRetVal(napi_env env, napi_callback_info info)
{
    napi_value err = nullptr;
    napi_value errMsg = nullptr;
    napi_create_string_utf8(env, "err", NAPI_AUTO_LENGTH, &errMsg);
    napi_create_error(env, nullptr, errMsg, &err);
    napi_throw(env, err);
    bool pending = false;
    napi_status status = napi_is_exception_pending(env, &pending);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    { napi_value ex = nullptr;
    napi_get_and_clear_last_exception(env, &ex);
    };
    return Ret(env, ret);
}

static napi_value IsExceptionPendingStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_value err = nullptr;
        napi_value errMsg = nullptr;
        napi_create_string_utf8(env, "err", NAPI_AUTO_LENGTH, &errMsg);
        napi_create_error(env, nullptr, errMsg, &err);
        napi_throw(env, err);
        bool pending = false;
        napi_status status = napi_is_exception_pending(env, &pending);
        int32_t singleRet = (status == napi_ok && pending) ? 1 : 0;
        { napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
        };
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsExceptionPendingMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_exception_pending(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsExceptionPendingMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value err = nullptr;
    napi_value errMsg = nullptr;
    napi_create_string_utf8(env, "err", NAPI_AUTO_LENGTH, &errMsg);
    napi_create_error(env, nullptr, errMsg, &err);
    napi_throw(env, err);
    bool pending = false;
    napi_status status = napi_is_exception_pending(env, &pending);
    int32_t ret = (status == napi_ok && pending) ? 1 : 0;
    { napi_value ex = nullptr;
    napi_get_and_clear_last_exception(env, &ex);
    };
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsExceptionPendingRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value err = nullptr;
        napi_value errMsg = nullptr;
        napi_create_string_utf8(newEnv, "err", NAPI_AUTO_LENGTH, &errMsg);
        napi_create_error(newEnv, nullptr, errMsg, &err);
        napi_throw(newEnv, err);
        bool pending = false;
        napi_status status = napi_is_exception_pending(newEnv, &pending);
        int32_t ret = (status == napi_ok && pending) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsExceptionPendingWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_exception_pending(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value FatalErrorNormal(napi_env env, napi_callback_info info)
{
    int32_t ret = 1;
    return Ret(env, ret);
}

static napi_value FatalErrorRetVal(napi_env env, napi_callback_info info)
{
    int32_t ret = 1;
    return Ret(env, ret);
}

static napi_value FatalErrorStable(napi_env env, napi_callback_info info)
{
    return Ret(env, 1);
}

static napi_value FatalErrorMultiThread(napi_env env, napi_callback_info info)
{
    return Ret(env, 1);
}

static napi_value FatalErrorMultiCtx(napi_env env, napi_callback_info info)
{
    return Ret(env, 1);
}

static napi_value FatalErrorRuntime(napi_env env, napi_callback_info info)
{
    return Ret(env, 1);
}

static napi_value FatalErrorWorker(napi_env env, napi_callback_info info)
{
    return Ret(env, 1);
}

static napi_value GetLastErrorInfoRetVal(napi_env env, napi_callback_info info)
{
    const napi_extended_error_info* errInfo = nullptr;
    napi_status status = napi_get_last_error_info(env, &errInfo);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetLastErrorInfoStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        const napi_extended_error_info* errInfo = nullptr;
        napi_status status = napi_get_last_error_info(env, &errInfo);
        int32_t singleRet = (status == napi_ok && errInfo != nullptr) ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetLastErrorInfoMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_last_error_info(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetLastErrorInfoMultiCtx(napi_env env, napi_callback_info info)
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
    const napi_extended_error_info* errInfo = nullptr;
    napi_status status = napi_get_last_error_info(env, &errInfo);
    int32_t ret = (status == napi_ok && errInfo != nullptr) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetLastErrorInfoRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        const napi_extended_error_info* errInfo = nullptr;
        napi_status status = napi_get_last_error_info(newEnv, &errInfo);
        int32_t ret = (status == napi_ok && errInfo != nullptr) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetLastErrorInfoWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_last_error_info(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value FatalExceptionRetVal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_fatal_exception(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value FatalExceptionStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_fatal_exception(env, nullptr);
        int32_t singleRet = status != napi_ok ? 1 : 0;
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value FatalExceptionMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_fatal_exception(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value FatalExceptionMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_fatal_exception(env, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value FatalExceptionRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_fatal_exception(newEnv, nullptr);
        int32_t ret = status != napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value FatalExceptionWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_fatal_exception(savedEnv, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowBusinessErrorNormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_throw_business_error(env, BUSINESS_ERROR_CODE, "business error");
    int32_t ret = status == napi_ok ? 1 : 0;
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowBusinessErrorRetVal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_throw_business_error(env, BUSINESS_ERROR_CODE, "business error");
    int32_t ret = status == napi_ok ? 1 : 0;
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowBusinessErrorStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_status status = napi_throw_business_error(env, BUSINESS_ERROR_CODE, "business error");
        int32_t singleRet = status == napi_ok ? 1 : 0;
        { napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
        };
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value ThrowBusinessErrorMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_business_error(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowBusinessErrorMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_throw_business_error(env, BUSINESS_ERROR_CODE, "business error");
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value ex = nullptr;
        napi_get_and_clear_last_exception(env, &ex);
    }
    return Ret(env, ret);
}

static napi_value ThrowBusinessErrorRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_status status = napi_throw_business_error(newEnv, 100, "business error");
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value ThrowBusinessErrorWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_throw_business_error(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_property_descriptor initDescriptors[] = {
    DECLARE_NAPI_FUNCTION("throwRetVal", ThrowRetVal),
    DECLARE_NAPI_FUNCTION("throwStable", ThrowStable),
    DECLARE_NAPI_FUNCTION("throwMultiThread", ThrowMultiThread),
    DECLARE_NAPI_FUNCTION("throwMultiCtx", ThrowMultiCtx),
    DECLARE_NAPI_FUNCTION("throwRuntime", ThrowRuntime),
    DECLARE_NAPI_FUNCTION("throwWorker", ThrowWorker),
    DECLARE_NAPI_FUNCTION("throwErrorRetVal", ThrowErrorRetVal),
    DECLARE_NAPI_FUNCTION("throwErrorStable", ThrowErrorStable),
    DECLARE_NAPI_FUNCTION("throwErrorMultiThread", ThrowErrorMultiThread),
    DECLARE_NAPI_FUNCTION("throwErrorMultiCtx", ThrowErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("throwErrorRuntime", ThrowErrorRuntime),
    DECLARE_NAPI_FUNCTION("throwErrorWorker", ThrowErrorWorker),
    DECLARE_NAPI_FUNCTION("throwTypeErrorRetVal", ThrowTypeErrorRetVal),
    DECLARE_NAPI_FUNCTION("throwTypeErrorStable", ThrowTypeErrorStable),
    DECLARE_NAPI_FUNCTION("throwTypeErrorMultiThread", ThrowTypeErrorMultiThread),
    DECLARE_NAPI_FUNCTION("throwTypeErrorMultiCtx", ThrowTypeErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("throwTypeErrorRuntime", ThrowTypeErrorRuntime),
    DECLARE_NAPI_FUNCTION("throwTypeErrorWorker", ThrowTypeErrorWorker),
    DECLARE_NAPI_FUNCTION("throwRangeErrorRetVal", ThrowRangeErrorRetVal),
    DECLARE_NAPI_FUNCTION("throwRangeErrorStable", ThrowRangeErrorStable),
    DECLARE_NAPI_FUNCTION("throwRangeErrorMultiThread", ThrowRangeErrorMultiThread),
    DECLARE_NAPI_FUNCTION("throwRangeErrorMultiCtx", ThrowRangeErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("throwRangeErrorRuntime", ThrowRangeErrorRuntime),
    DECLARE_NAPI_FUNCTION("throwRangeErrorWorker", ThrowRangeErrorWorker),
    DECLARE_NAPI_FUNCTION("isErrorRetVal", IsErrorRetVal),
    DECLARE_NAPI_FUNCTION("isErrorStable", IsErrorStable),
    DECLARE_NAPI_FUNCTION("isErrorMultiThread", IsErrorMultiThread),
    DECLARE_NAPI_FUNCTION("isErrorMultiCtx", IsErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("isErrorRuntime", IsErrorRuntime),
    DECLARE_NAPI_FUNCTION("isErrorWorker", IsErrorWorker),
    DECLARE_NAPI_FUNCTION("createErrorRetVal", CreateErrorRetVal),
    DECLARE_NAPI_FUNCTION("createErrorStable", CreateErrorStable),
    DECLARE_NAPI_FUNCTION("createErrorMultiThread", CreateErrorMultiThread),
    DECLARE_NAPI_FUNCTION("createErrorMultiCtx", CreateErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("createErrorRuntime", CreateErrorRuntime),
    DECLARE_NAPI_FUNCTION("createErrorWorker", CreateErrorWorker),
    DECLARE_NAPI_FUNCTION("createTypeErrorRetVal", CreateTypeErrorRetVal),
    DECLARE_NAPI_FUNCTION("createTypeErrorStable", CreateTypeErrorStable),
    DECLARE_NAPI_FUNCTION("createTypeErrorMultiThread", CreateTypeErrorMultiThread),
    DECLARE_NAPI_FUNCTION("createTypeErrorMultiCtx", CreateTypeErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("createTypeErrorRuntime", CreateTypeErrorRuntime),
    DECLARE_NAPI_FUNCTION("createTypeErrorWorker", CreateTypeErrorWorker),
    DECLARE_NAPI_FUNCTION("createRangeErrorRetVal", CreateRangeErrorRetVal),
    DECLARE_NAPI_FUNCTION("createRangeErrorStable", CreateRangeErrorStable),
    DECLARE_NAPI_FUNCTION("createRangeErrorMultiThread", CreateRangeErrorMultiThread),
    DECLARE_NAPI_FUNCTION("createRangeErrorMultiCtx", CreateRangeErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("createRangeErrorRuntime", CreateRangeErrorRuntime),
    DECLARE_NAPI_FUNCTION("createRangeErrorWorker", CreateRangeErrorWorker),
    DECLARE_NAPI_FUNCTION("getAndClearLastExceptionAbnormal", GetAndClearLastExceptionAbnormal),
    DECLARE_NAPI_FUNCTION("getAndClearLastExceptionRetVal", GetAndClearLastExceptionRetVal),
    DECLARE_NAPI_FUNCTION("getAndClearLastExceptionStable", GetAndClearLastExceptionStable),
    DECLARE_NAPI_FUNCTION("getAndClearLastExceptionMultiThread", GetAndClearLastExceptionMultiThread),
    DECLARE_NAPI_FUNCTION("getAndClearLastExceptionMultiCtx", GetAndClearLastExceptionMultiCtx),
    DECLARE_NAPI_FUNCTION("getAndClearLastExceptionRuntime", GetAndClearLastExceptionRuntime),
    DECLARE_NAPI_FUNCTION("getAndClearLastExceptionWorker", GetAndClearLastExceptionWorker),
    DECLARE_NAPI_FUNCTION("isExceptionPendingRetVal", IsExceptionPendingRetVal),
    DECLARE_NAPI_FUNCTION("isExceptionPendingStable", IsExceptionPendingStable),
    DECLARE_NAPI_FUNCTION("isExceptionPendingMultiThread", IsExceptionPendingMultiThread),
    DECLARE_NAPI_FUNCTION("isExceptionPendingMultiCtx", IsExceptionPendingMultiCtx),
    DECLARE_NAPI_FUNCTION("isExceptionPendingRuntime", IsExceptionPendingRuntime),
    DECLARE_NAPI_FUNCTION("isExceptionPendingWorker", IsExceptionPendingWorker),
    DECLARE_NAPI_FUNCTION("fatalErrorNormal", FatalErrorNormal),
    DECLARE_NAPI_FUNCTION("fatalErrorRetVal", FatalErrorRetVal),
    DECLARE_NAPI_FUNCTION("fatalErrorStable", FatalErrorStable),
    DECLARE_NAPI_FUNCTION("fatalErrorMultiThread", FatalErrorMultiThread),
    DECLARE_NAPI_FUNCTION("fatalErrorMultiCtx", FatalErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("fatalErrorRuntime", FatalErrorRuntime),
    DECLARE_NAPI_FUNCTION("fatalErrorWorker", FatalErrorWorker),
    DECLARE_NAPI_FUNCTION("getLastErrorInfoRetVal", GetLastErrorInfoRetVal),
    DECLARE_NAPI_FUNCTION("getLastErrorInfoStable", GetLastErrorInfoStable),
    DECLARE_NAPI_FUNCTION("getLastErrorInfoMultiThread", GetLastErrorInfoMultiThread),
    DECLARE_NAPI_FUNCTION("getLastErrorInfoMultiCtx", GetLastErrorInfoMultiCtx),
    DECLARE_NAPI_FUNCTION("getLastErrorInfoRuntime", GetLastErrorInfoRuntime),
    DECLARE_NAPI_FUNCTION("getLastErrorInfoWorker", GetLastErrorInfoWorker),
    DECLARE_NAPI_FUNCTION("fatalExceptionRetVal", FatalExceptionRetVal),
    DECLARE_NAPI_FUNCTION("fatalExceptionStable", FatalExceptionStable),
    DECLARE_NAPI_FUNCTION("fatalExceptionMultiThread", FatalExceptionMultiThread),
    DECLARE_NAPI_FUNCTION("fatalExceptionMultiCtx", FatalExceptionMultiCtx),
    DECLARE_NAPI_FUNCTION("fatalExceptionRuntime", FatalExceptionRuntime),
    DECLARE_NAPI_FUNCTION("fatalExceptionWorker", FatalExceptionWorker),
    DECLARE_NAPI_FUNCTION("throwBusinessErrorNormal", ThrowBusinessErrorNormal),
    DECLARE_NAPI_FUNCTION("throwBusinessErrorRetVal", ThrowBusinessErrorRetVal),
    DECLARE_NAPI_FUNCTION("throwBusinessErrorStable", ThrowBusinessErrorStable),
    DECLARE_NAPI_FUNCTION("throwBusinessErrorMultiThread", ThrowBusinessErrorMultiThread),
    DECLARE_NAPI_FUNCTION("throwBusinessErrorMultiCtx", ThrowBusinessErrorMultiCtx),
    DECLARE_NAPI_FUNCTION("throwBusinessErrorRuntime", ThrowBusinessErrorRuntime),
    DECLARE_NAPI_FUNCTION("throwBusinessErrorWorker", ThrowBusinessErrorWorker),
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
    .nm_modname = "napiCovError",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
