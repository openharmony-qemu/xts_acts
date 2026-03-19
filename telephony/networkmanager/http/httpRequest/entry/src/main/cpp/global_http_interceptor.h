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
