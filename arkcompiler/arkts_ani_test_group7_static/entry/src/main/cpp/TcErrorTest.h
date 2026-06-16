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

#ifndef ARKTS_ANI_TEST_TC_ERROR_TEST_H
#define ARKTS_ANI_TEST_TC_ERROR_TEST_H
#include "Common.h"
#include <iostream>
#include <string>
namespace ani_tc_error {
constexpr const char *ERROR_FIND_CLASS_NAME = "non.existent.IncompatibleOldAbcClass";
constexpr const char *ERROR_UNEXPECTED_FOUND_CLASS_MSG = "Unexpectedly found class";
constexpr const char *ERROR_FIND_CLASS_FAILED_MSG =
    "FindClass failed as expected. This simulates the LinkerUnresolvedClassError path.";
ani_string ErrorNewString(ani_env *env, const std::string &value)
{
    if (env == nullptr) {
        return nullptr;
    }
    ani_string result {};
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed in TcErrorTest")) {
        return nullptr;
    }
    return result;
}
}
ani_double errorAddWrongSignature(ani_env *env, ani_double a, ani_double b)
{
    (void)env;
    std::cout << "errorAddWrongSignature called, a: "
              << a << ", b: " << b << std::endl;
    return a + b;
}
ani_string simulateFindClassFailure(ani_env *env)
{
    ani_class cls {};
    ani_status status = env->FindClass(ani_tc_error::ERROR_FIND_CLASS_NAME, &cls);
    if (status == ANI_OK) {
        return ani_tc_error::ErrorNewString(
            env, ani_tc_error::ERROR_UNEXPECTED_FOUND_CLASS_MSG);
    }
    std::cout << "FindClass failed as expected, status: " << status << std::endl;
    ani_boolean hasError = ANI_FALSE;
    ani_status errorStatus = env->ExistUnhandledError(&hasError);
    if (errorStatus == ANI_OK && hasError == ANI_TRUE) {
        env->DescribeError();
        env->ResetError();
    }
    return ani_tc_error::ErrorNewString(
        env, ani_tc_error::ERROR_FIND_CLASS_FAILED_MSG);
}
#endif
