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

#ifndef BOX_UNBOX_PRIMITIVE_H
#define BOX_UNBOX_PRIMITIVE_H
#include "Common.h"
#include <cfloat>
#include <thread>
#include <atomic>

constexpr ani_byte TEST_BYTE_VALUE = 42;
constexpr ani_byte TEST_BYTE_MAX = 127;
constexpr ani_short TEST_SHORT_VALUE = 12345;
constexpr ani_int TEST_INT_VALUE = 12345;
constexpr ani_int TEST_INT_LARGE = 123456789;
constexpr ani_long TEST_LONG_VALUE = 12345678901234LL;
constexpr ani_char TEST_CHAR_MAX = 65535;
constexpr ani_float TEST_FLOAT_VALUE = 3.14159f;
constexpr ani_double TEST_DOUBLE_VALUE = 3.141592653589793;
constexpr int TEST_ITERATION_COUNT = 1000;
constexpr size_t TEST_STRING_LENGTH = 4;

ani_boolean AssertIsBoolean(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Boolean", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxBooleanNative([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object boxedBool = nullptr;
    ASSERT_EQ(env->Primitive_Box_Boolean(ANI_TRUE, &boxedBool), ANI_OK);
    AssertIsBoolean(env, boxedBool);
    ani_boolean unboxedBool = ANI_FALSE;
    ASSERT_EQ(env->Primitive_Unbox_Boolean(boxedBool, &unboxedBool), ANI_OK);
    ASSERT_EQ(unboxedBool, ANI_TRUE);

    ani_object boxedFalse = nullptr;
    ASSERT_EQ(env->Primitive_Box_Boolean(ANI_FALSE, &boxedFalse), ANI_OK);
    AssertIsBoolean(env, boxedFalse);
    ani_boolean unboxedFalse = ANI_TRUE;
    ASSERT_EQ(env->Primitive_Unbox_Boolean(boxedFalse, &unboxedFalse), ANI_OK);
    ASSERT_EQ(unboxedFalse, ANI_FALSE);

    return ANI_TRUE;
}

ani_boolean testBoxBooleanExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Boolean(nullptr, ANI_TRUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Boolean(ANI_TRUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxBooleanNative(ani_env *env)
{
    ani_object boxedTrue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Boolean(ANI_TRUE, &boxedTrue), ANI_OK);
    ani_boolean resultTrue = ANI_FALSE;
    ASSERT_EQ(env->Primitive_Unbox_Boolean(boxedTrue, &resultTrue), ANI_OK);
    ASSERT_EQ(resultTrue, ANI_TRUE);

    ani_object boxedFalse = nullptr;
    ASSERT_EQ(env->Primitive_Box_Boolean(ANI_FALSE, &boxedFalse), ANI_OK);
    ani_boolean result = ANI_TRUE;
    ASSERT_EQ(env->Primitive_Unbox_Boolean(boxedFalse, &result), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field genderField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalBoolean", &genderField), ANI_OK);

    ani_ref genderRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, genderField, &genderRef), ANI_OK);

    ani_boolean gender = ANI_TRUE;
    ASSERT_EQ(env->Primitive_Unbox_Boolean(static_cast<ani_object>(genderRef), &gender), ANI_OK);
    ASSERT_EQ(gender, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean testUnboxBooleanExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Boolean(ANI_TRUE, &boxedObj), ANI_OK);
    ani_boolean result = ANI_FALSE;

    ani_status status = env->c_api->Primitive_Unbox_Boolean(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Boolean(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Boolean(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Boolean(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean AssertIsByte(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Byte", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxByteNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(INT8_MIN, &boxedMin), ANI_OK);
    AssertIsByte(env, boxedMin);
    ani_byte unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT8_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(INT8_MAX, &boxedMax), ANI_OK);
    AssertIsByte(env, boxedMax);
    ani_byte unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT8_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(0, &boxedZero), ANI_OK);
    AssertIsByte(env, boxedZero);
    ani_byte unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_byte value = 12;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(value, &boxedValue), ANI_OK);
    AssertIsByte(env, boxedValue);
    ani_byte unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testBoxByteExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Byte(nullptr, TEST_BYTE_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Byte(TEST_BYTE_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxByteNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(INT8_MIN, &boxedMin), ANI_OK);
    ani_byte resultMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedMin, &resultMin), ANI_OK);
    ASSERT_EQ(resultMin, INT8_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(INT8_MAX, &boxedMax), ANI_OK);
    ani_byte resultMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedMax, &resultMax), ANI_OK);
    ASSERT_EQ(resultMax, INT8_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(0, &boxedZero), ANI_OK);
    ani_byte resultZero = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedZero, &resultZero), ANI_OK);
    ASSERT_EQ(resultZero, 0);

    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(TEST_BYTE_VALUE, &boxedObj), ANI_OK);
    ani_byte result = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(boxedObj, &result), ANI_OK);
    ASSERT_EQ(result, TEST_BYTE_VALUE);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field codeField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalByte", &codeField), ANI_OK);

    ani_ref codeRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, codeField, &codeRef), ANI_OK);

    ani_byte code = 0;
    ASSERT_EQ(env->Primitive_Unbox_Byte(static_cast<ani_object>(codeRef), &code), ANI_OK);
    ani_byte expectCode = 12;
    ASSERT_EQ(code, expectCode);
    return ANI_TRUE;
}

