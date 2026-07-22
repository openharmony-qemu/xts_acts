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
    .nm_modname = "trafficfilter",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}