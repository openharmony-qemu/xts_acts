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

#ifndef ARKTS_ANI_TEST_TC_FIXEDARRAY_TEST_PART2_H
#define ARKTS_ANI_TEST_TC_FIXEDARRAY_TEST_PART2_H
ani_fixedarray_double test_FixedArrayReturnToArkTS(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_THREE, &array)) {
        return nullptr;
    }
    ani_double src[ani_tc_fixedarray::SIZE_THREE] = {
        ani_tc_fixedarray::DOUBLE_ONE,
        ani_tc_fixedarray::DOUBLE_TWO,
        ani_tc_fixedarray::DOUBLE_THREE
    };
    env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_THREE, src);
    return array;
}
ani_double test_FixedArrayReadFromArkTS(ani_env *env, ani_object object, ani_fixedarray_double array)
{
    (void)object;
    ani_double dst[ani_tc_fixedarray::SIZE_THREE] = {};
    if (env->FixedArray_GetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_THREE, dst) != ANI_OK) {
        return -1.0;
    }
    return dst[ani_tc_fixedarray::INDEX_ONE];
}
ani_boolean test_FixedArrayCheckFixedLength(ani_env *env, ani_object object, ani_fixedarray_int array)
{
    (void)object;
    ani_size size = 0;
    if (env->FixedArray_GetLength(static_cast<ani_fixedarray>(array), &size) != ANI_OK) {
        return ANI_FALSE;
    }
    return size == ani_tc_fixedarray::SIZE_THREE ? ANI_TRUE : ANI_FALSE;
}
ani_fixedarray_ref test_FixedArrayObjectRefs(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_ref array {};
    if (!ani_tc_fixedarray::CreateObjectRefArray(env, ani_tc_fixedarray::SIZE_TWO, &array)) {
        return nullptr;
    }
    ani_string str = ani_tc_fixedarray::NewString(env, ani_tc_fixedarray::STR_HELLO);
    ani_object boxedDouble {};
    env->Primitive_Box_Double(ani_tc_fixedarray::DOUBLE_PI, &boxedDouble);
    env->FixedArray_Set_Ref(array, ani_tc_fixedarray::INDEX_ZERO, static_cast<ani_ref>(str));
    env->FixedArray_Set_Ref(array, ani_tc_fixedarray::INDEX_ONE, static_cast<ani_ref>(boxedDouble));
    return array;
}
ani_boolean test_CheckFixedArrayObjectRefs(ani_env *env, ani_object object, ani_fixedarray_ref array)
{
    (void)object;
    ani_ref first {};
    ani_ref second {};
    if (env->FixedArray_Get_Ref(array, ani_tc_fixedarray::INDEX_ZERO, &first) != ANI_OK ||
        env->FixedArray_Get_Ref(array, ani_tc_fixedarray::INDEX_ONE, &second) != ANI_OK) {
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
ani_boolean test_FixedArrayLargeArray(ani_env *env, ani_object object, ani_int length)
{
    (void)object;
    if (length <= 0) {
        return ANI_FALSE;
    }
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, static_cast<ani_size>(length), &array)) {
        return ANI_FALSE;
    }
    std::vector<ani_double> src(static_cast<size_t>(length), ani_tc_fixedarray::DOUBLE_ZERO);
    src[ani_tc_fixedarray::INDEX_ZERO] = ani_tc_fixedarray::DOUBLE_ONE;
    src[static_cast<size_t>(length - 1)] = ani_tc_fixedarray::DOUBLE_TWO;
    if (env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        static_cast<ani_size>(length), src.data()) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double first = ani_tc_fixedarray::DOUBLE_ZERO;
    ani_double last = ani_tc_fixedarray::DOUBLE_ZERO;
    env->FixedArray_GetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_ONE, &first);
    env->FixedArray_GetRegion_Double(array, static_cast<ani_size>(length - 1),
        ani_tc_fixedarray::SIZE_ONE, &last);
    return ani_tc_fixedarray::IsDoubleEqual(first, ani_tc_fixedarray::DOUBLE_ONE) &&
        ani_tc_fixedarray::IsDoubleEqual(last, ani_tc_fixedarray::DOUBLE_TWO) ? ANI_TRUE : ANI_FALSE;
}
ani_array test_FixedArrayCopyToArray(ani_env *env, ani_object object, ani_fixedarray_int fixedArray)
{
    (void)object;
    ani_size size = 0;
    if (env->FixedArray_GetLength(static_cast<ani_fixedarray>(fixedArray), &size) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    ani_array array {};
    if (env->Array_New(size, undefinedRef, &array) != ANI_OK) {
        return nullptr;
    }
    std::vector<ani_int> values(size);
    if (env->FixedArray_GetRegion_Int(fixedArray, ani_tc_fixedarray::INDEX_ZERO,
        size, values.data()) != ANI_OK) {
        return nullptr;
    }
    for (ani_size i = 0; i < size; i++) {
        ani_ref boxed {};
        if (!ani_tc_fixedarray::BoxInt(env, values[i], &boxed)) {
            return nullptr;
        }
        env->Array_Set(array, i, boxed);
    }
    return array;
}
ani_boolean test_FixedArrayGetRegionNullBuffer(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_ONE, &array)) {
        return ANI_FALSE;
    }
    ani_status status = env->FixedArray_GetRegion_Double(
        array, ani_tc_fixedarray::INDEX_ZERO, ani_tc_fixedarray::SIZE_ONE, nullptr);
    std::cout << "FixedArray_GetRegion_Double with nullptr status: " << status << std::endl;
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArraySetRegionNullBuffer(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_ONE, &array)) {
        return ANI_FALSE;
    }
    ani_status status = env->FixedArray_SetRegion_Double(
        array, ani_tc_fixedarray::INDEX_ZERO, ani_tc_fixedarray::SIZE_ONE, nullptr);
    std::cout << "FixedArray_SetRegion_Double with nullptr status: " << status << std::endl;
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayWrongRegionApi(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_TWO, &array)) {
        return ANI_FALSE;
    }
    ani_double src[ani_tc_fixedarray::SIZE_TWO] = {
        ani_tc_fixedarray::DOUBLE_ONE_POINT_TWENTY_FIVE,
        ani_tc_fixedarray::DOUBLE_TWO_POINT_FIVE
    };
    env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TWO, src);
    ani_int dst[ani_tc_fixedarray::SIZE_TWO] = {};
    ani_status status = env->FixedArray_GetRegion_Int(
        reinterpret_cast<ani_fixedarray_int>(array), ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TWO, dst);
    std::cout << "Forced FixedArray_GetRegion_Int on double array status: "
              << status << ", values: " << dst[ani_tc_fixedarray::INDEX_ZERO]
              << ", " << dst[ani_tc_fixedarray::INDEX_ONE] << std::endl;
    return status != ANI_OK || dst[ani_tc_fixedarray::INDEX_ZERO] != ani_tc_fixedarray::INT_ONE ?
        ANI_TRUE : ANI_FALSE;
}
ani_fixedarray_ref test_FixedArrayNested(ani_env *env, ani_object object)
{
    (void)object;
    ani_class intArrayCls {};
    if (env->FindClass(ani_tc_fixedarray::INT_FIXED_ARRAY_CLASS, &intArrayCls) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    ani_fixedarray_ref outer {};
    if (env->FixedArray_New_Ref(static_cast<ani_type>(intArrayCls),
        ani_tc_fixedarray::SIZE_THREE, undefinedRef, &outer) != ANI_OK) {
        return nullptr;
    }
    for (ani_size i = 0; i < ani_tc_fixedarray::SIZE_THREE; i++) {
        ani_fixedarray_int inner {};
        if (!ani_tc_fixedarray::CreateIntArray(env, ani_tc_fixedarray::SIZE_THREE, &inner)) {
            return nullptr;
        }
        ani_int values[ani_tc_fixedarray::SIZE_THREE] = {
            static_cast<ani_int>(i * ani_tc_fixedarray::SIZE_THREE + ani_tc_fixedarray::INT_ONE),
            static_cast<ani_int>(i * ani_tc_fixedarray::SIZE_THREE + ani_tc_fixedarray::INT_TWO),
            static_cast<ani_int>(i * ani_tc_fixedarray::SIZE_THREE + ani_tc_fixedarray::INT_THREE)
        };
        env->FixedArray_SetRegion_Int(inner, ani_tc_fixedarray::INDEX_ZERO,
            ani_tc_fixedarray::SIZE_THREE, values);
        env->FixedArray_Set_Ref(outer, i, static_cast<ani_ref>(inner));
    }
    return outer;
}
ani_boolean test_CheckFixedArrayNested(ani_env *env, ani_object object, ani_fixedarray_ref outer)
{
    (void)object;
    ani_int sum = 0;
    for (ani_size i = 0; i < ani_tc_fixedarray::SIZE_THREE; i++) {
        ani_ref innerRef {};
        if (env->FixedArray_Get_Ref(outer, i, &innerRef) != ANI_OK) {
            return ANI_FALSE;
        }
        ani_int values[ani_tc_fixedarray::SIZE_THREE] = {};
        if (env->FixedArray_GetRegion_Int(static_cast<ani_fixedarray_int>(innerRef),
            ani_tc_fixedarray::INDEX_ZERO, ani_tc_fixedarray::SIZE_THREE, values) != ANI_OK) {
            return ANI_FALSE;
        }
        sum += values[ani_tc_fixedarray::INDEX_ZERO] +
            values[ani_tc_fixedarray::INDEX_ONE] +
            values[ani_tc_fixedarray::INDEX_TWO];
    }
    return sum == ani_tc_fixedarray::NESTED_EXPECT_SUM ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArraySaveLocalRef(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_TWO, &array)) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_fixedarray::SIZE_TWO] = {
        ani_tc_fixedarray::DOUBLE_SEVEN,
        ani_tc_fixedarray::DOUBLE_EIGHT
    };
    env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TWO, values);
    ani_tc_fixedarray::g_fixedArrayLocalRef = array;
    return ANI_TRUE;
}
ani_boolean test_FixedArrayUseSavedLocalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_fixedarray::g_fixedArrayLocalRef == nullptr) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_fixedarray::SIZE_TWO] = {};
    ani_status status = env->FixedArray_GetRegion_Double(
        ani_tc_fixedarray::g_fixedArrayLocalRef, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TWO, values);
    std::cout << "Use saved local FixedArray status: " << status << std::endl;
    bool ok = status == ANI_OK &&
        ani_tc_fixedarray::IsDoubleEqual(values[ani_tc_fixedarray::INDEX_ZERO],
            ani_tc_fixedarray::DOUBLE_SEVEN) &&
        ani_tc_fixedarray::IsDoubleEqual(values[ani_tc_fixedarray::INDEX_ONE],
            ani_tc_fixedarray::DOUBLE_EIGHT);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArraySaveGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_TWO, &array)) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_fixedarray::SIZE_TWO] = {
        ani_tc_fixedarray::DOUBLE_NINE,
        ani_tc_fixedarray::DOUBLE_TEN
    };
    env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TWO, values);
    if (ani_tc_fixedarray::g_fixedArrayGlobalRef != nullptr) {
        env->GlobalReference_Delete(ani_tc_fixedarray::g_fixedArrayGlobalRef);
        ani_tc_fixedarray::g_fixedArrayGlobalRef = nullptr;
    }
    return env->GlobalReference_Create(
        static_cast<ani_ref>(array), &ani_tc_fixedarray::g_fixedArrayGlobalRef) == ANI_OK ?
        ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayUseGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_fixedarray::g_fixedArrayGlobalRef == nullptr) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_fixedarray::SIZE_TWO] = {};
    ani_status status = env->FixedArray_GetRegion_Double(
        static_cast<ani_fixedarray_double>(ani_tc_fixedarray::g_fixedArrayGlobalRef),
        ani_tc_fixedarray::INDEX_ZERO, ani_tc_fixedarray::SIZE_TWO, values);
    bool ok = status == ANI_OK &&
        ani_tc_fixedarray::IsDoubleEqual(values[ani_tc_fixedarray::INDEX_ZERO],
            ani_tc_fixedarray::DOUBLE_NINE) &&
        ani_tc_fixedarray::IsDoubleEqual(values[ani_tc_fixedarray::INDEX_ONE],
            ani_tc_fixedarray::DOUBLE_TEN);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayDeleteGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_fixedarray::g_fixedArrayGlobalRef == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->GlobalReference_Delete(ani_tc_fixedarray::g_fixedArrayGlobalRef);
    ani_tc_fixedarray::g_fixedArrayGlobalRef = nullptr;
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}
#endif
