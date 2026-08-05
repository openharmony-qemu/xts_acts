/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_FIXEDARRAY_H
#define ARKTS_ANI_TEST_FIXEDARRAY_H
#include "ArrayTestCommon.h"

// NOLINTBEGIN(cppcoreguidelines-pro-type-vararg)
template <typename R, typename... Args>
ani_int DoCallFunction(ani_env *env, std::optional<R> *result, ani_function fn, Args &&...args)
{
    std::conditional_t<std::is_same_v<R, void>, std::nullopt_t, R> value {};
    ani_status status;

    if constexpr (std::is_same_v<R, ani_boolean>) {
        status = env->Function_Call_Boolean(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_byte>) {
        status = env->Function_Call_Byte(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_char>) {
        status = env->Function_Call_Char(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_short>) {
        status = env->Function_Call_Short(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_int>) {
        status = env->Function_Call_Int(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_long>) {
        status = env->Function_Call_Long(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_float>) {
        status = env->Function_Call_Float(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, ani_double>) {
        status = env->Function_Call_Double(fn, &value, std::forward<Args>(args)...);
    } else if constexpr (std::is_same_v<R, void>) {
        status = env->Function_Call_Void(fn, std::forward<Args>(args)...);
        value = std::nullopt;
    } else if constexpr (std::is_same_v<R, ani_ref> || std::is_same_v<R, ani_tuple_value> ||
        std::is_same_v<R, ani_object>) {
        ani_ref resultRef {};
        status = env->Function_Call_Ref(fn, &resultRef, std::forward<Args>(args)...);
        value = static_cast<R>(resultRef);
    } else {
        enum { INCORRECT_TEMPLATE_TYPE = false };
        static_assert(INCORRECT_TEMPLATE_TYPE, "Incorrect template type");
    }

    if (status == ANI_PENDING_ERROR) {
        ASSERT_EQ(env->DescribeError(), ANI_OK);
    }
    ASSERT_EQ(status, ANI_OK);

    result->emplace(value);
    return ANI_TRUE;
}
// NOLINTEND(cppcoreguidelines-pro-type-vararg)

template <typename R, typename... Args>
ani_int CallEtsFunctionImpl(ani_env *env, std::optional<R> *result, const std::string &moduleDescriptor,
                            const std::string &fnName, Args &&...args)
{
    ani_module mod {};
    ASSERT_EQ(env->FindModule(moduleDescriptor.c_str(), &mod), ANI_OK);
    ani_function fn {};
    ASSERT_EQ(env->Module_FindFunction(mod, fnName.c_str(), nullptr, &fn), ANI_OK);
    ASSERT_EQ(DoCallFunction(env, result, fn, std::forward<Args>(args)...), ANI_TRUE);
    return ANI_TRUE;
}

/// Call function with name `fnName` from module denoted by `moduleDescriptor`
template <typename R, typename... Args>
R CallEtsFunction(ani_env *env, const std::string &moduleName, const std::string &fnName, Args &&...args)
{
    std::optional<R> result;
    CallEtsFunctionImpl(env, &result, moduleName, fnName, std::forward<Args>(args)...);
    if constexpr (!std::is_same_v<R, void>) {
        return result.value();
    }
}

ani_int test_FixedArray_Get([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *tmpName = "entry.src.main.src.ets.FixedArray";
    auto array = static_cast<ani_fixedarray>(CallEtsFunction<ani_ref>(env, tmpName, "getArray1"));
    const ani_size index1 = 1;
    const ani_size index2 = 2;
    ani_ref ref1 = nullptr;
    ani_ref ref2 = nullptr;
    ani_boolean isNull;
    ASSERT_EQ(env->FixedArray_Get(array, index1, &ref1), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Get_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_ref ref = nullptr;
    const ani_size index = 0;
    const ani_size invalidIndex = 5;
    ASSERT_EQ(env_->FixedArray_Get(nullptr, index, &ref), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_FixedArray_Get_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *tmpName = "entry.src.main.src.ets.FixedArray";
    auto array = static_cast<ani_fixedarray>(CallEtsFunction<ani_ref>(env_, tmpName, "getArray1"));
    ani_ref ref1 = nullptr;
    ani_ref ref2 = nullptr;
    ani_boolean isNull;
    const ani_size index0 = 0;
    const ani_size index2 = 2;
    ASSERT_EQ(env_->FixedArray_Get(array, index0, &ref1), ANI_OK);
    ASSERT_EQ(env_->Reference_IsNull(ref1, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_TRUE);
    ASSERT_EQ(env_->FixedArray_Get(array, index2, &ref2), ANI_OK);
    ASSERT_EQ(env_->Reference_IsNull(ref2, &isNull), ANI_OK);
    ASSERT_EQ(isNull, ANI_FALSE);
    return ANI_TRUE;
}

ani_boolean test_FixedArray_GetLength([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_NE(undefinedRef, nullptr);

    ani_fixedarray array = nullptr;
    ASSERT_EQ(env->FixedArray_New(cls, LENGTH_5, undefinedRef, &array), ANI_OK);
    ASSERT_NE(array, nullptr);

    ani_size length = 0;
    ASSERT_EQ(env->FixedArray_GetLength(array, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);
    return ANI_TRUE;
}

ani_boolean test_FixedArray_GetLength_01([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size length = 0;
    ASSERT_EQ(env->FixedArray_GetLength(nullptr, &length), ANI_INVALID_ARGS);

    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_NE(undefinedRef, nullptr);

    ani_fixedarray array = nullptr;
    ASSERT_EQ(env->FixedArray_New(cls, LENGTH_5, undefinedRef, &array), ANI_OK);
    ASSERT_NE(array, nullptr);
    ASSERT_EQ(env->FixedArray_GetLength(array, nullptr), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_boolean test_FixedArray_GetLength_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_NE(undefinedRef, nullptr);

    ani_class stringClass = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &stringClass), ANI_OK);
    ASSERT_NE(stringClass, nullptr);
    ani_fixedarray stringArray = nullptr;
    ASSERT_EQ(env_->FixedArray_New(stringClass, LENGTH_5, undefinedRef, &stringArray), ANI_OK);
    ani_size length = 0;
    ASSERT_EQ(env_->FixedArray_GetLength(stringArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_5);

    ani_class objectClass = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.Object", &objectClass), ANI_OK);
    ASSERT_NE(objectClass, nullptr);
    ani_fixedarray objectArray = nullptr;
    ASSERT_EQ(env_->FixedArray_New(objectClass, LENGTH_6, undefinedRef, &objectArray), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(objectArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_6);

    ani_class errorClass = nullptr;
    ASSERT_EQ(env_->FindClass("escompat.Error", &errorClass), ANI_OK);
    ASSERT_NE(errorClass, nullptr);
    ani_fixedarray errorArray = nullptr;
    ASSERT_EQ(env_->FixedArray_New(errorClass, LENGTH_10, undefinedRef, &errorArray), ANI_OK);
    ASSERT_EQ(env_->FixedArray_GetLength(errorArray, &length), ANI_OK);
    ASSERT_EQ(length, LENGTH_10);
    return ANI_TRUE;
}

ani_int test_FixedArray_New([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    // Test zero length
    ani_fixedarray zeroLengthArray = nullptr;
    ASSERT_EQ(env->FixedArray_New(cls, ZERO, nullptr, &zeroLengthArray), ANI_OK);
    ASSERT_NE(zeroLengthArray, nullptr);
    return ANI_TRUE;
}

ani_int test_FixedArray_New_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_fixedarray array = nullptr;
    // Test null result pointer
    ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_5, nullptr, nullptr), ANI_INVALID_ARGS);

    // Test null class
    ASSERT_EQ(env_->FixedArray_New(nullptr, LENGTH_5, nullptr, &array), ANI_INVALID_ARGS);

    if (sizeof(ani_size) > sizeof(uint32_t)) {
        ani_size maxLength = std::numeric_limits<uint32_t>::max() + ani_size(1);
        ASSERT_EQ(env_->FixedArray_New(cls, maxLength, nullptr, &array), ANI_INVALID_ARGS);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_New_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    // Test zero length
    ani_fixedarray zeroLengthArray = nullptr;
    ASSERT_EQ(env_->FixedArray_New(cls, ZERO, nullptr, &zeroLengthArray), ANI_OK);
    ASSERT_NE(zeroLengthArray, nullptr);
    ani_size zeroLengthSize = 0;
    ASSERT_EQ(env_->FixedArray_GetLength(zeroLengthArray, &zeroLengthSize), ANI_OK);
    ASSERT_EQ(zeroLengthSize, ZERO);

    ani_fixedarray array = nullptr;
    ani_size size = 0;

    // Test creating array with undefined initial element
    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_5, undefinedRef, &array), ANI_OK);
    ASSERT_NE(array, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array, &size), ANI_OK);
    ASSERT_EQ(size, LENGTH_5);

    // Test creating array with null initial element
    ani_ref nullRef = nullptr;
    ASSERT_EQ(env_->GetNull(&nullRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_5, nullRef, &array), ANI_OK);
    ASSERT_NE(array, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array, &size), ANI_OK);
    ASSERT_EQ(size, LENGTH_5);

    // Test creating array with initial element
    ani_string str = nullptr;
    const char *utf8String = "test";
    const ani_size stringLength = strlen(utf8String);
    ASSERT_EQ(env_->String_NewUTF8(utf8String, stringLength, &str), ANI_OK);
    ASSERT_NE(str, nullptr);
    ani_fixedarray array2 = nullptr;
    ASSERT_EQ(env_->FixedArray_New(cls, stringLength, str, &array2), ANI_OK);
    ASSERT_NE(array2, nullptr);

    // Verify initial element was set for all elements
    for (ani_size i = 0; i < stringLength; i++) {
        ani_ref element = nullptr;
        ASSERT_EQ(env_->FixedArray_Get(array2, i, &element), ANI_OK);
        ani_size resultSize = 0;
        char utfBuffer[LENGTH_10] = {0};
        ASSERT_EQ(env_->String_GetUTF8SubString(reinterpret_cast<ani_string>(element), ZERO, stringLength, utfBuffer,
                                                sizeof(utfBuffer), &resultSize),
                  ANI_OK);
        ASSERT_EQ(strcmp(utfBuffer, utf8String), 0);
    }
    return ANI_TRUE;
}


ani_int test_FixedArray_New_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_fixedarray array1 = nullptr;
    ani_fixedarray array2 = nullptr;
    ani_fixedarray array3 = nullptr;
    ani_size size = 0;

    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, MINI_LENGTH, undefinedRef, &array1), ANI_OK);
    ASSERT_NE(array1, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array1, &size), ANI_OK);
    ASSERT_EQ(size, MINI_LENGTH);

    ASSERT_EQ(env_->FixedArray_New(cls, MID_LENGTH, undefinedRef, &array2), ANI_OK);
    ASSERT_NE(array2, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array2, &size), ANI_OK);
    ASSERT_EQ(size, MID_LENGTH);

    ASSERT_EQ(env_->FixedArray_New(cls, BIG_LENGTH, undefinedRef, &array3), ANI_OK);
    ASSERT_NE(array3, nullptr);
    ASSERT_EQ(env_->FixedArray_GetLength(array3, &size), ANI_OK);
    ASSERT_EQ(size, BIG_LENGTH);
    return ANI_TRUE;
}

ani_int test_FixedArray_New_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ani_fixedarray array = nullptr;
        ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_5, undefinedRef, &array), ANI_OK);
        ASSERT_NE(array, nullptr);
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_New_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);

    ani_string str = nullptr;
    auto status = env_->String_NewUTF8("", 0U, &str);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(str, nullptr);

    const ani_size maxNum = std::numeric_limits<uint32_t>::max();
    ani_fixedarray array1 = nullptr;
    ani_ref undefinedRef = nullptr;
    ASSERT_EQ(env_->GetUndefined(&undefinedRef), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, ZERO, undefinedRef, &array1), ANI_OK);
    ASSERT_NE(array1, nullptr);

    ani_fixedarray array2 = nullptr;
    ASSERT_EQ(env_->FixedArray_New(cls, maxNum, undefinedRef, &array2), ANI_OUT_OF_MEMORY);

    ani_fixedarray array3 = nullptr;
    ASSERT_EQ(env_->FixedArray_New(cls, ZERO, str, &array3), ANI_PENDING_ERROR);

    ani_fixedarray array4 = nullptr;
    ASSERT_EQ(env_->FixedArray_New(cls, maxNum, str, &array4), ANI_PENDING_ERROR);
    return ANI_TRUE;
}


