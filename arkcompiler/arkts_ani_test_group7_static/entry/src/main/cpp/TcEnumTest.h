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

#ifndef TC_ENUM_TEST_H
#define TC_ENUM_TEST_H
#include "Common.h"
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_enum {
constexpr const char *ENUM_COLOR_INT_DESC = "entry.src.main.src.ets.Index.COLORINT";
constexpr const char *ENUM_COLOR_STRING_DESC = "entry.src.main.src.ets.Index.COLORSTRING";
constexpr const char *ENUM_NS_COLOR_INT_DESC = "entry.src.main.src.ets.Index.EnumNamespace.NsColorInt";
constexpr const char *ENUM_MISSING_DESC = "entry.src.main.src.ets.Index.NON_EXIST_ENUM";
constexpr const char *ENUM_WRONG_DESCRIPTOR = "entry.src.main.src.ets.Index.COLORINT;";
constexpr ani_size ENUM_LAST_INDEX = 2;
constexpr ani_size ENUM_FIRST_INDEX = 0;
constexpr ani_size ENUM_GREEN_INDEX = 1;
constexpr ani_size ENUM_OUT_OF_RANGE_INDEX = 3;
constexpr ani_int ENUM_BLUE_INT_VALUE = 9999;
constexpr ani_int ENUM_COMPUTE_OFFSET = 100;
inline ani_string EnumNewUtf8String(ani_env *env, const std::string &value)
{
    ani_string result {};
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
std::string EnumAniStringToStd(ani_env *env, ani_string str)
{
    if (str == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed")) {
        return "";
    }
    std::vector<char> buffer(size + 1, '\0');
    ani_size written = 0;
    status = env->String_GetUTF8(str, buffer.data(), buffer.size(), &written);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8 failed")) {
        return "";
    }
    return std::string(buffer.data(), written);
}
inline ani_enum EnumFindColorIntEnum(ani_env *env)
{
    ani_enum enumType {};
    ani_status status = env->FindEnum(ENUM_COLOR_INT_DESC, &enumType);
    if (!AssertEqMsg(status, ANI_OK, "FindEnum COLORINT failed")) {
        return nullptr;
    }
    return enumType;
}
inline ani_enum EnumFindColorStringEnum(ani_env *env)
{
    ani_enum enumType {};
    ani_status status = env->FindEnum(ENUM_COLOR_STRING_DESC, &enumType);
    if (!AssertEqMsg(status, ANI_OK, "FindEnum COLORSTRING failed")) {
        return nullptr;
    }
    return enumType;
}
inline ani_enum_item EnumGetItemByName(ani_env *env, ani_enum enumType, const char *name)
{
    ani_enum_item item {};
    ani_status status = env->Enum_GetEnumItemByName(enumType, name, &item);
    if (!AssertEqMsg(status, ANI_OK, "Enum_GetEnumItemByName failed")) {
        return nullptr;
    }
    return item;
}
inline ani_int EnumGetItemIntValue(ani_env *env, ani_enum_item item)
{
    ani_int value = 0;
    ani_status status = env->EnumItem_GetValue_Int(item, &value);
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetValue_Int failed")) {
        return 0;
    }
    return value;
}
inline void EnumClearPendingError(ani_env *env)
{
    ani_boolean hasError = ANI_FALSE;
    ani_status status = env->ExistUnhandledError(&hasError);
    if (status == ANI_OK && hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
}
}
ani_int test_EnumGetGreenIntByName(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return -1;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "GREENINT");
    if (item == nullptr) {
        return -1;
    }
    return ani_tc_enum::EnumGetItemIntValue(env, item);
}
ani_boolean test_EnumGetGreenIntByIndexCompare(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return ANI_FALSE;
    }
    ani_enum_item itemByIndex {};
    ani_status status = env->Enum_GetEnumItemByIndex(
        enumType, ani_tc_enum::ENUM_GREEN_INDEX, &itemByIndex);
    if (!AssertEqMsg(status, ANI_OK, "Enum_GetEnumItemByIndex failed")) {
        return ANI_FALSE;
    }
    ani_enum_item itemByName = ani_tc_enum::EnumGetItemByName(env, enumType, "GREENINT");
    if (itemByName == nullptr) {
        return ANI_FALSE;
    }
    ani_int valueByIndex = ani_tc_enum::EnumGetItemIntValue(env, itemByIndex);
    ani_int valueByName = ani_tc_enum::EnumGetItemIntValue(env, itemByName);
    ani_string nameByIndex {};
    status = env->EnumItem_GetName(itemByIndex, &nameByIndex);
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetName failed")) {
        return ANI_FALSE;
    }
    std::string name = ani_tc_enum::EnumAniStringToStd(env, nameByIndex);
    return (valueByIndex == valueByName && name == "GREENINT") ? ANI_TRUE : ANI_FALSE;
}
ani_int test_EnumGetBlueIntIndex(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return -1;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "BLUEINT");
    if (item == nullptr) {
        return -1;
    }
    ani_size index = 0;
    ani_status status = env->EnumItem_GetIndex(item, &index);
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetIndex failed")) {
        return -1;
    }
    return static_cast<ani_int>(index);
}
ani_string test_EnumGetGreenIntName(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "GREENINT");
    if (item == nullptr) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    ani_string name {};
    ani_status status = env->EnumItem_GetName(item, &name);
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetName failed")) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    return name;
}
ani_boolean test_EnumGetEnumFromItem(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return ANI_FALSE;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "BLUEINT");
    if (item == nullptr) {
        return ANI_FALSE;
    }
    ani_enum retrievedEnum {};
    ani_status status = env->EnumItem_GetEnum(item, &retrievedEnum);
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetEnum failed")) {
        return ANI_FALSE;
    }
    ani_enum_item itemFromRetrieved = ani_tc_enum::EnumGetItemByName(env, retrievedEnum, "BLUEINT");
    if (itemFromRetrieved == nullptr) {
        return ANI_FALSE;
    }
    ani_int value = ani_tc_enum::EnumGetItemIntValue(env, itemFromRetrieved);
    return value == ani_tc_enum::ENUM_BLUE_INT_VALUE ? ANI_TRUE : ANI_FALSE;
}
ani_string test_EnumGetColorStringValue(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorStringEnum(env);
    if (enumType == nullptr) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "GREENSTR");
    if (item == nullptr) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    ani_string value {};
    ani_status status = env->EnumItem_GetValue_String(item, &value);
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetValue_String failed")) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    return value;
}
ani_boolean test_EnumGetStringValueFromIntItemFails(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return ANI_FALSE;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "GREENINT");
    if (item == nullptr) {
        return ANI_FALSE;
    }
    ani_string value {};
    ani_status status = env->EnumItem_GetValue_String(item, &value);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
        return ANI_TRUE;
    }
    ani_boolean hasError = ANI_FALSE;
    if (env->ExistUnhandledError(&hasError) == ANI_OK && hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_int test_EnumFindModuleEnum(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType {};
    ani_status status = env->FindEnum(ani_tc_enum::ENUM_COLOR_INT_DESC, &enumType);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "FindEnum module-level enum failed")) {
        return -1;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "GREENINT");
    if (item == nullptr) {
        return -1;
    }
    return ani_tc_enum::EnumGetItemIntValue(env, item);
}
ani_int test_EnumFindNamespaceEnum(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType {};
    ani_status status = env->FindEnum(ani_tc_enum::ENUM_NS_COLOR_INT_DESC, &enumType);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "FindEnum namespace enum failed")) {
        return -1;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "GREENINT");
    if (item == nullptr) {
        return -1;
    }
    return ani_tc_enum::EnumGetItemIntValue(env, item);
}
ani_enum_item test_EnumProcessIntNext(ani_env *env, ani_object object, ani_enum_item color)
{
    (void)object;
    ani_enum enumType {};
    ani_status status = env->EnumItem_GetEnum(color, &enumType);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetEnum failed")) {
        return color;
    }
    ani_size index = 0;
    status = env->EnumItem_GetIndex(color, &index);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetIndex failed")) {
        return color;
    }
    ani_size nextIndex = index + 1;
    if (nextIndex > ani_tc_enum::ENUM_LAST_INDEX) {
        nextIndex = ani_tc_enum::ENUM_FIRST_INDEX;
    }
    ani_enum_item nextItem {};
    status = env->Enum_GetEnumItemByIndex(enumType, nextIndex, &nextItem);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "Enum_GetEnumItemByIndex next failed")) {
        return color;
    }
    return nextItem;
}
ani_enum_item test_EnumReturnBlueInt(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return nullptr;
    }
    return ani_tc_enum::EnumGetItemByName(env, enumType, "BLUEINT");
}
ani_boolean test_EnumFindMissingEnum(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType {};
    ani_status status = env->FindEnum(ani_tc_enum::ENUM_MISSING_DESC, &enumType);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_boolean test_EnumFindMissingItem(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return ANI_FALSE;
    }
    ani_enum_item item {};
    ani_status status = env->Enum_GetEnumItemByName(enumType, "YELLOWINT", &item);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_boolean test_EnumGetItemByOutOfRangeIndex(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return ANI_FALSE;
    }
    ani_enum_item item {};
    ani_status status = env->Enum_GetEnumItemByIndex(
        enumType, ani_tc_enum::ENUM_OUT_OF_RANGE_INDEX, &item);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
ani_int test_EnumGetLargeIntValue(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorIntEnum(env);
    if (enumType == nullptr) {
        return -1;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "BLUEINT");
    if (item == nullptr) {
        return -1;
    }
    return ani_tc_enum::EnumGetItemIntValue(env, item);
}
ani_string test_EnumGetUnicodeStringValue(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType = ani_tc_enum::EnumFindColorStringEnum(env);
    if (enumType == nullptr) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "CHNSTR");
    if (item == nullptr) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    ani_string value {};
    ani_status status = env->EnumItem_GetValue_String(item, &value);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetValue_String unicode failed")) {
        return ani_tc_enum::EnumNewUtf8String(env, "");
    }
    return value;
}
ani_enum_item test_EnumGetOtherItemFromInput(ani_env *env, ani_object object, ani_enum_item color)
{
    (void)object;
    ani_enum enumType {};
    ani_status status = env->EnumItem_GetEnum(color, &enumType);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetEnum from input failed")) {
        return color;
    }
    ani_enum_item otherItem {};
    status = env->Enum_GetEnumItemByName(enumType, "BLUEINT", &otherItem);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "Enum_GetEnumItemByName BLUEINT failed")) {
        return color;
    }
    return otherItem;
}
ani_boolean test_EnumFindAfterLoadLibrary(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum enumType {};
    ani_status status = env->FindEnum(ani_tc_enum::ENUM_COLOR_INT_DESC, &enumType);
    if (status != ANI_OK || enumType == nullptr) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "FindEnum after loadLibrary failed")) {
        return ANI_FALSE;
    }
    if (enumType == nullptr) {
        return ANI_FALSE;
    }
    ani_enum_item item = ani_tc_enum::EnumGetItemByName(env, enumType, "REDINT");
    return item != nullptr ? ANI_TRUE : ANI_FALSE;
}
ani_int test_EnumComputeValue(ani_env *env, ani_object object, ani_enum_item color)
{
    (void)object;
    ani_int value = 0;
    ani_status status = env->EnumItem_GetValue_Int(color, &value);
    if (status != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(status, ANI_OK, "EnumItem_GetValue_Int compute failed")) {
        return -1;
    }
    return value + ani_tc_enum::ENUM_COMPUTE_OFFSET;
}
ani_boolean test_EnumFindByDescriptorFormats(ani_env *env, ani_object object)
{
    (void)object;
    ani_enum correctEnum {};
    ani_status correctStatus = env->FindEnum(ani_tc_enum::ENUM_COLOR_INT_DESC, &correctEnum);
    if (correctStatus != ANI_OK || correctEnum == nullptr) {
        ani_tc_enum::EnumClearPendingError(env);
    }
    if (!AssertEqMsg(correctStatus, ANI_OK, "FindEnum correct descriptor failed")) {
        return ANI_FALSE;
    }
    if (correctEnum == nullptr) {
        return ANI_FALSE;
    }
    ani_enum wrongEnum {};
    ani_status wrongStatus = env->FindEnum(ani_tc_enum::ENUM_WRONG_DESCRIPTOR, &wrongEnum);
    if (wrongStatus != ANI_OK) {
        ani_tc_enum::EnumClearPendingError(env);
        return ANI_TRUE;
    }
    return ANI_FALSE;
}
#endif
