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

#include "WebErrorInfoTest.h"
#include "native_common.h"
#include "napi/native_api.h"
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_net_error_list.h"
#include <dlfcn.h>
#include <hilog/log.h>
#include <vector>

typedef void (*CreateErrorInfoFunc)(ArkWeb_ErrorInfo **);
typedef void (*DestroyErrorInfoFunc)(ArkWeb_ErrorInfo *);
typedef int32_t (*SetCompleteIfNoResponseFunc)(ArkWeb_ErrorInfo *, bool);
typedef bool (*GetCompleteIfNoResponseFunc)(const ArkWeb_ErrorInfo *);
typedef int32_t (*SetCustomErrorCodeFunc)(ArkWeb_ErrorInfo *, int32_t);
typedef int32_t (*GetCustomErrorCodeFunc)(const ArkWeb_ErrorInfo *);
typedef int32_t (*SetErrorCodeFunc)(ArkWeb_ErrorInfo *, ArkWeb_NetError);
typedef ArkWeb_NetError (*GetErrorCodeFunc)(const ArkWeb_ErrorInfo *);
typedef int32_t (*ResponseSetErrorInfoFunc)(ArkWeb_Response *, ArkWeb_ErrorInfo *);
typedef ArkWeb_ErrorInfo *(*ResponseGetErrorInfoFunc)(const ArkWeb_Response *);
typedef int32_t (*DidFailWithErrorInfoFunc)(const ArkWeb_ResourceHandler *, const ArkWeb_ErrorInfo *);

struct ErrorInfoApi {
    CreateErrorInfoFunc createErrorInfo = nullptr;
    DestroyErrorInfoFunc destroyErrorInfo = nullptr;
    SetCompleteIfNoResponseFunc setCompleteIfNoResponse = nullptr;
    GetCompleteIfNoResponseFunc getCompleteIfNoResponse = nullptr;
    SetCustomErrorCodeFunc setCustomErrorCode = nullptr;
    GetCustomErrorCodeFunc getCustomErrorCode = nullptr;
    SetErrorCodeFunc setErrorCode = nullptr;
    GetErrorCodeFunc getErrorCode = nullptr;
    ResponseSetErrorInfoFunc responseSetErrorInfo = nullptr;
    ResponseGetErrorInfoFunc responseGetErrorInfo = nullptr;
    DidFailWithErrorInfoFunc didFailWithErrorInfo = nullptr;
};

static ErrorInfoApi g_errorInfoApi;
static bool g_errorInfoApiLoaded = false;
static constexpr int32_t TEST_CUSTOM_ERROR_CODE = 32159;

static void *ResolveOhWebSymbol(const char *name)
{
    void *sym = dlsym(RTLD_DEFAULT, name);
    if (sym != nullptr) {
        return sym;
    }
    static void *handle = nullptr;
    if (handle == nullptr) {
        handle = dlopen("libohweb.so", RTLD_NOW | RTLD_NOLOAD);
        if (handle == nullptr) {
            handle = dlopen("/system/lib/n" "dk/libohweb.so", RTLD_NOW);
        }
    }
    if (handle != nullptr) {
        sym = dlsym(handle, name);
    }
    return sym;
}

