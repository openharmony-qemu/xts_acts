/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <ohcamera/camera.h>
#include <ohcamera/camera_manager.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/camera_device.h>
#include <ohcamera/camera_input.h>
#include <ohcamera/photo_output.h>
#include <ohcamera/photo_native.h>
#include <string>
#include <napi/native_api.h>
#include <ohcamera/video_output.h>
#include "CameraErrCodeTest.h"
#include <hilog/log.h>
#define CAMERA_LOG_TAG "LOG_CAMERA_TEST_TAG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LOG_DOMAIN 0x0000
#define LOG_TAG "CameraSessionNDKLOGTAG"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LogD(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
#define LogE(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)

static Camera_Manager *cameraManager = nullptr;
static Camera_Input *cameraInput = nullptr;
static Camera_Device *cameras = nullptr;
static Camera_Profile *previewProfile = nullptr;
static Camera_Profile *photoProfile = nullptr;
static Camera_PreviewOutput *previewOutput = nullptr;
static Camera_PhotoOutput *photoOutput = nullptr;
static Camera_CaptureSession *captureSession = nullptr;
static char  g_faceId[256];

bool GetString(napi_env env, napi_callback_info info, uint32_t index, std::string& outstr)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        return false;
    }
    if (index >= argc) {
        return false;
    }
    char output[MAX_BUFFER_SIZE] = {0};
    size_t size = 0;
    if (napi_get_value_string_utf8(env, args[index], output, MAX_BUFFER_SIZE, &size) != napi_ok) {
        return false;
    }
    outstr = std::string(output);
    return true;
}

int32_t GetInt(napi_env env, napi_callback_info info, uint32_t index, int32_t& outint)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        return false;
    }
    if (index >= argc) {
        return false;
    }
    if (napi_get_value_int32(env, args[index], &outint) != napi_ok) {
        return false;
    }
    return true;
}

napi_value ReturnInt(napi_env env, int32_t value, napi_value* result)
{
    napi_create_int32(env, value, result);
    return *result;
}

static bool IsSupportedSceneMode(Camera_Device camera, Camera_SceneMode sceneMode)
{
    Camera_SceneMode *sceneModes = nullptr;
    uint32_t sceneModeSize = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedSceneModes(&camera, &sceneModes, &sceneModeSize);
    if (sceneModes == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedSceneModes failed.");
        return false;
    }
    for (uint32_t index = 0; index < sceneModeSize; index++) {
        OH_LOG_INFO(LOG_APP, "scene mode = %{public}u ", sceneModes[index]);
        if (sceneModes[index] == sceneMode) {
            return true;
        }
    }
    return false;
}

static void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode: %{public}d", errorCode);
}

static CameraInput_Callbacks *GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}

static void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    OH_LOG_INFO(LOG_APP, "CameraManagerStatusCallback is called");
}

static CameraManager_Callbacks *GetCameraManagerListener()
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
}

napi_value initWithSurfaces(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], g_faceId, sizeof(g_faceId), &uuidLen);
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static void CreateAndOpenCamera()
{
    uint32_t size = 0;
    uint32_t cameraDeviceIndex = 0;
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager);
    if (cameraManager == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_Camera_GetCameraManager failed.");
        return;
    }
    ret = OH_CameraManager_RegisterCallback(cameraManager, GetCameraManagerListener());
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_RegisterCallback failed.");
    }
    ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    LOGI("OH_CameraManager_GetSupportedCameras %{public}s %{public}d", cameras[0].cameraId, size);
    if (cameras == nullptr || size == 0 || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameras failed.");
        return;
    }
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[cameraDeviceIndex], &cameraInput);
    if (cameraInput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCameraInput failed. %{public}d", ret);
        return;
    }
    ret = OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_RegisterCallback failed.");
    }
    ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_open failed.");
        return;
    }
    LOGI("camer input 创建成功");
}

static void CreatePhotoOutput(char *surFaceId)
{
    const Camera_Device camera = cameras[0];
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    bool isSupported = IsSupportedSceneMode(camera, Camera_SceneMode::NORMAL_PHOTO);
    if (!isSupported) {
        OH_LOG_ERROR(LOG_APP, "NORMAL_PHOTO is not supported.");
    }
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
        cameraManager, &camera, Camera_SceneMode::NORMAL_PHOTO, &cameraOutputCapability);
    if (cameraOutputCapability == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameraOutputCapability failed.");
    }
    if (cameraOutputCapability->previewProfiles == nullptr) {
        OH_LOG_ERROR(LOG_APP, "previewProfiles == null");
    } else {
        previewProfile = cameraOutputCapability->previewProfiles[0];
    }
    if (cameraOutputCapability->photoProfiles == nullptr) {
        OH_LOG_ERROR(LOG_APP, "photoProfiles == null");
    } else {
        photoProfile = cameraOutputCapability->photoProfiles[0];
    }
    Camera_ErrorCode preCode =
        OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, surFaceId, &previewOutput);
    if (cameraOutputCapability == nullptr || preCode != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed. %{public}d  %{public}s", preCode,
                     surFaceId);
    }
    Camera_ErrorCode photoSurface =
        OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, photoProfile, &photoOutput);
    if (cameraOutputCapability == nullptr || photoSurface != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePhotoOutputWithoutSurface failed.");
    }
}

