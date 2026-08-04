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

#ifndef ARKTS_ANI_TEST_STRING_OPERATIONS_H
#define ARKTS_ANI_TEST_STRING_OPERATIONS_H
#include "Common.h"

ani_boolean test_String_UTF8([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    std::string value = "hello world";
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(value.c_str(), value.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(string, nullptr);
    ani_size size = 0;
    status = env->String_GetUTF8Size(string, &size);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(size, value.size());
    const ani_size bufferSize = 128;
    char utf8Buffer[bufferSize] = "";
    ani_size result = 0;
    status = env->String_GetUTF8(string, utf8Buffer, bufferSize, &result);
    ASSERT_EQ(size, result);
    ASSERT_EQ(status, ANI_OK);

    ani_size substrOffset = 6;
    ani_size substrSize = 5;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utf8Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_String_UTF8_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"🙂🙂"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 30U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());
    ASSERT_STREQ(utfBuffer, "🙂🙂");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());
    ASSERT_STREQ(utfBuffer, "example");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // NOLINTNEXTLINE(readability-redundant-string-init)
    const std::string example {""};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());
    ASSERT_STREQ(utfBuffer, "");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 1U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"h\ni\r\\!"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());
    ASSERT_STREQ(utfBuffer, "h\ni\r\\!");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 1U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8(string, utfBuffer, 0U, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->c_api->String_GetUTF8(nullptr, string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint32_t bufferSize = 100U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    ani_status status = env->String_GetUTF8(nullptr, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    const ani_size bufferSize = 100U;
    status = env->String_GetUTF8(string, nullptr, bufferSize, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    const uint32_t bufferSize = 100U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    status = env->String_GetUTF8(string, utfBuffer, bufferSize, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 3U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *moduleName = "entry.src.main.src.ets.StringOperations";
    const char *tupleGetterName = "getString";
    ani_module mod{};
    ASSERT_EQ(env->FindModule(moduleName, &mod), ANI_OK);
    ani_function fn{};
    ASSERT_EQ(env->Module_FindFunction(mod, tupleGetterName, nullptr, &fn), ANI_OK);
    ani_ref ref{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &ref, 0), ANI_OK);

    const auto string  = static_cast<ani_string>(ref);

    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    ani_status status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 4U);
    ASSERT_STREQ(utfBuffer, "test");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        status = env->String_GetUTF8(string, utfBuffer, bufferSize, &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_EQ(result, example.size());
        ASSERT_STREQ(utfBuffer, "example");
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const size_t strSize = 11U;
    const std::string example("abc\0def\0ghi", strSize);
    ani_string aniString = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), strSize, &aniString);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    status = env->String_GetUTF16Size(aniString, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());

    ani_size result2 = 0U;
    const ani_size bufferSize = 20U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    status = env->String_GetUTF16(aniString, utf16Buffer, bufferSize, &result2);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result2, example.size());

    ani_size resultUTF8 = 0U;
    status = env->String_GetUTF8Size(aniString, &resultUTF8);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(resultUTF8, example.size());

    ani_size result2UTF8 = 0U;
    char utf8Buffer[bufferSize] = {0U};
    status = env->String_GetUTF8(aniString, utf8Buffer, bufferSize, &result2UTF8);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result2UTF8, example.size());

    for (size_t i = 0; i < strSize; ++i) {
        ASSERT_EQ(example[i], utf16Buffer[i]);
        ASSERT_EQ(example[i], utf8Buffer[i]);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Size([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size result = 0U;
    ani_status status = env->String_GetUTF8Size(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Size_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ani_size result = 0U;
    auto status2 = env->c_api->String_GetUTF8Size(nullptr, string, &result);
    ASSERT_EQ(status2, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Size_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    status = env->String_GetUTF8Size(string, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Size_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    status = env->String_GetUTF8Size(string, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Size_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example = {"测测试emoji🙂🙂"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    status = env->String_GetUTF8Size(string, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Size_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // NOLINTNEXTLINE(readability-redundant-string-init)
    const std::string example {""};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    status = env->String_GetUTF8Size(string, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Size_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ani_size result = 0U;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        status = env->String_GetUTF8Size(string, &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_EQ(result, example.size());
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"🙂🙂"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 30U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size substrOffset = 0U;
    ani_size substrSize = 7U;
    ani_size result = 0U;
    const ani_size utfBufferSize = 30U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, utfBufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, substrSize);
    ASSERT_STREQ(utfBuffer, "🙂");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {1U};
    const uint32_t scope = 9U;
    for (auto i = 0U; i < scope; ++i) {
        utfBuffer[i] = 1;
    }
    const uint32_t strEnd = 9U;
    utfBuffer[strEnd] = '\0';
    ani_size substrOffset = 0U;
    ani_size substrSize = example.size();
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_STREQ(utfBuffer, "example");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"hi\n, \rtest\\?"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 20U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size substrOffset = 1U;
    const ani_size substrSize = 10U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_STREQ(utfBuffer, "i\n, \rtest\\");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // NOLINTNEXTLINE(readability-redundant-string-init)
    const std::string example {""};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, 0U, 0U, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 0U);
    ASSERT_STREQ(utfBuffer, "");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 100U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    auto status2 = env->c_api->String_GetUTF8SubString(nullptr, string, 0U, 0U, utfBuffer, bufferSize, &result);
    ASSERT_EQ(status2, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint32_t bufferSize = 100U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size result = 0U;
    ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    ani_status status = env->String_GetUTF8SubString(nullptr, substrOffset, substrSize,
                                                     utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    const ani_size bufferSize = 100U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, nullptr, bufferSize, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    const uint32_t bufferSize = 100U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size substrOffset = 0U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_STREQ(utfBuffer, "exam");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = -1U;
    ani_size substrSize = 2U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = 10U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = 34U;
    ani_size substrSize = std::numeric_limits<uint32_t>::max() - 8U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer,
                                          std::numeric_limits<uint32_t>::max(),
                                          &result);
    ASSERT_EQ(status, ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size substrOffset = 0U;
    const ani_size substrSize = 10U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size substrOffset = 0U;
    ani_size substrSize = 0U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_STREQ(utfBuffer, "");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = 0U;
    ani_size substrSize = -1U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 1U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = 0U;
    ani_size substrSize = 1U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {'\n', '\r', 'h', 'i', '\\', '\0'};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = 0U;
    ani_size substrSize = 3U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_STREQ(utfBuffer, "exa");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, -1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_STREQ(utfBuffer, "examp");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    const ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, 0U, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 3U;
    char utfBuffer[bufferSize] = {0U};  // NOLINT(modernize-avoid-c-arrays)
    ani_size substrOffset = 0U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        status = env->String_GetUTF8SubString(string, substrOffset, substrSize, utfBuffer, sizeof(utfBuffer), &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_EQ(result, substrSize);
        ASSERT_STREQ(utfBuffer, "exam");
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string testStr = "Hello, 世界";
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(testStr.c_str(), testStr.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(string, nullptr);

    ani_size result2 = 0U;
    auto status2 = env->String_GetUTF8Size(string, &result2);
    ASSERT_EQ(status2, ANI_OK);
    ASSERT_EQ(result2, testStr.size());

    const uint32_t bufferSize = 30U;
    char utfBuffer[bufferSize] = {0U};
    ani_size resultSize = 0U;
    auto status3 = env->String_GetUTF8(string, utfBuffer, bufferSize, &resultSize);
    ASSERT_EQ(status3, ANI_OK);
    ASSERT_EQ(resultSize, testStr.size());
    ASSERT_STREQ(utfBuffer, "Hello, 世界");

    const ani_size bufferSize4 = 10U;
    char utfBuffer4[bufferSize4] = {0U};
    ani_size offset = 2U;
    const ani_size subSize = 3U;
    ani_size resultSize4 = 0U;
    auto status4 = env->String_GetUTF8SubString(string, offset, subSize, utfBuffer4, bufferSize4, &resultSize4);
    ASSERT_EQ(status4, ANI_OK);
    ASSERT_EQ(resultSize4, subSize);
    ASSERT_STREQ(utfBuffer4, "llo");

    return ANI_TRUE;
}

ani_boolean test_String_UTF8_Substr_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string testStr = "Hello World";
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(testStr.c_str(), testStr.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(string, nullptr);
    const uint32_t bufferSize = 30U;
    char utfBuffer[bufferSize] = {0U};
    ani_size offset = 6U;
    ani_size subSize = 5U;
    ani_size resultSize = 0U;
    env->String_GetUTF8SubString(string, offset, subSize, utfBuffer, sizeof(utfBuffer), &resultSize);
    ASSERT_STREQ(utfBuffer, "World");
    ASSERT_EQ(resultSize, subSize);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    const ani_size size = 10U;
    auto status = env->String_NewUTF8(nullptr, size, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);
    ASSERT_EQ(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    auto status = env->String_NewUTF8("", 0U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const int32_t longStringSize = 10000U;
    std::string longString(longStringSize, 'a');
    ani_string result = nullptr;
    auto status = env->String_NewUTF8(longString.c_str(), longString.size(), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"测测试emoji🙂🙂"};
    ani_string result = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_string result2 = nullptr;
    status = env->String_NewUTF8(example.c_str(), example.size(), &result2);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);
    const uint32_t bufferSize = 30U;
    char utfBuffer[bufferSize] = {0U};
    ani_size resultSize = 0U;
    env->String_GetUTF8SubString(result2, 0U, example.size(), utfBuffer, sizeof(utfBuffer), &resultSize);
    ASSERT_EQ(resultSize, example.size());
    ASSERT_EQ(std::strcmp(utfBuffer, example.c_str()), ANI_OK);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->c_api->String_NewUTF8(nullptr, example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string result = nullptr;
    ani_status status = env->String_NewUTF8(example.c_str(), example.size() - 1U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_string result2 = nullptr;
    status = env->String_NewUTF8(example.c_str(), example.size(), &result2);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);
    const uint32_t bufferSize = 10U;
    char utfBuffer[bufferSize] = {0U};
    ani_size resultSize = 0U;
    env->String_GetUTF8SubString(result2, 0U, example.size() - 1U, utfBuffer, sizeof(utfBuffer), &resultSize);
    ASSERT_STREQ(utfBuffer, "exampl");

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string result = nullptr;
    ani_status status = env->String_NewUTF8(example.c_str(), 0U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    ani_string result2 = nullptr;
    status = env->String_NewUTF8(example.c_str(), example.size(), &result2);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);
    const uint32_t bufferSize = 20U;
    char utfBuffer[bufferSize] = {0U};
    ani_size resultSize = 0U;
    env->String_GetUTF8SubString(result2, 0U, 0U, utfBuffer, sizeof(utfBuffer), &resultSize);
    ASSERT_STREQ(utfBuffer, "");

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF8_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"测测试emoji🙂🙂"};
    ani_string result = nullptr;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        auto status = env->String_NewUTF8(example.c_str(), example.size(), &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_NE(result, nullptr);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ASSERT_NE(env, nullptr);
    uint16_t value[] = {1, 2, 3, 4, 5};
    auto valueSize = sizeof(value) / sizeof(value[0]) - 1;
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(value, valueSize, &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(string, nullptr);
    ani_size size = 0;
    status = env->String_GetUTF16Size(string, &size);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(size, valueSize);
    const ani_size bufferSize = 32;
    uint16_t utf16Buffer[bufferSize];
    ani_size result = 0;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(size, result);
    ASSERT_EQ(status, ANI_OK);

    ani_size substrOffset = 1;
    ani_size substrSize = 2;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    return ANI_TRUE;
}

ani_boolean test_String_UTF16_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string string = nullptr;
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    auto status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);
    ASSERT_EQ(result, 0U);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    auto status2 = env->c_api->String_GetUTF16(nullptr, string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status2, ANI_INVALID_ARGS);
 
    return ANI_TRUE;
}

ani_boolean test_String_UTF16_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, 0U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 0U);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"hello\nworld\r, hi\\?"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 30U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());
    for (ani_size i = 0; i < result; ++i) {
        ASSERT_EQ(utf16Buffer[i], example[i]);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 5U);
    ASSERT_EQ(utf16Buffer[4U], 0x006F);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 6U);
    ASSERT_EQ(utf16Buffer[5U], 0x0000);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 6U);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 1U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 1U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 2U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 1U);
    ASSERT_EQ(utf16Buffer[0U], 0x4F60);
    ASSERT_EQ(utf16Buffer[1U], 0x0000);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 8U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 7U);
    ASSERT_EQ(utf16Buffer[6U], 0x0000);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string string {};
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 6U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);
    ASSERT_EQ(result, 0U);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    uint16_t utf16Buffer[3U] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, 0U, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);
    ASSERT_EQ(result, 0U);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 3U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);
    ASSERT_EQ(result, 0U);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string string = nullptr;
    ani_size exampleSize = sizeof(example) / sizeof(uint16_t) - 1U;
    auto status = env->String_NewUTF16(example, exampleSize, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 30U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        status = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_EQ(result, exampleSize);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string testUtf8Str = "Hello, 世界🙂";
    ani_string utf8String = nullptr;
    ani_string utf16String = nullptr;

    auto status = env->String_NewUTF8(testUtf8Str.c_str(), testUtf8Str.size(), &utf8String);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(utf8String, nullptr);

    const uint32_t bufferSize = 30U;
    char utf8Buffer[bufferSize] = {0U};
    ani_size resultSize = 0U;
    auto status1 = env->String_GetUTF8(utf8String, utf8Buffer, bufferSize, &resultSize);
    ASSERT_EQ(status1, ANI_OK);
    ASSERT_STREQ(utf8Buffer, "Hello, 世界🙂");
    ASSERT_EQ(resultSize, testUtf8Str.size());

    // UTF-8 -> UTF-16
    std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> converter;
    std::u16string utf16Converted = converter.from_bytes(utf8Buffer, utf8Buffer + resultSize);

    // Create UTF-16 String
    auto status2 = env->String_NewUTF16(reinterpret_cast<const uint16_t*>(utf16Converted.c_str()),
                                        utf16Converted.size(), &utf16String);
    ASSERT_EQ(status2, ANI_OK);
    ASSERT_NE(utf16String, nullptr);

    // Get UTF-16 Buffer
    const ani_size buffer16Size = 30U;
    uint16_t utf16Buffer[buffer16Size] = {0U};
    ani_size result2 = 0U;
    auto status3 = env->String_GetUTF16(utf16String, utf16Buffer, buffer16Size, &result2);
    ASSERT_EQ(status3, ANI_OK);
    ASSERT_EQ(result2, utf16Converted.size());

    // UTF-16 Buffer -> UTF-8 String
    std::u16string utf16FromBuffer(utf16Buffer, utf16Buffer + result2);
    std::string utf8FromBuffer = converter.to_bytes(utf16FromBuffer);
    ASSERT_EQ(utf8FromBuffer, testUtf8Str);

    // Compare UTF-16 Character Sequence
    ASSERT_EQ(result2, utf16Converted.size());
    for (size_t i = 0; i < result2; ++i) {
        ASSERT_EQ(utf16Buffer[i], static_cast<uint16_t>(utf16Converted[i]));
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Size([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size result = 0U;
    ani_status status = env->String_GetUTF16Size(nullptr, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Size_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ani_size result = 0U;
    auto status2 = env->c_api->String_GetUTF16Size(nullptr, string, &result);
    ASSERT_EQ(status2, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Size_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    status = env->String_GetUTF16Size(string, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Size_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"example"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    status = env->String_GetUTF16Size(string, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Size_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example = {"测测试emoji🙂🙂"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    const ani_size utf16Size = 12U;
    status = env->String_GetUTF16Size(string, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, utf16Size);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Size_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // NOLINTNEXTLINE(readability-redundant-string-init)
    const std::string example {""};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);

    ani_size result = 0U;
    status = env->String_GetUTF16Size(string, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, example.size());

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Size_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example = {"测测试emoji🙂🙂"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    ani_size result = 0U;
    const ani_size utf16Size = 12U;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        status = env->String_GetUTF16Size(string, &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_EQ(result, utf16Size);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0xD83D, 0xDE42, 0xD83D, 0xDE42, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 30U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = 2U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    for (ani_size i = 0; i < result; ++i) {
        ASSERT_EQ(utf16Buffer[i], example[i]);
    }

    return ANI_TRUE;
}


ani_boolean test_String_UTF16_Substr_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = sizeof(example) / sizeof(uint16_t) - 1U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    for (ani_size i = 0; i < result; ++i) {
        ASSERT_EQ(utf16Buffer[i], example[i]);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 9U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = sizeof(example) / sizeof(uint16_t) - 1U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    for (ani_size i = 0; i < result; ++i) {
        ASSERT_EQ(utf16Buffer[i], example[i]);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 9U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = sizeof(example) / sizeof(uint16_t);
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_EQ(utf16Buffer[7U], 0x0000);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const ani_size bufferSize = 100U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    ani_status status =
        env->String_GetUTF16SubString(nullptr, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 100U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    status = env->c_api->String_GetUTF16SubString(nullptr, string, substrOffset, substrSize,
                                                  utf16Buffer,
                                                  bufferSize,
                                                  &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 100U;
    ani_size result = 0U;
    ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, nullptr, bufferSize, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    ani_size substrOffset = 0U;
    ani_size substrSize = 5U;
    const ani_size bufferSize = 100U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, nullptr);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, 0U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = 0U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    ASSERT_EQ(utf16Buffer[0U], 0x0000);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"hello\nworld\r, hi\\?"};
    ani_string string = nullptr;
    auto status = env->String_NewUTF8(example.c_str(), example.size(), &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 30U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 4U;
    ani_size substrSize = 13U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    for (ani_size i = 0; i < result; ++i) {
        ASSERT_EQ(utf16Buffer[i], example[i + substrOffset]);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 2U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, substrSize);
    for (size_t i = 0; i < substrSize; i++) {
        ASSERT_EQ(utf16Buffer[i], example[i + substrOffset]);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, -1U, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    const ani_size substrOffset = 10U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    const ani_size substrOffset = 2U;
    ani_size substrSize = 6U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OUT_OF_RANGE);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 2U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, -1U, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, 0U, 0U, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_EQ(result, 0U);
    ASSERT_EQ(utf16Buffer[0U], 0x0000);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 2U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, 0U, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 1U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = 4U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    const ani_size substrSize = 10U;
    ani_size result = 0U;
    status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
    ASSERT_EQ(status, ANI_BUFFER_TO_SMALL);

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0065, 0x0078, 0x0061, 0x006D, 0x0070, 0x006C, 0x0065, 0x0000};
    ani_string string = nullptr;
    auto status = env->String_NewUTF16(example, sizeof(example) / sizeof(uint16_t) - 1U, &string);
    ASSERT_EQ(status, ANI_OK);
    const ani_size bufferSize = 10U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size substrOffset = 0U;
    ani_size substrSize = sizeof(example) / sizeof(uint16_t) - 1U;
    ani_size result = 0U;
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        status = env->String_GetUTF16SubString(string, substrOffset, substrSize, utf16Buffer, bufferSize, &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_EQ(result, substrSize);
    }

    return ANI_TRUE;
}

ani_boolean test_String_UTF16_Substr_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string string = nullptr;
    ani_size exampleSize = sizeof(example) / sizeof(uint16_t) - 1U;
    auto status = env->String_NewUTF16(example, exampleSize, &string);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(string, nullptr);

    ani_size result1 = 0U;
    auto status1 = env->String_GetUTF16Size(string, &result1);
    ASSERT_EQ(status1, ANI_OK);
    ASSERT_EQ(result1, exampleSize);

    const ani_size bufferSize = 30U;
    uint16_t utf16Buffer[bufferSize] = {0U};
    ani_size result2 = 0U;
    auto status2 = env->String_GetUTF16(string, utf16Buffer, bufferSize, &result2);
    ASSERT_EQ(status2, ANI_OK);
    ASSERT_EQ(result2, exampleSize);
    for (size_t i = 0; i < exampleSize; i++) {
        ASSERT_EQ(utf16Buffer[i], example[i]);
    }
    const ani_size bufferSize3 = 10U;
    uint16_t utf16Buffer3[bufferSize3] = {0U};
    ani_size offset = 0U;
    const ani_size subSize = 3U;
    ani_size result3 = 0U;
    auto status3 = env->String_GetUTF16SubString(string, offset, subSize, utf16Buffer3, bufferSize3, &result3);
    ASSERT_EQ(status3, ANI_OK);
    ASSERT_EQ(result3, subSize);
    ASSERT_EQ(utf16Buffer3[0U], 0x4F60);
    ASSERT_EQ(utf16Buffer3[1U], 0x597D);
    ASSERT_EQ(utf16Buffer3[2U], 0x002C);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    const ani_size size = 10U;
    auto status = env->String_NewUTF16(nullptr, size, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);
    ASSERT_EQ(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_02([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    const uint16_t stringTest[] = {0x0000};
    auto status = env->String_NewUTF16(stringTest, 0U, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_03([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x0000};
    size_t length = sizeof(example) / sizeof(example[0U]) - 1U;
    auto status = env->c_api->String_NewUTF16(nullptr, example, length, &result);
    ASSERT_EQ(status, ANI_INVALID_ARGS);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_04([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x0000};
    size_t length = sizeof(example) / sizeof(example[0U]) - 1U;
    auto status = env->String_NewUTF16(example, length, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_05([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x0000};
    size_t length = sizeof(example) / sizeof(example[0U]);
    auto status = env->String_NewUTF16(example, length, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_06([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x4F60, 0x597D, 0x002C, 0x0020, 0x4E16, 0x754C, 0x0000};
    ani_string result = nullptr;
    size_t length = sizeof(example) / sizeof(example[0U]) - 1U;
    auto status = env->String_NewUTF16(example, length, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_07([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x4F60, 0x0021, 0x0000};
    ani_string result = nullptr;
    size_t length = sizeof(example) / sizeof(example[0U]) - 1U;
    auto status = env->String_NewUTF16(example, length, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_08([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const uint16_t strSize = 1000U;
    uint16_t example[strSize] = {0x0000};
    std::fill(std::begin(example), std::end(example), 0x0048);
    ani_string result = nullptr;
    auto status = env->String_NewUTF16(example, strSize, &result);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(result, nullptr);

    return ANI_TRUE;
}

ani_boolean test_String_New_UTF16_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string result = nullptr;
    const uint16_t example[] = {0x0048, 0x0065, 0x006C, 0x006C, 0x006F, 0x0000};
    size_t length = sizeof(example) / sizeof(example[0U]);
    const int32_t loopCount = 3;
    for (int32_t i = 0; i < loopCount; ++i) {
        auto status = env->String_NewUTF16(example, length, &result);
        ASSERT_EQ(status, ANI_OK);
        ASSERT_NE(result, nullptr);
    }

    return ANI_TRUE;
}

/*
    基本规则如下：
        对于单字节的字符，字节的第一位设为0，后面7位为这个字符的Unicode码。因此，对于0x00-0x7F之间的字符，UTF-8编码与ASCII完全相同。
        对于多字节的字符，第一个字节的前几位设为1，第n个字节的前两位设为10，其余位用来存储字符的Unicode码。
    具体规则：
        1字节：0xxxxxxx
        2字节：110xxxxx 10xxxxxx
        3字节：1110xxxx 10xxxxxx 10xxxxxx
        4字节：11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
        其中，x部分就是实际存储的Unicode码的二进制位。
        另外，UTF-8编码还有以下规定：
        每个字符的编码中，第一个字节称为首字节，后续字节称为后续字节。
        首字节的前导1的个数表示这个字符编码的总字节数（例如，2字节字符的首字节前导为110，即两个1；3字节为1110，即三个1；4字节为11110，即四个1）。
        后续字节的前两位必须是10。
*/
ani_boolean CheckUtf8String(ani_env *env, const std::string example)
{
    // 创建ani字符串
    ani_string utf8String = nullptr;
    ani_status status = env->String_NewUTF8(example.c_str(), example.size(), &utf8String);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(utf8String, nullptr);
    // 从ani字符串提取回C字符串
    const uint32_t bufferSize = example.size() + 1;
    char utfBuffer[bufferSize];
    ani_size resultSize = 0U;
    auto status1 = env->String_GetUTF8(utf8String, utfBuffer, bufferSize, &resultSize);
    if (status1 != ANI_OK) {
        return ANI_FALSE;
    }
    if (resultSize != example.size()) {
        return ANI_FALSE;
    }
    // 逐个字符比较
    for (size_t i = 0; i < example.size(); ++i) {
        if (example[i] != utfBuffer[i]) {
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}

ani_boolean CheckUtf8IllegalString(ani_env *env, const std::string example)
{
    ani_string utf8String = nullptr;
    ani_status status = env->String_NewUTF8(example.c_str(), example.size(), &utf8String);
    if (status != ANI_OK) {
        return ANI_TRUE;
    }
    if (utf8String == nullptr) {
        return ANI_FALSE;
    }
    const uint32_t bufferSize = example.size() + 1;
    char utfBuffer[bufferSize];
    ani_size resultSize = 0U;
    auto status1 = env->String_GetUTF8(utf8String, utfBuffer, bufferSize, &resultSize);
    if (status1 != ANI_OK) {
        return ANI_TRUE;
    }
    if (resultSize != example.size()) {
        return ANI_TRUE;
    }
    for (size_t i = 0; i < example.size(); ++i) {
        if (example[i] != utfBuffer[i]) {
            return ANI_TRUE;
        }
    }
    return ANI_FALSE;
}

ani_boolean test_String_New_UTF8_09([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 原始C字符串
    const std::string example {"Hello, OpenHarmony!"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_10([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 特殊转移字符
    const std::string example {"Hello, OpenHarmony!\a\b\f\n\r\t\v\\\'\"\0\177\x5c"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_11([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // ASCII码全量覆盖
    const std::string example {"Hello, OpenHarmony!!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQ \
                                                     RSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_12([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
    const std::string example {"Hello, OpenHarmony!!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_13([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 表情符号以及其Unicode编码
    const std::string example {"Hello, OpenHarmony!\\ud83d\\udc46\\ud83d\\udc7f\\ud83d\\udc40\\ud83d\\udcaf\\ud83c \
                         \\udf85\\ud83d\\ude3c\\ud83d\\udd27\\ud83d\\udc87\\ud83e\\udd3c\\u200d\\u2642 \
                          \\ufe0f\\ud83d\\udee2\\ud83c\\udc04\\ud83c\\udff4"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_14([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    //非法unicode编码
    const std::string example {"Hello, OpenHarmony!\\udc04\\ud83d\\udff4"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_15([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 单个字节 0x41 (代表'A') -> 符合
    const std::string example {"Hello, OpenHarmony!\x41"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_16([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 0x80 -> 二进制为10000000，最高位为1，不符合单字节字符规范
    const std::string example {"Hello, OpenHarmony!\x80"};
    return CheckUtf8IllegalString(env, example.c_str());
}

ani_boolean test_String_New_UTF8_17([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 双字节
    const std::string example {"Hello, OpenHarmony!\xC2\x80"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_18([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"Hello, OpenHarmony!\xCC\x5C"};
    return CheckUtf8IllegalString(env, example.c_str());
}

ani_boolean test_String_New_UTF8_19([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 3字节
    const std::string example {"Hello, OpenHarmony!\xE0\xA0\x80"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_20([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"Hello, OpenHarmony!\xE0\x7F\x80"};
    return CheckUtf8IllegalString(env, example.c_str());
}

ani_boolean test_String_New_UTF8_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 4字节
    const std::string example {"Hello, OpenHarmony!\xF0\x90\x80\x80"};
    return CheckUtf8String(env, example.c_str());
}

ani_boolean test_String_New_UTF8_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const std::string example {"Hello, OpenHarmony!\xF0\x7F\x80\x80"};
    return CheckUtf8String(env, example.c_str());
}

/*
    UTF-16编码规则：
    Unicode码点小于0x10000的，使用一个16位码元（即两个字节）表示，与UCS-2编码相同。
    Unicode码点大于等于0x10000的，使用两个16位码元（即四个字节）表示，这被称为代理对（Surrogate Pair）。
    具体规则：将码点减去0x10000，得到20位的值。
    高10位（范围0x000-0x3FF）加上0xD800得到高位代理（High Surrogate），范围0xD800-0xDBFF。
    低10位（范围0x000-0x3FF）加上0xDC00得到低位代理（Low Surrogate），范围0xDC00-0xDFFF。
*/
ani_boolean CheckUtf16String(ani_env *env, const std::u16string example)
{
    // 创建ani字符串
    ani_string utf16String = nullptr;
    ani_status status = env->String_NewUTF16(reinterpret_cast<const uint16_t*>(example.c_str()),
                                             example.size(), &utf16String);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(utf16String, nullptr);
    // 从ani字符串提取回C字符串
    const uint32_t bufferSize = example.size() + 1;
    uint16_t utfBuffer[bufferSize];
    ani_size resultSize = 0U;
    auto status1 = env->String_GetUTF16(utf16String, utfBuffer, bufferSize, &resultSize);
    if (status1 != ANI_OK) {
        return ANI_FALSE;
    }
    if (resultSize != example.size()) {
        return ANI_FALSE;
    }
    // 逐个字符比较
    for (size_t i = 0; i < example.size(); ++i) {
        if (example[i] != utfBuffer[i]) {
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}

ani_boolean test_String_UTF16_21([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 输入原始C字符串
    std::u16string input = u"Hello, OpenHarmony!";       // true
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_22([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 特殊转移字符
    std::u16string input = u"Hello, OpenHarmony!\a\b\f\n\r\t\v\\\'\"\0\177\x5c";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_23([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // ASCII码全量覆盖
    std::u16string input = u"Hello, OpenHarmony!!\"#$%&'()*+,-./0123456789:;\
        <=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_24([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
    std::u16string input = u"Hello, OpenHarmony!!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_25([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 表情符号以及其Unicode编码
    std::u16string input = u"Hello, OpenHarmony!\\ud83d\\udc46\\ud83d\\udc7f\\ud83d\\udc40\\ud83d\\udcaf\\ud83c\\udf85 \
                         \\ud83d\\ude3c\\ud83d\\udd27\\ud83d\\udc87\\ud83e\\udd3c\\u200d\\u2642 \
                          \\ufe0f\\ud83d\\udee2\\ud83c\\udc04\\ud83c\\udff4";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_26([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 非法unicode编码
    std::u16string input = u"Hello, OpenHarmony!\\udc04\\ud83d\\udff4";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_27([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 单个字节
    // 0x41 (代表'A') -> 符合
    std::u16string input = u"Hello, OpenHarmony!\x41";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_28([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 0x80 -> 二进制为10000000，最高位为1，不符合单字节字符规范
    std::u16string input = u"Hello, OpenHarmony!\x80";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_29([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 双字节
    std::u16string input = u"Hello, OpenHarmony!\xC2\x80";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_30([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = u"Hello, OpenHarmony!\xCC\x5C";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_31([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 3字节
    std::u16string input = u"Hello, OpenHarmony!\xE0\xA0\x80";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_32([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = u"Hello, OpenHarmony!\xE0\x7F\x80";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_33([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    // 4字节
    std::u16string input = u"Hello, OpenHarmony!\xF0\x90\x80\x80";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_34([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = u"Hello, OpenHarmony!\xF0\x7F\x80\x80";
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_35([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = u"A";  // 符合UTF-16的示例 英文字母
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_36([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = u"中"; // 符合UTF-16的示例 中文字符
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_37([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = u"😀"; // 符合UTF-16的示例 表情符号（代理对）
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_38([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input =  u"Hello 世界🎉"; // 符合UTF-16的示例 混合字符
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_39([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = {0xD800};  // 不符合UTF-16的示例 孤立的高位代理
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_40([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = {0xDC00, 0xD800};   // 不符合UTF-16的示例 顺序错误的代理对
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_41([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = {0x0041, 0xD800};   // 不符合UTF-16的示例 不完整的代理对
    return CheckUtf16String(env, input);
}

ani_boolean test_String_UTF16_42([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::u16string input = {0xDFFF, 0xDFFF};  // 不符合UTF-16的示例 无效的代理组合
    return CheckUtf16String(env, input);
}
#endif // ARKTS_ANI_TEST_STRING_OPERATIONS_H