ani_int test_FixedArray_Set([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *tmpName = "entry.src.main.src.ets.FixedArray";
    auto array = static_cast<ani_fixedarray>(CallEtsFunction<ani_ref>(env, tmpName, "getArray2"));

    auto newValue1 = static_cast<ani_ref>(CallEtsFunction<ani_ref>(env, tmpName, "getNewString1"));
    const ani_size index1 = 0;
    ASSERT_EQ(env->FixedArray_Set(array, index1, newValue1), ANI_OK);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_01([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_3, str, &array), ANI_OK);
    const ani_size index = 0;
    const ani_size invalidIndex = 5;
    ASSERT_EQ(env_->FixedArray_Set(nullptr, index, str), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->FixedArray_Set(array, invalidIndex, str), ANI_OUT_OF_RANGE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_02([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const ani_size index1 = 0;
    const ani_size index2 = 2;
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_03([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    ASSERT_NE(cls, nullptr);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_3, str, &array), ANI_OK);

    const ani_size errorIndex = -1;
    ASSERT_EQ(env_->FixedArray_Set(array, errorIndex, str), ANI_OUT_OF_RANGE);
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_04([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_5, str, &array), ANI_OK);

    std::string_view newString1 {"New String 1!"};
    ani_string newStr1 {};
    ASSERT_EQ(env_->String_NewUTF8(newString1.data(), newString1.length(), &newStr1), ANI_OK);

    const ani_size index1 = 1;
    ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr1), ANI_OK);
    ani_ref ref1 = nullptr;
    ASSERT_EQ(env_->FixedArray_Get(array, index1, &ref1), ANI_OK);

    std::string result {};
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr1), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_Get(array, index1, &ref1), ANI_OK);
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    const ani_size index2 = 2;

    std::string_view newString2 {"New String 2!"};
    ani_string newStr2 {};
    ASSERT_EQ(env_->String_NewUTF8(newString2.data(), newString2.length(), &newStr2), ANI_OK);

    ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr1), ANI_OK);
    ASSERT_EQ(env_->FixedArray_Set(array, index2, newStr2), ANI_OK);
    for (ani_int i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr2), ANI_OK);
        ASSERT_EQ(env_->FixedArray_Set(array, index2, newStr1), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_Get(array, index1, &ref1), ANI_OK);
    ani_ref ref2 = nullptr;
    std::string result2 {};
    ASSERT_EQ(env_->FixedArray_Get(array, index2, &ref2), ANI_OK);
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    GetStdString(env_, static_cast<ani_string>(ref2), result2);
    ASSERT_STREQ(result.c_str(), "New String 2!");
    ASSERT_STREQ(result2.c_str(), "New String 1!");

    ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr1), ANI_OK);
    for (ani_size i = 0; i < LENGTH_5; i++) {
        ASSERT_EQ(env_->FixedArray_Get(array, index1, &ref1), ANI_OK);
        GetStdString(env_, static_cast<ani_string>(ref1), result);
        ASSERT_STREQ(result.c_str(), "New String 1!");
    }
    return ANI_TRUE;
}

