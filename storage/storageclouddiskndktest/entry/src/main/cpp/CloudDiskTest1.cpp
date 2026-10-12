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

static int g_exCallbackCount = 0;
static int g_exLastOpType = -1;

static void OnSyncFolderExChangeCallback(const CloudDisk_SyncFolderPath syncFolderPath,
                                         const CloudDisk_ChangeData changeDatas[], size_t bufferLength)
{
    g_exCallbackCount++;
    LOGW("====>OnSyncFolderExChangeCallback triggered, path: %{public}s, bufferLength: %{public}zu",
         syncFolderPath.value, bufferLength);
    for (size_t i = 0; i < bufferLength; ++i) {
        g_exLastOpType = static_cast<int>(changeDatas[i].operationType);
        LOGW("====>OnSyncFolderExChangeCallback opType: %{public}d, usn: %{public}llu",
             g_exLastOpType, static_cast<unsigned long long>(changeDatas[i].updateSequenceNumber));
    }
}

static CloudDisk_SyncFolderPath MakeSyncFolderPath(char *path)
{
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    return pathInfo;
}

static CloudDisk_PathInfo MakePathInfo(char *path)
{
    CloudDisk_PathInfo pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    return pathInfo;
}

static OH_CloudDisk_PlaceholderInfo MakePlaceholderInfo(uint64_t logicalSize, uint64_t atimeMs, uint64_t mtimeMs)
{
    OH_CloudDisk_PlaceholderInfo placeholderInfo;
    placeholderInfo.logicalSize = logicalSize;
    placeholderInfo.atimeMs = atimeMs;
    placeholderInfo.mtimeMs = mtimeMs;
    return placeholderInfo;
}

static char g_exAlias[] = "CloudDiskTest1";

static OH_CloudDisk_SyncFolderEx MakeSyncFolderExWithState(char *path, bool supportPlaceholder,
                                                           CloudDisk_SyncFolderState state)
{
    OH_CloudDisk_SyncFolderEx syncFolderEx = {0};
    syncFolderEx.version = OH_CLOUD_DISK_SYNC_FOLDER_EX_VERSION_1;
    syncFolderEx.path = MakeSyncFolderPath(path);
    syncFolderEx.state = state;
    syncFolderEx.displayNameInfo.displayNameResId = 0;
    syncFolderEx.displayNameInfo.customAlias = g_exAlias;
    syncFolderEx.displayNameInfo.customAliasLength = strlen(g_exAlias);
    syncFolderEx.isSupportPlaceHolder = supportPlaceholder;
    return syncFolderEx;
}

static OH_CloudDisk_SyncFolderEx MakeSyncFolderEx(char *path, bool supportPlaceholder)
{
    return MakeSyncFolderExWithState(path, supportPlaceholder, CloudDisk_SyncFolderState::ACTIVE);
}

static bool IsSameFolderPath(const char *a, const char *b)
{
    if (a == nullptr || b == nullptr) {
        return false;
    }
    size_t la = strlen(a);
    size_t lb = strlen(b);
    while (la > 1 && a[la - 1] == '/') {
        la--;
    }
    while (lb > 1 && b[lb - 1] == '/') {
        lb--;
    }
    return la == lb && strncmp(a, b, la) == 0;
}

static bool CheckSyncFolderExSupportPlaceholder(char *path, bool expectedSupport)
{
    OH_CloudDisk_SyncFolderEx *syncFolders = nullptr;
    size_t count = 0;
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx start");
    auto ret = OH_CloudDisk_GetSyncFoldersEx(&syncFolders, &count);
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx ret: %{public}d, count: %{public}zu", ret, count);
    if (ret != CLOUD_DISK_OK || syncFolders == nullptr) {
        LOGE("====>CheckSyncFolderExSupportPlaceholder get failed, ret: %{public}d", ret);
        return false;
    }
    for (size_t i = 0; i < count; ++i) {
        if (IsSameFolderPath(syncFolders[i].path.value, path)) {
            LOGW("====>CheckSyncFolderExSupportPlaceholder found, path: %{public}s, isSupportPlaceHolder: %{public}d",
                 syncFolders[i].path.value, syncFolders[i].isSupportPlaceHolder ? 1 : 0);
            return syncFolders[i].isSupportPlaceHolder == expectedSupport;
        }
    }
    LOGE("====>CheckSyncFolderExSupportPlaceholder path not found: %{public}s", path);
    return false;
}

