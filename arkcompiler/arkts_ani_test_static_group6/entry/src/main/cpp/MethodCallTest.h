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

#ifndef ARKTS_ANI_TEST_METHODCALLTEST_H
#define ARKTS_ANI_TEST_METHODCALLTEST_H

#include "Common.h"
#include "hilog/log.h"

ani_int test_CallMethod_Instance([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, 3, 4), ANI_OK);

    ani_method moveMethod{};
    ASSERT_EQ(env->Class_FindMethod(cls, "move", "ii:", &moveMethod), ANI_OK);
    ASSERT_EQ(env->Object_CallMethod_Void(obj, moveMethod, 1, 1), ANI_OK);

    ani_int xVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "x", &xVal), ANI_OK);
    ASSERT_EQ(xVal, 4);

    ani_int yVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "y", &yVal), ANI_OK);
    ASSERT_EQ(yVal, 5);
    return ANI_TRUE;
}

ani_int test_CallMethod_ReturnInt([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteConcreteFromAbstract", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_method computeMethod{};
    ASSERT_EQ(env->Class_FindMethod(cls, "compute", "i:i", &computeMethod), ANI_OK);

    ani_int result{};
    ASSERT_EQ(env->Object_CallMethod_Int(obj, computeMethod, &result, 5), ANI_OK);
    ASSERT_EQ(result, 15);
    return ANI_TRUE;
}

ani_int test_CallMethod_Static([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteMethodForms", &cls), ANI_OK);

    ani_static_method staticMethod{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "staticMethod", "i:i", &staticMethod), ANI_OK);

    ani_int result{};
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, staticMethod, &result, 5), ANI_OK);
    ASSERT_EQ(result, 5);
    return ANI_TRUE;
}

ani_int test_CallMethod_Override([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteMethodOverride", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_method method{};
    ASSERT_EQ(env->Class_FindMethod(cls, "method", "i:i", &method), ANI_OK);

    ani_int result{};
    ASSERT_EQ(env->Object_CallMethod_Int(obj, method, &result, 1), ANI_OK);
    ASSERT_EQ(result, 2); // Override returns value + 1
    return ANI_TRUE;
}

ani_int test_CallMethod_SelfReturn([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteMethodForms", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_method selfMethod{};
    ASSERT_EQ(env->Class_FindMethod(cls, "self", ":C{entry.src.main.src.ets.Index.ClassDefCompleteMethodForms}", &selfMethod), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, selfMethod, &resultRef), ANI_OK);
    ASSERT_NE(resultRef, nullptr);

    // Verify that the returned reference is the same object
    ani_boolean isEqual = ANI_FALSE;
    ASSERT_EQ(env->Reference_StrictEquals(static_cast<ani_ref>(obj), resultRef, &isEqual), ANI_OK);
    ASSERT_EQ(isEqual, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_CallMethodByName_Instance([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, 3, 4), ANI_OK);

    ASSERT_EQ(env->Object_CallMethodByName_Void(obj, "move", "ii:", 1, 1), ANI_OK);

    ani_int xVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "x", &xVal), ANI_OK);
    ASSERT_EQ(xVal, 4);
    return ANI_TRUE;
}

ani_int test_CallMethodByName_Static([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &cls), ANI_OK);

    ani_static_method getStaticMethod{};
    ASSERT_EQ(env->Class_FindStaticMethod(cls, "getStaticField", ":i", &getStaticMethod), ANI_OK);

    ani_int result{};
    ASSERT_EQ(env->Class_CallStaticMethod_Int(cls, getStaticMethod, &result), ANI_OK);
    ASSERT_EQ(result, 3);
    return ANI_TRUE;
}

ani_int test_CallMethod_Final([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj), ANI_OK);

    ani_method stableMethod{};
    ASSERT_EQ(env->Class_FindMethod(cls, "stableMethod", ":C{std.core.String}", &stableMethod), ANI_OK);

    ani_ref resultRef{};
    ASSERT_EQ(env->Object_CallMethod_Ref(obj, stableMethod, &resultRef), ANI_OK);
    ani_string resultStr = static_cast<ani_string>(resultRef);
    std::string result;
    ASSERT_EQ(GetStdString(env, resultStr, result), ANI_TRUE);
    ASSERT_STREQ(result.c_str(), "stable");
    return ANI_TRUE;
}

ani_int test_CallMethod_AbstractViaConcrete([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class concreteCls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteConcreteFromAbstract", &concreteCls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(concreteCls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(concreteCls, ctor, &obj), ANI_OK);

    // Call abstract method via concrete implementation
    ani_method computeMethod{};
    ASSERT_EQ(env->Class_FindMethod(concreteCls, "compute", "i:i", &computeMethod), ANI_OK);
    ani_int computeResult{};
    ASSERT_EQ(env->Object_CallMethod_Int(obj, computeMethod, &computeResult, 5), ANI_OK);
    ASSERT_EQ(computeResult, 15);

    // Call concrete method from abstract parent
    ani_method baseMethod{};
    ASSERT_EQ(env->Class_FindMethod(concreteCls, "getBaseValue", ":i", &baseMethod), ANI_OK);
    ani_int baseResult{};
    ASSERT_EQ(env->Object_CallMethod_Int(obj, baseMethod, &baseResult), ANI_OK);
    ASSERT_EQ(baseResult, 10);
    return ANI_TRUE;
}

ani_int test_CallMethod_VoidReturn([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, 3, 4), ANI_OK);

    ani_method moveMethod{};
    ASSERT_EQ(env->Class_FindMethod(cls, "move", "ii:", &moveMethod), ANI_OK);

    ani_status status = env->Object_CallMethod_Void(obj, moveMethod, 1, 1);
    ASSERT_EQ(status, ANI_OK);

    ani_int xVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "x", &xVal), ANI_OK);
    ASSERT_EQ(xVal, 4);
    return ANI_TRUE;
}

ani_int test_CallMethod_MultipleParams([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object) {
    ani_class cls{};
    ASSERT_EQ(env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor), ANI_OK);

    ani_object obj{};
    ASSERT_EQ(env->Object_New(cls, ctor, &obj, 5, 6), ANI_OK);

    ani_int xVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "x", &xVal), ANI_OK);
    ASSERT_EQ(xVal, 5);

    ani_int yVal{};
    ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "y", &yVal), ANI_OK);
    ASSERT_EQ(yVal, 6);
    return ANI_TRUE;
}

#endif // ARKTS_ANI_TEST_METHODCALLTEST_H
