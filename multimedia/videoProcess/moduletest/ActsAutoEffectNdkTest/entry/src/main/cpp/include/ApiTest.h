/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#ifndef ACTSAUTOEFFECTNDKTEST_APITEST_H
#define ACTSAUTOEFFECTNDKTEST_APITEST_H

#include "napi/native_api.h"
#include <cstdint>

extern const char* const XCOMPONENT_NAME_ID;
extern const char* const XCOMPONENT_NAME_ID2;

int32_t AutoEffectApiTest00100();
int32_t AutoEffectApiTest00200();
int32_t AutoEffectApiTest00300();
int32_t AutoEffectApiTest00400();
int32_t AutoEffectApiTest00500();
int32_t AutoEffectApiTest00600();
int32_t AutoEffectApiTest00700();
int32_t AutoEffectApiTest00800();
int32_t AutoEffectApiTest00900();
int32_t AutoEffectApiTest01000();
int32_t AutoEffectApiTest01100();
int32_t AutoEffectApiTest01200();
int32_t AutoEffectApiTest01300();
int32_t AutoEffectApiTest01400();
int32_t AutoEffectApiTest01500();
int32_t AutoEffectApiTest01600();
int32_t AutoEffectApiTest01700();
int32_t AutoEffectApiTest01800();
int32_t AutoEffectApiTest01900();
int32_t AutoEffectApiTest02000();
int32_t AutoEffectApiTest02100();
int32_t AutoEffectApiTest02200();
int32_t AutoEffectApiTest02300();
int32_t AutoEffectApiTest02500();
int32_t AutoEffectApiTest02600();
int32_t AutoEffectApiTest02700();
int32_t AutoEffectApiTest02900();
int32_t AutoEffectApiTest03000();

napi_value GetXComponentNameId(napi_env env, napi_callback_info info);
napi_value GetXComponentNameId2(napi_env env, napi_callback_info info);

extern void InitApiTest();
extern void TestTearDownApi();

#endif // ACTSAUTOEFFECTNDKTEST_APITEST_H
