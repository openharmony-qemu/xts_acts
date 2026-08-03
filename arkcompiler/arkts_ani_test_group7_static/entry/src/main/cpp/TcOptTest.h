/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

#ifndef ANI_TC_OPT_TEST_H
#define ANI_TC_OPT_TEST_H
#include "Common.h"
#include <chrono>
#include <cstring>
#include <iostream>
#include <string>
#include <thread>
#include <vector>
namespace ani_tc_opt {
constexpr ani_int OPT_SLEEP_TIME_MS = 200;
constexpr ani_int OPT_DIRECT_STRING_RESULT = 12;
constexpr ani_int OPT_DIRECT_BAD_OBJECT_RESULT = 1;
constexpr ani_int OPT_DIRECT_CREATE_STRING_RESULT = 1;
constexpr uint8_t OPT_UNUSED_BYTE = 0;
std::string OptAniStringToStdString(ani_env *env, ani_string str)
{
    if (env == nullptr || str == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (!AssertEqMsg(status, ANI_OK, "TC_OPT String_GetUTF8Size failed")) {
        return "";
    }
    std::vector<char> buffer(size + 1, 0);
    ani_size written = 0;
    status = env->String_GetUTF8(str, buffer.data(), buffer.size(), &written);
    if (!AssertEqMsg(status, ANI_OK, "TC_OPT String_GetUTF8 failed")) {
        return "";
    }
    return std::string(buffer.data(), written);
}
}
ani_int test_OptDirectAdd([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    std::cout << "TC_OPT_001 test_OptDirectAdd called, a: "
              << a << ", b: " << b << std::endl;
    return a + b;
}
ani_string test_OptDirectGetString(ani_env *env, [[maybe_unused]] ani_object object)
{
    std::cout << "TC_OPT_002 test_OptDirectGetString called" << std::endl;
    const char *value = "direct string";
    ani_string result = nullptr;
    ani_status status = env->String_NewUTF8(value, std::strlen(value), &result);
    if (!AssertEqMsg(status, ANI_OK, "TC_OPT_002 String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
ani_int test_OptQuickProcessArray(ani_env *env,
    [[maybe_unused]] ani_object object, ani_valuearray_boolean arr, ani_int length)
{
    std::cout << "TC_OPT_003 test_OptQuickProcessArray called, length: "
              << length << std::endl;
    if (env == nullptr || arr == nullptr || length < 0) {
        return -1;
    }
    ani_size actualLength = 0;
    ani_status status = env->ValueArray_GetLength(arr, &actualLength);
    if (!AssertEqMsg(status, ANI_OK, "TC_OPT_003 ValueArray_GetLength failed")) {
        return -1;
    }
    ani_size readLength = static_cast<ani_size>(length);
    if (readLength > actualLength) {
        readLength = actualLength;
    }
    std::vector<ani_boolean> values(readLength);
    status = env->ValueArray_GetRegion_Boolean(arr, 0, readLength, values.data());
    if (!AssertEqMsg(status, ANI_OK, "TC_OPT_003 ValueArray_GetRegion_Boolean failed")) {
        return -1;
    }
    ani_int trueCount = 0;
    for (ani_boolean value : values) {
        if (value == ANI_TRUE) {
            trueCount++;
        }
    }
    return trueCount;
}
ani_string test_OptDefaultCreateString(ani_env *env,
    [[maybe_unused]] ani_object object, ani_string msg)
{
    std::cout << "TC_OPT_004 test_OptDefaultCreateString called" << std::endl;
    std::string input = ani_tc_opt::OptAniStringToStdString(env, msg);
    std::string output = "default:" + input;
    ani_string result = nullptr;
    ani_status status = env->String_NewUTF8(output.c_str(), output.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "TC_OPT_004 String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
ani_int test_OptDirectSleep([[maybe_unused]] ani_env *env, ani_int value)
{
    std::cout << "TC_OPT_005 test_OptDirectSleep called, value: "
              << value << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(ani_tc_opt::OPT_SLEEP_TIME_MS));
    return value;
}
ani_int test_OptQuickSleep([[maybe_unused]] ani_env *env,
    [[maybe_unused]] ani_object object, ani_int value)
{
    std::cout << "TC_OPT_005 test_OptQuickSleep called" << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(ani_tc_opt::OPT_SLEEP_TIME_MS));
    return value;
}
void test_OptDirectBadObject([[maybe_unused]] ani_env *env,
    [[maybe_unused]] ani_object object, ani_object obj)
{
    std::cout << "TC_OPT_006 test_OptDirectBadObject called, obj: "
              << obj << std::endl;
}
ani_int test_OptQuickWithString(ani_env *env,
    [[maybe_unused]] ani_object object, ani_string str)
{
    std::cout << "TC_OPT_007 test_OptQuickWithString called" << std::endl;
    std::string value = ani_tc_opt::OptAniStringToStdString(env, str);
    return static_cast<ani_int>(value.size());
}
ani_boolean test_OptQuickStartThread([[maybe_unused]] ani_env *env,
    [[maybe_unused]] ani_object object)
{
    std::cout << "TC_OPT_007 test_OptQuickStartThread called" << std::endl;
    bool finished = false;
    std::thread worker([&finished]() {
        std::cout << "TC_OPT_007 quick worker thread running" << std::endl;
        finished = true;
    });
    worker.join();
    return finished ? ANI_TRUE : ANI_FALSE;
}
ani_int test_OptDefaultAdd([[maybe_unused]] ani_env *env,
    [[maybe_unused]] ani_object object, ani_int a, ani_int b)
{
    std::cout << "TC_OPT_008 test_OptDefaultAdd called, a: "
              << a << ", b: " << b << std::endl;
    return a + b;
}
ani_int test_OptDirectCreateStringInNative(ani_env *env,
    [[maybe_unused]] ani_object object)
{
    std::cout << "TC_OPT_009 test_OptDirectCreateStringInNative called" << std::endl;
    const char *value = "created in direct";
    ani_string result = nullptr;
    ani_status status = env->String_NewUTF8(value, std::strlen(value), &result);
    std::cout << "TC_OPT_009 String_NewUTF8 status: " << status
              << ", result: " << result << std::endl;
    return status == ANI_OK ? ani_tc_opt::OPT_DIRECT_CREATE_STRING_RESULT : -1;
}
ani_int test_OptQuickCreateTempString(ani_env *env,
    [[maybe_unused]] ani_object object, ani_string str)
{
    std::cout << "TC_OPT_010 test_OptQuickCreateTempString called" << std::endl;
    std::string input = ani_tc_opt::OptAniStringToStdString(env, str);
    const char *temp = "quick temp";
    ani_string tempString = nullptr;
    ani_status status = env->String_NewUTF8(temp, std::strlen(temp), &tempString);
    std::cout << "TC_OPT_010 String_NewUTF8 status: " << status
              << ", tempString: " << tempString << std::endl;
    if (status != ANI_OK) {
        return -1;
    }
    return static_cast<ani_int>(input.size());
}
ani_int test_OptStaticDirectAdd([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    std::cout << "TC_OPT_011 test_OptStaticDirectAdd called, a: "
              << a << ", b: " << b << std::endl;
    return a + b;
}
ani_int test_OptModuleDirectAdd([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    std::cout << "TC_OPT_011 test_OptModuleDirectAdd called, a: "
              << a << ", b: " << b << std::endl;
    return a + b;
}
ani_int test_OptNamespaceQuickAdd([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    std::cout << "TC_OPT_011 test_OptNamespaceQuickAdd called, a: "
              << a << ", b: " << b << std::endl;
    return a + b;
}
ani_int test_OptOverloadInt([[maybe_unused]] ani_env *env, ani_int value)
{
    std::cout << "TC_OPT_012 test_OptOverloadInt called, value: "
              << value << std::endl;
    return value + 1;
}
ani_int test_OptOverloadString(ani_env *env,
    [[maybe_unused]] ani_object object, ani_string str)
{
    std::cout << "TC_OPT_012 test_OptOverloadString called" << std::endl;
    std::string value = ani_tc_opt::OptAniStringToStdString(env, str);
    return static_cast<ani_int>(value.size());
}
#endif
