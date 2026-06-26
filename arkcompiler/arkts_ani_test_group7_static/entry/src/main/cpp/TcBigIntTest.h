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

#ifndef TC_BIGINT_TEST_H
#define TC_BIGINT_TEST_H
#include "Common.h"
#include <iostream>
#include <limits>
#include <string>
#include <vector>
namespace ani_tc_bigint {
constexpr const char *BIGINT_CLASS_NAME = "std.core.BigInt";
constexpr ani_long BIGINT_RETURN_100_VALUE = 100;
std::string BigIntAniStringToStd(ani_env *env, ani_string str)
{
    if (str == nullptr) {
        return "";
    }
    ani_size size = 0;
    if (env->String_GetUTF8Size(str, &size) != ANI_OK) {
        return "";
    }
    std::vector<char> buffer(size + 1, 0);
    ani_size written = 0;
    if (env->String_GetUTF8(str, buffer.data(), buffer.size(), &written) != ANI_OK) {
        return "";
    }
    return std::string(buffer.data(), written);
}
inline ani_string BigIntStdStringToAni(ani_env *env, const std::string &value)
{
    ani_string result = nullptr;
    if (env->String_NewUTF8(value.c_str(), value.size(), &result) != ANI_OK) {
        return nullptr;
    }
    return result;
}
ani_object CreateBigIntByLong(ani_env *env, ani_long value)
{
    ani_class cls = nullptr;
    ani_status status = env->FindClass(BIGINT_CLASS_NAME, &cls);
    if (!AssertEqMsg(status, ANI_OK, "Find std.core.BigInt failed")) {
        return nullptr;
    }
    ani_method ctor = nullptr;
    status = env->Class_FindMethod(cls, "<ctor>", "l:", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Find BigInt long constructor failed")) {
        return nullptr;
    }
    ani_object result = nullptr;
    status = env->Object_New(cls, ctor, &result, value);
    if (!AssertEqMsg(status, ANI_OK, "Create BigInt by long failed")) {
        return nullptr;
    }
    return result;
}
ani_object CreateBigIntByString(ani_env *env, ani_string value)
{
    ani_class cls = nullptr;
    ani_status status = env->FindClass(BIGINT_CLASS_NAME, &cls);
    if (!AssertEqMsg(status, ANI_OK, "Find std.core.BigInt failed")) {
        return nullptr;
    }
    ani_method ctor = nullptr;
    status = env->Class_FindMethod(cls, "<ctor>", "C{std.core.String}:", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Find BigInt string constructor failed")) {
        return nullptr;
    }
    ani_object result = nullptr;
    status = env->Object_New(cls, ctor, &result, value);
    if (!AssertEqMsg(status, ANI_OK, "Create BigInt by string failed")) {
        return nullptr;
    }
    return result;
}
inline ani_long GetBigIntLongValue(ani_env *env, ani_object obj)
{
    ani_long result = 0;
    ani_status status = env->Object_CallMethodByName_Long(obj, "getLong", ":l", &result);
    if (!AssertEqMsg(status, ANI_OK, "Call BigInt.getLong failed")) {
        return 0;
    }
    return result;
}
}
ani_long test_BigIntGetLong(ani_env *env, ani_object object, ani_object num)
{
    (void)object;
    ani_long value = ani_tc_bigint::GetBigIntLongValue(env, num);
    std::cout << "BigInt long value is: " << value << std::endl;
    return value;
}
ani_long test_BigIntGetLongOverflow(ani_env *env, ani_object object, ani_object num)
{
    (void)object;
    ani_long value = ani_tc_bigint::GetBigIntLongValue(env, num);
    std::cout << "BigInt overflow getLong result is: " << value << std::endl;
    return value;
}
ani_object test_BigIntCreateByLong(ani_env *env, ani_object object, ani_long value)
{
    (void)object;
    return ani_tc_bigint::CreateBigIntByLong(env, value);
}
ani_object test_BigIntCreateFromString(ani_env *env, ani_object object, ani_string value)
{
    (void)object;
    return ani_tc_bigint::CreateBigIntByString(env, value);
}
ani_boolean test_BigIntCheckType(ani_env *env, ani_object object, ani_object value)
{
    (void)object;
    ani_class cls = nullptr;
    if (env->FindClass(ani_tc_bigint::BIGINT_CLASS_NAME, &cls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Object_InstanceOf(value, cls, &result);
    if (!AssertEqMsg(status, ANI_OK, "Object_InstanceOf BigInt failed")) {
        return ANI_FALSE;
    }
    return result;
}
ani_boolean test_BigIntGetLongRangeCheck(ani_env *env, ani_object object, ani_object num)
{
    (void)object;
    ani_long value = 0;
    ani_status status = env->Object_CallMethodByName_Long(num, "getLong", ":l", &value);
    ani_boolean hasError = ANI_FALSE;
    env->ExistUnhandledError(&hasError);
    std::cout << "BigInt getLong range status: " << status
              << ", hasError: " << static_cast<int>(hasError)
              << ", value: " << value << std::endl;
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
        return ANI_TRUE;
    }
    return status == ANI_OK ? ANI_FALSE : ANI_TRUE;
}
ani_object test_BigIntReturn100(ani_env *env, ani_object object)
{
    (void)object;
    return ani_tc_bigint::CreateBigIntByLong(env, ani_tc_bigint::BIGINT_RETURN_100_VALUE);
}
ani_boolean test_BigIntReadTwice(ani_env *env, ani_object object, ani_object num)
{
    (void)object;
    ani_long first = ani_tc_bigint::GetBigIntLongValue(env, num);
    ani_long second = ani_tc_bigint::GetBigIntLongValue(env, num);
    std::cout << "Read BigInt twice, first: " << first << ", second: " << second << std::endl;
    return first == second ? ANI_TRUE : ANI_FALSE;
}
ani_long test_BigIntBoundary(ani_env *env, ani_object object, ani_object num)
{
    (void)object;
    return ani_tc_bigint::GetBigIntLongValue(env, num);
}
ani_object test_BigIntCreateLongBoundary(ani_env *env, ani_object object, ani_long value)
{
    (void)object;
    return ani_tc_bigint::CreateBigIntByLong(env, value);
}
#endif
