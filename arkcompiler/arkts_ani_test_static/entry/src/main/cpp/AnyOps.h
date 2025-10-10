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

#ifndef ARKTS_ANI_TEST_ANYOPS_H
#define ARKTS_ANI_TEST_ANYOPS_H
#include "Common.h"

ani_int GetMethod([[maybe_unused]] ani_env *env_, const char *fnName, ani_module *mdResult, ani_function *fnResult)
{
    ani_module md{};
    ASSERT_EQ(env_->FindModule("entry.src.main.src.ets.AnyOps", &md), ANI_OK);
    ASSERT_NE(md, nullptr);

    ani_function fn{};
    ASSERT_EQ(env_->Module_FindFunction(md, fnName, ":C{escompat.Array}", &fn), ANI_OK);
    ASSERT_NE(fn, nullptr);

    *mdResult = md;
    *fnResult = fn;
    return ANI_TRUE;
}

ani_int test_Any_CallMethod([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *validName = "test";
    auto dummyRef = reinterpret_cast<ani_ref>(0x1234);
    ani_ref resultRef{};
    ASSERT_EQ(env_->Any_CallMethod(nullptr, validName, 0U, nullptr, &resultRef), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_CallMethod(dummyRef, nullptr, 0U, nullptr, &resultRef), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_CallMethod(dummyRef, validName, 0U, nullptr, nullptr), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_CallMethod(dummyRef, validName, 2U, nullptr, &resultRef), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_GetByIndex([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module md{};
    ani_function fn{};
    GetMethod(env, "getArray", &md, &fn);
    ani_ref arrayRef{};
    ASSERT_EQ(env->Function_Call_Ref(fn, &arrayRef), ANI_OK);
    ani_ref nameRefByIdx{};
    ASSERT_EQ(env->Any_GetByIndex(arrayRef, 0U, &nameRefByIdx), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_GetByValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Worker";
    ani_class cls{};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", "iC{std.core.String}:", &ctor), ANI_OK);
    std::string_view nameStr = "Leechy";
    ani_string strRef{};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);
    ani_object res{};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);
    ani_ref nameRef{};
    std::string_view fieldNameStr = "_name";
    ani_string filedNameRef{};
    ASSERT_EQ(env->String_NewUTF8(fieldNameStr.data(), fieldNameStr.size(), &filedNameRef), ANI_OK);
    ASSERT_EQ(env->Any_GetByValue(static_cast<ani_ref>(res), static_cast<ani_ref>(filedNameRef), &nameRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_GetProperty([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Student";
    ani_class cls{};
    ASSERT_EQ(env->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);
    std::string_view nameStr = "Leechy";
    ani_string strRef{};
    ASSERT_EQ(env->String_NewUTF8(nameStr.data(), nameStr.size(), &strRef), ANI_OK);

    ani_object res{};
    ASSERT_EQ(env->Object_New(cls, ctor, &res, ani_int(10U), strRef), ANI_OK);
    ani_ref nameRef{};
    ASSERT_EQ(env->Any_GetProperty(static_cast<ani_ref>(res), "name", &nameRef), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_InstanceOf([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const int32_t longStringSize = 10000U;
    std::string longString(longStringSize, 'a');
    ani_string strRef{};
    ASSERT_EQ(env_->String_NewUTF8(longString.c_str(), longString.size(), &strRef), ANI_OK);
    ani_class strType{};
    ani_class stdCoreObj{};
    ASSERT_EQ(env_->FindClass("std.core.String", &strType), ANI_OK);
    ASSERT_EQ(env_->FindClass("std.core.Object", &stdCoreObj), ANI_OK);
    ani_boolean instanceof = ANI_FALSE;
    ASSERT_EQ(env_->Any_InstanceOf(strRef, stdCoreObj, &instanceof), ANI_OK);
    ASSERT_EQ(instanceof, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_Any_New([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_ref dummy{};
    ani_ref result{};
    ASSERT_EQ(env_->Any_New(nullptr, 0U, nullptr, &result), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_New(dummy, 0U, nullptr, nullptr), ANI_INVALID_ARGS);
    std::array<ani_ref, 1U> args{};
    ASSERT_EQ(env_->Any_New(dummy, 0U, args.data(), &result), ANI_INVALID_ARGS);
    ASSERT_EQ(env_->Any_New(dummy, 1U, nullptr, &result), ANI_INVALID_ARGS);
    return ANI_TRUE;
}

ani_int test_Any_SetByIndex([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    ani_module md{};
    ani_function fn{};
    GetMethod(env_, "getNumericArray", &md, &fn);
    ani_ref arrayRef{};
    ASSERT_EQ(env_->Function_Call_Ref(fn, &arrayRef), ANI_OK);
    ani_class intCls{};
    ani_method intCtor{};
    ASSERT_EQ(env_->FindClass("std.core.Int", &intCls), ANI_OK);
    ASSERT_EQ(env_->Class_FindMethod(intCls, "<ctor>", "i:", &intCtor), ANI_OK);
    ani_object intObj{};
    ani_int intValue = 100U;
    ASSERT_EQ(env_->Object_New(intCls, intCtor, &intObj, intValue), ANI_OK);
    ASSERT_EQ(env_->Any_SetByIndex(arrayRef, 0U, static_cast<ani_ref>(intObj)), ANI_OK);
    ani_ref result{};
    ASSERT_EQ(env_->Any_GetByIndex(arrayRef, 0U, &result), ANI_OK);
    ani_int intResult = 0;
    ASSERT_EQ(env_->Object_CallMethodByName_Int(static_cast<ani_object>(result), "toInt", nullptr, &intResult),
              ANI_OK);
    ASSERT_EQ(intResult, intValue);
    return ANI_TRUE;
}

ani_int test_Any_SetByValue([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Student";
    ani_class cls{};
    ASSERT_EQ(env_->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view name = "Initial";
    ani_string nameRef{};
    ASSERT_EQ(env_->String_NewUTF8(name.data(), name.size(), &nameRef), ANI_OK);

    ani_object res{};
    ASSERT_EQ(env_->Object_New(cls, ctor, &res, ani_int(2U), nameRef), ANI_OK);

    std::string_view keyStr = "name";
    ani_string keyRef{};
    ASSERT_EQ(env_->String_NewUTF8(keyStr.data(), keyStr.size(), &keyRef), ANI_OK);

    std::string_view newValue = "Changed";
    ani_string newValueRef{};
    ASSERT_EQ(env_->String_NewUTF8(newValue.data(), newValue.size(), &newValueRef), ANI_OK);

    ASSERT_EQ(env_->Any_SetByValue(res, keyRef, newValueRef), ANI_OK);

    ani_ref result{};
    ASSERT_EQ(env_->Any_GetProperty(res, "name", &result), ANI_OK);
    return ANI_TRUE;
}

ani_int test_Any_SetProperty([[maybe_unused]] ani_env *env_, [[maybe_unused]] ani_object object)
{
    const char *clsName = "entry.src.main.src.ets.AnyOps.Student";
    ani_class cls{};
    ASSERT_EQ(env_->FindClass(clsName, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env_->Class_FindMethod(cls, "<ctor>", nullptr, &ctor), ANI_OK);

    std::string_view oldName = "Old";
    ani_string strRef{};
    ASSERT_EQ(env_->String_NewUTF8(oldName.data(), oldName.size(), &strRef), ANI_OK);

    ani_object res{};
    ASSERT_EQ(env_->Object_New(cls, ctor, &res, ani_int(1), strRef), ANI_OK);

    std::string_view newName = "Leechy";
    ani_string newStrRef{};
    ASSERT_EQ(env_->String_NewUTF8(newName.data(), newName.size(), &newStrRef), ANI_OK);

    ASSERT_EQ(env_->Any_SetProperty(res, "name", newStrRef), ANI_OK);

    ani_ref result{};
    ASSERT_EQ(env_->Any_GetProperty(res, "name", &result), ANI_OK);
    return ANI_TRUE;
}
#endif // ARKTS_ANI_TEST_ANYOPS_H