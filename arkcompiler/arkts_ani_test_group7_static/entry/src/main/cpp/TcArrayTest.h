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

#ifndef ANI_TC_ARRAY_TEST_H
#define ANI_TC_ARRAY_TEST_H
#include "Common.h"
#include <cmath>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_array {
constexpr ani_size ARRAY_EMPTY_LENGTH = 0;
constexpr ani_size ARRAY_LENGTH_TWO = 2;
constexpr ani_size ARRAY_LENGTH_THREE = 3;
constexpr ani_size ARRAY_LENGTH_FIVE = 5;
constexpr ani_size ARRAY_MATRIX_ROWS = 2;
constexpr ani_size ARRAY_MATRIX_COLS = 3;
constexpr ani_size ARRAY_OBJECT_INDEX_ZERO = 0;
constexpr ani_size ARRAY_OBJECT_INDEX_ONE = 1;
constexpr ani_size ARRAY_OUT_OF_RANGE_INDEX = 2;
constexpr ani_size ARRAY_EXPAND_INDEX = 5;
constexpr ani_int ARRAY_VALUE_ONE = 1;
constexpr ani_int ARRAY_VALUE_TWO = 2;
constexpr ani_int ARRAY_VALUE_THREE = 3;
constexpr ani_int ARRAY_VALUE_FOUR = 4;
constexpr ani_int ARRAY_VALUE_FIVE = 5;
constexpr ani_int ARRAY_VALUE_SEVEN = 7;
constexpr ani_int ARRAY_VALUE_TEN = 10;
constexpr ani_int ARRAY_VALUE_TWENTY = 20;
constexpr ani_int ARRAY_VALUE_THIRTY = 30;
constexpr ani_int ARRAY_VALUE_FIFTY_FIVE = 55;
constexpr ani_int ARRAY_VALUE_NINETY_NINE = 99;
constexpr ani_int ARRAY_VALUE_HUNDRED = 100;
constexpr ani_int ARRAY_VALUE_TWO_HUNDRED = 200;
constexpr ani_int ARRAY_VALUE_THREE_HUNDRED = 300;
constexpr ani_int ARRAY_MIXED_INT_VALUE = 123;
constexpr ani_int ARRAY_MATRIX_ROW_FACTOR = 10;
constexpr ani_int ARRAY_ERROR_RETURN = -1;
constexpr ani_int ARRAY_LENGTH_ERROR_RETURN = -2;
constexpr ani_double ARRAY_DOUBLE_FIRST = 0.1;
constexpr ani_double ARRAY_DOUBLE_SECOND = 0.2;
constexpr ani_double ARRAY_DOUBLE_THIRD = 0.3;
constexpr ani_double ARRAY_PUSH_DOUBLE_FIRST = 1.5;
constexpr ani_double ARRAY_PUSH_DOUBLE_SECOND = 2.5;
constexpr ani_double ARRAY_PUSH_DOUBLE_THIRD = 3.5;
constexpr const char *ARRAY_MIXED_STRING = "hello";
constexpr const char *ARRAY_POINT_CLASS = "entry.src.main.src.ets.Index.ArrayPoint";
inline ani_ref ArrayGetUndefined(ani_env *env)
{
    ani_ref ref {};
    env->GetUndefined(&ref);
    return ref;
}
inline ani_ref ArrayGetNull(ani_env *env)
{
    ani_ref ref {};
    env->GetNull(&ref);
    return ref;
}
inline ani_object ArrayBoxInt(ani_env *env, ani_int value)
{
    ani_object result {};
    ani_status status = env->Primitive_Box_Int(value, &result);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Box_Int failed")) {
        return nullptr;
    }
    return result;
}
inline ani_object ArrayBoxDouble(ani_env *env, ani_double value)
{
    ani_object result {};
    ani_status status = env->Primitive_Box_Double(value, &result);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Box_Double failed")) {
        return nullptr;
    }
    return result;
}
inline ani_object ArrayBoxBoolean(ani_env *env, ani_boolean value)
{
    ani_object result {};
    ani_status status = env->Primitive_Box_Boolean(value, &result);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Box_Boolean failed")) {
        return nullptr;
    }
    return result;
}
inline ani_string ArrayNewString(ani_env *env, const std::string &value)
{
    ani_string result {};
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
inline bool ArrayUnboxInt(ani_env *env, ani_ref ref, ani_int *value)
{
    ani_status status = env->Primitive_Unbox_Int(static_cast<ani_object>(ref), value);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Unbox_Int failed")) {
        return false;
    }
    return true;
}
inline bool ArrayUnboxDouble(ani_env *env, ani_ref ref, ani_double *value)
{
    ani_status status = env->Primitive_Unbox_Double(static_cast<ani_object>(ref), value);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Unbox_Double failed")) {
        return false;
    }
    return true;
}
ani_array ArrayCreateWithInts(ani_env *env, const std::vector<ani_int> &values)
{
    ani_array array {};
    ani_ref undefinedRef = ArrayGetUndefined(env);
    ani_status status = env->Array_New(values.size(), undefinedRef, &array);
    if (!AssertEqMsg(status, ANI_OK, "Array_New failed")) {
        return nullptr;
    }
    for (ani_size i = 0; i < values.size(); i++) {
        ani_object boxed = ArrayBoxInt(env, values[i]);
        status = env->Array_Set(array, i, static_cast<ani_ref>(boxed));
        if (!AssertEqMsg(status, ANI_OK, "Array_Set failed")) {
            return nullptr;
        }
    }
    return array;
}
}
ani_array test_ArrayCreateEmpty(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    ani_status status = env->Array_New(
        ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    if (!AssertEqMsg(status, ANI_OK, "Array_New empty failed")) {
        return nullptr;
    }
    return array;
}
ani_int test_ArrayGetLength(ani_env *env, ani_object object, ani_array array)
{
    (void)object;
    ani_size length = 0;
    ani_status status = env->Array_GetLength(array, &length);
    if (!AssertEqMsg(status, ANI_OK, "Array_GetLength failed")) {
        return ani_tc_array::ARRAY_ERROR_RETURN;
    }
    return static_cast<ani_int>(length);
}
ani_array test_ArrayCreateAndSetGet(ani_env *env, ani_object object)
{
    (void)object;
    return ani_tc_array::ArrayCreateWithInts(env, {
        ani_tc_array::ARRAY_VALUE_TEN,
        ani_tc_array::ARRAY_VALUE_TWENTY,
        ani_tc_array::ARRAY_VALUE_THIRTY
    });
}
ani_boolean test_ArrayCheckIntElements(ani_env *env, ani_object object, ani_array array)
{
    (void)object;
    ani_size length = 0;
    if (env->Array_GetLength(array, &length) != ANI_OK ||
        length != ani_tc_array::ARRAY_LENGTH_THREE) {
        return ANI_FALSE;
    }
    const ani_int expected[] = {
        ani_tc_array::ARRAY_VALUE_TEN,
        ani_tc_array::ARRAY_VALUE_TWENTY,
        ani_tc_array::ARRAY_VALUE_THIRTY
    };
    for (ani_size i = 0; i < length; i++) {
        ani_ref ref {};
        if (env->Array_Get(array, i, &ref) != ANI_OK) {
            return ANI_FALSE;
        }
        ani_int value = 0;
        if (!ani_tc_array::ArrayUnboxInt(env, ref, &value) || value != expected[i]) {
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}
ani_array test_ArrayPushDouble(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    const ani_double values[] = {
        ani_tc_array::ARRAY_PUSH_DOUBLE_FIRST,
        ani_tc_array::ARRAY_PUSH_DOUBLE_SECOND,
        ani_tc_array::ARRAY_PUSH_DOUBLE_THIRD
    };
    for (ani_double value : values) {
        env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxDouble(env, value)));
    }
    return array;
}
ani_int test_ArrayPop(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array = ani_tc_array::ArrayCreateWithInts(env, {
        ani_tc_array::ARRAY_VALUE_HUNDRED,
        ani_tc_array::ARRAY_VALUE_TWO_HUNDRED,
        ani_tc_array::ARRAY_VALUE_THREE_HUNDRED
    });
    ani_ref popped {};
    ani_status status = env->Array_Pop(array, &popped);
    if (!AssertEqMsg(status, ANI_OK, "Array_Pop failed")) {
        return ani_tc_array::ARRAY_ERROR_RETURN;
    }
    ani_int value = 0;
    if (!ani_tc_array::ArrayUnboxInt(env, popped, &value)) {
        return ani_tc_array::ARRAY_ERROR_RETURN;
    }
    ani_size length = 0;
    env->Array_GetLength(array, &length);
    if (length != ani_tc_array::ARRAY_LENGTH_TWO) {
        return ani_tc_array::ARRAY_LENGTH_ERROR_RETURN;
    }
    return value;
}
ani_boolean test_ArrayPopEmptyIsUndefined(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    ani_ref popped {};
    ani_status status = env->Array_Pop(array, &popped);
    if (!AssertEqMsg(status, ANI_OK, "Array_Pop failed")) {
        return ani_tc_array::ARRAY_ERROR_RETURN;
    }
    ani_boolean isUndefined = ANI_FALSE;
    env->Reference_IsUndefined(popped, &isUndefined);
    return isUndefined;
}
ani_array test_ArrayMixedTypes(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    env->Array_Push(array,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_MIXED_INT_VALUE)));
    env->Array_Push(array,
        static_cast<ani_ref>(ani_tc_array::ArrayNewString(env, ani_tc_array::ARRAY_MIXED_STRING)));
    env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxBoolean(env, ANI_TRUE)));
    return array;
}
ani_boolean test_ArrayGetOutOfRangeIsUndefined(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array = ani_tc_array::ArrayCreateWithInts(env, {
        ani_tc_array::ARRAY_VALUE_ONE,
        ani_tc_array::ARRAY_VALUE_TWO
    });
    ani_ref ref {};
    ani_status status = env->Array_Get(array, ani_tc_array::ARRAY_OUT_OF_RANGE_INDEX, &ref);
    if (!AssertEqMsg(status, ANI_OK, "Array_Get out-of-range failed")) {
        return ANI_FALSE;
    }
    ani_boolean isUndefined = ANI_FALSE;
    env->Reference_IsUndefined(ref, &isUndefined);
    return isUndefined;
}
ani_array test_ArraySetOutOfRangeExpand(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    env->Array_Set(array, ani_tc_array::ARRAY_EXPAND_INDEX,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_FIFTY_FIVE)));
    return array;
}
ani_boolean test_ArrayNewWithUndefined(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_LENGTH_FIVE, ani_tc_array::ArrayGetUndefined(env), &array);
    for (ani_size i = 0; i < ani_tc_array::ARRAY_LENGTH_FIVE; i++) {
        ani_ref ref {};
        env->Array_Get(array, i, &ref);
        ani_boolean isUndefined = ANI_FALSE;
        env->Reference_IsUndefined(ref, &isUndefined);
        if (isUndefined != ANI_TRUE) {
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}
ani_double test_ArrayDoublePrecisionSum(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    env->Array_Push(array,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxDouble(env, ani_tc_array::ARRAY_DOUBLE_FIRST)));
    env->Array_Push(array,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxDouble(env, ani_tc_array::ARRAY_DOUBLE_SECOND)));
    env->Array_Push(array,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxDouble(env, ani_tc_array::ARRAY_DOUBLE_THIRD)));
    ani_double sum = 0.0;
    for (ani_size i = 0; i < ani_tc_array::ARRAY_LENGTH_THREE; i++) {
        ani_ref ref {};
        env->Array_Get(array, i, &ref);
        ani_double value = 0.0;
        ani_tc_array::ArrayUnboxDouble(env, ref, &value);
        sum += value;
    }
    return sum;
}
#include "TcArrayTestPart2.h"
#endif
