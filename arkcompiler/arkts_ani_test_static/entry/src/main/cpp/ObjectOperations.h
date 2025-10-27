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

typedef struct ParamObj {
    const char *className;
    const char *methodName;
    const char *signature;
} ParamObj;

ani_int GetMethodAndObject(ani_env *env, ParamObj* param, ani_object *object, ani_method *method)
{
    // NOLINTBEGIN(cppcoreguidelines-pro-type-vararg)
    ani_class cls {};
    ASSERT_EQ(env->FindClass(param->className, &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(cls, ctor, object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ASSERT_EQ(env->Class_FindMethod(cls, param->methodName, param->signature, method), ANI_OK);
    ASSERT_NE(method, nullptr);
    // NOLINTEND(cppcoreguidelines-pro-type-vararg)
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_A([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2];  // NOLINT(modernize-avoid-c-arrays)
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    args[0].i = arg1;
    args[1].i = arg2;
    ani_boolean res = ANI_FALSE;
    // Call the method and verify the return value.
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Call the method using variadic arguments and verify the return value.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Call the method and verify the return value.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->c_api->Object_CallMethod_Boolean(env, object, method, &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Call the method using variadic arguments and verify the return value.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &res, arg1, arg2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res = ANI_FALSE;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Attempt to call the method with a nullptr method pointer.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, nullptr, &res, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Attempt to call the method with a nullptr result pointer.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res;
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    // Attempt to call the method with a nullptr object pointer.
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg)
    ASSERT_EQ(env->Object_CallMethod_Boolean(nullptr, method, &res, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperations.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean res;
    // Attempt to call the method with a nullptr argument array.
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &res, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "booleanMethodVoidParam";
    paramObjOperation.signature = ":z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);


    ani_boolean result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj  paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "booleanMethodMultipleParam";
    paramObjOperation.signature = "bffb:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[4U] = {};
    ani_byte arg1 = VAL3;
    ani_float arg2 = 2.0F;
    ani_float arg3 = 3.0F;
    ani_byte arg4 = 4U;
    args[0U].b = arg1;
    args[1U].f = arg2;
    args[2U].f = arg3;
    args[3U].b = arg4;

    ani_boolean result;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2, arg3, arg4), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.B";
    paramObjOperation.methodName = "booleanMethodVoidParam";
    paramObjOperation.signature = ":z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodBoolean.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", "ii:z", &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodBoolean.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_boolean result = ANI_TRUE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL4;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_FALSE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL2;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "booleanMethod";
    paramObjOperation.signature = "ii:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_FALSE;
    ani_value args[2U] = {};
    ani_byte arg1 = 6U;
    ani_byte arg2 = 7U;
    args[0U].b = arg1;
    args[1U].b = arg2;

    for (ani_int i = 0; i < VAL4; i++) {
        ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);
        ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, ANI_TRUE);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_TRUE;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL4;
    args[0U].b = arg1;
    args[1U].b = arg2;

    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodBoolean.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "i:z";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_boolean result = ANI_FALSE;
    ani_value args[1U] = {};
    ani_byte arg1 = VAL4;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Boolean(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);

    ASSERT_EQ(env->Object_CallMethod_Boolean_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[VAL1];
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL2;
    args[0U].b = arg1;
    args[1U].b = arg2;

    ani_byte sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(env->c_api->Object_CallMethod_Byte_A(env, object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL2 = 3U;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL1;
    ani_byte arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL3 = 4U;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL2;
    ASSERT_EQ(env->c_api->Object_CallMethod_Byte(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->c_api->Object_CallMethod_Byte(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 5U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ani_byte arg1 = VAL4;
    ani_byte arg2 = VAL5;
    ASSERT_EQ(env->Object_CallMethod_Byte(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte sum = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethodVoidParam";
    paramObjOperation.signature = ":b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[VAL1];
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethodMultipleParam";
    paramObjOperation.signature = "bzffb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_byte arg1 = VAL1;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_float arg4 = 4.0F;
    ani_byte arg5 = VAL4;
    args[0U].b = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].f = arg4;
    args[4U].b = arg5;

    ani_byte result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg5);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL4 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.B";
    paramObjOperation.methodName = "byteMethodVoidParam";
    paramObjOperation.signature = ":b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[VAL1];
    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL3 = 4U;
    constexpr ani_int VAL5 = 6U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByte.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByte.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL1;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 2U;
    constexpr ani_int VAL3 = 4U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL1;
    args[0U].b = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL3 = 4U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "byteMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL3;
    ani_byte arg2 = VAL2;
    args[0U].b = arg1;
    args[1U].b = arg2;

    for (ani_int i = 0; i < VAL2; i++) {
        ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL5 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "bb:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[2U] = {};
    ani_byte arg1 = VAL2;
    ani_byte arg2 = VAL2;
    args[0U].b = arg1;
    args[1U].b = arg2;

    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Byte_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 3U;
    constexpr ani_int VAL6 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodByte.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "b:b";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_byte result = 0U;
    ani_value args[1U] = {};
    ani_byte arg1 = VAL2;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Byte(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL6);

    ASSERT_EQ(env->Object_CallMethod_Byte_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    args[0U].c = arg1;
    args[1U].c = arg2;

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->c_api->Object_CallMethod_Char(env, object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->c_api->Object_CallMethod_Char(nullptr, object, method, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(nullptr, method, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, nullptr, &result, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL1 = 'a';
    constexpr ani_char VAL2 = 'b';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char arg1 = VAL1;
    ani_char arg2 = VAL2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethodVoidParam";
    paramObjOperation.signature = ":c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = 0U;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethodMultipleParam";
    paramObjOperation.signature = "bzffb:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_byte arg1 = 2U;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_float arg4 = 4.0F;
    ani_byte arg5 = 5U;
    args[0U].b = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].f = arg4;
    args[4U].b = arg5;

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.B";
    paramObjOperation.methodName = "charMethodVoidParam";
    paramObjOperation.signature = ":c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL4 = 'D';
    constexpr ani_char VAL5 = 'F';
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodChar.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodChar.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = VAL4;
    ani_byte arg2 = 2U;
    args[0U].c = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL4 = 'D';
    constexpr ani_char VAL6 = 'B';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = "cb:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = VAL4;
    ani_byte arg2 = 2U;
    args[0U].c = arg1;
    args[1U].b = arg2;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL6);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL6);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    static constexpr ani_int LOOP_COUNT = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "charMethod";
    paramObjOperation.signature = "cc:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = 'X';
    ani_char arg2 = 'Y';
    args[0U].c = arg1;
    args[1U].c = arg2;

    for (ani_int i = 0; i < LOOP_COUNT; i++) {
        ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, 'Y');
        ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, 'Y');
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    constexpr ani_char VAL4 = 'D';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ci:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[2U] = {};
    ani_char arg1 = VAL3;
    ani_int arg2 = 3U;
    args[0U].c = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Char_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_char VAL3 = 'A';
    constexpr ani_char VAL7 = 'i';
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodChar.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "c:c";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_char result = '0';
    ani_value args[1U] = {};
    ani_char arg1 = VAL3;
    args[0U].c = arg1;
    ASSERT_EQ(env->Object_CallMethod_Char(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL7);

    ASSERT_EQ(env->Object_CallMethod_Char_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL7);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    args[0U].d = arg1;
    args[1U].d = arg2;

    ani_double sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Double(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Double(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ani_double arg1 = VAL;
    ani_double arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Double(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethodVoidParam";
    paramObjOperation.signature = ":d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethodMultipleParam";
    paramObjOperation.signature = "szdsd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_short arg1 = 2U;
    ani_boolean arg2 = ANI_TRUE;
    ani_double arg3 = VAL1;
    ani_short arg4 = 4U;
    ani_double arg5 = VAL3;
    args[0U].s = arg1;
    args[1U].z = arg2;
    args[2U].d = arg3;
    args[3U].s = arg4;
    args[4U].d = arg5;

    ani_double result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.B";
    paramObjOperation.methodName = "doubleMethodVoidParam";
    paramObjOperation.signature = ":d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodDouble.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodDouble.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_double result = 0U;
    ani_value args[2U] = {};
    ani_double arg1 = VAL1;
    ani_double arg2 = VAL;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double VAL = 2.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = 0U;
    ani_value args[2U] = {};
    ani_double arg1 = VAL3;
    ani_double arg2 = VAL1;
    args[0U].d = arg1;
    args[1U].d = arg2;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL2 = 4.0F;
    constexpr ani_double VAL4 = 7.0F;
    constexpr ani_int LOOP_COUNT = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "doubleMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_double arg1 = VAL1;
    ani_double arg2 = VAL2;
    args[0U].d = arg1;
    args[1U].d = arg2;

    for (ani_int i = 0; i < LOOP_COUNT; i++) {
        ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL4);
        ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL4);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL2 = 4.0F;
    constexpr ani_double VAL4 = 7.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "dd:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_double arg1 = VAL1;
    ani_double arg2 = VAL2;
    args[0U].d = arg1;
    args[1U].d = arg2;

    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Double_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_double INIT_VALUE = 0.0F;
    constexpr ani_double VAL1 = 3.0F;
    constexpr ani_double VAL5 = 103.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodDouble.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "d:d";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_double result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_double arg1 = VAL1;
    args[0U].d = arg1;
    ASSERT_EQ(env->Object_CallMethod_Double(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Double_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;

    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    args[0U].f = arg1;
    args[1U].f = arg2;

    ani_float sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Float(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Float(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ani_float arg1 = VAL;
    ani_float arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Float(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethodVoidParam";
    paramObjOperation.signature = ":f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethodMultipleParam";
    paramObjOperation.signature = "szfsf:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_short arg1 = 2U;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = VAL1;
    ani_short arg4 = 4U;
    ani_float arg5 = VAL3;
    args[0U].s = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].f = arg5;

    ani_float result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg3 + arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.B";
    paramObjOperation.methodName = "floatMethodVoidParam";
    paramObjOperation.signature = ":f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodFloat.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodFloat.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_float result = 0U;
    ani_value args[2U] = {};
    ani_float arg1 = VAL1;
    ani_float arg2 = VAL;
    args[0U].f = arg1;
    args[1U].f = arg2;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL = 2.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL3 = 5.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = 0U;
    ani_value args[2U] = {};
    ani_float arg1 = VAL3;
    ani_float arg2 = VAL1;
    args[0U].f = arg1;
    args[1U].f = arg2;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL2 = 4.0F;
    constexpr ani_float VAL4 = 7.0F;
    constexpr ani_int LOOP_COUNT = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "floatMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = 0U;
    ani_value args[2U] = {};
    ani_float arg1 = VAL1;
    ani_float arg2 = VAL2;
    args[0U].f = arg1;
    args[1U].f = arg2;

    for (ani_int i = 0; i < LOOP_COUNT; i++) {
        ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL4);
        ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL4);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL2 = 4.0F;
    constexpr ani_float VAL4 = 7.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ff:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_float arg1 = VAL1;
    ani_float arg2 = VAL2;
    args[0U].f = arg1;
    args[1U].f = arg2;

    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Float_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_float INIT_VALUE = 0.0F;
    constexpr ani_float VAL1 = 3.0F;
    constexpr ani_float VAL5 = 103.0F;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodFloat.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "f:f";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_float result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_float arg1 = VAL1;
    args[0U].f = arg1;
    ASSERT_EQ(env->Object_CallMethod_Float(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Float_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Int(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->c_api->Object_CallMethod_Int(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Int(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ani_int arg1 = VAL2;
    ani_int arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Int(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int sum;
    ASSERT_EQ(env->Object_CallMethod_Int_A(nullptr, method, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int sum;
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, nullptr, &sum, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_int arg1 = 2U;
    ani_int arg2 = 3U;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodMultipleParam";
    paramObjOperation.signature = "izfsd:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_int arg1 = VAL;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_short arg4 = 4U;
    ani_double arg5 = 5.0F;
    args[0U].i = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].d = arg5;

    ani_int result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethodVoidParam";
    paramObjOperation.signature = ":i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodInt.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodInt.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_int result = 0U;
    ani_value args[2U] = {};
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = 0U;
    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "intMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    for (ani_int i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ii:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Int_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL4 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodInt.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "i:i";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_int arg1 = VAL1;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Int(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Int_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL = 2U;
    constexpr ani_long VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_long arg1 = VAL;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;

    ani_long sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL = 2U;
    constexpr ani_long VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL;
    ani_long arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1 + arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->c_api->Object_CallMethod_Long(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Long(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ani_long arg1 = VAL2;
    ani_long arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Long(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethodVoidParam";
    paramObjOperation.signature = ":l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL = 2U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethodMultipleParam";
    paramObjOperation.signature = "lzflf:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_long arg1 = VAL;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_long arg4 = 4U;
    ani_float arg5 = 5.0F;
    args[0U].i = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].d = arg5;

    ani_long result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg1 + arg4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.B";
    paramObjOperation.methodName = "longMethodVoidParam";
    paramObjOperation.signature = ":l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_long VAL = 2U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodLong.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodLong.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_long result = 0U;
    ani_value args[2U] = {};
    ani_long arg1 = VAL;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = 0U;
    ani_value args[2U] = {};
    ani_long arg1 = VAL3;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "longMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_long arg1 = VAL1;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;

    for (ani_long i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ll:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_long arg1 = VAL1;
    ani_long arg2 = VAL1;
    args[0U].l = arg1;
    args[1U].l = arg2;

    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Long_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_long INIT_VALUE = 0U;
    constexpr ani_long VAL1 = 3U;
    constexpr ani_long VAL4 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodLong.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "l:l";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_long result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_long arg1 = VAL1;
    args[0U].l = arg1;
    ASSERT_EQ(env->Object_CallMethod_Long(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Long_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U];
    ani_short arg1 = VAL;
    ani_short arg2 = VAL1;
    args[0U].s = arg1;
    args[1U].s = arg2;

    ani_short sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &sum, args), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL;
    ani_short arg2 = VAL1;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = 4U;
    ani_short arg2 = VAL1;
    ASSERT_EQ(env->c_api->Object_CallMethod_Short(env, object, method, &sum, arg1, arg2), ANI_OK);
    ASSERT_EQ(sum, arg1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->c_api->Object_CallMethod_Short(nullptr, object, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Short(object, nullptr, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, nullptr, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ani_short arg1 = VAL2;
    ani_short arg2 = VAL3;
    ASSERT_EQ(env->Object_CallMethod_Short(nullptr, method, &sum, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &sum, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethodVoidParam";
    paramObjOperation.signature = ":s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethodMultipleParam";
    paramObjOperation.signature = "izfss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[5U] = {};
    ani_int arg1 = VAL;
    ani_boolean arg2 = ANI_TRUE;
    ani_float arg3 = 3.0F;
    ani_short arg4 = 4U;
    ani_short arg5 = VAL2;
    args[0U].i = arg1;
    args[1U].z = arg2;
    args[2U].f = arg3;
    args[3U].s = arg4;
    args[4U].s = arg5;

    ani_short result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(result, arg4 + arg5);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, arg4 + arg5);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL2 = 5U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.B";
    paramObjOperation.methodName = "shortMethodVoidParam";
    paramObjOperation.signature = ":s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_short VAL = 2U;
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodShort.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodShort.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_short result = 0U;
    ani_value args[2U] = {};
    ani_short arg1 = VAL;
    ani_short arg2 = VAL1;
    args[0U].s = arg1;
    args[1U].s = arg2;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = 0U;
    ani_value args[2U] = {};
    ani_short arg1 = VAL3;
    ani_short arg2 = VAL1;
    args[0U].s = arg1;
    args[1U].s = arg2;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "shortMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_short arg1 = VAL1;
    ani_short arg2 = 4U;
    args[0U].s = arg1;
    args[1U].s = arg2;

    for (ani_short i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
        ASSERT_EQ(result, 4U);
        ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
        ASSERT_EQ(result, 4U);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ss:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ani_value args[2U] = {};
    ani_short arg1 = VAL1;
    ani_short arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1, arg2), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Short_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_short INIT_VALUE = 0U;
    constexpr ani_short VAL1 = 3U;
    constexpr ani_short VAL4 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodShort.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "s:s";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_short result = INIT_VALUE;
    ani_value args[1U] = {};
    ani_short arg1 = VAL1;
    args[0U].i = arg1;
    ASSERT_EQ(env->Object_CallMethod_Short(object, method, &result, arg1), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ASSERT_EQ(env->Object_CallMethod_Short_A(object, method, &result, args), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int GetValueMethod(ani_env *env, ani_method *checkMethod)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ASSERT_EQ(env->Class_FindMethod(cls, "getCount", ":i", checkMethod), ANI_OK);
    ASSERT_NE(checkMethod, nullptr);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method getMethod {};
    GetValueMethod(env, &getMethod);

    ani_value args[2];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0].i = arg1;
    args[1].i = arg2;
    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, getMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, args[0].i + args[1].i);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method getMethod {};
    GetValueMethod(env, &getMethod);

    ani_int a = 4;
    ani_int b = 5;
    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, a, b), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, getMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, a + b);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int INIT_VALUE = 0U;
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method getMethod {};
    GetValueMethod(env, &getMethod);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ani_int sum = INIT_VALUE;
    ASSERT_EQ(env->c_api->Object_CallMethod_Void(env, object, method, a, b), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, getMethod, &sum), ANI_OK);
    ASSERT_EQ(sum, a + b);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ASSERT_EQ(env->c_api->Object_CallMethod_Void(nullptr, object, method, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ASSERT_EQ(env->Object_CallMethod_Void(object, nullptr, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL3 = 6U;
    constexpr ani_int VAL6 = 7U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int a = VAL3;
    ani_int b = VAL6;
    ASSERT_EQ(env->Object_CallMethod_Void(nullptr, method, a, b), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0].i = arg1;
    args[1].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, nullptr, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2];
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0].i = arg1;
    args[1].i = arg2;
    ASSERT_EQ(env->Object_CallMethod_Void_A(nullptr, method, args), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_int arg1 = 2;
    ani_int arg2 = 3;

    ASSERT_EQ(env->c_api->Object_CallMethod_Void(nullptr, object, method, arg1, arg2), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 10U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethodVoidParam";
    paramObjOperation.signature = ":";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);

    ani_int result {};
    ASSERT_EQ(env->Object_CallMethod_Void(object, method), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethodMultipleParam";
    paramObjOperation.signature = "izfif:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    const ani_int arg1 = VAL;
    const ani_boolean arg2 = ANI_TRUE;
    const ani_float arg3 = 3.0F;
    const ani_int arg4 = 4U;
    const ani_float arg5 = 5.0F;
    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2, arg3, arg4, arg5), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL4 = 10U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.B";
    paramObjOperation.methodName = "voidMethodVoidParam";
    paramObjOperation.signature = ":";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);

    ani_value args[2U];
    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL4);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL = 2U;
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL2 = 5U;
    ani_class clsC {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.C", &clsC), ANI_OK);
    ASSERT_NE(clsC, nullptr);

    ani_method method {};
    ASSERT_EQ(env->Class_FindMethod(clsC, "func", nullptr, &method), ANI_OK);
    ASSERT_NE(method, nullptr);

    ani_class clsD {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.D", &clsD), ANI_OK);
    ASSERT_NE(clsD, nullptr);
    ani_method ctor {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "<ctor>", ":", &ctor), ANI_OK);

    ani_object object {};
    ASSERT_EQ(env->Object_New(clsD, ctor, &object), ANI_OK);
    ASSERT_NE(object, nullptr);

    ani_value args[2U] = {};
    ani_int arg1 = VAL;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int result = 0;
    ani_method checkMethod {};
    ASSERT_EQ(env->Class_FindMethod(clsD, "getCount", ":i", &checkMethod), ANI_OK);
    ASSERT_NE(checkMethod, nullptr);

    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL2);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.E";
    paramObjOperation.methodName = "func";
    paramObjOperation.signature = nullptr;
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_int result = 0;
    ani_value args[2U] = {};
    ani_int arg1 = VAL3;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodVoid.E", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    ani_method checkMethod {};
    ASSERT_EQ(env->Class_FindMethod(cls, "getCount", ":i", &checkMethod), ANI_OK);
    ASSERT_NE(checkMethod, nullptr);

    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL1);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL1);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "voidMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);

    for (ani_int i = 0; i < VAL1; i++) {
        ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
        ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
        ASSERT_EQ(result, VAL3);
        ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
        ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
        ASSERT_EQ(result, VAL3);
    }
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL3 = 6U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "nestedMethod";
    paramObjOperation.signature = "ii:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[2U] = {};
    ani_int arg1 = VAL1;
    ani_int arg2 = VAL1;
    args[0U].i = arg1;
    args[1U].i = arg2;

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1, arg2), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL3);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Void_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    constexpr ani_int VAL1 = 3U;
    constexpr ani_int VAL5 = 103U;
    ani_method method {};
    ParamObj paramObjOperation;
    paramObjOperation.className = "entry.src.main.src.ets.ObjectOperationsMethodVoid.A";
    paramObjOperation.methodName = "recursionMethod";
    paramObjOperation.signature = "i:";
    GetMethodAndObject(env, &paramObjOperation, &object, &method);

    ani_value args[1U] = {};
    ani_int arg1 = VAL1;
    args[0U].i = arg1;

    ani_int result = 0;
    ani_method checkMethod {};
    GetValueMethod(env, &checkMethod);
    ASSERT_EQ(env->Object_CallMethod_Void(object, method, arg1), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL5);

    ASSERT_EQ(env->Object_CallMethod_Void_A(object, method, args), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Int(object, checkMethod, &result), ANI_OK);
    ASSERT_EQ(result, VAL5);
    return ANI_TRUE;
}

ani_int GetMethodData(ani_env *env, ani_object *objectResult)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.A", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_static_method newMethod {};
    ASSERT_EQ(
        env->Class_FindStaticMethod(cls, "new_A",
            ":C{entry.src.main.src.ets.ObjectOperationsMethodByNameBoolean.A}", &newMethod),
        ANI_OK);
    ani_ref ref {};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, newMethod, &ref), ANI_OK);
    *objectResult = static_cast<ani_object>(ref);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_value args[2U];
    args[0U].i = VAL1;
    args[1U].i = VAL2;

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean_A(object, "booleanByNameMethod", "ii:z", &res, args), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", "ii:z", &res, VAL1, VAL2), ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "booleanByNameMethod", "ii:x", &res, VAL1, VAL2),
              ANI_NOT_FOUND);
    ASSERT_EQ(env->Object_CallMethodByName_Boolean(object, "unknown_function", "ii:z", &res, VAL1, VAL2),
              ANI_NOT_FOUND);
    return ANI_TRUE;
}

ani_int test_Object_Call_Method_Boolean_By_Name_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object1)
{
    constexpr ani_int VAL1 = 5;
    constexpr ani_int VAL2 = 6;
    ani_object object {};
    GetMethodData(env, &object);

    ani_boolean res = ANI_FALSE;
    ASSERT_EQ(
        env->c_api->Object_CallMethodByName_Boolean(env, object, "booleanByNameMethod", "ii:z", &res, VAL1, VAL2),
        ANI_OK);
    ASSERT_EQ(res, ANI_TRUE);
    return ANI_TRUE;
}
#endif //ARKTS_ANI_TEST_OBJECTOPERATIONS_H
