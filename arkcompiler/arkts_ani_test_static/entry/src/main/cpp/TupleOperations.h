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

#ifndef ARKTS_ANI_TEST_TUPLEOPERATIONS_H
#define ARKTS_ANI_TEST_TUPLEOPERATIONS_H
#include "Common.h"

const int32_t LOOP_COUNT = 3;
const int ARRAY_SIZE = 5;
const ani_size STRING_SIZE = 6;

ani_int test_TupleValue_GetItem_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Boolean(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_boolean, 5U> expectedValues = {ANI_TRUE, ANI_FALSE, ANI_TRUE, ANI_TRUE, ANI_FALSE};
    ani_boolean result = ANI_FALSE;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_boolean result = ANI_FALSE;
        ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Boolean_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getEmptyTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean result;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0, &result), ANI_OUT_OF_RANGE);
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0, false), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_byte EXPECTED_RESULT = 125;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Byte(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_byte EXPECTED_RESULT = 125;
    static constexpr ani_byte EXPECTED_RESULT_2 = 126;
    static constexpr ani_byte EXPECTED_RESULT_3 = 127;
    static constexpr ani_byte EXPECTED_RESULT_4 = 1;
    static constexpr ani_byte EXPECTED_RESULT_5 = 2;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_byte, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                     EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_byte result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_byte EXPECTED_RESULT = 125;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_byte result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, 'H');

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Char(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_char, 5U> expectedValues = {'H', 'e', 'l', 'l', 'o'};
    ani_char result = '\0';
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_char result = '\0';
        ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, 'H');
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_boolean booleanValue = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &booleanValue), ANI_INVALID_TYPE);
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0U, booleanValue), ANI_OK);

    std::string function1 = "getTestPrimitiveTuple";
    ani_module module1;
    ani_function functionHandle1;
    ani_ref resultRef1;
    ani_tuple_value boxedPrimitivesTuple;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module1), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module1, function1.c_str(), nullptr, &functionHandle1), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle1, &resultRef1), ANI_OK);
    boxedPrimitivesTuple = static_cast<ani_tuple_value>(resultRef1);
    ani_char charValue = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_GetItem_Char(boxedPrimitivesTuple, 0U, &charValue), ANI_INVALID_TYPE);
    ASSERT_EQ(env->TupleValue_SetItem_Char(boxedPrimitivesTuple, 0U, charValue), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_short EXPECTED_RESULT = 300;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Short(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_short EXPECTED_RESULT = 300;
    static constexpr ani_short EXPECTED_RESULT_2 = 350;
    static constexpr ani_short EXPECTED_RESULT_3 = 200;
    static constexpr ani_short EXPECTED_RESULT_4 = 100;
    static constexpr ani_short EXPECTED_RESULT_5 = 50;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_short, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                      EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_short result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_short EXPECTED_RESULT = 300;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_short result = 0;
        ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_int EXPECTED_RESULT = 300U;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Int(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_int result = 0U;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_int EXPECTED_RESULT = 300U;
    static constexpr ani_int EXPECTED_RESULT_2 = 350U;
    static constexpr ani_int EXPECTED_RESULT_3 = 200U;
    static constexpr ani_int EXPECTED_RESULT_4 = 100U;
    static constexpr ani_int EXPECTED_RESULT_5 = 50U;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_int, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                    EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_int result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_int EXPECTED_RESULT = 300U;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_int result = 0U;
        ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_long EXPECTED_RESULT = 300L;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Long(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_long EXPECTED_RESULT = 300L;
    static constexpr ani_long EXPECTED_RESULT_2 = 200L;
    static constexpr ani_long EXPECTED_RESULT_3 = 100L;
    static constexpr ani_long EXPECTED_RESULT_4 = 50L;
    static constexpr ani_long EXPECTED_RESULT_5 = 1000L;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_long, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                     EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_long result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_long EXPECTED_RESULT = 300L;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_long result = 0L;
        ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_float EXPECTED_RESULT = 3.14F;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Float(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_float EXPECTED_RESULT = 3.14F;
    static constexpr ani_float EXPECTED_RESULT_2 = 2.71F;
    static constexpr ani_float EXPECTED_RESULT_3 = 1.61F;
    static constexpr ani_float EXPECTED_RESULT_4 = 0.59F;
    static constexpr ani_float EXPECTED_RESULT_5 = 10.0F;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_float, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                      EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_float result = 0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_float EXPECTED_RESULT = 3.14F;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_float result = 0.0F;
        ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_double EXPECTED_RESULT = 3.14;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, EXPECTED_RESULT);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Double(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 6U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_double EXPECTED_RESULT = 3.14;
    static constexpr ani_double EXPECTED_RESULT_2 = 2.71;
    static constexpr ani_double EXPECTED_RESULT_3 = 1.61;
    static constexpr ani_double EXPECTED_RESULT_4 = 0.59;
    static constexpr ani_double EXPECTED_RESULT_5 = 10.0;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_double, 5U> expectedValues = {EXPECTED_RESULT, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                       EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_double result = 0.0;
    for (size_t i = 0; i < expectedValues.size(); ++i) {
        ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, i, &result), ANI_OK);
        ASSERT_EQ(result, expectedValues[i]);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_double EXPECTED_RESULT = 3.14;
    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    for (int32_t i = 0; i < LOOP_COUNT; i++) {
        ani_double result = 0.0;
        ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, &result), ANI_OK);
        ASSERT_EQ(result, EXPECTED_RESULT);
    }

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;
    ani_size copiedSize = 0;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);
    constexpr std::string_view EXPECTED_ELEM("Hello");
    auto internalStr = reinterpret_cast<ani_string>(result);
    std::array<char, EXPECTED_ELEM.size() + 1> elem {};
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(copiedSize, EXPECTED_ELEM.size());
    ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->c_api->TupleValue_GetItem_Ref(nullptr, tuple, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(nullptr, 0U, &result), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 4U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, -1U, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, nullptr), ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);
    tuple = static_cast<ani_tuple_value>(resultRef);

    const ani_size maxNum = std::numeric_limits<ani_size>::max();
    ani_ref result {};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, maxNum, &result), ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetItem_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    static constexpr ani_size ARRAY_SIZE = 5;
    static constexpr ani_double EXPECTED_RESULT_1 = 1.0;
    static constexpr ani_double EXPECTED_RESULT_2 = 2.0;
    static constexpr ani_double EXPECTED_RESULT_3 = 3.0;
    static constexpr ani_double EXPECTED_RESULT_4 = 4.0;
    static constexpr ani_double EXPECTED_RESULT_5 = 5.0;
    ani_size copiedSize = 0;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    const std::array<ani_double, 5U> expectedArrayValues = {EXPECTED_RESULT_1, EXPECTED_RESULT_2, EXPECTED_RESULT_3,
                                                            EXPECTED_RESULT_4, EXPECTED_RESULT_5};
    ani_ref result{};
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 1U, &result), ANI_OK);

    auto internalArr = reinterpret_cast<ani_array>(result);
    std::vector<double> elem(expectedArrayValues.size());

    for (size_t i = 0; i < elem.size(); ++i) {
        ani_ref doubleRef {};
        ani_double doubleValue {};
        ASSERT_EQ(env->Array_Get(internalArr, i, &doubleRef), ANI_OK);
        ASSERT_EQ(unboxDouble(env, static_cast<ani_object>(doubleRef), &doubleValue), ANI_OK);
        elem[i] = doubleValue;
    }
    for (size_t idx = 0; idx < expectedArrayValues.size(); ++idx) {
        ASSERT_EQ(elem[idx], expectedArrayValues[idx]);
    }

    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);

    auto internalStr = reinterpret_cast<ani_string>(result);
    std::array<char, ARRAY_SIZE + 1> elem0{};
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem0.size() - 1, elem0.data(), elem0.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(copiedSize, ARRAY_SIZE);
    ASSERT_EQ(std::strcmp(elem0.data(), "Hello"), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 2U, &result), ANI_OK);

    auto internalStr2 = reinterpret_cast<ani_string>(result);
    std::array<char, ARRAY_SIZE + 1> elem2{};
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr2, 0U, elem2.size() - 1, elem2.data(), elem2.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(copiedSize, ARRAY_SIZE);
    ASSERT_EQ(std::strcmp(elem2.data(), "world"), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getBooleanTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->TupleValue_SetItem_Boolean(tuple, 0U, value), ANI_OK);

    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->TupleValue_GetItem_Boolean(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getCharTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_char value = 'a';
    ASSERT_EQ(env->TupleValue_SetItem_Char(tuple, 0U, value), ANI_OK);

    ani_char result = '\0';
    ASSERT_EQ(env->TupleValue_GetItem_Char(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getByteTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_byte value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Byte(tuple, 0U, value), ANI_OK);

    ani_byte result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Byte(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getShortTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_short value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Short(tuple, 0U, value), ANI_OK);

    ani_short result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Short(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getIntTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_int value = 1;
    ASSERT_EQ(env->TupleValue_SetItem_Int(tuple, 0U, value), ANI_OK);

    ani_int result = 0;
    ASSERT_EQ(env->TupleValue_GetItem_Int(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getLongTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_long value = 1234567890L;
    ASSERT_EQ(env->TupleValue_SetItem_Long(tuple, 0U, value), ANI_OK);

    ani_long result = 0L;
    ASSERT_EQ(env->TupleValue_GetItem_Long(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getFloatTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_float value = 1.23456789F;
    ASSERT_EQ(env->TupleValue_SetItem_Float(tuple, 0U, value), ANI_OK);

    ani_float result = 0.0F;
    ASSERT_EQ(env->TupleValue_GetItem_Float(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getDoubleTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    ani_double value = 123.456;
    ASSERT_EQ(env->TupleValue_SetItem_Double(tuple, 0U, value), ANI_OK);

    ani_double result = 0.0;
    ASSERT_EQ(env->TupleValue_GetItem_Double(tuple, 0U, &result), ANI_OK);
    ASSERT_EQ(result, value);

    return ANI_TRUE;
}

ani_int test_TupleValue_SetItem_Ref([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string function = "getReferenceTuple";
    ani_module module;
    ani_function functionHandle;
    ani_ref resultRef;
    ani_tuple_value tuple;
    ani_size copiedSize = 0;
    ani_ref result{};

    ASSERT_EQ(env->FindModule("entry.src.main.src.ets.TupleOperations", &module), ANI_OK);
    ASSERT_EQ(env->Module_FindFunction(module, function.c_str(), nullptr, &functionHandle), ANI_OK);
    ASSERT_EQ(env->Function_Call_Ref(functionHandle, &resultRef), ANI_OK);

    tuple = static_cast<ani_tuple_value>(resultRef);
    static constexpr std::string_view EXPECTED_ELEM = "abcdef";
    ani_string string{};
    ASSERT_EQ(env->String_NewUTF8(EXPECTED_ELEM.data(), EXPECTED_ELEM.size(), &string), ANI_OK);

    std::array<char, EXPECTED_ELEM.size() + 1> elem{};
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 0U, string), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 0U, &result), ANI_OK);

    auto internalStr = reinterpret_cast<ani_string>(result);
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);
    ASSERT_EQ(env->TupleValue_SetItem_Ref(tuple, 2U, string), ANI_OK);
    ASSERT_EQ(env->TupleValue_GetItem_Ref(tuple, 2U, &result), ANI_OK);

    internalStr = reinterpret_cast<ani_string>(result);
    ASSERT_EQ(env->String_GetUTF8SubString(internalStr, 0U, elem.size() - 1, elem.data(), elem.size(), &copiedSize),
              ANI_OK);
    ASSERT_EQ(std::strcmp(elem.data(), EXPECTED_ELEM.data()), ANI_OK);

    return ANI_TRUE;
}

ani_int test_TupleValue_GetNumberOfItems([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.TupleOperations";
    const char *tupleGetterName = "getTestPrimitiveTuple";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);

    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    ani_boolean isUndefined = ANI_TRUE;
    ASSERT_EQ(env->Reference_IsUndefined(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_FALSE);

    ani_tuple_value tuple = static_cast<ani_tuple_value>(ref);
    ani_size length;
    ASSERT_EQ(env->TupleValue_GetNumberOfItems(tuple, &length), ANI_OK);
    ASSERT_EQ(length, 8U);

    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_TUPLEOPERATIONS_H