ani_boolean testUnboxByteExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Byte(TEST_BYTE_VALUE, &boxedObj), ANI_OK);
    ani_byte result = 0;
    ani_status status = env->c_api->Primitive_Unbox_Byte(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Byte(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Byte(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Byte(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean AssertIsChar(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Char", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxCharNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(0, &boxedMin), ANI_OK);
    AssertIsChar(env, boxedMin);
    ani_char unboxedMin = 1;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, 0);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(UINT16_MAX, &boxedMax), ANI_OK);
    AssertIsChar(env, boxedMax);
    ani_char unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, UINT16_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char('\0', &boxedZero), ANI_OK);
    AssertIsChar(env, boxedZero);
    ani_char unboxedZero = 1;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, '\0');

    ani_object boxedChar = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char('A', &boxedChar), ANI_OK);
    AssertIsChar(env, boxedChar);
    ani_char unboxedChar = '\0';
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedChar, &unboxedChar), ANI_OK);
    ASSERT_EQ(unboxedChar, 'A');

    ani_object boxedUnicode = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(L'中', &boxedUnicode), ANI_OK);
    AssertIsChar(env, boxedUnicode);
    ani_char unboxedUnicode = 0;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedUnicode, &unboxedUnicode), ANI_OK);
    ASSERT_EQ(unboxedUnicode, L'中');

    return ANI_TRUE;
}

ani_boolean testBoxCharExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Char(nullptr, L'A', nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Char(L'A', nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxCharNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(0, &boxedMin), ANI_OK);
    ani_char resultMin = 1;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedMin, &resultMin), ANI_OK);
    ASSERT_EQ(resultMin, 0);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(TEST_CHAR_MAX, &boxedMax), ANI_OK);
    ani_char resultMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedMax, &resultMax), ANI_OK);
    ASSERT_EQ(resultMax, TEST_CHAR_MAX);

    ani_object boxedAscii = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(L'A', &boxedAscii), ANI_OK);
    ani_char resultAscii = 0;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedAscii, &resultAscii), ANI_OK);
    ASSERT_EQ(resultAscii, L'A');

    ani_object boxedUnicode = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(L'中', &boxedUnicode), ANI_OK);
    ani_char resultUnicode = 0;
    ASSERT_EQ(env->Primitive_Unbox_Char(boxedUnicode, &resultUnicode), ANI_OK);
    ASSERT_EQ(resultUnicode, L'中');

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field msgField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalChar", &msgField), ANI_OK);

    ani_ref msgRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, msgField, &msgRef), ANI_OK);

    ani_char msg = '0';
    ASSERT_EQ(env->Primitive_Unbox_Char(static_cast<ani_object>(msgRef), &msg), ANI_OK);
    ASSERT_EQ(msg, 'z');
    return ANI_TRUE;
}

