/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "filemanagement/clouddiskmanager/oh_cloud_disk_manager.h"
#include <iostream>
#include "native_common.h"
#include "hilog/log.h"
#include <cstdio>
#include <cstring>
#include <unistd.h>
#include "common/logger_common.h"

#include "napi/native_api.h"
#include "filemanagement/clouddiskmanager/oh_cloud_disk_manager.h"
#include <iostream>
#include "native_common.h"
#include "hilog/log.h"
#include <cstdio>
#include <cstring>
#include <unistd.h>
#include "common/logger_common.h"

namespace {

constexpr uint64_t kHydrateTotalBytes = 4096;
constexpr uint64_t kHydrateChunkBytes = 1024;
constexpr int kDefaultWaitMs = 3000;
constexpr int kPollIntervalMs = 100;

bool g_fetchInvoked = false;
bool g_cancelArrived = false;
bool g_blockFetchResponse = true;
bool g_multiChunkMode = false;
bool g_stopAfterFirstChunk = false;
int g_deliveredChunks = 0;
uint64_t g_deliveredBytes = 0;
CloudDisk_ErrorCode g_lastExecStatus = CLOUD_DISK_OK;

void HandleFetchRequest(const OH_CloudDisk_CallbackReqHead& head, OH_CloudDisk_CallbackContext& ctx)
{
    g_fetchInvoked = true;
    LOGW("====>CbFetch invoked, type: %{public}d", static_cast<int>(head.callbackType));
    if (ctx.fetchData == nullptr) {
        return;
    }
    LOGW("====>CbFetch file: %{public}s, prio: %{public}d", ctx.fetchData->filePath.value,
        static_cast<int>(ctx.fetchData->priority));
    if (g_blockFetchResponse) {
        LOGW("====>CbFetch blocked, keep task pending");
        return;
    }
    if (!g_multiChunkMode) {
        static uint8_t payload[] = "hydrate_test_data";
        OH_CloudDisk_FetchData block = {0};
        block.offset = 0;
        block.size = sizeof(payload) - 1;
        block.totalSize = sizeof(payload) - 1;
        block.data.data = payload;
        block.data.dataSize = sizeof(payload) - 1;
        block.isComplete = true;
        OH_CloudDisk_CallbackResponse resp;
        resp.fetchData = &block;
        g_lastExecStatus = OH_CloudDisk_Execute(head, ctx, resp);
        LOGW("====>CbFetch exec single ret: %{public}d", g_lastExecStatus);
        g_deliveredChunks++;
        return;
    }
    static uint8_t chunkPayload[1024];
    memset(chunkPayload, 0xAB, sizeof(chunkPayload));
    while (g_deliveredBytes < kHydrateTotalBytes) {
        if (g_stopAfterFirstChunk && g_deliveredBytes >= kHydrateChunkBytes) {
            LOGW("====>CbFetch partial stop at: %{public}llu",
                static_cast<unsigned long long>(g_deliveredBytes));
            return;
        }
        uint64_t left = kHydrateTotalBytes - g_deliveredBytes;
        uint64_t cur = (left < kHydrateChunkBytes) ? left : kHydrateChunkBytes;
        OH_CloudDisk_FetchData blk = {0};
        blk.offset = g_deliveredBytes;
        blk.size = cur;
        blk.totalSize = kHydrateTotalBytes;
        blk.data.data = chunkPayload;
        blk.data.dataSize = cur;
        blk.isComplete = (g_deliveredBytes + cur >= kHydrateTotalBytes);
        OH_CloudDisk_CallbackResponse r;
        r.fetchData = &blk;
        g_lastExecStatus = OH_CloudDisk_Execute(head, ctx, r);
        LOGW("====>CbFetch exec chunk ret: %{public}d, off: %{public}llu, sz: %{public}llu, done: %{public}d",
            g_lastExecStatus, static_cast<unsigned long long>(g_deliveredBytes),
            static_cast<unsigned long long>(cur), blk.isComplete ? 1 : 0);
        if (g_lastExecStatus != CLOUD_DISK_OK) {
            LOGE("====>CbFetch exec error, abort rest");
            break;
        }
        g_deliveredBytes += cur;
        g_deliveredChunks++;
    }
}

void HandleCancelNotice(const OH_CloudDisk_CallbackContext& ctx)
{
    g_cancelArrived = true;
    if (ctx.cancelFetchData != nullptr) {
        LOGW("====>CbCancel file: %{public}s", ctx.cancelFetchData->value);
    }
}

void HandleDehydrateConsent(OH_CloudDisk_CallbackContext& ctx)
{
    if (ctx.dehydrateData != nullptr) {
        LOGW("====>CbDehydrate file: %{public}s", ctx.dehydrateData->filePath.value);
        ctx.dehydrateData->allow = true;
        LOGW("====>CbDehydrate granted");
    }
}

void DispatchCloudDiskCallback(const OH_CloudDisk_CallbackReqHead head, OH_CloudDisk_CallbackContext ctx)
{
    switch (head.callbackType) {
        case OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA:
            HandleFetchRequest(head, ctx);
            break;
        case OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA:
            HandleCancelNotice(ctx);
            break;
        case OH_CLOUD_DISK_CALLBACK_TYPE_DEHYDRATE:
            HandleDehydrateConsent(ctx);
            break;
        default:
            break;
    }
}

bool WaitFetchInvoked(int timeoutMs)
{
    int spent = 0;
    while (!g_fetchInvoked && spent < timeoutMs) {
        usleep(kPollIntervalMs * 1000);
        spent += kPollIntervalMs;
    }
    LOGW("====>WaitFetch invoked: %{public}d, spent: %{public}dms", g_fetchInvoked ? 1 : 0, spent);
    return g_fetchInvoked;
}

bool WaitCancelArrived(int timeoutMs)
{
    int spent = 0;
    while (!g_cancelArrived && spent < timeoutMs) {
        usleep(kPollIntervalMs * 1000);
        spent += kPollIntervalMs;
    }
    LOGW("====>WaitCancel arrived: %{public}d, spent: %{public}dms", g_cancelArrived ? 1 : 0, spent);
    return g_cancelArrived;
}

void ResetCallbackFlags()
{
    g_fetchInvoked = false;
    g_cancelArrived = false;
    g_blockFetchResponse = false;
    g_multiChunkMode = false;
    g_stopAfterFirstChunk = false;
    g_deliveredChunks = 0;
    g_deliveredBytes = 0;
    g_lastExecStatus = CLOUD_DISK_OK;
}

void TryRemoveFile(const char* tag, const char* virtualFullPath)
{
    if (access(virtualFullPath, F_OK) == 0) {
        LOGW("====>%{public}s rm: %{public}s", tag, virtualFullPath);
        if (remove(virtualFullPath) != 0) {
            LOGE("====>%{public}s rm fail: %{public}s", tag, virtualFullPath);
        }
        return;
    }
    static const char* kVirtualPrefix = "/storage/Users/currentUser/Documents/";
    static const char* kRealPrefix = "/storage/media/100/local/files/Docs/Documents/";
    if (strncmp(virtualFullPath, kVirtualPrefix, strlen(kVirtualPrefix)) == 0) {
        char mapped[512] = {0};
        strcat(mapped, kRealPrefix);
        strcat(mapped, virtualFullPath + strlen(kVirtualPrefix));
        if (access(mapped, F_OK) == 0) {
            LOGW("====>%{public}s rm mapped: %{public}s", tag, mapped);
            if (remove(mapped) != 0) {
                LOGE("====>%{public}s rm mapped fail: %{public}s", tag, mapped);
            }
        }
    }
}

CloudDisk_SyncFolderPath BuildRootPath(char* p)
{
    CloudDisk_SyncFolderPath sp;
    sp.value = p;
    sp.length = strlen(p);
    return sp;
}

CloudDisk_PathInfo BuildPathInfo(char* p)
{
    CloudDisk_PathInfo pi;
    pi.value = p;
    pi.length = strlen(p);
    return pi;
}

OH_CloudDisk_PlaceholderInfo BuildPlaceholderMeta(uint64_t logical, uint64_t atime, uint64_t mtime)
{
    OH_CloudDisk_PlaceholderInfo meta;
    meta.logicalSize = logical;
    meta.atimeMs = atime;
    meta.mtimeMs = mtime;
    return meta;
}

CloudDisk_ErrorCode PrepareDefaultRoot()
{
    char root[] = "/storage/Users/currentUser/Documents/";
    char tag[] = "CloudDiskTest";
    CloudDisk_SyncFolder sf;
    sf.path = BuildRootPath(root);
    sf.state = CloudDisk_SyncFolderState::ACTIVE;
    sf.displayNameInfo.displayNameResId = 0;
    sf.displayNameInfo.customAlias = tag;
    sf.displayNameInfo.customAliasLength = strlen(tag);
    LOGW("====>Register root begin");
    auto rc = OH_CloudDisk_RegisterSyncFolder(&sf);
    LOGW("====>Register root rc: %{public}d", rc);
    return rc;
}

CloudDisk_ErrorCode TeardownDefaultRoot()
{
    char root[] = "/storage/Users/currentUser/Documents/";
    LOGW("====>Unregister root begin");
    auto rc = OH_CloudDisk_UnregisterSyncFolder(BuildRootPath(root));
    LOGW("====>Unregister root rc: %{public}d", rc);
    return rc;
}

} // namespace

