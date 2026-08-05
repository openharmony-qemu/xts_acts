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

#ifndef ARKTS_ANI_TEST_TC_VALUEARRAY_TEST_H
#define ARKTS_ANI_TEST_TC_VALUEARRAY_TEST_H
#include "Common.h"
#include <cmath>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_valuearray {
constexpr double DOUBLE_EPSILON = 0.000001;
constexpr ani_size SIZE_ONE = 1;
constexpr ani_size SIZE_TWO = 2;
constexpr ani_size SIZE_THREE = 3;
constexpr ani_size SIZE_FIVE = 5;
constexpr ani_size SIZE_SEVEN = 7;
constexpr ani_size SIZE_TEN = 10;
constexpr ani_size INDEX_ZERO = 0;
constexpr ani_size INDEX_ONE = 1;
constexpr ani_size INDEX_TWO = 2;
constexpr ani_size INDEX_THREE = 3;
constexpr ani_size INDEX_FOUR = 4;
constexpr ani_size INDEX_FIVE = 5;
constexpr ani_size INDEX_NINE = 9;
constexpr ani_int INT_ONE = 1;
constexpr ani_int INT_TWO = 2;
constexpr ani_int INT_THREE = 3;
constexpr ani_int INT_TEN = 10;
constexpr ani_int INT_TWENTY = 20;
constexpr ani_int INT_THIRTY = 30;
constexpr ani_double DOUBLE_ZERO = 0.0;
constexpr ani_double DOUBLE_ONE = 1.0;
constexpr ani_double DOUBLE_TWO = 2.0;
constexpr ani_double DOUBLE_THREE = 3.0;
constexpr ani_double DOUBLE_FOUR = 4.0;
constexpr ani_double DOUBLE_FIVE = 5.0;
constexpr ani_double DOUBLE_SIX = 6.0;
constexpr ani_double DOUBLE_SEVEN = 7.0;
constexpr ani_double DOUBLE_EIGHT = 8.0;
constexpr ani_double DOUBLE_NINE = 9.0;
constexpr ani_double DOUBLE_TEN = 10.0;
constexpr ani_double DOUBLE_ONE_POINT_ONE = 1.1;
constexpr ani_double DOUBLE_TWO_POINT_TWO = 2.2;
constexpr ani_double DOUBLE_THREE_POINT_THREE = 3.3;
constexpr ani_double DOUBLE_FOUR_POINT_FOUR = 4.4;
constexpr ani_double DOUBLE_FIVE_POINT_FIVE = 5.5;
constexpr ani_double DOUBLE_ONE_POINT_TWENTY_FIVE = 1.25;
constexpr ani_double DOUBLE_TWO_POINT_FIVE = 2.5;
constexpr ani_double DOUBLE_HUNDRED = 100.0;
constexpr ani_double DOUBLE_TWO_HUNDRED = 200.0;
constexpr ani_double DOUBLE_THREE_HUNDRED = 300.0;

inline bool IsDoubleEqual(double left, double right)
{
    return std::fabs(left - right) < DOUBLE_EPSILON;
}

inline bool BoxInt(ani_env *env, ani_int value, ani_ref *result)
{
    ani_object boxed {};
    if (env->Primitive_Box_Int(value, &boxed) != ANI_OK) {
        return false;
    }
    *result = static_cast<ani_ref>(boxed);
    return true;
}

inline bool CreateIntArray(ani_env *env, ani_size size, ani_valuearray_int *array)
{
    return env->ValueArray_New_Int(size, array) == ANI_OK && *array != nullptr;
}