static void CreateCaptureSession()
{
    if (cameraManager == nullptr) {
        OH_LOG_ERROR(LOG_APP, "cameraManager is nullptr.");
    }
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    if (captureSession == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCaptureSession failed.");
    }
    ret = OH_CaptureSession_SetSessionMode(captureSession, NORMAL_PHOTO);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_SetSessionMode failed.");
    }
    ret = OH_CaptureSession_BeginConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_BeginConfig failed.");
    }
    ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddInput failed.");
    }
    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPreviewOutput failed.");
    }
    ret = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput failed.");
    }
    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed. %{public}d", ret);
    }
    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed.");
    }
    LOGI("camera session start end");
}

void CreatePhotoSession()
{
    CreateAndOpenCamera();
    CreatePhotoOutput(g_faceId);
    CreateCaptureSession();
}

napi_value CaptureSessionGetWhiteBalanceRange(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    int32_t minColorTmp;
    int32_t maxColorTmp;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &minColorTmp, &maxColorTmp);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &minColorTmp, &maxColorTmp);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_3) {
        CreatePhotoSession();
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalanceRange(captureSession, nullptr, &maxColorTmp);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_4) {
        CreatePhotoSession();
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &minColorTmp, nullptr);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionGetWhiteBalance(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    int32_t colorTemperature;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_GetWhiteBalance(captureSession, &colorTemperature);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalance(captureSession, &colorTemperature);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_GetWhiteBalance(captureSession, &colorTemperature);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }  else if (index == ARG_INDEX_3) {
        CreatePhotoSession();
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalance(captureSession, nullptr);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionSetWhiteBalance(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    int32_t colorTemperature = 0;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetWhiteBalance(captureSession, colorTemperature);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_SetWhiteBalance(captureSession, colorTemperature);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_SetWhiteBalance(captureSession, colorTemperature);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionSetWhiteBalanceMode(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_WhiteBalanceMode whiteBalanceMode;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetWhiteBalanceMode(captureSession, whiteBalanceMode);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_SetWhiteBalanceMode(captureSession, whiteBalanceMode);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_SetWhiteBalanceMode(captureSession, CAMERA_WHITE_BALANCE_MODE_AUTO);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

void OnSystemLevel(Camera_CaptureSession* session, Camera_SystemPressureLevel level)
{
    return;
}

napi_value CaptureSessionRegisterSystem(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession,
                                                                                            OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionUnregisterSystem(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession,
                                                                                              OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionIsControlCenterSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    bool isSupported;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_IsControlCenterSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_IsControlCenterSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionGetSupportedEffectTypes(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_ControlCenterEffectType* types = nullptr;
    uint32_t size;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionDeleteSupportedEffectTypes(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    Camera_ControlCenterEffectType types = CONTROL_CENTER_EFFECT_TYPE_BEAUTY;
    uint32_t size = 0;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        Camera_ControlCenterEffectType* types = nullptr;
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        rest = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, types, size);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, &types, size);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        Camera_ControlCenterEffectType* types = nullptr;
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        rest = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, types, size);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionEnableControlCenter(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    bool enabled = true;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_EnableControlCenter(captureSession, enabled);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_EnableControlCenter(captureSession, enabled);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        OH_CaptureSession_EnableControlCenter(captureSession, enabled);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

void OnControlCenter(Camera_CaptureSession* session, Camera_ControlCenterStatusInfo* controlCenterStatusInfo)
{
    return;
}

napi_value CaptureSessionRegisterControl(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
    rest = OH_CaptureSession_RegisterControlCenterEffectStatusChangeCallback(captureSession, OnControlCenter);
    ret = rest;
    if (rest == CAMERA_OK) {
        ret = rest;
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionUnregisterControl(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
    rest = OH_CaptureSession_UnregisterControlCenterEffectStatusChangeCallback(captureSession, OnControlCenter);
    ret = rest;
    if (rest == CAMERA_OK) {
        ret = rest;
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}