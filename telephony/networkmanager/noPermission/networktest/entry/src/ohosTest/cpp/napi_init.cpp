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

#include "callback.h"
#include "global_http_interceptor.h"
#include "http_request.h"
#include "napi/native_api.h"
#include "network/netstack/http_interceptor.h"
#include "trafficfilter_napi_utils.h"
#include "network/netmanager_ext/net_trafficfilter.h"
#include <initializer_list>
#include "napi_utils.h"
#include <hilog/log.h>

const int GLOBAL_NETSTACK = 0xFF00;
const char *TAG = "[netstack]";
const int STR_BUFFER_SIZE = 1024;

// Constant definitions
const size_t PARAM_COUNT_TWO = 2;
const size_t PARAM_COUNT_ONE = 1;

static constexpr const char *FUNCTION_CREATE_REDIRECTOR = "CreateRedirector";
static constexpr const char *FUNCTION_CREATE_REDIRECTOR_IS_NULL = "CreateRedirectorIsNull";
static constexpr const char *FUNCTION_DESTROY_REDIRECTOR = "DestroyRedirector";
static constexpr const char *FUNCTION_ADD_REDIRECT_RULE = "AddRedirectRule";
static constexpr const char *FUNCTION_CLEAR_REDIRECT_RULE = "ClearRedirectRule";
static constexpr const char *FUNCTION_QUERY_PROCESS = "QueryProcess";

static constexpr const char *ENUM_IP_MATCH_TYPE = "IPMatchType";
static constexpr const char *ENUM_IP_FAMILY = "IPFamily";
static constexpr const char *ENUM_PORT_MATCH_TYPE = "PortMatchType";
static constexpr const char *ENUM_HOOK_POINT = "HookPoint";
static constexpr const char *ENUM_ERR_CODE = "ErrCode";

static bool GetInt32Param(napi_env env, napi_callback_info info, size_t expectedArgc, int32_t *params)
{
    size_t argc = expectedArgc;
    napi_value args[PARAM_COUNT_TWO] = { nullptr };
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

static napi_value NAPI_Global_AddNullPtrReadOnlyRequestInterceptor(napi_env env, napi_callback_info info)
{
    auto param = OH_Http_AddReadOnlyInterceptor(nullptr);
    return CreateInt32Result(env, param);
}

static napi_value NAPI_Global_AddNullPtrWritableResponseInterceptor(napi_env env, napi_callback_info info)
{
    auto param = OH_Http_AddWritableInterceptor(nullptr);
    return CreateInt32Result(env, param);
}

static napi_value NAPI_Global_AddReadOnlyRequestInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddReadOnlyRequestInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_AddReadOnlyResponseInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddReadOnlyResponseInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_AddWritableRequestInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddWritableRequestInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_AddWritableResponseInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_TWO] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_TWO, params)) {
        int32_t param = AddWritableResponseInterceptor(params[0], params[1]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveRequestInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = RemoveRequestInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveResponseInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = RemoveResponseInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_StopAllInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = StopAllInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveAllInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = RemoveAllInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value NAPI_Global_RemoveNullptrInterceptor(napi_env env, napi_callback_info info)
{
    auto param = OH_Http_RemoveInterceptor(nullptr);
    return CreateInt32Result(env, param);
}

static napi_value NAPI_Global_StartAllInterceptor(napi_env env, napi_callback_info info)
{
    int32_t params[PARAM_COUNT_ONE] = { 0 };
    if (GetInt32Param(env, info, PARAM_COUNT_ONE, params)) {
        int32_t param = StartAllInterceptor(params[0]);
        return CreateInt32Result(env, param);
    }
    return CreateInt32Result(env, 0);
}

static napi_value CreateStringResult(napi_env env, const char *value)
{
    napi_value result;
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value NAPI_TestCHttpRequest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char url[STR_BUFFER_SIZE] = { 0 };
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], url, STR_BUFFER_SIZE, &sizeT1);
    int32_t param = 0;
    param = SendHttpGetRequest(url);
    napi_value result;
    napi_create_int32(env, param, &result);
    return result;
}

