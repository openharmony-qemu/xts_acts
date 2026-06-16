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

#ifndef ANI_TC_ARRAY_TEST_PART2_H
#define ANI_TC_ARRAY_TEST_PART2_H
ani_boolean test_ArrayModifyIndexOne(ani_env *env, ani_object object, ani_array array)
{
    (void)object;
    ani_status status = env->Array_Set(array, ani_tc_array::ARRAY_OBJECT_INDEX_ONE,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_HUNDRED)));
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref ref {};
    env->Array_Get(array, ani_tc_array::ARRAY_OBJECT_INDEX_ONE, &ref);
    ani_int value = 0;
    return ani_tc_array::ArrayUnboxInt(env, ref, &value) &&
        value == ani_tc_array::ARRAY_VALUE_HUNDRED ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ArrayPushPopMixed(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_ONE)));
    env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_TWO)));
    env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_THREE)));
    ani_ref popped {};
    env->Array_Pop(array, &popped);
    ani_int value = 0;
    if (!ani_tc_array::ArrayUnboxInt(env, popped, &value) ||
        value != ani_tc_array::ARRAY_VALUE_THREE) {
        return ANI_FALSE;
    }
    env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_FOUR)));
    env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_FIVE)));
    env->Array_Pop(array, &popped);
    if (!ani_tc_array::ArrayUnboxInt(env, popped, &value) ||
        value != ani_tc_array::ARRAY_VALUE_FIVE) {
        return ANI_FALSE;
    }
    env->Array_Pop(array, &popped);
    if (!ani_tc_array::ArrayUnboxInt(env, popped, &value) ||
        value != ani_tc_array::ARRAY_VALUE_FOUR) {
        return ANI_FALSE;
    }
    ani_size length = 0;
    env->Array_GetLength(array, &length);
    return length == ani_tc_array::ARRAY_LENGTH_TWO ? ANI_TRUE : ANI_FALSE;
}
ani_int test_ArrayPushMany(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    for (ani_int i = 0; i < count; i++) {
        env->Array_Push(array, static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, i)));
    }
    ani_size length = 0;
    env->Array_GetLength(array, &length);
    return static_cast<ani_int>(length);
}
ani_boolean test_ArrayNewInvalidLength(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    ani_status status = env->Array_New(static_cast<ani_size>(-1),
        ani_tc_array::ArrayGetUndefined(env), &array);
    if (status != ANI_OK) {
        ani_boolean hasError = ANI_FALSE;
        ani_status errorStatus = env->ExistUnhandledError(&hasError);
        if (errorStatus == ANI_OK && hasError == ANI_TRUE) {
            env->DescribeError();
            env->ResetError();
        }
        return ANI_TRUE;
    }
    ani_boolean hasError = ANI_FALSE;
    ani_status errorStatus = env->ExistUnhandledError(&hasError);
    if (errorStatus == ANI_OK && hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_boolean test_ArraySetNonArray(ani_env *env, ani_object object)
{
    ani_status status = env->Array_Set(static_cast<ani_array>(object), 0,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_ONE)));
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ArrayGetNonArray(ani_env *env, ani_object object)
{
    ani_ref ref {};
    ani_status status = env->Array_Get(static_cast<ani_array>(object), 0, &ref);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ArrayNullAndUndefined(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    env->Array_Push(array, ani_tc_array::ArrayGetNull(env));
    env->Array_Push(array, ani_tc_array::ArrayGetUndefined(env));
    env->Array_Push(array,
        static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, ani_tc_array::ARRAY_VALUE_SEVEN)));
    ani_ref ref0 {};
    ani_ref ref1 {};
    env->Array_Get(array, ani_tc_array::ARRAY_OBJECT_INDEX_ZERO, &ref0);
    env->Array_Get(array, ani_tc_array::ARRAY_OBJECT_INDEX_ONE, &ref1);
    ani_boolean isNull = ANI_FALSE;
    ani_boolean isUndefined = ANI_FALSE;
    env->Reference_IsNull(ref0, &isNull);
    env->Reference_IsUndefined(ref1, &isUndefined);
    return isNull == ANI_TRUE && isUndefined == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}
