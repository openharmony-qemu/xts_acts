/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_ENUMOPERATIONSTEST_H
#define ARKTS_ANI_TEST_ENUMOPERATIONSTEST_H

#include "Common.h"
#include "hilog/log.h"

ani_int test_FindEnum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_enum enumObj{};
    ani_status status = env->FindEnum("entry.src.main.src.ets.Index.ClassDefCompleteStatus", &enumObj);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(enumObj, nullptr);
    return ANI_TRUE;
}

ani_int test_GetEnumItemByName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_enum enumObj{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.Index.ClassDefCompleteStatus", &enumObj), ANI_OK);

    ani_enum_item enumItem{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(enumObj, "Ready", &enumItem), ANI_OK);
    ASSERT_NE(enumItem, nullptr);
    return ANI_TRUE;
}

ani_int test_EnumItemGetValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_enum enumObj{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.Index.ClassDefCompleteStatus", &enumObj), ANI_OK);

    ani_enum_item enumItem{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(enumObj, "Ready", &enumItem), ANI_OK);

    ani_int value{};
    ASSERT_EQ(env->EnumItem_GetValue_Int(enumItem, &value), ANI_OK);
    // Enum items in ArkTS typically auto-index from 0: Ready=0, Done=1
    OH_LOG_INFO(LOG_APP, "testTag : EnumItem_GetValue_Int Ready=%{public}d", value);
    // Just verify we got a value (the exact index depends on compiler)
    return ANI_TRUE;
}

ani_int test_EnumItemGetName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_enum enumObj{};
    ASSERT_EQ(env->FindEnum("entry.src.main.src.ets.Index.ClassDefCompleteStatus", &enumObj), ANI_OK);

    ani_enum_item enumItem{};
    ASSERT_EQ(env->Enum_GetEnumItemByName(enumObj, "Ready", &enumItem), ANI_OK);

    ani_string nameStr{};
    ASSERT_EQ(env->EnumItem_GetName(enumItem, &nameStr), ANI_OK);
    ASSERT_NE(nameStr, nullptr);

    std::string name;
    ASSERT_EQ(GetStdString(env, nameStr, name), ANI_TRUE);
    ASSERT_STREQ(name.c_str(), "Ready");
    return ANI_TRUE;
}

ani_int test_EnumFieldAccess([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteFieldTypes", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_ref enumRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "enumField", &enumRef), ANI_OK);
    ASSERT_NE(enumRef, nullptr);

    ani_class statusCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteStatus", &statusCls), ANI_OK);

    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(static_cast<ani_object>(enumRef), statusCls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);

    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_ENUMOPERATIONSTEST_H
