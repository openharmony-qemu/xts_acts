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

#ifndef ARKTS_ANI_TEST_METHODOVERLOADTEST_H
#define ARKTS_ANI_TEST_METHODOVERLOADTEST_H

#include "Common.h"
#include "hilog/log.h"

ani_int test_ImplicitOverload_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteImplicitMethodOverload", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    // Find the int overload: choose(int):string → mangling "i:C{std.core.String}"
    ani_method chooseInt{};
    ASSERT_EQ(env->Class_FindMethod(cls, "choose", "i:C{std.core.String}", &chooseInt), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, chooseInt, &resultRef, 1), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "int");
    return ANI_TRUE;
}

ani_int test_ImplicitOverload_String([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteImplicitMethodOverload", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    // Find the string overload: choose(string):string → mangling "C{std.core.String}:C{std.core.String}"
    ani_method chooseStr{};
    ASSERT_EQ(env->Class_FindMethod(cls, "choose", "C{std.core.String}:C{std.core.String}", &chooseStr), ANI_OK);

    ani_string helloStr{};
    ASSERT_EQ(env->String_NewUTF8("hello", 5, &helloStr), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, chooseStr, &resultRef, helloStr), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "hello");
    return ANI_TRUE;
}

ani_int test_ImplicitOverload_Ambiguous([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteImplicitMethodOverload", &cls), ANI_OK);

    // Using nullptr signature on overloaded method should return ANI_AMBIGUOUS (14)
    ani_method method{};
    ani_status status = env->Class_FindMethod(cls, "choose", nullptr, &method);
    if (status == ANI_AMBIGUOUS) {
        OH_LOG_INFO(LOG_APP, "testTag : nullptr signature on overloaded method returned ANI_AMBIGUOUS as expected");
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : unexpected status=%{public}d for ambiguous method lookup", status);
    return ANI_FALSE;
}

ani_int test_ExplicitOverload_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteExplicitMethodOverload", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    // Explicit overload: method name is "chooseInt" (not "choose")
    ani_method chooseInt{};
    ASSERT_EQ(env->Class_FindMethod(cls, "chooseInt", "i:C{std.core.String}", &chooseInt), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, chooseInt, &resultRef, 1), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "int");
    return ANI_TRUE;
}

ani_int test_ExplicitOverload_String([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteExplicitMethodOverload", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_method chooseStr{};
    ASSERT_EQ(env->Class_FindMethod(cls, "chooseString", "C{std.core.String}:C{std.core.String}", &chooseStr), ANI_OK);

    ani_string helloStr{};
    ASSERT_EQ(env->String_NewUTF8("hello", 5, &helloStr), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, chooseStr, &resultRef, helloStr), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "hello");
    return ANI_TRUE;
}

ani_int test_StaticOverload_Int([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteStaticOverload", &cls), ANI_OK);

    ani_static_method chooseInt{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "chooseInt", "i:C{std.core.String}", &chooseInt), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, chooseInt, &resultRef, 5), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "int");
    return ANI_TRUE;
}

ani_int test_StaticOverload_String([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteStaticOverload", &cls), ANI_OK);

    ani_static_method chooseStr{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "chooseString", "C{std.core.String}:C{std.core.String}", &chooseStr), ANI_OK);

    ani_string helloStr{};
    ASSERT_EQ(env->String_NewUTF8("hello", 5, &helloStr), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Class_CallStaticMethod_Ref(cls, chooseStr, &resultRef, helloStr), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "hello");
    return ANI_TRUE;
}

ani_int test_ConstructorOverload_Default([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteConstructorForms", &cls), ANI_OK);

    // Default constructor: signature ":"
    ani_method ctor1{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor1), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor1, &obj), ANI_OK);

    ani_int firstVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "first", &firstVal), ANI_OK);
    ASSERT_EQ(firstVal, 0);

    ani_ref secondRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "second", &secondRef), ANI_OK);
    ani_string secondStr = static_cast<ani_string>(secondRef);
    std::string second;
    ASSERT_EQ(GetStdString(env, secondStr, second), ANI_TRUE);
    ASSERT_STREQ(second.c_str(), "default");
    return ANI_TRUE;
}

ani_int test_ConstructorOverload_WithParams([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteConstructorForms", &cls), ANI_OK);

    // Parameterized constructor: signature "iC{std.core.String}:"
    ani_method ctor2{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "iC{std.core.String}:", &ctor2), ANI_OK);

    ani_string oneStr{};
    ASSERT_EQ(env->String_NewUTF8("one", 3, &oneStr), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor2, &obj, static_cast<ani_int>(1), oneStr), ANI_OK);

    ani_int firstVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "first", &firstVal), ANI_OK);
    ASSERT_EQ(firstVal, 1);

    ani_ref secondRef{};
    ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "second", &secondRef), ANI_OK);
    ani_string secondStr = static_cast<ani_string>(secondRef);
    std::string second;
    ASSERT_EQ(GetStdString(env, secondStr, second), ANI_TRUE);
    ASSERT_STREQ(second.c_str(), "one");
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_METHODOVERLOADTEST_H
