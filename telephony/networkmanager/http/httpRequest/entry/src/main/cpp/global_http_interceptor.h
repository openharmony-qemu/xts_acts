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

//
// Created on 2026/3/11.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

//#include <stdint.h>
//#ifdef __cplusplus
//#include <cstddef>
//#else
//#include <stddef.h>
//#endif

#include <stdint.h>
#include <stddef.h>

#include "network/netstack/http_interceptor.h"

#ifndef HTTPREQUEST_GLOBAL_HTTP_INTERCEPTOR_H
#define HTTPREQUEST_GLOBAL_HTTP_INTERCEPTOR_H
int32_t AddReadOnlyRequestInterceptor(int32_t groupId, int32_t enabled);
int32_t AddReadOnlyResponseInterceptor(int32_t groupId, int32_t enabled);
int32_t AddWritableRequestInterceptor(int32_t groupId, int32_t enabled);
int32_t AddWritableResponseInterceptor(int32_t groupId, int32_t enabled);
int32_t StopAllInterceptor(int32_t groupId);
int32_t StartAllInterceptor(int32_t groupId);
int32_t RemoveAllInterceptor(int32_t groupId);
int32_t RemoveRequestInterceptor(int32_t groupId);
int32_t RemoveResponseInterceptor(int32_t groupId);


const char* GetRequestUrl();
const char* GetRequestMethod();
const char* GetRequestBody();
const char* GetRequestHeader();
const char* GetResponseBody();
const char* GetResponseHeader();
int16_t GetResponseCode();



#endif //HTTPREQUEST_GLOBAL_HTTP_INTERCEPTOR_H
