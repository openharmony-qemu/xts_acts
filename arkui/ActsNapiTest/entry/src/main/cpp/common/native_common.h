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

/*
 * ============================================================================
 * NAPI辅助宏定义 - 参考xts_acts/arkui/ace_napi_test
 * ============================================================================
 * 
 * 本文件定义了NAPI测试用例常用的辅助宏，用于：
 * - 统一错误处理
 * - 自动日志记录
 * - 简化代码编写
 * 
 * 使用方式：
 * 1. NAPI_CALL(env, napi_xxx(...)) - 包裹NAPI调用，失败时自动抛出异常
 * 2. NAPI_ASSERT(env, condition, "message") - 断言验证，失败时抛出异常
 * 3. NAPI_LOG_INFO/ERROR(...) - 日志输出
 * ============================================================================
 */

#ifndef NATIVE_COMMON_H
#define NATIVE_COMMON_H

#include "napi/native_api.h"
#include "hilog/log.h"

/* ============================================================================
 * 日志宏定义
 * ============================================================================
 */
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001  // 应用领域标识
#define LOG_TAG "NapiCreateObjTest"  // 日志标签

#define NAPI_LOG_INFO(fmt, ...) OH_LOG_INFO(LOG_APP, "{%{public}s} " fmt, __func__, ##__VA_ARGS__)
#define NAPI_LOG_ERROR(fmt, ...) OH_LOG_ERROR(LOG_APP, "{%{public}s} " fmt, __func__, ##__VA_ARGS__)
#define NAPI_LOG_DEBUG(fmt, ...) OH_LOG_DEBUG(LOG_APP, "{%{public}s} " fmt, __func__, ##__VA_ARGS__)

/* ============================================================================
 * 返回值定义
 * ============================================================================
 */
#define NAPI_RETVAL_NOTHING

/* ============================================================================
 * 错误处理宏
 * ============================================================================
 */

// 获取并抛出最后一个错误信息
#define GET_AND_THROW_LAST_ERROR(env)                                                                   \
    do {                                                                                                \
        const napi_extended_error_info* errorInfo = nullptr;                                            \
        napi_get_last_error_info((env), &errorInfo);                                                    \
        bool isPending = false;                                                                         \
        napi_is_exception_pending((env), &isPending);                                                   \
        if (!isPending && errorInfo != nullptr) {                                                       \
            const char* errorMessage =                                                                  \
                errorInfo->error_message != nullptr ? errorInfo->error_message : "empty error message"; \
            NAPI_LOG_ERROR("NAPI error: %{public}s", errorMessage);                                     \
            napi_throw_error((env), nullptr, errorMessage);                                             \
        }                                                                                               \
    } while (0)

// 基础断言宏
#define NAPI_ASSERT_BASE(env, assertion, message, retVal)                                    \
    do {                                                                                     \
        if (!(assertion)) {                                                                  \
            NAPI_LOG_ERROR("Assertion failed: %{public}s", message);                         \
            napi_throw_error((env), nullptr, "assertion (" #assertion ") failed: " message); \
            return retVal;                                                                   \
        }                                                                                    \
    } while (0)

#define NAPI_ASSERT(env, assertion, message) NAPI_ASSERT_BASE(env, assertion, message, nullptr)
#define NAPI_ASSERT_RETURN_VOID(env, assertion, message) NAPI_ASSERT_BASE(env, assertion, message, NAPI_RETVAL_NOTHING)

// NAPI调用包裹宏 - 自动检查返回值并抛出异常
#define NAPI_CALL_BASE(env, theCall, retVal) \
    do {                                     \
        napi_status status = (theCall);      \
        if (status != napi_ok) {             \
            NAPI_LOG_ERROR("NAPI call failed: %{public}s, status=%{public}d", #theCall, status); \
            GET_AND_THROW_LAST_ERROR((env)); \
            return retVal;                   \
        }                                    \
    } while (0)

#define NAPI_CALL(env, theCall) NAPI_CALL_BASE(env, theCall, nullptr)
#define NAPI_CALL_RETURN_VOID(env, theCall) NAPI_CALL_BASE(env, theCall, NAPI_RETVAL_NOTHING)

// 状态检查宏 - 用于测试验证
#define NAPI_CHECK_STATUS(env, status, message) \
    do {                                        \
        if ((status) != napi_ok) {              \
            NAPI_LOG_ERROR("Check failed: %{public}s, status=%{public}d", message, status); \
            return Ret(env, 0);                 \
        }                                       \
    } while (0)

/* ============================================================================
 * 属性描述符宏
 * ============================================================================
 */
#define DECLARE_NAPI_FUNCTION(name, func)                                         \
    {                                                                             \
        (name), nullptr, (func), nullptr, nullptr, nullptr, napi_default, nullptr \
    }

/* ============================================================================
 * 测试结果返回宏
 * ============================================================================
 */
// 返回int32结果（成功返回1，失败返回0）
static inline napi_value Ret(napi_env env, int32_t val)
{
    napi_value result = nullptr;
    napi_create_int32(env, val, &result);
    return result;
}

// 返回成功结果
#define NAPI_RETURN_SUCCESS(env) Ret(env, 1)

// 返回失败结果
#define NAPI_RETURN_FAIL(env) Ret(env, 0)

#endif /* NATIVE_COMMON_H */