ani_boolean testUnboxCharExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Char(L'A', &boxedObj), ANI_OK);
    ani_char result = 0;

    ani_status status = env->c_api->Primitive_Unbox_Char(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Char(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Char(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Char(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean AssertIsDouble(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Double", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxDoubleNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(-DBL_MAX, &boxedMin), ANI_OK);
    AssertIsDouble(env, boxedMin);
    ani_double unboxedMin = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, -DBL_MAX);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(DBL_MAX, &boxedMax), ANI_OK);
    AssertIsDouble(env, boxedMax);
    ani_double unboxedMax = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, DBL_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(0.0, &boxedZero), ANI_OK);
    AssertIsDouble(env, boxedZero);
    ani_double unboxedZero = -1.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0.0);

    ani_double value = TEST_DOUBLE_VALUE;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(value, &boxedValue), ANI_OK);
    AssertIsDouble(env, boxedValue);
    ani_double unboxedValue = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testBoxDoubleExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Double(nullptr, TEST_DOUBLE_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Double(TEST_DOUBLE_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxDoubleNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(DBL_MIN, &boxedMin), ANI_OK);
    ani_double resultMin = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedMin, &resultMin), ANI_OK);
    ASSERT_EQ(resultMin, DBL_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(DBL_MAX, &boxedMax), ANI_OK);
    ani_double resultMax = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedMax, &resultMax), ANI_OK);
    ASSERT_EQ(resultMax, DBL_MAX);

    ani_object boxedNegMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(-DBL_MAX, &boxedNegMax), ANI_OK);
    ani_double resultNegMax = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedNegMax, &resultNegMax), ANI_OK);
    ASSERT_EQ(resultNegMax, -DBL_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(0.0, &boxedZero), ANI_OK);
    ani_double resultZero = -1.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedZero, &resultZero), ANI_OK);
    ASSERT_EQ(resultZero, 0.0);

    ani_object boxedTypical = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(TEST_DOUBLE_VALUE, &boxedTypical), ANI_OK);
    ani_double resultTypical = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(boxedTypical, &resultTypical), ANI_OK);
    ASSERT_EQ(resultTypical, TEST_DOUBLE_VALUE);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalDouble", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_double score = 0.0;
    ASSERT_EQ(env->Primitive_Unbox_Double(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_double expectScore = 1.23;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}

ani_boolean testUnboxDoubleExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Double(TEST_DOUBLE_VALUE, &boxedObj), ANI_OK);
    ani_double result = 0.0;

    ani_status status = env->c_api->Primitive_Unbox_Double(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Double(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Double(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Double(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean AssertIsFloat(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Float", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxFloatNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(-FLT_MAX, &boxedMin), ANI_OK);
    AssertIsFloat(env, boxedMin);
    ani_float unboxedMin = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, -FLT_MAX);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(FLT_MAX, &boxedMax), ANI_OK);
    AssertIsFloat(env, boxedMax);
    ani_float unboxedMax = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, FLT_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(0.0F, &boxedZero), ANI_OK);
    AssertIsFloat(env, boxedZero);
    ani_float unboxedZero = -1.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0.0F);

    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(TEST_FLOAT_VALUE, &boxedValue), ANI_OK);
    AssertIsFloat(env, boxedValue);
    ani_float unboxedValue = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, TEST_FLOAT_VALUE);
    return ANI_TRUE;
}