static napi_value GetPlaceholderState001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_001.txt";
    LOGI("====>GetPlaceholderState001 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderState001 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    OH_CloudDisk_PlaceholderState stateUnhydrated = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState unhydrated start");
    auto ret1 = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath),
        &stateUnhydrated);
    LOGW("====>OH_CloudDisk_GetPlaceholderState unhydrated ret: %{public}d, state: %{public}d",
        ret1, static_cast<int>(stateUnhydrated));
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitFetchInvoked(kDefaultWaitMs);
    OH_CloudDisk_PlaceholderState stateHydrated = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState fully-hydrated start");
    auto ret2 = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath),
        &stateHydrated);
    LOGW("====>OH_CloudDisk_GetPlaceholderState fully-hydrated ret: %{public}d, state: %{public}d",
        ret2, static_cast<int>(stateHydrated));
    bool ok = ret1 == CLOUD_DISK_OK && stateUnhydrated == OH_CLOUD_DISK_PLACEHOLDER_STATE_UNHYDRATED &&
        hydrateRet == CLOUD_DISK_OK && triggered &&
        ret2 == CLOUD_DISK_OK && stateHydrated == OH_CLOUD_DISK_PLACEHOLDER_STATE_FULLY_HYDRATED;
    TryRemoveFile("GetPlaceholderState001 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_002.txt";
    LOGI("====>GetPlaceholderState002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderState002 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare start");
    auto convertRet = OH_CloudDisk_ConvertPlaceholderToFile(BuildRootPath(path),
        BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare ret: %{public}d", convertRet);
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_UNHYDRATED;
    LOGW("====>OH_CloudDisk_GetPlaceholderState normal-file start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath), &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState normal-file ret: %{public}d, state: %{public}d",
        ret, static_cast<int>(state));
    bool ok = ret == CLOUD_DISK_OK && state == OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    TryRemoveFile("GetPlaceholderState002 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_003.txt";
    LOGI("====>GetPlaceholderState003 params: path: %{public}s, relativePath: %{public}s, state: nullptr",
        path, relativePath);
    LOGW("====>OH_CloudDisk_GetPlaceholderState null-state start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath), nullptr);
    LOGW("====>OH_CloudDisk_GetPlaceholderState null-state ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_state_004.txt";
    LOGI("====>GetPlaceholderState004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState file-not-exist start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath), &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState file-not-exist ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_005.txt";
    LOGI("====>GetPlaceholderState005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderState005 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    g_multiChunkMode = true;
    g_stopAfterFirstChunk = true;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(kHydrateTotalBytes, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare ret: %{public}d", hydrateRet);
    bool partialReady = false;
    int partialWaitedMs = 0;
    while (partialWaitedMs < 3000) {
        if (g_fetchInvoked && g_deliveredBytes >= kHydrateChunkBytes) {
            partialReady = true;
            break;
        }
        usleep(100 * 1000);
        partialWaitedMs += 100;
    }
    LOGW("====>GetPlaceholderState005 partial-hydrated ready: %{public}d, chunkOffset: %{public}llu",
        partialReady ? 1 : 0, static_cast<unsigned long long>(g_deliveredBytes));
    g_multiChunkMode = false;
    g_stopAfterFirstChunk = false;
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState partially-hydrated start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath), &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState partially-hydrated ret: %{public}d, state: %{public}d",
        ret, static_cast<int>(state));
    bool ok = partialReady && ret == CLOUD_DISK_OK &&
        state == OH_CLOUD_DISK_PLACEHOLDER_STATE_PARTIALLY_HYDRATED;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup ret: %{public}d", cancelRet);
    TryRemoveFile("GetPlaceholderState005 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_mark_001.txt";
    LOGI("====>MarkFileAsPlaceholder001 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("MarkFileAsPlaceholder001 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare start");
    auto convertRet = OH_CloudDisk_ConvertPlaceholderToFile(BuildRootPath(path),
        BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare ret: %{public}d", convertRet);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder start");
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder ret: %{public}d", ret);
    bool isPlaceholder = false;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile verify start");
    auto isRet = OH_CloudDisk_IsPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile verify ret: %{public}d, isPlaceholder: %{public}d",
        isRet, isPlaceholder ? 1 : 0);
    bool ok = ret == CLOUD_DISK_OK && isRet == CLOUD_DISK_OK && isPlaceholder;
    TryRemoveFile("MarkFileAsPlaceholder001 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_mark_002.txt";
    LOGI("====>MarkFileAsPlaceholder002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("MarkFileAsPlaceholder002 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder already start");
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder already ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_IS_A_PLACEHOLDER ||
        ret == CLOUD_DISK_NOT_SUPPORTED;
    TryRemoveFile("MarkFileAsPlaceholder002 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_mark_003.txt";
    LOGI("====>MarkFileAsPlaceholder003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder file-not-exist start");
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder file-not-exist ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_unmark_001.txt";
    LOGI("====>UnmarkPlaceholderFile001 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("UnmarkPlaceholderFile001 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitFetchInvoked(kDefaultWaitMs);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile start");
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile ret: %{public}d", ret);
    bool isPlaceholder = true;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile verify start");
    auto isRet = OH_CloudDisk_IsPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile verify ret: %{public}d, isPlaceholder: %{public}d",
        isRet, isPlaceholder ? 1 : 0);
    bool ok = hydrateRet == CLOUD_DISK_OK && triggered &&
        ret == CLOUD_DISK_OK && isRet == CLOUD_DISK_OK && !isPlaceholder;
    TryRemoveFile("UnmarkPlaceholderFile001 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_unmark_002.txt";
    LOGI("====>UnmarkPlaceholderFile002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("UnmarkPlaceholderFile002 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare start");
    auto convertRet = OH_CloudDisk_ConvertPlaceholderToFile(BuildRootPath(path),
        BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare ret: %{public}d", convertRet);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile normal-file start");
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile normal-file ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_NOT_A_PLACEHOLDER || ret == CLOUD_DISK_NOT_SUPPORTED;
    TryRemoveFile("UnmarkPlaceholderFile002 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_unmark_003.txt";
    LOGI("====>UnmarkPlaceholderFile003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile file-not-exist start");
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile file-not-exist ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_custom_get_001.txt";
    LOGI("====>GetPlaceholderCustomInfo001 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderCustomInfo001 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    static uint8_t customData[] = "custom_info_get_001";
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData) - 1;
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), &customInfo);
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info prepare ret: %{public}d", createRet);
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo start");
    auto ret = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo ret: %{public}d, inOutLen: %{public}zu",
        ret, inOutLen);
    bool contentOk = ret == CLOUD_DISK_OK && inOutLen == sizeof(customData) - 1 &&
        memcmp(dataBuf, customData, sizeof(customData) - 1) == 0;
    LOGW("====>GetPlaceholderCustomInfo001 content check: %{public}d", contentOk ? 1 : 0);
    bool ok = contentOk;
    TryRemoveFile("GetPlaceholderCustomInfo001 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_custom_get_002.txt";
    LOGI("====>GetPlaceholderCustomInfo002 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderCustomInfo002 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder without-custom-info prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder without-custom-info prepare ret: %{public}d", createRet);
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo no-custom-info start");
    auto ret = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo no-custom-info ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_PLACEHOLDER_CUSTOM_INFO_NOT_FOUND || ret == CLOUD_DISK_NOT_SUPPORTED;
    TryRemoveFile("GetPlaceholderCustomInfo002 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_custom_get_003.txt";
    LOGI("====>GetPlaceholderCustomInfo003 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo null-buf start");
    auto retNullBuf = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path),
        BuildPathInfo(relativePath), nullptr, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo null-buf ret: %{public}d", retNullBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo null-len start");
    auto retNullLen = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path),
        BuildPathInfo(relativePath), dataBuf, nullptr);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo null-len ret: %{public}d", retNullLen);
    bool ok = (retNullBuf == CLOUD_DISK_INVALID_ARG || retNullBuf == CLOUD_DISK_NOT_SUPPORTED) &&
        (retNullLen == CLOUD_DISK_INVALID_ARG || retNullLen == CLOUD_DISK_NOT_SUPPORTED);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_006.txt";
    char emptyStr[] = "";
    LOGI("====>GetPlaceholderState006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    CloudDisk_SyncFolderPath emptyFolder = BuildRootPath(emptyStr);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_GetPlaceholderState empty-folder start");
    auto retEmptyFolder = OH_CloudDisk_GetPlaceholderState(emptyFolder, filePathInfo, nullptr);
    LOGW("====>OH_CloudDisk_GetPlaceholderState empty-folder ret: %{public}d", retEmptyFolder);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo emptyFile = BuildPathInfo(emptyStr);
    LOGW("====>OH_CloudDisk_GetPlaceholderState empty-file start");
    auto retEmptyFile = OH_CloudDisk_GetPlaceholderState(syncFolderPath, emptyFile, nullptr);
    LOGW("====>OH_CloudDisk_GetPlaceholderState empty-file ret: %{public}d", retEmptyFile);
    bool ok = (retEmptyFolder == CLOUD_DISK_INVALID_ARG || retEmptyFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retEmptyFile == CLOUD_DISK_INVALID_ARG || retEmptyFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_007.txt";
    LOGI("====>GetPlaceholderState007 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder ensure start");
    OH_CloudDisk_UnregisterSyncFolder(BuildRootPath(path));
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState not-registered start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath), &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState not-registered ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_state_008.txt";
    LOGI("====>GetPlaceholderState008 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState root-not-exist start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath), &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState root-not-exist ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_mark_004.txt";
    char emptyStr[] = "";
    LOGI("====>MarkFileAsPlaceholder004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    CloudDisk_SyncFolderPath emptyFolder = BuildRootPath(emptyStr);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder empty-folder start");
    auto retEmptyFolder = OH_CloudDisk_MarkFileAsPlaceholder(emptyFolder, filePathInfo);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder empty-folder ret: %{public}d", retEmptyFolder);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo emptyFile = BuildPathInfo(emptyStr);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder empty-file start");
    auto retEmptyFile = OH_CloudDisk_MarkFileAsPlaceholder(syncFolderPath, emptyFile);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder empty-file ret: %{public}d", retEmptyFile);
    bool ok = (retEmptyFolder == CLOUD_DISK_INVALID_ARG || retEmptyFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retEmptyFile == CLOUD_DISK_INVALID_ARG || retEmptyFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_mark_005.txt";
    LOGI("====>MarkFileAsPlaceholder005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder ensure start");
    OH_CloudDisk_UnregisterSyncFolder(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder not-registered start");
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder not-registered ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_mark_006.txt";
    LOGI("====>MarkFileAsPlaceholder006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder root-not-exist start");
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder root-not-exist ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_unmark_004.txt";
    char emptyStr[] = "";
    LOGI("====>UnmarkPlaceholderFile004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    CloudDisk_SyncFolderPath emptyFolder = BuildRootPath(emptyStr);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile empty-folder start");
    auto retEmptyFolder = OH_CloudDisk_UnmarkPlaceholderFile(emptyFolder, filePathInfo);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile empty-folder ret: %{public}d", retEmptyFolder);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo emptyFile = BuildPathInfo(emptyStr);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile empty-file start");
    auto retEmptyFile = OH_CloudDisk_UnmarkPlaceholderFile(syncFolderPath, emptyFile);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile empty-file ret: %{public}d", retEmptyFile);
    bool ok = (retEmptyFolder == CLOUD_DISK_INVALID_ARG || retEmptyFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retEmptyFile == CLOUD_DISK_INVALID_ARG || retEmptyFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_unmark_005.txt";
    LOGI("====>UnmarkPlaceholderFile005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder ensure start");
    OH_CloudDisk_UnregisterSyncFolder(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile not-registered start");
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile not-registered ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_unmark_006.txt";
    LOGI("====>UnmarkPlaceholderFile006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile root-not-exist start");
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile root-not-exist ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_custom_get_004.txt";
    char emptyStr[] = "";
    LOGI("====>GetPlaceholderCustomInfo004 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo empty-folder start");
    auto retEmptyFolder = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(emptyStr),
        BuildPathInfo(relativePath), dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo empty-folder ret: %{public}d", retEmptyFolder);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo empty-file start");
    auto retEmptyFile = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path),
        BuildPathInfo(emptyStr), dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo empty-file ret: %{public}d", retEmptyFile);
    bool ok = (retEmptyFolder == CLOUD_DISK_INVALID_ARG || retEmptyFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retEmptyFile == CLOUD_DISK_INVALID_ARG || retEmptyFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_custom_get_005.txt";
    LOGI("====>GetPlaceholderCustomInfo005 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder ensure start");
    OH_CloudDisk_UnregisterSyncFolder(BuildRootPath(path));
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo not-registered start");
    auto ret = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo not-registered ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_custom_get_006.txt";
    LOGI("====>GetPlaceholderCustomInfo006 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo root-not-exist start");
    auto ret = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo root-not-exist ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_unmark_007.txt";
    LOGI("====>UnmarkPlaceholderFile007 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("UnmarkPlaceholderFile007 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    g_multiChunkMode = true;
    g_stopAfterFirstChunk = true;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(kHydrateTotalBytes, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare ret: %{public}d", hydrateRet);
    bool partialReady = false;
    int partialWaitedMs = 0;
    while (partialWaitedMs < 3000) {
        if (g_fetchInvoked && g_deliveredBytes >= kHydrateChunkBytes) {
            partialReady = true;
            break;
        }
        usleep(100 * 1000);
        partialWaitedMs += 100;
    }
    LOGW("====>UnmarkPlaceholderFile007 partial-hydrated ready: %{public}d, chunkOffset: %{public}llu",
        partialReady ? 1 : 0, static_cast<unsigned long long>(g_deliveredBytes));
    g_multiChunkMode = false;
    g_stopAfterFirstChunk = false;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-after-partial start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-after-partial ret: %{public}d", cancelRet);
    bool cancelArrived = WaitCancelArrived(kDefaultWaitMs);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile partially-hydrated start");
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile partially-hydrated ret: %{public}d", ret);
    bool ok = partialReady && cancelRet == CLOUD_DISK_OK && cancelArrived &&
        (ret == OH_CLOUD_DISK_PLACEHOLDER_NOT_FULLY_HYDRATED || ret == CLOUD_DISK_NOT_SUPPORTED);
    TryRemoveFile("UnmarkPlaceholderFile007 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_unmark_008.txt";
    LOGI("====>UnmarkPlaceholderFile008 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("UnmarkPlaceholderFile008 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    g_blockFetchResponse = true;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitFetchInvoked(kDefaultWaitMs);
    g_blockFetchResponse = true;
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile hydrate-in-progress start");
    auto ret = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile hydrate-in-progress ret: %{public}d", ret);
    bool ok = triggered &&
        (ret == OH_CLOUD_DISK_HYDRATE_IN_PROGRESS || ret == CLOUD_DISK_NOT_SUPPORTED);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup ret: %{public}d", cancelRet);
    TryRemoveFile("UnmarkPlaceholderFile008 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_custom_get_007.txt";
    LOGI("====>GetPlaceholderCustomInfo007 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo file-not-exist start");
    auto ret = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo file-not-exist ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_custom_get_008.txt";
    LOGI("====>GetPlaceholderCustomInfo008 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderCustomInfo008 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare start");
    auto convertRet = OH_CloudDisk_ConvertPlaceholderToFile(BuildRootPath(path),
        BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare ret: %{public}d", convertRet);
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo normal-file start");
    auto ret = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo normal-file ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_NOT_A_PLACEHOLDER || ret == CLOUD_DISK_NOT_SUPPORTED;
    TryRemoveFile("GetPlaceholderCustomInfo008 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_009.txt";
    LOGI("====>GetPlaceholderState009 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderState009 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitFetchInvoked(kDefaultWaitMs);
    LOGW("====>OH_CloudDisk_DehydrateFile prepare start");
    auto dehydrateRet = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile prepare ret: %{public}d", dehydrateRet);
    OH_CloudDisk_PlaceholderState stateAfterDehydrate = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState after-dehydrate start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath),
        &stateAfterDehydrate);
    LOGW("====>OH_CloudDisk_GetPlaceholderState after-dehydrate ret: %{public}d, state: %{public}d",
        ret, static_cast<int>(stateAfterDehydrate));
    bool ok = hydrateRet == CLOUD_DISK_OK && triggered && dehydrateRet == CLOUD_DISK_OK &&
        ret == CLOUD_DISK_OK && stateAfterDehydrate == OH_CLOUD_DISK_PLACEHOLDER_STATE_UNHYDRATED;
    TryRemoveFile("GetPlaceholderState009 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_mark_007.txt";
    LOGI("====>MarkFileAsPlaceholder007 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("MarkFileAsPlaceholder007 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare start");
    auto convertRet = OH_CloudDisk_ConvertPlaceholderToFile(BuildRootPath(path),
        BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare ret: %{public}d", convertRet);
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder start");
    auto markRet = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder ret: %{public}d", markRet);
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState mark-result start");
    auto stateRet = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath),
        &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState mark-result ret: %{public}d, state: %{public}d",
        stateRet, static_cast<int>(state));
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo mark-result start");
    auto customRet = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path),
        BuildPathInfo(relativePath), dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo mark-result ret: %{public}d", customRet);
    bool ok = markRet == CLOUD_DISK_OK &&
        stateRet == CLOUD_DISK_OK && state == OH_CLOUD_DISK_PLACEHOLDER_STATE_FULLY_HYDRATED &&
        (customRet == OH_CLOUD_DISK_PLACEHOLDER_CUSTOM_INFO_NOT_FOUND || customRet == CLOUD_DISK_NOT_SUPPORTED);
    TryRemoveFile("MarkFileAsPlaceholder007 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_mark_008.txt";
    LOGI("====>MarkFileAsPlaceholder008 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("MarkFileAsPlaceholder008 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    g_multiChunkMode = true;
    g_stopAfterFirstChunk = true;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(kHydrateTotalBytes, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare ret: %{public}d", hydrateRet);
    bool partialReady = false;
    int partialWaitedMs = 0;
    while (partialWaitedMs < 3000) {
        if (g_fetchInvoked && g_deliveredBytes >= kHydrateChunkBytes) {
            partialReady = true;
            break;
        }
        usleep(100 * 1000);
        partialWaitedMs += 100;
    }
    LOGW("====>MarkFileAsPlaceholder008 partial-hydrated ready: %{public}d, chunkOffset: %{public}llu",
        partialReady ? 1 : 0, static_cast<unsigned long long>(g_deliveredBytes));
    g_multiChunkMode = false;
    g_stopAfterFirstChunk = false;
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder partially-hydrated start");
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder partially-hydrated ret: %{public}d", ret);
    bool ok = partialReady &&
        (ret == OH_CLOUD_DISK_HYDRATE_IN_PROGRESS || ret == CLOUD_DISK_NOT_SUPPORTED);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup ret: %{public}d", cancelRet);
    TryRemoveFile("MarkFileAsPlaceholder008 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value MarkFileAsPlaceholder009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_mark_009.txt";
    LOGI("====>MarkFileAsPlaceholder009 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("MarkFileAsPlaceholder009 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    g_blockFetchResponse = true;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitFetchInvoked(kDefaultWaitMs);
    g_blockFetchResponse = true;
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder hydrate-in-progress start");
    auto ret = OH_CloudDisk_MarkFileAsPlaceholder(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_MarkFileAsPlaceholder hydrate-in-progress ret: %{public}d", ret);
    bool ok = triggered &&
        (ret == OH_CLOUD_DISK_HYDRATE_IN_PROGRESS || ret == CLOUD_DISK_NOT_SUPPORTED);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup ret: %{public}d", cancelRet);
    TryRemoveFile("MarkFileAsPlaceholder009 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnmarkPlaceholderFile009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_unmark_009.txt";
    LOGI("====>UnmarkPlaceholderFile009 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("UnmarkPlaceholderFile009 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile start");
    auto unmarkRet = OH_CloudDisk_UnmarkPlaceholderFile(BuildRootPath(path), BuildPathInfo(relativePath));
    LOGW("====>OH_CloudDisk_UnmarkPlaceholderFile ret: %{public}d", unmarkRet);
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState unmark-result start");
    auto stateRet = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath),
        &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState unmark-result ret: %{public}d, state: %{public}d",
        stateRet, static_cast<int>(state));
    bool ok = (unmarkRet == OH_CLOUD_DISK_PLACEHOLDER_NOT_FULLY_HYDRATED || unmarkRet == CLOUD_DISK_NOT_SUPPORTED) &&
        stateRet == CLOUD_DISK_OK && state == OH_CLOUD_DISK_PLACEHOLDER_STATE_UNHYDRATED;
    TryRemoveFile("UnmarkPlaceholderFile009 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CustomInfoUpdate001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "custom_info_update_001.txt";
    LOGI("====>CustomInfoUpdate001 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("CustomInfoUpdate001 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    static uint8_t customDataA[] = "custom_info_AAAA";
    OH_CloudDisk_PlaceholderCustomInfo customInfoA = {0};
    customInfoA.dataLength = sizeof(customDataA) - 1;
    customInfoA.data = customDataA;
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info-A start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), &customInfoA);
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info-A ret: %{public}d", createRet);
    static uint8_t customDataB[] = "custom_info_BBBB";
    OH_CloudDisk_PlaceholderCustomInfo customInfoB = {0};
    customInfoB.dataLength = sizeof(customDataB) - 1;
    customInfoB.data = customDataB;
    LOGW("====>OH_CloudDisk_UpdatePlaceholder with-custom-info-B start");
    auto updateRet = OH_CloudDisk_UpdatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(2048, 1700000100000, 1700000101000), &customInfoB);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder with-custom-info-B ret: %{public}d", updateRet);
    uint8_t dataBuf[64] = {0};
    size_t inOutLen = sizeof(dataBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo start");
    auto getRet = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        dataBuf, &inOutLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo ret: %{public}d, inOutLen: %{public}zu", getRet, inOutLen);
    bool contentIsB = getRet == CLOUD_DISK_OK && inOutLen == sizeof(customDataB) - 1 &&
        memcmp(dataBuf, customDataB, sizeof(customDataB) - 1) == 0;
    LOGW("====>CustomInfoUpdate001 content-is-B check: %{public}d", contentIsB ? 1 : 0);
    bool ok = createRet == CLOUD_DISK_OK && updateRet == CLOUD_DISK_OK && contentIsB;
    TryRemoveFile("CustomInfoUpdate001 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderCustomInfo009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_custom_get_009.txt";
    LOGI("====>GetPlaceholderCustomInfo009 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderCustomInfo009 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    static uint8_t customData[] = "custom_info_009";
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData) - 1;
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), &customInfo);
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info prepare ret: %{public}d", createRet);
    uint8_t smallBuf[4] = {0};
    size_t smallLen = sizeof(smallBuf);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo small-buffer start, smallLen: %{public}zu", smallLen);
    auto ret = OH_CloudDisk_GetPlaceholderCustomInfo(BuildRootPath(path), BuildPathInfo(relativePath),
        smallBuf, &smallLen);
    LOGW("====>OH_CloudDisk_GetPlaceholderCustomInfo small-buffer ret: %{public}d, smallLen: %{public}zu",
        ret, smallLen);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    TryRemoveFile("GetPlaceholderCustomInfo009 post-clean", fullPath);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetPlaceholderState010(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_state_010.txt";
    LOGI("====>GetPlaceholderState010 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("GetPlaceholderState010 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    g_multiChunkMode = true;
    g_stopAfterFirstChunk = true;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(kHydrateTotalBytes, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare ret: %{public}d", hydrateRet);
    bool partialReady = false;
    int partialWaitedMs = 0;
    while (partialWaitedMs < 3000) {
        if (g_fetchInvoked && g_deliveredBytes >= kHydrateChunkBytes) {
            partialReady = true;
            break;
        }
        usleep(100 * 1000);
        partialWaitedMs += 100;
    }
    g_multiChunkMode = false;
    g_stopAfterFirstChunk = false;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel prepare start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel prepare ret: %{public}d", cancelRet);
    bool cancelNotified = WaitCancelArrived(kDefaultWaitMs);
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    LOGW("====>OH_CloudDisk_GetPlaceholderState after-cancel start");
    auto ret = OH_CloudDisk_GetPlaceholderState(BuildRootPath(path), BuildPathInfo(relativePath), &state);
    LOGW("====>OH_CloudDisk_GetPlaceholderState after-cancel ret: %{public}d, state: %{public}d",
        ret, static_cast<int>(state));
    bool ok = partialReady && cancelRet == CLOUD_DISK_OK && cancelNotified &&
        ret == CLOUD_DISK_OK && state == OH_CLOUD_DISK_PLACEHOLDER_STATE_PARTIALLY_HYDRATED;
    TryRemoveFile("GetPlaceholderState010 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholderAfterHydrate001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "update_after_hydrate_001.txt";
    LOGI("====>UpdatePlaceholderAfterHydrate001 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    TryRemoveFile("UpdatePlaceholderAfterHydrate001 pre-clean", fullPath);
    auto regPrepRet = PrepareDefaultRoot();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PrepareDefaultRoot not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackFlags();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(BuildRootPath(path), DispatchCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = BuildRootPath(path);
    CloudDisk_PathInfo filePathInfo = BuildPathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitFetchInvoked(kDefaultWaitMs);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder after-hydrate start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(BuildRootPath(path), BuildPathInfo(relativePath),
        BuildPlaceholderMeta(4096, 1700000200000, 1700000201000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder after-hydrate ret: %{public}d", ret);
    bool ok = hydrateRet == CLOUD_DISK_OK && triggered && ret == CLOUD_DISK_OK;
    TryRemoveFile("UpdatePlaceholderAfterHydrate001 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(BuildRootPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    TeardownDefaultRoot();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value Tset_CloudDisk_PlaceholderState_ENUM(napi_env env, napi_callback_info info)
{
    OH_CloudDisk_PlaceholderState state = OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE;
    NAPI_ASSERT(env, state == 0, "OH_CLOUD_DISK_PLACEHOLDER_STATE_NONE is fail.");
    state = OH_CLOUD_DISK_PLACEHOLDER_STATE_UNHYDRATED;
    NAPI_ASSERT(env, state == 1, "OH_CLOUD_DISK_PLACEHOLDER_STATE_UNHYDRATED is fail.");
    state = OH_CLOUD_DISK_PLACEHOLDER_STATE_PARTIALLY_HYDRATED;
    NAPI_ASSERT(env, state == 2, "OH_CLOUD_DISK_PLACEHOLDER_STATE_PARTIALLY_HYDRATED is fail.");
    state = OH_CLOUD_DISK_PLACEHOLDER_STATE_FULLY_HYDRATED;
    NAPI_ASSERT(env, state == 3, "OH_CLOUD_DISK_PLACEHOLDER_STATE_FULLY_HYDRATED is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetPlaceholderState001", nullptr, GetPlaceholderState001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState002", nullptr, GetPlaceholderState002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState003", nullptr, GetPlaceholderState003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState004", nullptr, GetPlaceholderState004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState005", nullptr, GetPlaceholderState005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState006", nullptr, GetPlaceholderState006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState007", nullptr, GetPlaceholderState007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState008", nullptr, GetPlaceholderState008, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState009", nullptr, GetPlaceholderState009, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderState010", nullptr, GetPlaceholderState010, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder001", nullptr, MarkFileAsPlaceholder001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder002", nullptr, MarkFileAsPlaceholder002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder003", nullptr, MarkFileAsPlaceholder003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder004", nullptr, MarkFileAsPlaceholder004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder005", nullptr, MarkFileAsPlaceholder005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder006", nullptr, MarkFileAsPlaceholder006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder007", nullptr, MarkFileAsPlaceholder007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder008", nullptr, MarkFileAsPlaceholder008, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MarkFileAsPlaceholder009", nullptr, MarkFileAsPlaceholder009, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile001", nullptr, UnmarkPlaceholderFile001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile002", nullptr, UnmarkPlaceholderFile002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile003", nullptr, UnmarkPlaceholderFile003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile004", nullptr, UnmarkPlaceholderFile004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile005", nullptr, UnmarkPlaceholderFile005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile006", nullptr, UnmarkPlaceholderFile006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile007", nullptr, UnmarkPlaceholderFile007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile008", nullptr, UnmarkPlaceholderFile008, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UnmarkPlaceholderFile009", nullptr, UnmarkPlaceholderFile009, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo001", nullptr, GetPlaceholderCustomInfo001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo002", nullptr, GetPlaceholderCustomInfo002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo003", nullptr, GetPlaceholderCustomInfo003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo004", nullptr, GetPlaceholderCustomInfo004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo005", nullptr, GetPlaceholderCustomInfo005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo006", nullptr, GetPlaceholderCustomInfo006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo007", nullptr, GetPlaceholderCustomInfo007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo008", nullptr, GetPlaceholderCustomInfo008, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetPlaceholderCustomInfo009", nullptr, GetPlaceholderCustomInfo009, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CustomInfoUpdate001", nullptr, CustomInfoUpdate001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdatePlaceholderAfterHydrate001", nullptr, UpdatePlaceholderAfterHydrate001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Tset_CloudDisk_PlaceholderState_ENUM", nullptr, Tset_CloudDisk_PlaceholderState_ENUM, nullptr,
         nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "clouddisk2",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule2(void)
{
    napi_module_register(&demoModule);
}
