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
static const double DATE_TEST_VALUE = 1234567890.0;
static const int64_t BIGINT_INT64_TEST_VALUE = 123456789012LL;
static const uint64_t BIGINT_UINT64_TEST_VALUE = 123456789012ULL;

static napi_value CreateDateStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_date(env, DATE_TEST_VALUE, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateDateMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_date(savedEnv, 0.0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDateMultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_date(env, DATE_TEST_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateDateRuntime(napi_env env, napi_callback_info info)
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
        napi_status status = napi_create_date(newEnv, DATE_TEST_VALUE, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateDateWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_date(savedEnv, 0.0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetDateValueStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value date = nullptr;
        napi_create_date(env, DATE_TEST_VALUE, &date);
        double val = 0.0;
        napi_status status = napi_get_date_value(env, date, &val);
        int32_t singleRet = (status == napi_ok && val == DATE_TEST_VALUE) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetDateValueMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_date_value(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetDateValueMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value date = nullptr;
    napi_create_date(env, DATE_TEST_VALUE, &date);
    double val = 0.0;
    napi_status status = napi_get_date_value(env, date, &val);
    int32_t ret = (status == napi_ok && val == DATE_TEST_VALUE) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetDateValueRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value date = nullptr;
        napi_create_date(newEnv, DATE_TEST_VALUE, &date);
        double val = 0.0;
        napi_status status = napi_get_date_value(newEnv, date, &val);
        int32_t ret = (status == napi_ok && val == DATE_TEST_VALUE) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetDateValueWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_date_value(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDateStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value date = nullptr;
        napi_create_date(env, DATE_TEST_VALUE, &date);
        bool isDate = false;
        napi_status status = napi_is_date(env, date, &isDate);
        int32_t singleRet = (status == napi_ok && isDate) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value IsDateMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_date(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value IsDateMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value date = nullptr;
    napi_create_date(env, DATE_TEST_VALUE, &date);
    bool isDate = false;
    napi_status status = napi_is_date(env, date, &isDate);
    int32_t ret = (status == napi_ok && isDate) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value IsDateWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_is_date(savedEnv, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintInt64RetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_int64(env, BIGINT_INT64_TEST_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateBigintInt64Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_bigint_int64(env, BIGINT_INT64_TEST_VALUE, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateBigintInt64MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_bigint_int64(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintInt64MultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_bigint_int64(env, BIGINT_INT64_TEST_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateBigintInt64Runtime(napi_env env, napi_callback_info info)
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
        napi_status status = napi_create_bigint_int64(newEnv, BIGINT_INT64_TEST_VALUE, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintInt64Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_bigint_int64(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintUint64Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_bigint_uint64(env, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateBigintUint64Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_bigint_uint64(env, BIGINT_UINT64_TEST_VALUE, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateBigintUint64MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_bigint_uint64(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintUint64MultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_bigint_uint64(env, BIGINT_UINT64_TEST_VALUE, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateBigintUint64Runtime(napi_env env, napi_callback_info info)
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
        napi_status status = napi_create_bigint_uint64(newEnv, BIGINT_UINT64_TEST_VALUE, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintUint64Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_bigint_uint64(savedEnv, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintWordsAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_bigint_words(env, 0, 0, nullptr, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateBigintWordsMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_bigint_words(savedEnv, 0, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintWordsMultiCtx(napi_env env, napi_callback_info info)
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
    int sign = 0;
    const uint64_t words[] = {12345ULL};
    napi_value result = nullptr;
    napi_status status = napi_create_bigint_words(env, sign, 1, words, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateBigintWordsRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        int sign = 0;
        const uint64_t words[] = {12345ULL};
        napi_value napiRet = nullptr;
        napi_status status = napi_create_bigint_words(newEnv, sign, 1, words, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateBigintWordsWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_bigint_words(savedEnv, 0, 0, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintInt64RetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value bigint = nullptr;
    napi_create_bigint_int64(env, 42LL, &bigint);
    int64_t val = 0;
    bool lossless = true;
    napi_status status = napi_get_value_bigint_int64(env, bigint, &val, &lossless);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetValueBigintInt64Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value bigint = nullptr;
        napi_create_bigint_int64(env, 42LL, &bigint);
        int64_t val = 0;
        bool lossless = true;
        napi_status status = napi_get_value_bigint_int64(env, bigint, &val, &lossless);
        int32_t singleRet = (status == napi_ok && val == 42LL) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueBigintInt64MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bigint_int64(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintInt64MultiCtx(napi_env env, napi_callback_info info)
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
    napi_value bigint = nullptr;
    napi_create_bigint_int64(env, 42LL, &bigint);
    int64_t val = 0;
    bool lossless = true;
    napi_status status = napi_get_value_bigint_int64(env, bigint, &val, &lossless);
    int32_t ret = (status == napi_ok && val == 42LL) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueBigintInt64Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value bigint = nullptr;
        napi_create_bigint_int64(newEnv, 42LL, &bigint);
        int64_t val = 0;
        bool lossless = true;
        napi_status status = napi_get_value_bigint_int64(newEnv, bigint, &val, &lossless);
        int32_t ret = (status == napi_ok && val == 42LL) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintInt64Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bigint_int64(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintUint64Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value bigint = nullptr;
        napi_create_bigint_uint64(env, 42ULL, &bigint);
        uint64_t val = 0;
        bool lossless = true;
        napi_status status = napi_get_value_bigint_uint64(env, bigint, &val, &lossless);
        int32_t singleRet = (status == napi_ok && val == 42ULL) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueBigintUint64MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bigint_uint64(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintUint64MultiCtx(napi_env env, napi_callback_info info)
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
    napi_value bigint = nullptr;
    napi_create_bigint_uint64(env, 42ULL, &bigint);
    uint64_t val = 0;
    bool lossless = true;
    napi_status status = napi_get_value_bigint_uint64(env, bigint, &val, &lossless);
    int32_t ret = (status == napi_ok && val == 42ULL) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueBigintUint64Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value bigint = nullptr;
        napi_create_bigint_uint64(newEnv, 42ULL, &bigint);
        uint64_t val = 0;
        bool lossless = true;
        napi_status status = napi_get_value_bigint_uint64(newEnv, bigint, &val, &lossless);
        int32_t ret = (status == napi_ok && val == 42ULL) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintUint64Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bigint_uint64(savedEnv, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintWordsStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value bigint = nullptr;
        napi_create_bigint_int64(env, 42LL, &bigint);
        int sign = 0;
        size_t wordCount = 0;
        napi_status status = napi_get_value_bigint_words(env, bigint, &sign, &wordCount, nullptr);
        int32_t singleRet = status == napi_ok ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueBigintWordsMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bigint_words(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintWordsMultiCtx(napi_env env, napi_callback_info info)
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
    napi_value bigint = nullptr;
    napi_create_bigint_int64(env, 42LL, &bigint);
    int sign = 0;
    size_t wordCount = 0;
    napi_status status = napi_get_value_bigint_words(env, bigint, &sign, &wordCount, nullptr);
    int32_t ret = status == napi_ok ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueBigintWordsRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value bigint = nullptr;
        napi_create_bigint_int64(newEnv, 42LL, &bigint);
        int sign = 0;
        size_t wordCount = 0;
        napi_status status = napi_get_value_bigint_words(newEnv, bigint, &sign, &wordCount, nullptr);
        int32_t ret = status == napi_ok ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueBigintWordsWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_bigint_words(savedEnv, nullptr, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createDateStable", CreateDateStable),
        DECLARE_NAPI_FUNCTION("createDateMultiThread", CreateDateMultiThread),
        DECLARE_NAPI_FUNCTION("createDateMultiCtx", CreateDateMultiCtx),
        DECLARE_NAPI_FUNCTION("createDateRuntime", CreateDateRuntime),
        DECLARE_NAPI_FUNCTION("createDateWorker", CreateDateWorker),
        DECLARE_NAPI_FUNCTION("getDateValueStable", GetDateValueStable),
        DECLARE_NAPI_FUNCTION("getDateValueMultiThread", GetDateValueMultiThread),
        DECLARE_NAPI_FUNCTION("getDateValueMultiCtx", GetDateValueMultiCtx),
        DECLARE_NAPI_FUNCTION("getDateValueRuntime", GetDateValueRuntime),
        DECLARE_NAPI_FUNCTION("getDateValueWorker", GetDateValueWorker),
        DECLARE_NAPI_FUNCTION("isDateStable", IsDateStable),
        DECLARE_NAPI_FUNCTION("isDateMultiThread", IsDateMultiThread),
        DECLARE_NAPI_FUNCTION("isDateMultiCtx", IsDateMultiCtx),
        DECLARE_NAPI_FUNCTION("isDateWorker", IsDateWorker),
        DECLARE_NAPI_FUNCTION("createBigintInt64RetVal", CreateBigintInt64RetVal),
        DECLARE_NAPI_FUNCTION("createBigintInt64Stable", CreateBigintInt64Stable),
        DECLARE_NAPI_FUNCTION("createBigintInt64MultiThread", CreateBigintInt64MultiThread),
        DECLARE_NAPI_FUNCTION("createBigintInt64MultiCtx", CreateBigintInt64MultiCtx),
        DECLARE_NAPI_FUNCTION("createBigintInt64Runtime", CreateBigintInt64Runtime),
        DECLARE_NAPI_FUNCTION("createBigintInt64Worker", CreateBigintInt64Worker),
        DECLARE_NAPI_FUNCTION("createBigintUint64Abnormal", CreateBigintUint64Abnormal),
        DECLARE_NAPI_FUNCTION("createBigintUint64Stable", CreateBigintUint64Stable),
        DECLARE_NAPI_FUNCTION("createBigintUint64MultiThread", CreateBigintUint64MultiThread),
        DECLARE_NAPI_FUNCTION("createBigintUint64MultiCtx", CreateBigintUint64MultiCtx),
        DECLARE_NAPI_FUNCTION("createBigintUint64Runtime", CreateBigintUint64Runtime),
        DECLARE_NAPI_FUNCTION("createBigintUint64Worker", CreateBigintUint64Worker),
        DECLARE_NAPI_FUNCTION("createBigintWordsAbnormal", CreateBigintWordsAbnormal),
        DECLARE_NAPI_FUNCTION("createBigintWordsMultiThread", CreateBigintWordsMultiThread),
        DECLARE_NAPI_FUNCTION("createBigintWordsMultiCtx", CreateBigintWordsMultiCtx),
        DECLARE_NAPI_FUNCTION("createBigintWordsRuntime", CreateBigintWordsRuntime),
        DECLARE_NAPI_FUNCTION("createBigintWordsWorker", CreateBigintWordsWorker),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64RetVal", GetValueBigintInt64RetVal),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64Stable", GetValueBigintInt64Stable),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64MultiThread", GetValueBigintInt64MultiThread),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64MultiCtx", GetValueBigintInt64MultiCtx),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64Runtime", GetValueBigintInt64Runtime),
        DECLARE_NAPI_FUNCTION("getValueBigintInt64Worker", GetValueBigintInt64Worker),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64Stable", GetValueBigintUint64Stable),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64MultiThread", GetValueBigintUint64MultiThread),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64MultiCtx", GetValueBigintUint64MultiCtx),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64Runtime", GetValueBigintUint64Runtime),
        DECLARE_NAPI_FUNCTION("getValueBigintUint64Worker", GetValueBigintUint64Worker),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsStable", GetValueBigintWordsStable),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsMultiThread", GetValueBigintWordsMultiThread),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsMultiCtx", GetValueBigintWordsMultiCtx),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsRuntime", GetValueBigintWordsRuntime),
        DECLARE_NAPI_FUNCTION("getValueBigintWordsWorker", GetValueBigintWordsWorker),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napiCovDateBigInt",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}