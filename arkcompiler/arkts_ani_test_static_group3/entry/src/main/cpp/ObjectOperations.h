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

#ifndef ARKTS_ANI_TEST_OBJECTOPERATIONS_H
#define ARKTS_ANI_TEST_OBJECTOPERATIONS_H
#include "Common.h"

typedef struct 	ParamObjA {
    const char *className;
    const char *newClassName;
    const char *signature;
} ParamObjA;

// NOLINTBEGIN(cppcoreguidelines-pro-type-vararg)
template <typename R, typename... Args>
ani_int DoCallFunctionV(ani_env *env, std::optional<R> *result, ani_function fn, Args &&...args)
{
    std::conditional_t<std::is_same_v<R, void>, std::nullopt_t, R> value {};
    ani_status status;

    if constexpr (std::is_same_v<R, ani_boolean>) {
        status = env->Function_Call_Boolean(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_byte>) {
        status = env->Function_Call_Byte(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_char>) {
        status = env->Function_Call_Char(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_short>) {
        status = env->Function_Call_Short(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_int>) {
        status = env->Function_Call_Int(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_long>) {
        status = env->Function_Call_Long(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_float>) {
        status = env->Function_Call_Float(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_double>) {
        status = env->Function_Call_Double(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, void>) {
        status = env->Function_Call_Void(fn, std::forward<Args>(args)...);
        value = std::nullopt;
    } else if constexpr (std::is_same_v<R, ani_ref> || std::is_same_v<R, ani_tuple_value> ||
        std::is_same_v<R, ani_object>) {
        ani_ref resultRef {};
        status = env->Function_Call_Ref(fn, &resultRef, std::forward<Args>(args)...);
        value = static_cast<R>(resultRef);
    } else {
        enum { INCORRECT_TEMPLATE_TYPE = false };
        static_assert(INCORRECT_TEMPLATE_TYPE, "Incorrect template type");
    }

    if (status == ANI_PENDING_ERROR) {
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    ASSERT_EQ(status, ANI_OK);

    result->emplace(value);
    return ANI_TRUE;
}
// NOLINTEND(cppcoreguidelines-pro-type-vararg)

template <typename R, typename... Args>
ani_int CallEtsFunctionImplV(ani_env *env, std::optional<R> *result, const std::string &moduleDescriptor,
                             const std::string &fnName, Args &&...args)
{
    ani_module mod {};
    ASSERT_EQ(env->FindModule(moduleDescriptor.c_str(), &mod), ANI_OK);
    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(mod, fnName.c_str(), nullptr, &fn), ANI_OK);
    ASSERT_EQ(DoCallFunctionV(env, result, fn, std::forward<Args>(args)...), ANI_TRUE);
    return ANI_TRUE;
}

/// Call function with name `fnName` from module denoted by `moduleDescriptor`
template <typename R, typename... Args>
R CallEtsFunctionV(ani_env *env, const std::string &moduleName, const std::string &fnName, Args &&...args)
{
    std::optional<R> result;
    //auto moduleDescriptor = "L" + moduleName + ";";
    CallEtsFunctionImplV(env, &result, moduleName, fnName, std::forward<Args>(args)...);
    if constexpr (!std::is_same_v<R, void>) {
        return result.value();
    }
}

ani_int GetTestDataFieldRef(ani_env *env,
                            ani_object *objectResult,
                            ani_field *fieldNameResult,
                            ani_field *fieldAgeResult)
{
    auto bobRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newBobObject");
    auto bob = static_cast<ani_object>(bobRef);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Man", &cls), ANI_OK);

    ani_field fieldName;
    ASSERT_EQ(env->Class_FindField(cls, "name", &fieldName), ANI_OK);

    ani_field fieldAge;
    ASSERT_EQ(env->Class_FindField(cls, "age", &fieldAge), ANI_OK);

    *objectResult = bob;
    *fieldNameResult = fieldName;
    *fieldAgeResult = fieldAge;
    return ANI_TRUE;
}

ani_status TestFuncV(ani_env *env, ani_class cls, ani_method method, ani_object *result,
                     ...)
{
    va_list args {};
    va_start(args, result);
    ani_status aniResult = ANI_ERROR;
    aniResult = env->c_api->Object_New_V(env, cls, method, result, args);
    va_end(args);
    return aniResult;
}

ani_int GetTestString(ani_env *env, ani_string *tag)
{
    const char model[] = "Pure P60";
    ASSERT_EQ(env->String_NewUTF8(model, strlen(model), tag), ANI_OK);
    ASSERT_NE(*tag, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Ref_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object bob {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFieldRef(env, &bob, &field, &fieldAge);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetField_Ref(bob, field, &nameRef), ANI_OK);

    auto name = static_cast<ani_string>(nameRef);
    std::array<char, 6U> buffer {};
    ani_size nameSize = 0;
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 3U, buffer.data(), buffer.size(), &nameSize), ANI_OK);
    ASSERT_EQ(nameSize, 3U);
    ASSERT_STREQ(buffer.data(), "Bob");
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object bob {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFieldRef(env, &bob, &field, &fieldAge);

    ani_ref nameRef {};
    ASSERT_EQ(env->c_api->Object_GetField_Ref(nullptr, bob, field, &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object bob {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFieldRef(env, &bob, &field, &fieldAge);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetField_Ref(bob, fieldAge, &nameRef), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object bob {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFieldRef(env, &bob, &field, &fieldAge);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetField_Ref(nullptr, field, &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object bob {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFieldRef(env, &bob, &field, &fieldAge);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetField_Ref(bob, nullptr, &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object bob {};
    ani_field field {};
    ani_field fieldAge {};
    GetTestDataFieldRef(env, &bob, &field, &fieldAge);

    ASSERT_EQ(env->Object_GetField_Ref(bob, field, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalBoolean(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject2");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Boolean_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalBoolean(env);

    ani_boolean mammal = ANI_FALSE;
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(animal, "mammal", &mammal), ANI_OK);
    ASSERT_EQ(mammal, true);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalBoolean(env);

    ani_boolean mammal = ANI_FALSE;
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Boolean(nullptr, animal, "mammal", &mammal), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalBoolean(env);

    ani_boolean mammal = ANI_FALSE;
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(animal, "x", &mammal), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(animal, "", &mammal), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalBoolean(env);

    ani_boolean mammal = ANI_FALSE;
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(animal, "name", &mammal), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean mammal = ANI_FALSE;
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(nullptr, "mammal", &mammal), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalBoolean(env);

    ani_boolean mammal = ANI_FALSE;
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(animal, nullptr, &mammal), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Boolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalBoolean(env);

    ASSERT_EQ(env->Object_GetFieldByName_Boolean(animal, "mammal", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalByte(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject3");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalByte(env);

    ani_byte age = 0;
    ASSERT_EQ(env->Object_GetFieldByName_Byte(animal, "age", &age), ANI_OK);
    ASSERT_EQ(age, 2U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalByte(env);

    ani_byte age = 0;
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Byte(nullptr, animal, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalByte(env);

    ani_byte age = 0;
    ASSERT_EQ(env->Object_GetFieldByName_Byte(animal, "x", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Byte(animal, "", &age), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalByte(env);

    ani_byte age = 0;
    ASSERT_EQ(env->Object_GetFieldByName_Byte(animal, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_byte age = 0;
    ASSERT_EQ(env->Object_GetFieldByName_Byte(nullptr, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalByte(env);

    ani_byte age = 0;
    ASSERT_EQ(env->Object_GetFieldByName_Byte(animal, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalByte(env);

    ASSERT_EQ(env->Object_GetFieldByName_Byte(animal, "age", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalChar(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject4");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalChar(env);

    ani_char index = '\0';
    ani_char xx = 'a';
    ASSERT_EQ(env->Object_GetFieldByName_Char(animal, "index", &index), ANI_OK);
    ASSERT_EQ(index, xx);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalChar(env);

    ani_char index = '\0';
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Char(nullptr, animal, "index", &index), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalChar(env);

    ani_char index = '\0';
    ASSERT_EQ(env->Object_GetFieldByName_Char(animal, "x", &index), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Char(animal, "", &index), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalChar(env);

    ani_char index = '\0';
    ASSERT_EQ(env->Object_GetFieldByName_Char(animal, "name", &index), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char index = '\0';
    ASSERT_EQ(env->Object_GetFieldByName_Char(nullptr, "index", &index), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalChar(env);

    ani_char index = '\0';
    ASSERT_EQ(env->Object_GetFieldByName_Char(animal, nullptr, &index), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalChar(env);

    ASSERT_EQ(env->Object_GetFieldByName_Char(animal, "index", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalDouble(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject5");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalDouble(env);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Double(animal, "age", &age), ANI_OK);
    ASSERT_EQ(age, 2.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalDouble(env);

    ani_double age = 0.0F;
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Double(nullptr, animal, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalDouble(env);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Double(animal, "x", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Double(animal, "", &age), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalDouble(env);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Double(animal, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Double(nullptr, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalDouble(env);

    ani_double age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Double(animal, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalDouble(env);

    ASSERT_EQ(env->Object_GetFieldByName_Double(animal, "age", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalFloat(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject6");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalFloat(env);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Float(animal, "age", &age), ANI_OK);
    ASSERT_EQ(age, 2.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalFloat(env);

    ani_float age = 0.0F;
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Float(nullptr, animal, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalFloat(env);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Float(animal, "x", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Float(animal, "", &age), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalFloat(env);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Float(animal, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Float(nullptr, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalFloat(env);

    ani_float age = 0.0F;
    ASSERT_EQ(env->Object_GetFieldByName_Float(animal, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalFloat(env);

    ASSERT_EQ(env->Object_GetFieldByName_Float(animal, "age", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalInt(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject7");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Int(animal, "age", &age), ANI_OK);
    ASSERT_EQ(age, 2U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_int age = 0U;
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Int(nullptr, animal, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Int(animal, "x", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Int(animal, "", &age), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Int(animal, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Int(nullptr, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_int age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Int(animal, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ASSERT_EQ(env->Object_GetFieldByName_Int(animal, "age", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalLong(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject8");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalLong(env);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetFieldByName_Long(animal, "age", &age), ANI_OK);
    ASSERT_EQ(age, 2L);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalLong(env);

    ani_long age = 0L;
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Long(nullptr, animal, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalLong(env);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetFieldByName_Long(animal, "x", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Long(animal, "", &age), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalLong(env);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetFieldByName_Long(animal, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetFieldByName_Long(nullptr, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalLong(env);

    ani_long age = 0L;
    ASSERT_EQ(env->Object_GetFieldByName_Long(animal, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalLong(env);

    ASSERT_EQ(env->Object_GetFieldByName_Long(animal, "age", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Ref_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(animal, "name", &nameRef), ANI_OK);

    auto name = static_cast<ani_string>(nameRef);
    std::array<char, 6U> buffer {};
    ani_size nameSize = 0;
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 3U, buffer.data(), buffer.size(), &nameSize), ANI_OK);
    ASSERT_EQ(nameSize, 3U);
    ASSERT_STREQ(buffer.data(), "Cat");
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Ref(nullptr, animal, "name", &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(animal, "x", &nameRef), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Ref(animal, "", &nameRef), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(animal, "age", &nameRef), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(nullptr, "x", &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(animal, nullptr, &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalInt(env);

    ASSERT_EQ(env->Object_GetFieldByName_Ref(animal, "x", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewAnimalShort(ani_env *env)
{
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject9");
    return static_cast<ani_object>(animalRef);
}

ani_int test_Object_Get_Field_By_Name_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalShort(env);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Short(animal, "age", &age), ANI_OK);
    ASSERT_EQ(age, 2U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalShort(env);

    ani_short age = 0U;
    ASSERT_EQ(env->c_api->Object_GetFieldByName_Short(nullptr, animal, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalShort(env);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Short(animal, "x", &age), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetFieldByName_Short(animal, "", &age), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalShort(env);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Short(animal, "name", &age), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Short(nullptr, "age", &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalShort(env);

    ani_short age = 0U;
    ASSERT_EQ(env->Object_GetFieldByName_Short(animal, nullptr, &age), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Field_By_Name_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object animal = NewAnimalShort(env);

    ASSERT_EQ(env->Object_GetFieldByName_Short(animal, "age", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_object NewCarBoolean(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Boolean_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarBoolean(env);

    ani_boolean highPerformance = ANI_FALSE;
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, "highPerformance", &highPerformance), ANI_OK);
    ASSERT_EQ(highPerformance, true);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarBoolean(env);

    ani_boolean ecoFriendly = ANI_FALSE;
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, "ecoFriendly", &ecoFriendly), ANI_OK);
    ASSERT_EQ(ecoFriendly, false);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarBoolean(env);

    ani_boolean highPerformance = ANI_FALSE;
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Boolean(nullptr, car, "ecoFriendly", &highPerformance),
              ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarBoolean(env);

    ani_boolean highPerformance = ANI_FALSE;
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, "ecoFriendlyA", &highPerformance), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, "", &highPerformance), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarBoolean(env);

    ani_boolean highPerformance = ANI_FALSE;
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(nullptr, "highPerformance", &highPerformance), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, nullptr, &highPerformance), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, "highPerformance", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarBoolean(env);

    ani_boolean manufacturer = ANI_FALSE;
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Boolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarBoolean(env);

    ani_boolean model = ANI_FALSE;
    ASSERT_EQ(env->Object_GetPropertyByName_Boolean(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewCarByte(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject2");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarByte(env);

    ani_byte carAge {};
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, "carAge", &carAge), ANI_OK);
    ASSERT_EQ(carAge, 61U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarByte(env);

    ani_byte price {};
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, "price", &price), ANI_OK);
    ASSERT_EQ(price, 100U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarByte(env);

    ani_byte type {};
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Byte(nullptr, car, "price", &type), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarByte(env);

    ani_byte model {};
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, "priceA", &model), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, "", &model), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarByte(env);

    ani_byte carAge {};
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(nullptr, "carAge", &carAge), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, nullptr, &carAge), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, "carAge", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarByte(env);

    ani_byte manufacturer {};
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarByte(env);

    ani_byte model {};
    ASSERT_EQ(env->Object_GetPropertyByName_Byte(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewCarChar(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject3");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ani_char type = '\0';
    ani_char typee = 'a';
    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, "type", &type), ANI_OK);
    ASSERT_EQ(type, typee);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ani_char band = '\0';
    ani_char bandd = 'z';
    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, "band", &band), ANI_OK);
    ASSERT_EQ(band, bandd);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ani_char type = '\0';
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Char(nullptr, car, "band", &type), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ani_char model = '\0';
    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, "bandA", &model), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, "", &model), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char type = '\0';
    ASSERT_EQ(env->Object_GetPropertyByName_Char(nullptr, "type", &type), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ani_char type = '\0';
    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, nullptr, &type), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, "type", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ani_char manufacturer = '\0';
    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarChar(env);

    ani_char model = '\0';
    ASSERT_EQ(env->Object_GetPropertyByName_Char(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewCarDouble(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject4");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarDouble(env);

    ani_double length = 0.0;
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, "length", &length), ANI_OK);
    ASSERT_EQ(length, 4275.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarDouble(env);

    ani_double year = 0.0;
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, "year", &year), ANI_OK);
    ASSERT_EQ(year, 1989.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarDouble(env);

    ani_double year = 0.0;
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Double(nullptr, car, "year", &year), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarDouble(env);

    ani_double year = 0.0;
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, "yearA", &year), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, "", &year), ANI_NOT_FOUND);
    return ANI_TRUE;
}

