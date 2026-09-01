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

static void AsyncExecute(napi_env env, void* data)
{
    (void)env;
    (void)data;
}

static void AsyncComplete(napi_env env, napi_status status, void* data)
{
    (void)env;
    (void)status;
    (void)data;
}

static napi_value CreateAsyncWorkNormal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);

    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "testAsyncWork", NAPI_AUTO_LENGTH, &asyncName);

    napi_async_work work = nullptr;
    napi_status status = napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);

    int32_t ret = (status == napi_ok && work != nullptr) ? 1 : 0;
    if (work != nullptr) {
        napi_delete_async_work(env, work);
    }

    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

static napi_value CreateAsyncWorkAbnormal(napi_env env, napi_callback_info info)
{
    napi_status status = napi_create_async_work(env, nullptr, nullptr, AsyncExecute, AsyncComplete, nullptr, nullptr);
    return Ret(env, status != napi_ok ? 1 : 0);
}

static napi_value CreateAsyncWorkReturnVal(napi_env env, napi_callback_info info)
{
    napi_handle_scope scope = nullptr;
    napi_open_handle_scope(env, &scope);

    napi_value asyncName = nullptr;
    napi_create_string_utf8(env, "retValAsyncWork", NAPI_AUTO_LENGTH, &asyncName);

    napi_async_work work = nullptr;
    napi_status status = napi_create_async_work(env, nullptr, asyncName, AsyncExecute, AsyncComplete, nullptr, &work);

    int32_t ret = 0;
    if (status == napi_ok && work != nullptr) {
        napi_status queueStatus = napi_queue_async_work(env, work);
        ret = (queueStatus == napi_ok) ? 1 : 0;
    }

    napi_close_handle_scope(env, scope);
    return Ret(env, ret);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createAsyncWorkNormal", CreateAsyncWorkNormal),
        DECLARE_NAPI_FUNCTION("createAsyncWorkAbnormal", CreateAsyncWorkAbnormal),
        DECLARE_NAPI_FUNCTION("createAsyncWorkReturnVal", CreateAsyncWorkReturnVal),
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
    .nm_modname = "napiCovAsync",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
