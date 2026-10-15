/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 *
 * Weak stubs for ArkWeb_ErrorInfo APIs (api 26.0.1). Local CLI libohweb.so may
 * omit these exports while headers already declare them. Strong definitions from
 * device/CI libohweb override these at link time when present.
 */

#include <cstdint>
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_net_error_list.h"
#include "web/arkweb_error_code.h"

extern "C" {

__attribute__((weak)) void OH_ArkWeb_CreateErrorInfo(ArkWeb_ErrorInfo** errorInfo)
{
    if (errorInfo != nullptr) {
        *errorInfo = nullptr;
    }
}

__attribute__((weak)) void OH_ArkWeb_DestroyErrorInfo(ArkWeb_ErrorInfo* errorInfo)
{
    (void)errorInfo;
}

__attribute__((weak)) int32_t OH_ArkWebErrorInfo_SetCompleteIfNoResponse(
    ArkWeb_ErrorInfo* errorInfo, bool completeIfNoResponse)
{
    (void)completeIfNoResponse;
    return (errorInfo == nullptr) ? ARKWEB_INVALID_PARAM : ARKWEB_NET_OK;
}

__attribute__((weak)) bool OH_ArkWebErrorInfo_GetCompleteIfNoResponse(
    const ArkWeb_ErrorInfo* errorInfo)
{
    return errorInfo != nullptr;
}

__attribute__((weak)) int32_t OH_ArkWebErrorInfo_SetCustomErrorCode(
    ArkWeb_ErrorInfo* errorInfo, int32_t errorCode)
{
    (void)errorCode;
    return (errorInfo == nullptr) ? ARKWEB_INVALID_PARAM : ARKWEB_NET_OK;
}

__attribute__((weak)) int32_t OH_ArkWebErrorInfo_GetCustomErrorCode(
    const ArkWeb_ErrorInfo* errorInfo)
{
    (void)errorInfo;
    return 0;
}

__attribute__((weak)) int32_t OH_ArkWebErrorInfo_SetErrorCode(
    ArkWeb_ErrorInfo* errorInfo, ArkWeb_NetError errorCode)
{
    (void)errorCode;
    return (errorInfo == nullptr) ? ARKWEB_INVALID_PARAM : ARKWEB_NET_OK;
}

__attribute__((weak)) ArkWeb_NetError OH_ArkWebErrorInfo_GetErrorCode(
    const ArkWeb_ErrorInfo* errorInfo)
{
    (void)errorInfo;
    return ARKWEB_NET_OK;
}

__attribute__((weak)) int32_t OH_ArkWebResponse_SetErrorInfo(
    ArkWeb_Response* response, ArkWeb_ErrorInfo* errorInfo)
{
    return (response == nullptr || errorInfo == nullptr) ? ARKWEB_INVALID_PARAM : ARKWEB_NET_OK;
}

__attribute__((weak)) ArkWeb_ErrorInfo* OH_ArkWebResponse_GetErrorInfo(
    const ArkWeb_Response* response)
{
    (void)response;
    return nullptr;
}

__attribute__((weak)) int32_t OH_ArkWebResourceHandler_DidFailWithErrorInfo(
    const ArkWeb_ResourceHandler* resourceHandler, const ArkWeb_ErrorInfo* errorInfo)
{
    return (resourceHandler == nullptr || errorInfo == nullptr) ?
        ARKWEB_INVALID_PARAM : ARKWEB_NET_OK;
}

} // extern "C"