static bool LoadErrorInfoApi()
{
    if (g_errorInfoApiLoaded) {
        return g_errorInfoApi.createErrorInfo != nullptr;
    }
    g_errorInfoApiLoaded = true;
    g_errorInfoApi.createErrorInfo =
        reinterpret_cast<CreateErrorInfoFunc>(ResolveOhWebSymbol("OH_ArkWeb_CreateErrorInfo"));
    g_errorInfoApi.destroyErrorInfo =
        reinterpret_cast<DestroyErrorInfoFunc>(ResolveOhWebSymbol("OH_ArkWeb_DestroyErrorInfo"));
    g_errorInfoApi.setCompleteIfNoResponse = reinterpret_cast<SetCompleteIfNoResponseFunc>(
        ResolveOhWebSymbol("OH_ArkWebErrorInfo_SetCompleteIfNoResponse"));
    g_errorInfoApi.getCompleteIfNoResponse = reinterpret_cast<GetCompleteIfNoResponseFunc>(
        ResolveOhWebSymbol("OH_ArkWebErrorInfo_GetCompleteIfNoResponse"));
    g_errorInfoApi.setCustomErrorCode = reinterpret_cast<SetCustomErrorCodeFunc>(
        ResolveOhWebSymbol("OH_ArkWebErrorInfo_SetCustomErrorCode"));
    g_errorInfoApi.getCustomErrorCode = reinterpret_cast<GetCustomErrorCodeFunc>(
        ResolveOhWebSymbol("OH_ArkWebErrorInfo_GetCustomErrorCode"));
    g_errorInfoApi.setErrorCode =
        reinterpret_cast<SetErrorCodeFunc>(ResolveOhWebSymbol("OH_ArkWebErrorInfo_SetErrorCode"));
    g_errorInfoApi.getErrorCode =
        reinterpret_cast<GetErrorCodeFunc>(ResolveOhWebSymbol("OH_ArkWebErrorInfo_GetErrorCode"));
    g_errorInfoApi.responseSetErrorInfo = reinterpret_cast<ResponseSetErrorInfoFunc>(
        ResolveOhWebSymbol("OH_ArkWebResponse_SetErrorInfo"));
    g_errorInfoApi.responseGetErrorInfo = reinterpret_cast<ResponseGetErrorInfoFunc>(
        ResolveOhWebSymbol("OH_ArkWebResponse_GetErrorInfo"));
    g_errorInfoApi.didFailWithErrorInfo = reinterpret_cast<DidFailWithErrorInfoFunc>(
        ResolveOhWebSymbol("OH_ArkWebResourceHandler_DidFailWithErrorInfo"));
    return g_errorInfoApi.createErrorInfo != nullptr;
}

