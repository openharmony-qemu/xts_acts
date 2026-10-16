/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
#include <malloc.h>
#include <cstdio>
#include <unistd.h>
#include <sys/stat.h>
#include <js_native_api_types.h>
#include "common/logger_common.h"
#include "common/utils.h"

static uint64_t g_usn = 0;
static const size_t COUNT = 10;

static void call(const CloudDisk_SyncFolderPath syncFolderPath, const CloudDisk_ChangeData changeDatas[], size_t len)
{
    LOGI("OnChangeDataCallback start");
    for (int32_t i = 0; i < len; ++i) {
        auto data = changeDatas[i];
        auto operationType = data.operationType;
        auto path = data.relativePathInfo.value;
        auto length = data.relativePathInfo.length;
        g_usn = changeDatas[i].updateSequenceNumber;
    }
    LOGI("OnChangeDataCallback end");
}

static napi_value RegisterSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolder syncFolder;
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    syncFolder.path = pathInfo;
    syncFolder.state = CloudDisk_SyncFolderState::INACTIVE;

    CloudDisk_DisplayNameInfo displayNameInfo;
    char* newname = "Ntest";
    displayNameInfo.displayNameResId = 0;
    displayNameInfo.customAlias = newname;
    displayNameInfo.customAliasLength = strlen(displayNameInfo.customAlias);
    syncFolder.displayNameInfo = displayNameInfo;

    LOGW("OH_CloudDisk_RegisterSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_RegisterSyncFolder(&syncFolder);
    LOGW("OH_CloudDisk_RegisterSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value RegisterSyncFolder001(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolder syncFolder;
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    syncFolder.path = pathInfo;
    syncFolder.state = CloudDisk_SyncFolderState::ACTIVE;

    CloudDisk_DisplayNameInfo displayNameInfo;
    char* newname = "Ntest";
    displayNameInfo.displayNameResId = 1;
    displayNameInfo.customAlias = newname;
    displayNameInfo.customAliasLength = strlen(displayNameInfo.customAlias);
    syncFolder.displayNameInfo = displayNameInfo;

    LOGW("OH_CloudDisk_RegisterSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_RegisterSyncFolder(&syncFolder);
    LOGW("OH_CloudDisk_RegisterSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value UnregisterSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_UnregisterSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_UnregisterSyncFolder(pathInfo);
    LOGW("OH_CloudDisk_UnregisterSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value ActiveSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_ActiveSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_ActiveSyncFolder(pathInfo);
    LOGW("OH_CloudDisk_ActiveSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value DeactiveSyncFolder(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_DeactiveSyncFolder start.path: %{public}s", path);
    auto ret = OH_CloudDisk_DeactiveSyncFolder(pathInfo);
    LOGW("OH_CloudDisk_DeactiveSyncFolder ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value GetSyncFolders(napi_env env, napi_callback_info info)
{
    CloudDisk_SyncFolder *syncFolders;
    size_t count = 0;
    LOGW("OH_CloudDisk_GetSyncFolders start");
    auto ret = OH_CloudDisk_GetSyncFolders(&syncFolders, &count);
    LOGW("OH_CloudDisk_GetSyncFolders ret: %{public}d", ret, count);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value GetSyncFolders001(napi_env env, napi_callback_info info)
{
    CloudDisk_SyncFolder *syncFolders;
    LOGW("OH_CloudDisk_GetSyncFolders with null count start");
    auto ret = OH_CloudDisk_GetSyncFolders(&syncFolders, nullptr);
    LOGW("OH_CloudDisk_GetSyncFolders with null count ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value UpdateCustomAlias(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    char* updateDisPlayName = "Newname";

    LOGW("OH_CloudDisk_UpdateCustomAlias start.path: %{public}s", path);
    auto ret = OH_CloudDisk_UpdateCustomAlias(pathInfo, updateDisPlayName, strlen(updateDisPlayName));
    LOGW("OH_CloudDisk_UpdateCustomAlias ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value ReFolderChanges(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_RegisterSyncFolderChanges start.path: %{public}s", path);
    auto ret = OH_CloudDisk_RegisterSyncFolderChanges(pathInfo, &call);
    LOGW("OH_CloudDisk_RegisterSyncFolderChanges ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value UnReFolderChanges(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_UnregisterSyncFolderChanges start.path: %{public}s", path);
    auto ret = OH_CloudDisk_UnregisterSyncFolderChanges(pathInfo);
    LOGW("OH_CloudDisk_UnregisterSyncFolderChanges ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value GetSyncFolderChanges(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);
    CloudDisk_ChangesResult* changesResult = nullptr;

    LOGW("OH_CloudDisk_GetSyncFolderChanges start.path: %{public}s", path);
    auto ret = OH_CloudDisk_GetSyncFolderChanges(pathInfo, g_usn, COUNT, &changesResult);
    LOGW("OH_CloudDisk_GetSyncFolderChanges ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value Tset_CloudDisk_ErrorCode_ENUM(napi_env env, napi_callback_info info)
{
    CloudDisk_ErrorCode errcode = CLOUD_DISK_OK;
    NAPI_ASSERT(env, errcode == 0, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_PERMISSION_DENIED;
    NAPI_ASSERT(env, errcode == 201, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_NOT_SUPPORTED;
    NAPI_ASSERT(env, errcode == 801, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_INVALID_ARG;
    NAPI_ASSERT(env, errcode == 34400001, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_PATH_UNAUTHORIZED;
    NAPI_ASSERT(env, errcode == 34400002, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_IPC_FAILED;
    NAPI_ASSERT(env, errcode == 34400003, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_LIMIT_EXCEEDED;
    NAPI_ASSERT(env, errcode == 34400004, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_CONFLICT_THIS_APP;
    NAPI_ASSERT(env, errcode == 34400005, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_CONFLICT_OTHER_APP;
    NAPI_ASSERT(env, errcode == 34400006, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_REGISTER_SYNC_FOLDER_FAILED;
    NAPI_ASSERT(env, errcode == 34400007, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400008, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_UNREGISTER_SYNC_FOLDER_FAILED;
    NAPI_ASSERT(env, errcode == 34400009, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST;
    NAPI_ASSERT(env, errcode == 34400010, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_LISTENER_NOT_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400011, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_LISTENER_ALREADY_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400012, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_INVALID_CHANGE_SEQUENCE;
    NAPI_ASSERT(env, errcode == 34400013, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_TRY_AGAIN;
    NAPI_ASSERT(env, errcode == 34400014, "PREFERENCES_OK is fail.");
    errcode = CLOUD_DISK_NOT_ALLOWED;
    NAPI_ASSERT(env, errcode == 34400015, "PREFERENCES_OK is fail.");
    errcode = OH_CLOUD_DISK_FILE_ALREADY_EXISTS;
    NAPI_ASSERT(env, errcode == 34400016, "OH_CLOUD_DISK_FILE_ALREADY_EXISTS is fail.");
    errcode = OH_CLOUD_DISK_NOT_A_PLACEHOLDER;
    NAPI_ASSERT(env, errcode == 34400017, "OH_CLOUD_DISK_NOT_A_PLACEHOLDER is fail.");
    errcode = OH_CLOUD_DISK_IS_A_PLACEHOLDER;
    NAPI_ASSERT(env, errcode == 34400018, "OH_CLOUD_DISK_IS_A_PLACEHOLDER is fail.");
    errcode = OH_CLOUD_DISK_HYDRATE_IN_PROGRESS;
    NAPI_ASSERT(env, errcode == 34400019, "OH_CLOUD_DISK_HYDRATE_IN_PROGRESS is fail.");
    errcode = OH_CLOUD_DISK_NO_SPACE_LEFT;
    NAPI_ASSERT(env, errcode == 34400020, "OH_CLOUD_DISK_NO_SPACE_LEFT is fail.");
    errcode = OH_CLOUD_DISK_CALLBACK_NOT_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400021, "OH_CLOUD_DISK_CALLBACK_NOT_REGISTERED is fail.");
    errcode = OH_CLOUD_DISK_CALLBACK_ALREADY_REGISTERED;
    NAPI_ASSERT(env, errcode == 34400022, "OH_CLOUD_DISK_CALLBACK_ALREADY_REGISTERED is fail.");
    errcode = OH_CLOUD_DISK_NOT_A_DIRECTORY;
    NAPI_ASSERT(env, errcode == 34400023, "OH_CLOUD_DISK_NOT_A_DIRECTORY is fail.");
    errcode = OH_CLOUD_DISK_FILE_NOT_EXIST;
    NAPI_ASSERT(env, errcode == 34400024, "OH_CLOUD_DISK_FILE_NOT_EXIST is fail.");
    errcode = OH_CLOUD_DISK_NAME_TOO_LONG;
    NAPI_ASSERT(env, errcode == 34400025, "OH_CLOUD_DISK_NAME_TOO_LONG is fail.");
    errcode = OH_CLOUD_DISK_FILE_TOO_LARGE;
    NAPI_ASSERT(env, errcode == 34400026, "OH_CLOUD_DISK_FILE_TOO_LARGE is fail.");
    errcode = OH_CLOUD_DISK_PLACEHOLDER_CUSTOM_INFO_NOT_FOUND;
    NAPI_ASSERT(env, errcode == 34400027, "OH_CLOUD_DISK_PLACEHOLDER_CUSTOM_INFO_NOT_FOUND is fail.");
    errcode = OH_CLOUD_DISK_PLACEHOLDER_NOT_FULLY_HYDRATED;
    NAPI_ASSERT(env, errcode == 34400028, "OH_CLOUD_DISK_PLACEHOLDER_NOT_FULLY_HYDRATED is fail.");
    errcode = OH_CLOUD_DISK_DEHYDRATE_DENIED;
    NAPI_ASSERT(env, errcode == 34400029, "OH_CLOUD_DISK_DEHYDRATE_DENIED is fail.");
    errcode = OH_CLOUD_DISK_CANCELLED;
    NAPI_ASSERT(env, errcode == 34400030, "OH_CLOUD_DISK_CANCELLED is fail.");
    errcode = OH_CLOUD_DISK_ALREADY_HYDRATED;
    NAPI_ASSERT(env, errcode == 34400031, "OH_CLOUD_DISK_ALREADY_HYDRATED is fail.");
    errcode = OH_CLOUD_DISK_NO_HYDRATION_IN_PROGRESS;
    NAPI_ASSERT(env, errcode == 34400032, "OH_CLOUD_DISK_NO_HYDRATION_IN_PROGRESS is fail.");
    errcode = OH_CLOUD_DISK_INVALID_PLACEHOLDER_STATE;
    NAPI_ASSERT(env, errcode == 34400033, "OH_CLOUD_DISK_INVALID_PLACEHOLDER_STATE is fail.");
    errcode = OH_CLOUD_DISK_HYDRATION_TASK_LIMIT_REACHED;
    NAPI_ASSERT(env, errcode == 34400034, "OH_CLOUD_DISK_HYDRATION_TASK_LIMIT_REACHED is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Tset_CloudDisk_OperationType_ENUM(napi_env env, napi_callback_info info)
{
    CloudDisk_OperationType OperationType = CREATE;
    NAPI_ASSERT(env, OperationType == 0, "PREFERENCES_OK is fail.");
    OperationType = DELETE;
    NAPI_ASSERT(env, OperationType == 1, "PREFERENCES_OK is fail.");
    OperationType = MOVE_FROM;
    NAPI_ASSERT(env, OperationType == 2, "PREFERENCES_OK is fail.");
    OperationType = MOVE_TO;
    NAPI_ASSERT(env, OperationType == 3, "PREFERENCES_OK is fail.");
    OperationType = CLOSE_WRITE;
    NAPI_ASSERT(env, OperationType == 4, "PREFERENCES_OK is fail.");
    OperationType = SYNC_FOLDER_INVALID;
    NAPI_ASSERT(env, OperationType == 5, "PREFERENCES_OK is fail.");
    OperationType = OH_CLOUD_DISK_CLOSE_MODIFY;
    NAPI_ASSERT(env, OperationType == 6, "OH_CLOUD_DISK_CLOSE_MODIFY is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Tset_CloudDisk_ErrorReason_ENUM(napi_env env, napi_callback_info info)
{
    CloudDisk_ErrorReason ErrorReason = INVALID_ARGUMENT;
    NAPI_ASSERT(env, ErrorReason == 0, "PREFERENCES_OK is fail.");
    ErrorReason = NO_SUCH_FILE;
    NAPI_ASSERT(env, ErrorReason == 1, "PREFERENCES_OK is fail.");
    ErrorReason = NO_SPACE_LEFT;
    NAPI_ASSERT(env, ErrorReason == 2, "PREFERENCES_OK is fail.");
    ErrorReason = OUT_OF_RANGE;
    NAPI_ASSERT(env, ErrorReason == 3, "PREFERENCES_OK is fail.");
    ErrorReason = NO_SYNC_STATE;
    NAPI_ASSERT(env, ErrorReason == 4, "PREFERENCES_OK is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value SetFileSyncStates(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    char* path1 = "/storage/Users/currentUser/111.txt";
    char* path2 = "/storage/Users/currentUser/222.txt";
    char* path3 = "/storage/Users/currentUser/333.txt";
    char* path4 = "/storage/Users/currentUser/444.txt";
    char* path5 = "/storage/Users/currentUser/555.txt";
    char* path6 = "/storage/Users/currentUser/666.txt";
    CloudDisk_FileSyncState fileSyncStates[] = {
        {
            {
                .value = path1,
                .length = strlen(path1)
            },
            CloudDisk_SyncState::SYNC_SUCCEEDED
        },
        {
            {
                .value = path2,
                .length = strlen(path2)
            },
            CloudDisk_SyncState::SYNC_FAILED
        },
        {
            {
                .value = path3,
                .length = strlen(path3)
            },
            CloudDisk_SyncState::IDLE
        },
        {
            {
                .value = path4,
                .length = strlen(path4)
            },
            CloudDisk_SyncState::SYNCING
        },
        {
            {
                .value = path5,
                .length = strlen(path5)
            },
            CloudDisk_SyncState::SYNC_CANCELED
        },
        {
            {
                .value = path6,
                .length = strlen(path6)
            },
            CloudDisk_SyncState::SYNC_CONFLICTED
        }
    };
    CloudDisk_FailedList *failedLists;
    size_t failedCount;
    size_t bufferLength = sizeof(fileSyncStates) / sizeof(fileSyncStates[0]);

    LOGW("OH_CloudDisk_SetFileSyncStates start.path: %{public}s", path);
    auto ret = OH_CloudDisk_SetFileSyncStates(pathInfo, fileSyncStates, bufferLength, &failedLists, &failedCount);
    LOGW("OH_CloudDisk_SetFileSyncStates ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value GetFileSyncStates(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    char* path1 = "/storage/Users/currentUser/111.txt";
    char* path2 = "/storage/Users/currentUser/222.txt";
    CloudDisk_PathInfo paths[] = {
        {
            .value = path1,
            .length = strlen(path1)
        },
        {
            .value = path2,
            .length = strlen(path2)
        }
    };
    CloudDisk_ResultList *resultLists;
    size_t resultCount;

    LOGW("OH_CloudDisk_GetFileSyncStates start.path: %{public}s", path);
    auto ret = OH_CloudDisk_GetFileSyncStates(pathInfo, paths, sizeof(paths) / sizeof(paths[0]),
    &resultLists, &resultCount);
    LOGW("OH_CloudDisk_GetFileSyncStates ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static CloudDisk_SyncFolderPath MakeSyncFolderPath(char* path)
{
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(path);
    return pathInfo;
}

static CloudDisk_PathInfo MakePathInfo(char* path)
{
    CloudDisk_PathInfo pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(path);
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

static CloudDisk_ErrorCode RegisterDefaultSyncFolder()
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char alias[] = "CloudDiskTest";
    CloudDisk_SyncFolder syncFolder;
    syncFolder.path = MakeSyncFolderPath(path);
    syncFolder.state = CloudDisk_SyncFolderState::ACTIVE;
    syncFolder.displayNameInfo.displayNameResId = 0;
    syncFolder.displayNameInfo.customAlias = alias;
    syncFolder.displayNameInfo.customAliasLength = strlen(alias);
    LOGW("====>OH_CloudDisk_RegisterSyncFolder start");
    auto ret = OH_CloudDisk_RegisterSyncFolder(&syncFolder);
    LOGW("====>OH_CloudDisk_RegisterSyncFolder ret: %{public}d", ret);
    return ret;
}

static CloudDisk_ErrorCode UnregisterDefaultSyncFolder()
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder start");
    auto ret = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder ret: %{public}d", ret);
    return ret;
}

static void RemoveFileBestEffort(const char* tag, const char* fullPath)
{
    if (access(fullPath, F_OK) == 0) {
        LOGW("====>%{public}s remove file: %{public}s", tag, fullPath);
        if (remove(fullPath) != 0) {
            LOGE("====>%{public}s remove file failed: %{public}s", tag, fullPath);
        }
        return;
    }
    const char* prefix = "/storage/Users/currentUser/Documents/";
    const char* realPrefix = "/storage/media/100/local/files/Docs/Documents/";
    if (strncmp(fullPath, prefix, strlen(prefix)) == 0) {
        char realPath[512] = {0};
        strcat(realPath, realPrefix);
        strcat(realPath, fullPath + strlen(prefix));
        if (access(realPath, F_OK) == 0) {
            LOGW("====>%{public}s remove real file: %{public}s", tag, realPath);
            if (remove(realPath) != 0) {
                LOGE("====>%{public}s remove real file failed: %{public}s", tag, realPath);
            }
        }
    }
}

static bool g_callbackTriggered = false;
static CloudDisk_ErrorCode g_lastExecuteRet = CLOUD_DISK_OK;
static bool g_dehydrateAllow = true;
static bool g_respondFetch = true;
static bool g_chunkedMode = false;
static const uint64_t g_chunkTotalSize = 4096;
static const uint64_t g_chunkSize = 1024;
static uint64_t g_chunkOffset = 0;
static int g_boundaryMode = 0;
static bool g_saveReqKeyMode = false;
static bool g_useSavedReqKey = false;
static uint8_t g_savedReqKeyData[64] = {0};
static uint64_t g_savedReqKeyLen = 0;
static bool g_replayMode = false;
static CloudDisk_ErrorCode g_secondExecuteRet = CLOUD_DISK_OK;
static int g_partialHydrateMode = 0;
static bool g_cancelNotified = false;
static int g_singleBlockCount = 0;

static void TestCloudDiskCallback(const OH_CloudDisk_CallbackReqHead reqHead,
    OH_CloudDisk_CallbackContext reqContext)
{
    g_callbackTriggered = true;
    LOGW("====>TestCloudDiskCallback triggered, callbackType: %{public}d",
        static_cast<int>(reqHead.callbackType));
    if (reqHead.callbackType == OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA && reqContext.fetchData != nullptr) {
        LOGW("====>TestCloudDiskCallback FETCH_DATA filePath: %{public}s, priority: %{public}d",
            reqContext.fetchData->filePath.value, static_cast<int>(reqContext.fetchData->priority));
        if (g_saveReqKeyMode && g_savedReqKeyLen == 0 && reqHead.reqKey.data != nullptr &&
            reqHead.reqKey.dataSize <= sizeof(g_savedReqKeyData)) {
            g_savedReqKeyLen = reqHead.reqKey.dataSize;
            memcpy(g_savedReqKeyData, reqHead.reqKey.data, g_savedReqKeyLen);
            LOGW("====>TestCloudDiskCallback saved reqKey len: %{public}llu",
                static_cast<unsigned long long>(g_savedReqKeyLen));
        }
        if (!g_respondFetch) {
            LOGW("====>TestCloudDiskCallback FETCH_DATA pending, skip Execute (g_respondFetch false)");
            return;
        }
        if (g_chunkedMode) {
            static uint8_t chunkBuf[1024];
            memset(chunkBuf, 0xAB, sizeof(chunkBuf));
            while (g_chunkOffset < g_chunkTotalSize) {
                if (g_partialHydrateMode > 0 && g_chunkOffset >= g_partialHydrateMode * g_chunkSize) {
                    LOGW("====>TestCloudDiskCallback partial-hydrate stop responding, chunkOffset: %{public}llu",
                        static_cast<unsigned long long>(g_chunkOffset));
                    return;
                }
                uint64_t remain = g_chunkTotalSize - g_chunkOffset;
                uint64_t curSize = (remain < g_chunkSize) ? remain : g_chunkSize;
                OH_CloudDisk_FetchData fetchData = {0};
                fetchData.offset = g_chunkOffset;
                fetchData.size = curSize;
                fetchData.totalSize = g_chunkTotalSize;
                fetchData.data.data = chunkBuf;
                fetchData.data.dataSize = curSize;
                fetchData.isComplete = (g_chunkOffset + curSize >= g_chunkTotalSize);
                OH_CloudDisk_CallbackResponse rsp;
                rsp.fetchData = &fetchData;
                g_lastExecuteRet = OH_CloudDisk_Execute(reqHead, reqContext, rsp);
                LOGW("====>OH_CloudDisk_Execute chunked ret: %{public}d, offset: %{public}llu, size: %{public}llu, "
                    "isComplete: %{public}d", g_lastExecuteRet, static_cast<unsigned long long>(g_chunkOffset),
                    static_cast<unsigned long long>(curSize), fetchData.isComplete ? 1 : 0);
                if (g_lastExecuteRet != CLOUD_DISK_OK) {
                    LOGE("====>TestCloudDiskCallback chunked Execute failed, stop");
                    break;
                }
                g_chunkOffset += curSize;
            }
            return;
        }
        static uint8_t testData[] = "hydrate_test_data";
        OH_CloudDisk_FetchData fetchData = {0};
        fetchData.offset = 0;
        fetchData.size = sizeof(testData) - 1;
        fetchData.totalSize = sizeof(testData) - 1;
        fetchData.data.data = testData;
        fetchData.data.dataSize = sizeof(testData) - 1;
        fetchData.isComplete = true;
        OH_CloudDisk_CallbackResponse rsp;
        rsp.fetchData = &fetchData;
        OH_CloudDisk_CallbackReqHead headToUse = reqHead;
        if (g_useSavedReqKey && g_savedReqKeyLen > 0) {
            headToUse.reqKey.data = g_savedReqKeyData;
            headToUse.reqKey.dataSize = g_savedReqKeyLen;
            LOGW("====>TestCloudDiskCallback use saved reqKey (cross-file) len: %{public}llu",
                static_cast<unsigned long long>(g_savedReqKeyLen));
        }
        if (g_boundaryMode == 1) {
            fetchData.size = 0;
            fetchData.data.dataSize = 0;
            LOGW("====>TestCloudDiskCallback boundary size=0");
        } else if (g_boundaryMode == 2) {
            fetchData.offset = fetchData.totalSize;
            LOGW("====>TestCloudDiskCallback boundary offset over totalSize");
        }
        g_lastExecuteRet = OH_CloudDisk_Execute(headToUse, reqContext, rsp);
        LOGW("====>OH_CloudDisk_Execute in callback ret: %{public}d", g_lastExecuteRet);
        g_singleBlockCount++;
        if (g_replayMode) {
            g_secondExecuteRet = OH_CloudDisk_Execute(headToUse, reqContext, rsp);
            LOGW("====>OH_CloudDisk_Execute replay ret: %{public}d", g_secondExecuteRet);
        }
    } else if (reqHead.callbackType == OH_CLOUD_DISK_CALLBACK_TYPE_DEHYDRATE &&
        reqContext.dehydrateData != nullptr) {
        LOGW("====>TestCloudDiskCallback DEHYDRATE filePath: %{public}s, allow: %{public}d",
            reqContext.dehydrateData->filePath.value, reqContext.dehydrateData->allow ? 1 : 0);
        reqContext.dehydrateData->allow = g_dehydrateAllow;
        LOGW("====>TestCloudDiskCallback DEHYDRATE set allow: %{public}d", g_dehydrateAllow ? 1 : 0);
    } else if (reqHead.callbackType == OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA &&
        reqContext.cancelFetchData != nullptr) {
        g_cancelNotified = true;
        LOGW("====>TestCloudDiskCallback CANCEL_FETCH_DATA filePath: %{public}s",
            reqContext.cancelFetchData->value);
    }
}

static bool WaitForCallbackTriggered(int timeoutMs)
{
    int waitedMs = 0;
    while (!g_callbackTriggered && waitedMs < timeoutMs) {
        usleep(100 * 1000);
        waitedMs += 100;
    }
    LOGW("====>WaitForCallbackTriggered triggered: %{public}d, waitedMs: %{public}d",
        g_callbackTriggered ? 1 : 0, waitedMs);
    return g_callbackTriggered;
}

static bool VerifyChunkedFileContent(const char* filePath)
{
    struct stat st = {0};
    if (stat(filePath, &st) != 0) {
        LOGE("====>VerifyChunkedFileContent stat failed: %{public}s", filePath);
        return false;
    }
    LOGW("====>VerifyChunkedFileContent file: %{public}s, size: %{public}lld, expect: %{public}llu",
        filePath, static_cast<long long>(st.st_size), static_cast<unsigned long long>(g_chunkTotalSize));
    if (static_cast<uint64_t>(st.st_size) != g_chunkTotalSize) {
        return false;
    }
    uint8_t buf[4096] = {0};
    FILE* fp = fopen(filePath, "rb");
    if (fp == nullptr) {
        LOGE("====>VerifyChunkedFileContent fopen failed: %{public}s", filePath);
        return false;
    }
    size_t readLen = fread(buf, 1, sizeof(buf), fp);
    fclose(fp);
    if (readLen != sizeof(buf)) {
        LOGE("====>VerifyChunkedFileContent readLen mismatch: %{public}zu", readLen);
        return false;
    }
    for (size_t i = 0; i < readLen; ++i) {
        if (buf[i] != 0xAB) {
            LOGE("====>VerifyChunkedFileContent content mismatch at: %{public}zu", i);
            return false;
        }
    }
    LOGW("====>VerifyChunkedFileContent content check pass");
    return true;
}

static bool WaitForChunkedComplete(int timeoutMs)
{
    int waitedMs = 0;
    while (g_chunkOffset < g_chunkTotalSize && waitedMs < timeoutMs) {
        usleep(100 * 1000);
        waitedMs += 100;
    }
    LOGW("====>WaitForChunkedComplete chunkOffset: %{public}llu, waitedMs: %{public}d",
        static_cast<unsigned long long>(g_chunkOffset), waitedMs);
    return g_chunkOffset >= g_chunkTotalSize;
}

static bool WaitForCancelNotified(int timeoutMs)
{
    int waitedMs = 0;
    while (!g_cancelNotified && waitedMs < timeoutMs) {
        usleep(100 * 1000);
        waitedMs += 100;
    }
    LOGW("====>WaitForCancelNotified notified: %{public}d, waitedMs: %{public}d",
        g_cancelNotified ? 1 : 0, waitedMs);
    return g_cancelNotified;
}

static void ResetCallbackState()
{
    g_callbackTriggered = false;
    g_lastExecuteRet = CLOUD_DISK_OK;
    g_dehydrateAllow = true;
    g_respondFetch = true;
    g_chunkedMode = false;
    g_chunkOffset = 0;
    g_boundaryMode = 0;
    g_saveReqKeyMode = false;
    g_useSavedReqKey = false;
    g_savedReqKeyLen = 0;
    g_replayMode = false;
    g_secondExecuteRet = CLOUD_DISK_OK;
    g_partialHydrateMode = 0;
    g_cancelNotified = false;
    g_singleBlockCount = 0;
}

static bool VerifyHydratedFileAnyPath(const char* virtualPrefix, const char* realPrefix,
    const char* relativePath, const char* expectData)
{
    size_t expectLen = strlen(expectData);
    char filePath[512] = {0};
    strcat(filePath, virtualPrefix);
    strcat(filePath, relativePath);
    struct stat st = {0};
    if (stat(filePath, &st) != 0 || static_cast<uint64_t>(st.st_size) != expectLen) {
        char realPath[512] = {0};
        strcat(realPath, realPrefix);
        strcat(realPath, relativePath);
        if (stat(realPath, &st) != 0 || static_cast<uint64_t>(st.st_size) != expectLen) {
            LOGE("====>VerifyHydratedFileAnyPath size mismatch or stat failed: %{public}s", relativePath);
            return false;
        }
        strcpy(filePath, realPath);
    }
    uint8_t buf[64] = {0};
    FILE* fp = fopen(filePath, "rb");
    if (fp == nullptr) {
        LOGE("====>VerifyHydratedFileAnyPath fopen failed: %{public}s", filePath);
        return false;
    }
    size_t readLen = fread(buf, 1, expectLen, fp);
    fclose(fp);
    bool match = readLen == expectLen && memcmp(buf, expectData, expectLen) == 0;
    LOGW("====>VerifyHydratedFileAnyPath file: %{public}s, match: %{public}d", filePath, match ? 1 : 0);
    return match;
}

static void CleanupLifecycleFolder(char* path, char* fullPath)
{
    // step14: remove the created file, best effort (keep sync root clean for re-execution)
    LOGW("====>PlaceholderLifecycle001 post-clean remove file: %{public}s", fullPath);
    if (remove(fullPath) != 0) {
        LOGE("====>PlaceholderLifecycle001 post-clean remove failed: %{public}s", fullPath);
    }

    // step15: deactive sync folder, best effort
    LOGW("====>OH_CloudDisk_DeactiveSyncFolder start");
    auto deactiveRet = OH_CloudDisk_DeactiveSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_DeactiveSyncFolder ret: %{public}d", deactiveRet);

    // step16: unregister sync folder, best effort
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder start");
    auto unregRet = OH_CloudDisk_UnregisterSyncFolder(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterSyncFolder ret: %{public}d", unregRet);
}

static napi_value PlaceholderLifecycle001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "lifecycle_001.txt";
    LOGI("====>PlaceholderLifecycle001 params: path: %{public}s, relativePath: %{public}s", path, relativePath);

    // step1: register sync folder
    auto regRet = RegisterDefaultSyncFolder();
    if (regRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>PlaceholderLifecycle001 device not supported, skip lifecycle");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    if (regRet != CLOUD_DISK_OK) {
        LOGE("====>PlaceholderLifecycle001 step1 check failed, regRet: %{public}d", regRet);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // pre-clean: remove leftover file from a previous interrupted run, best effort
    char fullPath[256] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    if (access(fullPath, F_OK) == 0) {
        LOGW("====>PlaceholderLifecycle001 pre-clean remove leftover: %{public}s", fullPath);
        if (remove(fullPath) != 0) {
            LOGE("====>PlaceholderLifecycle001 pre-clean remove failed: %{public}s", fullPath);
        }
    }

    // step2: create placeholder
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", createRet);
    if (createRet != CLOUD_DISK_OK) {
        LOGE("====>PlaceholderLifecycle001 step2 check failed, createRet: %{public}d", createRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step3: create again on placeholder, expect FILE_ALREADY_EXISTS
    LOGW("====>OH_CloudDisk_CreatePlaceholder again start");
    auto createAgainRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder again ret: %{public}d", createAgainRet);
    if (createAgainRet != OH_CLOUD_DISK_FILE_ALREADY_EXISTS) {
        LOGE("====>PlaceholderLifecycle001 step3 check failed, createAgainRet: %{public}d", createAgainRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step4: create under a file (parent is not a directory), expect NOT_A_DIRECTORY
    char parentIsFile[] = "lifecycle_001.txt/child.txt";
    LOGW("====>OH_CloudDisk_CreatePlaceholder parent-not-dir start, relativePath: %{public}s", parentIsFile);
    auto createUnderFileRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path),
        MakePathInfo(parentIsFile), MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder parent-not-dir ret: %{public}d", createUnderFileRet);
    if (createUnderFileRet != OH_CLOUD_DISK_NOT_A_DIRECTORY) {
        LOGE("====>PlaceholderLifecycle001 step4 check failed, createUnderFileRet: %{public}d",
            createUnderFileRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step5: is placeholder, expect true
    bool isPlaceholder1 = true;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile first start");
    auto isRet1 = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder1);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile first ret: %{public}d, isPlaceholder: %{public}d", isRet1,
        isPlaceholder1 ? 1 : 0);
    if (isRet1 != CLOUD_DISK_OK || !isPlaceholder1) {
        LOGE("====>PlaceholderLifecycle001 step5 check failed, isRet1: %{public}d, isPlaceholder1: %{public}d",
            isRet1, isPlaceholder1 ? 1 : 0);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step6: update placeholder metadata
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto updateRet = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", updateRet);
    if (updateRet != CLOUD_DISK_OK) {
        LOGE("====>PlaceholderLifecycle001 step6 check failed, updateRet: %{public}d", updateRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step7: is placeholder again, expect true after update
    bool isPlaceholder2 = true;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile second start");
    auto isRet2 = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder2);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile second ret: %{public}d, isPlaceholder: %{public}d", isRet2,
        isPlaceholder2 ? 1 : 0);
    if (isRet2 != CLOUD_DISK_OK || !isPlaceholder2) {
        LOGE("====>PlaceholderLifecycle001 step7 check failed, isRet2: %{public}d, isPlaceholder2: %{public}d",
            isRet2, isPlaceholder2 ? 1 : 0);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step8: convert placeholder to file, first time expect success
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile first start");
    auto convertRet = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path),
        MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile first ret: %{public}d", convertRet);
    if (convertRet != CLOUD_DISK_OK) {
        LOGE("====>PlaceholderLifecycle001 step8 check failed, convertRet: %{public}d", convertRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step9: convert again, expect NOT_A_PLACEHOLDER (idempotency check)
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile second start");
    auto convertAgainRet = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path),
        MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile second ret: %{public}d", convertAgainRet);
    if (convertAgainRet != OH_CLOUD_DISK_NOT_A_PLACEHOLDER) {
        LOGE("====>PlaceholderLifecycle001 step9 check failed, convertAgainRet: %{public}d", convertAgainRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step10: is placeholder before update on normal file, expect false
    bool isPlaceholder3 = true;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile third start");
    auto isRet3 = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder3);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile third ret: %{public}d, isPlaceholder: %{public}d", isRet3,
        isPlaceholder3 ? 1 : 0);
    if (isRet3 != CLOUD_DISK_OK || isPlaceholder3) {
        LOGE("====>PlaceholderLifecycle001 step10 check failed, isRet3: %{public}d, isPlaceholder3: %{public}d",
            isRet3, isPlaceholder3 ? 1 : 0);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step11: create again on normal file, expect FILE_ALREADY_EXISTS
    LOGW("====>OH_CloudDisk_CreatePlaceholder on normal file start");
    auto createOnFileRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path),
        MakePathInfo(relativePath), MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder on normal file ret: %{public}d", createOnFileRet);
    if (createOnFileRet != OH_CLOUD_DISK_FILE_ALREADY_EXISTS) {
        LOGE("====>PlaceholderLifecycle001 step11 check failed, createOnFileRet: %{public}d", createOnFileRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step12: update on normal file, expect success (update converts normal file to placeholder)
    LOGW("====>OH_CloudDisk_UpdatePlaceholder on normal file start");
    auto updateOnFileRet = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path),
        MakePathInfo(relativePath), MakePlaceholderInfo(4096, 1700000200000, 1700000201000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder on normal file ret: %{public}d", updateOnFileRet);
    if (updateOnFileRet != CLOUD_DISK_OK) {
        LOGE("====>PlaceholderLifecycle001 step12 check failed, updateOnFileRet: %{public}d", updateOnFileRet);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step13: is placeholder after update on normal file, expect true (converted by update)
    bool isPlaceholder4 = true;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile fourth start");
    auto isRet4 = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder4);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile fourth ret: %{public}d, isPlaceholder: %{public}d", isRet4,
        isPlaceholder4 ? 1 : 0);
    if (isRet4 != CLOUD_DISK_OK || !isPlaceholder4) {
        LOGE("====>PlaceholderLifecycle001 step13 check failed, isRet4: %{public}d, isPlaceholder4: %{public}d",
            isRet4, isPlaceholder4 ? 1 : 0);
        CleanupLifecycleFolder(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step14-16: cleanup (remove file, deactive, unregister), best effort
    CleanupLifecycleFolder(path, fullPath);

    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value CreatePlaceholder002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "";
    LOGI("====>CreatePlaceholder002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "/placeholder_003.txt";
    LOGI("====>CreatePlaceholder003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_004.txt/";
    LOGI("====>CreatePlaceholder004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "dir/./placeholder_005.txt";
    LOGI("====>CreatePlaceholder005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "dir/../placeholder_006.txt";
    LOGI("====>CreatePlaceholder006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_007.txt";
    LOGI("====>CreatePlaceholder007 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "dir1/dir2/placeholder_008.txt";
    LOGI("====>CreatePlaceholder008 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("CreatePlaceholder008 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("CreatePlaceholder008 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_009.txt";
    constexpr uint64_t maxSafeInteger = 9007199254740991ULL;
    LOGI("====>CreatePlaceholder009 params: path: %{public}s, relativePath: %{public}s, logicalSize: %{public}llu",
        path, relativePath, static_cast<unsigned long long>(maxSafeInteger));
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("CreatePlaceholder009 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(maxSafeInteger, maxSafeInteger, maxSafeInteger), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_TOO_LARGE || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("CreatePlaceholder009 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder010(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char longName[260] = {0};
    for (int i = 0; i < 252; ++i) {
        longName[i] = 'a';
    }
    strcat(longName, ".txt");
    LOGI("====>CreatePlaceholder010 params: path: %{public}s, relativePath length: %{public}zu", path, strlen(longName));
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(longName),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_NAME_TOO_LONG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder011(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_011.txt";
    LOGI("====>CreatePlaceholder011 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder012(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char longName[260] = {0};
    for (int i = 0; i < 251; ++i) {
        longName[i] = 'a';
    }
    strcat(longName, ".txt");
    LOGI("====>CreatePlaceholder012 params: path: %{public}s, relativePath length: %{public}zu", path, strlen(longName));
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, longName);
    RemoveFileBestEffort("CreatePlaceholder012 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(longName),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("CreatePlaceholder012 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder013(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_013.txt";
    LOGI("====>CreatePlaceholder013 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("CreatePlaceholder013 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(0, 0, 0), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("CreatePlaceholder013 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value IsPlaceholderFile002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "";
    LOGI("====>IsPlaceholderFile002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    bool isPlaceholder = false;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile start");
    auto ret = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile ret: %{public}d, isPlaceholder: %{public}d", ret, isPlaceholder ? 1 : 0);
    bool ok = (ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED) && !isPlaceholder;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value IsPlaceholderFile003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "/placeholder_003.txt";
    LOGI("====>IsPlaceholderFile003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    bool isPlaceholder = false;
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_IsPlaceholderFile start");
    auto ret = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile ret: %{public}d, isPlaceholder: %{public}d", ret, isPlaceholder ? 1 : 0);
    bool ok = (ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED) && !isPlaceholder;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value IsPlaceholderFile004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_004.txt";
    LOGI("====>IsPlaceholderFile004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    bool isPlaceholder = false;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile start");
    auto ret = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile ret: %{public}d, isPlaceholder: %{public}d", ret, isPlaceholder ? 1 : 0);
    bool ok = (ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED) && !isPlaceholder;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value IsPlaceholderFile005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_file_005.txt";
    LOGI("====>IsPlaceholderFile005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    bool isPlaceholder = false;
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_IsPlaceholderFile start");
    auto ret = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile ret: %{public}d, isPlaceholder: %{public}d", ret, isPlaceholder ? 1 : 0);
    bool ok = (ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED) && !isPlaceholder;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value IsPlaceholderFile006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "dir/./placeholder_006.txt";
    LOGI("====>IsPlaceholderFile006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    bool isPlaceholder = false;
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_IsPlaceholderFile start");
    auto ret = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile ret: %{public}d, isPlaceholder: %{public}d", ret, isPlaceholder ? 1 : 0);
    bool ok = (ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED) && !isPlaceholder;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value IsPlaceholderFile008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_008_null.txt";
    LOGI("====>IsPlaceholderFile008 params: path: %{public}s, relativePath: %{public}s, isPlaceholder: nullptr",
        path, relativePath);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile with null output start");
    auto ret = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath), nullptr);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile with null output ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value IsPlaceholderFile009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_009.txt";
    LOGI("====>IsPlaceholderFile009 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    bool isPlaceholder = false;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile start");
    auto ret = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile ret: %{public}d, isPlaceholder: %{public}d", ret, isPlaceholder ? 1 : 0);
    bool ok = (ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED) && !isPlaceholder;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value ConvertPlaceholderToFile002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "";
    LOGI("====>ConvertPlaceholderToFile002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile start");
    auto ret = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path), MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value ConvertPlaceholderToFile003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "/placeholder_003.txt";
    LOGI("====>ConvertPlaceholderToFile003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile start");
    auto ret = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path), MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value ConvertPlaceholderToFile004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_004.txt";
    LOGI("====>ConvertPlaceholderToFile004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile start");
    auto ret = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path), MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value ConvertPlaceholderToFile005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_file_005.txt";
    LOGI("====>ConvertPlaceholderToFile005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile start");
    auto ret = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path), MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value ConvertPlaceholderToFile006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_006.txt";
    LOGI("====>ConvertPlaceholderToFile006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile start");
    auto ret = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path), MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "";
    LOGI("====>UpdatePlaceholder002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "/placeholder_003.txt";
    LOGI("====>UpdatePlaceholder003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_004.txt";
    LOGI("====>UpdatePlaceholder004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_file_005.txt";
    LOGI("====>UpdatePlaceholder005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_006.txt";
    LOGI("====>UpdatePlaceholder006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("UpdatePlaceholder006 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(0, 0, 0), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("UpdatePlaceholder006 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_007.txt";
    constexpr uint64_t maxSafeInteger = 9007199254740991ULL;
    LOGI("====>UpdatePlaceholder007 params: path: %{public}s, relativePath: %{public}s, logicalSize: %{public}llu",
        path, relativePath, static_cast<unsigned long long>(maxSafeInteger));
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("UpdatePlaceholder007 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(maxSafeInteger, maxSafeInteger, maxSafeInteger), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_TOO_LARGE || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("UpdatePlaceholder007 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    char relativePath[] = "placeholder_008.txt";
    LOGI("====>UpdatePlaceholder008 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value Tset_CloudDisk_CallbackType_ENUM(napi_env env, napi_callback_info info)
{
    OH_CloudDisk_CallbackType callbackType = OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA;
    NAPI_ASSERT(env, callbackType == 0, "OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA is fail.");
    callbackType = OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA;
    NAPI_ASSERT(env, callbackType == 1, "OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA is fail.");
    callbackType = OH_CLOUD_DISK_CALLBACK_TYPE_DEHYDRATE;
    NAPI_ASSERT(env, callbackType == 2, "OH_CLOUD_DISK_CALLBACK_TYPE_DEHYDRATE is fail.");
    callbackType = OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_RANGE_DATA;
    NAPI_ASSERT(env, callbackType == 3, "OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_RANGE_DATA is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value Tset_CloudDisk_HydratePriority_ENUM(napi_env env, napi_callback_info info)
{
    OH_CloudDisk_HydratePriority priority = OH_CLOUD_DISK_HYDRATE_PRIORITY_LOW;
    NAPI_ASSERT(env, priority == 0, "OH_CLOUD_DISK_HYDRATE_PRIORITY_LOW is fail.");
    priority = OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL;
    NAPI_ASSERT(env, priority == 1, "OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL is fail.");
    priority = OH_CLOUD_DISK_HYDRATE_PRIORITY_HIGH;
    NAPI_ASSERT(env, priority == 2, "OH_CLOUD_DISK_HYDRATE_PRIORITY_HIGH is fail.");
    napi_value result;
    napi_create_int32(env, 1, &result);
    return result;
}

static napi_value DehydrateFile002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_dehydrate_002.txt";
    LOGI("====>DehydrateFile002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("DehydrateFile002 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    g_chunkedMode = true;
    g_partialHydrateMode = 1;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(g_chunkTotalSize, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder partial prepare ret: %{public}d", hydrateRet);
    bool partialReady = false;
    int partialWaitedMs = 0;
    while (partialWaitedMs < 3000) {
        if (g_callbackTriggered && g_chunkOffset >= g_chunkSize) {
            partialReady = true;
            break;
        }
        usleep(100 * 1000);
        partialWaitedMs += 100;
    }
    LOGW("====>DehydrateFile002 partially-hydrated ready: %{public}d, chunkOffset: %{public}llu, waitedMs: %{public}d",
        partialReady ? 1 : 0, static_cast<unsigned long long>(g_chunkOffset), partialWaitedMs);
    g_chunkedMode = false;
    g_partialHydrateMode = 0;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-after-partial start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-after-partial ret: %{public}d", cancelRet);
    bool cancelNotified = WaitForCancelNotified(3000);
    LOGW("====>OH_CloudDisk_DehydrateFile partially-hydrated start");
    auto ret = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile partially-hydrated ret: %{public}d", ret);
    bool ok = partialReady && cancelRet == CLOUD_DISK_OK && cancelNotified &&
        (ret == OH_CLOUD_DISK_PLACEHOLDER_NOT_FULLY_HYDRATED || ret == CLOUD_DISK_NOT_SUPPORTED);
    RemoveFileBestEffort("DehydrateFile002 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value DehydrateFile003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_dehydrate_003.txt";
    LOGI("====>DehydrateFile003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("DehydrateFile003 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare start");
    auto convertRet = OH_CloudDisk_ConvertPlaceholderToFile(MakeSyncFolderPath(path),
        MakePathInfo(relativePath));
    LOGW("====>OH_CloudDisk_ConvertPlaceholderToFile prepare ret: %{public}d", convertRet);
    LOGW("====>DehydrateFile003 normal file ready: %{public}s", fullPath);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_DehydrateFile start");
    auto ret = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_NOT_A_PLACEHOLDER || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("DehydrateFile003 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value DehydrateFile004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_file_004.txt";
    LOGI("====>DehydrateFile004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_DehydrateFile start");
    auto ret = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_002.txt";
    LOGI("====>HydratePlaceholder002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-no-task start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-no-task ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_NO_HYDRATION_IN_PROGRESS || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_003.txt";
    LOGI("====>HydratePlaceholder003 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder no-callback-table start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder no-callback-table ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder008(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_008.txt";
    LOGI("====>HydratePlaceholder008 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder008 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder no-callback-table-with-placeholder start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder no-callback-table-with-placeholder ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_CALLBACK_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("HydratePlaceholder008 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "not_existed_file_004.txt";
    LOGI("====>HydratePlaceholder004 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder file-not-exist start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder file-not-exist ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_FILE_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_005.txt";
    LOGI("====>HydratePlaceholder005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder005 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder high-priority start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_HIGH);
    LOGW("====>OH_CloudDisk_HydratePlaceholder high-priority ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    if (ok && ret == CLOUD_DISK_OK) {
        bool triggered = WaitForCallbackTriggered(3000);
        LOGW("====>HydratePlaceholder005 callback triggered: %{public}d", triggered ? 1 : 0);
        ok = triggered;
    }
    RemoveFileBestEffort("HydratePlaceholder005 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnregisterCallbackTable002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>UnregisterCallbackTable002 params: path: %{public}s", path);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable no-table start");
    auto ret = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable no-table ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_CALLBACK_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnregisterCallbackTable003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    LOGI("====>UnregisterCallbackTable003 params: path: %{public}s", path);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable start");
    auto ret = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterCallbackTable002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>RegisterCallbackTable002 params: path: %{public}s", path);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable first start");
    auto firstRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable first ret: %{public}d", firstRet);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable second start");
    auto ret = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable second ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_CALLBACK_ALREADY_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterCallbackTable003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>RegisterCallbackTable003 params: path: %{public}s", path);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable start");
    auto ret = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterCallbackTable004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/not_exist_sync_root/";
    LOGI("====>RegisterCallbackTable004 params: path: %{public}s", path);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable start");
    auto ret = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static void CleanupCallbackLifecycle(char* path, char* fullPath)
{
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    CleanupLifecycleFolder(path, fullPath);
}

static napi_value CallbackLifecycle001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_lifecycle_001.txt";
    LOGI("====>CallbackLifecycle001 params: path: %{public}s, relativePath: %{public}s", path, relativePath);

    // step1: register sync folder
    auto regRet = RegisterDefaultSyncFolder();
    LOGW("====>CallbackLifecycle001 register sync folder ret: %{public}d", regRet);
    if (regRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>CallbackLifecycle001 device not supported, skip lifecycle");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    if (regRet != CLOUD_DISK_OK) {
        LOGE("====>CallbackLifecycle001 step1 check failed, regRet: %{public}d", regRet);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // pre-clean: remove leftover file from a previous interrupted run, best effort
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("CallbackLifecycle001 pre-clean", fullPath);

    // step2: create placeholder
    LOGW("====>OH_CloudDisk_CreatePlaceholder start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder ret: %{public}d", createRet);
    if (createRet != CLOUD_DISK_OK) {
        LOGE("====>CallbackLifecycle001 step2 check failed, createRet: %{public}d", createRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step3: register callback table
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable ret: %{public}d", regCbRet);
    if (regCbRet != CLOUD_DISK_OK) {
        LOGE("====>CallbackLifecycle001 step3 check failed, regCbRet: %{public}d", regCbRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step4: register callback table again, expect CALLBACK_ALREADY_REGISTERED
    LOGW("====>OH_CloudDisk_RegisterCallbackTable again start");
    auto regCbAgainRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable again ret: %{public}d", regCbAgainRet);
    if (regCbAgainRet != OH_CLOUD_DISK_CALLBACK_ALREADY_REGISTERED) {
        LOGE("====>CallbackLifecycle001 step4 check failed, regCbAgainRet: %{public}d", regCbAgainRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step5: hydrate placeholder, expect success
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder ret: %{public}d", hydrateRet);
    if (hydrateRet != CLOUD_DISK_OK) {
        LOGE("====>CallbackLifecycle001 step5 check failed, hydrateRet: %{public}d", hydrateRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step6: wait for callback triggered
    bool triggered = WaitForCallbackTriggered(3000);
    if (!triggered) {
        LOGE("====>CallbackLifecycle001 step6 check failed, callback not triggered in 3000ms");
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step7: dehydrate file, expect success
    LOGW("====>OH_CloudDisk_DehydrateFile start");
    auto dehydrateRet = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile ret: %{public}d", dehydrateRet);
    if (dehydrateRet != CLOUD_DISK_OK) {
        LOGE("====>CallbackLifecycle001 step7 check failed, dehydrateRet: %{public}d", dehydrateRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step8: unregister callback table, expect success
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable ret: %{public}d", unregCbRet);
    if (unregCbRet != CLOUD_DISK_OK) {
        LOGE("====>CallbackLifecycle001 step8 check failed, unregCbRet: %{public}d", unregCbRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step9: unregister callback table again, expect CALLBACK_NOT_REGISTERED
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable again start");
    auto unregCbAgainRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable again ret: %{public}d", unregCbAgainRet);
    if (unregCbAgainRet != OH_CLOUD_DISK_CALLBACK_NOT_REGISTERED) {
        LOGE("====>CallbackLifecycle001 step9 check failed, unregCbAgainRet: %{public}d", unregCbAgainRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // step10: hydrate after callback table unregistered, expect CALLBACK_NOT_REGISTERED
    LOGW("====>OH_CloudDisk_HydratePlaceholder after-unregister start");
    auto hydrateAgainRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder after-unregister ret: %{public}d", hydrateAgainRet);
    if (hydrateAgainRet != OH_CLOUD_DISK_CALLBACK_NOT_REGISTERED) {
        LOGE("====>CallbackLifecycle001 step10 check failed, hydrateAgainRet: %{public}d", hydrateAgainRet);
        CleanupCallbackLifecycle(path, fullPath);
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }

    // cleanup: remove file, deactive and unregister sync folder, best effort
    RemoveFileBestEffort("CallbackLifecycle001 post-clean", fullPath);
    CleanupCallbackLifecycle(path, fullPath);

    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value HydratePlaceholder006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_006.txt";
    LOGI("====>HydratePlaceholder006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder006 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder first prepare start");
    auto firstRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder first prepare ret: %{public}d", firstRet);
    WaitForCallbackTriggered(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder again start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder again ret: %{public}d", ret);
    bool ok = ret == OH_CLOUD_DISK_ALREADY_HYDRATED || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("HydratePlaceholder006 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value DehydrateFile005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_dehydrate_005.txt";
    LOGI("====>DehydrateFile005 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("DehydrateFile005 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder prepare ret: %{public}d", hydrateRet);
    WaitForCallbackTriggered(3000);
    g_dehydrateAllow = false;
    LOGW("====>OH_CloudDisk_DehydrateFile denied start");
    auto ret = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile denied ret: %{public}d", ret);
    g_dehydrateAllow = true;
    bool ok = ret == OH_CLOUD_DISK_DEHYDRATE_DENIED || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("DehydrateFile005 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterCallbackTable005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    LOGI("====>RegisterCallbackTable005 params: path: %{public}s", path);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_RegisterCallbackTable null-callback start");
    auto ret = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), nullptr);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable null-callback ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_007.txt";
    LOGI("====>HydratePlaceholder007 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder null-sync-folder start");
    auto retNullFolder = OH_CloudDisk_HydratePlaceholder(nullptr, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder null-sync-folder ret: %{public}d", retNullFolder);
    LOGW("====>OH_CloudDisk_HydratePlaceholder null-file-path start");
    auto retNullFile = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, nullptr,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder null-file-path ret: %{public}d", retNullFile);
    bool ok = (retNullFolder == CLOUD_DISK_INVALID_ARG || retNullFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retNullFile == CLOUD_DISK_INVALID_ARG || retNullFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value DehydrateFile006(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_dehydrate_006.txt";
    LOGI("====>DehydrateFile006 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_DehydrateFile null-sync-folder start");
    auto retNullFolder = OH_CloudDisk_DehydrateFile(nullptr, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile null-sync-folder ret: %{public}d", retNullFolder);
    LOGW("====>OH_CloudDisk_DehydrateFile null-file-path start");
    auto retNullFile = OH_CloudDisk_DehydrateFile(&syncFolderPath, nullptr);
    LOGW("====>OH_CloudDisk_DehydrateFile null-file-path ret: %{public}d", retNullFile);
    bool ok = (retNullFolder == CLOUD_DISK_INVALID_ARG || retNullFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retNullFile == CLOUD_DISK_INVALID_ARG || retNullFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value Execute002(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_execute_002.txt";
    LOGI("====>Execute002 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    OH_CloudDisk_CallbackReqHead reqHead = {0};
    reqHead.syncFolderPath = MakeSyncFolderPath(path);
    reqHead.callbackType = OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA;
    reqHead.reqKey.data = nullptr;
    reqHead.reqKey.dataSize = 0;
    OH_CloudDisk_CallbackContext reqContext = {0};
    reqContext.fetchData = nullptr;
    OH_CloudDisk_CallbackResponse rsp = {0};
    rsp.fetchData = nullptr;
    LOGW("====>OH_CloudDisk_Execute null-members start");
    auto ret = OH_CloudDisk_Execute(reqHead, reqContext, rsp);
    LOGW("====>OH_CloudDisk_Execute null-members ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_009.txt";
    LOGI("====>HydratePlaceholder009 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder009 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    g_respondFetch = false;
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend start");
    auto suspendRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend ret: %{public}d", suspendRet);
    WaitForCallbackTriggered(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder in-progress start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder in-progress ret: %{public}d", ret);
    g_respondFetch = true;
    bool ok = ret == OH_CLOUD_DISK_HYDRATE_IN_PROGRESS || ret == CLOUD_DISK_NOT_SUPPORTED;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup ret: %{public}d", cancelRet);
    RemoveFileBestEffort("HydratePlaceholder009 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder010(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_010.txt";
    LOGI("====>HydratePlaceholder010 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder010 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    g_respondFetch = false;
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend start");
    auto suspendRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend ret: %{public}d", suspendRet);
    WaitForCallbackTriggered(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-accept start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-accept ret: %{public}d", cancelRet);
    g_respondFetch = true;
    bool cancelNotified = WaitForCancelNotified(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-verify start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-verify ret: %{public}d", ret);
    bool ok = cancelRet == CLOUD_DISK_OK && cancelNotified &&
        (ret == OH_CLOUD_DISK_CANCELLED || ret == OH_CLOUD_DISK_NO_HYDRATION_IN_PROGRESS ||
            ret == CLOUD_DISK_NOT_SUPPORTED);
    RemoveFileBestEffort("HydratePlaceholder010 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder011(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_011.txt";
    LOGI("====>HydratePlaceholder011 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder011 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    g_chunkedMode = true;
    g_chunkOffset = 0;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(g_chunkTotalSize, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder chunked start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder chunked ret: %{public}d", ret);
    bool chunkDone = WaitForChunkedComplete(3000);
    g_chunkedMode = false;
    bool sizeContentOk = VerifyChunkedFileContent(fullPath);
    if (!sizeContentOk) {
        LOGW("====>HydratePlaceholder011 virtual path check failed, try physical path");
        char realPath[512] = {0};
        strcat(realPath, "/storage/media/100/local/files/Docs/Documents/");
        strcat(realPath, relativePath);
        sizeContentOk = VerifyChunkedFileContent(realPath);
    }
    bool ok = ret == CLOUD_DISK_OK && chunkDone && sizeContentOk;
    RemoveFileBestEffort("HydratePlaceholder011 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydrateDehydrateIsStatus001(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_is_status_001.txt";
    LOGI("====>HydrateDehydrateIsStatus001 params: path: %{public}s, relativePath: %{public}s",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydrateDehydrateIsStatus001 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitForCallbackTriggered(3000);
    bool isHydrated = false;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile after-hydrate start");
    auto isRet1 = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isHydrated);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile after-hydrate ret: %{public}d, isPlaceholder: %{public}d",
        isRet1, isHydrated ? 1 : 0);
    LOGW("====>OH_CloudDisk_DehydrateFile start");
    auto dehydrateRet = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile ret: %{public}d", dehydrateRet);
    bool isAfterDehydrate = false;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile after-dehydrate start");
    auto isRet2 = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isAfterDehydrate);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile after-dehydrate ret: %{public}d, isPlaceholder: %{public}d",
        isRet2, isAfterDehydrate ? 1 : 0);
    bool ok = hydrateRet == CLOUD_DISK_OK && triggered &&
        isRet1 == CLOUD_DISK_OK && isHydrated &&
        dehydrateRet == CLOUD_DISK_OK &&
        isRet2 == CLOUD_DISK_OK && isAfterDehydrate;
    RemoveFileBestEffort("HydrateDehydrateIsStatus001 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value RegisterCallbackTable006(napi_env env, napi_callback_info info)
{
    char emptyStr[] = "";
    LOGI("====>RegisterCallbackTable006 params: path: empty string");
    LOGW("====>OH_CloudDisk_RegisterCallbackTable empty-path start");
    auto ret = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(emptyStr), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable empty-path ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UnregisterCallbackTable004(napi_env env, napi_callback_info info)
{
    char emptyStr[] = "";
    LOGI("====>UnregisterCallbackTable004 params: path: empty string");
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable empty-path start");
    auto ret = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(emptyStr));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable empty-path ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder012(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_012.txt";
    char emptyStr[] = "";
    LOGI("====>HydratePlaceholder012 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    CloudDisk_SyncFolderPath emptyFolder = MakeSyncFolderPath(emptyStr);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder empty-folder start");
    auto retEmptyFolder = OH_CloudDisk_HydratePlaceholder(&emptyFolder, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder empty-folder ret: %{public}d", retEmptyFolder);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo emptyFile = MakePathInfo(emptyStr);
    LOGW("====>OH_CloudDisk_HydratePlaceholder empty-file start");
    auto retEmptyFile = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &emptyFile,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder empty-file ret: %{public}d", retEmptyFile);
    bool ok = (retEmptyFolder == CLOUD_DISK_INVALID_ARG || retEmptyFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retEmptyFile == CLOUD_DISK_INVALID_ARG || retEmptyFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value DehydrateFile007(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_dehydrate_007.txt";
    char emptyStr[] = "";
    LOGI("====>DehydrateFile007 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    CloudDisk_SyncFolderPath emptyFolder = MakeSyncFolderPath(emptyStr);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_DehydrateFile empty-folder start");
    auto retEmptyFolder = OH_CloudDisk_DehydrateFile(&emptyFolder, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile empty-folder ret: %{public}d", retEmptyFolder);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo emptyFile = MakePathInfo(emptyStr);
    LOGW("====>OH_CloudDisk_DehydrateFile empty-file start");
    auto retEmptyFile = OH_CloudDisk_DehydrateFile(&syncFolderPath, &emptyFile);
    LOGW("====>OH_CloudDisk_DehydrateFile empty-file ret: %{public}d", retEmptyFile);
    bool ok = (retEmptyFolder == CLOUD_DISK_INVALID_ARG || retEmptyFolder == CLOUD_DISK_NOT_SUPPORTED) &&
        (retEmptyFile == CLOUD_DISK_INVALID_ARG || retEmptyFile == CLOUD_DISK_NOT_SUPPORTED);
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder014(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_014.txt";
    LOGI("====>CreatePlaceholder014 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("CreatePlaceholder014 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    static uint8_t customData[] = "custom_info_014";
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData) - 1;
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), &customInfo);
    LOGW("====>OH_CloudDisk_CreatePlaceholder with-custom-info ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("CreatePlaceholder014 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder009(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "update_custom_009.txt";
    LOGI("====>UpdatePlaceholder009 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("UpdatePlaceholder009 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    static uint8_t customData[] = "custom_update_09";
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData) - 1;
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_UpdatePlaceholder with-custom-info start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), &customInfo);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder with-custom-info ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("UpdatePlaceholder009 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder015(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_015.txt";
    LOGI("====>CreatePlaceholder015 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("CreatePlaceholder015 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    static uint8_t customData[4096];
    memset(customData, 0xCD, sizeof(customData));
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData);
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_CreatePlaceholder custom-info-max start, dataLength: %{public}zu",
        customInfo.dataLength);
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), &customInfo);
    LOGW("====>OH_CloudDisk_CreatePlaceholder custom-info-max ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("CreatePlaceholder015 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder016(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_016.txt";
    LOGI("====>CreatePlaceholder016 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    static uint8_t customData[4097];
    memset(customData, 0xCD, sizeof(customData));
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData);
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_CreatePlaceholder custom-info-over-max start, dataLength: %{public}zu",
        customInfo.dataLength);
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), &customInfo);
    LOGW("====>OH_CloudDisk_CreatePlaceholder custom-info-over-max ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder010(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "update_custom_010.txt";
    LOGI("====>UpdatePlaceholder010 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("UpdatePlaceholder010 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    static uint8_t customData[4096];
    memset(customData, 0xCD, sizeof(customData));
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData);
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_UpdatePlaceholder custom-info-max start, dataLength: %{public}zu",
        customInfo.dataLength);
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), &customInfo);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder custom-info-max ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("UpdatePlaceholder010 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder011(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "update_custom_011.txt";
    LOGI("====>UpdatePlaceholder011 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("UpdatePlaceholder011 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    static uint8_t customData[4097];
    memset(customData, 0xCD, sizeof(customData));
    OH_CloudDisk_PlaceholderCustomInfo customInfo = {0};
    customInfo.dataLength = sizeof(customData);
    customInfo.data = customData;
    LOGW("====>OH_CloudDisk_UpdatePlaceholder custom-info-over-max start, dataLength: %{public}zu",
        customInfo.dataLength);
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), &customInfo);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder custom-info-over-max ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_INVALID_ARG || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("UpdatePlaceholder011 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value CreatePlaceholder017(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "placeholder_017.txt";
    LOGI("====>CreatePlaceholder017 params: path: %{public}s, relativePath: %{public}s, customInfo: nullptr",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("CreatePlaceholder017 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder null-custom-info start");
    auto ret = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder null-custom-info ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("CreatePlaceholder017 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value UpdatePlaceholder012(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "update_custom_012.txt";
    LOGI("====>UpdatePlaceholder012 params: path: %{public}s, relativePath: %{public}s, customInfo: nullptr",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("UpdatePlaceholder012 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder null-custom-info start");
    auto ret = OH_CloudDisk_UpdatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(2048, 1700000100000, 1700000101000), nullptr);
    LOGW("====>OH_CloudDisk_UpdatePlaceholder null-custom-info ret: %{public}d", ret);
    bool ok = ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED;
    RemoveFileBestEffort("UpdatePlaceholder012 post-clean", fullPath);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder013(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_013.txt";
    LOGI("====>HydratePlaceholder013 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder013 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    g_respondFetch = false;
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend start");
    auto suspendRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend ret: %{public}d", suspendRet);
    WaitForCallbackTriggered(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-accept start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-accept ret: %{public}d", cancelRet);
    bool cancelNotified = WaitForCancelNotified(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-verify start");
    auto cancelAgainRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-verify ret: %{public}d", cancelAgainRet);
    g_respondFetch = true;
    bool isStillPlaceholder = false;
    LOGW("====>OH_CloudDisk_IsPlaceholderFile state-keep start");
    auto isRet = OH_CloudDisk_IsPlaceholderFile(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        &isStillPlaceholder);
    LOGW("====>OH_CloudDisk_IsPlaceholderFile state-keep ret: %{public}d, isPlaceholder: %{public}d",
        isRet, isStillPlaceholder ? 1 : 0);
    LOGW("====>OH_CloudDisk_DehydrateFile state-keep start");
    auto dehydrateRet = OH_CloudDisk_DehydrateFile(&syncFolderPath, &filePathInfo);
    LOGW("====>OH_CloudDisk_DehydrateFile state-keep ret: %{public}d", dehydrateRet);
    bool ok = cancelRet == CLOUD_DISK_OK && cancelNotified &&
        (cancelAgainRet == OH_CLOUD_DISK_CANCELLED || cancelAgainRet == OH_CLOUD_DISK_NO_HYDRATION_IN_PROGRESS) &&
        isRet == CLOUD_DISK_OK && isStillPlaceholder &&
        (dehydrateRet == OH_CLOUD_DISK_PLACEHOLDER_NOT_FULLY_HYDRATED || dehydrateRet == CLOUD_DISK_OK);
    RemoveFileBestEffort("HydratePlaceholder013 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder014(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_014.txt";
    LOGI("====>HydratePlaceholder014 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder014 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full-hydrate prepare start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder full-hydrate prepare ret: %{public}d", hydrateRet);
    bool triggered = WaitForCallbackTriggered(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-after-hydrated start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel-after-hydrated ret: %{public}d", ret);
    bool ok = triggered && (ret == OH_CLOUD_DISK_NO_HYDRATION_IN_PROGRESS || ret == CLOUD_DISK_NOT_SUPPORTED);
    RemoveFileBestEffort("HydratePlaceholder014 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder015(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_015.txt";
    LOGI("====>HydratePlaceholder015 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder015 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    g_respondFetch = false;
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend prepare start");
    auto suspendRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend prepare ret: %{public}d", suspendRet);
    WaitForCallbackTriggered(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel prepare start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel prepare ret: %{public}d", cancelRet);
    bool cancelNotified = WaitForCancelNotified(3000);
    g_respondFetch = true;
    g_callbackTriggered = false;
    LOGW("====>OH_CloudDisk_HydratePlaceholder fetch-after-cancel start");
    auto ret = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder fetch-after-cancel ret: %{public}d", ret);
    bool triggeredAgain = WaitForCallbackTriggered(3000);
    bool ok = (ret == CLOUD_DISK_OK || ret == CLOUD_DISK_NOT_SUPPORTED) && cancelRet == CLOUD_DISK_OK &&
        cancelNotified && triggeredAgain;
    RemoveFileBestEffort("HydratePlaceholder015 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder016(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePathA[] = "callback_hydrate_016_a.txt";
    char relativePathB[] = "callback_hydrate_016_b.txt";
    LOGI("====>HydratePlaceholder016 params: path: %{public}s, fileA: %{public}s, fileB: %{public}s",
        path, relativePathA, relativePathB);
    char fullPathA[512] = {0};
    strcat(fullPathA, path);
    strcat(fullPathA, relativePathA);
    char fullPathB[512] = {0};
    strcat(fullPathB, path);
    strcat(fullPathB, relativePathB);
    RemoveFileBestEffort("HydratePlaceholder016 pre-clean A", fullPathA);
    RemoveFileBestEffort("HydratePlaceholder016 pre-clean B", fullPathB);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare A start");
    auto createRetA = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePathA),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare A ret: %{public}d", createRetA);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare B start");
    auto createRetB = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePathB),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare B ret: %{public}d", createRetB);
    g_respondFetch = false;
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfoA = MakePathInfo(relativePathA);
    CloudDisk_PathInfo filePathInfoB = MakePathInfo(relativePathB);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend A start");
    auto suspendRetA = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoA,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend A ret: %{public}d", suspendRetA);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend B start");
    auto suspendRetB = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoB,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend B ret: %{public}d", suspendRetB);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel A start");
    auto cancelRetA = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoA,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel A ret: %{public}d", cancelRetA);
    bool notifiedA = WaitForCancelNotified(3000);
    g_cancelNotified = false;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel B start");
    auto cancelRetB = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoB,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel B ret: %{public}d", cancelRetB);
    bool notifiedB = WaitForCancelNotified(3000);
    g_respondFetch = true;
    bool ok = suspendRetA == CLOUD_DISK_OK && suspendRetB == CLOUD_DISK_OK &&
        (cancelRetA == CLOUD_DISK_OK || cancelRetA == OH_CLOUD_DISK_CANCELLED) &&
        (cancelRetB == CLOUD_DISK_OK || cancelRetB == OH_CLOUD_DISK_NO_HYDRATION_IN_PROGRESS) && notifiedA;
    RemoveFileBestEffort("HydratePlaceholder016 post-clean A", fullPathA);
    RemoveFileBestEffort("HydratePlaceholder016 post-clean B", fullPathB);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder017(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePathA[] = "callback_hydrate_017_a.txt";
    char relativePathB[] = "callback_hydrate_017_b.txt";
    LOGI("====>HydratePlaceholder017 params: path: %{public}s, fileA: %{public}s, fileB: %{public}s",
        path, relativePathA, relativePathB);
    char fullPathA[512] = {0};
    strcat(fullPathA, path);
    strcat(fullPathA, relativePathA);
    char fullPathB[512] = {0};
    strcat(fullPathB, path);
    strcat(fullPathB, relativePathB);
    RemoveFileBestEffort("HydratePlaceholder017 pre-clean A", fullPathA);
    RemoveFileBestEffort("HydratePlaceholder017 pre-clean B", fullPathB);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare A start");
    auto createRetA = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePathA),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare A ret: %{public}d", createRetA);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare B start");
    auto createRetB = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePathB),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare B ret: %{public}d", createRetB);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfoA = MakePathInfo(relativePathA);
    CloudDisk_PathInfo filePathInfoB = MakePathInfo(relativePathB);
    g_saveReqKeyMode = true;
    g_respondFetch = false;
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend A (save reqKey) start");
    auto suspendRetA = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoA,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder suspend A ret: %{public}d", suspendRetA);
    WaitForCallbackTriggered(3000);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel A start");
    auto cancelRetA = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoA,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel A ret: %{public}d", cancelRetA);
    bool cancelNotifiedA = WaitForCancelNotified(3000);
    g_respondFetch = true;
    g_useSavedReqKey = true;
    g_callbackTriggered = false;
    g_lastExecuteRet = CLOUD_DISK_OK;
    LOGW("====>OH_CloudDisk_HydratePlaceholder B with saved reqKey start");
    auto retB = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoB,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder B with saved reqKey ret: %{public}d", retB);
    bool bTriggered = WaitForCallbackTriggered(3000);
    LOGW("====>HydratePlaceholder017 cross-file Execute ret: %{public}d", g_lastExecuteRet);
    g_useSavedReqKey = false;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel B cleanup start");
    auto cancelRetB = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoB,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel B cleanup ret: %{public}d", cancelRetB);
    bool ok = suspendRetA == CLOUD_DISK_OK && cancelRetA == CLOUD_DISK_OK && cancelNotifiedA &&
        retB == CLOUD_DISK_OK && bTriggered && g_lastExecuteRet != CLOUD_DISK_OK;
    RemoveFileBestEffort("HydratePlaceholder017 post-clean A", fullPathA);
    RemoveFileBestEffort("HydratePlaceholder017 post-clean B", fullPathB);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value Execute003(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_execute_003.txt";
    LOGI("====>Execute003 params: path: %{public}s, relativePath: %{public}s, reqKey: forged",
        path, relativePath);
    OH_CloudDisk_CallbackReqHead reqHead = {0};
    reqHead.syncFolderPath = MakeSyncFolderPath(path);
    reqHead.callbackType = OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA;
    static uint8_t forgedReqKey[] = "forged_req_key_003";
    reqHead.reqKey.data = forgedReqKey;
    reqHead.reqKey.dataSize = sizeof(forgedReqKey) - 1;
    OH_CloudDisk_FetchDataRequest fetchReq = {0};
    fetchReq.filePath = MakePathInfo(relativePath);
    fetchReq.priority = OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL;
    OH_CloudDisk_CallbackContext reqContext = {0};
    reqContext.fetchData = &fetchReq;
    static uint8_t rspData[] = "execute_rsp_003";
    OH_CloudDisk_FetchData rspFetch = {0};
    rspFetch.offset = 0;
    rspFetch.size = sizeof(rspData) - 1;
    rspFetch.totalSize = sizeof(rspData) - 1;
    rspFetch.data.data = rspData;
    rspFetch.data.dataSize = sizeof(rspData) - 1;
    rspFetch.isComplete = true;
    OH_CloudDisk_CallbackResponse rsp = {0};
    rsp.fetchData = &rspFetch;
    LOGW("====>OH_CloudDisk_Execute forged-reqKey start");
    auto ret = OH_CloudDisk_Execute(reqHead, reqContext, rsp);
    LOGW("====>OH_CloudDisk_Execute forged-reqKey ret: %{public}d", ret);
    bool ok = ret != CLOUD_DISK_OK;
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value Execute004(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_execute_004.txt";
    LOGI("====>Execute004 params: path: %{public}s, relativePath: %{public}s, boundary: size=0",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("Execute004 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    g_boundaryMode = 1;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder boundary-size0 start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder boundary-size0 ret: %{public}d", hydrateRet);
    bool triggered = WaitForCallbackTriggered(3000);
    LOGW("====>Execute004 boundary Execute ret: %{public}d", g_lastExecuteRet);
    g_boundaryMode = 0;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup ret: %{public}d", cancelRet);
    bool ok = hydrateRet == CLOUD_DISK_OK && triggered && g_lastExecuteRet != CLOUD_DISK_OK;
    RemoveFileBestEffort("Execute004 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value Execute005(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_execute_005.txt";
    LOGI("====>Execute005 params: path: %{public}s, relativePath: %{public}s, boundary: offset over totalSize",
        path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("Execute005 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    g_boundaryMode = 2;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder boundary-offset-over start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder boundary-offset-over ret: %{public}d", hydrateRet);
    bool triggered = WaitForCallbackTriggered(3000);
    LOGW("====>Execute005 boundary Execute ret: %{public}d", g_lastExecuteRet);
    g_boundaryMode = 0;
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup start");
    auto cancelRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_CANCEL_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder cancel cleanup ret: %{public}d", cancelRet);
    bool ok = hydrateRet == CLOUD_DISK_OK && triggered && g_lastExecuteRet != CLOUD_DISK_OK;
    RemoveFileBestEffort("Execute005 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder018(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePathA[] = "callback_hydrate_018_a.txt";
    char relativePathB[] = "callback_hydrate_018_b.txt";
    LOGI("====>HydratePlaceholder018 params: path: %{public}s, fileA: %{public}s, fileB: %{public}s",
        path, relativePathA, relativePathB);
    char fullPathA[512] = {0};
    strcat(fullPathA, path);
    strcat(fullPathA, relativePathA);
    char fullPathB[512] = {0};
    strcat(fullPathB, path);
    strcat(fullPathB, relativePathB);
    RemoveFileBestEffort("HydratePlaceholder018 pre-clean A", fullPathA);
    RemoveFileBestEffort("HydratePlaceholder018 pre-clean B", fullPathB);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare A start");
    auto createRetA = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePathA),
        MakePlaceholderInfo(sizeof("hydrate_test_data") - 1, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare A ret: %{public}d", createRetA);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare B start");
    auto createRetB = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePathB),
        MakePlaceholderInfo(sizeof("hydrate_test_data") - 1, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare B ret: %{public}d", createRetB);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfoA = MakePathInfo(relativePathA);
    CloudDisk_PathInfo filePathInfoB = MakePathInfo(relativePathB);
    LOGW("====>OH_CloudDisk_HydratePlaceholder concurrent A start");
    auto fetchRetA = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoA,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder concurrent A ret: %{public}d", fetchRetA);
    LOGW("====>OH_CloudDisk_HydratePlaceholder concurrent B start");
    auto fetchRetB = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfoB,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder concurrent B ret: %{public}d", fetchRetB);
    bool bothResponded = false;
    int respondedWaitedMs = 0;
    while (respondedWaitedMs < 3000) {
        if (g_singleBlockCount >= 2) {
            bothResponded = true;
            break;
        }
        usleep(100 * 1000);
        respondedWaitedMs += 100;
    }
    LOGW("====>HydratePlaceholder018 both-responded: %{public}d, singleBlockCount: %{public}d, waitedMs: %{public}d",
        bothResponded ? 1 : 0, g_singleBlockCount, respondedWaitedMs);
    usleep(200 * 1000);
    bool contentOkA = VerifyHydratedFileAnyPath(path, "/storage/media/100/local/files/Docs/Documents/",
        relativePathA, "hydrate_test_data");
    bool contentOkB = VerifyHydratedFileAnyPath(path, "/storage/media/100/local/files/Docs/Documents/",
        relativePathB, "hydrate_test_data");
    bool ok = fetchRetA == CLOUD_DISK_OK && fetchRetB == CLOUD_DISK_OK &&
        bothResponded && contentOkA && contentOkB;
    RemoveFileBestEffort("HydratePlaceholder018 post-clean A", fullPathA);
    RemoveFileBestEffort("HydratePlaceholder018 post-clean B", fullPathB);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

static napi_value HydratePlaceholder019(napi_env env, napi_callback_info info)
{
    char path[] = "/storage/Users/currentUser/Documents/";
    char relativePath[] = "callback_hydrate_019.txt";
    LOGI("====>HydratePlaceholder019 params: path: %{public}s, relativePath: %{public}s", path, relativePath);
    char fullPath[512] = {0};
    strcat(fullPath, path);
    strcat(fullPath, relativePath);
    RemoveFileBestEffort("HydratePlaceholder019 pre-clean", fullPath);
    auto regPrepRet = RegisterDefaultSyncFolder();
    if (regPrepRet == CLOUD_DISK_NOT_SUPPORTED) {
        LOGW("====>RegisterDefaultSyncFolder not supported, skip case");
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    }
    ResetCallbackState();
    g_replayMode = true;
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare start");
    auto regCbRet = OH_CloudDisk_RegisterCallbackTable(MakeSyncFolderPath(path), TestCloudDiskCallback);
    LOGW("====>OH_CloudDisk_RegisterCallbackTable prepare ret: %{public}d", regCbRet);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare start");
    auto createRet = OH_CloudDisk_CreatePlaceholder(MakeSyncFolderPath(path), MakePathInfo(relativePath),
        MakePlaceholderInfo(1024, 1700000000000, 1700000001000), nullptr);
    LOGW("====>OH_CloudDisk_CreatePlaceholder prepare ret: %{public}d", createRet);
    CloudDisk_SyncFolderPath syncFolderPath = MakeSyncFolderPath(path);
    CloudDisk_PathInfo filePathInfo = MakePathInfo(relativePath);
    LOGW("====>OH_CloudDisk_HydratePlaceholder replay start");
    auto hydrateRet = OH_CloudDisk_HydratePlaceholder(&syncFolderPath, &filePathInfo,
        OH_CLOUD_DISK_CALLBACK_TYPE_FETCH_DATA, OH_CLOUD_DISK_HYDRATE_PRIORITY_NORMAL);
    LOGW("====>OH_CloudDisk_HydratePlaceholder replay ret: %{public}d", hydrateRet);
    bool triggered = WaitForCallbackTriggered(3000);
    g_replayMode = false;
    LOGW("====>HydratePlaceholder019 first Execute ret: %{public}d, replay Execute ret: %{public}d",
        g_lastExecuteRet, g_secondExecuteRet);
    bool ok = hydrateRet == CLOUD_DISK_OK && triggered &&
        g_lastExecuteRet == CLOUD_DISK_OK && g_secondExecuteRet != CLOUD_DISK_OK;
    RemoveFileBestEffort("HydratePlaceholder019 post-clean", fullPath);
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup start");
    auto unregCbRet = OH_CloudDisk_UnregisterCallbackTable(MakeSyncFolderPath(path));
    LOGW("====>OH_CloudDisk_UnregisterCallbackTable cleanup ret: %{public}d", unregCbRet);
    UnregisterDefaultSyncFolder();
    napi_value result = nullptr;
    napi_create_int32(env, ok ? 0 : -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "RegisterSyncFolder", nullptr, RegisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterSyncFolder001", nullptr, RegisterSyncFolder001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnregisterSyncFolder", nullptr, UnregisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ActiveSyncFolder", nullptr, ActiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DeactiveSyncFolder", nullptr, DeactiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetSyncFolders", nullptr, GetSyncFolders, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetSyncFolders001", nullptr, GetSyncFolders001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdateCustomAlias", nullptr, UpdateCustomAlias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ReFolderChanges", nullptr, ReFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnReFolderChanges", nullptr, UnReFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetSyncFolderChanges", nullptr, GetSyncFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetFileSyncStates", nullptr, SetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetFileSyncStates", nullptr, GetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "PlaceholderLifecycle001", nullptr, PlaceholderLifecycle001, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "CreatePlaceholder002", nullptr, CreatePlaceholder002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder003", nullptr, CreatePlaceholder003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder004", nullptr, CreatePlaceholder004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder005", nullptr, CreatePlaceholder005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder006", nullptr, CreatePlaceholder006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder007", nullptr, CreatePlaceholder007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder008", nullptr, CreatePlaceholder008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder009", nullptr, CreatePlaceholder009, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder010", nullptr, CreatePlaceholder010, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder011", nullptr, CreatePlaceholder011, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder012", nullptr, CreatePlaceholder012, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder013", nullptr, CreatePlaceholder013, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder014", nullptr, CreatePlaceholder014, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder015", nullptr, CreatePlaceholder015, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder016", nullptr, CreatePlaceholder016, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreatePlaceholder017", nullptr, CreatePlaceholder017, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsPlaceholderFile002", nullptr, IsPlaceholderFile002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsPlaceholderFile003", nullptr, IsPlaceholderFile003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsPlaceholderFile004", nullptr, IsPlaceholderFile004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsPlaceholderFile005", nullptr, IsPlaceholderFile005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsPlaceholderFile006", nullptr, IsPlaceholderFile006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsPlaceholderFile008", nullptr, IsPlaceholderFile008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsPlaceholderFile009", nullptr, IsPlaceholderFile009, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ConvertPlaceholderToFile002", nullptr, ConvertPlaceholderToFile002, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "ConvertPlaceholderToFile003", nullptr, ConvertPlaceholderToFile003, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "ConvertPlaceholderToFile004", nullptr, ConvertPlaceholderToFile004, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "ConvertPlaceholderToFile005", nullptr, ConvertPlaceholderToFile005, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "ConvertPlaceholderToFile006", nullptr, ConvertPlaceholderToFile006, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "UpdatePlaceholder002", nullptr, UpdatePlaceholder002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder003", nullptr, UpdatePlaceholder003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder004", nullptr, UpdatePlaceholder004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder005", nullptr, UpdatePlaceholder005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder006", nullptr, UpdatePlaceholder006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder007", nullptr, UpdatePlaceholder007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder008", nullptr, UpdatePlaceholder008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder009", nullptr, UpdatePlaceholder009, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder010", nullptr, UpdatePlaceholder010, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder011", nullptr, UpdatePlaceholder011, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdatePlaceholder012", nullptr, UpdatePlaceholder012, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CallbackLifecycle001", nullptr, CallbackLifecycle001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterCallbackTable002", nullptr, RegisterCallbackTable002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterCallbackTable003", nullptr, RegisterCallbackTable003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterCallbackTable004", nullptr, RegisterCallbackTable004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterCallbackTable005", nullptr, RegisterCallbackTable005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterCallbackTable006", nullptr, RegisterCallbackTable006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnregisterCallbackTable002", nullptr, UnregisterCallbackTable002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnregisterCallbackTable003", nullptr, UnregisterCallbackTable003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnregisterCallbackTable004", nullptr, UnregisterCallbackTable004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder002", nullptr, HydratePlaceholder002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder003", nullptr, HydratePlaceholder003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder004", nullptr, HydratePlaceholder004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder005", nullptr, HydratePlaceholder005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder006", nullptr, HydratePlaceholder006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder007", nullptr, HydratePlaceholder007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder008", nullptr, HydratePlaceholder008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder009", nullptr, HydratePlaceholder009, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder010", nullptr, HydratePlaceholder010, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder011", nullptr, HydratePlaceholder011, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder012", nullptr, HydratePlaceholder012, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder013", nullptr, HydratePlaceholder013, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder014", nullptr, HydratePlaceholder014, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder015", nullptr, HydratePlaceholder015, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder016", nullptr, HydratePlaceholder016, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder017", nullptr, HydratePlaceholder017, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder018", nullptr, HydratePlaceholder018, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydratePlaceholder019", nullptr, HydratePlaceholder019, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "HydrateDehydrateIsStatus001", nullptr, HydrateDehydrateIsStatus001, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "DehydrateFile002", nullptr, DehydrateFile002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DehydrateFile003", nullptr, DehydrateFile003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DehydrateFile004", nullptr, DehydrateFile004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DehydrateFile005", nullptr, DehydrateFile005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DehydrateFile006", nullptr, DehydrateFile006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DehydrateFile007", nullptr, DehydrateFile007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Execute002", nullptr, Execute002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Execute003", nullptr, Execute003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Execute004", nullptr, Execute004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Execute005", nullptr, Execute005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Tset_CloudDisk_CallbackType_ENUM", nullptr, Tset_CloudDisk_CallbackType_ENUM, nullptr, nullptr, nullptr,
          napi_default, nullptr },
        { "Tset_CloudDisk_HydratePriority_ENUM", nullptr, Tset_CloudDisk_HydratePriority_ENUM, nullptr, nullptr,
          nullptr, napi_default, nullptr },
        { "Tset_CloudDisk_ErrorCode_ENUM", nullptr, Tset_CloudDisk_ErrorCode_ENUM, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Tset_CloudDisk_OperationType_ENUM", nullptr, Tset_CloudDisk_OperationType_ENUM, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Tset_CloudDisk_ErrorReason_ENUM", nullptr, Tset_CloudDisk_ErrorReason_ENUM, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "clouddisk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}