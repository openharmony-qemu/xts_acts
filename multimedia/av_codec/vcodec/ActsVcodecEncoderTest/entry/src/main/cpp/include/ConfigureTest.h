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

#ifndef CONFIGURE_TEST_H
#define CONFIGURE_TEST_H

napi_value VideoEncodeHevcCapability1800Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability4000Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability4400Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability4410Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability4700Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability4710Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability5000Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability5010Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability5020Test(napi_env env, napi_callback_info info);
napi_value VideoEncodeCapability5030Test(napi_env env, napi_callback_info info);
extern void InitConfigureTest();
extern void TestTearDownConfigure();

#endif // CONFIGURE_TEST_H
