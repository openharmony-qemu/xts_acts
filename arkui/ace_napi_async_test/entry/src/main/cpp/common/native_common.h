/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifndef FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_COMMON_H
#define FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_COMMON_H

#include "napi/native_api.h"
#include <string>

#define DEPRECATED __attribute__((__deprecated__))

#define NAPI_VERSION 8

inline void ThrowLastNapiError(napi_env env)
{
    const napi_extended_error_info *errorInfo = nullptr;
    napi_get_last_error_info(env, &errorInfo);
    bool isPending = false;
    napi_is_exception_pending(env, &isPending);
    if (!isPending && errorInfo != nullptr) {
        const char *errorMessage =
            errorInfo->error_message != nullptr ? errorInfo->error_message : "empty error message";
        napi_throw_error(env, nullptr, errorMessage);
    }
}

inline bool CheckNapiAssertion(napi_env env, bool assertion, const char *message)
{
    if (assertion) {
        return true;
    }
    std::string errorMessage = "assertion failed: ";
    errorMessage += message;
    napi_throw_error(env, nullptr, errorMessage.c_str());
    return false;
}

inline bool CheckNapiCall(napi_env env, napi_status status)
{
    if (status == napi_ok) {
        return true;
    }
    ThrowLastNapiError(env);
    return false;
}

inline napi_property_descriptor DeclareNapiProperty(const char *name, napi_value value)
{
    return {name, nullptr, nullptr, nullptr, nullptr, value, napi_default, nullptr};
}

inline napi_property_descriptor DeclareNapiStaticProperty(const char *name, napi_value value)
{
    return {name, nullptr, nullptr, nullptr, nullptr, value, napi_static, nullptr};
}

inline napi_property_descriptor DeclareNapiFunction(const char *name, napi_callback func)
{
    return {name, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr};
}

inline napi_property_descriptor DeclareNapiFunctionWithData(const char *name, napi_callback func, void *data)
{
    return {name, nullptr, func, nullptr, nullptr, nullptr, napi_default, data};
}

inline napi_property_descriptor DeclareNapiStaticFunction(const char *name, napi_callback func)
{
    return {name, nullptr, func, nullptr, nullptr, nullptr, napi_static, nullptr};
}

inline napi_property_descriptor DeclareNapiGetter(const char *name, napi_callback getter)
{
    return {name, nullptr, nullptr, getter, nullptr, nullptr, napi_default, nullptr};
}

inline napi_property_descriptor DeclareNapiSetter(const char *name, napi_callback setter)
{
    return {name, nullptr, nullptr, nullptr, setter, nullptr, napi_default, nullptr};
}

inline napi_property_descriptor DeclareNapiGetterSetter(const char *name, napi_callback getter, napi_callback setter)
{
    return {name, nullptr, nullptr, getter, setter, nullptr, napi_default, nullptr};
}

inline napi_property_descriptor DeclareNapiDefaultProperty(const char *name, napi_value value)
{
    return {name, nullptr, nullptr, nullptr, nullptr, value, napi_default_jsproperty, nullptr};
}

#endif /* FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_COMMON_H */