ani_boolean testBoxFloatExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Float(nullptr, TEST_FLOAT_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Float(TEST_FLOAT_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxFloatNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(FLT_MIN, &boxedMin), ANI_OK);
    ani_float resultMin = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedMin, &resultMin), ANI_OK);
    ASSERT_EQ(resultMin, FLT_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(FLT_MAX, &boxedMax), ANI_OK);
    ani_float resultMax = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedMax, &resultMax), ANI_OK);
    ASSERT_EQ(resultMax, FLT_MAX);

    ani_object boxedNegMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(-FLT_MAX, &boxedNegMax), ANI_OK);
    ani_float resultNegMax = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedNegMax, &resultNegMax), ANI_OK);
    ASSERT_EQ(resultNegMax, -FLT_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(0.0f, &boxedZero), ANI_OK);
    ani_float resultZero = -1.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedZero, &resultZero), ANI_OK);
    ASSERT_EQ(resultZero, 0.0f);

    ani_object boxedTypical = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(TEST_FLOAT_VALUE, &boxedTypical), ANI_OK);
    ani_float resultTypical = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(boxedTypical, &resultTypical), ANI_OK);
    ASSERT_EQ(resultTypical, TEST_FLOAT_VALUE);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalFloat", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_float score = 0.0F;
    ASSERT_EQ(env->Primitive_Unbox_Float(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ASSERT_EQ(score, 1.2F);
    return ANI_TRUE;
}

ani_boolean testUnboxFloatExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Float(TEST_FLOAT_VALUE, &boxedObj), ANI_OK);
    ani_float result = 0.0F;

    ani_status status = env->c_api->Primitive_Unbox_Float(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Float(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Float(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Float(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean AssertIsInt(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Int", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxIntNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(INT32_MIN, &boxedMin), ANI_OK);
    AssertIsInt(env, boxedMin);
    ani_int unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT32_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(INT32_MAX, &boxedMax), ANI_OK);
    AssertIsInt(env, boxedMax);
    ani_int unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT32_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(0, &boxedZero), ANI_OK);
    AssertIsInt(env, boxedZero);
    ani_int unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_int value = TEST_INT_LARGE;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(value, &boxedValue), ANI_OK);
    AssertIsInt(env, boxedValue);
    ani_int unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testBoxIntExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Int(nullptr, TEST_INT_LARGE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Int(TEST_INT_LARGE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxIntNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(INT32_MIN, &boxedMin), ANI_OK);
    ani_int resultMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedMin, &resultMin), ANI_OK);
    ASSERT_EQ(resultMin, INT32_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(INT32_MAX, &boxedMax), ANI_OK);
    ani_int resultMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedMax, &resultMax), ANI_OK);
    ASSERT_EQ(resultMax, INT32_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(0, &boxedZero), ANI_OK);
    ani_int resultZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedZero, &resultZero), ANI_OK);
    ASSERT_EQ(resultZero, 0);

    ani_object boxedTypical = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(TEST_INT_LARGE, &boxedTypical), ANI_OK);
    ani_int resultTypical = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(boxedTypical, &resultTypical), ANI_OK);
    ASSERT_EQ(resultTypical, TEST_INT_LARGE);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalInt", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_int score = 0;
    ASSERT_EQ(env->Primitive_Unbox_Int(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_int expectScore = 1234;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}

ani_boolean testUnboxIntExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Int(TEST_INT_LARGE, &boxedObj), ANI_OK);
    ani_int result = 0;

    ani_status status = env->c_api->Primitive_Unbox_Int(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Int(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Int(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Int(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean AssertIsLong(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Long", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxLongNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(INT64_MIN, &boxedMin), ANI_OK);
    AssertIsLong(env, boxedMin);
    ani_long unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT64_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(INT64_MAX, &boxedMax), ANI_OK);
    AssertIsLong(env, boxedMax);
    ani_long unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT64_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(0, &boxedZero), ANI_OK);
    AssertIsLong(env, boxedZero);
    ani_long unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_long value = TEST_LONG_VALUE;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(value, &boxedValue), ANI_OK);
    AssertIsLong(env, boxedValue);
    ani_long unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testBoxLongExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Long(nullptr, TEST_LONG_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Long(TEST_LONG_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxLongNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(INT64_MIN, &boxedMin), ANI_OK);
    ani_long resultMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedMin, &resultMin), ANI_OK);
    ASSERT_EQ(resultMin, INT64_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(INT64_MAX, &boxedMax), ANI_OK);
    ani_long resultMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedMax, &resultMax), ANI_OK);
    ASSERT_EQ(resultMax, INT64_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(0, &boxedZero), ANI_OK);
    ani_long resultZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedZero, &resultZero), ANI_OK);
    ASSERT_EQ(resultZero, 0);

    ani_object boxedTypical = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(TEST_LONG_VALUE, &boxedTypical), ANI_OK);
    ani_long resultTypical = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(boxedTypical, &resultTypical), ANI_OK);
    ASSERT_EQ(resultTypical, TEST_LONG_VALUE);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalLong", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_long score = 0;
    ASSERT_EQ(env->Primitive_Unbox_Long(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_long expectScore = TEST_INT_LARGE;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}

ani_boolean testUnboxLongExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Long(TEST_LONG_VALUE, &boxedObj), ANI_OK);
    ani_long result = 0;

    ani_status status = env->c_api->Primitive_Unbox_Long(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Long(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Long(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Long(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean AssertIsShort(ani_env *env, ani_object boxed)
{
    ani_class typeClass = nullptr;
    ASSERT_EQ(env->FindClass("std.core.Short", &typeClass), ANI_OK);

    ani_boolean isExpectedType = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(boxed, typeClass, &isExpectedType), ANI_OK);
    ASSERT_EQ(isExpectedType, ANI_TRUE);
    return ANI_TRUE;
}

ani_boolean testBoxShortNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(INT16_MIN, &boxedMin), ANI_OK);
    AssertIsShort(env, boxedMin);
    ani_short unboxedMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedMin, &unboxedMin), ANI_OK);
    ASSERT_EQ(unboxedMin, INT16_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(INT16_MAX, &boxedMax), ANI_OK);
    AssertIsShort(env, boxedMax);
    ani_short unboxedMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedMax, &unboxedMax), ANI_OK);
    ASSERT_EQ(unboxedMax, INT16_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(0, &boxedZero), ANI_OK);
    AssertIsShort(env, boxedZero);
    ani_short unboxedZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedZero, &unboxedZero), ANI_OK);
    ASSERT_EQ(unboxedZero, 0);

    ani_short value = TEST_SHORT_VALUE;
    ani_object boxedValue = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(value, &boxedValue), ANI_OK);
    AssertIsShort(env, boxedValue);
    ani_short unboxedValue = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedValue, &unboxedValue), ANI_OK);
    ASSERT_EQ(unboxedValue, value);
    return ANI_TRUE;
}

