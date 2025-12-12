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

ani_int GetMethodDataBool([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "or", "zz:z", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataInt([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ii:i", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataShort([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ss:s", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataByte([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "bb:b", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataLong([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodLong.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ll:l", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataDouble([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodDouble.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "dd:d", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataFloat([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodFloat.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sum", "ff:f", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataChar([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodChar.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "sub", "cc:c", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataVoid([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *voidMethodResult,
    ani_static_method *getMethodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodVoid.Operations", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method getMethod;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);
    ASSERT_NE(getMethod, nullptr);

    ani_static_method voidMethod;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "voidMethod", nullptr, &voidMethod), ANI_OK);
    ASSERT_NE(voidMethod, nullptr);

    *clsResult = cls;
    *voidMethodResult = voidMethod;
    *getMethodResult = getMethod;
    return ANI_TRUE;
}

ani_int GetCount([[maybe_unused]] ani_env *env, ani_class cls, ani_static_method getMethod, ani_int *value)
{
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, getMethod, value), ANI_OK);
    return ANI_TRUE;
}

ani_int TestCombineScene([[maybe_unused]] ani_env *env, const char *className, ani_boolean expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "zz:z", &method), ANI_OK);

    ani_boolean value = expectedValue == ANI_TRUE ? ANI_FALSE : ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = expectedValue == ANI_TRUE ? ANI_FALSE : ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneInt([[maybe_unused]] ani_env *env, const char *className, ani_int val1, ani_int val2,
    ani_int expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &method), ANI_OK);

    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].i = val1;
    args[1U].i = val2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneShort([[maybe_unused]] ani_env *env, const char *className, ani_short val1, ani_short val2, 
    ani_short expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ss:s", &method), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].s = val1;
    args[1U].s = val2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneByte([[maybe_unused]] ani_env *env, const char *className, ani_byte val1, ani_byte val2,
    ani_byte expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "bb:b", &method), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].b = val1;
    args[1U].b = val2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneLong([[maybe_unused]] ani_env *env, const char *className, ani_long val1, ani_long val2, 
    ani_long expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ll:l", &method), ANI_OK);

    ani_long value = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].l = val1;
    args[1U].l = val2;
    ani_long valueA = 0L;
    ASSERT_EQ(env->Class_CallStaticMethod_Long_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int GetMethodDataButton([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.Phone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_button_names", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int GetMethodDataString([[maybe_unused]] ani_env *env, ani_class *clsResult, ani_static_method *methodResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodRef.Phone", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "get_num_string", "ii:C{std.core.String}", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    *clsResult = cls;
    *methodResult = method;
    return ANI_TRUE;
}

ani_int CheckRefUp([[maybe_unused]] ani_env *env, ani_ref ref)
{
    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ASSERT_EQ(result, 2U);

    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 5U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "UP");
    return ANI_TRUE;
}

ani_int CheckRefNum([[maybe_unused]] ani_env *env, ani_ref ref)
{
    auto string = reinterpret_cast<ani_string>(ref);
    ani_size result = 0U;
    ASSERT_EQ(env->String_GetUTF8Size(string, &result), ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = result;
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {};
    result = 0U;
    auto status =
        env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_STREQ(utfBuffer, "INT5");
    return ANI_TRUE;
}

ani_int TestCombineSceneRef([[maybe_unused]] ani_env *env, const char *className, ani_int val1, ani_int val2)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:C{std.core.String}", &method), ANI_OK);

    ani_ref value = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, method, &value, val1, val2), ANI_OK);
    CheckRefNum(env, value);

    ani_value args[2U];
    args[0U].i = val1;
    args[1U].i = val2;
    ani_ref valueA = nullptr;
    ASSERT_EQ(env->Class_CallStaticMethod_Ref_A(cls, method, &valueA, args), ANI_OK);
    CheckRefNum(env, valueA);
    return ANI_TRUE;
}

ani_int TestCombineSceneDouble([[maybe_unused]] ani_env *env, const char *className, ani_double val1, ani_double val2, 
    ani_double expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "dd:d", &method), ANI_OK);

    ani_double value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].d = val1;
    args[1U].d = val2;
    ani_double valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Double_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneFloat([[maybe_unused]] ani_env *env, const char *className, ani_float val1, ani_float val2, 
    ani_float expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ff:f", &method), ANI_OK);

    ani_float value = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].f = val1;
    args[1U].f = val2;
    ani_float valueA = 0.0;
    ASSERT_EQ(env->Class_CallStaticMethod_Float_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

ani_int TestCombineSceneChar([[maybe_unused]] ani_env *env, const char *className, ani_char val1, ani_char val2, 
    ani_char expectedValue)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "cc:c", &method), ANI_OK);

    ani_char value = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char(cls, method, &value, val1, val2), ANI_OK);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].c = val1;
    args[1U].c = val2;
    ani_char valueA = '\0';
    ASSERT_EQ(env->Class_CallStaticMethod_Char_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, expectedValue);
    return ANI_TRUE;
}

