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

#ifndef ARKTS_ANI_TEST_GENERICCLASSTEST_H
#define ARKTS_ANI_TEST_GENERICCLASSTEST_H

#include "Common.h"
#include "hilog/log.h"

ani_int test_FindClass_Generic([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteGenericBox", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_ObjectNew_GenericString([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteGenericBox", &cls), ANI_OK);

    // Generic constructor: constructor(item: T) → type-erased to Object → signature "C{std.core.Object}:"
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.Object}:", &ctor), ANI_OK);

    // Create string as generic argument (pass as ani_ref because T is erased to Object)
    ani_string boxStr{};
    ASSERT_EQ(env->String_NewUTF8("box", 3, &boxStr), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, static_cast<ani_ref>(boxStr)), ANI_OK);
    ASSERT_NE(obj, nullptr);
    return ANI_TRUE;
}

ani_int test_GetField_Generic([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteGenericBox", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.Object}:", &ctor), ANI_OK);

    ani_string boxStr{};
    ASSERT_EQ(env->String_NewUTF8("box", 3, &boxStr), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, static_cast<ani_ref>(boxStr)), ANI_OK);

    // Generic field "item: T" is type-erased to Object → use GetFieldByName_Ref
    ani_ref itemRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "item", &itemRef), ANI_OK);
    ASSERT_NE(itemRef, nullptr);

    // Cast back to ani_string and verify content
    ani_string itemStr = static_cast<ani_string>(itemRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, itemStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "box");
    return ANI_TRUE;
}

ani_int test_CallMethod_GenericReturn([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteGenericBox", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.Object}:", &ctor), ANI_OK);

    ani_string boxStr{};
    ASSERT_EQ(env->String_NewUTF8("box", 3, &boxStr), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, static_cast<ani_ref>(boxStr)), ANI_OK);

    // Generic method getItem(): T → return type erased to Object → signature ":C{std.core.Object}"
    ani_method getItemMethod{};
    ASSERT_EQ(env->Class_FindMethod(cls, "getItem", ":C{std.core.Object}", &getItemMethod), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, getItemMethod, &resultRef), ANI_OK);
    ASSERT_NE(resultRef, nullptr);

    // Cast back to ani_string and verify
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "box");
    return ANI_TRUE;
}

ani_int test_GenericDerived([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteGenericDerived", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.Object}:", &ctor), ANI_OK);

    // Box an int as generic argument (int → Int via Primitive_Box_Int)
    ani_object boxedInt{};
    ASSERT_EQ(env->Primitive_Box_Int(5, &boxedInt), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, static_cast<ani_ref>(boxedInt)), ANI_OK);
    ASSERT_NE(obj, nullptr);

    // Verify the "item" field holds an Int object
    ani_ref itemRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "item", &itemRef), ANI_OK);

    ani_class intCls{};
    ASSERT_EQ(env->FindClass("std.core.Int", &intCls), ANI_OK);
    ani_boolean isInt = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(static_cast<ani_object>(itemRef), intCls, &isInt), ANI_OK);
    ASSERT_EQ(isInt, ANI_TRUE);

    // Verify the "tag" field
    ani_ref tagRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "tag", &tagRef), ANI_OK);
    ani_string tagStr = static_cast<ani_string>(tagRef);
    std::string tag;
    ASSERT_EQ(GetStdString(env, tagStr, tag), ANI_TRUE);
    ASSERT_STREQ(tag.c_str(), "generic-derived");
    return ANI_TRUE;
}

ani_int test_StringBox_Inheritance([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteStringBox", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.String}:", &ctor), ANI_OK);

    ani_string valueStr{};
    ASSERT_EQ(env->String_NewUTF8("value", 5, &valueStr), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, static_cast<ani_ref>(valueStr)), ANI_OK);
    ASSERT_NE(obj, nullptr);

    // Verify StringBox instanceof GenericBox
    ani_class genericBoxCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteGenericBox", &genericBoxCls), ANI_OK);

    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(obj, genericBoxCls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_GenericPair_TwoParams([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteGenericPair", &cls), ANI_OK);

    // Constructor(key: K, value: V) → signature "C{std.core.Object}C{std.core.Object}:"
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "C{std.core.Object}C{std.core.Object}:", &ctor), ANI_OK);

    // Create key (string) and value (boxed int)
    ani_string keyStr{};
    ASSERT_EQ(env->String_NewUTF8("age", 3, &keyStr), ANI_OK);

    ani_object valueBox{};
    ASSERT_EQ(env->Primitive_Box_Int(18, &valueBox), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, static_cast<ani_ref>(keyStr), static_cast<ani_ref>(valueBox)), ANI_OK);
    ASSERT_NE(obj, nullptr);

    // Verify "key" field → string
    ani_ref keyRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "key", &keyRef), ANI_OK);
    ani_string keyResultStr = static_cast<ani_string>(keyRef);
    std::string keyResult;
    ASSERT_EQ(GetStdString(env, keyResultStr, keyResult), ANI_TRUE);
    ASSERT_STREQ(keyResult.c_str(), "age");

    // Verify "value" field → Int object
    ani_ref valueRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "value", &valueRef), ANI_OK);

    ani_class intCls{};
    ASSERT_EQ(env->FindClass("std.core.Int", &intCls), ANI_OK);
    ani_boolean isInt = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(static_cast<ani_object>(valueRef), intCls, &isInt), ANI_OK);
    ASSERT_EQ(isInt, ANI_TRUE);

    // Unbox to get 18
    ani_int unboxed{};
    ASSERT_EQ(env->Primitive_Unbox_Int(static_cast<ani_object>(valueRef), &unboxed), ANI_OK);
    ASSERT_EQ(unboxed, 18);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_GENERICCLASSTEST_H