ani_boolean testBoxShortExceptionNative(ani_env *env)
{
    ani_status status = env->c_api->Primitive_Box_Short(nullptr, TEST_SHORT_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Box_Short(TEST_SHORT_VALUE, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean testUnboxShortNative(ani_env *env)
{
    ani_object boxedMin = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(INT16_MIN, &boxedMin), ANI_OK);
    ani_short resultMin = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedMin, &resultMin), ANI_OK);
    ASSERT_EQ(resultMin, INT16_MIN);

    ani_object boxedMax = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(INT16_MAX, &boxedMax), ANI_OK);
    ani_short resultMax = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedMax, &resultMax), ANI_OK);
    ASSERT_EQ(resultMax, INT16_MAX);

    ani_object boxedZero = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(0, &boxedZero), ANI_OK);
    ani_short resultZero = -1;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedZero, &resultZero), ANI_OK);
    ASSERT_EQ(resultZero, 0);

    ani_object boxedTypical = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(TEST_SHORT_VALUE, &boxedTypical), ANI_OK);
    ani_short resultTypical = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(boxedTypical, &resultTypical), ANI_OK);
    ASSERT_EQ(resultTypical, TEST_SHORT_VALUE);

    ani_class cls;
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.BoxUnBoxPrimitive.Message", &cls), ANI_OK);
    ani_method messageCtor;
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &messageCtor), ANI_OK);
    ani_object messageObj;
    ASSERT_EQ(env->Object_New(cls, messageCtor, &messageObj), ANI_OK);

    ani_field scoreField;
    ASSERT_EQ(env->Class_FindField(cls, "scoreOptionalShort", &scoreField), ANI_OK);

    ani_ref scoreRef;
    ASSERT_EQ(env->Object_GetField_Ref(messageObj, scoreField, &scoreRef), ANI_OK);

    ani_short score = 0;
    ASSERT_EQ(env->Primitive_Unbox_Short(static_cast<ani_object>(scoreRef), &score), ANI_OK);
    ani_short expectScore = 123;
    ASSERT_EQ(score, expectScore);
    return ANI_TRUE;
}

