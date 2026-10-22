/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "errorinfo_scheme_loop.h"

#include <atomic>
#include <cstring>
#include <mutex>

#include "errorinfo_runtime_api.h"
#include "web/arkweb_error_code.h"
#include "web/arkweb_net_error_list.h"
#include "web/arkweb_scheme_handler.h"

namespace {
constexpr const char *K_WEB_TAG = "errorinfo_web";
constexpr const char *K_SCHEME = "ei-fail";
constexpr int32_t K_RESULT_PENDING = -9999;
constexpr int32_t K_SCHEME_OPTION =
    ARKWEB_SCHEME_OPTION_STANDARD | ARKWEB_SCHEME_OPTION_CORS_ENABLED;

std::mutex g_resultMutex;
std::atomic<int32_t> g_didFailLiveResult{K_RESULT_PENDING};
ArkWeb_SchemeHandler *g_schemeHandler = nullptr;
bool g_schemesRegistered = false;
bool g_handlerReady = false;

void StoreDidFailResult(int32_t code)
{
    g_didFailLiveResult.store(code);
}

constexpr int32_t K_RESULT_API_MISSING = -8888;

void InvokeDidFailWithErrorInfo(const ArkWeb_ResourceHandler *resourceHandler)
{
    if (!LoadErrorInfoRuntimeApi()) {
        StoreDidFailResult(K_RESULT_API_MISSING);
        return;
    }
    const ErrorInfoRuntimeApi &api = GetErrorInfoRuntimeApi();
    ArkWeb_ErrorInfo *errorInfo = nullptr;
    api.createErrorInfo(&errorInfo);
    if (errorInfo == nullptr) {
        StoreDidFailResult(K_RESULT_API_MISSING);
        return;
    }
    (void)api.setErrorCode(errorInfo, ARKWEB_ERR_FAILED);
    (void)api.setCompleteIfNoResponse(errorInfo, true);
    int32_t ret = api.didFailWithErrorInfo(resourceHandler, errorInfo);
    api.destroyErrorInfo(errorInfo);
    StoreDidFailResult(ret);
}

void OnErrorInfoRequestStart(const ArkWeb_SchemeHandler *schemeHandler,
    ArkWeb_ResourceRequest *resourceRequest, const ArkWeb_ResourceHandler *resourceHandler,
    bool *intercept)
{
    (void)schemeHandler;
    (void)resourceRequest;
    if (intercept != nullptr) {
        *intercept = true;
    }
    if (resourceHandler == nullptr) {
        StoreDidFailResult(ARKWEB_INVALID_PARAM);
        return;
    }
    InvokeDidFailWithErrorInfo(resourceHandler);
}

void OnErrorInfoRequestStop(const ArkWeb_SchemeHandler *schemeHandler,
    const ArkWeb_ResourceRequest *resourceRequest)
{
    (void)schemeHandler;
    (void)resourceRequest;
}

napi_value MakeIntResult(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}
} // namespace

napi_value RegisterErrorInfoCustomSchemes(napi_env env, napi_callback_info info)
{
    (void)info;
    std::lock_guard<std::mutex> lock(g_resultMutex);
    if (g_schemesRegistered) {
        return MakeIntResult(env, ARKWEB_NET_OK);
    }
    int32_t ret = OH_ArkWeb_RegisterCustomSchemes(K_SCHEME, K_SCHEME_OPTION);
    if (ret == ARKWEB_NET_OK || ret == ARKWEB_SCHEME_REGISTER_FAILED) {
        g_schemesRegistered = true;
        ret = ARKWEB_NET_OK;
    }
    return MakeIntResult(env, ret);
}

napi_value SetupErrorInfoSchemeHandler(napi_env env, napi_callback_info info)
{
    (void)info;
    std::lock_guard<std::mutex> lock(g_resultMutex);
    if (g_handlerReady && g_schemeHandler != nullptr) {
        bool ok = OH_ArkWeb_SetSchemeHandler(K_SCHEME, K_WEB_TAG, g_schemeHandler);
        return MakeIntResult(env, ok ? ARKWEB_NET_OK : -1);
    }
    if (g_schemeHandler == nullptr) {
        OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    }
    if (g_schemeHandler == nullptr) {
        return MakeIntResult(env, -1);
    }
    int32_t startRet =
        OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnErrorInfoRequestStart);
    (void)OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnErrorInfoRequestStop);
    bool ok = OH_ArkWeb_SetSchemeHandler(K_SCHEME, K_WEB_TAG, g_schemeHandler);
    g_handlerReady = (startRet == ARKWEB_NET_OK) && ok;
    return MakeIntResult(env, g_handlerReady ? ARKWEB_NET_OK : -1);
}

napi_value ResetDidFailWithErrorInfoLiveResult(napi_env env, napi_callback_info info)
{
    (void)info;
    StoreDidFailResult(K_RESULT_PENDING);
    return MakeIntResult(env, ARKWEB_NET_OK);
}

napi_value GetDidFailWithErrorInfoLiveResult(napi_env env, napi_callback_info info)
{
    (void)info;
    return MakeIntResult(env, g_didFailLiveResult.load());
}

napi_value GetErrorInfoSchemeWebTag(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    napi_create_string_utf8(env, K_WEB_TAG, std::strlen(K_WEB_TAG), &result);
    return result;
}