static napi_value NAPI_UnregisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 2. 检查字符串
    char callbackId[STR_BUFFER_SIZE] = { 0 };
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], callbackId, STR_BUFFER_SIZE, &sizeT1);
    if (sizeT1 <= 0) {
        return nullptr;
    }
    std::string str = callbackId;
    UnregisterThreadSafeCallback(str);
    return nullptr;
}

static napi_value NAPI_RegisterInterceptorCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char callbackId[STR_BUFFER_SIZE] = { 0 };
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], callbackId, STR_BUFFER_SIZE, &sizeT1);
    if (sizeT1 <= 0) {
        return nullptr;
    }
    // 检查参数类型是否为函数
    napi_valuetype value_type;
    napi_typeof(env, args[1], &value_type);
    if (value_type != napi_function) {
        napi_throw_error(env, "EINVAL", "参数必须是函数类型");
        return nullptr;
    }

    // 注册线程安全回调函数
    RegisterThreadSafeCallback(callbackId, env, args[1]);

    return nullptr;
}


napi_value CreateRedirector(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "CreateRedirector napi start");
    size_t argc = 2;
    napi_value argv[2] = {0};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t groupId;
    napi_get_value_uint32(env, argv[0], &groupId);

    uint32_t priority;
    napi_get_value_uint32(env, argv[1], &priority);

    OH_TrafficFilter_Redirector *redirector = nullptr;
    int32_t ret = OH_TrafficFilter_CreateRedirector(groupId, priority, &redirector);

    // 1. 创建最终返回的结果对象（对应 CreateRedirectInfo 接口）
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // 2. 设置 ret 字段（number 类型）
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    napi_set_named_property(env, resultObj, "ret", retValue);

    // 3. 设置 redirector 字段：成功返回指针数字，失败返回 null
    napi_value redirectorValue;
    if (ret == OH_TRAFFICFILTER_OK && redirector != nullptr) {
        // 成功：将指针转为 int64 数字
        int64_t ptr = reinterpret_cast<int64_t>(redirector);
        napi_create_int64(env, ptr, &redirectorValue);
    } else {
        // 失败：创建 JS null
        napi_get_null(env, &redirectorValue);
    }
    napi_set_named_property(env, resultObj, "redirector", redirectorValue);

    // 返回统一格式的对象
    return resultObj;
}

napi_value CreateRedirectorIsNull(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {0};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t groupId;
    napi_get_value_uint32(env, argv[0], &groupId);

    uint32_t priority;
    napi_get_value_uint32(env, argv[1], &priority);

    OH_TrafficFilter_Redirector *redirector = nullptr;
    int32_t ret = OH_TrafficFilter_CreateRedirector(groupId, priority, nullptr);

    // 1. 创建最终返回的结果对象（对应 CreateRedirectInfo 接口）
    napi_value resultObj;
    napi_create_object(env, &resultObj);

    // 2. 设置 ret 字段（number 类型）
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    napi_set_named_property(env, resultObj, "ret", retValue);

    // 3. 设置 redirector 字段：成功返回指针数字，失败返回 null
    napi_value redirectorValue;
    napi_get_null(env, &redirectorValue);
    napi_set_named_property(env, resultObj, "redirector", redirectorValue);

    // 返回统一格式的对象
    return resultObj;
}

