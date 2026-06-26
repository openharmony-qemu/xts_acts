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

#ifndef ARKTS_ANI_TEST_TC_FIXEDARRAY_TEST_H
#define ARKTS_ANI_TEST_TC_FIXEDARRAY_TEST_H
#include "Common.h"
#include <cmath>
#include <cstdint>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_fixedarray {
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
constexpr ani_int NESTED_EXPECT_SUM = 45;
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
constexpr ani_double DOUBLE_PI = 3.14;
constexpr ani_double DOUBLE_HUNDRED = 100.0;
constexpr ani_double DOUBLE_TWO_HUNDRED = 200.0;
constexpr ani_double DOUBLE_THREE_HUNDRED = 300.0;
constexpr const char *STRING_CLASS = "std.core.String";
constexpr const char *OBJECT_CLASS = "std.core.Object";
constexpr const char *INT_FIXED_ARRAY_CLASS = "A{i}";
constexpr const char *STR_ONE = "one";
constexpr const char *STR_TWO = "two";
constexpr const char *STR_THREE = "three";
constexpr const char *STR_FIRST = "first";
constexpr const char *STR_SECOND = "second";
constexpr const char *STR_HELLO = "hello";
inline ani_ref g_fixedArrayGlobalRef = nullptr;
inline ani_fixedarray_double g_fixedArrayLocalRef = nullptr;
inline bool IsDoubleEqual(double left, double right)
{
    return std::fabs(left - right) < DOUBLE_EPSILON;
}
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
inline bool BoxInt(ani_env *env, ani_int value, ani_ref *result)
{
    ani_object boxed {};
    if (env->Primitive_Box_Int(value, &boxed) != ANI_OK) {
        return false;
    }
    *result = static_cast<ani_ref>(boxed);
    return true;
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
inline bool CreateDoubleArray(ani_env *env, ani_size size, ani_fixedarray_double *array)
{
    return env->FixedArray_New_Double(size, array) == ANI_OK && *array != nullptr;
}
inline bool CreateIntArray(ani_env *env, ani_size size, ani_fixedarray_int *array)
{
    return env->FixedArray_New_Int(size, array) == ANI_OK && *array != nullptr;
}
inline bool ReadDoubleRegion(ani_env *env, ani_fixedarray_double array, ani_size size,
    std::vector<ani_double> *out)
{
    out->assign(size, DOUBLE_ZERO);
    return env->FixedArray_GetRegion_Double(array, INDEX_ZERO, size, out->data()) == ANI_OK;
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
inline bool CreateStringRefArray(ani_env *env, ani_size size, ani_fixedarray_ref *array)
{
    ani_class stringCls {};
    if (env->FindClass(STRING_CLASS, &stringCls) != ANI_OK) {
        return false;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    return env->FixedArray_New_Ref(static_cast<ani_type>(stringCls), size, undefinedRef, array) == ANI_OK;
}
inline bool CreateObjectRefArray(ani_env *env, ani_size size, ani_fixedarray_ref *array)
{
    ani_class objectCls {};
    if (env->FindClass(OBJECT_CLASS, &objectCls) != ANI_OK) {
        return false;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    return env->FixedArray_New_Ref(static_cast<ani_type>(objectCls), size, undefinedRef, array) == ANI_OK;
}
inline bool CreateDifferentTypeArrays(ani_env *env, ani_fixedarray_int *intArray,
    ani_fixedarray_boolean *boolArray, ani_fixedarray_ref *stringArray)
{
    if (!CreateIntArray(env, SIZE_THREE, intArray)) {
        return false;
    }
    if (env->FixedArray_New_Boolean(SIZE_THREE, boolArray) != ANI_OK) {
        return false;
    }
    return CreateStringRefArray(env, SIZE_THREE, stringArray);
}
inline bool FillDifferentTypePrimitiveArrays(ani_env *env, ani_fixedarray_int intArray,
    ani_fixedarray_boolean boolArray)
{
    ani_int ints[SIZE_THREE] = {
        INT_TEN,
        INT_TWENTY,
        INT_THIRTY
    };
    ani_boolean bools[SIZE_THREE] = {ANI_TRUE, ANI_FALSE, ANI_TRUE};
    return env->FixedArray_SetRegion_Int(intArray, INDEX_ZERO, SIZE_THREE, ints) == ANI_OK &&
        env->FixedArray_SetRegion_Boolean(boolArray, INDEX_ZERO, SIZE_THREE, bools) == ANI_OK;
}
inline bool FillDifferentTypeStringArray(ani_env *env, ani_fixedarray_ref stringArray)
{
    ani_string s1 = NewString(env, STR_ONE);
    ani_string s2 = NewString(env, STR_TWO);
    ani_string s3 = NewString(env, STR_THREE);
    if (s1 == nullptr || s2 == nullptr || s3 == nullptr) {
        return false;
    }
    return env->FixedArray_Set_Ref(stringArray, INDEX_ZERO, static_cast<ani_ref>(s1)) == ANI_OK &&
        env->FixedArray_Set_Ref(stringArray, INDEX_ONE, static_cast<ani_ref>(s2)) == ANI_OK &&
        env->FixedArray_Set_Ref(stringArray, INDEX_TWO, static_cast<ani_ref>(s3)) == ANI_OK;
}
bool CheckDifferentTypePrimitiveArrays(ani_env *env, ani_fixedarray_int intArray,
    ani_fixedarray_boolean boolArray)
{
    ani_int readInts[SIZE_THREE] = {};
    ani_boolean readBools[SIZE_THREE] = {};
    if (env->FixedArray_GetRegion_Int(intArray, INDEX_ZERO, SIZE_THREE, readInts) != ANI_OK ||
        env->FixedArray_GetRegion_Boolean(boolArray, INDEX_ZERO, SIZE_THREE, readBools) != ANI_OK) {
        return false;
    }
    return readInts[INDEX_ZERO] == INT_TEN &&
        readInts[INDEX_ONE] == INT_TWENTY &&
        readInts[INDEX_TWO] == INT_THIRTY &&
        readBools[INDEX_ZERO] == ANI_TRUE &&
        readBools[INDEX_ONE] == ANI_FALSE;
}
inline bool CheckDifferentTypeStringArray(ani_env *env, ani_fixedarray_ref stringArray)
{
    ani_ref readRef {};
    if (env->FixedArray_Get_Ref(stringArray, INDEX_TWO, &readRef) != ANI_OK) {
        return false;
    }
    return FixedArrayAniStringToStd(env, static_cast<ani_string>(readRef)) == STR_THREE;
}
}
ani_fixedarray_double test_FixedArrayDoubleRegion(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_FIVE, &array)) {
        return nullptr;
    }
    std::vector<ani_double> src = {
        ani_tc_fixedarray::DOUBLE_ONE_POINT_ONE,
        ani_tc_fixedarray::DOUBLE_TWO_POINT_TWO,
        ani_tc_fixedarray::DOUBLE_THREE_POINT_THREE,
        ani_tc_fixedarray::DOUBLE_FOUR_POINT_FOUR,
        ani_tc_fixedarray::DOUBLE_FIVE_POINT_FIVE
    };
    ani_status status = env->FixedArray_SetRegion_Double(
        array, ani_tc_fixedarray::INDEX_ZERO, src.size(), src.data());
    std::cout << "FixedArray_SetRegion_Double status: " << status << std::endl;
    std::vector<ani_double> dst;
    if (ani_tc_fixedarray::ReadDoubleRegion(env, array, ani_tc_fixedarray::SIZE_FIVE, &dst)) {
        std::cout << "FixedArray_GetRegion_Double status: " << ANI_OK << std::endl;
    }
    return array;
}
ani_boolean test_CheckFixedArrayDoubleRegion(ani_env *env, ani_object object, ani_fixedarray_double array)
{
    (void)object;
    std::vector<ani_double> dst;
    if (!ani_tc_fixedarray::ReadDoubleRegion(env, array, ani_tc_fixedarray::SIZE_FIVE, &dst)) {
        return ANI_FALSE;
    }
    std::vector<ani_double> expected = {
        ani_tc_fixedarray::DOUBLE_ONE_POINT_ONE,
        ani_tc_fixedarray::DOUBLE_TWO_POINT_TWO,
        ani_tc_fixedarray::DOUBLE_THREE_POINT_THREE,
        ani_tc_fixedarray::DOUBLE_FOUR_POINT_FOUR,
        ani_tc_fixedarray::DOUBLE_FIVE_POINT_FIVE
    };
    return ani_tc_fixedarray::CheckDoubleVector(dst, expected) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayDifferentTypes(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_int intArray {};
    ani_fixedarray_boolean boolArray {};
    ani_fixedarray_ref stringArray {};
    if (!ani_tc_fixedarray::CreateDifferentTypeArrays(env, &intArray, &boolArray, &stringArray)) {
        return ANI_FALSE;
    }
    if (!ani_tc_fixedarray::FillDifferentTypePrimitiveArrays(env, intArray, boolArray) ||
        !ani_tc_fixedarray::FillDifferentTypeStringArray(env, stringArray)) {
        return ANI_FALSE;
    }
    bool ok = ani_tc_fixedarray::CheckDifferentTypePrimitiveArrays(env, intArray, boolArray) &&
        ani_tc_fixedarray::CheckDifferentTypeStringArray(env, stringArray);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayTypeMismatch(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_int intArray {};
    if (!ani_tc_fixedarray::CreateIntArray(env, ani_tc_fixedarray::SIZE_TWO, &intArray)) {
        return ANI_FALSE;
    }
    ani_int original[ani_tc_fixedarray::SIZE_TWO] = {
        ani_tc_fixedarray::INT_ONE,
        ani_tc_fixedarray::INT_TWO
    };
    if (env->FixedArray_SetRegion_Int(intArray, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TWO, original) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double wrongSrc[ani_tc_fixedarray::SIZE_TWO] = {
        ani_tc_fixedarray::DOUBLE_ONE_POINT_TWENTY_FIVE,
        ani_tc_fixedarray::DOUBLE_TWO_POINT_FIVE
    };
    ani_status wrongStatus = env->FixedArray_SetRegion_Double(
        reinterpret_cast<ani_fixedarray_double>(intArray), ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TWO, wrongSrc);
    std::cout << "Forced mismatched FixedArray_SetRegion_Double status: "
              << wrongStatus << std::endl;
    if (wrongStatus != ANI_OK) {
        return ANI_TRUE;
    }
    ani_int after[ani_tc_fixedarray::SIZE_TWO] = {};
    ani_status readStatus = env->FixedArray_GetRegion_Int(
        intArray, ani_tc_fixedarray::INDEX_ZERO, ani_tc_fixedarray::SIZE_TWO, after);
    std::cout << "Read FixedArray<int> after mismatched double write status: "
              << readStatus << ", values: " << after[ani_tc_fixedarray::INDEX_ZERO]
              << ", " << after[ani_tc_fixedarray::INDEX_ONE] << std::endl;
    if (readStatus != ANI_OK) {
        return ANI_TRUE;
    }
    return (after[ani_tc_fixedarray::INDEX_ZERO] != original[ani_tc_fixedarray::INDEX_ZERO] ||
        after[ani_tc_fixedarray::INDEX_ONE] != original[ani_tc_fixedarray::INDEX_ONE]) ? ANI_TRUE : ANI_FALSE;
}
ani_fixedarray_ref test_FixedArrayRefString(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_ref array {};
    if (!ani_tc_fixedarray::CreateStringRefArray(env, ani_tc_fixedarray::SIZE_TWO, &array)) {
        return nullptr;
    }
    ani_string first = ani_tc_fixedarray::NewString(env, ani_tc_fixedarray::STR_FIRST);
    ani_string second = ani_tc_fixedarray::NewString(env, ani_tc_fixedarray::STR_SECOND);
    env->FixedArray_Set_Ref(array, ani_tc_fixedarray::INDEX_ZERO, static_cast<ani_ref>(first));
    env->FixedArray_Set_Ref(array, ani_tc_fixedarray::INDEX_ONE, static_cast<ani_ref>(second));
    return array;
}
ani_boolean test_CheckFixedArrayRefString(ani_env *env, ani_object object, ani_fixedarray_ref array)
{
    (void)object;
    ani_ref first {};
    ani_ref second {};
    if (env->FixedArray_Get_Ref(array, ani_tc_fixedarray::INDEX_ZERO, &first) != ANI_OK ||
        env->FixedArray_Get_Ref(array, ani_tc_fixedarray::INDEX_ONE, &second) != ANI_OK) {
        return ANI_FALSE;
    }
    bool ok = ani_tc_fixedarray::FixedArrayAniStringToStd(env, static_cast<ani_string>(first)) ==
            ani_tc_fixedarray::STR_FIRST &&
        ani_tc_fixedarray::FixedArrayAniStringToStd(env, static_cast<ani_string>(second)) ==
            ani_tc_fixedarray::STR_SECOND;
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayGetPartialRegion(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_TEN, &array)) {
        return ANI_FALSE;
    }
    ani_double src[ani_tc_fixedarray::SIZE_TEN] = {};
    for (ani_size i = 0; i < ani_tc_fixedarray::SIZE_TEN; i++) {
        src[i] = static_cast<ani_double>(i);
    }
    ani_double dst[ani_tc_fixedarray::SIZE_FIVE] = {};
    if (env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TEN, src) != ANI_OK ||
        env->FixedArray_GetRegion_Double(array, ani_tc_fixedarray::INDEX_TWO,
        ani_tc_fixedarray::SIZE_FIVE, dst) != ANI_OK) {
        return ANI_FALSE;
    }
    bool ok = ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_ZERO],
        ani_tc_fixedarray::DOUBLE_TWO) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_ONE],
        ani_tc_fixedarray::DOUBLE_THREE) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_TWO],
        ani_tc_fixedarray::DOUBLE_FOUR) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_THREE],
        ani_tc_fixedarray::DOUBLE_FIVE) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_FOUR],
        ani_tc_fixedarray::DOUBLE_SIX);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArraySetPartialRegion(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_TEN, &array)) {
        return ANI_FALSE;
    }
    ani_double zeros[ani_tc_fixedarray::SIZE_TEN] = {};
    ani_double src[ani_tc_fixedarray::SIZE_THREE] = {
        ani_tc_fixedarray::DOUBLE_HUNDRED,
        ani_tc_fixedarray::DOUBLE_TWO_HUNDRED,
        ani_tc_fixedarray::DOUBLE_THREE_HUNDRED
    };
    if (env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TEN, zeros) != ANI_OK ||
        env->FixedArray_SetRegion_Double(array, ani_tc_fixedarray::INDEX_THREE,
        ani_tc_fixedarray::SIZE_THREE, src) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double dst[ani_tc_fixedarray::SIZE_TEN] = {};
    if (env->FixedArray_GetRegion_Double(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_TEN, dst) != ANI_OK) {
        return ANI_FALSE;
    }
    bool ok = ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_ZERO],
        ani_tc_fixedarray::DOUBLE_ZERO) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_TWO],
        ani_tc_fixedarray::DOUBLE_ZERO) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_THREE],
        ani_tc_fixedarray::DOUBLE_HUNDRED) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_FOUR],
        ani_tc_fixedarray::DOUBLE_TWO_HUNDRED) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_FIVE],
        ani_tc_fixedarray::DOUBLE_THREE_HUNDRED) &&
        ani_tc_fixedarray::IsDoubleEqual(dst[ani_tc_fixedarray::INDEX_NINE],
        ani_tc_fixedarray::DOUBLE_ZERO);
    return ok ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayRegionOutOfRange(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_int array {};
    if (!ani_tc_fixedarray::CreateIntArray(env, ani_tc_fixedarray::SIZE_FIVE, &array)) {
        return ANI_FALSE;
    }
    ani_int buffer[ani_tc_fixedarray::SIZE_THREE] = {};
    ani_status getStatus = env->FixedArray_GetRegion_Int(
        array, ani_tc_fixedarray::INDEX_THREE, ani_tc_fixedarray::SIZE_THREE, buffer);
    ani_int src[ani_tc_fixedarray::SIZE_TWO] = {
        ani_tc_fixedarray::INT_ONE,
        ani_tc_fixedarray::INT_TWO
    };
    ani_status setStatus = env->FixedArray_SetRegion_Int(
        array, ani_tc_fixedarray::INDEX_FOUR, ani_tc_fixedarray::SIZE_TWO, src);
    std::cout << "Get out-of-range status: " << getStatus << std::endl;
    std::cout << "Set out-of-range status: " << setStatus << std::endl;
    return getStatus != ANI_OK && setStatus != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FixedArrayInvalidLength(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double zeroArray {};
    ani_status zeroStatus = env->FixedArray_New_Double(0, &zeroArray);
    ani_fixedarray_double negativeArray {};
    ani_status negativeStatus = env->FixedArray_New_Double(static_cast<ani_size>(-1), &negativeArray);
    std::cout << "FixedArray_New_Double(0) status: " << zeroStatus << std::endl;
    std::cout << "FixedArray_New_Double(-1 as ani_size) status: "
              << negativeStatus << std::endl;
    return zeroStatus == ANI_OK && negativeStatus != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_int test_FixedArrayGetSize(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_double array {};
    if (!ani_tc_fixedarray::CreateDoubleArray(env, ani_tc_fixedarray::SIZE_SEVEN, &array)) {
        return -1;
    }
    ani_size size = 0;
    if (env->FixedArray_GetLength(static_cast<ani_fixedarray>(array), &size) != ANI_OK) {
        return -1;
    }
    return static_cast<ani_int>(size);
}
ani_boolean test_FixedArrayElementAccess(ani_env *env, ani_object object)
{
    (void)object;
    ani_fixedarray_int array {};
    if (!ani_tc_fixedarray::CreateIntArray(env, ani_tc_fixedarray::SIZE_THREE, &array)) {
        return ANI_FALSE;
    }
    ani_int first = ani_tc_fixedarray::INT_TEN;
    ani_int second = ani_tc_fixedarray::INT_TWENTY;
    ani_int third = ani_tc_fixedarray::INT_THIRTY;
    if (env->FixedArray_SetRegion_Int(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_ONE, &first) != ANI_OK ||
        env->FixedArray_SetRegion_Int(array, ani_tc_fixedarray::INDEX_ONE,
        ani_tc_fixedarray::SIZE_ONE, &second) != ANI_OK ||
        env->FixedArray_SetRegion_Int(array, ani_tc_fixedarray::INDEX_TWO,
        ani_tc_fixedarray::SIZE_ONE, &third) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int result0 = 0;
    ani_int result1 = 0;
    ani_int result2 = 0;
    if (env->FixedArray_GetRegion_Int(array, ani_tc_fixedarray::INDEX_ZERO,
        ani_tc_fixedarray::SIZE_ONE, &result0) != ANI_OK ||
        env->FixedArray_GetRegion_Int(array, ani_tc_fixedarray::INDEX_ONE,
        ani_tc_fixedarray::SIZE_ONE, &result1) != ANI_OK ||
        env->FixedArray_GetRegion_Int(array, ani_tc_fixedarray::INDEX_TWO,
        ani_tc_fixedarray::SIZE_ONE, &result2) != ANI_OK) {
        return ANI_FALSE;
    }
    return result0 == ani_tc_fixedarray::INT_TEN &&
        result1 == ani_tc_fixedarray::INT_TWENTY &&
        result2 == ani_tc_fixedarray::INT_THIRTY ? ANI_TRUE : ANI_FALSE;
}
#include "TcFixedArrayTestPart2.h"
#endif
