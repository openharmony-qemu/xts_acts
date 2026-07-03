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

#ifndef NAPI_UTILS_H
#define NAPI_UTILS_H

#include <napi/native_api.h>
#include <initializer_list>

/**
 * @brief NAPI utility class providing common operations.
 */
class NapiUtils {
public:
    /**
     * @brief Creates a napi_value representing an unsigned 32-bit integer.
     * @param env The NAPI environment.
     * @param value The uint32_t value.
     * @return The created napi_value.
     */
    static napi_value CreateUint32(napi_env env, uint32_t value);

    /**
     * @brief Creates an empty JavaScript object.
     * @param env The NAPI environment.
     * @return The created napi_value object.
     */
    static napi_value CreateObject(napi_env env);

    /**
     * @brief Defines properties on a JavaScript object.
     * @param env The NAPI environment.
     * @param obj The target object.
     * @param properties The list of property descriptors.
     */
    static void DefineProperties(napi_env env, napi_value obj,
                                 const std::initializer_list<napi_property_descriptor>& properties);

    /**
     * @brief Sets a named property on a JavaScript object.
     * @param env The NAPI environment.
     * @param obj The target object.
     * @param name The property name.
     * @param value The property value.
     */
    static void SetNamedProperty(napi_env env, napi_value obj, const char* name, napi_value value);
};

/**
 * @brief 创建一个用于声明 NAPI 普通函数的属性描述符
 * @param name 导出到 JS 侧的函数名
 * @param func 对应的 C/C++ 原生回调函数
 * @return napi_property_descriptor 结构体实例
 */
inline napi_property_descriptor DeclareNapiFunction(const char* name, napi_callback func)
{
    napi_property_descriptor desc{}; // 使用 {} 零初始化所有未显式赋值的字段
    
    desc.utf8name  = name;
    desc.method    = func;
    desc.attributes = napi_default;
    
    // 其余字段 (value, getter, setter, data) 已由 {} 自动初始化为 nullptr
    return desc;
}

/**
 * @brief 创建一个用于声明 NAPI 静态属性的描述符
 * @param name 导出到 JS 侧的属性名
 * @param value 对应的 napi_value 值
 * @return napi_property_descriptor 结构体实例
 */
inline napi_property_descriptor DeclareNapiStaticProperty(const char* name, napi_value value)
{
    napi_property_descriptor desc{}; // 零初始化
    
    desc.utf8name  = name;
    desc.value     = value;
    desc.attributes = napi_static;
    
    // 其余字段 (method, getter, setter, data) 已由 {} 自动初始化为 nullptr
    return desc;
}

#endif // NAPI_UTILS_H