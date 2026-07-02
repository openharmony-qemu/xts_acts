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

#ifndef ANI_TEST_TC_STRING_TEST_H
#define ANI_TEST_TC_STRING_TEST_H
#include "Common.h"
#include <algorithm>
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_string {
constexpr const char *STRING_GLOBAL_REF_CONTENT = "Persistent ANI string";
constexpr const char *STRING_ASCII_SOURCE = "Hello World";
constexpr const char *STRING_UTF8_SOURCE = "你好 世界 😀";
constexpr const char *STRING_UTF8_SIZE_SOURCE = "A🐶B";
constexpr const char *STRING_NORMAL_SOURCE = "normal";
constexpr const char *STRING_AFTER_SCOPE_SOURCE = "after-local-scope";
constexpr const char *STRING_LOCAL_PREFIX = "local-string-";
constexpr ani_size STRING_EMPTY_SIZE = 0;
constexpr ani_size STRING_SMALL_BUFFER_SOURCE_SIZE = 100;
constexpr ani_size STRING_SMALL_BUFFER_SIZE = 50;
constexpr char STRING_LONG_CHAR = 'A';
constexpr char STRING_SMALL_BUFFER_CHAR = 'B';
inline ani_ref g_stringGlobalRef = nullptr;
std::string ReadAniStringUtf8(ani_env *env, ani_string str)
{
    if (env == nullptr || str == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed")) {
        return "";
    }
    std::vector<char> buffer(size + 1, '\0');
    ani_size written = 0;
    status = env->String_GetUTF8(str, buffer.data(), buffer.size(), &written);
    if (status != ANI_OK && status != ANI_BUFFER_TO_SMALL) {
        return "";
    }
    if (written > buffer.size()) {
        written = buffer.size();
    }
    return std::string(buffer.data(), written);
}
bool CreateAndCheckRoundTrip(ani_env *env, const std::string &source)
{
    ani_string aniStr = nullptr;
    ani_status status = env->String_NewUTF8(source.data(), source.size(), &aniStr);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return false;
    }
    if (aniStr == nullptr) {
        return false;
    }
    ani_size size = 0;
    status = env->String_GetUTF8Size(aniStr, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed")) {
        return false;
    }
    std::vector<char> buffer(size + 1, '\0');
    ani_size written = 0;
    status = env->String_GetUTF8(aniStr, buffer.data(), buffer.size(), &written);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8 failed")) {
        return false;
    }
    std::string actual(buffer.data(), written);
    std::cout << "String round trip source size: " << source.size()
              << ", ani size: " << size
              << ", written: " << written << std::endl;
    return source == actual && size == source.size() && written == source.size();
}
}
ani_boolean test_StringAsciiRoundTrip(ani_env *env, ani_object object)
{
    (void)object;
    std::string source = ani_tc_string::STRING_ASCII_SOURCE;
    return ani_tc_string::CreateAndCheckRoundTrip(env, source) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_StringEmptyRoundTrip(ani_env *env, ani_object object)
{
    (void)object;
    std::string source = "";
    ani_string aniStr = nullptr;
    ani_status status = env->String_NewUTF8(source.data(), ani_tc_string::STRING_EMPTY_SIZE, &aniStr);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 for empty string failed")) {
        return ANI_FALSE;
    }
    if (aniStr == nullptr) {
        return ANI_FALSE;
    }
    ani_size size = 1;
    status = env->String_GetUTF8Size(aniStr, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size for empty string failed")) {
        return ANI_FALSE;
    }
    std::vector<char> buffer(1, '\0');
    ani_size written = 1;
    status = env->String_GetUTF8(aniStr, buffer.data(), buffer.size(), &written);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8 for empty string failed")) {
        return ANI_FALSE;
    }
    return size == 0 && written == 0 &&
        std::string(buffer.data(), written).empty() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_StringUtf8RoundTrip(ani_env *env, ani_object object)
{
    (void)object;
    std::string source = ani_tc_string::STRING_UTF8_SOURCE;
    return ani_tc_string::CreateAndCheckRoundTrip(env, source) ? ANI_TRUE : ANI_FALSE;
}
ani_int test_StringUtf8Size(ani_env *env, ani_object object)
{
    (void)object;
    std::string source = ani_tc_string::STRING_UTF8_SIZE_SOURCE;
    ani_string aniStr = nullptr;
    ani_status status = env->String_NewUTF8(source.data(), source.size(), &aniStr);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed in UTF8 size test")) {
        return -1;
    }
    if (aniStr == nullptr) {
        return -1;
    }
    ani_size size = 0;
    status = env->String_GetUTF8Size(aniStr, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed in UTF8 size test")) {
        return -1;
    }
    return static_cast<ani_int>(size);
}
ani_boolean test_StringInvalidUtf8NoCrash(ani_env *env, ani_object object)
{
    (void)object;
    const char invalidBytes[] = {
        static_cast<char>(0xFF),
        static_cast<char>(0xFE)
    };
    ani_string aniStr = nullptr;
    ani_status status = env->String_NewUTF8(invalidBytes, sizeof(invalidBytes), &aniStr);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 returned non-OK for invalid UTF-8")) {
        return ANI_FALSE;
    }
    if (aniStr == nullptr) {
        return ANI_FALSE;
    }
    ani_size size = 0;
    status = env->String_GetUTF8Size(aniStr, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed after invalid UTF-8 creation")) {
        return ANI_FALSE;
    }
    std::vector<char> buffer(size + 1, '\0');
    ani_size written = 0;
    status = env->String_GetUTF8(aniStr, buffer.data(), buffer.size(), &written);
    if (status != ANI_OK && status != ANI_BUFFER_TO_SMALL) {
        return ANI_FALSE;
    }
    ani_string followUp = nullptr;
    std::string normal = ani_tc_string::STRING_NORMAL_SOURCE;
    status = env->String_NewUTF8(normal.data(), normal.size(), &followUp);
    if (!AssertEqMsg(status, ANI_OK, "Following String_NewUTF8 failed after invalid UTF-8 test")) {
        return ANI_FALSE;
    }
    if (followUp == nullptr) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}