inline ani_ref g_valueArrayGlobalRef = nullptr;
inline ani_valuearray_double g_valueArrayLocalRef = nullptr;
inline bool CreateDoubleArray(ani_env *env, ani_size size, ani_valuearray_double *array)
{
    return env->ValueArray_New_Double(size, array) == ANI_OK && *array != nullptr;
}
inline bool ReadDoubleRegion(ani_env *env, ani_valuearray_double array, ani_size size,
    std::vector<ani_double> *out)
{
    out->assign(size, DOUBLE_ZERO);
    return env->ValueArray_GetRegion_Double(array, INDEX_ZERO, size, out->data()) == ANI_OK;
}
inline bool CheckDoubleVector(const std::vector<ani_double> &actual,
    const std::vector<ani_double> &expected)
{
    if (actual.size() != expected.size()) {
        return false;
    }
    for (size_t i = 0; i < actual.size(); i++) {
        if (!IsDoubleEqual(actual[i], expected[i])) {
            return false;
        }
    }
    return true;
}
inline bool CreateDifferentTypePrimitiveArrays(ani_env *env, ani_valuearray_int *intArray,
    ani_valuearray_boolean *boolArray)
{
    if (!CreateIntArray(env, SIZE_THREE, intArray)) {
        return false;
    }
    return env->ValueArray_New_Boolean(SIZE_THREE, boolArray) == ANI_OK && *boolArray != nullptr;
}
inline bool FillDifferentTypePrimitiveArrays(ani_env *env, ani_valuearray_int intArray,
    ani_valuearray_boolean boolArray)
{
    ani_int ints[SIZE_THREE] = {
        INT_TEN,
        INT_TWENTY,
        INT_THIRTY
    };
    ani_boolean bools[SIZE_THREE] = {ANI_TRUE, ANI_FALSE, ANI_TRUE};
    return env->ValueArray_SetRegion_Int(intArray, INDEX_ZERO, SIZE_THREE, ints) == ANI_OK &&
        env->ValueArray_SetRegion_Boolean(boolArray, INDEX_ZERO, SIZE_THREE, bools) == ANI_OK;
}
inline bool CheckDifferentTypePrimitiveArrays(ani_env *env, ani_valuearray_int intArray,
    ani_valuearray_boolean boolArray)
{
    ani_int readInts[SIZE_THREE] = {};
    ani_boolean readBools[SIZE_THREE] = {};
    if (env->ValueArray_GetRegion_Int(intArray, INDEX_ZERO, SIZE_THREE, readInts) != ANI_OK ||
        env->ValueArray_GetRegion_Boolean(boolArray, INDEX_ZERO, SIZE_THREE, readBools) != ANI_OK) {
        return false;
    }
    return readInts[INDEX_ZERO] == INT_TEN && readInts[INDEX_ONE] == INT_TWENTY && readInts[INDEX_TWO] == INT_THIRTY &&
        readBools[INDEX_ZERO] == ANI_TRUE && readBools[INDEX_ONE] == ANI_FALSE;
}
}
ani_boolean test_ValueArrayDifferentTypes(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_int intArray {};
    ani_valuearray_boolean boolArray {};
    if (!ani_tc_valuearray::CreateDifferentTypePrimitiveArrays(env, &intArray, &boolArray)) {
        return ANI_FALSE;
    }
    if (!ani_tc_valuearray::FillDifferentTypePrimitiveArrays(env, intArray, boolArray)) {
        return ANI_FALSE;
    }
    return ani_tc_valuearray::CheckDifferentTypePrimitiveArrays(env, intArray, boolArray) ? ANI_TRUE : ANI_FALSE;
}
ani_valuearray_double test_ValueArrayDoubleRegion(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_FIVE, &array)) {
        return nullptr;
    }
    std::vector<ani_double> src = {
        ani_tc_valuearray::DOUBLE_ONE_POINT_ONE,
        ani_tc_valuearray::DOUBLE_TWO_POINT_TWO,
        ani_tc_valuearray::DOUBLE_THREE_POINT_THREE,
        ani_tc_valuearray::DOUBLE_FOUR_POINT_FOUR,
        ani_tc_valuearray::DOUBLE_FIVE_POINT_FIVE
    };
    ani_status status = env->ValueArray_SetRegion_Double(
        array, ani_tc_valuearray::INDEX_ZERO, src.size(), src.data());
    std::cout << "ValueArray_SetRegion_Double status: " << status << std::endl;
    std::vector<ani_double> dst;
    if (ani_tc_valuearray::ReadDoubleRegion(env, array, ani_tc_valuearray::SIZE_FIVE, &dst)) {
        std::cout << "ValueArray_GetRegion_Double status: " << ANI_OK << std::endl;
    }
    return array;
}
ani_boolean test_CheckValueArrayDoubleRegion(ani_env *env, ani_object object, ani_valuearray_double array)
{
    (void)object;
    std::vector<ani_double> dst;
    if (!ani_tc_valuearray::ReadDoubleRegion(env, array, ani_tc_valuearray::SIZE_FIVE, &dst)) {
        return ANI_FALSE;
    }
    std::vector<ani_double> expected = {
        ani_tc_valuearray::DOUBLE_ONE_POINT_ONE,
        ani_tc_valuearray::DOUBLE_TWO_POINT_TWO,
        ani_tc_valuearray::DOUBLE_THREE_POINT_THREE,
        ani_tc_valuearray::DOUBLE_FOUR_POINT_FOUR,
        ani_tc_valuearray::DOUBLE_FIVE_POINT_FIVE
    };
    return ani_tc_valuearray::CheckDoubleVector(dst, expected) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayTypeMismatch(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_int intArray {};
    if (!ani_tc_valuearray::CreateIntArray(env, ani_tc_valuearray::SIZE_TWO, &intArray)) {
        return ANI_FALSE;
    }
    ani_int original[ani_tc_valuearray::SIZE_TWO] = {
        ani_tc_valuearray::INT_ONE,
        ani_tc_valuearray::INT_TWO
    };
    if (env->ValueArray_SetRegion_Int(intArray, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TWO, original) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double wrongSrc[ani_tc_valuearray::SIZE_TWO] = {
        ani_tc_valuearray::DOUBLE_ONE_POINT_TWENTY_FIVE,
        ani_tc_valuearray::DOUBLE_TWO_POINT_FIVE
    };
    ani_status wrongStatus = env->ValueArray_SetRegion_Double(
        reinterpret_cast<ani_valuearray_double>(intArray), ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TWO, wrongSrc);
    std::cout << "Forced mismatched ValueArray_SetRegion_Double status: "
              << wrongStatus << std::endl;
    if (wrongStatus != ANI_OK) {
        return ANI_TRUE;
    }
    ani_int after[ani_tc_valuearray::SIZE_TWO] = {};
    ani_status readStatus = env->ValueArray_GetRegion_Int(
        intArray, ani_tc_valuearray::INDEX_ZERO, ani_tc_valuearray::SIZE_TWO, after);
    std::cout << "Read ValueArray<int> after mismatched double write status: "
              << readStatus << ", values: " << after[ani_tc_valuearray::INDEX_ZERO]
              << ", " << after[ani_tc_valuearray::INDEX_ONE] << std::endl;
    if (readStatus != ANI_OK) {
        return ANI_TRUE;
    }
    return (after[ani_tc_valuearray::INDEX_ZERO] != original[ani_tc_valuearray::INDEX_ZERO] ||
        after[ani_tc_valuearray::INDEX_ONE] != original[ani_tc_valuearray::INDEX_ONE]) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayGetPartialRegion(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_TEN, &array)) {
        return ANI_FALSE;
    }
    ani_double src[ani_tc_valuearray::SIZE_TEN] = {};
    for (ani_size i = 0; i < ani_tc_valuearray::SIZE_TEN; i++) {
        src[i] = static_cast<ani_double>(i);
    }
    ani_double dst[ani_tc_valuearray::SIZE_FIVE] = {};
    if (env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TEN, src) != ANI_OK ||
        env->ValueArray_GetRegion_Double(array, ani_tc_valuearray::INDEX_TWO,
        ani_tc_valuearray::SIZE_FIVE, dst) != ANI_OK) {
        return ANI_FALSE;
    }
    bool ok = ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_ZERO],
        ani_tc_valuearray::DOUBLE_TWO) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_ONE],
        ani_tc_valuearray::DOUBLE_THREE) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_TWO],
        ani_tc_valuearray::DOUBLE_FOUR) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_THREE],
        ani_tc_valuearray::DOUBLE_FIVE) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_FOUR],
        ani_tc_valuearray::DOUBLE_SIX);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArraySetPartialRegion(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_TEN, &array)) {
        return ANI_FALSE;
    }
    ani_double zeros[ani_tc_valuearray::SIZE_TEN] = {};
    ani_double src[ani_tc_valuearray::SIZE_THREE] = {
        ani_tc_valuearray::DOUBLE_HUNDRED,
        ani_tc_valuearray::DOUBLE_TWO_HUNDRED,
        ani_tc_valuearray::DOUBLE_THREE_HUNDRED
    };
    if (env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TEN, zeros) != ANI_OK ||
        env->ValueArray_SetRegion_Double(array, ani_tc_valuearray::INDEX_THREE,
        ani_tc_valuearray::SIZE_THREE, src) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double dst[ani_tc_valuearray::SIZE_TEN] = {};
    if (env->ValueArray_GetRegion_Double(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_TEN, dst) != ANI_OK) {
        return ANI_FALSE;
    }
    bool ok = ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_ZERO],
        ani_tc_valuearray::DOUBLE_ZERO) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_TWO],
        ani_tc_valuearray::DOUBLE_ZERO) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_THREE],
        ani_tc_valuearray::DOUBLE_HUNDRED) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_FOUR],
        ani_tc_valuearray::DOUBLE_TWO_HUNDRED) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_FIVE],
        ani_tc_valuearray::DOUBLE_THREE_HUNDRED) &&
        ani_tc_valuearray::IsDoubleEqual(dst[ani_tc_valuearray::INDEX_NINE],
        ani_tc_valuearray::DOUBLE_ZERO);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayRegionOutOfRange(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_int array {};
    if (!ani_tc_valuearray::CreateIntArray(env, ani_tc_valuearray::SIZE_FIVE, &array)) {
        return ANI_FALSE;
    }
    ani_int buffer[ani_tc_valuearray::SIZE_THREE] = {};
    ani_status getStatus = env->ValueArray_GetRegion_Int(
        array, ani_tc_valuearray::INDEX_THREE, ani_tc_valuearray::SIZE_THREE, buffer);
    ani_int src[ani_tc_valuearray::SIZE_TWO] = {
        ani_tc_valuearray::INT_ONE,
        ani_tc_valuearray::INT_TWO
    };
    ani_status setStatus = env->ValueArray_SetRegion_Int(
        array, ani_tc_valuearray::INDEX_FOUR, ani_tc_valuearray::SIZE_TWO, src);
    std::cout << "Get out-of-range status: " << getStatus << std::endl;
    std::cout << "Set out-of-range status: " << setStatus << std::endl;
    return getStatus != ANI_OK && setStatus != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ValueArrayInvalidLength(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double zeroArray {};
    ani_status zeroStatus = env->ValueArray_New_Double(0, &zeroArray);
    ani_valuearray_double negativeArray {};
    ani_status negativeStatus = env->ValueArray_New_Double(static_cast<ani_size>(-1), &negativeArray);
    std::cout << "ValueArray_New_Double(0) status: " << zeroStatus << std::endl;
    std::cout << "ValueArray_New_Double(-1 as ani_size) status: "
              << negativeStatus << std::endl;
    return zeroStatus == ANI_OK && negativeStatus != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_int test_ValueArrayGetSize(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_double array {};
    if (!ani_tc_valuearray::CreateDoubleArray(env, ani_tc_valuearray::SIZE_SEVEN, &array)) {
        return -1;
    }
    ani_size size = 0;
    if (env->ValueArray_GetLength(array, &size) != ANI_OK) {
        return -1;
    }
    return static_cast<ani_int>(size);
}
ani_boolean test_ValueArrayElementAccess(ani_env *env, ani_object object)
{
    (void)object;
    ani_valuearray_int array {};
    if (!ani_tc_valuearray::CreateIntArray(env, ani_tc_valuearray::SIZE_THREE, &array)) {
        return ANI_FALSE;
    }
    ani_int first = ani_tc_valuearray::INT_TEN;
    ani_int second = ani_tc_valuearray::INT_TWENTY;
    ani_int third = ani_tc_valuearray::INT_THIRTY;
    if (env->ValueArray_SetRegion_Int(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_ONE, &first) != ANI_OK ||
        env->ValueArray_SetRegion_Int(array, ani_tc_valuearray::INDEX_ONE,
        ani_tc_valuearray::SIZE_ONE, &second) != ANI_OK ||
        env->ValueArray_SetRegion_Int(array, ani_tc_valuearray::INDEX_TWO,
        ani_tc_valuearray::SIZE_ONE, &third) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int result0 = 0;
    ani_int result1 = 0;
    ani_int result2 = 0;
    if (env->ValueArray_GetRegion_Int(array, ani_tc_valuearray::INDEX_ZERO,
        ani_tc_valuearray::SIZE_ONE, &result0) != ANI_OK ||
        env->ValueArray_GetRegion_Int(array, ani_tc_valuearray::INDEX_ONE,
        ani_tc_valuearray::SIZE_ONE, &result1) != ANI_OK ||
        env->ValueArray_GetRegion_Int(array, ani_tc_valuearray::INDEX_TWO,
        ani_tc_valuearray::SIZE_ONE, &result2) != ANI_OK) {
        return ANI_FALSE;
    }
    return result0 == ani_tc_valuearray::INT_TEN &&
        result1 == ani_tc_valuearray::INT_TWENTY &&
        result2 == ani_tc_valuearray::INT_THIRTY ? ANI_TRUE : ANI_FALSE;
}
#include "TcValueArrayTestPart2.h"
#endif
