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

#ifndef TC_PARAM_TEST_H
#define TC_PARAM_TEST_H
#include "Common.h"
#include <chrono>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_param {
inline bool g_paramLogFirstOk = false;
inline bool g_paramLogSecondOk = false;
inline int g_paramLogCount = 0;
constexpr ani_int PARAM_LOG_FIRST_LEVEL = 1;
constexpr ani_int PARAM_LOG_SECOND_LEVEL = 2;
constexpr int PARAM_LOG_EXPECTED_COUNT = 2;
constexpr ani_double PARAM_PERF_DOUBLE_VALUE = 3.14;
inline std::string ParamStringToStd(ani_env *env, ani_string str)
{
    ani_size size = 0;
    if (env->String_GetUTF8Size(str, &size) != ANI_OK) {
        return "";
    }
    std::vector<char> buffer(size + 1);
    ani_size written = 0;
    if (env->String_GetUTF8(str, buffer.data(), size + 1, &written) != ANI_OK) {
        return "";
    }
    return std::string(buffer.data(), written);
}
inline ani_string ParamStdToString(ani_env *env, const std::string &value)
{
    ani_string result {};
    env->String_NewUTF8(value.c_str(), value.size(), &result);
    return result;
}
inline bool ParamIsUndefined(ani_env *env, ani_ref ref)
{
    ani_boolean result = ANI_FALSE;
    env->Reference_IsUndefined(ref, &result);
    return result == ANI_TRUE;
}
inline bool ParamInstanceOf(ani_env *env, ani_object obj, const char *clsName)
{
    ani_class cls {};
    if (env->FindClass(clsName, &cls) != ANI_OK) {
        return false;
    }
    ani_boolean result = ANI_FALSE;
    if (env->Object_InstanceOf(obj, cls, &result) != ANI_OK) {
        return false;
    }
    return result == ANI_TRUE;
}
inline ani_double ParamUnboxDoubleValue(ani_env *env, ani_ref ref)
{
    ani_double value = 0.0;
    env->Primitive_Unbox_Double(static_cast<ani_object>(ref), &value);
    return value;
}
inline ani_int ParamUnboxIntValue(ani_env *env, ani_ref ref)
{
    ani_int value = 0;
    env->Primitive_Unbox_Int(static_cast<ani_object>(ref), &value);
    return value;
}
inline ani_long NowNs()
{
    auto now = std::chrono::steady_clock::now().time_since_epoch();
    return static_cast<ani_long>(std::chrono::duration_cast<std::chrono::nanoseconds>(now).count());
}
}
ani_object test_ParamBoxInt(ani_env *env, ani_object object, ani_int value)
{
    (void)object;
    ani_object boxed {};
    env->Primitive_Box_Int(value, &boxed);
    return boxed;
}
ani_object test_ParamBoxDouble(ani_env *env, ani_object object, ani_double value)
{
    (void)object;
    ani_object boxed {};
    env->Primitive_Box_Double(value, &boxed);
    return boxed;
}
ani_object test_ParamBoxBoolean(ani_env *env, ani_object object, ani_boolean value)
{
    (void)object;
    ani_object boxed {};
    env->Primitive_Box_Boolean(value, &boxed);
    return boxed;
}
ani_object test_ParamCreateDoubleBoxed(ani_env *env, ani_object object, ani_double value)
{
    (void)object;
    ani_class cls {};
    env->FindClass("std.core.Double", &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "d:", &ctor);
    ani_object result {};
    env->Object_New(cls, ctor, &result, value);
    return result;
}
ani_double test_ParamUnboxDouble(ani_env *env, ani_object object, ani_object boxed)
{
    (void)object;
    ani_double value = 0.0;
    env->Primitive_Unbox_Double(boxed, &value);
    return value;
}
ani_double test_ParamUnboxWithMethod(ani_env *env, ani_object object, ani_object boxed)
{
    (void)object;
    ani_double value = 0.0;
    env->Object_CallMethodByName_Double(boxed, "toDouble", ":d", &value);
    return value;
}
ani_int test_ParamWrongUnbox(ani_env *env, ani_object object, ani_object boxed)
{
    (void)object;
    ani_int value = 0;
    ani_status status = env->Primitive_Unbox_Int(boxed, &value);
    std::cout << "test_ParamWrongUnbox status: " << status << ", value: " << value << std::endl;
    return value;
}
ani_int test_ParamProcessArray(ani_env *env, ani_object object, ani_array arr)
{
    (void)object;
    ani_size length = 0;
    env->Array_GetLength(arr, &length);
    ani_int stringCount = 0;
    ani_int numberCount = 0;
    for (ani_size i = 0; i < length; i++) {
        ani_ref item {};
        env->Array_Get(arr, i, &item);
        if (ani_tc_param::ParamInstanceOf(env, static_cast<ani_object>(item), "std.core.String")) {
            stringCount++;
        } else if (ani_tc_param::ParamInstanceOf(env, static_cast<ani_object>(item), "std.core.Double") ||
            ani_tc_param::ParamInstanceOf(env, static_cast<ani_object>(item), "std.core.Int")) {
            numberCount++;
        }
    }
    return stringCount + numberCount;
}
ani_int test_ParamSumFixedIntArray(ani_env *env, ani_object object, ani_fixedarray_int arr)
{
    (void)object;
    ani_size length = 0;
    env->FixedArray_GetLength(arr, &length);
    ani_int sum = 0;
    for (ani_size i = 0; i < length; i++) {
        ani_int value = 0;
        env->FixedArray_GetRegion_Int(arr, i, 1, &value);
        sum += value;
    }
    return sum;
}
ani_string test_ParamIdentify(ani_env *env, ani_object object, ani_object arg)
{
    (void)object;
    if (ani_tc_param::ParamInstanceOf(env, arg, "std.core.String")) {
        return ani_tc_param::ParamStdToString(env, "string");
    }
    if (ani_tc_param::ParamInstanceOf(env, arg, "std.core.Double") ||
        ani_tc_param::ParamInstanceOf(env, arg, "std.core.Int")) {
        return ani_tc_param::ParamStdToString(env, "number");
    }
    return ani_tc_param::ParamStdToString(env, "other");
}
ani_string test_ParamHandleCI(ani_env *env, ani_object object, ani_object arg)
{
    (void)object;
    if (ani_tc_param::ParamInstanceOf(env, arg, "entry.src.main.src.ets.Index.ParamC")) {
        return ani_tc_param::ParamStdToString(env, "ParamC");
    }
    if (ani_tc_param::ParamInstanceOf(env, arg, "entry.src.main.src.ets.Index.ParamI")) {
        return ani_tc_param::ParamStdToString(env, "ParamI");
    }
    return ani_tc_param::ParamStdToString(env, "other");
}
ani_string test_ParamGreet(ani_env *env, ani_object object, ani_ref nameRef, ani_ref ageRef)
{
    (void)object;
    std::string name = "anonymous";
    std::string age = "";
    if (!ani_tc_param::ParamIsUndefined(env, nameRef)) {
        name = ani_tc_param::ParamStringToStd(env, static_cast<ani_string>(nameRef));
    }
    if (!ani_tc_param::ParamIsUndefined(env, ageRef)) {
        ani_int ageValue = 0;
        env->Primitive_Unbox_Int(static_cast<ani_object>(ageRef), &ageValue);
        age = "," + std::to_string(ageValue);
    }
    return ani_tc_param::ParamStdToString(env, name + age);
}
ani_boolean test_ParamCheckOptional(ani_env *env, ani_object object, ani_ref arg)
{
    (void)object;
    return ani_tc_param::ParamIsUndefined(env, arg) ? ANI_TRUE : ANI_FALSE;
}
void test_ParamLog(ani_env *env, ani_object object, ani_int level, ani_string msg)
{
    (void)object;
    std::string value = ani_tc_param::ParamStringToStd(env, msg);
    if (ani_tc_param::g_paramLogCount == 0) {
        ani_tc_param::g_paramLogFirstOk =
            (level == ani_tc_param::PARAM_LOG_FIRST_LEVEL && value == "info");
    } else if (ani_tc_param::g_paramLogCount == 1) {
        ani_tc_param::g_paramLogSecondOk =
            (level == ani_tc_param::PARAM_LOG_SECOND_LEVEL && value == "error");
    }
    ani_tc_param::g_paramLogCount++;
}
ani_boolean test_CheckParamLog(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_param::g_paramLogFirstOk &&
        ani_tc_param::g_paramLogSecondOk &&
        ani_tc_param::g_paramLogCount == ani_tc_param::PARAM_LOG_EXPECTED_COUNT;
    ani_tc_param::g_paramLogFirstOk = false;
    ani_tc_param::g_paramLogSecondOk = false;
    ani_tc_param::g_paramLogCount = 0;
    return result ? ANI_TRUE : ANI_FALSE;
}
ani_string test_ParamSum(ani_env *env, ani_object object, ani_string prefix, ani_array nums)
{
    (void)object;
    ani_size length = 0;
    env->Array_GetLength(nums, &length);
    ani_int sum = 0;
    for (ani_size i = 0; i < length; i++) {
        ani_ref item {};
        env->Array_Get(nums, i, &item);
        sum += ani_tc_param::ParamUnboxIntValue(env, item);
    }
    return ani_tc_param::ParamStdToString(env, ani_tc_param::ParamStringToStd(env, prefix) + std::to_string(sum));
}
ani_int test_ParamFoo(ani_env *env, ani_object object, ani_int a, ani_array b)
{
    (void)object;
    ani_size length = 0;
    env->Array_GetLength(b, &length);
    ani_int sum = a;
    for (ani_size i = 0; i < length; i++) {
        ani_ref item {};
        env->Array_Get(b, i, &item);
        sum += ani_tc_param::ParamUnboxIntValue(env, item);
    }
    return sum;
}
ani_string test_ParamProcessOrUndefined(ani_env *env, ani_object object, ani_ref arg)
{
    (void)object;
    if (ani_tc_param::ParamIsUndefined(env, arg)) {
        return ani_tc_param::ParamStdToString(env, "undefined");
    }
    ani_double value = ani_tc_param::ParamUnboxDoubleValue(env, arg);
    return ani_tc_param::ParamStdToString(env, "number:" + std::to_string(value));
}
ani_string test_ParamProcessComplexUnion(ani_env *env, ani_object object, ani_ref arg)
{
    (void)object;
    if (ani_tc_param::ParamIsUndefined(env, arg)) {
        return ani_tc_param::ParamStdToString(env, "undefined");
    }
    if (ani_tc_param::ParamInstanceOf(env, static_cast<ani_object>(arg), "std.core.String")) {
        return ani_tc_param::ParamStdToString(env, "string");
    }
    if (ani_tc_param::ParamInstanceOf(env, static_cast<ani_object>(arg), "std.core.Double") ||
        ani_tc_param::ParamInstanceOf(env, static_cast<ani_object>(arg), "std.core.Int")) {
        return ani_tc_param::ParamStdToString(env, "number");
    }
    return ani_tc_param::ParamStdToString(env, "other");
}
ani_object test_ParamGenericFunc(ani_env *env, ani_object object, ani_object arg)
{
    (void)env;
    (void)object;
    return arg;
}
ani_long test_ParamFastBoxPerf(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_long start = ani_tc_param::NowNs();
    for (ani_int i = 0; i < count; i++) {
        ani_object boxed {};
        env->Primitive_Box_Int(i, &boxed);
    }
    return ani_tc_param::NowNs() - start;
}
ani_long test_ParamTraditionalBoxPerf(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_class cls {};
    env->FindClass("std.core.Int", &cls);
    ani_method ctor {};
    env->Class_FindMethod(cls, "<ctor>", "i:", &ctor);
    ani_long start = ani_tc_param::NowNs();
    for (ani_int i = 0; i < count; i++) {
        ani_object boxed {};
        env->Object_New(cls, ctor, &boxed, i);
    }
    return ani_tc_param::NowNs() - start;
}
ani_long test_ParamFastUnboxPerf(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_object boxed {};
    env->Primitive_Box_Double(ani_tc_param::PARAM_PERF_DOUBLE_VALUE, &boxed);
    ani_long start = ani_tc_param::NowNs();
    for (ani_int i = 0; i < count; i++) {
        ani_double value = 0.0;
        env->Primitive_Unbox_Double(boxed, &value);
    }
    return ani_tc_param::NowNs() - start;
}
ani_long test_ParamMethodUnboxPerf(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_object boxed {};
    env->Primitive_Box_Double(ani_tc_param::PARAM_PERF_DOUBLE_VALUE, &boxed);
    ani_long start = ani_tc_param::NowNs();
    for (ani_int i = 0; i < count; i++) {
        ani_double value = 0.0;
        env->Object_CallMethodByName_Double(boxed, "toDouble", ":d", &value);
    }
    return ani_tc_param::NowNs() - start;
}
#endif