napi_value DestroyRedirector(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {0};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    // 1. 判断参数是否为 null / undefined
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    if (valueType == napi_null || valueType == napi_undefined) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        return result;
    }

    // 2. 从 JS number 中取出 int64 值，再转回指针
    int64_t redirectorHandle = 0;
    napi_get_value_int64(env, argv[0], &redirectorHandle);

    OH_TrafficFilter_Redirector *redirector =
        reinterpret_cast<OH_TrafficFilter_Redirector *>(redirectorHandle);

    // 3. 调用底层接口
    int32_t ret = OH_TrafficFilter_DestroyRedirector(redirector);

    // 4. 返回 number 类型的结果码
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value AddRedirectRule(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {0};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    // ---- 参数1: redirector: number | null ----
    // 检查是否为 null / undefined
    napi_valuetype type0;
    napi_typeof(env, argv[0], &type0);
    if (type0 == napi_null || type0 == napi_undefined) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        return result;
    }

    // 直接读取 number，强转为指针（handle 模式）
    int64_t redirectorHandle = 0;
    napi_get_value_int64(env, argv[0], &redirectorHandle);
    OH_TrafficFilter_Redirector *redirector =
        reinterpret_cast<OH_TrafficFilter_Redirector *>(redirectorHandle);

    if (redirector == nullptr) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        return result;
    }

    // ---- 参数2: rule: RuleConfig | null ----
    napi_valuetype type1;
    napi_typeof(env, argv[1], &type1);
    if (type1 == napi_null || type1 == napi_undefined) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        return result;
    }

    OH_TrafficFilter_RedirectRule rule = {0};
    if (!TrafficFilterNapiUtils::ParseRedirectRule(env, argv[1], rule)) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        return result;
    }

    // ---- 调用底层接口 ----
    int32_t ret = OH_TrafficFilter_AddRedirectRule(redirector, &rule);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value ClearRedirectRule(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {0};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    // 判断参数是否为 null / undefined
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    if (valueType == napi_null || valueType == napi_undefined) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        return result;
    }

    // 从 number 中取出 int64，还原为指针
    int64_t redirectorHandle = 0;
    napi_get_value_int64(env, argv[0], &redirectorHandle);
    OH_TrafficFilter_Redirector *redirector =
        reinterpret_cast<OH_TrafficFilter_Redirector *>(redirectorHandle);

    if (redirector == nullptr) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        return result;
    }

    int32_t ret = OH_TrafficFilter_ClearRedirectRule(redirector);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value QueryProcess(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {0};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    OH_TrafficFilter_ConnectionInfo connInfo = {0};
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    if (!TrafficFilterNapiUtils::ParseConnectionInfo(env, argv[0], connInfo)) {
        napi_value result;
        napi_create_int32(env, OH_TRAFFICFILTER_ERROR_INVALID_PARAM, &result);
        napi_set_named_property(env, resultObj, "ret", result);
        return resultObj;
    }
    OH_TrafficFilter_ProcessInfo processInfo = {0};
    processInfo.size = sizeof(OH_TrafficFilter_ProcessInfo);
    int32_t ret = OH_TrafficFilter_QueryProcess(&connInfo, &processInfo);
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    napi_set_named_property(env, resultObj, "ret", retValue);
    
    if (ret == OH_TRAFFICFILTER_OK) {
        napi_value pidValue;
        napi_create_uint32(env, processInfo.pid, &pidValue);
        napi_set_named_property(env, resultObj, "pid", pidValue);
        napi_value uidValue;
        napi_create_uint32(env, processInfo.uid, &uidValue);
        napi_set_named_property(env, resultObj, "uid", uidValue);
    }
    
    return resultObj;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "AddNullPtrReadOnlyRequestInterceptor", nullptr, NAPI_Global_AddNullPtrReadOnlyRequestInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "AddNullPtrWritableResponseInterceptor", nullptr, NAPI_Global_AddNullPtrWritableResponseInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "AddReadOnlyRequestInterceptor", nullptr, NAPI_Global_AddReadOnlyRequestInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "AddReadOnlyResponseInterceptor", nullptr, NAPI_Global_AddReadOnlyResponseInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "AddWritableRequestInterceptor", nullptr, NAPI_Global_AddWritableRequestInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "AddWritableResponseInterceptor", nullptr, NAPI_Global_AddWritableResponseInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "RemoveRequestInterceptor", nullptr, NAPI_Global_RemoveRequestInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "RemoveResponseInterceptor", nullptr, NAPI_Global_RemoveResponseInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "StopAllInterceptor", nullptr, NAPI_Global_StopAllInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "RemoveAllInterceptor", nullptr, NAPI_Global_RemoveAllInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "RemoveNullptrInterceptor", nullptr, NAPI_Global_RemoveNullptrInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "StartAllInterceptor", nullptr, NAPI_Global_StartAllInterceptor, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "TestCHttpRequest", nullptr, NAPI_TestCHttpRequest, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "RegisterInterceptorCallback", nullptr, NAPI_RegisterInterceptorCallback, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "UnregisterCallback", nullptr, NAPI_UnregisterCallback, nullptr,
          nullptr, nullptr, napi_default, nullptr },
        { "CreateRedirector", nullptr, CreateRedirector, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DestroyRedirector", nullptr, DestroyRedirector, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AddRedirectRule", nullptr, AddRedirectRule, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ClearRedirectRule", nullptr, ClearRedirectRule, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "QueryProcess", nullptr, QueryProcess, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}