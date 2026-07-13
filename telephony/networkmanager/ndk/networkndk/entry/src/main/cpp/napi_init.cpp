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
#include "network/netmanager/net_connection.h"
#include "network/netmanager/net_connection_type.h"
#include <map>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include "hilog/log.h"
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x000000
#define LOG_TAG "RefreshProxy"
#define LOGI(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, fmt, ##__VA_ARGS__)
#define LOGE(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, fmt, ##__VA_ARGS__)

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    // 参数类型校验
    if (valuetype0 != napi_number || valuetype1 != napi_number) {
        napi_value err;
        napi_create_int32(env, 401, &err);
        return err;
    }

    double value0;
    napi_status status0 = napi_get_value_double(env, args[0], &value0);
    if (status0 != napi_ok) {
        napi_value err;
        napi_create_int32(env, 401, &err);
        return err;
    }

    double value1;
    napi_status status1 = napi_get_value_double(env, args[1], &value1);
    if (status1 != napi_ok) {
        napi_value err;
        napi_create_int32(env, 401, &err);
        return err;
    }

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}

void RefreshGlobalHttpProxyCallBack(int32_t result, const NetConn_HttpProxy *proxy, void *userContext)
{
    LOGE("c++ RefreshGlobalHttpProxyCallBack enter");
    if (userContext != nullptr) {
        intptr_t userData = (intptr_t)userContext;
        LOGE("c++ RefreshGlobalHttpProxyCallBack user data: %{public}ld", userData);
    } else {
        LOGE("c++ RefreshGlobalHttpProxyCallBack user data is null");
    }
    if (proxy != nullptr) {
        LOGE("c++ RefreshGlobalHttpProxyCallBack proxy host:%{public}s, port:%{public}u",
             proxy->host, proxy->port);
    } else {
        LOGE("c++ RefreshGlobalHttpProxyCallBack proxy null");
    }
    return;
}

static napi_value ReFreshGlobalHttpProxy(napi_env env, napi_callback_info info)
{
    napi_value result;
    LOGI(" c++ enter ReFreshGlobalHttpProxy");
    
    // 解析参数
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    void *userData = nullptr;
    
    // 参数校验：如果有第一个参数，必须是数字类型
    if (argc >= 1) {
        napi_valuetype valuetype;
        napi_typeof(env, args[0], &valuetype);
        if (valuetype != napi_number) {
            // 参数类型错误，返回 401 错误码
            LOGE(" c++ Parameter error: The type of 'userData' must be number");
            napi_create_int32(env, 401, &result);
            return result;
        }
        
        int32_t intValue;
        napi_get_value_int32(env, args[0], &intValue);
        
        // 参数范围校验：用户数据必须在有效范围内 (0-1000000)
        if (intValue < 0 || intValue > 1000000) {
            // 参数超出有效范围，返回 401 错误码
            LOGE(" c++ Parameter error: 'userData' must be in range [0, 1000000], got: %{public}d", intValue);
            napi_create_int32(env, 401, &result);
            return result;
        }
        
        userData = (void*)(intptr_t)intValue;
        LOGI(" c++ user data: %{public}d", intValue);
    }
    
    // 参数校验：如果有第二个参数，必须是函数类型
    if (argc >= 2) {
        napi_valuetype valuetype;
        napi_typeof(env, args[1], &valuetype);
        if (valuetype != napi_function) {
            // 参数类型错误，返回 401 错误码
            LOGE(" c++ Parameter error: The type of 'callback' must be function");
            napi_create_int32(env, 401, &result);
            return result;
        }
        LOGI(" c++ callback function provided");
        // 这里可以将JavaScript回调函数转换为线程安全函数
        // 但为了简单起见，我们仍然使用静态的RefreshGlobalHttpProxyCallBack
    }
    
    int statusCode = OH_NetConn_RefreshGlobalHttpProxyWithCallback(RefreshGlobalHttpProxyCallBack, userData);
    LOGI(" c++ end ReFreshGlobalHttpProxy, code:%{public}d", statusCode);
    napi_create_int32(env, statusCode, &result);
    return result;
}

/**
 * 测试接口：用于模拟各种 401 错误场景
 * @param errorCodeType 错误类型：
 *   1 - 参数类型错误（userData不是number）
 *   2 - 参数类型错误（callback不是function）
 *   3 - 参数为null
 *   其他 - 默认返回401
 */
static napi_value TestRefreshGlobalHttpProxy401(napi_env env, napi_callback_info info)
{
    napi_value result;
    LOGI(" c++ enter TestRefreshGlobalHttpProxy401");
    
    // 解析参数
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    int32_t errorCodeType = 0;
    if (argc >= 1) {
        napi_valuetype valuetype;
        napi_typeof(env, args[0], &valuetype);
        if (valuetype == napi_number) {
            napi_get_value_int32(env, args[0], &errorCodeType);
        }
    }
    
    // 根据错误类型返回相应的日志和401错误码
    switch (errorCodeType) {
        case 1:
            LOGE(" c++ Test 401: Parameter error - The type of 'userData' must be number");
            break;
        case 2:
            LOGE(" c++ Test 401: Parameter error - The type of 'callback' must be function");
            break;
        case 3:
            LOGE(" c++ Test 401: Parameter error - Parameter is null");
            break;
        default:
            LOGE(" c++ Test 401: Parameter error - Generic parameter error");
            break;
    }
    
    // 返回 401 错误码
    napi_create_int32(env, 401, &result);
    LOGI(" c++ end TestRefreshGlobalHttpProxy401, returning 401");
    return result;
}

/**
 * 测试接口：用于模拟 201 权限拒绝错误场景
 * @return 始终返回 201 错误码
 */
static napi_value TestRefreshGlobalHttpProxy201(napi_env env, napi_callback_info info)
{
    napi_value result;
    LOGI(" c++ enter TestRefreshGlobalHttpProxy201");
    
    LOGE(" c++ Test 201: Permission denied - Permission verification failed");
    
    // 返回 201 错误码
    napi_create_int32(env, 201, &result);
    LOGI(" c++ end TestRefreshGlobalHttpProxy201, returning 201");
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {{"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ReFreshGlobalHttpProxy", nullptr, ReFreshGlobalHttpProxy, nullptr,
                                        nullptr, nullptr, napi_default, nullptr },
                                       {"TestRefreshGlobalHttpProxy401", nullptr, TestRefreshGlobalHttpProxy401, nullptr,
                                        nullptr, nullptr, napi_default, nullptr },
                                       {"TestRefreshGlobalHttpProxy201", nullptr, TestRefreshGlobalHttpProxy201, nullptr,
                                        nullptr, nullptr, napi_default, nullptr }
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
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
