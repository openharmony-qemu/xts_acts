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

#ifndef ARKTS_ANI_TEST_TC_FIXEDARRAY_TEST_H
#define ARKTS_ANI_TEST_TC_FIXEDARRAY_TEST_H
#include "Common.h"
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_fixedarray {
constexpr ani_size SIZE_TWO = 2;
constexpr ani_size SIZE_THREE = 3;
constexpr ani_size INDEX_ZERO = 0;
constexpr ani_size INDEX_ONE = 1;
constexpr ani_size INDEX_TWO = 2;
constexpr ani_int INT_ONE = 1;
constexpr ani_int INT_TWO = 2;
constexpr ani_int INT_THREE = 3;
constexpr ani_int NESTED_EXPECT_SUM = 45;
constexpr ani_double DOUBLE_PI = 3.14;
constexpr const char *STRING_CLASS = "std.core.String";
constexpr const char *OBJECT_CLASS = "std.core.Object";
constexpr const char *INT_VALUE_ARRAY_CLASS = "A{i}";
constexpr const char *STR_ONE = "one";
constexpr const char *STR_TWO = "two";
constexpr const char *STR_THREE = "three";
constexpr const char *STR_FIRST = "first";
constexpr const char *STR_SECOND = "second";
constexpr const char *STR_HELLO = "hello";

std::string FixedArrayAniStringToStd(ani_env *env, ani_string str)
{
    if (env == nullptr || str == nullptr) {
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

inline ani_string NewString(ani_env *env, const char *value)
{
    if (env == nullptr || value == nullptr) {
        return nullptr;
    }
    ani_string result {};
    std::string text(value);
    if (env->String_NewUTF8(text.c_str(), text.size(), &result) != ANI_OK) {
        return nullptr;
    }
    return result;
}

inline bool CreateNestedIntValueArray(ani_env *env, ani_size size, ani_valuearray_int *array)
{
    return env->ValueArray_New_Int(size, array) == ANI_OK && *array != nullptr;
}

inline bool CreateStringRefArray(ani_env *env, ani_size size, ani_fixedarray *array)
{
    ani_class stringCls {};
    if (env->FindClass(STRING_CLASS, &stringCls) != ANI_OK) {
        return false;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    return env->FixedArray_New(static_cast<ani_type>(stringCls), size, undefinedRef, array) == ANI_OK;
}
inline bool CreateObjectRefArray(ani_env *env, ani_size size, ani_fixedarray *array)
{
    ani_class objectCls {};
    if (env->FindClass(OBJECT_CLASS, &objectCls) != ANI_OK) {
        return false;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    return env->FixedArray_New(static_cast<ani_type>(objectCls), size, undefinedRef, array) == ANI_OK;
}
inline bool FillDifferentTypeStringArray(ani_env *env, ani_fixedarray stringArray)
{
    ani_string s1 = NewString(env, STR_ONE);
    ani_string s2 = NewString(env, STR_TWO);
    ani_string s3 = NewString(env, STR_THREE);
    if (s1 == nullptr || s2 == nullptr || s3 == nullptr) {
        return false;
    }
    return env->FixedArray_Set(stringArray, INDEX_ZERO, static_cast<ani_ref>(s1)) == ANI_OK &&
        env->FixedArray_Set(stringArray, INDEX_ONE, static_cast<ani_ref>(s2)) == ANI_OK &&
        env->FixedArray_Set(stringArray, INDEX_TWO, static_cast<ani_ref>(s3)) == ANI_OK;
}
inline bool CheckDifferentTypeStringArray(ani_env *env, ani_fixedarray stringArray)
{
    ani_ref readRef {};
    if (env->FixedArray_Get(stringArray, INDEX_TWO, &readRef) != ANI_OK) {
        return false;
    }
    return FixedArrayAniStringToStd(env, static_cast<ani_string>(readRef)) == STR_THREE;
}
}
ani_fixedarray test_FixedArrayString(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray array {};
    if (!ani_tc_fixedarray::CreateStringRefArray(env, ani_tc_fixedarray::SIZE_TWO, &array)) {
        return nullptr;
    }
    ani_string first = ani_tc_fixedarray::NewString(env, ani_tc_fixedarray::STR_FIRST);
    ani_string second = ani_tc_fixedarray::NewString(env, ani_tc_fixedarray::STR_SECOND);
    env->FixedArray_Set(array, ani_tc_fixedarray::INDEX_ZERO, static_cast<ani_ref>(first));
    env->FixedArray_Set(array, ani_tc_fixedarray::INDEX_ONE, static_cast<ani_ref>(second));
    return array;
}
ani_boolean test_CheckFixedArrayString(ani_env *env, ani_object object, ani_fixedarray array)
{
    (void)object;
    ani_ref first {};
    ani_ref second {};
    if (env->FixedArray_Get(array, ani_tc_fixedarray::INDEX_ZERO, &first) != ANI_OK ||
        env->FixedArray_Get(array, ani_tc_fixedarray::INDEX_ONE, &second) != ANI_OK) {
        return ANI_FALSE;
    }
    bool ok = ani_tc_fixedarray::FixedArrayAniStringToStd(env, static_cast<ani_string>(first)) ==
            ani_tc_fixedarray::STR_FIRST &&
        ani_tc_fixedarray::FixedArrayAniStringToStd(env, static_cast<ani_string>(second)) ==
            ani_tc_fixedarray::STR_SECOND;
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_fixedarray test_FixedArrayObjectRefs(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray array {};
    if (!ani_tc_fixedarray::CreateObjectRefArray(env, ani_tc_fixedarray::SIZE_TWO, &array)) {
        return nullptr;
    }
    ani_string str = ani_tc_fixedarray::NewString(env, ani_tc_fixedarray::STR_HELLO);
    ani_object boxedDouble {};
    env->Primitive_Box_Double(ani_tc_fixedarray::DOUBLE_PI, &boxedDouble);
    env->FixedArray_Set(array, ani_tc_fixedarray::INDEX_ZERO, static_cast<ani_ref>(str));
    env->FixedArray_Set(array, ani_tc_fixedarray::INDEX_ONE, static_cast<ani_ref>(boxedDouble));
    return array;
}
ani_boolean test_CheckFixedArrayObjectRefs(ani_env *env, ani_object object, ani_fixedarray array)
{
    (void)object;
    ani_ref first {};
    ani_ref second {};
    if (env->FixedArray_Get(array, ani_tc_fixedarray::INDEX_ZERO, &first) != ANI_OK ||
        env->FixedArray_Get(array, ani_tc_fixedarray::INDEX_ONE, &second) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class stringCls {};
    ani_class doubleCls {};
    if (env->FindClass(ani_tc_fixedarray::STRING_CLASS, &stringCls) != ANI_OK ||
        env->FindClass("std.core.Double", &doubleCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isString = ANI_FALSE;
    ani_boolean isDouble = ANI_FALSE;
    env->Object_InstanceOf(static_cast<ani_object>(first), static_cast<ani_type>(stringCls), &isString);
    env->Object_InstanceOf(static_cast<ani_object>(second), static_cast<ani_type>(doubleCls), &isDouble);
    return isString == ANI_TRUE && isDouble == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}
ani_fixedarray test_FixedArrayNested(ani_env *env, ani_object object)
{
    (void)object;
    ani_class intArrayCls {};
    if (env->FindClass(ani_tc_fixedarray::INT_VALUE_ARRAY_CLASS, &intArrayCls) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    ani_fixedarray outer {};
    if (env->FixedArray_New(static_cast<ani_type>(intArrayCls),
        ani_tc_fixedarray::SIZE_THREE, undefinedRef, &outer) != ANI_OK) {
        return nullptr;
    }
    for (ani_size i = 0; i < ani_tc_fixedarray::SIZE_THREE; i++) {
        ani_valuearray_int inner {};
        if (!ani_tc_fixedarray::CreateNestedIntValueArray(env, ani_tc_fixedarray::SIZE_THREE, &inner)) {
            return nullptr;
        }
        ani_int values[ani_tc_fixedarray::SIZE_THREE] = {
            static_cast<ani_int>(i * ani_tc_fixedarray::SIZE_THREE + ani_tc_fixedarray::INT_ONE),
            static_cast<ani_int>(i * ani_tc_fixedarray::SIZE_THREE + ani_tc_fixedarray::INT_TWO),
            static_cast<ani_int>(i * ani_tc_fixedarray::SIZE_THREE + ani_tc_fixedarray::INT_THREE)
        };
        env->ValueArray_SetRegion_Int(inner, ani_tc_fixedarray::INDEX_ZERO,
            ani_tc_fixedarray::SIZE_THREE, values);
        env->FixedArray_Set(outer, i, static_cast<ani_ref>(inner));
    }
    return outer;
}
ani_boolean test_CheckFixedArrayNested(ani_env *env, ani_object object, ani_fixedarray outer)
{
    (void)object;
    ani_int sum = 0;
    for (ani_size i = 0; i < ani_tc_fixedarray::SIZE_THREE; i++) {
        ani_ref innerRef {};
        if (env->FixedArray_Get(outer, i, &innerRef) != ANI_OK) {
            return ANI_FALSE;
        }
        ani_int values[ani_tc_fixedarray::SIZE_THREE] = {};
        if (env->ValueArray_GetRegion_Int(static_cast<ani_valuearray_int>(innerRef),
            ani_tc_fixedarray::INDEX_ZERO, ani_tc_fixedarray::SIZE_THREE, values) != ANI_OK) {
            return ANI_FALSE;
        }
        sum += values[ani_tc_fixedarray::INDEX_ZERO] +
            values[ani_tc_fixedarray::INDEX_ONE] +
            values[ani_tc_fixedarray::INDEX_TWO];
    }
    return sum == ani_tc_fixedarray::NESTED_EXPECT_SUM ? ANI_TRUE : ANI_FALSE;
}
#endif
