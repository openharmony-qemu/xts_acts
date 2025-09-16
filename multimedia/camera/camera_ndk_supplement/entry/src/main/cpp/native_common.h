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
#ifndef FOUNDATION_CAMERA_INTERFACES_KITS_NAPI_NATIVE_COMMON_H
#define FOUNDATION_CAMERA_INTERFACES_KITS_NAPI_NATIVE_COMMON_H

#include <memory>
#include <utility>
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>

inline napi_property_descriptor DECLARE_NAPI_FUNCTION(const char* name, napi_callback func)
{
    return {name, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr};
}

namespace CameraTestUtils {
const int NAME_SIZE = 256;
const int PARAMETER_TWO = 2;

inline bool CheckArgs(napi_env env, napi_callback_info info, napi_value *args, size_t required)
{
    size_t argc = required;
    return napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok && argc >= required &&
           args[0] != nullptr && (required == 1 || args[1] != nullptr);
}

inline std::unique_ptr<char[]> GetArgsOneParameterByStr(napi_env env, napi_callback_info info)
{
    napi_value args[1] = {nullptr};
    if (!CheckArgs(env, info, args, 1)) {
        return nullptr;
    }

    auto param = std::make_unique<char[]>(NAME_SIZE);
    return napi_get_value_string_utf8(env, args[0], param.get(), NAME_SIZE, nullptr) == napi_ok ? std::move(param)
                                                                                                : nullptr;
}

inline int32_t GetArgsOneParameterByInt(napi_env env, napi_callback_info info)
{
    napi_value args[1] = {nullptr};
    if (!CheckArgs(env, info, args, 1)) {
        return 0;
    }

    int32_t index = 0;
    return napi_get_value_int32(env, args[0], &index) == napi_ok ? index : 0;
}

inline std::pair<std::unique_ptr<char[]>, std::unique_ptr<char[]>> GetArgsTwoParameters(napi_env env,
                                                                                        napi_callback_info info)
{
    napi_value args[PARAMETER_TWO] = {nullptr};
    if (!CheckArgs(env, info, args, PARAMETER_TWO)) {
        return {nullptr, nullptr};
    }

    auto param1 = std::make_unique<char[]>(NAME_SIZE);
    auto param2 = std::make_unique<char[]>(NAME_SIZE);
    bool success = napi_get_value_string_utf8(env, args[0], param1.get(), NAME_SIZE, nullptr) == napi_ok &&
                   napi_get_value_string_utf8(env, args[1], param2.get(), NAME_SIZE, nullptr) == napi_ok;
    return success ? std::make_pair(std::move(param1), std::move(param2)) : std::make_pair(nullptr, nullptr);
}

inline std::pair<int, int> GetArgsTwoParametersByInit(napi_env env, napi_callback_info info)
{
    int32_t index0 = 0;
    int32_t index1 = 0;
    napi_value args[PARAMETER_TWO] = {nullptr};
    if (!CheckArgs(env, info, args, PARAMETER_TWO)) {
        return {index0, index1};
    }

    bool success = napi_get_value_int32(env, args[0], &index0) == napi_ok &&
                   napi_get_value_int32(env, args[1], &index1) == napi_ok;
    return success ? std::make_pair(index0, index1) : std::make_pair(index0, index1);
}

}
#endif /* FOUNDATION_CAMERA_INTERFACES_KITS_NAPI_NATIVE_COMMON_H */
