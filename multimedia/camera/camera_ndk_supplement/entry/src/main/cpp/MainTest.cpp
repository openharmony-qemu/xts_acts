/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "CameraTest.h"
#include "native_common.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <string>
#include <vector>
#include <map>

#define TEST_OK 0
#define TEST_FAILED (-1)

static NDKCamera *g_ndkCamera = nullptr;
using ArkCameraTestFunc = napi_value (*)(napi_env, napi_callback_info);

static napi_value InitCamera(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    size_t typeLen = 0;
    char *surfaceId = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    surfaceId = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], surfaceId, typeLen + 1, &typeLen);

    g_ndkCamera = new NDKCamera(surfaceId);
    napi_value result;
    if (g_ndkCamera->valid_) {
        napi_create_int32(env, CAMERA_OK, &result);
    } else {
        napi_create_int32(env, CAMERA_SERVICE_FATAL_ERROR, &result);
    }

    return result;
}

static napi_value OHCameraOperationNotAllowed(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_OPERATION_NOT_ALLOWED;
    if (expect == g_ndkCamera->CameraOperationNotAllowed()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraSessionNotConfig(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_SESSION_NOT_CONFIG;
    if (expect == g_ndkCamera->CameraSessionNotConfig()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraSessionNotRunning(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_SESSION_NOT_RUNNING;
    if (expect == g_ndkCamera->CameraSessionNotRunning()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraSessionConfigLocked(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_SESSION_CONFIG_LOCKED;
    if (expect == g_ndkCamera->CameraSessionConfigLocked()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraDeviceSettingLocked(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_DEVICE_SETTING_LOCKED;
    if (expect == g_ndkCamera->FrameworkToNdkCameraError(CAMERA_DEVICE_SETTING_LOCKED)) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraConflictCamera(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_CONFLICT_CAMERA;
    if (expect == g_ndkCamera->CameraConflictCamera()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraDeviceDisabled(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_DEVICE_DISABLED;
    if (expect == g_ndkCamera->CameraDeviceDisabled()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraDevicePreempted(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_DEVICE_PREEMPTED;
    if (expect == g_ndkCamera->CameraDevicePreempted()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHCameraUnresolvedConflictsWithCurrentConfigurations(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = TEST_FAILED;
    Camera_ErrorCode expect = CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS;
    if (expect == g_ndkCamera->CameraUnresolvedConflictsWithCurrentConfigurations()) {
        ret = TEST_OK;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

const std::map<std::string, ArkCameraTestFunc> FunctionErroCodeMap = {
    {"CAMERA_OPERATION_NOT_ALLOWED", OHCameraOperationNotAllowed},
    {"CAMERA_SESSION_NOT_CONFIG", OHCameraSessionNotConfig},
    {"CAMERA_SESSION_NOT_RUNNING", OHCameraSessionNotRunning},
    {"CAMERA_SESSION_CONFIG_LOCKED", OHCameraSessionConfigLocked},
    {"CAMERA_DEVICE_SETTING_LOCKED", OHCameraDeviceSettingLocked},
    {"CAMERA_CONFLICT_CAMERA", OHCameraConflictCamera},
    {"CAMERA_DEVICE_DISABLED", OHCameraDeviceDisabled},
    {"CAMERA_DEVICE_PREEMPTED", OHCameraDevicePreempted},
    {"CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS", OHCameraUnresolvedConflictsWithCurrentConfigurations},
};

static napi_value CameraErrorCode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    size_t typeLen = 0;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    char *errcode = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], errcode, typeLen + 1, &typeLen);
    std::string key(errcode);

    auto it = FunctionErroCodeMap.find(key);
    if (it != FunctionErroCodeMap.end()) {
        return it->second(env, info);
    } else {
        OH_LOG_ERROR(LOG_APP, "ArkWebTest WebSchemeHandlerProcess find %{public}s failed....", key.c_str());
        napi_value result;
        napi_create_int32(env, TEST_FAILED, &result);
        return result;
    }
}

static napi_value CameraStatusInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    size_t typeLen = 0;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &typeLen);
    char *charStatus = new char[typeLen + 1];
    napi_get_value_string_utf8(env, args[0], charStatus, typeLen + 1, &typeLen);

    int ret = TEST_FAILED;
    if (g_ndkCamera->SetCameraStatus(std::string(charStatus)) == TEST_OK) {
        ret = TEST_OK;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraFormat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    int ret = TEST_FAILED;
    if (g_ndkCamera->GetCameraFormat(index) == CAMERA_OK) {
        ret = TEST_OK;
    }
    
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value CameraFlashMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value result;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    int ret = TEST_FAILED;
    if (g_ndkCamera->HasFlashMode(index) == CAMERA_OK) {
        ret = TEST_OK;
    }
    
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc = {
        DECLARE_NAPI_FUNCTION("initCamera", InitCamera),
        DECLARE_NAPI_FUNCTION("cameraErrorCode", CameraErrorCode),
        DECLARE_NAPI_FUNCTION("cameraStatusInfo", CameraStatusInfo),
        DECLARE_NAPI_FUNCTION("cameraFormat", CameraFormat),
        DECLARE_NAPI_FUNCTION("cameraFlashMode", CameraFlashMode),
    };

    napi_define_properties(env, exports, desc.size(), desc.data());
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
