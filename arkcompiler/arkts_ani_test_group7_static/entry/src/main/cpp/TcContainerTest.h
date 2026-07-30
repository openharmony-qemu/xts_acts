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

#ifndef TC_CONTAINER_TEST_H
#define TC_CONTAINER_TEST_H
#include "Common.h"
#include <cmath>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_container {
constexpr const char *INDEX_PERSON_INFO_CLASS = "entry.src.main.src.ets.Index.PersonInfo";
constexpr const char *RECORD_CLASS_NAME = "escompat.Record";
constexpr double CONTAINER_EPSILON = 0.000001;
constexpr int CONTAINER_KEYS_MAX_ITERATION = 8;
constexpr ani_size CONTAINER_TUPLE_DOUBLE_COUNT = 5;
constexpr ani_size CONTAINER_TUPLE_MIXED_COUNT = 4;
constexpr ani_size CONTAINER_TUPLE_READONLY_COUNT = 3;
constexpr ani_size CONTAINER_INDEX_ZERO = 0;
constexpr ani_size CONTAINER_INDEX_ONE = 1;
constexpr ani_size CONTAINER_INDEX_TWO = 2;
constexpr ani_size CONTAINER_INDEX_THREE = 3;
constexpr ani_int CONTAINER_EXPECT_INT_42 = 42;
constexpr ani_int CONTAINER_EXPECT_FIRST = 1;
constexpr ani_double CONTAINER_EXPECT_AGE_CHLOE = 25.0;
constexpr ani_double CONTAINER_EXPECT_AGE_ALICE = 30.0;
constexpr ani_double CONTAINER_EXPECT_AGE_BOB = 30.0;
constexpr ani_double CONTAINER_EXPECT_AGE_NATIVE = 40.0;
constexpr ani_double CONTAINER_EXPECT_DOUBLE_2 = 2.0;
constexpr ani_double CONTAINER_EXPECT_DOUBLE_3 = 3.0;
constexpr ani_double CONTAINER_EXPECT_DOUBLE_PI = 3.14;
std::string ContainerAniStringToStd(ani_env *env, ani_string str)
{
    if (str == nullptr) {
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
inline ani_string ContainerStdStringToAni(ani_env *env, const std::string &value)
{
    ani_string result = nullptr;
    if (env->String_NewUTF8(value.c_str(), value.size(), &result) != ANI_OK) {
        return nullptr;
    }
    return result;
}
ani_object CreatePersonInfo(ani_env *env, const std::string &name, ani_double age)
{
    ani_class cls = nullptr;
    ani_status status = env->FindClass(INDEX_PERSON_INFO_CLASS, &cls);
    if (!AssertEqMsg(status, ANI_OK, "Find PersonInfo failed")) {
        return nullptr;
    }
    ani_method ctor = nullptr;
    status = env->Class_FindMethod(cls, "<ctor>", "C{std.core.String}d:", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Find PersonInfo constructor failed")) {
        return nullptr;
    }
    ani_string aniName = ContainerStdStringToAni(env, name);
    ani_object result = nullptr;
    status = env->Object_New(cls, ctor, &result, aniName, age);
    if (!AssertEqMsg(status, ANI_OK, "Create PersonInfo failed")) {
        return nullptr;
    }
    return result;
}
bool CheckPersonInfo(ani_env *env, ani_object person, const std::string &expectedName,
    ani_double expectedAge)
{
    ani_ref nameRef = nullptr;
    ani_status status = env->Object_GetFieldByName_Ref(person, "name", &nameRef);
    if (status != ANI_OK) {
        status = env->Object_GetPropertyByName_Ref(person, "name", &nameRef);
    }
    if (!AssertEqMsg(status, ANI_OK, "Read PersonInfo.name failed")) {
        return false;
    }
    ani_double age = 0.0;
    status = env->Object_GetFieldByName_Double(person, "age", &age);
    if (status != ANI_OK) {
        status = env->Object_GetPropertyByName_Double(person, "age", &age);
    }
    if (!AssertEqMsg(status, ANI_OK, "Read PersonInfo.age failed")) {
        return false;
    }
    std::string actualName = ContainerAniStringToStd(env, reinterpret_cast<ani_string>(nameRef));
    return actualName == expectedName && std::fabs(age - expectedAge) < CONTAINER_EPSILON;
}
ani_method FindRecordGetter(ani_env *env, const char *signature)
{
    ani_class recordCls = nullptr;
    ani_status status = env->FindClass(RECORD_CLASS_NAME, &recordCls);
    if (!AssertEqMsg(status, ANI_OK, "Find escompat.Record failed")) {
        return nullptr;
    }
    ani_method getter = nullptr;
    status = env->Class_FindIndexableGetter(recordCls, signature, &getter);
    if (!AssertEqMsg(status, ANI_OK, "Find Record indexable getter failed")) {
        return nullptr;
    }
    return getter;
}
ani_method FindRecordSetter(ani_env *env, const char *signature)
{
    ani_class recordCls = nullptr;
    ani_status status = env->FindClass(RECORD_CLASS_NAME, &recordCls);
    if (!AssertEqMsg(status, ANI_OK, "Find escompat.Record failed")) {
        return nullptr;
    }
    ani_method setter = nullptr;
    status = env->Class_FindIndexableSetter(recordCls, signature, &setter);
    if (!AssertEqMsg(status, ANI_OK, "Find Record indexable setter failed")) {
        return nullptr;
    }
    return setter;
}
ani_object RecordGetByStringKey(ani_env *env, ani_object record, const std::string &key)
{
    ani_method getter = FindRecordGetter(env, nullptr);
    if (getter == nullptr) {
        return nullptr;
    }
    ani_string aniKey = ContainerStdStringToAni(env, key);
    ani_ref result = nullptr;
    ani_status status = env->Object_CallMethod_Ref(record, getter, &result, aniKey);
    if (!AssertEqMsg(status, ANI_OK, "Record getter call failed")) {
        return nullptr;
    }
    return reinterpret_cast<ani_object>(result);
}
bool RecordSetByStringKey(ani_env *env, ani_object record, const std::string &key, ani_object value)
{
    ani_method setter = FindRecordSetter(env, "C{std.core.Object}C{std.core.Object}:");
    if (setter == nullptr) {
        return false;
    }
    ani_string aniKey = ContainerStdStringToAni(env, key);
    ani_status status = env->Object_CallMethod_Void(record, setter, aniKey, value);
    if (!AssertEqMsg(status, ANI_OK, "Record setter call failed")) {
        return false;
    }
    return true;
}
}
ani_boolean test_ContainerCallWithRecord(ani_env *env, ani_object object, ani_object record)
{
    (void)object;
    ani_object person = ani_tc_container::RecordGetByStringKey(env, record, "Chloe");
    if (person == nullptr) {
        return ANI_FALSE;
    }
    return ani_tc_container::CheckPersonInfo(
        env, person, "Chloe", ani_tc_container::CONTAINER_EXPECT_AGE_CHLOE) ? ANI_TRUE : ANI_FALSE;
}
ani_object test_ContainerSetRecord(ani_env *env, ani_object object, ani_object record)
{
    (void)object;
    ani_object person = ani_tc_container::CreatePersonInfo(
        env, "Alice", ani_tc_container::CONTAINER_EXPECT_AGE_ALICE);
    if (person == nullptr) {
        return record;
    }
    if (!ani_tc_container::RecordSetByStringKey(env, record, "Alice", person)) {
        return record;
    }
    return record;
}
ani_boolean test_ContainerRecordKeys(ani_env *env, ani_object object, ani_object record)
{
    (void)object;
    ani_ref iteratorRef = nullptr;
    ani_status status = env->Object_CallMethodByName_Ref(record, "keys",
        ":C{escompat.IterableIterator}", &iteratorRef);
    if (!AssertEqMsg(status, ANI_OK, "Call Record.keys failed")) {
        return ANI_FALSE;
    }
    bool foundChloe = false;
    for (int i = 0; i < ani_tc_container::CONTAINER_KEYS_MAX_ITERATION; i++) {
        ani_ref nextRef = nullptr;
        status = env->Object_CallMethodByName_Ref(reinterpret_cast<ani_object>(iteratorRef), "next",
            ":C{std.core.Object}", &nextRef);
        if (!AssertEqMsg(status, ANI_OK, "Call iterator.next failed")) {
            return ANI_FALSE;
        }
        ani_boolean done = ANI_FALSE;
        status = env->Object_GetPropertyByName_Boolean(reinterpret_cast<ani_object>(nextRef), "done", &done);
        if (status == ANI_OK && done == ANI_TRUE) {
            break;
        }
        ani_ref valueRef = nullptr;
        status = env->Object_GetPropertyByName_Ref(reinterpret_cast<ani_object>(nextRef), "value", &valueRef);
        if (status != ANI_OK) {
            continue;
        }
        std::string key = ani_tc_container::ContainerAniStringToStd(env, reinterpret_cast<ani_string>(valueRef));
        if (key == "Chloe") {
            foundChloe = true;
        }
    }
    return foundChloe ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ContainerRecordMissingKey(ani_env *env, ani_object object, ani_object record)
{
    (void)object;
    ani_object value = ani_tc_container::RecordGetByStringKey(env, record, "MissingKey");
    ani_boolean isUndefined = ANI_FALSE;
    env->Reference_IsUndefined(reinterpret_cast<ani_ref>(value), &isUndefined);
    return isUndefined;
}
ani_double test_ContainerTupleDouble(ani_env *env, ani_object object, ani_tuple_value tuple)
{
    (void)object;
    ani_double sum = 0.0;
    for (ani_size i = 0; i < ani_tc_container::CONTAINER_TUPLE_DOUBLE_COUNT; i++) {
        ani_double value = 0.0;
        ani_status status = env->TupleValue_GetItem_Double(tuple, i, &value);
        if (!AssertEqMsg(status, ANI_OK, "TupleValue_GetItem_Double failed")) {
        return 0.0;
    }
        sum += value;
    }
    return sum;
}
ani_boolean test_ContainerTupleMixed(ani_env *env, ani_object object, ani_tuple_value tuple)
{
    (void)object;
    ani_int intVal = 0;
    ani_ref strRef = nullptr;
    ani_double doubleVal = 0.0;
    ani_boolean boolVal = ANI_FALSE;
    ani_status s0 = env->TupleValue_GetItem_Int(tuple, ani_tc_container::CONTAINER_INDEX_ZERO, &intVal);
    ani_status s1 = env->TupleValue_GetItem_Ref(tuple, ani_tc_container::CONTAINER_INDEX_ONE, &strRef);
    ani_status s2 = env->TupleValue_GetItem_Double(tuple, ani_tc_container::CONTAINER_INDEX_TWO, &doubleVal);
    ani_status s3 = env->TupleValue_GetItem_Boolean(tuple, ani_tc_container::CONTAINER_INDEX_THREE, &boolVal);
    if (!AssertEqMsg(s0, ANI_OK, "TupleValue_GetItem_Int failed")) {
        return ANI_FALSE;
    }
    if (!AssertEqMsg(s1, ANI_OK, "TupleValue_GetItem_Ref failed")) {
        return ANI_FALSE;
    }
    if (!AssertEqMsg(s2, ANI_OK, "TupleValue_GetItem_Double failed")) {
        return ANI_FALSE;
    }
    if (!AssertEqMsg(s3, ANI_OK, "TupleValue_GetItem_Boolean failed")) {
        return ANI_FALSE;
    }
    std::string str = ani_tc_container::ContainerAniStringToStd(env, reinterpret_cast<ani_string>(strRef));
    return intVal == ani_tc_container::CONTAINER_EXPECT_INT_42 && str == "hello" &&
        std::fabs(doubleVal - ani_tc_container::CONTAINER_EXPECT_DOUBLE_PI) <
            ani_tc_container::CONTAINER_EPSILON &&
        boolVal == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ContainerTupleOutOfRange(ani_env *env, ani_object object, ani_tuple_value tuple)
{
    (void)object;
    ani_double value = 0.0;
    ani_status status = env->TupleValue_GetItem_Double(tuple, ani_tc_container::CONTAINER_INDEX_THREE, &value);
    std::cout << "Tuple out-of-range status: " << status << std::endl;
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ContainerTupleObject(ani_env *env, ani_object object, ani_tuple_value tuple)
{
    (void)object;
    ani_ref objRef = nullptr;
    ani_status status = env->TupleValue_GetItem_Ref(tuple, ani_tc_container::CONTAINER_INDEX_ZERO, &objRef);
    if (!AssertEqMsg(status, ANI_OK, "TupleValue_GetItem_Ref failed")) {
        return ANI_FALSE;
    }
    return ani_tc_container::CheckPersonInfo(
        env, reinterpret_cast<ani_object>(objRef), "Bob",
        ani_tc_container::CONTAINER_EXPECT_AGE_BOB) ? ANI_TRUE : ANI_FALSE;
}
ani_object test_ContainerCreateRecord(ani_env *env, ani_object object)
{
    (void)object;
    ani_class recordCls = nullptr;
    if (env->FindClass(ani_tc_container::RECORD_CLASS_NAME, &recordCls) != ANI_OK) {
        return nullptr;
    }
    ani_method ctor = nullptr;
    ani_status status = env->Class_FindMethod(recordCls, "<ctor>", ":", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Find Record default constructor failed")) {
        return nullptr;
    }
    ani_object record = nullptr;
    status = env->Object_New(recordCls, ctor, &record);
    if (!AssertEqMsg(status, ANI_OK, "Create Record failed")) {
        return nullptr;
    }
    ani_object person = ani_tc_container::CreatePersonInfo(
        env, "Native", ani_tc_container::CONTAINER_EXPECT_AGE_NATIVE);
    if (person != nullptr) {
        ani_tc_container::RecordSetByStringKey(env, record, "Native", person);
    }
    return record;
}
ani_boolean test_ContainerReadOnlyTuple(ani_env *env, ani_object object, ani_tuple_value tuple)
{
    (void)object;
    ani_size count = 0;
    ani_status status = env->TupleValue_GetNumberOfItems(tuple, &count);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int first = 0;
    ani_double second = 0.0;
    ani_double third = 0.0;
    status = env->TupleValue_GetItem_Int(tuple, ani_tc_container::CONTAINER_INDEX_ZERO, &first);
    status = status == ANI_OK ?
        env->TupleValue_GetItem_Double(tuple, ani_tc_container::CONTAINER_INDEX_ONE, &second) : status;
    status = status == ANI_OK ?
        env->TupleValue_GetItem_Double(tuple, ani_tc_container::CONTAINER_INDEX_TWO, &third) : status;
    return status == ANI_OK && count == ani_tc_container::CONTAINER_TUPLE_READONLY_COUNT &&
        first == ani_tc_container::CONTAINER_EXPECT_FIRST &&
        std::fabs(second - ani_tc_container::CONTAINER_EXPECT_DOUBLE_2) <
            ani_tc_container::CONTAINER_EPSILON &&
        std::fabs(third - ani_tc_container::CONTAINER_EXPECT_DOUBLE_3) <
            ani_tc_container::CONTAINER_EPSILON ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ContainerFindRecordGetterWithSignature(ani_env *env, ani_object object, ani_object record)
{
    (void)object;
    (void)record;
    ani_method getter = ani_tc_container::FindRecordGetter(env, "C{std.core.Object}:C{std.core.Object}");
    return getter != nullptr ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ContainerNumberKeyRecord(ani_env *env, ani_object object, ani_object record)
{
    (void)object;
    ani_method getter = ani_tc_container::FindRecordGetter(env, "C{std.core.Object}:C{std.core.Object}");
    if (getter == nullptr) {
        return ANI_FALSE;
    }
    ani_object key = nullptr;
    if (env->Primitive_Box_Int(ani_tc_container::CONTAINER_EXPECT_FIRST, &key) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref resultRef = nullptr;
    ani_status status = env->Object_CallMethod_Ref(record, getter, &resultRef, key);
    if (!AssertEqMsg(status, ANI_OK, "Get Record<number, string> item failed")) {
        return ANI_FALSE;
    }
    std::string value = ani_tc_container::ContainerAniStringToStd(env, reinterpret_cast<ani_string>(resultRef));
    return value == "one" ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ContainerTupleNullUndefined(ani_env *env, ani_object object, ani_tuple_value tuple)
{
    (void)object;
    ani_ref first = nullptr;
    ani_ref second = nullptr;
    ani_status s0 = env->TupleValue_GetItem_Ref(tuple, ani_tc_container::CONTAINER_INDEX_ZERO, &first);
    ani_status s1 = env->TupleValue_GetItem_Ref(tuple, ani_tc_container::CONTAINER_INDEX_ONE, &second);
    if (s0 != ANI_OK || s1 != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isUndefined = ANI_FALSE;
    ani_boolean isNull = ANI_FALSE;
    env->Reference_IsUndefined(first, &isUndefined);
    env->Reference_IsNull(second, &isNull);
    return isUndefined == ANI_TRUE && isNull == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}
#endif
