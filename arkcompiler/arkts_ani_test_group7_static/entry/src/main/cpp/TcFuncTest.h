/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef TC_FUNC_TEST_H
#define TC_FUNC_TEST_H
#include "Common.h"
#include <chrono>
#include <iostream>
#include <string>
#include <thread>
namespace ani_tc_func {
constexpr ani_int FUNC_ARG_MISMATCH_VALUE = 10;
constexpr ani_int FUNC_CLOSURE_VALUE = 5;
constexpr ani_int FUNC_ASYNC_VALUE = 9;
constexpr ani_int FUNC_REUSE_BEGIN = 1;
constexpr ani_int FUNC_REUSE_END = 3;
constexpr ani_int FUNC_REST_FIRST_VALUE = 1;
constexpr ani_int FUNC_REST_SECOND_VALUE = 2;
constexpr ani_int FUNC_REST_THIRD_VALUE = 3;
constexpr ani_int FUNC_REST_ARG_COUNT = 3;
constexpr ani_int FUNC_UNDEFINED_FIRST_VALUE = 7;
constexpr ani_int FUNC_TWO_ARG_COUNT = 2;
constexpr ani_double FUNC_MULTIPLY_LEFT = 3.14;
constexpr ani_double FUNC_MULTIPLY_RIGHT = 2.0;
inline std::string FuncAniStringToStd(ani_env *env, ani_string str)
{
    ani_size size = 0;
    env->String_GetUTF8Size(str, &size);
    std::string result(size, '\0');
    ani_size written = 0;
    env->String_GetUTF8(str, result.data(), size + 1, &written);
    return result;
}
inline ani_string FuncStdToAniString(ani_env *env, const std::string &value)
{
    ani_string result {};
    env->String_NewUTF8(value.c_str(), value.size(), &result);
    return result;
}
inline bool FuncHasPendingError(ani_env *env)
{
    ani_boolean pending = ANI_FALSE;
    env->ExistUnhandledError(&pending);
    return pending == ANI_TRUE;
}
inline void FuncClearPendingError(ani_env *env)
{
    ani_error error {};
    if (env->GetUnhandledError(&error) == ANI_OK) {
        env->ResetError();
    }
}
}
ani_boolean test_FuncCallCallback(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_ref resultRef {};
    ani_status status = env->FunctionalObject_Call(cb, 0, nullptr, &resultRef);
    ani_boolean pending = ANI_FALSE;
    env->ExistUnhandledError(&pending);
    std::cout << "test_FuncCallCallback status: " << status
              << ", pending: " << static_cast<int>(pending) << std::endl;
    if (pending == ANI_TRUE) {
        env->DescribeError();
        ani_tc_func::FuncClearPendingError(env);
    }
    return (status == ANI_OK && pending == ANI_FALSE) ? ANI_TRUE : ANI_FALSE;
}
ani_int test_FuncCallAdd(ani_env *env, ani_object object, ani_fn_object cb, ani_int a, ani_int b)
{
    (void)object;
    ani_object arg0 {};
    ani_object arg1 {};
    env->Primitive_Box_Int(a, &arg0);
    env->Primitive_Box_Int(b, &arg1);
    ani_ref argv[ani_tc_func::FUNC_TWO_ARG_COUNT] = {arg0, arg1};
    ani_ref resultRef {};
    env->FunctionalObject_Call(cb, ani_tc_func::FUNC_TWO_ARG_COUNT, argv, &resultRef);
    ani_int result = 0;
    env->Primitive_Unbox_Int(static_cast<ani_object>(resultRef), &result);
    return result;
}
ani_double test_FuncCallMultiplyDouble(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_object arg0 {};
    ani_object arg1 {};
    env->Primitive_Box_Double(ani_tc_func::FUNC_MULTIPLY_LEFT, &arg0);
    env->Primitive_Box_Double(ani_tc_func::FUNC_MULTIPLY_RIGHT, &arg1);
    ani_ref argv[ani_tc_func::FUNC_TWO_ARG_COUNT] = {arg0, arg1};
    ani_ref resultRef {};
    env->FunctionalObject_Call(cb, ani_tc_func::FUNC_TWO_ARG_COUNT, argv, &resultRef);
    ani_double result = 0.0;
    env->Primitive_Unbox_Double(static_cast<ani_object>(resultRef), &result);
    return result;
}
ani_string test_FuncCallGreeting(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_string name = ani_tc_func::FuncStdToAniString(env, "World");
    ani_ref argv[ani_tc_func::FUNC_REUSE_BEGIN] = {name};
    ani_ref resultRef {};
    env->FunctionalObject_Call(cb, ani_tc_func::FUNC_REUSE_BEGIN, argv, &resultRef);
    return static_cast<ani_string>(resultRef);
}
ani_string test_FuncCallPersonName(ani_env *env, ani_object object, ani_fn_object cb, ani_object person)
{
    (void)object;
    ani_ref argv[ani_tc_func::FUNC_REUSE_BEGIN] = {person};
    ani_ref resultRef {};
    env->FunctionalObject_Call(cb, ani_tc_func::FUNC_REUSE_BEGIN, argv, &resultRef);
    return static_cast<ani_string>(resultRef);
}
ani_boolean test_FuncCallArgMismatch(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_object arg0 {};
    env->Primitive_Box_Int(ani_tc_func::FUNC_ARG_MISMATCH_VALUE, &arg0);
    ani_ref argv[ani_tc_func::FUNC_REUSE_BEGIN] = {arg0};
    ani_ref resultRef {};
    ani_status status = env->FunctionalObject_Call(cb, ani_tc_func::FUNC_REUSE_BEGIN, argv, &resultRef);
    if (status != ANI_OK || ani_tc_func::FuncHasPendingError(env)) {
        ani_tc_func::FuncClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_boolean test_FuncInvalidCallback(ani_env *env, ani_object object, ani_ref cb)
{
    (void)object;
    ani_boolean isNull = ANI_FALSE;
    ani_boolean isUndefined = ANI_FALSE;
    env->Reference_IsNull(cb, &isNull);
    env->Reference_IsUndefined(cb, &isUndefined);
    if (isNull == ANI_TRUE || isUndefined == ANI_TRUE) {
        return ANI_TRUE;
    }
    ani_status status = env->FunctionalObject_Call(static_cast<ani_fn_object>(cb), 0, nullptr, nullptr);
    if (status != ANI_OK || ani_tc_func::FuncHasPendingError(env)) {
        ani_tc_func::FuncClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_int test_FuncCallClosure(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_object arg {};
    env->Primitive_Box_Int(ani_tc_func::FUNC_CLOSURE_VALUE, &arg);
    ani_ref argv[ani_tc_func::FUNC_REUSE_BEGIN] = {arg};
    ani_ref resultRef {};
    env->FunctionalObject_Call(cb, ani_tc_func::FUNC_REUSE_BEGIN, argv, &resultRef);
    ani_int result = 0;
    env->Primitive_Unbox_Int(static_cast<ani_object>(resultRef), &result);
    return result;
}
ani_boolean test_FuncAsyncCallback(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_object arg {};
    env->Primitive_Box_Int(ani_tc_func::FUNC_ASYNC_VALUE, &arg);
    ani_ref argv[ani_tc_func::FUNC_REUSE_BEGIN] = {arg};
    ani_status status = env->FunctionalObject_Call(cb, ani_tc_func::FUNC_REUSE_BEGIN, argv, nullptr);
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_int test_FuncReuseCallback(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_int total = 0;
    for (ani_int i = ani_tc_func::FUNC_REUSE_BEGIN; i <= ani_tc_func::FUNC_REUSE_END; i++) {
        ani_object arg {};
        env->Primitive_Box_Int(i, &arg);
        ani_ref argv[ani_tc_func::FUNC_REUSE_BEGIN] = {arg};
        ani_ref resultRef {};
        env->FunctionalObject_Call(cb, ani_tc_func::FUNC_REUSE_BEGIN, argv, &resultRef);
        ani_int value = 0;
        env->Primitive_Unbox_Int(static_cast<ani_object>(resultRef), &value);
        total += value;
    }
    return total;
}
ani_boolean test_FuncCatchThrown(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_status status = env->FunctionalObject_Call(cb, 0, nullptr, nullptr);
    if (status != ANI_OK || ani_tc_func::FuncHasPendingError(env)) {
        ani_tc_func::FuncClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_string test_FuncPersistentCallback(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_ref globalRef {};
    env->GlobalReference_Create(cb, &globalRef);
    ani_ref resultRef {};
    env->FunctionalObject_Call(static_cast<ani_fn_object>(globalRef), 0, nullptr, &resultRef);
    env->GlobalReference_Delete(globalRef);
    return static_cast<ani_string>(resultRef);
}
ani_int test_FuncRestCallback(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_object arg0 {};
    ani_object arg1 {};
    ani_object arg2 {};
    env->Primitive_Box_Int(ani_tc_func::FUNC_REST_FIRST_VALUE, &arg0);
    env->Primitive_Box_Int(ani_tc_func::FUNC_REST_SECOND_VALUE, &arg1);
    env->Primitive_Box_Int(ani_tc_func::FUNC_REST_THIRD_VALUE, &arg2);
    ani_ref argv[ani_tc_func::FUNC_REST_ARG_COUNT] = {arg0, arg1, arg2};
    ani_ref resultRef {};
    env->FunctionalObject_Call(cb, ani_tc_func::FUNC_REST_ARG_COUNT, argv, &resultRef);
    ani_int result = 0;
    env->Primitive_Unbox_Int(static_cast<ani_object>(resultRef), &result);
    return result;
}
ani_int test_FuncUndefinedArg(ani_env *env, ani_object object, ani_fn_object cb)
{
    (void)object;
    ani_object arg0 {};
    env->Primitive_Box_Int(ani_tc_func::FUNC_UNDEFINED_FIRST_VALUE, &arg0);
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    ani_ref argv[ani_tc_func::FUNC_TWO_ARG_COUNT] = {arg0, undefinedRef};
    ani_ref resultRef {};
    env->FunctionalObject_Call(cb, ani_tc_func::FUNC_TWO_ARG_COUNT, argv, &resultRef);
    ani_int result = 0;
    env->Primitive_Unbox_Int(static_cast<ani_object>(resultRef), &result);
    return result;
}
#endif
