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

static napi_value CreateStringUtf8Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateStringUtf8MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_string_utf8(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringUtf8MultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateStringUtf8Runtime(napi_env env, napi_callback_info info)
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
        napi_status status = napi_create_string_utf8(newEnv, "hello", NAPI_AUTO_LENGTH, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringUtf8Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_string_utf8(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringUtf16Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_string_utf16(env, nullptr, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateStringUtf16Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        const char16_t str[] = u"hello";
        napi_value result = nullptr;
        napi_status status = napi_create_string_utf16(env, str, NAPI_AUTO_LENGTH, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateStringUtf16MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_string_utf16(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringUtf16MultiCtx(napi_env env, napi_callback_info info)
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
    const char16_t str[] = u"hello";
    napi_value result = nullptr;
    napi_status status = napi_create_string_utf16(env, str, NAPI_AUTO_LENGTH, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateStringUtf16Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        const char16_t str[] = u"hello";
        napi_value napiRet = nullptr;
        napi_status status = napi_create_string_utf16(newEnv, str, NAPI_AUTO_LENGTH, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringUtf16Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_string_utf16(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringLatin1Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_string_latin1(env, nullptr, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value CreateStringLatin1RetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value result = nullptr;
    napi_status status = napi_create_string_latin1(env, "latin", NAPI_AUTO_LENGTH, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateStringLatin1Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value result = nullptr;
        napi_status status = napi_create_string_latin1(env, "latin", NAPI_AUTO_LENGTH, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateStringLatin1MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_string_latin1(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringLatin1MultiCtx(napi_env env, napi_callback_info info)
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
    napi_status status = napi_create_string_latin1(env, "latin", NAPI_AUTO_LENGTH, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateStringLatin1Runtime(napi_env env, napi_callback_info info)
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
        napi_status status = napi_create_string_latin1(newEnv, "latin", NAPI_AUTO_LENGTH, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateStringLatin1Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_string_latin1(savedEnv, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringUtf8Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_value_string_utf8(env, nullptr, nullptr, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetValueStringUtf8RetVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);
    napi_value str = nullptr;
    napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &str);
    char buf[32] = {0};
    size_t len = 0;
    napi_status status = napi_get_value_string_utf8(env, str, buf, 32, &len);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value GetValueStringUtf8Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value str = nullptr;
        napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &str);
        char buf[32] = {0};
        size_t len = 0;
        napi_status status = napi_get_value_string_utf8(env, str, buf, 32, &len);
        int32_t singleRet = (status == napi_ok && len == 5) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueStringUtf8MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_string_utf8(savedEnv, nullptr, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringUtf8MultiCtx(napi_env env, napi_callback_info info)
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
    napi_value str = nullptr;
    napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &str);
    char buf[32] = {0};
    size_t len = 0;
    napi_status status = napi_get_value_string_utf8(env, str, buf, 32, &len);
    int32_t ret = (status == napi_ok && len == 5) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueStringUtf8Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value str = nullptr;
        napi_create_string_utf8(newEnv, "hello", NAPI_AUTO_LENGTH, &str);
        char buf[32] = {0};
        size_t len = 0;
        napi_status status = napi_get_value_string_utf8(newEnv, str, buf, 32, &len);
        int32_t ret = (status == napi_ok && len == 5) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringUtf8Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_string_utf8(savedEnv, nullptr, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringUtf16Abnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_get_value_string_utf16(env, nullptr, nullptr, 0, nullptr);
    int32_t ret = status != napi_ok ? 1 : 0;
    return Ret(env, ret);
}

static napi_value GetValueStringUtf16Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value str = nullptr;
        napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &str);
        char16_t buf[32] = {0};
        size_t len = 0;
        napi_status status = napi_get_value_string_utf16(env, str, buf, 32, &len);
        int32_t singleRet = (status == napi_ok && len == 5) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueStringUtf16MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_string_utf16(savedEnv, nullptr, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringUtf16MultiCtx(napi_env env, napi_callback_info info)
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
    napi_value str = nullptr;
    napi_create_string_utf8(env, "hello", NAPI_AUTO_LENGTH, &str);
    char16_t buf[32] = {0};
    size_t len = 0;
    napi_status status = napi_get_value_string_utf16(env, str, buf, 32, &len);
    int32_t ret = (status == napi_ok && len == 5) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueStringUtf16Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value str = nullptr;
        napi_create_string_utf8(newEnv, "hello", NAPI_AUTO_LENGTH, &str);
        char16_t buf[32] = {0};
        size_t len = 0;
        napi_status status = napi_get_value_string_utf16(newEnv, str, buf, 32, &len);
        int32_t ret = (status == napi_ok && len == 5) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringUtf16Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_string_utf16(savedEnv, nullptr, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringLatin1Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        napi_value str = nullptr;
        napi_create_string_latin1(env, "latin", NAPI_AUTO_LENGTH, &str);
        char buf[32] = {0};
        size_t len = 0;
        napi_status status = napi_get_value_string_latin1(env, str, buf, 32, &len);
        int32_t singleRet = (status == napi_ok && len > 0) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value GetValueStringLatin1MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_string_latin1(savedEnv, nullptr, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringLatin1MultiCtx(napi_env env, napi_callback_info info)
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
    napi_value str = nullptr;
    napi_create_string_latin1(env, "latin", NAPI_AUTO_LENGTH, &str);
    char buf[32] = {0};
    size_t len = 0;
    napi_status status = napi_get_value_string_latin1(env, str, buf, 32, &len);
    int32_t ret = (status == napi_ok && len > 0) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value GetValueStringLatin1Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        napi_value str = nullptr;
        napi_create_string_latin1(newEnv, "latin", NAPI_AUTO_LENGTH, &str);
        char buf[32] = {0};
        size_t len = 0;
        napi_status status = napi_get_value_string_latin1(newEnv, str, buf, 32, &len);
        int32_t ret = (status == napi_ok && len > 0) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value GetValueStringLatin1Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_get_value_string_latin1(savedEnv, nullptr, nullptr, 0, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalStringUtf16Stable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        static const char16_t extStr[] = u"ext";
        napi_value result = nullptr;
        napi_status status = napi_create_external_string_utf16(env, extStr, 3, nullptr, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateExternalStringUtf16MultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_string_utf16(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalStringUtf16MultiCtx(napi_env env, napi_callback_info info)
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
    static const char16_t extStr[] = u"ext";
    napi_value result = nullptr;
    napi_status status = napi_create_external_string_utf16(env, extStr, 3, nullptr, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateExternalStringUtf16Runtime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static const char16_t extStr[] = u"ext";
        napi_value napiRet = nullptr;
        napi_status status = napi_create_external_string_utf16(newEnv, extStr, 3, nullptr, nullptr, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalStringUtf16Worker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_string_utf16(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalStringAsciiStable(napi_env env, napi_callback_info info)
{
    int32_t pass = 1;
    for (int32_t i = 0; i < STABLE_LOOP_COUNT; i++) {
        napi_handle_scope loopScope = nullptr;
        napi_open_handle_scope(env, &loopScope);
        static const char extStr[] = "ascii";
        napi_value result = nullptr;
        napi_status status = napi_create_external_string_ascii(env, extStr, 5, nullptr, nullptr, &result);
        int32_t singleRet = (status == napi_ok) ? 1 : 0;
        napi_close_handle_scope(env, loopScope);
        if (singleRet == 0) {
            pass = 0;
            break;
        }
    }
    return Ret(env, pass);
}

static napi_value CreateExternalStringAsciiMultiThread(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_string_ascii(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalStringAsciiMultiCtx(napi_env env, napi_callback_info info)
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
    static const char extStr[] = "ascii";
    napi_value result = nullptr;
    napi_status status = napi_create_external_string_ascii(env, extStr, 5, nullptr, nullptr, &result);
    int32_t ret = (status == napi_ok) ? 1 : 0;
    napi_switch_ark_context(env);
    napi_destroy_ark_context(env);
    return Ret(env, ret);
}

static napi_value CreateExternalStringAsciiRuntime(napi_env env, napi_callback_info info)
{
    std::atomic<int32_t> result(0);
    std::thread t([&result]() {
        napi_env newEnv = nullptr;
        napi_status rtStatus = napi_create_ark_runtime(&newEnv);
        if (rtStatus != napi_ok || newEnv == nullptr) {
            result.store(0);
            return;
        }
        static const char extStr[] = "ascii";
        napi_value napiRet = nullptr;
        napi_status status = napi_create_external_string_ascii(newEnv, extStr, 5, nullptr, nullptr, &napiRet);
        int32_t ret = (status == napi_ok) ? 1 : 0;
        result.store(ret);
        napi_destroy_ark_runtime(&newEnv);
    });
    t.join();
    return Ret(env, result.load());
}

static napi_value CreateExternalStringAsciiWorker(napi_env env, napi_callback_info info)
{
    napi_env savedEnv = env;
    std::atomic<int32_t> result(0);
    std::thread t([savedEnv, &result]() {
        napi_status status = napi_create_external_string_ascii(savedEnv, nullptr, 0, nullptr, nullptr, nullptr);
        result.store(status != napi_ok ? 1 : 0);
    });
    t.join();
    return Ret(env, result.load());
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createStringUtf8Stable", CreateStringUtf8Stable),
        DECLARE_NAPI_FUNCTION("createStringUtf8MultiThread", CreateStringUtf8MultiThread),
        DECLARE_NAPI_FUNCTION("createStringUtf8MultiCtx", CreateStringUtf8MultiCtx),
        DECLARE_NAPI_FUNCTION("createStringUtf8Runtime", CreateStringUtf8Runtime),
        DECLARE_NAPI_FUNCTION("createStringUtf8Worker", CreateStringUtf8Worker),
        DECLARE_NAPI_FUNCTION("createStringUtf16Abnormal", CreateStringUtf16Abnormal),
        DECLARE_NAPI_FUNCTION("createStringUtf16Stable", CreateStringUtf16Stable),
        DECLARE_NAPI_FUNCTION("createStringUtf16MultiThread", CreateStringUtf16MultiThread),
        DECLARE_NAPI_FUNCTION("createStringUtf16MultiCtx", CreateStringUtf16MultiCtx),
        DECLARE_NAPI_FUNCTION("createStringUtf16Runtime", CreateStringUtf16Runtime),
        DECLARE_NAPI_FUNCTION("createStringUtf16Worker", CreateStringUtf16Worker),
        DECLARE_NAPI_FUNCTION("createStringLatin1Abnormal", CreateStringLatin1Abnormal),
        DECLARE_NAPI_FUNCTION("createStringLatin1RetVal", CreateStringLatin1RetVal),
        DECLARE_NAPI_FUNCTION("createStringLatin1Stable", CreateStringLatin1Stable),
        DECLARE_NAPI_FUNCTION("createStringLatin1MultiThread", CreateStringLatin1MultiThread),
        DECLARE_NAPI_FUNCTION("createStringLatin1MultiCtx", CreateStringLatin1MultiCtx),
        DECLARE_NAPI_FUNCTION("createStringLatin1Runtime", CreateStringLatin1Runtime),
        DECLARE_NAPI_FUNCTION("createStringLatin1Worker", CreateStringLatin1Worker),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8Abnormal", GetValueStringUtf8Abnormal),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8RetVal", GetValueStringUtf8RetVal),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8Stable", GetValueStringUtf8Stable),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8MultiThread", GetValueStringUtf8MultiThread),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8MultiCtx", GetValueStringUtf8MultiCtx),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8Runtime", GetValueStringUtf8Runtime),
        DECLARE_NAPI_FUNCTION("getValueStringUtf8Worker", GetValueStringUtf8Worker),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16Abnormal", GetValueStringUtf16Abnormal),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16Stable", GetValueStringUtf16Stable),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16MultiThread", GetValueStringUtf16MultiThread),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16MultiCtx", GetValueStringUtf16MultiCtx),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16Runtime", GetValueStringUtf16Runtime),
        DECLARE_NAPI_FUNCTION("getValueStringUtf16Worker", GetValueStringUtf16Worker),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1Stable", GetValueStringLatin1Stable),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1MultiThread", GetValueStringLatin1MultiThread),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1MultiCtx", GetValueStringLatin1MultiCtx),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1Runtime", GetValueStringLatin1Runtime),
        DECLARE_NAPI_FUNCTION("getValueStringLatin1Worker", GetValueStringLatin1Worker),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16Stable", CreateExternalStringUtf16Stable),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16MultiThread", CreateExternalStringUtf16MultiThread),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16MultiCtx", CreateExternalStringUtf16MultiCtx),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16Runtime", CreateExternalStringUtf16Runtime),
        DECLARE_NAPI_FUNCTION("createExternalStringUtf16Worker", CreateExternalStringUtf16Worker),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiStable", CreateExternalStringAsciiStable),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiMultiThread", CreateExternalStringAsciiMultiThread),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiMultiCtx", CreateExternalStringAsciiMultiCtx),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiRuntime", CreateExternalStringAsciiRuntime),
        DECLARE_NAPI_FUNCTION("createExternalStringAsciiWorker", CreateExternalStringAsciiWorker),
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
    .nm_modname = "napiCovString",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}