ani_int test_FixedArray_Set_05([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_fixedarray array = nullptr;
    ani_class cls = nullptr;
    ASSERT_EQ(env_->FindClass("std.core.String", &cls), ANI_OK);
    std::string_view rawString {"1234"};
    ani_string str {};
    ASSERT_EQ(env_->String_NewUTF8(rawString.data(), rawString.length(), &str), ANI_OK);
    ASSERT_EQ(env_->FixedArray_New(cls, LENGTH_3, str, &array), ANI_OK);
    ani_ref ref1 = nullptr;
    
    std::string_view newString1 {"New String 1!"};
    ani_string newStr1 {};
    ASSERT_EQ(env_->String_NewUTF8(newString1.data(), newString1.length(), &newStr1), ANI_OK);
    
    const ani_size index1 = 1;
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr1), ANI_OK);
    }
    ASSERT_EQ(env_->FixedArray_Get(array, index1, &ref1), ANI_OK);
    std::string result {};
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr1), ANI_OK);
    }
    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Get(array, index1, &ref1), ANI_OK);
    }
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");

    for (ani_int i = 0; i < LENGTH_3; i++) {
        ASSERT_EQ(env_->FixedArray_Set(array, index1, newStr1), ANI_OK);
        ASSERT_EQ(env_->FixedArray_Get(array, index1, &ref1), ANI_OK);
    }
    GetStdString(env_, static_cast<ani_string>(ref1), result);
    ASSERT_STREQ(result.c_str(), "New String 1!");
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_FIXEDARRAY_H