ani_boolean testUnboxShortExceptionNative(ani_env *env)
{
    ani_object boxedObj = nullptr;
    ASSERT_EQ(env->Primitive_Box_Short(TEST_SHORT_VALUE, &boxedObj), ANI_OK);
    ani_short result = 0;

    ani_status status = env->c_api->Primitive_Unbox_Short(nullptr, boxedObj, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Short(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    status = env->Primitive_Unbox_Short(boxedObj, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    ani_string strObj = nullptr;
    ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
    status = env->Primitive_Unbox_Short(static_cast<ani_object>(strObj), &result);
    ASSERT_EQ(status, ANI_INVALID_TYPE);

    return ANI_TRUE;
}

ani_boolean testStabilityLoop1000NormalNative(ani_env *env)
{
    for (int i = 0; i < TEST_ITERATION_COUNT; i++) {
        ani_object boxedBool = nullptr;
        ASSERT_EQ(env->Primitive_Box_Boolean(ANI_TRUE, &boxedBool), ANI_OK);
        ani_boolean unboxedBool = ANI_FALSE;
        ASSERT_EQ(env->Primitive_Unbox_Boolean(boxedBool, &unboxedBool), ANI_OK);
        ASSERT_EQ(unboxedBool, ANI_TRUE);

        ani_object boxedByte = nullptr;
        ASSERT_EQ(env->Primitive_Box_Byte(TEST_BYTE_MAX, &boxedByte), ANI_OK);
        ani_byte unboxedByte = 0;
        ASSERT_EQ(env->Primitive_Unbox_Byte(boxedByte, &unboxedByte), ANI_OK);
        ASSERT_EQ(unboxedByte, TEST_BYTE_MAX);

        ani_object boxedChar = nullptr;
        ASSERT_EQ(env->Primitive_Box_Char(0x0041, &boxedChar), ANI_OK);
        ani_char unboxedChar = 0;
        ASSERT_EQ(env->Primitive_Unbox_Char(boxedChar, &unboxedChar), ANI_OK);
        ASSERT_EQ(unboxedChar, 0x0041);

        ani_object boxedShort = nullptr;
        ASSERT_EQ(env->Primitive_Box_Short(TEST_SHORT_VALUE, &boxedShort), ANI_OK);
        ani_short unboxedShort = 0;
        ASSERT_EQ(env->Primitive_Unbox_Short(boxedShort, &unboxedShort), ANI_OK);
        ASSERT_EQ(unboxedShort, TEST_SHORT_VALUE);

        ani_object boxedInt = nullptr;
        ASSERT_EQ(env->Primitive_Box_Int(TEST_INT_LARGE, &boxedInt), ANI_OK);
        ani_int unboxedInt = 0;
        ASSERT_EQ(env->Primitive_Unbox_Int(boxedInt, &unboxedInt), ANI_OK);
        ASSERT_EQ(unboxedInt, TEST_INT_LARGE);

        ani_object boxedLong = nullptr;
        ASSERT_EQ(env->Primitive_Box_Long(TEST_LONG_VALUE, &boxedLong), ANI_OK);
        ani_long unboxedLong = 0;
        ASSERT_EQ(env->Primitive_Unbox_Long(boxedLong, &unboxedLong), ANI_OK);
        ASSERT_EQ(unboxedLong, TEST_LONG_VALUE);

        ani_object boxedFloat = nullptr;
        ASSERT_EQ(env->Primitive_Box_Float(TEST_FLOAT_VALUE, &boxedFloat), ANI_OK);
        ani_float unboxedFloat = 0.0F;
        ASSERT_EQ(env->Primitive_Unbox_Float(boxedFloat, &unboxedFloat), ANI_OK);
        ASSERT_EQ(unboxedFloat, TEST_FLOAT_VALUE);

        ani_object boxedDouble = nullptr;
        ASSERT_EQ(env->Primitive_Box_Double(TEST_DOUBLE_VALUE, &boxedDouble), ANI_OK);
        ani_double unboxedDouble = 0.0;
        ASSERT_EQ(env->Primitive_Unbox_Double(boxedDouble, &unboxedDouble), ANI_OK);
        ASSERT_EQ(unboxedDouble, TEST_DOUBLE_VALUE);
    }
    return ANI_TRUE;
}

ani_boolean testStabilityLoop1000ExceptionNative(ani_env *env)
{
    for (int i = 0; i < TEST_ITERATION_COUNT; i++) {
        ani_object boxedObj = nullptr;
        ASSERT_EQ(env->Primitive_Box_Int(TEST_SHORT_VALUE, &boxedObj), ANI_OK);
        ani_int result = 0;

        ani_status status = env->c_api->Primitive_Unbox_Int(nullptr, boxedObj, &result);
        ASSERT_EQ(status, ANI_INVALID_ARGS);

        status = env->Primitive_Unbox_Int(nullptr, &result);
        ASSERT_EQ(status, ANI_INVALID_ARGS);

        status = env->Primitive_Unbox_Int(boxedObj, nullptr);
        ASSERT_EQ(status, ANI_INVALID_ARGS);

        ani_string strObj = nullptr;
        ASSERT_EQ(env->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj), ANI_OK);
        status = env->Primitive_Unbox_Int(static_cast<ani_object>(strObj), &result);
        ASSERT_EQ(status, ANI_INVALID_TYPE);
    }
    return ANI_TRUE;
}

ani_boolean runStabilityBooleanCheck(ani_env *workerEnv)
{
    ani_object boxedBool = nullptr;
    if (workerEnv->Primitive_Box_Boolean(ANI_TRUE, &boxedBool) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean unboxedBool = ANI_FALSE;
    if (workerEnv->Primitive_Unbox_Boolean(boxedBool, &unboxedBool) != ANI_OK) {
        return ANI_FALSE;
    }
    if (unboxedBool != ANI_TRUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean runStabilityIntCheck(ani_env *workerEnv)
{
    ani_object boxedInt = nullptr;
    if (workerEnv->Primitive_Box_Int(TEST_INT_LARGE, &boxedInt) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int unboxedInt = 0;
    if (workerEnv->Primitive_Unbox_Int(boxedInt, &unboxedInt) != ANI_OK) {
        return ANI_FALSE;
    }
    if (unboxedInt != TEST_INT_LARGE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean runStabilityLongCheck(ani_env *workerEnv)
{
    ani_object boxedLong = nullptr;
    if (workerEnv->Primitive_Box_Long(TEST_LONG_VALUE, &boxedLong) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_long unboxedLong = 0;
    if (workerEnv->Primitive_Unbox_Long(boxedLong, &unboxedLong) != ANI_OK) {
        return ANI_FALSE;
    }
    if (unboxedLong != TEST_LONG_VALUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean runStabilityDoubleCheck(ani_env *workerEnv)
{
    ani_object boxedDouble = nullptr;
    if (workerEnv->Primitive_Box_Double(TEST_DOUBLE_VALUE, &boxedDouble) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double unboxedDouble = 0.0;
    if (workerEnv->Primitive_Unbox_Double(boxedDouble, &unboxedDouble) != ANI_OK) {
        return ANI_FALSE;
    }
    if (unboxedDouble != TEST_DOUBLE_VALUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

void runStabilityNormalWorker(ani_vm *vm, std::atomic<ani_int> &successCount, std::atomic<bool> &startFlag)
{
    while (!startFlag.load()) {
        std::this_thread::yield();
    }

    ani_env *workerEnv = nullptr;
    ani_options options {0, nullptr};
    if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK || workerEnv == nullptr) {
        return;
    }

    if (runStabilityBooleanCheck(workerEnv) == ANI_FALSE) {
        vm->DetachCurrentThread();
        return;
    }
    if (runStabilityIntCheck(workerEnv) == ANI_FALSE) {
        vm->DetachCurrentThread();
        return;
    }
    if (runStabilityLongCheck(workerEnv) == ANI_FALSE) {
        vm->DetachCurrentThread();
        return;
    }
    if (runStabilityDoubleCheck(workerEnv) == ANI_FALSE) {
        vm->DetachCurrentThread();
        return;
    }

    if (vm->DetachCurrentThread() != ANI_OK) {
        return;
    }

    successCount++;
}

ani_boolean testStability10ThreadsNormalNative(ani_env *env)
{
    ani_vm *vm = nullptr;
    ASSERT_EQ(env->GetVM(&vm), ANI_OK);

    std::atomic<ani_int> successCount(0);
    std::atomic<bool> startFlag(false);

    const int threadCount = 10;
    std::vector<std::thread> threads;

    for (int t = 0; t < threadCount; t++) {
        threads.emplace_back([vm, &successCount, &startFlag]() {
            runStabilityNormalWorker(vm, successCount, startFlag);
        });
    }

    startFlag.store(true);
    for (auto& th : threads) {
        th.join();
    }

    ASSERT_EQ(successCount.load(), threadCount);
    return ANI_TRUE;
}

ani_boolean runStabilityExceptionCheck(ani_env *workerEnv)
{
    ani_object boxedObj = nullptr;
    if (workerEnv->Primitive_Box_Int(TEST_SHORT_VALUE, &boxedObj) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int result = 0;

    ani_status status = workerEnv->c_api->Primitive_Unbox_Int(nullptr, boxedObj, &result);
    if (status != ANI_INVALID_ARGS) {
        return ANI_FALSE;
    }

    status = workerEnv->Primitive_Unbox_Int(nullptr, &result);
    if (status != ANI_INVALID_ARGS) {
        return ANI_FALSE;
    }

    status = workerEnv->Primitive_Unbox_Int(boxedObj, nullptr);
    if (status != ANI_INVALID_ARGS) {
        return ANI_FALSE;
    }

    ani_string strObj = nullptr;
    if (workerEnv->String_NewUTF8("test", TEST_STRING_LENGTH, &strObj) != ANI_OK) {
        return ANI_FALSE;
    }
    status = workerEnv->Primitive_Unbox_Int(static_cast<ani_object>(strObj), &result);
    if (status != ANI_INVALID_TYPE) {
        return ANI_FALSE;
    }

    return ANI_TRUE;
}

void runStabilityExceptionWorker(ani_vm *vm, std::atomic<ani_int> &successCount, std::atomic<bool> &startFlag)
{
    while (!startFlag.load()) {
        std::this_thread::yield();
    }

    ani_env *workerEnv = nullptr;
    ani_options options {0, nullptr};
    if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK || workerEnv == nullptr) {
        return;
    }

    if (runStabilityExceptionCheck(workerEnv) == ANI_FALSE) {
        vm->DetachCurrentThread();
        return;
    }

    if (vm->DetachCurrentThread() != ANI_OK) {
        return;
    }

    successCount++;
}

ani_boolean testStability10ThreadsExceptionNative(ani_env *env)
{
    ani_vm *vm = nullptr;
    ASSERT_EQ(env->GetVM(&vm), ANI_OK);

    std::atomic<ani_int> successCount(0);
    std::atomic<bool> startFlag(false);

    const int threadCount = 10;
    std::vector<std::thread> threads;

    for (int t = 0; t < threadCount; t++) {
        threads.emplace_back([vm, &successCount, &startFlag]() {
            runStabilityExceptionWorker(vm, successCount, startFlag);
        });
    }

    startFlag.store(true);
    for (auto& th : threads) {
        th.join();
    }

    ASSERT_EQ(successCount.load(), threadCount);
    return ANI_TRUE;
}
#endif //BOX_UNBOX_PRIMITIVE_H
