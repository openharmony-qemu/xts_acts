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

ani_int test_Object_New_V([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls {};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.ObjectOperations.Test", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_method ctor {};
    const char *tmpName = "iC{std.core.String}C{entry.src.main.src.ets.ObjectOperations.Animal}:";
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", tmpName, &ctor), ANI_OK);
    ASSERT_NE(ctor, nullptr);

    ani_string tag {};
    ASSERT_EQ(GetTestString(env, &tag), ANI_TRUE);
    auto animalRef = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "newAnimalObject");

    ani_object tmpObj {};
    ani_int value1 = 200;
    ASSERT_EQ(TestFuncV(env, cls, ctor, &tmpObj, value1, tag, animalRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Reference_IsNullishValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    auto ref = CallEtsFunctionV<ani_ref>(env, "entry.src.main.src.ets.ObjectOperations", "getNull");
    ani_boolean isUndefined = ANI_FALSE;
    ASSERT_EQ(env->Reference_IsNullishValue(ref, &isUndefined), ANI_OK);
    ASSERT_EQ(isUndefined, ANI_TRUE);
    return ANI_TRUE;
}

#endif //ARKTS_ANI_TEST_OBJECTOPERATIONS_H
