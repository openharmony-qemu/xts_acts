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
    ASSERT_EQ(env->Object_GetPropertyByName_Char(nullptr, "type", &type), ANI_INVALID_ARGS);return ANI_TRUE;
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

ani_int test_Object_Get_Property_By_Name_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarDouble(env);

    ani_double length = 0.0;
    ASSERT_EQ(env->Object_GetPropertyByName_Double(nullptr, "length", &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, nullptr, &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, "length", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarDouble(env);

    ani_double manufacturer = 0.0;
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarDouble(env);

    ani_double model = 0.0;
    ASSERT_EQ(env->Object_GetPropertyByName_Double(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewCarFloat(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject5");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarFloat(env);

    ani_float length = 0.0F;
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, "length", &length), ANI_OK);
    ASSERT_EQ(length, 4275.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarFloat(env);

    ani_float year = 0.0F;
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, "year", &year), ANI_OK);
    ASSERT_EQ(year, 1989.0F);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarFloat(env);

    ani_float year = 0.0F;
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Float(nullptr, car, "year", &year), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarFloat(env);

    ani_float year = 0.0F;
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, "yearA", &year), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, "", &year), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarFloat(env);

    ani_float length = 0.0F;
    ASSERT_EQ(env->Object_GetPropertyByName_Float(nullptr, "length", &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, nullptr, &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, "length", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarFloat(env);

    ani_float manufacturer = 0.0F;
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarFloat(env);

    ani_float model = 0.0F;
    ASSERT_EQ(env->Object_GetPropertyByName_Float(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewCarInt(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject6");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ani_int length = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, "length", &length), ANI_OK);
    ASSERT_EQ(length, 4275U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ani_int year = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, "year", &year), ANI_OK);
    ASSERT_EQ(year, 1989U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ani_int length = 0U;
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Int(nullptr, car, "year", &length), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ani_int length = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, "yearA", &length), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, "", &length), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int length = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(nullptr, "length", &length), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ani_int length = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, nullptr, &length), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, "length", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ani_int manufacturer = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarInt(env);

    ani_int model = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Int(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewCarLong(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject7");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarLong(env);

    ani_long length = 0L;
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, "length", &length), ANI_OK);
    ASSERT_EQ(length, 4275L);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarLong(env);

    ani_long year = 0L;
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, "year", &year), ANI_OK);
    ASSERT_EQ(year, 1989L);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarLong(env);

    ani_long year = 0L;
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Long(nullptr, car, "year", &year), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarLong(env);

    ani_long year = 0L;
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, "yearA", &year), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, "", &year), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarLong(env);

    ani_long length = 0L;
    ASSERT_EQ(env->Object_GetPropertyByName_Long(nullptr, "length", &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, nullptr, &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, "length", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarLong(env);

    ani_long manufacturer = 0L;
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarLong(env);

    ani_long model = 0L;
    ASSERT_EQ(env->Object_GetPropertyByName_Long(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewPersonRef(ani_env *env)
{
    auto personRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newPersonObject");
    return static_cast<ani_object>(personRef);
}

ani_int test_Object_Get_Property_By_Name_Ref_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, "name", &nameRef), ANI_OK);

    auto name = static_cast<ani_string>(nameRef);
    std::array<char, 6U> buffer {};
    ani_size nameSize = 0;
    ASSERT_EQ(env->String_GetUTF8SubString(name, 0U, 3U, buffer.data(), buffer.size(), &nameSize), ANI_OK);
    ASSERT_EQ(nameSize, 3U);
    ASSERT_STREQ(buffer.data(), "Max");
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ani_ref surnameRef {};
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, "surname", &surnameRef), ANI_OK);

    auto surname = static_cast<ani_string>(surnameRef);
    std::array<char, 6U> buffer {};
    ani_size surnameSize = 0;
    ASSERT_EQ(env->String_GetUTF8SubString(surname, 0U, 4U, buffer.data(), buffer.size(), &surnameSize), ANI_OK);
    ASSERT_EQ(surnameSize, 4U);
    ASSERT_STREQ(buffer.data(), "Pain");
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ani_ref surnameRef {};
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Ref(nullptr, person, "surname", &surnameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ani_ref surnameRef {};
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, "surnameA", &surnameRef), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, "", &surnameRef), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(nullptr, "name", &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, nullptr, &nameRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, "name", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, "age", &nameRef), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Ref_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object person = NewPersonRef(env);

    ani_ref nameRef {};
    ASSERT_EQ(env->Object_GetPropertyByName_Ref(person, "realAge", &nameRef), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_object NewCarShort(ani_env *env)
{
    auto carRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newCarObject8");
    return static_cast<ani_object>(carRef);
}

ani_int test_Object_Get_Property_By_Name_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarShort(env);

    ani_short length = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, "length", &length), ANI_OK);
    ASSERT_EQ(length, 4275U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarShort(env);

    ani_short year = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, "year", &year), ANI_OK);
    ASSERT_EQ(year, 1989U);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarShort(env);

    ani_short length = 0U;
    ASSERT_EQ(env->c_api->Object_GetPropertyByName_Short(nullptr, car, "year", &length), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarShort(env);

    ani_short length = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, "yearA", &length), ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, "", &length), ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarShort(env);

    ani_short length = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Short(nullptr, "length", &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, nullptr, &length), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, "length", nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarShort(env);

    ani_short manufacturer;
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, "manufacturer", &manufacturer), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Property_By_Name_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object car = NewCarShort(env);

    ani_short model = 0U;
    ASSERT_EQ(env->Object_GetPropertyByName_Short(car, "model", &model), ANI_INVALID_TYPE);
    return ANI_TRUE;
}

