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

#ifndef ARKTS_ANI_TEST_CLASSOPERATIONS_H
#define ARKTS_ANI_TEST_CLASSOPERATIONS_H
#include "Common.h"

const ani_int VAL1 = 5U;
const ani_int VAL2 = 6U;
const ani_double VAL3 = 1.5;
const ani_double VAL4 = 2.5;
const size_t ARG_COUNT = 2U;
const ani_long VALL1 = 123;
const ani_long VALL2 = 456;
const ani_int VALL3 = 6U;
const ani_double VALR3 = 4.5;
const ani_double VALR4 = 7.5;
const ani_double VALD1 = 1.5;
const ani_double VALD2 = 2.5;
const ani_int VALD3 = 6U;
const ani_float FLOAT_VAL1 = 1.5F;
const ani_float FLOAT_VAL2 = 2.5F;
const ani_int VALF1 = 6U;


ani_boolean CheckFieldValueLong(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0U;
    const ani_long target = 24L;
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_long setTar = 30L;
    ASSERT_EQ(env->Class_SetStaticField_Long(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 24L);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Long(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 24L);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    ASSERT_EQ(env->Class_GetStaticField_Long(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_long result = 0L;
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field = nullptr;
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Long(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    ani_long single = 0L;
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia1", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia3", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia4", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &single), ANI_INVALID_TYPE);
    ASSERT_EQ(env->Class_FindStaticField(cls, "specia5", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &single), ANI_INVALID_TYPE);
    ani_long max = std::numeric_limits<ani_long>::max();
    ani_long min = std::numeric_limits<ani_long>::min();
    ASSERT_EQ(env->Class_FindStaticField(cls, "min", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, min);
    ASSERT_EQ(env->Class_FindStaticField(cls, "max", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, max);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestLong", &cls), ANI_OK);
    ani_static_field field {};
    const ani_long setTar = 30L;
    const ani_long setTar2 = 10L;
    ASSERT_EQ(env->Class_FindStaticField(cls, "long_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_long result = 0L;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Long(cls, field, setTar2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
        ASSERT_EQ(result, setTar2);
    }
    ASSERT_EQ(env->Class_SetStaticField_Long(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Long(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueLong(env, "entry.src.main.src.ets.ClassOperations.TestLong", "long_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueLong(env, "entry.src.main.src.ets.ClassOperations.TestLongA", "long_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Long_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueLong(env, "entry.src.main.src.ets.ClassOperations.TestLongFinal", "long_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueRef(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8("testString", 10U, &string), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticField_Ref(cls, field, string), ANI_OK);
    ani_ref resultValue;
    ASSERT_EQ(env->Class_GetStaticField_Ref(cls, field, &resultValue), ANI_OK);
    auto name = static_cast<ani_string>(resultValue);
    std::array<char, 11U> buffer {};
    ani_size resSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 4U, buffer.data(), buffer.size(), &resSize), ANI_OK);
    ASSERT_EQ(resSize, 4U);
    ASSERT_STREQ(buffer.data(), "test");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_ref result = nullptr;
    ASSERT_EQ(env->Class_GetStaticField_Ref(cls, field, &result), ANI_OK);
    auto getRes = static_cast<ani_string>(result);
    std::array<char, 11U> buffer {};
    ani_size resSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(getRes, 0U, 10U, buffer.data(), buffer.size(), &resSize), ANI_OK);
    ASSERT_EQ(resSize, 10U);
    ASSERT_STREQ(buffer.data(), "testString");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_ref result = nullptr;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Ref(env, cls, field, &result), ANI_OK);
    auto getRes = static_cast<ani_string>(result);
    std::array<char, 11U> buffer {};
    ani_size resSize = 0U;
    ASSERT_EQ(env->String_GetUTF8SubString(getRes, 0U, 10U, buffer.data(), buffer.size(), &resSize), ANI_OK);
    ASSERT_EQ(resSize, 10U);
    ASSERT_STREQ(buffer.data(), "testString");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_ref result = nullptr;
    ASSERT_EQ(env->Class_GetStaticField_Ref(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_ref result = nullptr;
    ASSERT_EQ(env->Class_GetStaticField_Ref(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_ref result = nullptr;
    ASSERT_EQ(env->Class_GetStaticField_Ref(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Ref(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_static_field field = nullptr;
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_ref result = nullptr;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Ref(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestRef", &cls), ANI_OK);
    ani_static_field field {};
    ani_string string {};
    ASSERT_EQ(env->String_NewUTF8("testString", 10U, &string), ANI_OK);
    ani_string string1 {};
    ASSERT_EQ(env->String_NewUTF8("String", 6U, &string1), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_ref resultValue = nullptr;
    ani_size resSize = 0U;
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Ref(cls, field, string1), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Ref(cls, field, &resultValue), ANI_OK);
        auto name = static_cast<ani_string>(resultValue);
        std::array<char, 30U> buffer {};
        ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 4U, buffer.data(), buffer.size(), &resSize), ANI_OK);
        ASSERT_STREQ(buffer.data(), "Stri");
    }
    ASSERT_EQ(env->Class_SetStaticField_Ref(cls, field, string), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Ref(cls, field, &resultValue), ANI_OK);
    auto name = static_cast<ani_string>(resultValue);
    std::array<char, 30U> buffer {};
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 4U, buffer.data(), buffer.size(), &resSize), ANI_OK);
    ASSERT_STREQ(buffer.data(), "test");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueRef(env, "entry.src.main.src.ets.ClassOperations.TestRef", "string_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueRef(env, "entry.src.main.src.ets.ClassOperations.TestRefA", "string_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Ref_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueRef(env, "entry.src.main.src.ets.ClassOperations.TestRefFinal", "string_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueShort(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0U;
    const ani_short target = 3U;
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_short setTar = 30U;
    ASSERT_EQ(env->Class_SetStaticField_Short(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0U;
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0U;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Short(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 3U);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0U;
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0U;
    ASSERT_EQ(env->Class_GetStaticField_Short(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_short result = 0U;
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_short result = 0U;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Short(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ani_short single;
    const ani_short maxTarget = 32767;
    const ani_short minTarget = -32768;
    ani_static_field field {};

    ASSERT_EQ(env->Class_FindStaticField(cls, "special2", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special3", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special4", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special5", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "shortMax", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, maxTarget);

    ASSERT_EQ(env->Class_FindStaticField(cls, "shortMin", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    const ani_short setTarget = 127U;
    const ani_short setTarget2 = 125U;
    ani_short single;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestShort", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "short_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Short(cls, field, setTarget), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, setTarget);
    }
    ASSERT_EQ(env->Class_SetStaticField_Short(cls, field, setTarget2), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Short(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, setTarget2);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueShort(env, "entry.src.main.src.ets.ClassOperations.TestShort", "short_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueShort(env, "entry.src.main.src.ets.ClassOperations.TestShortA", "short_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Short_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueShort(env, "entry.src.main.src.ets.ClassOperations.TestShortFinal", "short_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueBool(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_TRUE), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(nullptr, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Boolean(nullptr, cls, field, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ani_boolean single = ANI_FALSE;
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "special1", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special3", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special4", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special5", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_INVALID_TYPE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special6", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special7", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_TRUE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special8", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_TRUE);

    ASSERT_EQ(env->Class_FindStaticField(cls, "special9", &field), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    ani_boolean single = ANI_FALSE;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_FALSE), ANI_OK);

    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    ani_boolean single = ANI_FALSE;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestBoolean", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "boolean_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum - 1; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_TRUE), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, ANI_TRUE);
    }
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_FALSE), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueBool(env, "entry.src.main.src.ets.ClassOperations.TestBooleanA", "boolean_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Get_Static_Field_Bool_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueBool(env, "entry.src.main.src.ets.ClassOperations.TestBooleanFinal", "boolean_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Point", &cls), ANI_OK);

    ani_field fieldX;
    ASSERT_EQ(env->Class_FindField(cls, "x", &fieldX), ANI_OK);
    ASSERT_NE(fieldX, nullptr);

    ani_field fieldY;
    ASSERT_EQ(env->Class_FindField(cls, "y", &fieldY), ANI_OK);
    ASSERT_NE(fieldY, nullptr);

    ani_field fieldGetRadius;
    ASSERT_EQ(env->Class_FindField(cls, "getRadius", &fieldGetRadius), ANI_OK);
    ASSERT_NE(fieldGetRadius, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Point", &cls), ANI_OK);

    ani_field fieldZ = nullptr;
    ASSERT_EQ(env->Class_FindField(cls, "z", &fieldZ), ANI_NOT_FOUND);
    ASSERT_EQ(fieldZ, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.ExtendedPoint", &cls), ANI_OK);

    ani_field fieldX;
    ASSERT_EQ(env->Class_FindField(cls, "x", &fieldX), ANI_OK);
    ASSERT_NE(fieldX, nullptr);

    ani_field fieldY;
    ASSERT_EQ(env->Class_FindField(cls, "y", &fieldY), ANI_OK);
    ASSERT_NE(fieldY, nullptr);

    ani_field fieldGetRadius;
    ASSERT_EQ(env->Class_FindField(cls, "getRadius", &fieldGetRadius), ANI_OK);
    ASSERT_NE(fieldGetRadius, nullptr);

    ani_field fieldZ;
    ASSERT_EQ(env->Class_FindField(cls, "z", &fieldZ), ANI_OK);
    ASSERT_NE(fieldZ, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Vector", &cls), ANI_OK);

    ani_field fieldP1;
    ASSERT_EQ(env->Class_FindField(cls, "p1", &fieldP1), ANI_OK);
    ASSERT_NE(fieldP1, nullptr);

    ani_field fieldP2;
    ASSERT_EQ(env->Class_FindField(cls, "p2", &fieldP2), ANI_OK);
    ASSERT_NE(fieldP2, nullptr);

    ani_field fieldLength;
    ASSERT_EQ(env->Class_FindField(cls, "length", &fieldLength), ANI_OK);
    ASSERT_NE(fieldLength, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Circle", &cls), ANI_OK);

    ani_field fieldPoints;
    ASSERT_EQ(env->Class_FindField(cls, "points", &fieldPoints), ANI_OK);
    ASSERT_NE(fieldPoints, nullptr);

    ani_field fieldVectors;
    ASSERT_EQ(env->Class_FindField(cls, "vectors", &fieldVectors), ANI_OK);
    ASSERT_NE(fieldVectors, nullptr);

    ani_field fieldRadius;
    ASSERT_EQ(env->Class_FindField(cls, "radius", &fieldRadius), ANI_OK);
    ASSERT_NE(fieldRadius, nullptr);

    ani_field fieldCenter;
    ASSERT_EQ(env->Class_FindField(cls, "center", &fieldCenter), ANI_OK);
    ASSERT_NE(fieldCenter, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Sphere", &cls), ANI_OK);

    ani_field fieldPoints;
    ASSERT_EQ(env->Class_FindField(cls, "points", &fieldPoints), ANI_OK);
    ASSERT_NE(fieldPoints, nullptr);

    ani_field fieldVectors;
    ASSERT_EQ(env->Class_FindField(cls, "vectors", &fieldVectors), ANI_OK);
    ASSERT_NE(fieldVectors, nullptr);

    ani_field fieldRadius;
    ASSERT_EQ(env->Class_FindField(cls, "radius", &fieldRadius), ANI_OK);
    ASSERT_NE(fieldRadius, nullptr);

    ani_field fieldCenter;
    ASSERT_EQ(env->Class_FindField(cls, "center", &fieldCenter), ANI_OK);
    ASSERT_NE(fieldCenter, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Space", &cls), ANI_OK);

    ani_field fieldObjects;
    ASSERT_EQ(env->Class_FindField(cls, "objects", &fieldObjects), ANI_OK);
    ASSERT_NE(fieldObjects, nullptr);

    ani_field fieldDimension;
    ASSERT_EQ(env->Class_FindField(cls, "dimension", &fieldDimension), ANI_OK);
    ASSERT_NE(fieldDimension, nullptr);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);
    ASSERT_NE(fieldName, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.UniversalFigureHandler", &cls), ANI_OK);

    ani_field fieldFigure;
    ASSERT_EQ(env->Class_FindField(cls, "figure", &fieldFigure), ANI_OK);
    ASSERT_NE(fieldFigure, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.NamedSpaceHandler", &cls), ANI_OK);

    ani_field fieldSpace;
    ASSERT_EQ(env->Class_FindField(cls, "space", &fieldSpace), ANI_OK);
    ASSERT_NE(fieldSpace, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_field field;
    ASSERT_EQ(env->Class_FindField(nullptr, "x", &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Point", &cls), ANI_OK);

    ani_field field;
    ASSERT_EQ(env->Class_FindField(cls, nullptr, &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Field_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Point", &cls), ANI_OK);

    ASSERT_EQ(env->Class_FindField(cls, "x", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Indexable_Getter_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.MyA", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method method;
    ASSERT_EQ(env->Class_FindIndexableGetter(cls, "d:C{entry.src.main.src.ets.ClassOperations.MyA}", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ASSERT_EQ(env->Class_FindIndexableGetter(cls, "d:i", &method), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Indexable_Getter_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.MyA", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method stringSetter;
    ASSERT_EQ(env->Class_FindIndexableSetter(cls, "dC{std.core.String}:", &stringSetter), ANI_OK);
    ASSERT_NE(stringSetter, nullptr);

    ani_method booleanSetter;
    ASSERT_EQ(env->Class_FindIndexableSetter(cls, "dz:", &booleanSetter), ANI_OK);
    ASSERT_NE(booleanSetter, nullptr);
    ASSERT_NE(booleanSetter, stringSetter);

    ani_method intSetter;
    ASSERT_EQ(env->Class_FindIndexableSetter(cls, "ii:", &intSetter), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Indexable_Getter_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method;
    ASSERT_EQ(env->Class_FindIndexableSetter(nullptr, "ii:", &method), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_FindIndexableGetter(nullptr, "ii:", &method), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean GetTestData(ani_env *env, ani_class *clsResult, ani_method *ctorResult)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Singleton", &cls), ANI_OK);

    ani_method ctor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    *clsResult = cls;
    *ctorResult = ctor;
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Iterator_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.Singleton", &cls), ANI_OK);

    ani_method result;
    ASSERT_EQ(env->Class_FindIterator(cls, &result), ANI_OK);

    ASSERT_NE(result, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Iterator_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.ops.Singleton", &cls), ANI_OK);

    ani_method result;
    ASSERT_EQ(env->Class_FindIterator(cls, &result), ANI_OK);

    ASSERT_NE(result, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Iterator_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.ops.Singleton", &cls), ANI_OK);
    ani_method result;
    ASSERT_EQ(env->Class_FindIterator(nullptr, &result), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_FindIterator(cls, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Method_In_Module_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    const ani_int VAL1 = 2;
    const ani_int VAL2 = 3;
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.nsa.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(cls, "func", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(cls, ctor, &object), ANI_OK);
    ani_value args[2];  // NOLINT(modernize-avoid-c-arrays)
    args[0].i = VAL1;
    args[1].i = VAL2;

    ani_int res = 0;
    // Call the method and verify the return value.
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &res, args), ANI_OK);
    ASSERT_EQ(res, VAL1 + VAL2);
    return ANI_TRUE;
}

template <bool METHOD_IS_PRESENT>
ani_boolean CheckClassFindSetter(ani_env *env, const char *clsName, const char *propertyName)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method method;
    auto status = env->Class_FindSetter(cls, propertyName, &method);
    if constexpr (METHOD_IS_PRESENT) {
        ASSERT_EQ(status, ANI_OK);
        ASSERT_NE(method, nullptr);
    } else {
        ASSERT_EQ(status, ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

template <bool METHOD_IS_PRESENT>
ani_boolean CheckClassFindGetter(ani_env *env, const char *clsName, const char *propertyName)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method method;
    auto status = env->Class_FindGetter(cls, propertyName, &method);
    if constexpr (METHOD_IS_PRESENT) {
        ASSERT_EQ(status, ANI_OK);
        ASSERT_NE(method, nullptr);
    } else {
        ASSERT_EQ(status, ANI_NOT_FOUND);
    }
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Setter_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    CheckClassFindSetter<true>(env, "entry.src.main.src.ets.ClassOperations.ExplicitMethods", "age");
    CheckClassFindSetter<true>(env, "entry.src.main.src.ets.ClassOperations.StyledRectangle", "color");
    CheckClassFindSetter<true>(env, "entry.src.main.src.ets.ClassOperations.OnlySet", "field");
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Setter_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    CheckClassFindGetter<true>(env, "entry.src.main.src.ets.ClassOperations.ExplicitMethods", "age");
    CheckClassFindGetter<true>(env, "entry.src.main.src.ets.ClassOperations.StyledRectangle", "color");
    CheckClassFindGetter<true>(env, "entry.src.main.src.ets.ClassOperations.OnlyGet", "field");
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Setter_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    CheckClassFindSetter<false>(env, "entry.src.main.src.ets.ClassOperations.ImplicitMethods", "field");
    CheckClassFindSetter<false>(env, "entry.src.main.src.ets.ClassOperations.OnlyGet", "field");
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Setter_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    CheckClassFindGetter<false>(env, "entry.src.main.src.ets.ClassOperations.ImplicitMethods", "field");
    CheckClassFindGetter<false>(env, "entry.src.main.src.ets.ClassOperations.OnlySet", "field");
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Setter_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_method method;
    ASSERT_EQ(env->Class_FindSetter(nullptr, "field", &method), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Class_FindGetter(nullptr, "field", &method), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Static_Field_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.SingletonTwo", &cls), ANI_OK);

    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "instance", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Static_Field_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(nullptr, "instance", &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Static_Field_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.SingletonTwo", &cls), ANI_OK);

    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, nullptr, &field), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Find_Static_Field_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.SingletonTwo", &cls), ANI_OK);

    ASSERT_EQ(env->Class_FindStaticField(cls, "instance", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean CheckFieldValueSetBool(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_TRUE), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "bool_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_TRUE), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "bool_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Boolean(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(env->c_api->Class_SetStaticField_Boolean(env, cls, field, ANI_TRUE), ANI_OK);
    ASSERT_EQ(env->c_api->Class_GetStaticField_Boolean(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_TRUE), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "bool_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &result), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(nullptr, field, ANI_TRUE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, nullptr, ANI_TRUE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "bool_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->c_api->Class_SetStaticField_Boolean(nullptr, cls, field, ANI_TRUE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    ani_boolean single;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "bool_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ani_boolean(0)), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);

    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ani_boolean(NULL)), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);

    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ani_boolean(!'s')), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);

    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ani_boolean(!0)), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_TRUE);

    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, true), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_TRUE);

    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, false), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    ani_boolean single;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetBoolean", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "bool_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_FALSE), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, ANI_FALSE);
    }
    ASSERT_EQ(env->Class_SetStaticField_Boolean(cls, field, ANI_TRUE), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Boolean(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetBool(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Boolean(cls, fieldName, ANI_TRUE), ANI_OK);
    ani_boolean resultValue = ANI_FALSE;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Boolean(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetBool(env, "entry.src.main.src.ets.ClassOperations.TestSetBoolean", "bool_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetBool(env, "entry.src.main.src.ets.ClassOperations.TestSetBooleanA", "bool_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Bool_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetBool(env, "entry.src.main.src.ets.ClassOperations.TestSetBooleanFinal", "bool_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueSetByte(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0U;
    const ani_byte target = 126;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0U;
    const ani_byte target = 126;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0U;
    const ani_byte target = 126;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Byte(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->c_api->Class_SetStaticField_Byte(env, cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->c_api->Class_GetStaticField_Byte(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->c_api->Class_SetStaticField_Byte(env, cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTar), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte result = 0U;
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &result), ANI_OK);
    const ani_byte target = 126;
    ASSERT_EQ(result, target);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->Class_SetStaticField_Byte(nullptr, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, nullptr, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    ani_static_field field;
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const ani_byte setTar = 127;
    ASSERT_EQ(env->c_api->Class_SetStaticField_Byte(nullptr, cls, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_byte single = 0U;
    ani_byte maxValue = std::numeric_limits<ani_byte>::max();
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, maxValue), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, maxValue);

    ani_byte minValue = std::numeric_limits<ani_byte>::min();
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, minValue), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    const ani_byte setTarget = 127;
    const ani_byte setTarget2 = 125;
    ani_byte single = 0U;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetByte", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "byte_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTarget), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, setTarget);
    }
    ASSERT_EQ(env->Class_SetStaticField_Byte(cls, field, setTarget2), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Byte(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, setTarget2);
    return ANI_TRUE;
}

ani_boolean CheckFieldValueGetByte(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    const ani_byte setTarget = 2U;
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ASSERT_EQ(env->Class_SetStaticFieldByName_Byte(cls, fieldName, setTarget), ANI_OK);
    ani_byte resultValue = 1U;
    ASSERT_EQ(env->Class_GetStaticFieldByName_Byte(cls, fieldName, &resultValue), ANI_OK);
    ASSERT_EQ(resultValue, setTarget);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetByte(env, "entry.src.main.src.ets.ClassOperations.TestSetByte", "byte_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetByte(env, "entry.src.main.src.ets.ClassOperations.TestSetByteA", "byte_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Byte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueGetByte(env, "entry.src.main.src.ets.ClassOperations.TestSetByteFinal", "byte_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueSetChar(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    const ani_char target = 'a';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_char setTar = 'b';
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    const ani_char target = 'a';
    ASSERT_EQ(result, target);
    const ani_char setTar = 'c';
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    ASSERT_EQ(env->c_api->Class_GetStaticField_Char(env, cls, field, &result), ANI_OK);
    const ani_char target = 'a';
    ASSERT_EQ(result, target);
    const ani_char setTar = 'c';
    ASSERT_EQ(env->c_api->Class_SetStaticField_Char(env, cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->c_api->Class_GetStaticField_Char(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->c_api->Class_SetStaticField_Char(env, cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const ani_char setTar = 'c';
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTar), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char result = '\0';
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &result), ANI_OK);
    const ani_char target = 'a';
    ASSERT_EQ(result, target);
    const ani_char setTar = 'c';
    ASSERT_EQ(env->Class_SetStaticField_Char(nullptr, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    const ani_char setTar = 'c';
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, nullptr, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const ani_char setTar = 'c';
    ASSERT_EQ(env->c_api->Class_SetStaticField_Char(nullptr, cls, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_char single = 'c';
    ani_char maxValue = std::numeric_limits<ani_char>::max();
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, maxValue), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, maxValue);

    ani_char minValue = std::numeric_limits<ani_char>::min();
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, minValue), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minValue);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_field field {};
    const ani_char setTarget = 'c';
    const ani_char setTarget2 = 'b';
    ani_char single = '\0';
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetChar", &cls), ANI_OK);
    ASSERT_EQ(env->Class_FindStaticField(cls, "char_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const int32_t loopNum = 3;
    for (int32_t i = 0; i < loopNum - 1; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTarget), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
        ASSERT_EQ(single, setTarget);
    }
    ASSERT_EQ(env->Class_SetStaticField_Char(cls, field, setTarget2), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Char(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, setTarget2);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueSetChar(env, "entry.src.main.src.ets.ClassOperations.TestSetChar", "char_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueSetChar(env, "entry.src.main.src.ets.ClassOperations.TestSetCharA", "char_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueSetChar(env, "entry.src.main.src.ets.ClassOperations.TestSetCharFinal", "char_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueSetDouble(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0U;
    const ani_double target = 18.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_double setTar = 20.0;
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    const ani_double target = 18.0;
    ASSERT_EQ(result, target);
    const ani_double setTar = 28.0;
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Double(env, cls, field, &result), ANI_OK);
    const ani_double target = 18.0;
    ASSERT_EQ(result, target);
    const ani_double setTar = 28.0;
    ASSERT_EQ(env->c_api->Class_SetStaticField_Double(env, cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->c_api->Class_GetStaticField_Double(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->c_api->Class_SetStaticField_Double(env, cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const ani_double setTar = 28.0;
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    const ani_double target = 18.0;
    ASSERT_EQ(result, target);
    const ani_double setTar = 28.0;
    ASSERT_EQ(env->Class_SetStaticField_Double(nullptr, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    const ani_double setTar = 28.0;
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, nullptr, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    ani_static_field field = nullptr;
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const ani_double setTar = 28.0;
    ASSERT_EQ(env->c_api->Class_SetStaticField_Double(nullptr, cls, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double single = 0.0;
    ani_double max = std::numeric_limits<ani_double>::max();
    ani_double minpositive = std::numeric_limits<ani_double>::min();
    ani_double min = -std::numeric_limits<ani_double>::max();

    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, max), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, max);

    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, minpositive), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minpositive);

    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, min), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, min);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetDouble", &cls), ANI_OK);
    ani_static_field field {};
    const ani_double setTar = 28.0;
    const ani_double setTar2 = 18.0;
    ASSERT_EQ(env->Class_FindStaticField(cls, "double_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_double result = 0.0;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
        ASSERT_EQ(result, setTar2);
    }
    ASSERT_EQ(env->Class_SetStaticField_Double(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Double(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueSetDouble(env, "entry.src.main.src.ets.ClassOperations.TestSetDoubleA", "double_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Double_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueSetDouble(env, "entry.src.main.src.ets.ClassOperations.TestSetDoubleFinal", "double_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueSetFloat(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0U;
    const ani_float target = 18.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_float setTar = 20.0F;
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    const ani_float target = 18.0F;
    ASSERT_EQ(result, target);
    const ani_float setTar = 28.0F;
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    ASSERT_EQ(env->c_api->Class_GetStaticField_Float(env, cls, field, &result), ANI_OK);
    const ani_float target = 18.0F;
    ASSERT_EQ(result, target);
    const ani_float setTar = 28.0F;
    ASSERT_EQ(env->c_api->Class_SetStaticField_Float(env, cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->c_api->Class_GetStaticField_Float(env, cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    ASSERT_EQ(env->c_api->Class_SetStaticField_Float(env, cls, field, target), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "string_value", &field), ANI_OK);
    const ani_float setTar = 28.0F;
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    const ani_float target = 18.0F;
    ASSERT_EQ(result, target);
    const ani_float setTar = 28.0F;
    ASSERT_EQ(env->Class_SetStaticField_Float(nullptr, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    const ani_float setTar = 28.0F;
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, nullptr, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    ani_static_field field = nullptr;
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    const ani_float setTar = 28.0F;
    ASSERT_EQ(env->c_api->Class_SetStaticField_Float(nullptr, cls, field, setTar), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float single = 0.0F;
    ani_float max = std::numeric_limits<ani_float>::max();
    ani_float minpositive = std::numeric_limits<ani_float>::min();
    ani_float min = -std::numeric_limits<ani_float>::max();

    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, max), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, max);

    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, minpositive), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, minpositive);

    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, min), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &single), ANI_OK);
    ASSERT_EQ(single, min);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetFloat", &cls), ANI_OK);
    ani_static_field field {};
    const ani_float setTar = 28.0F;
    const ani_float setTar2 = 18.0F;
    ASSERT_EQ(env->Class_FindStaticField(cls, "float_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_float result = 0.0F;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar2), ANI_OK);
        ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
        ASSERT_EQ(result, setTar2);
    }
    ASSERT_EQ(env->Class_SetStaticField_Float(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Float(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueSetFloat(env, "entry.src.main.src.ets.ClassOperations.TestSetFloatA", "float_value");
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Float_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    CheckFieldValueSetFloat(env, "entry.src.main.src.ets.ClassOperations.TestSetFloatFinal", "float_value");
    return ANI_TRUE;
}

ani_boolean CheckFieldValueSetInt(ani_env *env, const char *className, const char *fieldName)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, fieldName, &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0U;
    const ani_int target = 3U;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, target);
    const ani_int setTar = 2U;
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, setTar), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, setTar);
    return ANI_TRUE;
}

ani_boolean test_Class_Set_Static_Field_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperations.TestSetInt", &cls), ANI_OK);
    ani_static_field field {};
    ASSERT_EQ(env->Class_FindStaticField(cls, "int_value", &field), ANI_OK);
    ASSERT_NE(field, nullptr);
    ani_int result = 0;
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    const ani_int target = 3U;
    ASSERT_EQ(result, target);
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, 1024U), ANI_OK);
    ASSERT_EQ(env->Class_GetStaticField_Int(cls, field, &result), ANI_OK);
    ASSERT_EQ(result, 1024U);
    ASSERT_EQ(env->Class_SetStaticField_Int(cls, field, target), ANI_OK);
    return ANI_TRUE;
}


#endif // ARKTS_ANI_TEST_CLASSOPERATIONS_H