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

#include "napi_utils.h"


napi_value NapiUtils::CreateUint32(napi_env env, uint32_t value)
{
    napi_value result = nullptr;
    napi_status status = napi_create_uint32(env, value, &result);
    if (status != napi_ok) {
        return nullptr;
    }
    return result;
}

napi_value NapiUtils::CreateObject(napi_env env)
{
    napi_value result = nullptr;
    napi_status status = napi_create_object(env, &result);
    if (status != napi_ok) {
        return nullptr;
    }
    return result;
}

void NapiUtils::DefineProperties(napi_env env, napi_value obj,
                                 const std::initializer_list<napi_property_descriptor>& properties)
{
    napi_status status = napi_define_properties(env, obj, properties.size(), properties.begin());
    if (status != napi_ok) {
        // Log error if needed
    }
}

void NapiUtils::SetNamedProperty(napi_env env, napi_value obj, const char* name, napi_value value)
{
    napi_status status = napi_set_named_property(env, obj, name, value);
    if (status != napi_ok) {
        // Log error if needed
    }
}
