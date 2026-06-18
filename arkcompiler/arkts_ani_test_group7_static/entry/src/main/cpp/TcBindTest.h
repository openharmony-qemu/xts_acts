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

#ifndef TC_BIND_TEST_H
#define TC_BIND_TEST_H
#include "Common.h"
#include <algorithm>
#include <cctype>
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
#include <atomic>
namespace ani_tc_bind {
constexpr const char *FOO_CLASS_NAME = "entry.src.main.src.ets.Index.Foo";
constexpr ani_int BIND_LOG_FIRST_LEVEL = 1;
constexpr ani_int BIND_LOG_SECOND_LEVEL = 2;
constexpr int BIND_LOG_EXPECTED_COUNT = 2;
inline bool g_overloadVoidCalled = false;
inline bool g_overloadStringCalled = false;
inline std::atomic<int> g_logCallCount {0};
inline std::atomic<bool> g_logFirstCallOk {false};
inline std::atomic<bool> g_logSecondCallOk {false};
std::string AniStringToStdString(ani_env *env, ani_string str)
{
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (status != ANI_OK) {
        return "";
    }
    std::vector<char> buffer(size + 1);
    ani_size writtenSize = 0;
    status = env->String_GetUTF8(str, buffer.data(), size + 1, &writtenSize);
    if (status != ANI_OK) {
        return "";
    }
    return std::string(buffer.data(), writtenSize);
}
inline ani_string StdStringToAniString(ani_env *env, const std::string &value)
{
    ani_string result {};
    env->String_NewUTF8(value.c_str(), value.size(), &result);
    return result;
}
}
ani_int test_Multiply(ani_env *env, ani_object object, ani_int value)
{
    ani_class cls {};
    ani_status status = env->FindClass(ani_tc_bind::FOO_CLASS_NAME, &cls);
    if (status != ANI_OK) {
        return 0;
    }
    ani_field factorField {};
    status = env->Class_FindField(cls, "factor", &factorField);
    if (status != ANI_OK) {
        return 0;
    }
    ani_int factor = 0;
    status = env->Object_GetField_Int(object, factorField, &factor);
    if (status != ANI_OK) {
        return 0;
    }
    return value * factor;
}
ani_int test_Square(ani_env *env, ani_class cls, ani_int value)
{
    (void)env;
    (void)cls;
    return value * value;
}
ani_string test_ToUpper(ani_env *env, ani_string str)
{
    std::string value = ani_tc_bind::AniStringToStdString(env, str);
    std::transform(value.begin(), value.end(), value.begin(), [](unsigned char ch) {
        return static_cast<char>(std::toupper(ch));
    });
    return ani_tc_bind::StdStringToAniString(env, value);
}
ani_int test_ProcessColor(ani_env *env, ani_enum_item color)
{
    ani_int value = 0;
    ani_status status = env->EnumItem_GetValue_Int(color, &value);
    if (status != ANI_OK) {
        return 0;
    }
    return value;
}
void test_FooOverloadVoid(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_tc_bind::g_overloadVoidCalled = true;
}
void test_FooOverloadString(ani_env *env, ani_object object, ani_string str)
{
    (void)object;
    std::string value = ani_tc_bind::AniStringToStdString(env, str);
    if (value == "test") {
        ani_tc_bind::g_overloadStringCalled = true;
    }
}
ani_boolean test_CheckFooOverload(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = ani_tc_bind::g_overloadVoidCalled && ani_tc_bind::g_overloadStringCalled;
    ani_tc_bind::g_overloadVoidCalled = false;
    ani_tc_bind::g_overloadStringCalled = false;
    return result ? ANI_TRUE : ANI_FALSE;
}
void test_Log(ani_env *env, ani_object object, ani_int level, ani_string msg)
{
    (void)object;
    std::string value = ani_tc_bind::AniStringToStdString(env, msg);
    int callIndex = ani_tc_bind::g_logCallCount.fetch_add(1);
    if (callIndex == 0) {
        ani_tc_bind::g_logFirstCallOk.store(
            level == ani_tc_bind::BIND_LOG_FIRST_LEVEL && value == "debug");
    } else if (callIndex == 1) {
        ani_tc_bind::g_logSecondCallOk.store(
            level == ani_tc_bind::BIND_LOG_SECOND_LEVEL && value == "info");
    }
}
ani_boolean test_CheckLog(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    bool result = (ani_tc_bind::g_logCallCount.load() == ani_tc_bind::BIND_LOG_EXPECTED_COUNT &&
        ani_tc_bind::g_logFirstCallOk.load() && ani_tc_bind::g_logSecondCallOk.load());
    ani_tc_bind::g_logCallCount.store(0);
    ani_tc_bind::g_logFirstCallOk.store(false);
    ani_tc_bind::g_logSecondCallOk.store(false);
    return result ? ANI_TRUE : ANI_FALSE;
}
#endif
