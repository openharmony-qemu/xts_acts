/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include <cstring>
#include <string>
#include "napi/native_api.h"
#include "hilog/log.h"
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_interface.h"
#include "web/native_interface_arkweb.h"

#define LOG_DOMAIN 0x0201
#define LOG_TAG "ArkWebCapiTest"
#define OH_LOG_INFO(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define OH_LOG_ERROR(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

// ========== 全局状态变量 ==========
static int32_t g_testResult = 0;
static bool g_callbackInvoked = false;

static napi_value CreateResult(napi_env env, int32_t resultCode)
{
    napi_value result;
    napi_create_int32(env, resultCode, &result);
    return result;
}

// ========== 回调函数 ==========
static void OnScrollCallbackImpl(const char* webTag, void* userData, double scrollX, double scrollY)
{
    g_callbackInvoked = true;
    OH_LOG_INFO(LOG_TAG, "OnScrollCallback invoked: webTag=%{public}s, scrollX=%{public}f, scrollY=%{public}f",
               webTag, scrollX, scrollY);
}

static void OnJavaScriptCallbackImpl(const char* result)
{
    g_callbackInvoked = true;
    OH_LOG_INFO(LOG_TAG, "OnJavaScriptCallback invoked: result=%{public}s", result);
}

static char* OnNativeJavaScriptProxyCallbackImpl(const char** argv, int32_t argc)
{
    g_callbackInvoked = true;
    return nullptr;
}

static void OnDestroyCallbackImpl(const char* webTag)
{
    g_callbackInvoked = true;
    OH_LOG_INFO(LOG_TAG, "OnDestroyCallback invoked: webTag=%{public}s", webTag);
}

static void OnCookieSaveCallbackImpl(ArkWeb_ErrorCode errorCode)
{
    g_callbackInvoked = true;
    g_testResult = static_cast<int32_t>(errorCode);
    OH_LOG_INFO(LOG_TAG, "OnCookieSaveCallback invoked: errorCode=%{public}d", errorCode);
}

static void OnCookieFetchCallbackImpl(ArkWeb_ErrorCode errorCode, char* cookieValue)
{
    g_callbackInvoked = true;
    g_testResult = static_cast<int32_t>(errorCode);
    OH_LOG_INFO(LOG_TAG, "OnCookieFetchCallback invoked: errorCode=%{public}d", errorCode);
    if (cookieValue) { OH_ArkWeb_ReleaseString(cookieValue); }
}

// ========== 测试函数 ==========

// ---- scroll ----