typedef struct ParaValInt {
    ani_int val1;
    ani_int val2;
} ParaValInt;

ani_int TestCombineSceneVoid([[maybe_unused]] ani_env *env, const char *className, ParaValInt *val, 
    ani_int expectedValue, bool doubleForArray = true)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass(className, &cls), ANI_OK);
    ani_static_method method {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:", &method), ANI_OK);
    ani_static_method getMethod {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &getMethod), ANI_OK);

    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method, val->val1, val->val2), ANI_OK);
    GetCount(env, cls, getMethod, &value);
    ASSERT_EQ(value, expectedValue);

    ani_value args[2U];
    args[0U].i = val->val1;
    args[1U].i = val->val2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Void_A(cls, method, args), ANI_OK);
    GetCount(env, cls, getMethod, &valueA);
    ASSERT_EQ(valueA, doubleForArray ? value + val->val1 + val->val2 : expectedValue);
    return ANI_TRUE;
}

ani_boolean test_FindClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_static_method method = nullptr;
    status = env->Class_FindStaticMethod(cls, "or", "zz:z", &method);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Boolean(env, cls, method, &result, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &result, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(nullptr, method, &result, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, nullptr, &result, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, nullptr, ANI_TRUE, ANI_FALSE), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(nullptr, method, &result, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, nullptr, &result, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;

    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &result, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataBool(env, &cls, &method);

    ani_boolean result = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &result, 10U, 20U), ANI_OK);
    ASSERT_NE(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "zz:z", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "zz:z", &methodB), ANI_OK);

    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(clsA, methodA, &valueA, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    ani_boolean valueB = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(clsB, methodB, &valueB, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(valueB, ANI_FALSE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueAA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, ANI_TRUE);

    ani_boolean valueBA = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "zz:z", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, methodA, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, 5U, 6U), ANI_OK);
    ASSERT_EQ(value2, 5U + 6U);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "zz:z", &method), ANI_OK);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);

    ani_value args[ARG_COUNT];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataBool(env, &cls, &method);

    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Boolean(nullptr, cls, method, &value, ANI_TRUE, ANI_FALSE),
              ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Boolean_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env, "entry.src.main.src.ets.ClassOperationsMethodBool.C", ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env, "entry.src.main.src.ets.ClassOperationsMethodBool.D", ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineScene(env, "entry.src.main.src.ets.ClassOperationsMethodBool.E", ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, ANI_TRUE, ANI_FALSE), ANI_OK);
    ani_boolean value = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_TRUE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodBool.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "zz:z", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "zz:z", &method2), ANI_OK);
    ani_boolean value = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method1, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_TRUE);
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method2, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    ASSERT_EQ(value, ANI_FALSE);

    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ani_boolean valueA = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_TRUE);
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataBool(env, &cls, &method);

    ani_boolean value {};
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean(cls, method, &value, ANI_TRUE, ANI_FALSE), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodBoolean_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataBool(env, &cls, &method);

    ani_boolean value {};
    ani_value args[2U];
    args[0U].z = ANI_TRUE;
    args[1U].z = ANI_FALSE;
    ASSERT_EQ(env->Class_CallStaticMethod_Boolean_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = {};
    auto status = env->FindClass("entry.src.main.src.ets.ClassOperations.Person", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_static_method method = nullptr;
    status = env->Class_FindStaticMethod(cls, "sum", "ii:i", &method);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(method, nullptr);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(env, cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataInt(env, &cls, &method);

    ani_int sum;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(nullptr, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ii:i", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ii:i", &methodB), ANI_OK);

    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int valueB;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueAA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_int valueBA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "dd:d", &methodB), ANI_OK);

    ani_int value;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_double value2;
    ASSERT_EQ(env->Class_CallStaticMethod_Double(cls, methodB, &value2, VAL3, VAL4), ANI_OK);
    ASSERT_EQ(value2, VAL3 + VAL4);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ii:i", &method), ANI_OK);

    ani_int value;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataInt(env, &cls, &method);

    ani_int value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int(nullptr, cls, method, &value, VAL3, VAL4), ANI_INVALID_ARGS);
    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Int_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "entry.src.main.src.ets.ClassOperationsMethodInt.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "entry.src.main.src.ets.ClassOperationsMethodInt.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneInt(env, "entry.src.main.src.ets.ClassOperationsMethodInt.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodInt.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ii:i", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ii:i", &method2), ANI_OK);
    ani_int value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ani_int valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataInt(env, &cls, &method);

    ani_int value {};
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, method, &value, VAL1, VAL2), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodInt_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataInt(env, &cls, &method);

    ani_int value {};
    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Int_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Short(env, cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &sum, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataShort(env, &cls, &method);

    ani_short sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "ss:s", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "ss:s", &methodB), ANI_OK);

    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_short valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, 6U - 5U);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_short valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, 6U - 5U);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ss:s", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, VAL2, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "ss:s", &method), ANI_OK);

    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataShort(env, &cls, &method);

    ani_short value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Short(nullptr, cls, method, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Short_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneShort(env, "entry.src.main.src.ets.ClassOperationsMethodShort.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneShort(env, "entry.src.main.src.ets.ClassOperationsMethodShort.D", VAL1, VAL2, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneShort(env, "entry.src.main.src.ets.ClassOperationsMethodShort.E", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.F", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "increment", nullptr, &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getCount", nullptr, &method2), ANI_OK);
    ASSERT_EQ(env->Class_CallStaticMethod_Void(cls, method1, VAL1, VAL2), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method2, &value), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodShort.G", &cls), ANI_OK);
    ani_static_method method1 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "publicMethod", "ss:s", &method1), ANI_OK);
    ani_static_method method2 {};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "callPrivateMethod", "ss:s", &method2), ANI_OK);
    ani_short value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method1, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method2, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL2 - VAL1);

    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ani_short valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method1, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method2, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataShort(env, &cls, &method);

    ani_short value {};
    ASSERT_EQ(env->Class_CallStaticMethod_Short(cls, method, &value, VAL1, VAL2), ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodShort_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataShort(env, &cls, &method);

    ani_short value {};
    ani_value args[2U];
    args[0U].s = VAL1;
    args[1U].s = VAL2;
    ASSERT_EQ(env->Class_CallStaticMethod_Short_A(cls, method, &value, args), ANI_OK);
    return ANI_TRUE;
}