ani_boolean test_StringLongStringRoundTrip(ani_env *env, ani_object object, ani_int size)
{
    (void)object;
    if (size <= 0) {
        return ANI_FALSE;
    }
    std::string source(static_cast<size_t>(size), ani_tc_string::STRING_LONG_CHAR);
    return ani_tc_string::CreateAndCheckRoundTrip(env, source) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_StringReadTwice(ani_env *env, ani_object object, ani_string value)
{
    (void)object;
    std::string first = ani_tc_string::ReadAniStringUtf8(env, value);
    std::string second = ani_tc_string::ReadAniStringUtf8(env, value);
    std::cout << "First string read size: " << first.size()
              << ", second string read size: " << second.size() << std::endl;
    return first == second ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_StringSmallBuffer(ani_env *env, ani_object object)
{
    (void)object;
    std::string source(ani_tc_string::STRING_SMALL_BUFFER_SOURCE_SIZE,
        ani_tc_string::STRING_SMALL_BUFFER_CHAR);
    ani_string aniStr = nullptr;
    ani_status status = env->String_NewUTF8(source.data(), source.size(), &aniStr);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed in small buffer test")) {
        return ANI_FALSE;
    }
    if (aniStr == nullptr) {
        return ANI_FALSE;
    }
    char buffer[ani_tc_string::STRING_SMALL_BUFFER_SIZE] = {};
    ani_size written = 0;
    status = env->String_GetUTF8(aniStr, buffer, sizeof(buffer), &written);
    std::cout << "String_GetUTF8 with small buffer status: " << status
              << ", written: " << written << std::endl;
    if (status == ANI_BUFFER_TO_SMALL || status == ANI_INVALID_ARGS || status == ANI_OK) {
        return written <= sizeof(buffer) ? ANI_TRUE : ANI_FALSE;
    }
    return ANI_FALSE;
}
ani_boolean test_StringLocalScopeRecycle(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    if (count <= 0) {
        return ANI_FALSE;
    }
    ani_status status = env->CreateLocalScope(static_cast<ani_size>(count + 1));
    if (!AssertEqMsg(status, ANI_OK, "CreateLocalScope failed")) {
        return ANI_FALSE;
    }
    for (ani_int i = 0; i < count; i++) {
        std::string value = std::string(ani_tc_string::STRING_LOCAL_PREFIX) + std::to_string(i);
        ani_string str = nullptr;
        status = env->String_NewUTF8(value.data(), value.size(), &str);
        if (status != ANI_OK || str == nullptr) {
            env->DestroyLocalScope();
        }
        if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed in local scope loop")) {
        return ANI_FALSE;
    }
        if (str == nullptr) {
            return ANI_FALSE;
        }
    }
    status = env->DestroyLocalScope();
    if (!AssertEqMsg(status, ANI_OK, "DestroyLocalScope failed")) {
        return ANI_FALSE;
    }
    ani_string check = nullptr;
    std::string finalValue = ani_tc_string::STRING_AFTER_SCOPE_SOURCE;
    status = env->String_NewUTF8(finalValue.data(), finalValue.size(), &check);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed after DestroyLocalScope")) {
        return ANI_FALSE;
    }
    if (check == nullptr) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}
ani_boolean test_StringSaveGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_string::g_stringGlobalRef != nullptr) {
        ani_status deleteStatus = env->GlobalReference_Delete(ani_tc_string::g_stringGlobalRef);
        std::cout << "Delete previous string global reference status: " << deleteStatus << std::endl;
        ani_tc_string::g_stringGlobalRef = nullptr;
    }
    std::string source = ani_tc_string::STRING_GLOBAL_REF_CONTENT;
    ani_string str = nullptr;
    ani_status status = env->String_NewUTF8(source.data(), source.size(), &str);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed before GlobalReference_Create")) {
        return ANI_FALSE;
    }
    if (str == nullptr) {
        return ANI_FALSE;
    }
    status = env->GlobalReference_Create(reinterpret_cast<ani_ref>(str),
        &ani_tc_string::g_stringGlobalRef);
    if (!AssertEqMsg(status, ANI_OK, "GlobalReference_Create for string failed")) {
        return ANI_FALSE;
    }
    if (ani_tc_string::g_stringGlobalRef == nullptr) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}
ani_string test_StringUseGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_string::g_stringGlobalRef == nullptr) {
        ani_string empty = nullptr;
        const char *value = "";
        env->String_NewUTF8(value, 0, &empty);
        return empty;
    }
    ani_string str = reinterpret_cast<ani_string>(ani_tc_string::g_stringGlobalRef);
    std::string content = ani_tc_string::ReadAniStringUtf8(env, str);
    std::cout << "Read string from global reference: " << content << std::endl;
    return str;
}
ani_boolean test_StringDeleteGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_string::g_stringGlobalRef == nullptr) {
        return ANI_TRUE;
    }
    ani_status status = env->GlobalReference_Delete(ani_tc_string::g_stringGlobalRef);
    if (!AssertEqMsg(status, ANI_OK, "GlobalReference_Delete for string failed")) {
        return ANI_FALSE;
    }
    ani_tc_string::g_stringGlobalRef = nullptr;
    return ANI_TRUE;
}
#endif