static napi_value TestArkWeb_RegisterScrollCallback(napi_env env, napi_callback_info info)
{
    bool ret = OH_ArkWeb_RegisterScrollCallback("test_tag", OnScrollCallbackImpl, nullptr);
    g_testResult = ret ? 0 : -1;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- request_header ----

static napi_value TestArkWebRequestHeaderList_Destroy(napi_env env, napi_callback_info info)
{
    OH_ArkWebRequestHeaderList_Destroy(nullptr);
    return CreateResult(env, 0);
}

static napi_value TestArkWebRequestHeaderList_GetHeader(napi_env env, napi_callback_info info)
{
    char* key = nullptr;
    char* value = nullptr;
    OH_ArkWebRequestHeaderList_GetHeader(nullptr, 0, &key, &value);
    return CreateResult(env, key == nullptr && value == nullptr ? 0 : -1);
}

// ---- resource_request ----

static napi_value TestArkWebResourceRequest_SetUserData(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebResourceRequest_SetUserData(nullptr, nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebResourceRequest_GetMethod(napi_env env, napi_callback_info info)
{
    char* method = nullptr;
    OH_ArkWebResourceRequest_GetMethod(nullptr, &method);
    return CreateResult(env, method == nullptr ? 0 : -1);
}

static napi_value TestArkWebResourceRequest_GetUrl(napi_env env, napi_callback_info info)
{
    char* url = nullptr;
    OH_ArkWebResourceRequest_GetUrl(nullptr, &url);
    return CreateResult(env, url == nullptr ? 0 : -1);
}

static napi_value TestArkWebResourceRequest_GetResourceType(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebResourceRequest_GetResourceType(nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebResourceRequest_GetFrameUrl(napi_env env, napi_callback_info info)
{
    char* frameUrl = nullptr;
    OH_ArkWebResourceRequest_GetFrameUrl(nullptr, &frameUrl);
    return CreateResult(env, frameUrl == nullptr ? 0 : -1);
}

static napi_value TestArkWebResourceRequest_Destroy(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebResourceRequest_Destroy(nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebResourceRequest_GetReferrer(napi_env env, napi_callback_info info)
{
    char* referrer = nullptr;
    OH_ArkWebResourceRequest_GetReferrer(nullptr, &referrer);
    return CreateResult(env, referrer == nullptr ? 0 : -1);
}

static napi_value TestArkWebResourceRequest_GetRequestHeaders(napi_env env, napi_callback_info info)
{
    ArkWeb_RequestHeaderList* headerList = nullptr;
    OH_ArkWebResourceRequest_GetRequestHeaders(nullptr, &headerList);
    return CreateResult(env, headerList == nullptr ? 0 : -1);
}

// ---- http_body_stream ----

static napi_value TestArkWebResourceRequest_GetHttpBodyStream(napi_env env, napi_callback_info info)
{
    ArkWeb_HttpBodyStream* bodyStream = nullptr;
    OH_ArkWebResourceRequest_GetHttpBodyStream(nullptr, &bodyStream);
    return CreateResult(env, bodyStream == nullptr ? 0 : -1);
}

static napi_value TestArkWebResourceRequest_DestroyHttpBodyStream(napi_env env, napi_callback_info info)
{
    OH_ArkWebResourceRequest_DestroyHttpBodyStream(nullptr);
    return CreateResult(env, 0);
}

static napi_value TestArkWebHttpBodyStream_SetUserData(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebHttpBodyStream_SetUserData(nullptr, nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebHttpBodyStream_SetReadCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebHttpBodyStream_SetReadCallback(nullptr, nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebHttpBodyStream_SetAsyncReadCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebHttpBodyStream_SetAsyncReadCallback(nullptr, nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebHttpBodyStream_Init(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebHttpBodyStream_Init(nullptr, nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebHttpBodyStream_Read(napi_env env, napi_callback_info info)
{
    uint8_t buffer[64] = {0};
    OH_ArkWebHttpBodyStream_Read(nullptr, buffer, sizeof(buffer));
    return CreateResult(env, 0);
}

static napi_value TestArkWebHttpBodyStream_GetSize(napi_env env, napi_callback_info info)
{
    uint64_t size = OH_ArkWebHttpBodyStream_GetSize(nullptr);
    g_testResult = static_cast<int32_t>(size);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebHttpBodyStream_GetPosition(napi_env env, napi_callback_info info)
{
    uint64_t pos = OH_ArkWebHttpBodyStream_GetPosition(nullptr);
    g_testResult = static_cast<int32_t>(pos);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- scheme_handler ----

static napi_value TestArkWebSchemeHandler_SetUserData(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebSchemeHandler_SetUserData(nullptr, nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- response ----

static napi_value TestArkWebResponse_GetHeaderByName(napi_env env, napi_callback_info info)
{
    ArkWeb_Response* response = nullptr;
    OH_ArkWeb_CreateResponse(&response);
    if (response == nullptr) {
        return CreateResult(env, -1);
    }
    char* value = nullptr;
    int32_t setResult = OH_ArkWebResponse_SetHeaderByName(response, "Content-Type", "text/plain", true);
    OH_ArkWebResponse_GetHeaderByName(response, "Content-Type", &value);
    bool valid = setResult == ARKWEB_SUCCESS && value != nullptr && std::strcmp(value, "text/plain") == 0;
    if (value != nullptr) {
        OH_ArkWeb_ReleaseString(value);
    }
    OH_ArkWeb_DestroyResponse(response);
    return CreateResult(env, valid ? 0 : -1);
}

// ---- resource_handler ----

static napi_value TestArkWebResourceHandler_Destroy(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebResourceHandler_Destroy(nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebResourceHandler_DidReceiveResponse(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebResourceHandler_DidReceiveResponse(nullptr, nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebResourceHandler_DidReceiveData(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebResourceHandler_DidReceiveData(nullptr, nullptr, 0);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestArkWebResourceHandler_DidFinish(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ArkWebResourceHandler_DidFinish(nullptr);
    g_testResult = ret;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- release ----

static napi_value TestArkWeb_ReleaseString(napi_env env, napi_callback_info info)
{
    ArkWeb_Response* response = nullptr;
    OH_ArkWeb_CreateResponse(&response);
    if (response == nullptr) {
        return CreateResult(env, -1);
    }
    OH_ArkWebResponse_SetHeaderByName(response, "X-Capi-Test", "release", true);
    char* value = nullptr;
    OH_ArkWebResponse_GetHeaderByName(response, "X-Capi-Test", &value);
    bool valid = value != nullptr && std::strcmp(value, "release") == 0;
    if (value != nullptr) {
        OH_ArkWeb_ReleaseString(value);
    }
    OH_ArkWeb_DestroyResponse(response);
    return CreateResult(env, valid ? 0 : -1);
}

static napi_value TestArkWeb_ReleaseByteArray(napi_env env, napi_callback_info info)
{
    OH_ArkWeb_ReleaseByteArray(nullptr);
    return CreateResult(env, 0);
}

// ---- native_js ----

static napi_value TestNativeArkWeb_RunJavaScript(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_RunJavaScript("test_tag", "console.log(\"hello\")", OnJavaScriptCallbackImpl);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- native_proxy ----

static napi_value TestNativeArkWeb_RegisterJavaScriptProxy(napi_env env, napi_callback_info info)
{
    const char* methodNames[] = {"method1", "method2"};
    NativeArkWeb_OnJavaScriptProxyCallback callbacks[] = {
        OnNativeJavaScriptProxyCallbackImpl, OnNativeJavaScriptProxyCallbackImpl
    };
    const size_t callbackCount = sizeof(callbacks) / sizeof(callbacks[0]);
    OH_NativeArkWeb_RegisterJavaScriptProxy("test_tag", "testObj", methodNames, callbacks, callbackCount, false);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_UnregisterJavaScriptProxy(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_UnregisterJavaScriptProxy("test_tag", "testObj");
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_SetJavaScriptProxyValidCallback(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetJavaScriptProxyValidCallback("test_tag", nullptr);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_GetJavaScriptProxyValidCallback(napi_env env, napi_callback_info info)
{
    auto cb = OH_NativeArkWeb_GetJavaScriptProxyValidCallback("test_tag");
    g_testResult = (cb == nullptr) ? 0 : -1;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy("test_tag", nullptr, nullptr);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- native_destroy ----

static napi_value TestNativeArkWeb_SetDestroyCallback(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetDestroyCallback("test_tag", OnDestroyCallbackImpl);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_GetDestroyCallback(napi_env env, napi_callback_info info)
{
    auto cb = OH_NativeArkWeb_GetDestroyCallback("test_tag");
    g_testResult = (cb == nullptr) ? 0 : -1;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- native_load ----

static napi_value TestNativeArkWeb_LoadData(napi_env env, napi_callback_info info)
{
    ArkWeb_ErrorCode ret = OH_NativeArkWeb_LoadData("test_tag", "<html><body>Hello</body></html>",
        "text/html", "UTF-8", nullptr, nullptr);
    g_testResult = static_cast<int32_t>(ret);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- native_blankless ----

static napi_value TestNativeArkWeb_SetBlanklessLoadingWithKey(napi_env env, napi_callback_info info)
{
    ArkWeb_BlanklessErrorCode ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey("test_tag", "test_key", true);
    g_testResult = static_cast<int32_t>(ret);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_ClearBlanklessLoadingCache(napi_env env, napi_callback_info info)
{
    const char* keys[] = {"key1", "key2"};
    const size_t keyCount = sizeof(keys) / sizeof(keys[0]);
    OH_NativeArkWeb_ClearBlanklessLoadingCache(keys, keyCount);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_GetBlanklessInfoWithKey(napi_env env, napi_callback_info info)
{
    ArkWeb_BlanklessInfo infoResult = OH_NativeArkWeb_GetBlanklessInfoWithKey("test_tag", "test_key");
    bool validError = infoResult.errCode == ARKWEB_BLANKLESS_SUCCESS ||
        infoResult.errCode == ARKWEB_BLANKLESS_ERR_UNKNOWN ||
        infoResult.errCode == ARKWEB_BLANKLESS_ERR_INVALID_ARGS ||
        infoResult.errCode == ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED ||
        infoResult.errCode == ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH ||
        infoResult.errCode == ARKWEB_BLANKLESS_ERR_SIGNIFICANT_CHANGE ||
        infoResult.errCode == ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT;
    return CreateResult(env, validError ? 0 : -1);
}

static napi_value TestNativeArkWeb_SetBlanklessLoadingCacheCapacity(napi_env env, napi_callback_info info)
{
    uint32_t ret = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(100);
    g_testResult = static_cast<int32_t>(ret);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- native_engine ----

static napi_value TestNativeArkWeb_SetActiveWebEngineVersion(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetActiveWebEngineVersion(ARKWEB_M114);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_GetActiveWebEngineVersion(napi_env env, napi_callback_info info)
{
    ArkWebEngineVersion ver = OH_NativeArkWeb_GetActiveWebEngineVersion();
    g_testResult = static_cast<int32_t>(ver);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_IsActiveWebEngineEvergreen(napi_env env, napi_callback_info info)
{
    bool ret = OH_NativeArkWeb_IsActiveWebEngineEvergreen();
    g_testResult = ret ? 1 : 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ---- native_cookie ----

static napi_value TestArkWebCookieManager_SaveCookieAsync(napi_env env, napi_callback_info info)
{
    OH_ArkWebCookieManager_SaveCookieAsync(OnCookieSaveCallbackImpl);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

// ========== 模块注册 ==========
#define NAPI_TEST_EXPORT(function) \
    { #function, nullptr, function, nullptr, nullptr, nullptr, napi_default, nullptr }

static napi_property_descriptor g_napiDescriptors[] = {
    NAPI_TEST_EXPORT(TestArkWeb_RegisterScrollCallback),
    NAPI_TEST_EXPORT(TestArkWebRequestHeaderList_Destroy),
    NAPI_TEST_EXPORT(TestArkWebRequestHeaderList_GetHeader),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_SetUserData),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_GetMethod),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_GetUrl),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_GetResourceType),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_GetFrameUrl),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_Destroy),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_GetReferrer),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_GetRequestHeaders),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_GetHttpBodyStream),
    NAPI_TEST_EXPORT(TestArkWebResourceRequest_DestroyHttpBodyStream),
    NAPI_TEST_EXPORT(TestArkWebHttpBodyStream_SetUserData),
    NAPI_TEST_EXPORT(TestArkWebHttpBodyStream_SetReadCallback),
    NAPI_TEST_EXPORT(TestArkWebHttpBodyStream_SetAsyncReadCallback),
    NAPI_TEST_EXPORT(TestArkWebHttpBodyStream_Init),
    NAPI_TEST_EXPORT(TestArkWebHttpBodyStream_Read),
    NAPI_TEST_EXPORT(TestArkWebHttpBodyStream_GetSize),
    NAPI_TEST_EXPORT(TestArkWebHttpBodyStream_GetPosition),
    NAPI_TEST_EXPORT(TestArkWebSchemeHandler_SetUserData),
    NAPI_TEST_EXPORT(TestArkWebResponse_GetHeaderByName),
    NAPI_TEST_EXPORT(TestArkWebResourceHandler_Destroy),
    NAPI_TEST_EXPORT(TestArkWebResourceHandler_DidReceiveResponse),
    NAPI_TEST_EXPORT(TestArkWebResourceHandler_DidReceiveData),
    NAPI_TEST_EXPORT(TestArkWebResourceHandler_DidFinish),
    NAPI_TEST_EXPORT(TestArkWeb_ReleaseString),
    NAPI_TEST_EXPORT(TestArkWeb_ReleaseByteArray),
    NAPI_TEST_EXPORT(TestNativeArkWeb_RunJavaScript),
    NAPI_TEST_EXPORT(TestNativeArkWeb_RegisterJavaScriptProxy),
    NAPI_TEST_EXPORT(TestNativeArkWeb_UnregisterJavaScriptProxy),
    NAPI_TEST_EXPORT(TestNativeArkWeb_SetJavaScriptProxyValidCallback),
    NAPI_TEST_EXPORT(TestNativeArkWeb_GetJavaScriptProxyValidCallback),
    NAPI_TEST_EXPORT(TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy),
    NAPI_TEST_EXPORT(TestNativeArkWeb_SetDestroyCallback),
    NAPI_TEST_EXPORT(TestNativeArkWeb_GetDestroyCallback),
    NAPI_TEST_EXPORT(TestNativeArkWeb_LoadData),
    NAPI_TEST_EXPORT(TestNativeArkWeb_SetBlanklessLoadingWithKey),
    NAPI_TEST_EXPORT(TestNativeArkWeb_ClearBlanklessLoadingCache),
    NAPI_TEST_EXPORT(TestNativeArkWeb_GetBlanklessInfoWithKey),
    NAPI_TEST_EXPORT(TestNativeArkWeb_SetBlanklessLoadingCacheCapacity),
    NAPI_TEST_EXPORT(TestNativeArkWeb_SetActiveWebEngineVersion),
    NAPI_TEST_EXPORT(TestNativeArkWeb_GetActiveWebEngineVersion),
    NAPI_TEST_EXPORT(TestNativeArkWeb_IsActiveWebEngineEvergreen),
    NAPI_TEST_EXPORT(TestArkWebCookieManager_SaveCookieAsync),
};

#undef NAPI_TEST_EXPORT

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(g_napiDescriptors) / sizeof(g_napiDescriptors[0]),
        g_napiDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
