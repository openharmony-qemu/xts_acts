/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_TC_VALUEARRAY_TEST_PART2_H
#define ARKTS_ANI_TEST_TC_VALUEARRAY_TEST_PART2_H
ani_valuearray_double test_ValueArrayReturnToArkTS(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_THREE, &array)) {
        return nullptr;
    }
    ani_double src[ani_tc_valuearray::SIZE_THREE] = {
        ani_tc_valuearray::DOUBLE_ONE,
        ani_tc_valuearray::DOUBLE_TWO,
        ani_tc_valuearray::DOUBLE_THREE
    };
    env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_THREE, src);
    return array;
}
ani_double test_ValueArrayReadFromArkTS(ani_env *env, ani_object object, ani_valuearray_double array)
{
    (void)object;
    ani_double dst[ani_tc_valuearray::SIZE_THREE] = {};
    if (env->ValueArray_GetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_THREE, dst) != ANI_OK) {
        return -1.0;
    }
    return dst[ani_tc_valuearray::INDEX_ONE];
}
ani_boolean test_ValueArrayCheckFixedLength(ani_env *env, ani_object object, ani_valuearray_int array)
{
    (void)object;
    ani_size size = 0;
    if (env->ValueArray_GetLength(array, &size) != ANI_OK) {
        return ANI_FALSE;
    }
    return size == ani_tc_valuearray::SIZE_THREE ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayLargeArray(ani_env *env, ani_object object, ani_int length)
{
    (void)object;
    if (length <= 0) {
        return ANI_FALSE;
    }
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, static_cast<ani_size>(length), &array)) {
        return ANI_FALSE;
    }
    std::vector<ani_double> src(static_cast<size_t>(length), ani_tc_valuearray::DOUBLE_ZERO);
    src[ani_tc_valuearray::INDEX_ZERO] = ani_tc_valuearray::DOUBLE_ONE;
    src[static_cast<size_t>(length - 1)] = ani_tc_valuearray::DOUBLE_TWO;
    if (env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        static_cast<ani_size>(length), src.data()) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double first = ani_tc_valuearray::DOUBLE_ZERO;
    ani_double last = ani_tc_valuearray::DOUBLE_ZERO;
    env->ValueArray_GetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_ONE, &first);
    env->ValueArray_GetRegion_Double(array, static_cast<ani_size>(length - 1),
        ani_tc_valuearray::SIZE_ONE, &last);
    return ani_tc_valuearray::IsDoubleEqual(first, ani_tc_valuearray::DOUBLE_ONE) &&
        ani_tc_valuearray::IsDoubleEqual(last, ani_tc_valuearray::DOUBLE_TWO) ? ANI_TRUE : ANI_FALSE;
}
ani_array test_ValueArrayCopyToArray(ani_env *env, ani_object object, ani_valuearray_int valueArray)
{
    (void)object;
    ani_size size = 0;
    if (env->ValueArray_GetLength(valueArray, &size) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    ani_array array {};
    if (env->Array_New(size, undefinedRef, &array) != ANI_OK) {
        return nullptr;
    }
    std::vector<ani_int> values(size);
    if (env->ValueArray_GetRegion_Int(valueArray, ani_tc_valuearray::INDEX_ZERO,
        size, values.data()) != ANI_OK) {
        return nullptr;
    }
    for (ani_size i = 0; i < size; i++) {
        ani_ref boxed {};
        if (!ani_tc_valuearray::BoxInt(env, values[i], &boxed)) {
            return nullptr;
        }
        env->Array_Set(array, i, boxed);
    }
    return array;
}
ani_boolean test_ValueArrayGetRegionNullBuffer(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_ONE, &array)) {
        return ANI_FALSE;
    }
    ani_status status = env->ValueArray_GetRegion_Double(
        array, ani_tc_valuearray::INDEX_ZERO, ani_tc_valuearray::SIZE_ONE, nullptr);
    std::cout << "ValueArray_GetRegion_Double with nullptr status: " << status << std::endl;
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArraySetRegionNullBuffer(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_ONE, &array)) {
        return ANI_FALSE;
    }
    ani_status status = env->ValueArray_SetRegion_Double(
        array, ani_tc_valuearray::INDEX_ZERO, ani_tc_valuearray::SIZE_ONE, nullptr);
    std::cout << "ValueArray_SetRegion_Double with nullptr status: " << status << std::endl;
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayWrongRegionApi(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_TWO, &array)) {
        return ANI_FALSE;
    }
    ani_double src[ani_tc_valuearray::SIZE_TWO] = {
        ani_tc_valuearray::DOUBLE_ONE_POINT_TWENTY_FIVE,
        ani_tc_valuearray::DOUBLE_TWO_POINT_FIVE
    };
    env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TWO, src);
    ani_int dst[ani_tc_valuearray::SIZE_TWO] = {};
    ani_status status = env->ValueArray_GetRegion_Int(
        reinterpret_cast<ani_valuearray_int>(array), ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TWO, dst);
    std::cout << "Forced ValueArray_GetRegion_Int on double array status: "
              << status << ", values: " << dst[ani_tc_valuearray::INDEX_ZERO]
              << ", " << dst[ani_tc_valuearray::INDEX_ONE] << std::endl;
    return status != ANI_OK || dst[ani_tc_valuearray::INDEX_ZERO] != ani_tc_valuearray::INT_ONE ?
        ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArraySaveLocalRef(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_TWO, &array)) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_valuearray::SIZE_TWO] = {
        ani_tc_valuearray::DOUBLE_SEVEN,
        ani_tc_valuearray::DOUBLE_EIGHT
    };
    env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TWO, values);
    ani_tc_valuearray::g_valueArrayLocalRef = array;
    return ANI_TRUE;
}
ani_boolean test_ValueArrayUseSavedLocalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_valuearray::g_valueArrayLocalRef == nullptr) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_valuearray::SIZE_TWO] = {};
    ani_status status = env->ValueArray_GetRegion_Double(
        ani_tc_valuearray::g_valueArrayLocalRef, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TWO, values);
    std::cout << "Use saved local ValueArray status: " << status << std::endl;
    bool ok = status == ANI_OK &&
        ani_tc_valuearray::IsDoubleEqual(values[ani_tc_valuearray::INDEX_ZERO],
            ani_tc_valuearray::DOUBLE_SEVEN) &&
        ani_tc_valuearray::IsDoubleEqual(values[ani_tc_valuearray::INDEX_ONE],
            ani_tc_valuearray::DOUBLE_EIGHT);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArraySaveGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_TWO, &array)) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_valuearray::SIZE_TWO] = {
        ani_tc_valuearray::DOUBLE_NINE,
        ani_tc_valuearray::DOUBLE_TEN
    };
    env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TWO, values);
    if (ani_tc_valuearray::g_valueArrayGlobalRef != nullptr) {
        env->GlobalReference_Delete(ani_tc_valuearray::g_valueArrayGlobalRef);
        ani_tc_valuearray::g_valueArrayGlobalRef = nullptr;
    }
    return env->GlobalReference_Create(
        static_cast<ani_ref>(array), &ani_tc_valuearray::g_valueArrayGlobalRef) == ANI_OK ?
        ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayUseGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_valuearray::g_valueArrayGlobalRef == nullptr) {
        return ANI_FALSE;
    }
    ani_double values[ani_tc_valuearray::SIZE_TWO] = {};
    ani_status status = env->ValueArray_GetRegion_Double(
        static_cast<ani_valuearray_double>(ani_tc_valuearray::g_valueArrayGlobalRef),
        ani_tc_valuearray::INDEX_ZERO, ani_tc_valuearray::SIZE_TWO, values);
    bool ok = status == ANI_OK &&
        ani_tc_valuearray::IsDoubleEqual(values[ani_tc_valuearray::INDEX_ZERO],
            ani_tc_valuearray::DOUBLE_NINE) &&
        ani_tc_valuearray::IsDoubleEqual(values[ani_tc_valuearray::INDEX_ONE],
            ani_tc_valuearray::DOUBLE_TEN);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayDeleteGlobalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (ani_tc_valuearray::g_valueArrayGlobalRef == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->GlobalReference_Delete(ani_tc_valuearray::g_valueArrayGlobalRef);
    ani_tc_valuearray::g_valueArrayGlobalRef = nullptr;
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}
#endif
