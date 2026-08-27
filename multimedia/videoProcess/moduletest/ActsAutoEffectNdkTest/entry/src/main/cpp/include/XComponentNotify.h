/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef ACTSAUTOEFFECTNDKTEST_XCOMPONENTNOTIFY_H
#define ACTSAUTOEFFECTNDKTEST_XCOMPONENTNOTIFY_H

#include "napi/native_api.h"

#ifdef __cplusplus
extern "C" {
#endif
napi_value SetXComponentReadyCallback(napi_env env, napi_callback_info info);
void NotifyXComponentReady(bool ready);
void WaitForSurfaceReady(uint32_t timeoutMs);
napi_value NotifySurfaceReady(napi_env env, napi_callback_info info);

napi_value SetXComponentReadyCallback2(napi_env env, napi_callback_info info);
void NotifyXComponentReady2(bool ready);
void WaitForSurfaceReady2(uint32_t timeoutMs);
napi_value NotifySurfaceReady2(napi_env env, napi_callback_info info);

void SetCurrentXComponentName(const char* name);
void SetCurrentXComponentName2(const char* name);

napi_value GetCurrentXComponentName(napi_env env, napi_callback_info info);
napi_value GetCurrentXComponentName2(napi_env env, napi_callback_info info);
const char* GenerateXComponentName();
const char* GenerateXComponentName2();
void PrepareXComponent();
void PrepareXComponent2();

#ifdef __cplusplus
}
#endif

#endif