ani_int test_ArrayTraverseSum(ani_env *env, ani_object object)
{
    (void)object;
    ani_array array = ani_tc_array::ArrayCreateWithInts(env, {
        ani_tc_array::ARRAY_VALUE_ONE,
        ani_tc_array::ARRAY_VALUE_TWO,
        ani_tc_array::ARRAY_VALUE_THREE,
        ani_tc_array::ARRAY_VALUE_FOUR,
        ani_tc_array::ARRAY_VALUE_FIVE,
        6,
        ani_tc_array::ARRAY_VALUE_SEVEN,
        8,
        9,
        ani_tc_array::ARRAY_VALUE_TEN
    });
    ani_size length = 0;
    env->Array_GetLength(array, &length);
    ani_int sum = 0;
    for (ani_size i = 0; i < length; i++) {
        ani_ref ref {};
        env->Array_Get(array, i, &ref);
        ani_int value = 0;
        ani_tc_array::ArrayUnboxInt(env, ref, &value);
        sum += value;
    }
    return sum;
}
ani_array test_ArrayObjectElement(ani_env *env, ani_object object)
{
    (void)object;
    ani_class pointCls {};
    ani_status status = env->FindClass(ani_tc_array::ARRAY_POINT_CLASS, &pointCls);
    if (!AssertEqMsg(status, ANI_OK, "Find ArrayPoint failed")) {
        return nullptr;
    }
    ani_method ctor {};
    status = env->Class_FindMethod(pointCls, "<ctor>", "i:", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Find ArrayPoint constructor failed")) {
        return nullptr;
    }
    ani_object point {};
    status = env->Object_New(pointCls, ctor, &point, ani_tc_array::ARRAY_VALUE_TEN);
    if (!AssertEqMsg(status, ANI_OK, "Create ArrayPoint failed")) {
        return nullptr;
    }
    ani_array array {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &array);
    env->Array_Push(array, static_cast<ani_ref>(point));
    return array;
}
ani_boolean test_ArrayCheckObjectElement(ani_env *env, ani_object object, ani_array array)
{
    (void)object;
    ani_ref ref {};
    ani_status status = env->Array_Get(array, ani_tc_array::ARRAY_OBJECT_INDEX_ZERO, &ref);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object point = static_cast<ani_object>(ref);
    status = env->Object_SetFieldByName_Int(point, "x", ani_tc_array::ARRAY_VALUE_NINETY_NINE);
    if (!AssertEqMsg(status, ANI_OK, "Object_SetFieldByName_Int failed")) {
        return ANI_FALSE;
    }
    ani_int value = 0;
    status = env->Object_GetFieldByName_Int(point, "x", &value);
    if (!AssertEqMsg(status, ANI_OK, "Object_GetFieldByName_Int failed")) {
        return ANI_FALSE;
    }
    return value == ani_tc_array::ARRAY_VALUE_NINETY_NINE ? ANI_TRUE : ANI_FALSE;
}
ani_array test_ArrayCreateMatrix(ani_env *env, ani_object object)
{
    (void)object;
    ani_array outer {};
    env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &outer);
    for (ani_int row = 0; row < static_cast<ani_int>(ani_tc_array::ARRAY_MATRIX_ROWS); row++) {
        ani_array inner {};
        env->Array_New(ani_tc_array::ARRAY_EMPTY_LENGTH, ani_tc_array::ArrayGetUndefined(env), &inner);
        for (ani_int col = 0; col < static_cast<ani_int>(ani_tc_array::ARRAY_MATRIX_COLS); col++) {
            ani_int value = row * ani_tc_array::ARRAY_MATRIX_ROW_FACTOR + col;
            env->Array_Push(inner, static_cast<ani_ref>(ani_tc_array::ArrayBoxInt(env, value)));
        }
        env->Array_Push(outer, static_cast<ani_ref>(inner));
    }
    return outer;
}
ani_boolean test_ArrayCheckMatrix(ani_env *env, ani_object object, ani_array matrix)
{
    (void)object;
    ani_ref row0Ref {};
    ani_status status = env->Array_Get(matrix, ani_tc_array::ARRAY_OBJECT_INDEX_ZERO, &row0Ref);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_array row0 = static_cast<ani_array>(row0Ref);
    ani_ref valueRef {};
    status = env->Array_Get(row0, ani_tc_array::ARRAY_OBJECT_INDEX_ONE, &valueRef);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int value = 0;
    if (!ani_tc_array::ArrayUnboxInt(env, valueRef, &value)) {
        return ANI_FALSE;
    }
    return value == ani_tc_array::ARRAY_VALUE_ONE ? ANI_TRUE : ANI_FALSE;
}
#endif
