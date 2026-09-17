/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include <cstdint>
#include <cstring>
#include "napi/native_api.h"
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_interface.h"
#include "web/native_interface_arkweb.h"

// ========== 全局状态变量 ==========
static int32_t g_testResult = 0;

static napi_value CreateResult(napi_env env, int32_t resultCode)
{
    napi_value result;
    napi_create_int32(env, resultCode, &result);
    return result;
}

static int32_t GetCaseNum(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t caseNum = 0;
    if (argc >= 1 && args[0] != nullptr) {
        napi_get_value_int32(env, args[0], &caseNum);
    }
    return caseNum;
}

// ========== 回调函数 ==========
static void OnScrollCallbackImpl(const char*, void*, double, double)
{
}

static void OnJavaScriptCallbackImpl(const char*)
{
}

static char* OnNativeJavaScriptProxyCallbackImpl(const char**, int32_t)
{
    return nullptr;
}

static void OnDestroyCallbackImpl(const char*)
{
}

static void OnCookieSaveCallbackImpl(ArkWeb_ErrorCode errorCode)
{
    g_testResult = static_cast<int32_t>(errorCode);
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

static napi_value TestArkWebResourceRequest_GetResourceTypeEnumCoverage(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType types[] = {
        MAIN_FRAME, SUB_FRAME, STYLE_SHEET, SCRIPT, IMAGE, FONT_RESOURCE, SUB_RESOURCE, OBJECT,
        MEDIA, WORKER, SHARED_WORKER, PREFETCH, FAVICON, XHR, PING, SERVICE_WORKER, CSP_REPORT,
        PLUGIN_RESOURCE, NAVIGATION_PRELOAD_MAIN_FRAME, NAVIGATION_PRELOAD_SUB_FRAME
    };
    int32_t count = static_cast<int32_t>(sizeof(types) / sizeof(types[0]));
    int32_t sum = 0;
    for (int32_t i = 0; i < count; i++) {
        sum += static_cast<int32_t>(types[i]);
    }
    int32_t nullRet = OH_ArkWebResourceRequest_GetResourceType(nullptr);
    if (nullRet != -1 || sum <= 0) {
        return CreateResult(env, -1);
    }
    return CreateResult(env, count);
}

static napi_value TestArkWeb_ProxyMethod_UserData(napi_env env, napi_callback_info info)
{
    ArkWeb_ProxyMethod method = {};
    method.userData = nullptr;
    void *data = method.userData;
    return CreateResult(env, data == nullptr ? 0 : -1);
}

static napi_value TestArkWeb_ControllerAPI_DeleteJavaScriptRegister(napi_env env, napi_callback_info info)
{
    ArkWeb_ControllerAPI api = {};
    api.deleteJavaScriptRegister = nullptr;
    return CreateResult(env, api.deleteJavaScriptRegister == nullptr ? 0 : -1);
}

static napi_value TestArkWeb_ControllerAPI_RegisterJavaScriptProxyEx(napi_env env, napi_callback_info info)
{
    ArkWeb_ControllerAPI api = {};
    api.registerJavaScriptProxyEx = nullptr;
    return CreateResult(env, api.registerJavaScriptProxyEx == nullptr ? 0 : -1);
}

static napi_value TestArkWeb_WebMessagePortAPI_PostMessage(napi_env env, napi_callback_info info)
{
    ArkWeb_WebMessagePortAPI api = {};
    api.postMessage = nullptr;
    return CreateResult(env, api.postMessage == nullptr ? 0 : -1);
}

static napi_value TestArkWeb_WebMessageAPI_SetData(napi_env env, napi_callback_info info)
{
    ArkWeb_WebMessageAPI api = {};
    api.setData = nullptr;
    return CreateResult(env, api.setData == nullptr ? 0 : -1);
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

static napi_value TestNativeArkWeb_LoadDataByCase(napi_env env, napi_callback_info info)
{
    int32_t caseNum = GetCaseNum(env, info);
    ArkWeb_ErrorCode ret = ARKWEB_SUCCESS;
    switch (caseNum) {
        case 0:
            ret = OH_NativeArkWeb_LoadData("test_tag", "<html><body>Hello</body></html>",
                "text/html", "UTF-8", nullptr, nullptr);
            break;
        case 1:
            ret = OH_NativeArkWeb_LoadData("unbound_tag", "<html><body>Hello</body></html>",
                "text/html", "UTF-8", nullptr, nullptr);
            break;
        case 2:
            ret = OH_NativeArkWeb_LoadData("test_tag", "", "text/html", "UTF-8", nullptr, nullptr);
            break;
        case 3:
            ret = OH_NativeArkWeb_LoadData("test_tag", "<html><body>Hello</body></html>",
                "", "UTF-8", nullptr, nullptr);
            break;
        case 4:
            ret = OH_NativeArkWeb_LoadData("test_tag", "<html><body>Hello</body></html>",
                "text/html", "", nullptr, nullptr);
            break;
        default:
            break;
    }
    return CreateResult(env, static_cast<int32_t>(ret));
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
    return CreateResult(env, static_cast<int32_t>(infoResult.errCode));
}

static napi_value TestNativeArkWeb_GetBlanklessInfoWithKeyByCase(napi_env env, napi_callback_info info)
{
    int32_t caseNum = GetCaseNum(env, info);
    ArkWeb_BlanklessInfo infoResult = {ARKWEB_BLANKLESS_SUCCESS, 0, 0};
    switch (caseNum) {
        case 0:
            infoResult = OH_NativeArkWeb_GetBlanklessInfoWithKey("test_tag", "test_key");
            break;
        case 1:
            infoResult = OH_NativeArkWeb_GetBlanklessInfoWithKey("test_tag", "new_key");
            break;
        case 2:
            infoResult = OH_NativeArkWeb_GetBlanklessInfoWithKey("test_tag", "");
            break;
        case 3:
            infoResult = OH_NativeArkWeb_GetBlanklessInfoWithKey("", "test_key");
            break;
        default:
            break;
    }
    return CreateResult(env, static_cast<int32_t>(infoResult.errCode));
}

static napi_value TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(napi_env env, napi_callback_info info)
{
    int32_t caseNum = GetCaseNum(env, info);
    ArkWeb_BlanklessErrorCode ret = ARKWEB_BLANKLESS_SUCCESS;
    switch (caseNum) {
        case 0:
            ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey("unbound_tag", "test_key", false);
            break;
        case 1:
            ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey("", "test_key", false);
            break;
        case 2:
            ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey("test_tag", "", false);
            break;
        case 3:
            ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey(nullptr, nullptr, true);
            break;
        case 4:
            OH_NativeArkWeb_GetBlanklessInfoWithKey("test_tag", "match_key");
            ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey("test_tag", "other_key", false);
            break;
        case 5:
            OH_NativeArkWeb_GetBlanklessInfoWithKey("test_tag", "test_key");
            ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey("test_tag", "test_key", true);
            break;
        default:
            break;
    }
    return CreateResult(env, static_cast<int32_t>(ret));
}

static napi_value TestNativeArkWeb_SetBlanklessLoadingCacheCapacity(napi_env env, napi_callback_info info)
{
    uint32_t ret = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(100);
    g_testResult = static_cast<int32_t>(ret);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_ClearBlanklessLoadingCacheNull(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_ClearBlanklessLoadingCache(nullptr, 0);
    g_testResult = 0;

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid(napi_env env, napi_callback_info info)
{
    ArkWeb_BlanklessErrorCode ret = OH_NativeArkWeb_SetBlanklessLoadingWithKey(nullptr, nullptr, true);
    g_testResult = static_cast<int32_t>(ret);

    napi_value result;
    napi_create_int32(env, g_testResult, &result);
    return result;
}

static napi_value TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn(napi_env env, napi_callback_info info)
{
    uint32_t ret = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(50);
    return CreateResult(env, static_cast<int32_t>(ret));
}

static napi_value TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase(napi_env env, napi_callback_info info)
{
    int32_t caseNum = GetCaseNum(env, info);
    uint32_t capacity = 30;
    switch (caseNum) {
        case 0:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(0);
            break;
        case 1:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(100);
            break;
        case 2:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(101);
            break;
        case 3:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(50);
            break;
        case 4:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(30);
            break;
        default:
            break;
    }
    return CreateResult(env, static_cast<int32_t>(capacity));
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
static const napi_property_descriptor K_NAPI_DESCRIPTORS[] = {
    {"TestArkWeb_RegisterScrollCallback", nullptr, TestArkWeb_RegisterScrollCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebRequestHeaderList_Destroy", nullptr, TestArkWebRequestHeaderList_Destroy,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebRequestHeaderList_GetHeader", nullptr, TestArkWebRequestHeaderList_GetHeader,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_SetUserData", nullptr, TestArkWebResourceRequest_SetUserData,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetMethod", nullptr, TestArkWebResourceRequest_GetMethod,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetUrl", nullptr, TestArkWebResourceRequest_GetUrl,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetResourceType", nullptr, TestArkWebResourceRequest_GetResourceType,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetResourceTypeEnumCoverage", nullptr,
        TestArkWebResourceRequest_GetResourceTypeEnumCoverage,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWeb_ProxyMethod_UserData", nullptr, TestArkWeb_ProxyMethod_UserData,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWeb_ControllerAPI_DeleteJavaScriptRegister", nullptr,
        TestArkWeb_ControllerAPI_DeleteJavaScriptRegister,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWeb_ControllerAPI_RegisterJavaScriptProxyEx", nullptr,
        TestArkWeb_ControllerAPI_RegisterJavaScriptProxyEx,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWeb_WebMessagePortAPI_PostMessage", nullptr, TestArkWeb_WebMessagePortAPI_PostMessage,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWeb_WebMessageAPI_SetData", nullptr, TestArkWeb_WebMessageAPI_SetData,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetFrameUrl", nullptr, TestArkWebResourceRequest_GetFrameUrl,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_Destroy", nullptr, TestArkWebResourceRequest_Destroy,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetReferrer", nullptr, TestArkWebResourceRequest_GetReferrer,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetRequestHeaders", nullptr, TestArkWebResourceRequest_GetRequestHeaders,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_GetHttpBodyStream", nullptr, TestArkWebResourceRequest_GetHttpBodyStream,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceRequest_DestroyHttpBodyStream", nullptr, TestArkWebResourceRequest_DestroyHttpBodyStream,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebHttpBodyStream_SetUserData", nullptr, TestArkWebHttpBodyStream_SetUserData,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebHttpBodyStream_SetReadCallback", nullptr, TestArkWebHttpBodyStream_SetReadCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebHttpBodyStream_SetAsyncReadCallback", nullptr, TestArkWebHttpBodyStream_SetAsyncReadCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebHttpBodyStream_Init", nullptr, TestArkWebHttpBodyStream_Init,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebHttpBodyStream_Read", nullptr, TestArkWebHttpBodyStream_Read,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebHttpBodyStream_GetSize", nullptr, TestArkWebHttpBodyStream_GetSize,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebHttpBodyStream_GetPosition", nullptr, TestArkWebHttpBodyStream_GetPosition,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebSchemeHandler_SetUserData", nullptr, TestArkWebSchemeHandler_SetUserData,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResponse_GetHeaderByName", nullptr, TestArkWebResponse_GetHeaderByName,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceHandler_Destroy", nullptr, TestArkWebResourceHandler_Destroy,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceHandler_DidReceiveResponse", nullptr, TestArkWebResourceHandler_DidReceiveResponse,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceHandler_DidReceiveData", nullptr, TestArkWebResourceHandler_DidReceiveData,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebResourceHandler_DidFinish", nullptr, TestArkWebResourceHandler_DidFinish,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWeb_ReleaseString", nullptr, TestArkWeb_ReleaseString,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWeb_ReleaseByteArray", nullptr, TestArkWeb_ReleaseByteArray,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_RunJavaScript", nullptr, TestNativeArkWeb_RunJavaScript,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_RegisterJavaScriptProxy", nullptr, TestNativeArkWeb_RegisterJavaScriptProxy,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_UnregisterJavaScriptProxy", nullptr, TestNativeArkWeb_UnregisterJavaScriptProxy,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetJavaScriptProxyValidCallback", nullptr, TestNativeArkWeb_SetJavaScriptProxyValidCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_GetJavaScriptProxyValidCallback", nullptr, TestNativeArkWeb_GetJavaScriptProxyValidCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy", nullptr,
        TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetDestroyCallback", nullptr, TestNativeArkWeb_SetDestroyCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_GetDestroyCallback", nullptr, TestNativeArkWeb_GetDestroyCallback,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_LoadData", nullptr, TestNativeArkWeb_LoadData,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_LoadDataByCase", nullptr, TestNativeArkWeb_LoadDataByCase,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetBlanklessLoadingWithKey", nullptr, TestNativeArkWeb_SetBlanklessLoadingWithKey,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_ClearBlanklessLoadingCache", nullptr, TestNativeArkWeb_ClearBlanklessLoadingCache,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_GetBlanklessInfoWithKey", nullptr, TestNativeArkWeb_GetBlanklessInfoWithKey,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_GetBlanklessInfoWithKeyByCase", nullptr, TestNativeArkWeb_GetBlanklessInfoWithKeyByCase,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase", nullptr, TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetBlanklessLoadingCacheCapacity", nullptr,
        TestNativeArkWeb_SetBlanklessLoadingCacheCapacity,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_ClearBlanklessLoadingCacheNull", nullptr,
        TestNativeArkWeb_ClearBlanklessLoadingCacheNull,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid", nullptr,
        TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn", nullptr,
        TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase", nullptr,
        TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_SetActiveWebEngineVersion", nullptr, TestNativeArkWeb_SetActiveWebEngineVersion,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_GetActiveWebEngineVersion", nullptr, TestNativeArkWeb_GetActiveWebEngineVersion,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestNativeArkWeb_IsActiveWebEngineEvergreen", nullptr, TestNativeArkWeb_IsActiveWebEngineEvergreen,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestArkWebCookieManager_SaveCookieAsync", nullptr, TestArkWebCookieManager_SaveCookieAsync,
        nullptr, nullptr, nullptr, napi_default, nullptr},
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(K_NAPI_DESCRIPTORS) / sizeof(K_NAPI_DESCRIPTORS[0]),
        K_NAPI_DESCRIPTORS);
    return exports;
}
EXTERN_C_END

static napi_module g_demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&g_demoModule);
}