static napi_value OH_ArkWeb_CreateErrorInfo0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        if (errorInfo != nullptr) {
            ret = 0;
            g_errorInfoApi.destroyErrorInfo(errorInfo);
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWeb_DestroyErrorInfo0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        g_errorInfoApi.destroyErrorInfo(errorInfo);
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_SetCompleteIfNoResponse0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        int32_t errcode = g_errorInfoApi.setCompleteIfNoResponse(nullptr, true);
        if (errcode == ARKWEB_INVALID_PARAM) {
            ret = 0;
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_SetCompleteIfNoResponse0200(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        int32_t errcode = g_errorInfoApi.setCompleteIfNoResponse(errorInfo, true);
        if (errcode == ARKWEB_NET_OK) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_GetCompleteIfNoResponse0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        g_errorInfoApi.setCompleteIfNoResponse(errorInfo, true);
        if (g_errorInfoApi.getCompleteIfNoResponse(errorInfo)) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_SetCustomErrorCode0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        int32_t errcode = g_errorInfoApi.setCustomErrorCode(nullptr, TEST_CUSTOM_ERROR_CODE);
        if (errcode == ARKWEB_INVALID_PARAM) {
            ret = 0;
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_SetCustomErrorCode0200(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        int32_t errcode = g_errorInfoApi.setCustomErrorCode(errorInfo, TEST_CUSTOM_ERROR_CODE);
        if (errcode == ARKWEB_NET_OK) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_GetCustomErrorCode0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        g_errorInfoApi.setCustomErrorCode(errorInfo, TEST_CUSTOM_ERROR_CODE);
        if (g_errorInfoApi.getCustomErrorCode(errorInfo) == TEST_CUSTOM_ERROR_CODE) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_SetErrorCode0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        int32_t errcode = g_errorInfoApi.setErrorCode(nullptr, ARKWEB_ERR_FAILED);
        if (errcode == ARKWEB_INVALID_PARAM) {
            ret = 0;
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_SetErrorCode0200(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        int32_t errcode = g_errorInfoApi.setErrorCode(errorInfo, ARKWEB_ERR_FAILED);
        if (errcode == ARKWEB_NET_OK) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebErrorInfo_GetErrorCode0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        g_errorInfoApi.setErrorCode(errorInfo, ARKWEB_ERR_FAILED);
        if (g_errorInfoApi.getErrorCode(errorInfo) == ARKWEB_ERR_FAILED) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetErrorInfo0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        int32_t errcode = g_errorInfoApi.responseSetErrorInfo(nullptr, nullptr);
        if (errcode == ARKWEB_INVALID_PARAM) {
            ret = 0;
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetErrorInfo0200(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_Response *response = nullptr;
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        OH_ArkWeb_CreateResponse(&response);
        g_errorInfoApi.createErrorInfo(&errorInfo);
        int32_t errcode = g_errorInfoApi.responseSetErrorInfo(response, errorInfo);
        if (errcode == ARKWEB_NET_OK) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
        OH_ArkWeb_DestroyResponse(response);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_GetErrorInfo0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_Response *response = nullptr;
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        OH_ArkWeb_CreateResponse(&response);
        g_errorInfoApi.createErrorInfo(&errorInfo);
        g_errorInfoApi.responseSetErrorInfo(response, errorInfo);
        if (g_errorInfoApi.responseGetErrorInfo(response) != nullptr) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
        OH_ArkWeb_DestroyResponse(response);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_DidFailWithErrorInfo0100(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        ArkWeb_ErrorInfo *errorInfo = nullptr;
        g_errorInfoApi.createErrorInfo(&errorInfo);
        int32_t errcode = g_errorInfoApi.didFailWithErrorInfo(nullptr, errorInfo);
        if (errcode == ARKWEB_INVALID_PARAM) {
            ret = 0;
        }
        g_errorInfoApi.destroyErrorInfo(errorInfo);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_DidFailWithErrorInfo0200(napi_env env, napi_callback_info info)
{
    int ret = -1;
    if (LoadErrorInfoApi()) {
        int32_t errcode = g_errorInfoApi.didFailWithErrorInfo(nullptr, nullptr);
        if (errcode == ARKWEB_INVALID_PARAM) {
            ret = 0;
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

void AddErrorInfoFunctions(std::vector<napi_property_descriptor> &descVector)
{
    std::vector<napi_property_descriptor> descEx = {
        DECLARE_NAPI_FUNCTION("OH_ArkWeb_CreateErrorInfo0100", OH_ArkWeb_CreateErrorInfo0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWeb_DestroyErrorInfo0100", OH_ArkWeb_DestroyErrorInfo0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_SetCompleteIfNoResponse0100",
                              OH_ArkWebErrorInfo_SetCompleteIfNoResponse0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_SetCompleteIfNoResponse0200",
                              OH_ArkWebErrorInfo_SetCompleteIfNoResponse0200),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_GetCompleteIfNoResponse0100",
                              OH_ArkWebErrorInfo_GetCompleteIfNoResponse0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_SetCustomErrorCode0100",
                              OH_ArkWebErrorInfo_SetCustomErrorCode0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_SetCustomErrorCode0200",
                              OH_ArkWebErrorInfo_SetCustomErrorCode0200),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_GetCustomErrorCode0100",
                              OH_ArkWebErrorInfo_GetCustomErrorCode0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_SetErrorCode0100", OH_ArkWebErrorInfo_SetErrorCode0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_SetErrorCode0200", OH_ArkWebErrorInfo_SetErrorCode0200),
        DECLARE_NAPI_FUNCTION("OH_ArkWebErrorInfo_GetErrorCode0100", OH_ArkWebErrorInfo_GetErrorCode0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetErrorInfo0100", OH_ArkWebResponse_SetErrorInfo0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetErrorInfo0200", OH_ArkWebResponse_SetErrorInfo0200),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_GetErrorInfo0100", OH_ArkWebResponse_GetErrorInfo0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_DidFailWithErrorInfo0100",
                              OH_ArkWebResourceHandler_DidFailWithErrorInfo0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_DidFailWithErrorInfo0200",
                              OH_ArkWebResourceHandler_DidFailWithErrorInfo0200),
    };

    for (const auto &desc : descEx) {
        descVector.push_back(desc);
    }
}
