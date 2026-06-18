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

#ifndef TC_MANGLING_TEST_H
#define TC_MANGLING_TEST_H
#include "Common.h"
#include <cmath>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_mangling {
inline bool g_requiredIntOk = false;
inline bool g_optionalIntWithValueOk = false;
inline bool g_optionalIntWithoutValueOk = false;
inline int g_complexCallCount = 0;
inline bool g_optionalBasicCall1Ok = false;
inline bool g_optionalBasicCall2Ok = false;
inline bool g_optionalBasicCall3Ok = false;
inline int g_optionalBasicCallCount = 0;
inline bool g_restLogOk = false;
inline bool g_execFunctionOk = false;
inline bool g_doNothingCalled = false;
inline bool g_doNothingAgainCalled = false;
inline bool g_useMyClassOk = false;
inline bool g_updateUserOk = false;
constexpr ani_int MANGLING_REQUIRED_INT_VALUE = 42;
constexpr ani_int MANGLING_OPTIONAL_INT_VALUE = 100;
constexpr ani_int MANGLING_COMPLEX_A_VALUE = 1;
constexpr int MANGLING_COMPLEX_EXPECTED_COUNT = 4;
constexpr ani_int MANGLING_OPTIONAL_BASIC_VALUE = 10;
constexpr int MANGLING_OPTIONAL_BASIC_CALL_ONE = 1;
constexpr int MANGLING_OPTIONAL_BASIC_CALL_TWO = 2;
constexpr int MANGLING_OPTIONAL_BASIC_CALL_THREE = 3;
constexpr int MANGLING_OPTIONAL_BASIC_EXPECTED_COUNT = 3;
constexpr ani_int MANGLING_REST_EXPECTED_SUM = 10;
constexpr ani_int MANGLING_MY_CLASS_EXPECTED_VALUE = 17;
constexpr ani_byte MANGLING_EXPECT_BYTE = 7;
constexpr ani_char MANGLING_EXPECT_CHAR = 65;
constexpr ani_short MANGLING_EXPECT_SHORT = 1024;
constexpr ani_int MANGLING_EXPECT_INT = 2048;
constexpr ani_long MANGLING_EXPECT_LONG = 4096;
constexpr ani_float MANGLING_EXPECT_FLOAT = 3.5F;
constexpr ani_float MANGLING_FLOAT_EPSILON = 0.001F;
std::string ManglingStringToStd(ani_env *env, ani_string str)
{
    if (str == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (status != ANI_OK) {
        return "";
    }
    std::vector<char> buffer(size + 1);
    ani_size written = 0;
    status = env->String_GetUTF8(str, buffer.data(), size + 1, &written);
    if (status != ANI_OK) {
        return "";
    }
    return std::string(buffer.data(), written);
}
inline ani_string StdToManglingString(ani_env *env, const std::string &value)
{
    ani_string result {};
    env->String_NewUTF8(value.c_str(), value.size(), &result);
    return result;
}
bool IsUndefinedRef(ani_env *env, ani_ref ref)
{
    if (ref == nullptr) {
        return true;
    }
    ani_boolean isUndefined = ANI_FALSE;
    ani_status status = env->Reference_IsUndefined(ref, &isUndefined);
    if (status == ANI_OK && isUndefined == ANI_TRUE) {
        return true;
    }
    ani_boolean isNullish = ANI_FALSE;
    status = env->Reference_IsNullishValue(ref, &isNullish);
    if (status == ANI_OK && isNullish == ANI_TRUE) {
        return true;
    }
    return false;
}
ani_int UnboxIntByMethod(ani_env *env, ani_ref ref)
{
    ani_int value = 0;
    if (ref == nullptr) {
        return value;
    }
    ani_status status = env->Object_CallMethodByName_Int(static_cast<ani_object>(ref), "unboxed", ":i", &value);
    if (status != ANI_OK) {
        status = env->Object_CallMethodByName_Int(static_cast<ani_object>(ref), "toInt", ":i", &value);
    }
    if (status != ANI_OK) {
        return 0;
    }
    return value;
}
ani_double UnboxDoubleByMethod(ani_env *env, ani_ref ref)
{
    ani_double value = 0;
    if (ref == nullptr) {
        return value;
    }
    ani_status status = env->Object_CallMethodByName_Double(static_cast<ani_object>(ref), "unboxed", ":d", &value);
    if (status != ANI_OK) {
        status = env->Object_CallMethodByName_Double(static_cast<ani_object>(ref), "toDouble", ":d", &value);
    }
    if (status != ANI_OK) {
        return 0;
    }
    return value;
}
inline ani_long BigIntToLong(ani_env *env, ani_object bigint)
{
    ani_long value = 0;
    env->Object_CallMethodByName_Long(bigint, "getLong", ":l", &value);
    return value;
}
ani_object LongToBigInt(ani_env *env, ani_long value)
{
    ani_class bigintCls {};
    if (env->FindClass("std.core.BigInt", &bigintCls) != ANI_OK) {
        return nullptr;
    }
    ani_method ctor {};
    if (env->Class_FindMethod(bigintCls, "<ctor>", "l:", &ctor) != ANI_OK) {
        return nullptr;
    }
    ani_object result {};
    if (env->Object_New(bigintCls, ctor, &result, value) != ANI_OK) {
        return nullptr;
    }
    return result;
}
inline void ResetComplexOptionalState()
{
    g_complexCallCount = 0;
}
inline void ResetOptionalBasicState()
{
    g_optionalBasicCallCount = 0;
    g_optionalBasicCall1Ok = false;
    g_optionalBasicCall2Ok = false;
    g_optionalBasicCall3Ok = false;
}
struct PrimitiveArgs {
    ani_boolean a;
    ani_byte b;
    ani_char c;
    ani_short d;
    ani_int e;
    ani_long f;
    ani_float g;
    ani_double h;
};
inline bool CheckPrimitiveArgs(const PrimitiveArgs &args)
{
    return args.a == ANI_TRUE &&
        args.b == MANGLING_EXPECT_BYTE &&
        args.c == MANGLING_EXPECT_CHAR &&
        args.d == MANGLING_EXPECT_SHORT &&
        args.e == MANGLING_EXPECT_INT &&
        args.f == MANGLING_EXPECT_LONG &&
        std::fabs(args.g - MANGLING_EXPECT_FLOAT) < MANGLING_FLOAT_EPSILON;
}
}
ani_double test_SumDouble(ani_env *env, ani_object object, ani_double a, ani_double b)
{
    (void)env;
    (void)object;
    return a + b;
}
ani_string test_ManglingConcat(ani_env *env, ani_object object, ani_string a, ani_string b)
{
    (void)object;
    std::string left = ani_tc_mangling::ManglingStringToStd(env, a);
    std::string right = ani_tc_mangling::ManglingStringToStd(env, b);
    return ani_tc_mangling::StdToManglingString(env, left + right);
}
ani_boolean test_IsEqual(ani_env *env, ani_object object, ani_boolean a, ani_boolean b)
{
    (void)env;
    (void)object;
    return a == b;
}
ani_double test_FuncPrimitive(ani_env *env, ani_object object, ani_boolean a, ani_byte b,
    ani_char c, ani_short d, ani_int e, ani_long f, ani_float g, ani_double h)
{
    (void)env;
    (void)object;
    ani_tc_mangling::PrimitiveArgs args {
        a,
        b,
        c,
        d,
        e,
        f,
        g,
        h
    };
    if (!ani_tc_mangling::CheckPrimitiveArgs(args)) {
        return -1.0;
    }
    return h;
}
ani_double test_UseNumber(ani_env *env, ani_object object, ani_double num)
{
    (void)env;
    (void)object;
    return num;
}
ani_double test_UseDouble(ani_env *env, ani_object object, ani_double num)
{
    (void)env;
    (void)object;
    return num;
}
void test_RequiredInt(ani_env *env, ani_object object, ani_int value)
{
    (void)env;
    (void)object;
    ani_tc_mangling::g_requiredIntOk = (value == ani_tc_mangling::MANGLING_REQUIRED_INT_VALUE);
}
void test_OptionalInt(ani_env *env, ani_object object, ani_ref value)
{
    (void)object;
    if (ani_tc_mangling::IsUndefinedRef(env, value)) {
        ani_tc_mangling::g_optionalIntWithoutValueOk = true;
        return;
    }
    ani_int intValue = ani_tc_mangling::UnboxIntByMethod(env, value);
    if (intValue == ani_tc_mangling::MANGLING_OPTIONAL_INT_VALUE) {
        ani_tc_mangling::g_optionalIntWithValueOk = true;
    }
}
ani_boolean test_CheckOptionalInt(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_mangling::g_requiredIntOk &&
        ani_tc_mangling::g_optionalIntWithValueOk &&
        ani_tc_mangling::g_optionalIntWithoutValueOk;
    ani_tc_mangling::g_requiredIntOk = false;
    ani_tc_mangling::g_optionalIntWithValueOk = false;
    ani_tc_mangling::g_optionalIntWithoutValueOk = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
ani_string test_ProcessPerson(ani_env *env, ani_object object, ani_object person)
{
    (void)object;
    ani_ref nameRef {};
    ani_status status = env->Object_GetPropertyByName_Ref(person, "name", &nameRef);
    if (status != ANI_OK || nameRef == nullptr) {
        return ani_tc_mangling::StdToManglingString(env, "");
    }
    return ani_tc_mangling::StdToManglingString(
        env, ani_tc_mangling::ManglingStringToStd(env, static_cast<ani_string>(nameRef)));
}
ani_boolean test_CheckRun(ani_env *env, ani_object object, ani_object runner)
{
    (void)object;
    ani_boolean result = false;
    ani_status status = env->Object_CallMethodByName_Boolean(runner, "run", ":z", &result);
    if (status != ANI_OK) {
        return false;
    }
    return result;
}
ani_string test_ManglingConcatString(ani_env *env, ani_object object, ani_string a, ani_string b)
{
    (void)object;
    std::string left = ani_tc_mangling::ManglingStringToStd(env, a);
    std::string right = ani_tc_mangling::ManglingStringToStd(env, b);
    return ani_tc_mangling::StdToManglingString(env, left + right);
}
ani_object test_AddBigInt(ani_env *env, ani_object object, ani_object a, ani_object b)
{
    (void)object;
    ani_long left = ani_tc_mangling::BigIntToLong(env, a);
    ani_long right = ani_tc_mangling::BigIntToLong(env, b);
    return ani_tc_mangling::LongToBigInt(env, left + right);
}
ani_double test_SumArray(ani_env *env, ani_object object, ani_array arr)
{
    (void)object;
    ani_size length = 0;
    ani_status status = env->Array_GetLength(arr, &length);
    if (status != ANI_OK) {
        return -1;
    }
    ani_double sum = 0;
    for (ani_size i = 0; i < length; i++) {
        ani_ref item {};
        status = env->Array_Get(arr, i, &item);
        if (status != ANI_OK) {
            return -1;
        }
        sum += ani_tc_mangling::UnboxDoubleByMethod(env, item);
    }
    return sum;
}
ani_double test_SumArray2(ani_env *env, ani_object object, ani_array arr)
{
    return test_SumArray(env, object, arr);
}
ani_int test_ProcessFixed(ani_env *env, ani_object object, ani_fixedarray_int arr)
{
    (void)object;
    ani_size length = 0;
    ani_status status = env->FixedArray_GetLength(arr, &length);
    if (status != ANI_OK) {
        return -1;
    }
    std::vector<ani_int> values(length);
    status = env->FixedArray_GetRegion_Int(arr, 0, length, values.data());
    if (status != ANI_OK) {
        return -1;
    }
    ani_int sum = 0;
    for (ani_int value : values) {
        sum += value;
    }
    return sum;
}
ani_int test_ProcessNested(ani_env *env, ani_object object, ani_fixedarray_ref arr)
{
    ani_size outerLength = 0;
    ani_status status = env->FixedArray_GetLength(arr, &outerLength);
    if (status != ANI_OK) {
        return -1;
    }
    ani_int total = 0;
    for (ani_size i = 0; i < outerLength; i++) {
        ani_ref innerRef {};
        status = env->FixedArray_Get_Ref(arr, i, &innerRef);
        if (status != ANI_OK || innerRef == nullptr) {
            return -1;
        }
        total += test_ProcessFixed(env, object, static_cast<ani_fixedarray_int>(innerRef));
    }
    return total;
}
ani_string test_ProcessUnion(ani_env *env, ani_object object, ani_ref value)
{
    (void)object;
    if (ani_tc_mangling::IsUndefinedRef(env, value)) {
        return ani_tc_mangling::StdToManglingString(env, "undefined");
    }
    ani_class stringCls {};
    if (env->FindClass("std.core.String", &stringCls) == ANI_OK) {
        ani_boolean isString = false;
        if (env->Object_InstanceOf(static_cast<ani_object>(value), stringCls, &isString) == ANI_OK &&
            isString) {
            return ani_tc_mangling::StdToManglingString(env, "string");
        }
    }
    ani_class doubleCls {};
    if (env->FindClass("std.core.Double", &doubleCls) == ANI_OK) {
        ani_boolean isDouble = false;
        if (env->Object_InstanceOf(static_cast<ani_object>(value), doubleCls, &isDouble) == ANI_OK &&
            isDouble) {
            return ani_tc_mangling::StdToManglingString(env, "number");
        }
    }
    return ani_tc_mangling::StdToManglingString(env, "unknown");
}
#include "TcManglingTestPart2.h"
#endif
