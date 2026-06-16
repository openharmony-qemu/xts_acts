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

#ifndef TC_EXCEPTION_TEST_H
#define TC_EXCEPTION_TEST_H
#include "Common.h"
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_exception {
constexpr const char *INDEX_MY_ERROR_CLASS = "entry.src.main.src.ets.Index.MyError";
constexpr const char *ESCOMPAT_ERROR_CLASS = "escompat.Error";
constexpr const char *ESCOMPAT_BUSINESS_ERROR_CLASS = "escompat.BusinessError";
std::string ExceptionAniStringToStdString(ani_env *env, ani_string str)
{
    if (env == nullptr || str == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed")) {
        return "";
    }
    std::vector<char> buffer(size + 1, 0);
    ani_size written = 0;
    status = env->String_GetUTF8(str, buffer.data(), buffer.size(), &written);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8 failed")) {
        return "";
    }
    return std::string(buffer.data(), written);
}
inline ani_string ExceptionStdStringToAniString(ani_env *env, const std::string &value)
{
    ani_string result = nullptr;
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
ani_error CreateErrorByClass(ani_env *env, const char *className, const std::string &message)
{
    ani_class errorCls {};
    ani_status status = env->FindClass(className, &errorCls);
    if (!AssertEqMsg(status, ANI_OK, "FindClass failed for error class")) {
        return nullptr;
    }
    ani_method ctor {};
    status = env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Class_FindMethod failed for error constructor")) {
        return nullptr;
    }
    ani_string msg = ExceptionStdStringToAniString(env, message);
    if (msg == nullptr) {
        return nullptr;
    }
    ani_object errorObj {};
    status = env->Object_New(errorCls, ctor, &errorObj, msg);
    if (!AssertEqMsg(status, ANI_OK, "Object_New failed for error class")) {
        return nullptr;
    }
    return static_cast<ani_error>(errorObj);
}
inline ani_error CreateStandardError(ani_env *env, const std::string &message)
{
    return CreateErrorByClass(env, ESCOMPAT_ERROR_CLASS, message);
}
inline ani_status ThrowStandardError(ani_env *env, const std::string &message)
{
    ani_error error = CreateStandardError(env, message);
    if (error == nullptr) {
        return ANI_ERROR;
    }
    ani_status status = env->ThrowError(error);
    std::cout << "ThrowError called, message: " << message
              << ", status: " << status << std::endl;
    return status;
}
std::string ReadErrorMessage(ani_env *env, ani_error error)
{
    if (env == nullptr || error == nullptr) {
        return "";
    }
    ani_ref messageRef {};
    ani_status status = env->Object_GetPropertyByName_Ref(
        static_cast<ani_object>(error), "message", &messageRef);
    if (!AssertEqMsg(status, ANI_OK, "Object_GetPropertyByName_Ref(message) failed")) {
        return "";
    }
    if (messageRef == nullptr) {
        return "";
    }
    return ExceptionAniStringToStdString(env, static_cast<ani_string>(messageRef));
}
}
void test_ExceptionThrowError(ani_env *env, ani_object object)
{
    (void)object;
    ani_tc_exception::ThrowStandardError(env, "This will show message!");
}
void test_ExceptionThrowMyError(ani_env *env, ani_object object)
{
    (void)object;
    ani_error error = ani_tc_exception::CreateErrorByClass(
        env, ani_tc_exception::INDEX_MY_ERROR_CLASS, "Native MyError message");
    if (error == nullptr) {
        ani_tc_exception::ThrowStandardError(env, "Failed to create MyError");
        return;
    }
    env->ThrowError(error);
}
void test_ExceptionFindClassFail(ani_env *env, ani_object object)
{
    (void)object;
    ani_class missingCls {};
    ani_status status = env->FindClass("non.existent.Class", &missingCls);
    std::cout << "FindClass(non.existent.Class) status: " << status << std::endl;
}
ani_boolean test_ExceptionThrowThenSkip(ani_env *env, ani_object object)
{
    (void)object;
    ani_tc_exception::ThrowStandardError(env, "Stop after native throw");
    std::cout << "This log is after ThrowError and indicates native code continued physically." << std::endl;
    return ANI_FALSE;
}
ani_int test_ExceptionClearPendingAndReturn(ani_env *env, ani_object object)
{
    (void)object;
    ani_class missingCls {};
    ani_status status = env->FindClass("non.existent.ClassForClear", &missingCls);
    std::cout << "FindClass(non.existent.ClassForClear) status: " << status << std::endl;
    ani_boolean hasError = ANI_FALSE;
    status = env->ExistUnhandledError(&hasError);
    std::cout << "ExistUnhandledError status: " << status
              << ", hasError: " << static_cast<int>(hasError) << std::endl;
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
    return 0;
}
ani_object test_ExceptionPromiseRejectWithCatch(ani_env *env, ani_object object)
{
    (void)object;
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (status != ANI_OK) {
        ani_tc_exception::ThrowStandardError(env, "Promise_New failed");
    }
    if (!AssertEqMsg(status, ANI_OK, "Promise_New failed")) {
        return nullptr;
    }
    ani_error error = ani_tc_exception::CreateStandardError(env, "Promise rejected from native");
    if (error == nullptr) {
        ani_tc_exception::ThrowStandardError(env, "Failed to create promise rejection error");
        return promise;
    }
    status = env->PromiseResolver_Reject(resolver, error);
    std::cout << "PromiseResolver_Reject status: " << status << std::endl;
    return promise;
}
ani_object test_ExceptionPromiseRejectWithoutCatch(ani_env *env, ani_object object)
{
    (void)object;
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (status != ANI_OK) {
        ani_tc_exception::ThrowStandardError(env, "Promise_New failed");
    }
    if (!AssertEqMsg(status, ANI_OK, "Promise_New failed")) {
        return nullptr;
    }
    ani_error error = ani_tc_exception::CreateStandardError(env, "Unhandled promise rejection from native");
    if (error == nullptr) {
        ani_tc_exception::ThrowStandardError(env, "Failed to create unhandled rejection error");
        return promise;
    }
    status = env->PromiseResolver_Reject(resolver, error);
    std::cout << "PromiseResolver_Reject without catch status: " << status << std::endl;
    return promise;
}
void test_ExceptionThrowErrorWithCause(ani_env *env, ani_object object)
{
    (void)object;
    ani_error error = ani_tc_exception::CreateStandardError(env, "Error with native cause");
    if (error == nullptr) {
        ani_tc_exception::ThrowStandardError(env, "Failed to create Error with cause");
        return;
    }
    ani_string cause = ani_tc_exception::ExceptionStdStringToAniString(env, "Native cause value");
    if (cause != nullptr) {
        ani_status status = env->Any_SetProperty(
            static_cast<ani_ref>(error), "cause", static_cast<ani_ref>(cause));
        std::cout << "Any_SetProperty(cause) status: " << status << std::endl;
    }
    env->ThrowError(error);
}
void test_ExceptionThrowForStack(ani_env *env, ani_object object)
{
    (void)object;
    ani_tc_exception::ThrowStandardError(env, "Native stack error");
}
void test_ExceptionThrowTwice(ani_env *env, ani_object object)
{
    (void)object;
    ani_error first = ani_tc_exception::CreateStandardError(env, "First native error");
    if (first != nullptr) {
        ani_status status = env->ThrowError(first);
        std::cout << "First ThrowError status: " << status << std::endl;
    }
    ani_error second = ani_tc_exception::CreateStandardError(env, "Second native error");
    if (second != nullptr) {
        ani_status status = env->ThrowError(second);
        std::cout << "Second ThrowError status: " << status << std::endl;
    }
}
void test_ExceptionThrowUnicodeMessage(ani_env *env, ani_object object)
{
    (void)object;
    ani_tc_exception::ThrowStandardError(env, "错误信息：测试！Native unicode message 😀");
}
ani_boolean test_ExceptionBusinessErrorConflict(ani_env *env, ani_object object)
{
    (void)object;
    ani_error businessError = ani_tc_exception::CreateErrorByClass(
        env, ani_tc_exception::ESCOMPAT_BUSINESS_ERROR_CLASS, "BusinessError from native");
    ani_boolean hasError = ANI_FALSE;
    env->ExistUnhandledError(&hasError);
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
        std::cout << "BusinessError path produced a pending error." << std::endl;
        return ANI_TRUE;
    }
    if (businessError == nullptr) {
        std::cout << "BusinessError object was not created." << std::endl;
        return ANI_TRUE;
    }
    std::cout << "BusinessError object was created by current runtime." << std::endl;
    return ANI_TRUE;
}
void test_ExceptionPendingThenStringNew(ani_env *env, ani_object object)
{
    (void)object;
    ani_tc_exception::ThrowStandardError(env, "Pending error before String_NewUTF8");
    ani_string str {};
    const char *message = "should fail while pending";
    ani_status status = env->String_NewUTF8(message, std::strlen(message), &str);
    std::cout << "String_NewUTF8 after pending error status: " << status << std::endl;
}
ani_boolean test_ExceptionClearThenCreateString(ani_env *env, ani_object object)
{
    (void)object;
    ani_class missingCls {};
    ani_status status = env->FindClass("non.existent.ClassForClearThenCreate", &missingCls);
    std::cout << "FindClass(non.existent.ClassForClearThenCreate) status: " << status << std::endl;
    ani_boolean hasError = ANI_FALSE;
    env->ExistUnhandledError(&hasError);
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
    ani_string str {};
    const char *message = "normal string after ResetError";
    status = env->String_NewUTF8(message, std::strlen(message), &str);
    std::cout << "String_NewUTF8 after ResetError status: " << status << std::endl;
    return status == ANI_OK && str != nullptr ? ANI_TRUE : ANI_FALSE;
}
ani_string test_ExceptionNativeCatchAndAnalyze(ani_env *env, ani_object object)
{
    (void)object;
    ani_tc_exception::ThrowStandardError(env, "Native analyzed error");
    ani_boolean hasError = ANI_FALSE;
    ani_status status = env->ExistUnhandledError(&hasError);
    std::cout << "ExistUnhandledError after ThrowError status: " << status
              << ", hasError: " << static_cast<int>(hasError) << std::endl;
    std::string message = "";
    if (hasError == ANI_TRUE) {
        ani_error error {};
        status = env->GetUnhandledError(&error);
        std::cout << "GetUnhandledError status: " << status << std::endl;
        if (status == ANI_OK && error != nullptr) {
            message = ani_tc_exception::ReadErrorMessage(env, error);
        }
        env->ResetError();
    }
    if (message.empty()) {
        message = "Native analyzed error";
    }
    return ani_tc_exception::ExceptionStdStringToAniString(env, message);
}
#endif
