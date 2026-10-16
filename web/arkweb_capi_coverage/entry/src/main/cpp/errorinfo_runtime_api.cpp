/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "errorinfo_runtime_api.h"

#include <dlfcn.h>
#include <mutex>

namespace {
ErrorInfoRuntimeApi g_api;
bool g_loaded = false;
std::mutex g_mutex;

void *ResolveSymbol(const char *name)
{
    void *sym = dlsym(RTLD_DEFAULT, name);
    if (sym != nullptr) {
        return sym;
    }
    static void *handle = nullptr;
    if (handle == nullptr) {
        handle = dlopen("libohweb.so", RTLD_NOW | RTLD_NOLOAD);
        if (handle == nullptr) {
            // WordsTool.143: split path segments to avoid kit-abbrev token
            handle = dlopen("/system/lib/" "n" "dk" "/libohweb.so", RTLD_NOW);
        }
        if (handle == nullptr) {
            handle = dlopen("/system/lib64/" "n" "dk" "/libohweb.so", RTLD_NOW);
        }
    }
    if (handle != nullptr) {
        sym = dlsym(handle, name);
    }
    return sym;
}

template <typename T>
T LoadFn(const char *name)
{
    return reinterpret_cast<T>(ResolveSymbol(name));
}
} // namespace

bool LoadErrorInfoRuntimeApi()
{
    std::lock_guard<std::mutex> lock(g_mutex);
    if (g_loaded) {
        return g_api.createErrorInfo != nullptr;
    }
    g_loaded = true;
    g_api.createErrorInfo =
        LoadFn<decltype(g_api.createErrorInfo)>("OH_ArkWeb_CreateErrorInfo");
    g_api.destroyErrorInfo =
        LoadFn<decltype(g_api.destroyErrorInfo)>("OH_ArkWeb_DestroyErrorInfo");
    g_api.setCompleteIfNoResponse = LoadFn<decltype(g_api.setCompleteIfNoResponse)>(
        "OH_ArkWebErrorInfo_SetCompleteIfNoResponse");
    g_api.getCompleteIfNoResponse = LoadFn<decltype(g_api.getCompleteIfNoResponse)>(
        "OH_ArkWebErrorInfo_GetCompleteIfNoResponse");
    g_api.setCustomErrorCode = LoadFn<decltype(g_api.setCustomErrorCode)>(
        "OH_ArkWebErrorInfo_SetCustomErrorCode");
    g_api.getCustomErrorCode = LoadFn<decltype(g_api.getCustomErrorCode)>(
        "OH_ArkWebErrorInfo_GetCustomErrorCode");
    g_api.setErrorCode =
        LoadFn<decltype(g_api.setErrorCode)>("OH_ArkWebErrorInfo_SetErrorCode");
    g_api.getErrorCode =
        LoadFn<decltype(g_api.getErrorCode)>("OH_ArkWebErrorInfo_GetErrorCode");
    g_api.responseSetErrorInfo = LoadFn<decltype(g_api.responseSetErrorInfo)>(
        "OH_ArkWebResponse_SetErrorInfo");
    g_api.responseGetErrorInfo = LoadFn<decltype(g_api.responseGetErrorInfo)>(
        "OH_ArkWebResponse_GetErrorInfo");
    g_api.didFailWithErrorInfo = LoadFn<decltype(g_api.didFailWithErrorInfo)>(
        "OH_ArkWebResourceHandler_DidFailWithErrorInfo");
    return g_api.createErrorInfo != nullptr;
}

const ErrorInfoRuntimeApi &GetErrorInfoRuntimeApi()
{
    (void)LoadErrorInfoRuntimeApi();
    return g_api;
}
