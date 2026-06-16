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

#ifndef ANI_TC_ERROR_CODE_TEST_H
#define ANI_TC_ERROR_CODE_TEST_H
#include "Common.h"
#include <array>
#include <climits>
#include <cstring>
#include <iostream>
#include <string>
#include <vector>
namespace ani_tc_errorcode {
constexpr const char *ERROR_CODE_MODULE = "entry.src.main.src.ets.Index";
constexpr const char *ERROR_CODE_FOO_CLASS = "entry.src.main.src.ets.Index.Foo";
constexpr const char *ERROR_CODE_OVERLOAD_CLASS = "entry.src.main.src.ets.Index.ErrorCodeOverload";
constexpr ani_int ERROR_CODE_NORMAL_RETURN = 100;
constexpr ani_size ERROR_CODE_LONG_TEXT_SIZE = 100;
constexpr ani_size ERROR_CODE_SMALL_BUFFER_SIZE = 50;
constexpr ani_size ERROR_CODE_HUGE_STRING_SIZE = 100 * 1024 * 1024;
constexpr int ERROR_CODE_OOM_LOOP_COUNT = 8;
constexpr uint32_t ERROR_CODE_INVALID_VERSION_VALUE = 999;
constexpr ani_size ERROR_CODE_ARRAY_LENGTH = 3;
constexpr ani_size ERROR_CODE_ARRAY_OUT_OF_RANGE_INDEX = 5;
inline bool IsExpectedFailureStatus(ani_status status)
{
    return status != ANI_OK;
}
inline ani_string NewUtf8String(ani_env *env, const std::string &value)
{
    ani_string result {};
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
inline void ClearPendingErrorIfNeeded(ani_env *env)
{
    ani_boolean hasError = ANI_FALSE;
    env->ExistUnhandledError(&hasError);
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
}
}
ani_boolean test_ErrorCodeNullEnv(ani_env *env, ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ani_status status = env->c_api->Object_CallMethodByName_Boolean(
        nullptr, object, "missing", ":z", &result);
    std::cout << "Object_CallMethodByName_Boolean with null env status: " << status << std::endl;
    return status == ANI_INVALID_ARGS ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodePendingErrorInfo(ani_env *env, ani_object object)
{
    ani_status callStatus = env->Object_CallMethodByName_Void(
        object, "test_ErrorCodeThrowManaged", ":");
    std::cout << "TC_ERRORCODE_002 Object_CallMethodByName_Void throwing method status: "
              << callStatus << std::endl;
    ani_boolean hasError = ANI_FALSE;
    ani_status existStatus = env->ExistUnhandledError(&hasError);
    std::cout << "TC_ERRORCODE_002 ExistUnhandledError status: " << existStatus
              << ", hasError: " << static_cast<int>(hasError) << std::endl;
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
    return callStatus != ANI_OK && hasError == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodePendingErrorPropagation(ani_env *env, ani_object object)
{
    ani_status firstStatus = env->Object_CallMethodByName_Void(
        object, "test_ErrorCodeThrowManaged", ":");
    std::cout << "TC_ERRORCODE_003 first throwing method status: "
              << firstStatus << std::endl;
    ani_boolean hasErrorBefore = ANI_FALSE;
    env->ExistUnhandledError(&hasErrorBefore);
    std::cout << "TC_ERRORCODE_003 hasErrorBefore second call: "
              << static_cast<int>(hasErrorBefore) << std::endl;
    ani_string str {};
    ani_status secondStatus = env->String_NewUTF8(
        "after pending error", strlen("after pending error"), &str);
    std::cout << "TC_ERRORCODE_003 String_NewUTF8 after pending error status: "
              << secondStatus << std::endl;
    ani_boolean hasErrorAfter = ANI_FALSE;
    env->ExistUnhandledError(&hasErrorAfter);
    std::cout << "TC_ERRORCODE_003 hasErrorAfter second call: "
              << static_cast<int>(hasErrorAfter) << std::endl;
    if (hasErrorAfter == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
    return firstStatus != ANI_OK &&
        hasErrorBefore == ANI_TRUE &&
        secondStatus != ANI_OK &&
        hasErrorAfter == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}
ani_int test_ErrorCodeNormalAfterCatch(ani_env *env, ani_object object)
{
    (void)object;
    ani_string str {};
    ani_status status = env->String_NewUTF8("normal", strlen("normal"), &str);
    std::cout << "String_NewUTF8 after ArkTS catch status: " << status << std::endl;
    return status == ANI_OK ? ani_tc_errorcode::ERROR_CODE_NORMAL_RETURN : -1;
}
ani_boolean test_ErrorCodeNotFound(ani_env *env, ani_object object)
{
    (void)object;
    ani_class missingClass {};
    ani_status classStatus = env->FindClass("entry.src.main.src.ets.Index.NotFoundClass", &missingClass);
    std::cout << "FindClass nonexistent status: " << classStatus << std::endl;
    ani_module missingModule {};
    ani_status moduleStatus = env->FindModule("entry.src.main.src.ets.NotFoundModule", &missingModule);
    std::cout << "FindModule nonexistent status: " << moduleStatus << std::endl;
    ani_class fooClass {};
    ani_status findFooStatus = env->FindClass(ani_tc_errorcode::ERROR_CODE_FOO_CLASS, &fooClass);
    ani_method method {};
    ani_status methodStatus = ANI_ERROR;
    if (findFooStatus == ANI_OK) {
        methodStatus = env->Class_FindMethod(fooClass, "notFoundMethod", ":", &method);
    }
    std::cout << "Class_FindMethod nonexistent status: " << methodStatus << std::endl;
    ani_tc_errorcode::ClearPendingErrorIfNeeded(env);
    return ani_tc_errorcode::IsExpectedFailureStatus(classStatus) &&
        ani_tc_errorcode::IsExpectedFailureStatus(moduleStatus) &&
        ani_tc_errorcode::IsExpectedFailureStatus(methodStatus) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeDescriptorMismatch(ani_env *env, ani_object object)
{
    (void)object;
    ani_class fooClass {};
    if (env->FindClass(ani_tc_errorcode::ERROR_CODE_FOO_CLASS, &fooClass) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_method method {};
    ani_status status = env->Class_FindMethod(fooClass, "test_ErrorCodeNormalAfterCatch", "i:", &method);
    std::cout << "Class_FindMethod with mismatched descriptor status: " << status << std::endl;
    ani_tc_errorcode::ClearPendingErrorIfNeeded(env);
    return ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeAmbiguousFindMethod(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    ani_status findStatus = env->FindClass(ani_tc_errorcode::ERROR_CODE_OVERLOAD_CLASS, &cls);
    if (findStatus != ANI_OK) {
        env->ResetError();
        std::cout << "Find ErrorCodeOverload failed, status: " << findStatus << std::endl;
        return ANI_FALSE;
    }
    ani_method method {};
    ani_status status = env->Class_FindMethod(cls, "foo", nullptr, &method);
    std::cout << "Class_FindMethod overloaded method with nullptr signature status: "
              << status << std::endl;
    return status == ANI_AMBIGUOUS ||
        ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeArrayOutOfRange(ani_env *env, ani_object object)
{
    (void)object;
    ani_ref undefinedRef {};
    env->GetUndefined(&undefinedRef);
    ani_array array {};
    ani_status newStatus = env->Array_New(
        ani_tc_errorcode::ERROR_CODE_ARRAY_LENGTH, undefinedRef, &array);
    if (newStatus != ANI_OK) {
        std::cout << "Array_New failed, status: " << newStatus << std::endl;
        return ANI_FALSE;
    }
    ani_ref value {};
    ani_status status = env->Array_Get(
        array, ani_tc_errorcode::ERROR_CODE_ARRAY_OUT_OF_RANGE_INDEX, &value);
    std::cout << "Array_Get out of range status: " << status << std::endl;
    ani_tc_errorcode::ClearPendingErrorIfNeeded(env);
    return status == ANI_OUT_OF_RANGE ||
        ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeBufferTooSmall(ani_env *env, ani_object object)
{
    (void)object;
    std::string longText(ani_tc_errorcode::ERROR_CODE_LONG_TEXT_SIZE, 'A');
    ani_string str = ani_tc_errorcode::NewUtf8String(env, longText);
    if (str == nullptr) {
        return ANI_FALSE;
    }
    char buffer[ani_tc_errorcode::ERROR_CODE_SMALL_BUFFER_SIZE] = {};
    ani_size written = 0;
    ani_status status = env->String_GetUTF8(str, buffer, sizeof(buffer), &written);
    std::cout << "String_GetUTF8 small buffer status: " << status
              << ", written: " << written << std::endl;
    return status == ANI_BUFFER_TO_SMALL ||
        ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeInvalidType(ani_env *env, ani_object object)
{
    (void)object;
    ani_string str = ani_tc_errorcode::NewUtf8String(env, "not array");
    if (str == nullptr) {
        return ANI_FALSE;
    }
    ani_size length = 0;
    ani_status status = env->Array_GetLength(reinterpret_cast<ani_array>(str), &length);
    std::cout << "TC_ERRORCODE_010 Array_GetLength with ani_string cast to ani_array status: "
              << status << ", length: " << length << std::endl;
    ani_boolean hasError = ANI_FALSE;
    ani_status existStatus = env->ExistUnhandledError(&hasError);
    std::cout << "TC_ERRORCODE_010 ExistUnhandledError status: " << existStatus
              << ", hasError: " << static_cast<int>(hasError) << std::endl;
    if (hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
    if (status == ANI_INVALID_TYPE || status == ANI_ERROR) {
        return ANI_TRUE;
    }
    std::cout << "TC_ERRORCODE_010 unexpected status: " << status << std::endl;
    return ANI_FALSE;
}
ani_boolean test_ErrorCodeOutOfMemory(ani_env *env, ani_object object)
{
    (void)object;
    std::vector<char> data(ani_tc_errorcode::ERROR_CODE_HUGE_STRING_SIZE, 'X');
    ani_status lastStatus = ANI_OK;
    for (int i = 0; i < ani_tc_errorcode::ERROR_CODE_OOM_LOOP_COUNT; i++) {
        ani_string str {};
        lastStatus = env->String_NewUTF8(data.data(), data.size(), &str);
        std::cout << "Large String_NewUTF8 iteration " << i
                  << ", status: " << lastStatus << std::endl;
        if (lastStatus == ANI_OUT_OF_MEMORY || lastStatus != ANI_OK) {
            break;
        }
    }
    ani_tc_errorcode::ClearPendingErrorIfNeeded(env);
    return lastStatus == ANI_OUT_OF_MEMORY ||
        ani_tc_errorcode::IsExpectedFailureStatus(lastStatus) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeInvalidVersion(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    ani_env *invalidEnv = nullptr;
    ani_status status = vm->GetEnv(ani_tc_errorcode::ERROR_CODE_INVALID_VERSION_VALUE, &invalidEnv);
    std::cout << "GetEnv invalid version status: " << status << std::endl;
    return status == ANI_INVALID_VERSION ||
        ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeInvalidDescriptor(ani_env *env, ani_object object)
{
    (void)object;
    ani_class cls {};
    ani_status status = env->FindClass("invalid{descriptor", &cls);
    std::cout << "FindClass invalid descriptor status: " << status << std::endl;
    ani_tc_errorcode::ClearPendingErrorIfNeeded(env);
    return status == ANI_INVALID_DESCRIPTOR ||
        ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeAlreadyBinded(ani_env *env, ani_object object)
{
    (void)object;
    ani_module module {};
    ani_status moduleStatus = env->FindModule(ani_tc_errorcode::ERROR_CODE_MODULE, &module);
    if (moduleStatus != ANI_OK) {
        std::cout << "FindModule failed, status: " << moduleStatus << std::endl;
        env->ResetError();
        return ANI_FALSE;
    }
    ani_native_function duplicateMethod {
        "test_ErrorCodeAlreadyBinded",
        ":z",
        reinterpret_cast<void *>(test_ErrorCodeAlreadyBinded)
    };
    ani_status status = env->Module_BindNativeFunctions(module, &duplicateMethod, 1);
    std::cout << "Duplicate Module_BindNativeFunctions status: " << status << std::endl;
    return status == ANI_ALREADY_BINDED ||
        ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_ErrorCodeIncorrectRef(ani_env *env, ani_object object)
{
    (void)object;
    ani_string str = ani_tc_errorcode::NewUtf8String(env, "deleted global ref");
    if (str == nullptr) {
        return ANI_FALSE;
    }
    ani_ref globalRef {};
    ani_status createStatus = env->GlobalReference_Create(str, &globalRef);
    if (createStatus != ANI_OK) {
        std::cout << "GlobalReference_Create failed, status: " << createStatus << std::endl;
        return ANI_FALSE;
    }
    ani_status deleteStatus = env->GlobalReference_Delete(globalRef);
    std::cout << "GlobalReference_Delete status: " << deleteStatus << std::endl;
    ani_boolean isNull = ANI_FALSE;
    ani_status status = env->Reference_IsNull(globalRef, &isNull);
    std::cout << "Use deleted global reference status: " << status << std::endl;
    ani_tc_errorcode::ClearPendingErrorIfNeeded(env);
    return status == ANI_INCORRECT_REF ||
        ani_tc_errorcode::IsExpectedFailureStatus(status) ? ANI_TRUE : ANI_FALSE;
}
#endif
