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

#ifndef ARKTS_ANI_TEST_CLASSOPERATIONSTEST_H
#define ARKTS_ANI_TEST_CLASSOPERATIONSTEST_H

#include "Common.h"
#include "hilog/log.h"

static constexpr const char *CLASS_PREFIX = "entry.src.main.src.ets.Index.";

// ========== Group 1: ClassOperations ==========

ani_int test_FindClass_RegularClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_FindClass_ExportedClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteExported", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_FindClass_FinalClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteFinal", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_FindClass_AbstractClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteAbstractBase", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_FindClass_Interface([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteNamed", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_FindClass_Enum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteStatus", &cls);
    ASSERT_EQ(status, ANI_OK);
    ASSERT_NE(cls, nullptr);
    return ANI_TRUE;
}

ani_int test_FindClass_NotExist([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ani_status status = env->FindClass("entry.src.main.src.ets.Index.NoSuchClass", &cls);
    if (status == ANI_NOT_FOUND) {
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : FindClass for non-existent class returned unexpected status=%{public}d", status);
    return ANI_FALSE;
}

ani_int test_ObjectNew_RegularClass([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor), ANI_OK);
    ASSERT_NE(ctor, nullptr);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, static_cast<ani_int>(3), static_cast<ani_int>(4)), ANI_OK);
    ASSERT_NE(obj, nullptr);

    ani_int xVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "x", &xVal), ANI_OK);
    ASSERT_EQ(xVal, 3);

    ani_int yVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "y", &yVal), ANI_OK);
    ASSERT_EQ(yVal, 4);

    return ANI_TRUE;
}

ani_int test_ObjectNew_DefaultConstructor([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteExported", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ASSERT_NE(ctor, nullptr);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);
    ASSERT_NE(obj, nullptr);

    return ANI_TRUE;
}

ani_int test_ObjectNew_AbstractClass_Fail([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteAbstractBase", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object obj{};
    ani_status status = env->Object_New(cls, ctor, &obj);
    if (status != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : Object_New for abstract class failed as expected, status=%{public}d", status);
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : Object_New for abstract class unexpectedly succeeded");
    return ANI_FALSE;
}

ani_int test_ObjectNew_Interface_Fail([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteNamed", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object obj{};
    ani_status status = env->Object_New(cls, ctor, &obj);
    if (status != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : Object_New for interface failed as expected, status=%{public}d", status);
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : Object_New for interface unexpectedly succeeded");
    return ANI_FALSE;
}

ani_int test_ObjectNew_OverloadedConstructor([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteConstructorForms", &cls), ANI_OK);

    // Default constructor: <ctor> signature ":"
    ani_method ctor1{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor1), ANI_OK);

    // Parameterized constructor: <ctor> signature "iC{std.core.String}:"
    ani_method ctor2{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "iC{std.core.String}:", &ctor2), ANI_OK);

    // Create with default ctor
    ani_object obj1{};
    ASSERT_EQ(env->Object_New(cls, ctor1, &obj1), ANI_OK);

    ani_int firstVal1{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj1, "first", &firstVal1), ANI_OK);
    ASSERT_EQ(firstVal1, 0);

    ani_ref secondRef1{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj1, "second", &secondRef1), ANI_OK);
    ani_string secondStr1 = static_cast<ani_string>(secondRef1);
    std::string second1;
    ASSERT_EQ(GetStdString(env, secondStr1, second1), ANI_TRUE);
    ASSERT_STREQ(second1.c_str(), "default");

    // Create with parameterized ctor
    ani_string oneStr{};
    ASSERT_EQ(env->String_NewUTF8("one", 3, &oneStr), ANI_OK);

    ani_object obj2{};
    ASSERT_EQ(env->Object_New(cls, ctor2, &obj2, static_cast<ani_int>(1), oneStr), ANI_OK);

    ani_int firstVal2{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj2, "first", &firstVal2), ANI_OK);
    ASSERT_EQ(firstVal2, 1);

    ani_ref secondRef2{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj2, "second", &secondRef2), ANI_OK);
    ani_string secondStr2 = static_cast<ani_string>(secondRef2);
    std::string second2;
    ASSERT_EQ(GetStdString(env, secondStr2, second2), ANI_TRUE);
    ASSERT_STREQ(second2.c_str(), "one");

    return ANI_TRUE;
}

ani_int test_ObjectNew_ConcreteFromAbstract([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteConcreteFromAbstract", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);
    ASSERT_NE(obj, nullptr);

    ani_method computeMethod{};
    ASSERT_EQ(env->Class_FindMethod(cls, "compute", "i:i", &computeMethod), ANI_OK);

    ani_int result{};
    ASSERT_EQ(env->Object_CallMethod_Int(obj, computeMethod, &result, 5), ANI_OK);
    ASSERT_EQ(result, 15);

    return ANI_TRUE;
}

ani_int test_ObjectNew_ImplementsOne([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteImplementsOne", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);
    ASSERT_NE(obj, nullptr);

    return ANI_TRUE;
}

ani_int test_ObjectNew_ImplementsMany([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteImplementsMany", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);
    ASSERT_NE(obj, nullptr);

    return ANI_TRUE;
}

ani_int test_ObjectInstanceOf_Class([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, 1, 2), ANI_OK);

    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(obj, cls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_ObjectInstanceOf_Interface([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class implCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteImplementsOne", &implCls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(implCls, "<ctor>", ":", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(implCls, ctor, &obj), ANI_OK);

    ani_class namedCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteNamed", &namedCls), ANI_OK);

    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(obj, namedCls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);

    return ANI_TRUE;
}

ani_int test_ObjectInstanceOf_NotRelated([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class pointCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &pointCls), ANI_OK);

    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(pointCls, "<ctor>", "ii:", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(pointCls, ctor, &obj, 1, 2), ANI_OK);

    ani_class namedCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteNamed", &namedCls), ANI_OK);

    ani_boolean isInstance = ANI_TRUE;
    ASSERT_EQ(env->Object_InstanceOf(obj, namedCls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_FALSE);

    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_CLASSOPERATIONSTEST_H