ani_int GetMethodDataA(ani_env *env, ani_object *objectResult, ani_class *classResult, ParamObjA* param)
{
	ani_class cls {};
	// Locate the class in the environment.
	ASSERT_EQ(env->FindClass(param->className, &cls), ANI_OK);
	ASSERT_NE(cls, nullptr);

	// Emulate allocation an instance of class.
	ani_static_method newMethod {};
	// NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
	ASSERT_EQ(env->Class_FindStaticMethod(cls, param->newClassName, param->signature, &newMethod), ANI_OK);
	ani_ref ref {};
	// NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
	ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);

	*objectResult = static_cast<ani_object>(ref);
	*classResult = cls;
    return ANI_TRUE;
}

ani_int test_Object_Get_Type_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class classA {};
    ani_object objectA {};
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.newClassName = "new_A";
    paramObjOperation.signature = ":C{entry.src.main.src.ets.ObjectOperations.A}";
    GetMethodDataA(env, &objectA, &classA, &paramObjOperation);

    ani_type type {};
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_GetType(objectA, &type), ANI_OK);
    ASSERT_EQ(env->Object_InstanceOf(objectA, type, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Type_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    auto status = env->String_NewUTF8("a", 1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_type type {};
    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_GetType(result, &type), ANI_OK);
    ASSERT_EQ(env->Object_InstanceOf(result, type, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Get_Type_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    auto status = env->String_NewUTF8("a", 1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ASSERT_EQ(env->Object_GetType(result, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env->Object_GetType(nullptr, nullptr), ANI_INVALID_ARGS);
    ani_type type {};
    ASSERT_EQ(env->c_api->Object_GetType(nullptr, result, &type), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Type_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object objectA)
{
    ani_object object = nullptr;
    ani_type type {};
    ASSERT_EQ(env->Object_GetType(object, &type), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Get_Type_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t loopCount = 3;
    ani_class classA {};
    ani_object objectA {};
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.newClassName = "new_A";
    paramObjOperation.signature = ":C{entry.src.main.src.ets.ObjectOperations.A}";
    GetMethodDataA(env, &objectA, &classA, &paramObjOperation);

    ani_type type {};
    ani_boolean res = ANI_FALSE;
    for (int32_t i = 0; i < loopCount; i++) {
        ASSERT_EQ(env->Object_GetType(objectA, &type), ANI_OK);
        ASSERT_EQ(env->Object_InstanceOf(objectA, type, &res), ANI_OK);
        ASSERT_EQ(res, ANI_TRUE);
    }
    return ANI_TRUE;
}

ani_int test_Object_Get_Type_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enmColor {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.ObjectOperations.ToFind", &enmColor), ANI_OK);
    ani_enum_item itemRed {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(enmColor, "RED", &itemRed), ANI_OK);
    ani_type typeColor {};
    ASSERT_EQ(env->Object_GetType(itemRed, &typeColor), ANI_OK);
    ani_boolean res {};
    ASSERT_EQ(env->Reference_Equals(enmColor, typeColor, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Instance_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectA {};
    ani_class classA {};
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.newClassName = "new_A";
    paramObjOperation.signature = ":C{entry.src.main.src.ets.ObjectOperations.A}";
    GetMethodDataA(env, &objectA, &classA, &paramObjOperation);

    ani_object objectB {};
    ani_class classB {};
    ParamObjA paramObjOperationB;
    paramObjOperationB.className = "entry.src.main.src.ets.ObjectOperations.B";
    paramObjOperationB.newClassName = "new_B";
    paramObjOperationB.signature = ":C{entry.src.main.src.ets.ObjectOperations.B}";
    GetMethodDataA(env, &objectB, &classB, &paramObjOperationB);

    ani_object objectC {};
    ani_class classC {};
    ParamObjA paramObjOperationC;
    paramObjOperationC.className = "entry.src.main.src.ets.ObjectOperations.C";
    paramObjOperationC.newClassName = "new_C";
    paramObjOperationC.signature = ":C{entry.src.main.src.ets.ObjectOperations.C}";
    GetMethodDataA(env, &objectC, &classC, &paramObjOperationC);

    ani_object objectD {};
    ani_class classD {};
    ParamObjA paramObjOperationD;
    paramObjOperationD.className = "entry.src.main.src.ets.ObjectOperations.D";
    paramObjOperationD.newClassName = "new_D";
    paramObjOperationD.signature = ":C{entry.src.main.src.ets.ObjectOperations.D}";
    GetMethodDataA(env, &objectD, &classD, &paramObjOperationD);

    ani_type typeRefC = classC;
    ani_type typeRefA = classA;
    ani_boolean res = ANI_FALSE;

    ASSERT_EQ(env->Object_InstanceOf(objectC, typeRefC, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ASSERT_EQ(env->Object_InstanceOf(objectB, typeRefC, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    ASSERT_EQ(env->Object_InstanceOf(objectC, typeRefA, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ASSERT_EQ(env->Object_InstanceOf(objectD, typeRefA, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);

    ASSERT_EQ(env->Object_InstanceOf(nullptr, typeRefA, &res), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_InstanceOf(objectC, nullptr, &res), ANI_INVALID_ARGS);

    ASSERT_EQ(env->Object_InstanceOf(objectC, typeRefC, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Instance_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectA {};
    ani_class classA {};
    ani_boolean res = ANI_FALSE;
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.newClassName = "new_A";
    paramObjOperation.signature = ":C{entry.src.main.src.ets.ObjectOperations.A}";
    GetMethodDataA(env, &objectA, &classA, &paramObjOperation);

    ani_type type = nullptr;
    ASSERT_EQ(env->Object_InstanceOf(objectA, type, &res), ANI_INVALID_ARGS);
    ASSERT_EQ(res, false);

    ani_type typeRefA = classA;
    ASSERT_EQ(env->c_api->Object_InstanceOf(nullptr, objectA, typeRefA, &res), ANI_INVALID_ARGS);
    ASSERT_EQ(res, false);
    return ANI_TRUE;
}

ani_int test_Object_Instance_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectA {};
    ani_class classA {};
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.newClassName = "new_A";
    paramObjOperation.signature = ":C{entry.src.main.src.ets.ObjectOperations.A}";
    GetMethodDataA(env, &objectA, &classA, &paramObjOperation);

    ani_object objectB {};
    ani_class classB {};
    ParamObjA paramObjOperationB;
    paramObjOperationB.className = "entry.src.main.src.ets.ObjectOperations.B";
    paramObjOperationB.newClassName = "new_B";
    paramObjOperationB.signature = ":C{entry.src.main.src.ets.ObjectOperations.B}";
    GetMethodDataA(env, &objectB, &classB, &paramObjOperationB);

    ani_object objectC {};
    ani_class classC {};
    ParamObjA paramObjOperationC;
    paramObjOperationC.className = "entry.src.main.src.ets.ObjectOperations.C";
    paramObjOperationC.newClassName = "new_C";
    paramObjOperationC.signature = ":C{entry.src.main.src.ets.ObjectOperations.C}";
    GetMethodDataA(env, &objectC, &classC, &paramObjOperationC);

    ani_type typeRefC = classC;
    ani_type typeRefA = classA;
    ani_boolean res = ANI_FALSE;

    const int32_t loopCount = 3;
    for (uint16_t i = 0; i < loopCount; ++i) {
        ASSERT_EQ(env->Object_InstanceOf(objectC, typeRefC, &res), ANI_OK);
        ASSERT_EQ(res, ANI_TRUE);

        ASSERT_EQ(env->Object_InstanceOf(objectB, typeRefC, &res), ANI_OK);
        ASSERT_EQ(res, false);

        ASSERT_EQ(env->Object_InstanceOf(objectC, typeRefA, &res), ANI_OK);
        ASSERT_EQ(res, ANI_TRUE);
    }
    return ANI_TRUE;
}

ani_int test_Object_Instance_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectArr;
    ani_class classA;
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.newClassName = "new_A_array";
    paramObjOperation.signature = ":C{escompat.Array}";
    GetMethodDataA(env, &objectArr, &classA, &paramObjOperation);

    ani_boolean res;
    ani_class arrayCls;
    ASSERT_EQ(env->FindClass("escompat.Array", &arrayCls), ANI_OK);
    ASSERT_EQ(env->Object_InstanceOf(objectArr, arrayCls, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Instance_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectI;
    ani_class classF;
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.F";
    paramObjOperation.newClassName = "new_I";
    paramObjOperation.signature = ":C{entry.src.main.src.ets.ObjectOperations.I}";
    GetMethodDataA(env, &objectI, &classF, &paramObjOperation);

    ani_boolean res;
    ani_class interfaceI;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.I", &interfaceI), ANI_OK);
    ASSERT_EQ(env->Object_InstanceOf(objectI, classF, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_InstanceOf(objectI, interfaceI, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ani_object objectF;
    ParamObjA paramObjOperation2;
    paramObjOperation2.className = "entry.src.main.src.ets.ObjectOperations.F";
    paramObjOperation2.newClassName = "new_F";
    paramObjOperation2.signature = ":C{entry.src.main.src.ets.ObjectOperations.F}";
    GetMethodDataA(env, &objectF, &classF, &paramObjOperation2);

    ASSERT_EQ(env->Object_InstanceOf(objectF, classF, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_InstanceOf(objectF, interfaceI, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Instance_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectU;
    ani_class classF;
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.F";
    paramObjOperation.newClassName = "new_Union";
    paramObjOperation.signature = nullptr;
    GetMethodDataA(env, &objectU, &classF, &paramObjOperation);

    ani_object objectU1;
    ani_class classD;
    ParamObjA paramObjOperationD;
    paramObjOperationD.className = "entry.src.main.src.ets.ObjectOperations.D";
    paramObjOperationD.newClassName = "new_Union";
    paramObjOperationD.signature = nullptr;
    GetMethodDataA(env, &objectU1, &classD, &paramObjOperationD);

    ani_boolean res;
    ASSERT_EQ(env->Object_InstanceOf(objectU, classF, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_InstanceOf(objectU, classD, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    ASSERT_EQ(env->Object_InstanceOf(objectU1, classF, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    ASSERT_EQ(env->Object_InstanceOf(objectU1, classD, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Instance_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
// TEST_F(ObjectInstanceOfTest, pure_object_instance_of)
{
    ani_object object;
    ani_object objectD;
    ani_class classF;
    ani_class classD;
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.F";
    paramObjOperation.newClassName = "new_Object";
    paramObjOperation.signature = ":C{std.core.Object}";
    GetMethodDataA(env, &object, &classF, &paramObjOperation);

    ParamObjA paramObjOperation2;
    paramObjOperation2.className = "entry.src.main.src.ets.ObjectOperations.D";
    paramObjOperation2.newClassName = "new_D";
    paramObjOperation2.signature = ":C{entry.src.main.src.ets.ObjectOperations.D}";
    GetMethodDataA(env, &objectD, &classD, &paramObjOperation2);

    ani_class classObject;
    ani_class interfaceI;
    ani_class classA;
    ASSERT_EQ(env->FindClass("std.core.Object", &classObject), ANI_OK);
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.I", &interfaceI), ANI_OK);
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.A", &classA), ANI_OK);

    ani_boolean res;
    ASSERT_EQ(env->Object_InstanceOf(objectD, classObject, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_InstanceOf(object, classObject, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_InstanceOf(object, classF, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    ASSERT_EQ(env->Object_InstanceOf(object, classD, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    ASSERT_EQ(env->Object_InstanceOf(object, interfaceI, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    ASSERT_EQ(env->Object_InstanceOf(object, classA, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Instance_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectInt;
    ani_class classF;
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.F";
    paramObjOperation.newClassName = "new_Boxed_Primitive";
    paramObjOperation.signature = ":X{C{std.core.Int}C{std.core.String}}";
    GetMethodDataA(env, &objectInt, &classF, &paramObjOperation);

    ani_boolean res;
    ani_class classInt;
    ani_class classObject;
    ASSERT_EQ(env->FindClass("std.core.Int", &classInt), ANI_OK);
    ASSERT_EQ(env->FindClass("std.core.Object", &classObject), ANI_OK);
    ASSERT_EQ(env->Object_InstanceOf(objectInt, classInt, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    ASSERT_EQ(env->Object_InstanceOf(objectInt, classObject, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Instance_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object objectColors;
    ani_class classF;
    ParamObjA paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.F";
    paramObjOperation.newClassName = "new_Color";
    paramObjOperation.signature = nullptr;
    GetMethodDataA(env, &objectColors, &classF, &paramObjOperation);

    ani_object objectItems;
    ParamObjA paramObjOperation2;
    paramObjOperation2.className = "entry.src.main.src.ets.ObjectOperations.F";
    paramObjOperation2.newClassName = "new_Items";
    paramObjOperation2.signature = nullptr;
    GetMethodDataA(env, &objectItems, &classF, &paramObjOperation2);

    ani_type colorsType {};
    ASSERT_EQ(env->Object_GetType(objectColors, &colorsType), ANI_OK);
    ASSERT_NE(colorsType, nullptr);

    ani_type itemsType {};
    ASSERT_EQ(env->Object_GetType(objectItems, &itemsType), ANI_OK);
    ASSERT_NE(itemsType, nullptr);

    ani_boolean res;
    ASSERT_EQ(env->Object_InstanceOf(objectColors, colorsType, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ASSERT_EQ(env->Object_InstanceOf(objectColors, itemsType, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Instance_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enmColor {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.ObjectOperations.Color", &enmColor), ANI_OK);
    ASSERT_NE(enmColor, nullptr);

    ani_enum enmItems {};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.ObjectOperations.Items", &enmItems), ANI_OK);
    ASSERT_NE(enmItems, nullptr);

    ani_enum_item itemRed {};
    ASSERT_EQ(env->Enum_GetEnumItemByName(enmColor, "RED", &itemRed), ANI_OK);
    ASSERT_NE(itemRed, nullptr);

    ani_boolean res {};
    ASSERT_EQ(env->Object_InstanceOf(itemRed, enmColor, &res), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);

    ASSERT_EQ(env->Object_InstanceOf(itemRed, enmItems, &res), ANI_OK);
    ASSERT_EQ(res, ANI_FALSE);
    return ANI_TRUE;
}

ani_int GetTestDataA(ani_env *env, ani_object *packResult, ani_field *fieldBoolResult, ani_field *fieldStringResult)
{
    auto packRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newPackObject");

    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Pack", &cls), ANI_OK);

    ani_field fieldBool {};
    ASSERT_EQ(env->Class_FindField(cls, "bool_value", &fieldBool), ANI_OK);

    ani_field fieldString {};
    ASSERT_EQ(env->Class_FindField(cls, "string_value", &fieldString), ANI_OK);

    *packResult = static_cast<ani_object>(packRef);
    *fieldBoolResult = fieldBool;
    *fieldStringResult = fieldString;
    return ANI_TRUE;
}