static bool CheckSyncFolderExState(char *path, CloudDisk_SyncFolderState expectedState)
{
    OH_CloudDisk_SyncFolderEx *syncFolders = nullptr;
    size_t count = 0;
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx state-check start");
    auto ret = OH_CloudDisk_GetSyncFoldersEx(&syncFolders, &count);
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx state-check ret: %{public}d, count: %{public}zu", ret, count);
    if (ret != CLOUD_DISK_OK || syncFolders == nullptr) {
        LOGE("====>CheckSyncFolderExState get failed, ret: %{public}d", ret);
        return false;
    }
    for (size_t i = 0; i < count; ++i) {
        if (IsSameFolderPath(syncFolders[i].path.value, path)) {
            LOGW("====>CheckSyncFolderExState found, path: %{public}s, state: %{public}d",
                 syncFolders[i].path.value, static_cast<int>(syncFolders[i].state));
            return syncFolders[i].state == expectedState;
        }
    }
    LOGE("====>CheckSyncFolderExState path not found: %{public}s", path);
    return false;
}

static bool CheckSyncFolderExAlias(char *path, const char *expectedAlias)
{
    OH_CloudDisk_SyncFolderEx *syncFolders = nullptr;
    size_t count = 0;
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx alias-check start");
    auto ret = OH_CloudDisk_GetSyncFoldersEx(&syncFolders, &count);
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx alias-check ret: %{public}d, count: %{public}zu", ret, count);
    if (ret != CLOUD_DISK_OK || syncFolders == nullptr) {
        LOGE("====>CheckSyncFolderExAlias get failed, ret: %{public}d", ret);
        return false;
    }
    for (size_t i = 0; i < count; ++i) {
        if (IsSameFolderPath(syncFolders[i].path.value, path)) {
            const char *alias = syncFolders[i].displayNameInfo.customAlias;
            size_t aliasLen = syncFolders[i].displayNameInfo.customAliasLength;
            bool match = alias != nullptr && aliasLen == strlen(expectedAlias) &&
                         strncmp(alias, expectedAlias, aliasLen) == 0;
            LOGW("====>CheckSyncFolderExAlias found, path: %{public}s, alias: %{public}s, match: %{public}d",
                 syncFolders[i].path.value, alias == nullptr ? "" : alias, match ? 1 : 0);
            return match;
        }
    }
    LOGE("====>CheckSyncFolderExAlias path not found: %{public}s", path);
    return false;
}

static void CleanupExLifecycle(char *path)
{
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregRet);
}