ani_boolean test_Class_FindStaticMethodByte([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    const ani_byte VALUE1 = 5U;
    const ani_byte VALUE2 = 6U;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Byte(env, cls, method, &sum, VALUE1, VALUE2), ANI_OK);
    ASSERT_EQ(sum, VALUE1 + VALUE2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    const ani_byte VALUE1 = 5U;
    const ani_byte VALUE2 = 6U;
    
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, &sum, VALUE1, VALUE2), ANI_OK);
    ASSERT_EQ(sum, VALUE1 + VALUE2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(nullptr, method, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, nullptr, &sum, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, nullptr, VAL1, VAL2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;

    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method;
    GetMethodDataByte(env, &cls, &method);

    ani_byte sum = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsA {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.A", &clsA), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(clsA, "funcA", "bb:b", &methodA), ANI_OK);

    ani_class clsB {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.B", &clsB), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(clsB, "funcB", "bb:b", &methodB), ANI_OK);

    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(clsA, methodA, &valueA, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_byte valueB = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(clsB, methodB, &valueB, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(valueB, VAL2 - VAL1);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueAA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(clsA, methodA, &valueAA, args), ANI_OK);
    ASSERT_EQ(valueAA, VAL1 + VAL2);

    ani_byte valueBA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(clsB, methodB, &valueBA, args), ANI_OK);
    ASSERT_EQ(valueBA, VAL2 - VAL1);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.A", &cls), ANI_OK);
    ani_static_method methodA;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "bb:b", &methodA), ANI_OK);
    ani_static_method methodB;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcA", "ii:i", &methodB), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, methodA, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, methodA, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);

    ani_int value2 = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, methodB, &value2, VAL2, VAL2), ANI_OK);
    ASSERT_EQ(value2, VAL2 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ClassOperationsMethodByte.A", &cls), ANI_OK);
    ani_static_method method;
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "funcB", "bb:b", &method), ANI_OK);

    ani_byte value = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte(cls, method, &value, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(value, VAL1 + VAL2);

    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ani_byte valueA = 0;
    ASSERT_EQ(env->Class_CallStaticMethod_Byte_A(cls, method, &valueA, args), ANI_OK);
    ASSERT_EQ(valueA, VAL1 + VAL2);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ani_static_method method {};
    GetMethodDataByte(env, &cls, &method);

    ani_byte value = 0;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Byte(nullptr, cls, method, &value, VAL1, VAL2), ANI_INVALID_ARGS);
    ani_value args[ARG_COUNT];
    args[0U].b = VAL1;
    args[1U].b = VAL2;
    ASSERT_EQ(env->c_api->Class_CallStaticMethod_Byte_A(nullptr, cls, method, &value, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_Class_FindStaticMethodByte_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    TestCombineSceneByte(env, "entry.src.main.src.ets.ClassOperationsMethodByte.C", VAL1, VAL2, VAL1 + VAL2);
    return ANI_TRUE;
}

