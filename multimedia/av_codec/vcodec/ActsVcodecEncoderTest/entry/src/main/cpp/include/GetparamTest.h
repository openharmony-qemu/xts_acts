/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef GETPARAM_TEST_H
#define GETPARAM_TEST_H

napi_value VideoEncodeMseQp0100Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeMseQp0200Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeMseQp0300Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeMseQp0400Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeRepeat0100Test(napi_env env, napi_callback_info info);
napi_value PreProcess0100(napi_env env, napi_callback_info info);
napi_value PreProcess0200(napi_env env, napi_callback_info info);
napi_value PreProcess0300Test(napi_env env, napi_callback_info info);

extern void InitGetparamTest();
extern void TestTearDownGetparam();

#endif // GETPARAM_TEST_H
