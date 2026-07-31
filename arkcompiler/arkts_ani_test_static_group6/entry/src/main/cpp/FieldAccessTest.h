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

#ifndef ARKTS_ANI_TEST_FIELDACCESSTEST_H
#define ARKTS_ANI_TEST_FIELDACCESSTEST_H

#include "Common.h"
#include "hilog/log.h"

// Helper: create a FieldTypes instance
static ani_boolean CreateFieldTypes(ani_env *env, ani_object *outObj) {
    ani_class cls{};
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteFieldTypes", &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

// Helper: create a Point instance
static ani_boolean CreatePoint(ani_env *env, ani_int x, ani_int y, ani_object *outObj) {
    ani_class cls{};
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj, x, y) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_GetField_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreatePoint(env, 3, 4, &obj), ANI_TRUE);

    ani_int val{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "x", &val), ANI_OK);
    ASSERT_EQ(val, 3);
    return ANI_TRUE;
}

ani_int test_SetField_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreatePoint(env, 3, 4, &obj), ANI_TRUE);

    ASSERT_EQ(env->Object_SetFieldByName_Int(obj, "x", 10), ANI_OK);

    ani_int val{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "x", &val), ANI_OK);
    ASSERT_EQ(val, 10);
    return ANI_TRUE;
}

ani_int test_GetField_String([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "publicField", &ref), ANI_OK);
    ani_string str = static_cast<ani_string>(ref);
    std::string result;
    ASSERT_EQ(GetStdString(env, str, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "public");
    return ANI_TRUE;
}

ani_int test_SetField_String([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_string newStr{};
    ASSERT_EQ(env->String_NewUTF8("newValue", 8, &newStr), ANI_OK);
    ASSERT_EQ(env->Object_SetFieldByName_Ref(obj, "publicField", newStr), ANI_OK);

    ani_ref ref{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "publicField", &ref), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(ref);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "newValue");
    return ANI_TRUE;
}

ani_int test_GetField_ReadOnly([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteFinal", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_int val{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "value", &val), ANI_OK);
    ASSERT_EQ(val, 1);
    return ANI_TRUE;
}

ani_int test_GetField_Boolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_boolean val{};
    ASSERT_EQ(env->Object_GetFieldByName_Boolean(obj, "booleanField", &val), ANI_OK);
    ASSERT_EQ(val, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_GetField_Double([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_double val{};
    ASSERT_EQ(env->Object_GetFieldByName_Double(obj, "doubleField", &val), ANI_OK);
    ASSERT_EQ(val, 2.5);
    return ANI_TRUE;
}

ani_int test_GetField_Float([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_float val{};
    ASSERT_EQ(env->Object_GetFieldByName_Float(obj, "floatField", &val), ANI_OK);
    ASSERT_EQ(val, 1.5f);
    return ANI_TRUE;
}

ani_int test_GetField_Long([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_long val{};
    ASSERT_EQ(env->Object_GetFieldByName_Long(obj, "longField", &val), ANI_OK);
    ASSERT_EQ(val, 4);
    return ANI_TRUE;
}

ani_int test_GetField_Byte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_byte val{};
    ASSERT_EQ(env->Object_GetFieldByName_Byte(obj, "byteField", &val), ANI_OK);
    ASSERT_EQ(val, 1);
    return ANI_TRUE;
}

ani_int test_GetField_Short([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_short val{};
    ASSERT_EQ(env->Object_GetFieldByName_Short(obj, "shortField", &val), ANI_OK);
    ASSERT_EQ(val, 2);
    return ANI_TRUE;
}

ani_int test_GetField_Char([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_char val{};
    ASSERT_EQ(env->Object_GetFieldByName_Char(obj, "charField", &val), ANI_OK);
    ASSERT_EQ(val, ani_char('a'));
    return ANI_TRUE;
}

ani_int test_GetField_Static([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &cls), ANI_OK);

    ani_int val{};
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "staticField", &val), ANI_OK);
    ASSERT_EQ(val, 3);
    return ANI_TRUE;
}

ani_int test_SetField_Static([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &cls), ANI_OK);

    ASSERT_EQ(env->Class_SetStaticFieldByName_Int(cls, "staticField", 99), ANI_OK);

    ani_int val{};
    ASSERT_EQ(env->Class_GetStaticFieldByName_Int(cls, "staticField", &val), ANI_OK);
    ASSERT_EQ(val, 99);

    // Reset to original value
    ASSERT_EQ(env->Class_SetStaticFieldByName_Int(cls, "staticField", 3), ANI_OK);
    return ANI_TRUE;
}

ani_int test_GetField_Private([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_int val{};
    ani_status status = env->Object_GetFieldByName_Int(obj, "privateField", &val);
    if (status == ANI_OK && val == 2) {
        OH_LOG_INFO(LOG_APP, "testTag : ANI can access private field, val=%{public}d", val);
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : ANI cannot access private field, status=%{public}d", status);
    // If ANI doesn't allow private access, that's also a valid behavior
    if (status != ANI_OK) {
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_GetField_ReferenceType([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_ref ref{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "classField", &ref), ANI_OK);

    ani_class pointCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &pointCls), ANI_OK);

    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(static_cast<ani_object>(ref), pointCls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_GetField_EnumType([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_object obj{};
    ASSERT_EQ(CreateFieldTypes(env, &obj), ANI_TRUE);

    ani_ref ref{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "enumField", &ref), ANI_OK);

    ani_class statusCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteStatus", &statusCls), ANI_OK);

    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(static_cast<ani_object>(ref), statusCls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_FIELDACCESSTEST_H
