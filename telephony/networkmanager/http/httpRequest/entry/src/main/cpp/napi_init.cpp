/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "global_http_interceptor.h"
#include "napi/native_api.h"
#include "network/netstack/http_interceptor.h"

const int GLOBAL_NETSTACK = 0xFF00;
const char* TAG = "[netstack]";

// Constant definitions
const size_t PARAM_COUNT_TWO = 2;
const size_t PARAM_COUNT_ONE = 1;

static bool GetInt32Param(napi_env env, napi_callback_info info,
                          size_t expectedArgc, int32_t* params)
{
    size_t argc = expectedArgc;
    napi_value args[PARAM_COUNT_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < expectedArgc) {
        return false;
    }
    for (size_t i = 0; i < expectedArgc; i++) {
        napi_get_value_int32(env, args[i], &params[i]);
    }
    return true;
}

static napi_value CreateInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value NAPI_Global_AddNullPtrReadOnlyRequestInterceptor(
    napi_env env, napi_callback_info info)
{
    auto param = OH_Http_AddReadOnlyInterceptor(nullptr);
    return CreateInt32Result(env, param);
}

static napi_value NAPI_Global_AddNullPtrWritableResponseInterceptor(
    napi_env env, napi_callback_info info)
{
    auto param = OH_Http_AddWritableInterceptor(nullptr);
    return CreateInt32Result(env, param);
}

static napi_value NAPI_Global_AddReadOnlyRequestInterceptor(
    napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddReadOnlyRequestInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_AddReadOnlyResponseInterceptor(
    napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddReadOnlyResponseInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_AddWritableRequestInterceptor(
    napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddWritableRequestInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_AddWritableResponseInterceptor(
    napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddWritableResponseInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveRequestInterceptor(
    napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = RemoveRequestInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveResponseInterceptor(
    napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = RemoveResponseInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_StopAllInterceptor(napi_env env,
                                                 napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = StopAllInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveAllInterceptor(napi_env env,
                                                   napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = RemoveAllInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveNullptrInterceptor(
    napi_env env, napi_callback_info info)
{
    auto param = OH_Http_RemoveInterceptor(nullptr);
    return CreateInt32Result(env, param);
}

static napi_value NAPI_Global_StartAllInterceptor(napi_env env,
                                                  napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = {0};
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = StartAllInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value CreateStringResult(napi_env env, const char* value)
{
    napi_value result;
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value NAPI_GetRequestUrl(napi_env env, napi_callback_info info)
{
    auto param = GetRequestUrl();
    return CreateStringResult(env, param);
}

static napi_value NAPI_GetRequestBody(napi_env env, napi_callback_info info)
{
    auto param = GetRequestBody();
    return CreateStringResult(env, param);
}

static napi_value NAPI_GetResponseBody(napi_env env, napi_callback_info info)
{
    auto param = GetResponseBody();
    return CreateStringResult(env, param);
}

static napi_value NAPI_GetRequestMethod(napi_env env, napi_callback_info info)
{
    auto param = GetRequestMethod();
    return CreateStringResult(env, param);
}

static napi_value NAPI_GetRequestHeader(napi_env env, napi_callback_info info)
{
    auto param = GetRequestHeader();
    return CreateStringResult(env, param);
}

static napi_value NAPI_GetResponseHeader(napi_env env,
                                         napi_callback_info info)
{
    auto param = GetResponseHeader();
    return CreateStringResult(env, param);
}

static napi_value NAPI_GetResponseCode(napi_env env, napi_callback_info info)
{
    auto param = GetResponseCode();
    return CreateInt32Result(env, param);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"AddNullPtrReadOnlyRequestInterceptor", nullptr,
         NAPI_Global_AddNullPtrReadOnlyRequestInterceptor, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AddNullPtrWritableResponseInterceptor", nullptr,
         NAPI_Global_AddNullPtrWritableResponseInterceptor, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AddReadOnlyRequestInterceptor", nullptr,
         NAPI_Global_AddReadOnlyRequestInterceptor, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AddReadOnlyResponseInterceptor", nullptr,
         NAPI_Global_AddReadOnlyResponseInterceptor, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AddWritableRequestInterceptor", nullptr,
         NAPI_Global_AddWritableRequestInterceptor, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AddWritableResponseInterceptor", nullptr,
         NAPI_Global_AddWritableResponseInterceptor, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RemoveRequestInterceptor", nullptr,
         NAPI_Global_RemoveRequestInterceptor, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RemoveResponseInterceptor", nullptr,
         NAPI_Global_RemoveResponseInterceptor, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"StopAllInterceptor", nullptr, NAPI_Global_StopAllInterceptor, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"RemoveAllInterceptor", nullptr, NAPI_Global_RemoveAllInterceptor,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveNullptrInterceptor", nullptr,
         NAPI_Global_RemoveNullptrInterceptor, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"StartAllInterceptor", nullptr, NAPI_Global_StartAllInterceptor, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"GetRequestUrl", nullptr, NAPI_GetRequestUrl, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetRequestBody", nullptr, NAPI_GetRequestBody, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetResponseBody", nullptr, NAPI_GetResponseBody, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetRequestMethod", nullptr, NAPI_GetRequestMethod, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetRequestHeader", nullptr, NAPI_GetRequestHeader, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetResponseHeader", nullptr, NAPI_GetResponseHeader, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetResponseCode", nullptr, NAPI_GetResponseCode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}