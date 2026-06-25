/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once
#include "Common.h"
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_disasm {
constexpr ani_int DISASM_INSTANCE_ADD_OFFSET = 1;
constexpr ani_int DISASM_OVERLOAD_VOID_RETURN = 100;
constexpr ani_int DISASM_ERROR_RETURN = -1;
std::string DisasmAniStringToStd(ani_env *env, ani_string value)
{
    if (env == nullptr || value == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(value, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed")) {
        return "";
    }
    std::vector<char> buffer(size + 1, 0);
    ani_size writtenSize = 0;
    status = env->String_GetUTF8(value, buffer.data(), buffer.size(), &writtenSize);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8 failed")) {
        return "";
    }
    return std::string(buffer.data(), writtenSize);
}
}
ani_int test_InstanceAdd(ani_env *env, ani_object object, ani_int value)
{
    (void)env;
    (void)object;
    std::cout << "test_InstanceAdd called, value: " << value << std::endl;
    return value + ani_tc_disasm::DISASM_INSTANCE_ADD_OFFSET;
}
ani_int test_StaticSquare(ani_env *env, ani_class cls, ani_int value)
{
    (void)env;
    (void)cls;
    std::cout << "test_StaticSquare called, value: " << value << std::endl;
    return value * value;
}
ani_int test_OverloadVoid(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    std::cout << "test_OverloadVoid called" << std::endl;
    return ani_tc_disasm::DISASM_OVERLOAD_VOID_RETURN;
}
ani_int test_OverloadString(ani_env *env, ani_object object, ani_string value)
{
    (void)object;
    std::string str = ani_tc_disasm::DisasmAniStringToStd(env, value);
    if (str.empty() && value == nullptr) {
        return ani_tc_disasm::DISASM_ERROR_RETURN;
    }
    std::cout << "test_OverloadString called, value: " << str << std::endl;
    return static_cast<ani_int>(str.size());
}
