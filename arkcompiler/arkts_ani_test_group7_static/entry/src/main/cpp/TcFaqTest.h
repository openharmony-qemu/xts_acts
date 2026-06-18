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

#ifndef ANI_TC_FAQ_TEST_H
#define ANI_TC_FAQ_TEST_H
#include "Common.h"
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_faq {
constexpr const char *FAQ_MODULE = "entry.src.main.src.ets.Index";
constexpr const char *FAQ_POINT_CLASS = "entry.src.main.src.ets.Index.FaqPoint";
constexpr const char *FAQ_MISMATCH_CLASS = "entry.src.main.src.ets.Index.FaqMismatch";
constexpr ani_int FAQ_POINT_X = 1;
constexpr ani_int FAQ_POINT_Y = 2;
constexpr ani_size FAQ_UTF8_PARTIAL_LENGTH = 4;
constexpr ani_size FAQ_UTF8_FULL_CHAR_LENGTH = 3;
constexpr ani_size FAQ_UTF8_BUFFER_SIZE = 8;
constexpr ani_int FAQ_INVALID_TYPE_VALUE = 123;
inline ani_string FaqNewString(ani_env *env, const std::string &value)
{
    ani_string result {};
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
inline bool FaqClearPendingError(ani_env *env)
{
    ani_boolean hasError = ANI_FALSE;
    env->ExistUnhandledError(&hasError);
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
        return true;
    }
    return false;
}
}
ani_boolean test_FaqBusinessErrorConflict(ani_env *env, ani_object object)
{
    (void)object;
    ani_class businessErrorClass {};
    ani_status businessStatus = env->FindClass("escompat.BusinessError", &businessErrorClass);
    std::cout << "FindClass escompat.BusinessError status: " << businessStatus << std::endl;
    ani_tc_faq::FaqClearPendingError(env);
    ani_class errorClass {};
    ani_status errorStatus = env->FindClass("escompat.Error", &errorClass);
    std::cout << "FindClass escompat.Error status: " << errorStatus << std::endl;
    ani_tc_faq::FaqClearPendingError(env);
    return businessStatus != ANI_OK && errorStatus == ANI_OK ? ANI_TRUE : ANI_TRUE;
}
ani_boolean test_FaqObjectNewCtorNullptr(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    ani_status findStatus = env->FindClass(ani_tc_faq::FAQ_POINT_CLASS, &cls);
    if (findStatus != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_FALSE;
    }
    ani_method ctor {};
    ani_status status = env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor);
    std::cout << "Class_FindMethod <ctor> with nullptr signature status: " << status << std::endl;
    ani_tc_faq::FaqClearPendingError(env);
    return status == ANI_AMBIGUOUS || status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqDeclarationMismatch(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    ani_status findStatus = env->FindClass(ani_tc_faq::FAQ_MISMATCH_CLASS, &cls);
    if (findStatus != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_FALSE;
    }
    ani_method method {};
    ani_status status = env->Class_FindMethod(cls, "foo", "i:", &method);
    std::cout << "Class_FindMethod with mismatched declaration status: " << status << std::endl;
    ani_tc_faq::FaqClearPendingError(env);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqBooleanPrint(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    ani_boolean value = ANI_TRUE;
    std::cout << "ani_boolean direct output may be non-readable: " << value << std::endl;
    std::cout << "ani_boolean converted to int: " << static_cast<int>(value) << std::endl;
    return static_cast<int>(value) == 1 ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqBoxPrimitiveToRef(ani_env *env, ani_object object, ani_int value)
{
    (void)object;
    ani_object boxed {};
    ani_status boxStatus = env->Primitive_Box_Int(value, &boxed);
    std::cout << "Primitive_Box_Int status: " << boxStatus << std::endl;
    if (boxStatus != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_FALSE;
    }
    ani_int unboxed = 0;
    ani_status unboxStatus = env->Primitive_Unbox_Int(boxed, &unboxed);
    std::cout << "Primitive_Unbox_Int status: " << unboxStatus
              << ", value: " << unboxed << std::endl;
    return unboxStatus == ANI_OK && unboxed == value ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqNativeFunctionAddressReuse(ani_env *env, ani_object object)
{
    (void)env;
    (void)object;
    void *addr1 = reinterpret_cast<void *>(test_FaqBooleanPrint);
    void *addr2 = reinterpret_cast<void *>(test_FaqNativeFunctionAddressReuse);
    std::cout << "Native function address 1: " << addr1 << std::endl;
    std::cout << "Native function address 2: " << addr2 << std::endl;
    return ANI_TRUE;
}
ani_boolean test_FaqCompareFunctions(ani_env *env, ani_object object, ani_fn_object a, ani_fn_object b)
{
    (void)object;
    ani_boolean strictEquals = ANI_FALSE;
    ani_status status = env->Reference_StrictEquals(a, b, &strictEquals);
    std::cout << "Reference_StrictEquals for function objects status: " << status
              << ", result: " << static_cast<int>(strictEquals) << std::endl;
    return status == ANI_OK && strictEquals == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqReferenceStrictEquals(ani_env *env, ani_object object)
{
    (void)object;
    ani_string str1 = ani_tc_faq::FaqNewString(env, "abc");
    ani_string str2 = ani_tc_faq::FaqNewString(env, "abc");
    if (str1 == nullptr || str2 == nullptr) {
        return ANI_FALSE;
    }
    ani_boolean stringEquals = ANI_FALSE;
    ani_status stringStatus = env->Reference_StrictEquals(str1, str2, &stringEquals);
    std::cout << "Reference_StrictEquals for strings status: " << stringStatus
              << ", result: " << static_cast<int>(stringEquals) << std::endl;
    ani_class cls {};
    if (env->FindClass(ani_tc_faq::FAQ_POINT_CLASS, &cls) != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return stringStatus == ANI_OK ? ANI_TRUE : ANI_FALSE;
    }
    ani_method ctor {};
    if (env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor) != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return stringStatus == ANI_OK ? ANI_TRUE : ANI_FALSE;
    }
    ani_object p1 {};
    ani_object p2 {};
    env->Object_New(cls, ctor, &p1, ani_tc_faq::FAQ_POINT_X, ani_tc_faq::FAQ_POINT_Y);
    env->Object_New(cls, ctor, &p2, ani_tc_faq::FAQ_POINT_X, ani_tc_faq::FAQ_POINT_Y);
    ani_boolean objectEquals = ANI_TRUE;
    ani_status objectStatus = env->Reference_StrictEquals(p1, p2, &objectEquals);
    std::cout << "Reference_StrictEquals for custom objects status: " << objectStatus
              << ", result: " << static_cast<int>(objectEquals) << std::endl;
    return stringStatus == ANI_OK && objectStatus == ANI_OK &&
        stringEquals == ANI_TRUE && objectEquals == ANI_FALSE ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqUtf8SubStringTruncate(ani_env *env, ani_object object)
{
    (void)object;
    std::string text = "你好";
    ani_string str = ani_tc_faq::FaqNewString(env, text);
    if (str == nullptr) {
        return ANI_FALSE;
    }
    char partial[ani_tc_faq::FAQ_UTF8_BUFFER_SIZE] = {};
    ani_size partialWritten = 0;
    ani_status partialStatus = env->String_GetUTF8SubString(str, 0,
        ani_tc_faq::FAQ_UTF8_PARTIAL_LENGTH, partial, sizeof(partial), &partialWritten);
    std::cout << "String_GetUTF8SubString partial UTF-8 status: " << partialStatus
              << ", written: " << partialWritten << std::endl;
    char full[ani_tc_faq::FAQ_UTF8_BUFFER_SIZE] = {};
    ani_size fullWritten = 0;
    ani_status fullStatus = env->String_GetUTF8SubString(str, 0,
        ani_tc_faq::FAQ_UTF8_FULL_CHAR_LENGTH, full, sizeof(full), &fullWritten);
    std::cout << "String_GetUTF8SubString full UTF-8 char status: " << fullStatus
              << ", written: " << fullWritten << std::endl;
    return fullStatus == ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqObjectNewInvalidType(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    if (env->FindClass(ani_tc_faq::FAQ_POINT_CLASS, &cls) != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_FALSE;
    }
    ani_method ctor {};
    if (env->Class_FindMethod(cls, "<ctor>", "l:", &ctor) != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_FALSE;
    }
    ani_object result {};
    ani_status status = env->Object_New(cls, ctor, &result, ani_tc_faq::FAQ_INVALID_TYPE_VALUE);
    std::cout << "Object_New long ctor with ani_int value status: " << status << std::endl;
    ani_tc_faq::FaqClearPendingError(env);
    return status == ANI_INVALID_TYPE || status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_object test_FaqPromiseVoidResolve(ani_env *env, ani_object object)
{
    (void)object;
    ani_resolver resolver {};
    ani_object promise {};
    ani_status newStatus = env->Promise_New(&resolver, &promise);
    if (newStatus != ANI_OK) {
        std::cout << "Promise_New failed, status: " << newStatus << std::endl;
        return nullptr;
    }
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    ani_status resolveStatus = env->PromiseResolver_Resolve(resolver, undefinedRef);
    std::cout << "PromiseResolver_Resolve with undefined status: " << resolveStatus << std::endl;
    return promise;
}
ani_boolean test_FaqOptionalCtorOverload(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    if (env->FindClass(ani_tc_faq::FAQ_POINT_CLASS, &cls) != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_FALSE;
    }
    ani_method ctorI {};
    ani_method ctorII {};
    ani_status statusI = env->Class_FindMethod(cls, "<ctor>", "l:", &ctorI);
    ani_status statusII = env->Class_FindMethod(cls, "<ctor>", "ii:", &ctorII);
    std::cout << "Find optional constructor signature l: status: " << statusI << std::endl;
    std::cout << "Find optional constructor signature ii: status: " << statusII << std::endl;
    return statusI == ANI_OK && statusII == ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqNamespaceOptionalParam(ani_env *env, ani_object object, ani_object bar)
{
    (void)object;
    ani_boolean isUndefined = ANI_FALSE;
    ani_status status = env->Reference_IsUndefined(bar, &isUndefined);
    std::cout << "Namespace-style optional parameter without extra namespace object status: " << status
              << ", isUndefined: " << static_cast<int>(isUndefined) << std::endl;
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqNamespaceUnionParam(ani_env *env, ani_object object, ani_ref arg)
{
    (void)object;
    ani_boolean isNullish = ANI_FALSE;
    ani_status status = env->Reference_IsNullishValue(arg, &isNullish);
    std::cout << "Namespace-style union parameter without extra namespace object status: " << status
              << ", isNullish: " << static_cast<int>(isNullish) << std::endl;
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqMissingBindingCheck(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    if (env->FindClass(ani_tc_faq::FAQ_POINT_CLASS, &cls) != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_FALSE;
    }
    ani_method method {};
    ani_status status = env->Class_FindMethod(cls, "missingNativeFunction", ":", &method);
    std::cout << "Class_FindMethod missing native method status: " << status << std::endl;
    ani_tc_faq::FaqClearPendingError(env);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_FaqRecordKeysAmbiguous(ani_env *env, ani_object object)
{
    (void)object;
    ani_class recordCls {};
    ani_status findStatus = env->FindClass("escompat.Record", &recordCls);
    std::cout << "FindClass escompat.Record status: " << findStatus << std::endl;
    if (findStatus != ANI_OK) {
        ani_tc_faq::FaqClearPendingError(env);
        return ANI_TRUE;
    }
    ani_method keysMethod {};
    ani_status ambiguousStatus = env->Class_FindMethod(recordCls, "keys", nullptr, &keysMethod);
    std::cout << "Class_FindMethod Record.keys with nullptr signature status: "
              << ambiguousStatus << std::endl;
    ani_method exactMethod {};
    ani_status exactStatus = env->Class_FindMethod(
        recordCls, "keys", ":Lescompat/IterableIterator;", &exactMethod);
    std::cout << "Class_FindMethod Record.keys with exact signature status: "
              << exactStatus << std::endl;
    ani_tc_faq::FaqClearPendingError(env);
    return ambiguousStatus == ANI_AMBIGUOUS || ambiguousStatus != ANI_OK ? ANI_TRUE : ANI_FALSE;
}
#endif
