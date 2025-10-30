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