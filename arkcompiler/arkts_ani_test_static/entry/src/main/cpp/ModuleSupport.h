/**
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

#ifndef ARKTS_ANI_TEST_MODULESUPPORT_H
#define ARKTS_ANI_TEST_MODULESUPPORT_H
#include "Common.h"
#include <random>


ani_int test_Module_FindFunction([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(module, "sumTwo", "ii:i", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_FindVariable([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module{};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ani_variable variable{};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleTwo", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_Find_Combination_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_class kclass {};
    ani_namespace ns {};
    ani_function fn {};
    ani_variable variable {};
    ani_enum aniEnum {};
    char end = 'J';
    const int32_t loopCount = 3;
    // create rand engine and distribution
    std::random_device rd; // rand seed
    std::mt19937 gen(rd()); // Mersenne twister algorithm
    int uHead = 1;
    int uTail = 100;
    std::uniform_int_distribution<int> dist(uHead, uTail); // uniform distribution
    for (int32_t i = 0; i < loopCount; i++) {
        std::string functionName = "setIntValue";
        std::string variableName = "module";
        std::string enumName = "Color";

        int randomValue = dist(gen);
        char ch = (randomValue % (end - 'A') + 'A');
        const std::string className = std::string(1, ch);
        std::string namespaceName = className;
        namespaceName += "ops";
        functionName += ch;
        variableName += ch;
        enumName += ch;
        ASSERT_EQ(env->Module_FindFunction(module, functionName.c_str(), "i:", &fn), ANI_OK);
        ASSERT_EQ(env->Module_FindVariable(module, variableName.c_str(), &variable), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Module_Find_Combination_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_class kclass {};
    ani_namespace ns {};
    ani_function fn {};
    ani_variable variable {};
    ASSERT_EQ(env->Module_FindFunction(module, "setIntValueAAAA", "i:", &fn), ANI_NOT_FOUND);
    ASSERT_EQ(env->Module_FindVariable(module, "moduleAAAA", &variable), ANI_NOT_FOUND);
    
    ASSERT_EQ(env->Module_FindFunction(nullptr, "setIntValueA", "i:", &fn), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Module_FindVariable(nullptr, "moduleA", &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean CheckEnumValue(ani_env *env, ani_enum aniEnum, const std::string &name, int value)
{
    ani_enum_item item {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(aniEnum, name.c_str(), &item), ANI_OK);
    ani_int valueInt {};
    ASSERT_EQ(env->EnumItem_GetValue_Int(item, &valueInt), ANI_OK);
    ASSERT_EQ(valueInt, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Enum_Many_Descriptor([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    char end = 'C';
    const int32_t loopCount = 3;
    // create rand engine and distribution
    std::random_device rd; // rand seed
    std::mt19937 gen(rd()); // Mersenne twister algorithm
    int uHead = 1;
    int uTail = 100;
    std::uniform_int_distribution<int> dist(uHead, uTail); // uniform distribution
    for (int32_t i = 0; i < loopCount; i++) {
        std::string str = "Color";
        int randomValue = dist(gen);
        str += static_cast<char>(randomValue % (end - 'A') + 'A');
    }
    return ANI_TRUE;
}

ani_boolean RetrieveStringFromAni(ani_env *env, ani_string string, std::string &resString)
{
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const ani_size bufferExtension = 10U;
    resString.resize(substrSize + bufferExtension);
    ani_size resSize = resString.size();
    result = 0U;
    auto status = env->String_GetUTF8SubString(string, substrOffset, substrSize, resString.data(), resSize, &result);
    ASSERT_EQ(status, ANI_OK);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_Invalid_Arg_ModuleName([[maybe_unused]] ani_env *env,
                                                         [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(module, "getInitialBool", ":C{std.core.String}", &fn), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_Invalid_Arg_Signature([[maybe_unused]] ani_env *env,
                                                        [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(module, "getInitialStringValue", nullptr, &fn), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_Invalid_Arg_Module([[maybe_unused]] ani_env *env,
                                                     [[maybe_unused]] ani_object object)
{
    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(nullptr, "getInitialStringValue", ":C{std.core.String}", &fn),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_Invalid_Arg_Name([[maybe_unused]] ani_env *env,
                                                   [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(module, "", ":C{std.core.String}", &fn), ANI_NOT_FOUND);
    ASSERT_EQ(env->Module_FindFunction(module, nullptr, ":C{std.core.String}", &fn), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Invalid_Arg_Name_In_Namespace([[maybe_unused]] ani_env *env,
                                                  [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(module, "getIntValueOps", ":i", &fn), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ASSERT_EQ(env->Module_FindFunction(module, "getInitialStringValue", ":C{std.core.String}", nullptr),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_function fn {};
    ASSERT_EQ(env->c_api->Module_FindFunction(nullptr, module, "getInitialStringValue", ":C{std.core.String}", &fn),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(module, "overloaded", nullptr, &fn), ANI_AMBIGUOUS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ani_function fn1 {};
    ASSERT_EQ(env->Module_FindFunction(module, "getInitialIntValue", ":i", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    fn1 = fn;
    ASSERT_EQ(env->Module_FindFunction(module, "getInitialIntValuexxxx", ":i", &fn), ANI_NOT_FOUND);
    ASSERT_EQ(fn, fn1);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_function fn {};
    char end = 'J';
    const int32_t loopCount = 3;
    // create rand engine and distribution
    std::random_device rd; // rand seed
    std::mt19937 gen(rd()); // Mersenne twister algorithm
    int uHead = 1;
    int uTail = 100;
    std::uniform_int_distribution<int> dist(uHead, uTail); // uniform distribution
    for (int i = 0; i < loopCount; i++) {
        std::string str = "getIntValue";
        int randomValue = dist(gen);
        str += static_cast<char>(randomValue % (end - 'A') + 'A');
        ASSERT_EQ(env->Module_FindFunction(module, str.c_str(), "i:", &fn), ANI_OK);
        ASSERT_NE(fn, nullptr);
    }
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(module, "getIntValue", "i:i", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    fn = nullptr;
    ASSERT_EQ(env->Module_FindFunction(module, "async_f", "i:C{std.core.Promise}", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_Find_Function_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(module, "getIntValueOps", ":i", &fn), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleX", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    const ani_int y = 0;
    ani_int x = 1;
    ASSERT_EQ(env->Variable_SetValue_Int(variable, y), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &x), ANI_OK);
    ASSERT_EQ(x, y);
    ASSERT_EQ(env->Module_FindVariable(module, "moduleS", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleXS", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "sss", &variable), ANI_NOT_FOUND);
    ASSERT_EQ(env->Module_FindVariable(module, "", &variable), ANI_NOT_FOUND);
    ASSERT_EQ(env->Module_FindVariable(module, nullptr, &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ASSERT_EQ(env->Module_FindVariable(module, "moduleXS", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_variable variable {};
    ASSERT_EQ(env->c_api->Module_FindVariable(nullptr, module, "moduleXS", &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(nullptr, "moduleXS", &variable), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ani_variable variable1 {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleX", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);
    variable1 = variable;
    ASSERT_EQ(env->Module_FindVariable(module, "moduleSSSSSS", &variable), ANI_NOT_FOUND);
    ASSERT_EQ(variable, variable1);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);
    ani_variable variable {};
    char end = 'J';
    const int32_t loopCount = 3;
    // create rand engine and distribution
    std::random_device rd; // rand seed
    std::mt19937 gen(rd()); // Mersenne twister algorithm
    int uHead = 1;
    int uTail = 100;
    std::uniform_int_distribution<int> dist(uHead, uTail); // uniform distribution
    for (int32_t i = 0; i < loopCount; i++) {
        std::string str = "module";
        int randomValue = dist(gen);
        str += static_cast<char>(randomValue % (end - 'A') + 'A');
        ASSERT_EQ(env->Module_FindVariable(module, str.c_str(), &variable), ANI_OK);
    }
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleT", &variable), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module {};
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleXB", &variable), ANI_OK);
    ASSERT_NE(variable, nullptr);

    const ani_int y = 0;
    ani_int x = 1;
    ASSERT_EQ(env->Variable_SetValue_Int(variable, y), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &x), ANI_OK);
    ASSERT_EQ(x, y);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleK", &variable), ANI_OK);

    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Variable_SetValue_Boolean(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Boolean(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleL", &variable), ANI_OK);

    ani_char result = '\0';
    ASSERT_EQ(env->Variable_GetValue_Char(variable, &result), ANI_OK);
    ASSERT_EQ(result, 'G');
    ani_char value = 'w';
    ASSERT_EQ(env->Variable_SetValue_Char(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Char(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleM", &variable), ANI_OK);

    ani_byte result = 0;
    ASSERT_EQ(env->Variable_GetValue_Byte(variable, &result), ANI_OK);
    ASSERT_EQ(result, 2U);
    ani_byte value = 8U;
    ASSERT_EQ(env->Variable_SetValue_Byte(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Byte(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleN", &variable), ANI_OK);

    ani_short result = 0;
    ASSERT_EQ(env->Variable_GetValue_Short(variable, &result), ANI_OK);
    ASSERT_EQ(result, 10U);
    ani_short value = 20U;
    ASSERT_EQ(env->Variable_SetValue_Short(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Short(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleO", &variable), ANI_OK);

    ani_long result = 0;
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &result), ANI_OK);
    ASSERT_EQ(result, 100U);
    ani_long value = 200U;
    ASSERT_EQ(env->Variable_SetValue_Long(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Long(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleP", &variable), ANI_OK);

    ani_float result = 0.0F;
    ASSERT_EQ(env->Variable_GetValue_Float(variable, &result), ANI_OK);
    ASSERT_EQ(result, 3.14F);
    ani_float value = 6.28F;
    ASSERT_EQ(env->Variable_SetValue_Float(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Float(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleQ", &variable), ANI_OK);

    ani_double result = 0.0;
    ani_double value = 6.28;  // 6.28 is the test value
    ASSERT_EQ(env->Variable_GetValue_Double(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    value = 3.14;  // 3.14 is the test value
    ASSERT_EQ(env->Variable_SetValue_Double(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Double(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleX", &variable), ANI_OK);

    ani_int result = 0U;
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &result), ANI_OK);
    ASSERT_EQ(result, 0U);
    ani_int value = 6U;
    ASSERT_EQ(env->Variable_SetValue_Int(variable, value), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Int(variable, &result), ANI_OK);
    ASSERT_EQ(result, value);
    return ANI_TRUE;
}

ani_int test_Module_Find_Variable_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module module;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.ModuleSupport", &module), ANI_OK);
    ASSERT_NE(module, nullptr);

    ani_variable variable {};
    ASSERT_EQ(env->Module_FindVariable(module, "moduleXS", &variable), ANI_OK);

    ani_ref result = nullptr;
    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &result), ANI_OK);

    std::string str {};
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str, "abc");

    ani_string string = {};
    auto status = env->String_NewUTF8("hello", 5U, &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(env->Variable_SetValue_Ref(variable, string), ANI_OK);
    ASSERT_EQ(env->Variable_GetValue_Ref(variable, &result), ANI_OK);
    GetStdString(env, static_cast<ani_string>(result), str);
    ASSERT_STREQ(str, "hello");
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_MODULESUPPORT_H
