/*
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
#ifndef HUKS_AUTH_API_TEST_H
#define HUKS_AUTH_API_TEST_H

#include <napi/native_api.h>

namespace HuksApiTest {
    napi_value UserAuthTypeTest_001(napi_env env, napi_callback_info info);
    napi_value UserAuthTypeTest_002(napi_env env, napi_callback_info info);
    napi_value UserAuthTypeTest_003(napi_env env, napi_callback_info info);
    napi_value UserAuthTypeTest_004(napi_env env, napi_callback_info info);
    napi_value AuthAccessTypeTest_001(napi_env env, napi_callback_info info);
    napi_value AuthAccessTypeTest_002(napi_env env, napi_callback_info info);
    napi_value AuthAccessTypeTest_003(napi_env env, napi_callback_info info);
    napi_value UserAuthModeTest_001(napi_env env, napi_callback_info info);
    napi_value UserAuthModeTest_002(napi_env env, napi_callback_info info);
    napi_value TagTest_012(napi_env env, napi_callback_info info);
    napi_value TagTest_013(napi_env env, napi_callback_info info);
    napi_value TagTest_014(napi_env env, napi_callback_info info);
    napi_value TagTest_015(napi_env env, napi_callback_info info);
    napi_value TagTest_016(napi_env env, napi_callback_info info);
    napi_value TagTest_021(napi_env env, napi_callback_info info);
    napi_value TagTest_026(napi_env env, napi_callback_info info);
}

#endif // HUKS_AUTH_API_TEST_H
