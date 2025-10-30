/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <js_native_api_types.h>
#include "common/logger_common.h"
#include "common/utils.h"

static uint64_t g_usn = 0;
static const size_t COUNT = 10;

static void OnChangeDataCallback(const CloudDisk_SyncFolderPath syncFolderPath, 
    const CloudDisk_ChangeData changeDatas[], size_t bufferLength)
{
    LOGI("OnChangeDataCallback start");
    for (int32_t i = 0; i < bufferLength; ++i) {
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

    CloudDisk_DisplayNameInfo displayNameInfo;
    char* newname = "Ntest";
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

static napi_value RegisterSyncFolderChanges(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    LOGW("OH_CloudDisk_RegisterSyncFolderChanges start.path: %{public}s", path);
    auto ret = OH_CloudDisk_RegisterSyncFolderChanges(pathInfo, &OnChangeDataCallback);
    LOGW("OH_CloudDisk_RegisterSyncFolderChanges ret: %{public}d", ret);
    napi_value result_1 = nullptr;
    napi_create_int32(env, ret, &result_1);
    return result_1;
}

static napi_value UnregisterSyncFolderChanges(napi_env env, napi_callback_info info)
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

static napi_value SetFileSyncStates(napi_env env, napi_callback_info info)
{
    char* path = GetStringParam(env, info);
    CloudDisk_SyncFolderPath pathInfo;
    pathInfo.value = path;
    pathInfo.length = strlen(pathInfo.value);

    char* path1 = "/storage/Users/currentUser/111.txt";
    char* path2 = "/storage/Users/currentUser/222.txt";
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
        }
    };
    CloudDisk_FailedList *failedLists;
    size_t failedCount;

    LOGW("OH_CloudDisk_SetFileSyncStates start.path: %{public}s", path);
    auto ret = OH_CloudDisk_SetFileSyncStates(pathInfo, fileSyncStates, 
        sizeof(fileSyncStates) / sizeof(fileSyncStates[0]), &failedLists, &failedCount);
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

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "RegisterSyncFolder", nullptr, RegisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnregisterSyncFolder", nullptr, UnregisterSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ActiveSyncFolder", nullptr, ActiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DeactiveSyncFolder", nullptr, DeactiveSyncFolder, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetSyncFolders", nullptr, GetSyncFolders, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UpdateCustomAlias", nullptr, UpdateCustomAlias, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RegisterSyncFolderChanges", nullptr, RegisterSyncFolderChanges, nullptr, nullptr, nullptr
            , napi_default, nullptr },
        { "UnregisterSyncFolderChanges", nullptr, UnregisterSyncFolderChanges, nullptr, nullptr, nullptr
            , napi_default, nullptr },
        { "GetSyncFolderChanges", nullptr, GetSyncFolderChanges, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetFileSyncStates", nullptr, SetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetFileSyncStates", nullptr, GetFileSyncStates, nullptr, nullptr, nullptr, napi_default, nullptr },
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