static napi_value SyncFolderExLifecycle001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char alias[] = "SyncExAlias001";
    LOGI("====>SyncFolderExLifecycle001 params: path: %{public}s, alias: %{public}s", path, alias);

    // step1: register sync folder ex with placeholder support true
    auto syncFolderExTrue = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx support-true start");
    auto regTrueRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderExTrue);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx support-true ret: %{public}d", regTrueRet);
    if (regTrueRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>SyncFolderExLifecycle001 device not supported, skip lifecycle");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    if (regTrueRet != CLOUD_DISK_OK) {
        LOGE("====>SyncFolderExLifecycle001 step1 check failed, regTrueRet: %{public}d", regTrueRet);
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step2: get sync folders ex, expect support placeholder true
    if (!CheckSyncFolderExSupportPlaceholder(path, true)) {
        LOGE("====>SyncFolderExLifecycle001 step2 check failed, expect isSupportPlaceHolder true");
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step3: unregister sync folder
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder ret: %{public}d", unregRet);
    if (unregRet != CLOUD_DISK_OK) {
        LOGE("====>SyncFolderExLifecycle001 step3 check failed, unregRet: %{public}d", unregRet);
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step4: register sync folder ex with placeholder support false
    auto syncFolderExFalse = MakeSyncFolderEx(path, false);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx support-false start");
    auto regFalseRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderExFalse);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx support-false ret: %{public}d", regFalseRet);
    if (regFalseRet != CLOUD_DISK_OK) {
        LOGE("====>SyncFolderExLifecycle001 step4 check failed, regFalseRet: %{public}d", regFalseRet);
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step5: get sync folders ex, expect support placeholder false
    if (!CheckSyncFolderExSupportPlaceholder(path, false)) {
        LOGE("====>SyncFolderExLifecycle001 step5 check failed, expect isSupportPlaceHolder false");
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step6: update custom alias
    LOGW("====>OH_CloudDisk_UpdateCustomAlias start");
    auto aliasRet = OH_CloudDisk_UpdateCustomAlias(MakeSyncFolderPath(path), alias, strlen(alias));
    LOGW("====>OH_CloudDisk_UpdateCustomAlias ret: %{public}d", aliasRet);
    if (aliasRet != CLOUD_DISK_OK) {
        LOGE("====>SyncFolderExLifecycle001 step6 check failed, aliasRet: %{public}d", aliasRet);
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step7: deactive sync folder
    LOGW("====>OH_CloudDisk_DeactiveSyncFolder start");
    auto deactiveRet = OH_CloudDisk_DeactiveSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_DeactiveSyncFolder ret: %{public}d", deactiveRet);
    if (deactiveRet != CLOUD_DISK_OK) {
        LOGE("====>SyncFolderExLifecycle001 step7 check failed, deactiveRet: %{public}d", deactiveRet);
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step8: active sync folder
    LOGW("====>OH_CloudDisk_ActiveSyncFolder start");
    auto activeRet = OH_CloudDisk_ActiveSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_ActiveSyncFolder ret: %{public}d", activeRet);
    if (activeRet != CLOUD_DISK_OK) {
        LOGE("====>SyncFolderExLifecycle001 step8 check failed, activeRet: %{public}d", activeRet);
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step9: unregister sync folder, best effort cleanup
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregFolderRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregFolderRet);
    if (unregFolderRet != CLOUD_DISK_OK) {
        LOGE("====>SyncFolderExLifecycle001 step9 check failed, unregFolderRet: %{public}d", unregFolderRet);
        CleanupExLifecycle(path);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegisterSyncFolderEx002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    LOGI("====>RegisterSyncFolderEx002 params: path: %{public}s", path);
    auto syncFolderEx = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx start");
    auto ret = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterSyncFolderEx003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char notFolder[] = "sync_ex_not_folder_003.txt";
    LOGI("====>RegisterSyncFolderEx003 params: path: %{public}s, notFolder: %{public}s", path, notFolder);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, notFolder);
    auto syncFolderExPrepare = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare start");
    auto prepareRegRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderExPrepare);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare ret: %{public}d", prepareRegRet);
    if (prepareRegRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterSyncFolderEx003 device not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(notFolder),
                                                    MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder prepare start");
    auto prepareUnregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder prepare ret: %{public}d", prepareUnregRet);
    auto syncFolderEx = MakeSyncFolderEx(fullPath, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx not-folder start");
    auto ret = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx not-folder ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_NOT_A_DIRECTORY || ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    if (ret == CLOUD_DISK_OK) {
        LOGW("====>OH_CloudDisk_UnregisterSyncFolder not-folder cleanup start");
        auto notFolderUnregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(fullPath));
        LOGW("====>OH_CloudDisk_UnregisterSyncFolder not-folder cleanup ret: %{public}d", notFolderUnregRet);
    }
    LOGW("====>RegisterSyncFolderEx003 cleanup remove file: %{public}s", fullPath);
    remove(fullPath);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterSyncFolderEx004(napi_env env, napi_callback_info info)
{
    LOGI("====>RegisterSyncFolderEx004 params: syncFolder: nullptr");
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx null start");
    auto ret = OH_CloudDisk_RegisterSyncFolderEx(nullptr);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx null ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterSyncFolderEx005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>RegisterSyncFolderEx005 params: path: %{public}s, version: 0", path);
    auto syncFolderEx = MakeSyncFolderEx(path, true);
    syncFolderEx.version = 0;
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx invalid-version start");
    auto ret = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx invalid-version ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterSyncFolderEx006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Desktop/";
    LOGI("====>RegisterSyncFolderEx006 params: path: %{public}s", path);
    auto syncFolderEx = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx unauthorized start");
    auto ret = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx unauthorized ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_UNAUTHORIZED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterSyncFolderEx007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>RegisterSyncFolderEx007 params: path: %{public}s", path);
    auto syncFolderExFirst = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx first start");
    auto firstRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderExFirst);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx first ret: %{public}d", firstRet);
    if (firstRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterSyncFolderEx007 device not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    auto syncFolderExSecond = MakeSyncFolderEx(path, false);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx second start");
    auto ret = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderExSecond);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx second ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_CONFLICT_THIS_APP || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregRet);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetSyncFoldersEx001(napi_env env, napi_callback_info info)
{
    LOGI("====>GetSyncFoldersEx001 params: syncFolders: nullptr");
    size_t count = 0;
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx null-folders start");
    auto ret = OH_CloudDisk_GetSyncFoldersEx(nullptr, &count);
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx null-folders ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value GetSyncFoldersEx002(napi_env env, napi_callback_info info)
{
    LOGI("====>GetSyncFoldersEx002 params: count: nullptr");
    OH_CloudDisk_SyncFolderEx *syncFolders = nullptr;
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx null-count start");
    auto ret = OH_CloudDisk_GetSyncFoldersEx(&syncFolders, nullptr);
    LOGW("====>OH_CloudDisk_GetSyncFoldersEx null-count ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value Tset_SyncFolderExVersionMacro(napi_env env, napi_callback_info info)
{
    uint32_t version = OH_CLOUD_DISK_SYNC_FOLDER_EX_VERSION_1;
    LOGI("====>Tset_SyncFolderExVersionMacro version: %{public}u", version);
    NAPI_ASSERT(env, version == 1, "OH_CLOUD_DISK_SYNC_FOLDER_EX_VERSION_1 is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value SyncFolderChanges001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>SyncFolderChanges001 params: path: %{public}s", path);
    auto syncFolderEx = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare start");
    auto regRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare ret: %{public}d", regRet);
    if (regRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterSyncFolderEx prepare not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_exCallbackCount = 0;
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges first start");
    auto firstRet = OH_CloudDisk_RegisterSyncFolderChanges(MakeSyncFolderPath(path),
                                                           OnSyncFolderExChangeCallback);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges first ret: %{public}d", firstRet);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges second start");
    auto ret = OH_CloudDisk_RegisterSyncFolderChanges(MakeSyncFolderPath(path),
                                                      OnSyncFolderExChangeCallback);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges second ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_LISTENER_ALREADY_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges cleanup start");
    auto unregChangesRet = OH_CloudDisk_UnregisterSyncFolderChanges(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges cleanup ret: %{public}d", unregChangesRet);
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregRet);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value SyncFolderChanges002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>SyncFolderChanges002 params: path: %{public}s", path);
    auto syncFolderEx = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare start");
    auto regRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare ret: %{public}d", regRet);
    if (regRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterSyncFolderEx prepare not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges pre-clean start");
    auto preCleanRet = OH_CloudDisk_UnregisterSyncFolderChanges(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges pre-clean ret: %{public}d", preCleanRet);
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges no-listener start");
    auto ret = OH_CloudDisk_UnregisterSyncFolderChanges(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges no-listener ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_LISTENER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregRet);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value SyncFolderChanges003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>SyncFolderChanges003 params: path: %{public}s, callback: nullptr", path);
    auto syncFolderEx = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare start");
    auto regRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx prepare ret: %{public}d", regRet);
    if (regRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterSyncFolderEx prepare not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges null-callback start");
    auto ret = OH_CloudDisk_RegisterSyncFolderChanges(MakeSyncFolderPath(path), nullptr);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges null-callback ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregRet);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value SyncFolderExState001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>SyncFolderExState001 params: path: %{public}s, state: INACTIVE", path);
    auto syncFolderEx = MakeSyncFolderExWithState(path, true, CloudDisk_SyncFolderState::INACTIVE);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx inactive start");
    auto regRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx inactive ret: %{public}d", regRet);
    if (regRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>SyncFolderExState001 device not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    bool stateInactiveOk = false;
    if (regRet == CLOUD_DISK_OK) {
        stateInactiveOk = CheckSyncFolderExState(path, CloudDisk_SyncFolderState::INACTIVE);
    }
    LOGW("====>OH_CloudDisk_ActiveSyncFolder start");
    auto activeRet = OH_CloudDisk_ActiveSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_ActiveSyncFolder ret: %{public}d", activeRet);
    bool stateActiveOk = false;
    if (activeRet == CLOUD_DISK_OK) {
        stateActiveOk = CheckSyncFolderExState(path, CloudDisk_SyncFolderState::ACTIVE);
    }
    bool ok = regRet == CLOUD_DISK_OK && stateInactiveOk && activeRet == CLOUD_DISK_OK && stateActiveOk;
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregRet);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value SyncFolderExAlias001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char alias[] = "SyncExAlias002";
    LOGI("====>SyncFolderExAlias001 params: path: %{public}s, alias: %{public}s", path, alias);
    auto syncFolderEx = MakeSyncFolderEx(path, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx start");
    auto regRet = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx ret: %{public}d", regRet);
    if (regRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>SyncFolderExAlias001 device not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    bool aliasInitialOk = false;
    if (regRet == CLOUD_DISK_OK) {
        aliasInitialOk = CheckSyncFolderExAlias(path, g_exAlias);
    }
    LOGW("====>OH_CloudDisk_UpdateCustomAlias start");
    auto aliasRet = OH_CloudDisk_UpdateCustomAlias(MakeSyncFolderPath(path), alias, strlen(alias));
    LOGW("====>OH_CloudDisk_UpdateCustomAlias ret: %{public}d", aliasRet);
    bool aliasUpdatedOk = false;
    if (aliasRet == CLOUD_DISK_OK) {
        aliasUpdatedOk = CheckSyncFolderExAlias(path, alias);
    }
    bool ok = regRet == CLOUD_DISK_OK && aliasInitialOk && aliasRet == CLOUD_DISK_OK && aliasUpdatedOk;
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder cleanup ret: %{public}d", unregRet);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterSyncFolderEx008(napi_env env, napi_callback_info info)
{
    char emptyStr[] = "";
    LOGI("====>RegisterSyncFolderEx008 params: path: empty string");
    auto syncFolderEx = MakeSyncFolderEx(emptyStr, true);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx empty-path start");
    auto ret = OH_CloudDisk_RegisterSyncFolderEx(&syncFolderEx);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderEx empty-path ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value SyncFolderChanges004(napi_env env, napi_callback_info info)
{
    char emptyStr[] = "";
    LOGI("====>SyncFolderChanges004 params: path: empty string");
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges empty-path start");
    auto ret = OH_CloudDisk_RegisterSyncFolderChanges(MakeSyncFolderPath(emptyStr),
                                                      OnSyncFolderExChangeCallback);
    LOGW("====>OH_CloudDisk_RegisterSyncFolderChanges empty-path ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value SyncFolderChanges005(napi_env env, napi_callback_info info)
{
    char emptyStr[] = "";
    LOGI("====>SyncFolderChanges005 params: path: empty string");
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges empty-path start");
    auto ret = OH_CloudDisk_UnregisterSyncFolderChanges(MakeSyncFolderPath(emptyStr));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolderChanges empty-path ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"SyncFolderExLifecycle001", nullptr, SyncFolderExLifecycle001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSyncFolderEx002", nullptr, RegisterSyncFolderEx002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSyncFolderEx003", nullptr, RegisterSyncFolderEx003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSyncFolderEx004", nullptr, RegisterSyncFolderEx004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSyncFolderEx005", nullptr, RegisterSyncFolderEx005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSyncFolderEx006", nullptr, RegisterSyncFolderEx006, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSyncFolderEx007", nullptr, RegisterSyncFolderEx007, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"RegisterSyncFolderEx008", nullptr, RegisterSyncFolderEx008, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetSyncFoldersEx001", nullptr, GetSyncFoldersEx001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetSyncFoldersEx002", nullptr, GetSyncFoldersEx002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Tset_SyncFolderExVersionMacro", nullptr, Tset_SyncFolderExVersionMacro, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SyncFolderChanges001", nullptr, SyncFolderChanges001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SyncFolderChanges002", nullptr, SyncFolderChanges002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SyncFolderChanges003", nullptr, SyncFolderChanges003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SyncFolderChanges004", nullptr, SyncFolderChanges004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SyncFolderChanges005", nullptr, SyncFolderChanges005, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SyncFolderExState001", nullptr, SyncFolderExState001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SyncFolderExAlias001", nullptr, SyncFolderExAlias001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "clouddisk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule1(void)
{
    napi_module_register(&demoModule);
}
