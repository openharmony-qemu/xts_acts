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

#include "CameraNdkTest.h"
#include <cstddef>
#include <cstdint>
#include <ohcamera/camera_manager.h>
#include <ohcamera/metadata_output.h>

#define LOG_DOMAIN 0x0000
#define LOG_TAG "CameraSessionNDKLOGTAG"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8

static Camera_Manager *cameraManager = nullptr;
static Camera_Input *cameraInput = nullptr;
static Camera_Device *cameras = nullptr;
static Camera_Profile *previewProfile = nullptr;
static Camera_Profile *photoProfile = nullptr;
static Camera_PreviewOutput *previewOutput = nullptr;
static Camera_PhotoOutput *photoOutput = nullptr;
static Camera_CaptureSession *captureSession = nullptr;
static char  g_faceId[256];

static void CameraManagerStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    OH_LOG_INFO(LOG_APP, "CameraManagerStatusCallback is called");
}

static CameraManager_Callbacks *GetCameraManagerListener()
{
    static CameraManager_Callbacks cameraManagerListener = {.onCameraStatus = CameraManagerStatusCallback};
    return &cameraManagerListener;
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

static void createPhotoOutput(char *surFaceId)
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


napi_value initWithSurfaces(napi_env env, napi_callback_info info)
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0],  g_faceId, sizeof( g_faceId), &uuidLen);
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

void CreatePhotoSession()
{
    CreateAndOpenCamera();
    createPhotoOutput( g_faceId);
    CreateCaptureSession();
}

void ReleasePhotoSession()
{
    if (cameraInput != nullptr) {
        OH_CameraInput_Release(cameraInput);
    }
    if (previewOutput != nullptr) {
        OH_PreviewOutput_Release(previewOutput);
    }
    if (photoOutput != nullptr) {
        OH_PhotoOutput_Release(photoOutput);
    }
    if (captureSession != nullptr) {
        OH_CaptureSession_Release(captureSession);
    }
}

napi_value captureDeleteCameraDevices(napi_env env, napi_callback_info info)
{
    CreatePhotoSession();
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    int32_t result = 0;
    uint32_t size = 0;
    int32_t ret1;
    ret1 = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    LOGI("OH_CameraManager_GetSupportedCameras %{public}s %{public}d", cameras[0].cameraId, size);
    if (cameras != nullptr && size > 0 && ret1 == CAMERA_OK) {
        bool foundMatch = true;
        if (foundMatch) {
            uint32_t cameraSize = 0;
            Camera_Type type = cameras[0].cameraType;
            Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                                .cameraTypeSize = cameraSize,
                                                .cameraPosition = cameras[0].cameraPosition,
                                                .connectionType = cameras[0].connectionType};
            uint32_t returnedSize = 0;
            Camera_Device *queriedCameras = nullptr;
            result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &returnedSize, &queriedCameras);
            if (result == 0 && queriedCameras != nullptr) {
                OH_LOG_INFO(LOG_APP, "成功查询到 %{public}d 个符合条件的摄像头", returnedSize);
                switch (index) {
                case CASE_INDEX_1:
                    result = OH_CameraManager_DeleteCameraDevices(cameraManager, queriedCameras);
                    break;
                case CASE_INDEX_2:
                    result = OH_CameraManager_DeleteCameraDevices(nullptr, queriedCameras);
                    break;
                case CASE_INDEX_3:
                    result = OH_CameraManager_DeleteCameraDevices(cameraManager, nullptr);
                    break;
                case CASE_INDEX_4:
                    result = OH_CameraManager_DeleteCameraDevices(NULL, queriedCameras);
                    break;
                case CASE_INDEX_5:
                    result = OH_CameraManager_DeleteCameraDevices(cameraManager, NULL);
                    break;
                default:
                    break;
                }
            } else {
                OH_LOG_ERROR(LOG_APP, "查询摄像头设备失败");
            }
        } else {
            OH_LOG_INFO(LOG_APP, "没有找到符合条件的摄像头");
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "摄像头列表为空或未初始化");
    }

    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureIsBandwidthCompressionSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    bool isSupported;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, &isSupported);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(nullptr, &isSupported);
        break;
    case CASE_INDEX_3:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, nullptr);
        break;
    case CASE_INDEX_4:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(NULL, &isSupported);
        break;
    case CASE_INDEX_5:
        result = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, NULL);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureEnableBandwidthCompression(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    CreatePhotoSession();
    Camera_ErrorCode result;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, true);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, false);
        break;
    case CASE_INDEX_3:
        result = OH_PreviewOutput_EnableBandwidthCompression(nullptr, true);
        break;
    case CASE_INDEX_4:
        result = OH_PreviewOutput_EnableBandwidthCompression(nullptr, false);
        break;
    case CASE_INDEX_5:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, NULL);
        break;
    case CASE_INDEX_6:
        result = OH_PreviewOutput_EnableBandwidthCompression(NULL, true);
        break;
    case CASE_INDEX_7:
        result = OH_PreviewOutput_EnableBandwidthCompression(NULL, false);
        break;
    case CASE_INDEX_8:
        result = OH_PreviewOutput_EnableBandwidthCompression(NULL, true);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureEnableBandwidthCompressionError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreateAndOpenCamera();
    createPhotoOutput(g_faceId);
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
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, true);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_EnableBandwidthCompression(previewOutput, false);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret1;
    napi_create_int32(env, result, &ret1);
    return ret1;
}

napi_value captureIsGetCameraDevices(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode cameraCode;
    uint32_t cameraSize = 0;
    Camera_Type type = CAMERA_TYPE_DEFAULT;
    Camera_Device *cameras = nullptr;
    Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                        .cameraTypeSize = cameraSize,
                                        .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                        .connectionType = CAMERA_CONNECTION_BUILT_IN};
    cameraCode = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &cameraSize, &cameras);
    int32_t enable = false;
    if (cameraCode == 0 && cameraSize >= 0) {
        enable = true;
    }
    ReleasePhotoSession();
    napi_value result;
    napi_get_boolean(env, enable, &result);
    return result;
};

napi_value captureGetSupportedFullCameraOutputCapabilityWithSceneMode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    Camera_OutputCapability **cameraOutputCapability;
    uint32_t cameraSize = 0;
    Camera_Type type = CAMERA_TYPE_DEFAULT;
    Camera_Device *cameras = nullptr;
    Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                        .cameraTypeSize = cameraSize,
                                        .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                        .connectionType = CAMERA_CONNECTION_BUILT_IN};
    result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &cameraSize, &cameras);
    OH_LOG_INFO(
        LOG_APP,
        "OH_CameraManager_GetCameraDevices, cameraManager=%{public}p, cameras=%{public}p,cameras=%{public}d",
        cameraManager, cameras, cameraSize);
    switch (index) {
    case CASE_INDEX_1:
        OH_LOG_INFO(LOG_APP, "Normal case, cameraManager=%{public}p, cameras=%{public}p", cameraManager, cameras);
        if (cameraManager == nullptr || cameras == nullptr) {
            OH_LOG_ERROR(LOG_APP, "cameraManager or cameras is null!");
            break;
        };
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, cameras, NORMAL_PHOTO, cameraOutputCapability);
        break;
    case CASE_INDEX_2:
        if (cameraManager == nullptr || cameras == nullptr) {
            OH_LOG_ERROR(LOG_APP, "cameraManager or cameras is null!");
            break;
        };
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, cameras, NORMAL_VIDEO, cameraOutputCapability);
        break;
    case CASE_INDEX_3:
        if (cameraManager == nullptr || cameras == nullptr) {
            OH_LOG_ERROR(LOG_APP, "cameraManager or cameras is null!");
            break;
        };
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, cameras, SECURE_PHOTO, cameraOutputCapability);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, nullptr, NORMAL_PHOTO, cameraOutputCapability);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, nullptr, NORMAL_VIDEO, cameraOutputCapability);
        break;
    case CASE_INDEX_6:
        result = OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode(
            cameraManager, nullptr, SECURE_PHOTO, cameraOutputCapability);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

void OnOcclusionDetectionCallback(const Camera_Input *cameraInput,
                                  Camera_OcclusionDetectionResult occlusionDetectionResult)
{
    
};

napi_value captureRegisterOcclusionDetectionCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    CreatePhotoSession();
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_2:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(nullptr, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_3:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput, nullptr);
        break;
    case CASE_INDEX_4:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(NULL, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_5:
        result = OH_CameraInput_RegisterOcclusionDetectionCallback(cameraInput, NULL);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureUnregisterOcclusionDetectionCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    CreatePhotoSession();
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_2:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(nullptr, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_3:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput, nullptr);
        break;
    case CASE_INDEX_4:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(NULL, OnOcclusionDetectionCallback);
        break;
    case CASE_INDEX_5:
        result = OH_CameraInput_UnregisterOcclusionDetectionCallback(cameraInput, NULL);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraPreconfigType(napi_env env, napi_callback_info info)
{
    Camera_PreconfigType result = PRECONFIG_HIGH_QUALITY_PHOTOSESSION_BT2020;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureGetCameraDevices(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureGetCameraDevicesError(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Type type = CAMERA_TYPE_DEFAULT;
    Camera_Device *cameras = nullptr;
    Camera_DeviceQueryInfo queryInfo = {.cameraType = &type,
                                        .cameraTypeSize = cameraSize,
                                        .cameraPosition = CAMERA_POSITION_FRONT,
                                        .connectionType = CAMERA_CONNECTION_BUILT_IN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(nullptr, &queryInfo, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, nullptr, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, nullptr, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo, &cameraSize, nullptr);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoCameraType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureSessionIsBandwidthCompressionSupportedTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    bool enable;
    Camera_ErrorCode error = OH_PreviewOutput_IsBandwidthCompressionSupported(previewOutput, &enable);
    ReleasePhotoSession();
    napi_value result;
    napi_get_boolean(env, enable, &result);
    return result;
}

napi_value captureCameraDeviceQueryInfoConnectionTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoConnectionType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_UNSPECIFIED,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoCameraPositions(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfoCameraTypeSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_BACK,
                                         .connectionType = CAMERA_CONNECTION_REMOTE};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

bool found(Camera_DeviceQueryInfo info)
{
    uint32_t size = 0;
    int32_t ret1;
    ret1 = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    LOGI("OH_CameraManager_GetSupportedCameras %{public}s %{public}d", cameras[0].cameraId, size);
    if (cameras != nullptr && size > 0 && ret1 == CAMERA_OK) {
        for (uint32_t i = 0; i < size; i++) {
            LOGI("cameras  %{public}d", cameras[i]);
            LOGI("cameraType  %{public}d", cameras[i].cameraType);
            LOGI("cameraPosition  %{public}d", cameras[i].cameraPosition);
            LOGI("connectionType  %{public}d", cameras[i].connectionType);
            if (cameras[i].cameraType == *(info.cameraType) && cameras[i].cameraPosition == info.cameraPosition &&
                cameras[i].connectionType == info.connectionType) {
                LOGI("查询的符合相机的数量为  %{public}d", size);
                return true;
            }
        }
    }
    return false;
}

napi_value captureCameraDeviceQueryInfoCameraTypeSizes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    napi_get_value_int32(env, args[0], &index);
    int32_t result = 0;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_BUILT_IN};
    switch (index) {
    case CASE_INDEX_1:
        if (found(queryInfo0)) {
            result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        }
        break;
    case CASE_INDEX_2:
        if (found(queryInfo1)) {
            result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        }
        break;
    case CASE_INDEX_3:
        if (found(queryInfo2)) {
            result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        }
        break;
    case CASE_INDEX_4:
        if (found(queryInfo3)) {
            result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        }
        break;
    case CASE_INDEX_5:
        if (found(queryInfo4)) {
            result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
        }
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value captureCameraDeviceQueryInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    CreatePhotoSession();
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    uint32_t cameraSize = 0;
    Camera_Device *cameras = nullptr;
    Camera_Type type0 = CAMERA_TYPE_DEFAULT;
    Camera_Type type1 = CAMERA_TYPE_WIDE_ANGLE;
    Camera_Type type2 = CAMERA_TYPE_ULTRA_WIDE;
    Camera_Type type3 = CAMERA_TYPE_TELEPHOTO;
    Camera_Type type4 = CAMERA_TYPE_TRUE_DEPTH;
    Camera_DeviceQueryInfo queryInfo0 = {.cameraType = &type0,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo1 = {.cameraType = &type1,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo2 = {.cameraType = &type2,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo3 = {.cameraType = &type3,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    Camera_DeviceQueryInfo queryInfo4 = {.cameraType = &type4,
                                         .cameraTypeSize = cameraSize,
                                         .cameraPosition = CAMERA_POSITION_FRONT,
                                         .connectionType = CAMERA_CONNECTION_USB_PLUGIN};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo0, &cameraSize, &cameras);
        break;
    case CASE_INDEX_2:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo1, &cameraSize, &cameras);
        break;
    case CASE_INDEX_3:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo2, &cameraSize, &cameras);
        break;
    case CASE_INDEX_4:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo3, &cameraSize, &cameras);
        break;
    case CASE_INDEX_5:
        result = OH_CameraManager_GetCameraDevices(cameraManager, &queryInfo4, &cameraSize, &cameras);
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value getPreviewRotationWithoutDisplayRotation(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    CreatePhotoSession();
    Camera_ErrorCode result;
    Camera_ImageRotation *imageRotation;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(previewOutput, nullptr);
        break;
    case CASE_INDEX_2:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(nullptr, imageRotation);
        break;
    case CASE_INDEX_3:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(previewOutput, NULL);
        break;
    case CASE_INDEX_4:
        result = OH_PreviewOutput_GetPreviewRotationWithoutDisplayRotation(NULL, imageRotation);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value metadataOutputAddMetadataObjectTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    CreatePhotoSession();
    Camera_ErrorCode result;
    uint32_t size;
    Camera_MetadataObjectType type1[] = {FACE_DETECTION};
    Camera_MetadataObjectType type2[] = {CAMERA_METADATA_OBJECT_TYPE_HUMAN_BODY};
    Camera_MetadataObjectType type3[] = {CAMERA_METADATA_OBJECT_TYPE_FACE_DETECTION};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataOutput_AddMetadataObjectTypes(nullptr, type1, size);
        break;
    case CASE_INDEX_2:
        result = OH_MetadataOutput_AddMetadataObjectTypes(nullptr, type2, size);
        break;
    case CASE_INDEX_3:
        result = OH_MetadataOutput_AddMetadataObjectTypes(nullptr, type3, size);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value metadataOutputRemoveMetadataObjectTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    CreatePhotoSession();
    Camera_ErrorCode result;
    uint32_t size;
    Camera_MetadataObjectType type1[] = {FACE_DETECTION};
    Camera_MetadataObjectType type2[] = {CAMERA_METADATA_OBJECT_TYPE_HUMAN_BODY};
    Camera_MetadataObjectType type3[] = {CAMERA_METADATA_OBJECT_TYPE_FACE_DETECTION};
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataOutput_RemoveMetadataObjectTypes(nullptr, type1, size);
        break;
    case CASE_INDEX_2:
        result = OH_MetadataOutput_RemoveMetadataObjectTypes(nullptr, type2, size);
        break;
    case CASE_INDEX_3:
        result = OH_MetadataOutput_RemoveMetadataObjectTypes(nullptr, type3, size);
        break;
    default:
        break;
    }
    ReleasePhotoSession();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value OHCameraManagerCreateMetadataOutputWithObjectTypesSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_CameraManager_CreateMetadataOutputWithObjectTypes(nullptr, nullptr, 1, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHPhotoOutputGetPhotoRotationWithoutDeviceDegreeSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_PhotoOutput_GetPhotoRotationWithoutDeviceDegree(nullptr, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHVideoOutputGetVideoRotationWithoutDeviceDegreeSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_VideoOutput_GetVideoRotationWithoutDeviceDegree(nullptr, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value TestOHCaptureSessionIsLockFocusTrackingSupported(napi_env env, napi_callback_info info)
{
    CreatePhotoSession();
    bool isSupported = OH_CaptureSession_IsLockFocusTrackingSupported(captureSession);
    ReleasePhotoSession();
    napi_value result;
    napi_get_boolean(env, isSupported, &result);
    return result;
}

napi_value TestLockFocusTrackingWhenNotSupported(napi_env env, napi_callback_info info)
{
    napi_value result;
    CreatePhotoSession();
    bool isSupported = OH_CaptureSession_IsLockFocusTrackingSupported(captureSession);
    if (!isSupported) {
        Camera_Point focusPoint = {0.5, 0.5};
        Camera_ErrorCode ret = OH_CaptureSession_LockFocusTracking(captureSession, focusPoint);
        if (ret != CAMERA_OK) {
            OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_LockFocusTracking failed.");
            ReleasePhotoSession();
            napi_create_int32(env, ret, &result);
            return result;
        }
    }
    ReleasePhotoSession();
    napi_create_int32(env, CAMERA_OK, &result);
    return result;
}

napi_value TestUnlockFocusTrackingWhenNotSupported(napi_env env, napi_callback_info info)
{
    napi_value result;
    CreatePhotoSession();
    bool isSupported = OH_CaptureSession_IsLockFocusTrackingSupported(captureSession);
    if (!isSupported) {
        Camera_ErrorCode ret = OH_CaptureSession_UnlockFocusTracking(captureSession);
        if (ret != CAMERA_OK) {
            OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_LockFocusTracking failed.");
            ReleasePhotoSession();
            napi_create_int32(env, ret, &result);
            return result;
        }
    }
    ReleasePhotoSession();
    napi_create_int32(env, CAMERA_OK, &result);
    return result;
}

napi_value TestIsLockFocusTrackingSupportedWithUnconfiguredSession(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    bool isSupported = OH_CaptureSession_IsLockFocusTrackingSupported(captureSession);
    if (isSupported) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_IsLockFocusTrackingSupported failed.");
        OH_CaptureSession_Release(captureSession);
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value TestIsLockFocusTrackingSupportedWithNullptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool isSupported = OH_CaptureSession_IsLockFocusTrackingSupported(nullptr);
    if (isSupported) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_IsLockFocusTrackingSupported failed.");
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value TestLockFocusTrackingNormalValidPoint(napi_env env, napi_callback_info info)
{
    napi_value result;
    CreatePhotoSession();
    Camera_Point focusPoint = {0.5, 0.5};
    Camera_ErrorCode ret = OH_CaptureSession_LockFocusTracking(captureSession, focusPoint);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_LockFocusTracking failed.");
        ReleasePhotoSession();
        napi_create_int32(env, ret, &result);
        return result;
    }
    OH_CaptureSession_UnlockFocusTracking(captureSession);
    ReleasePhotoSession();
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestLockFocusTrackingWithNullptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_Point focusPoint = {0.5, 0.5};
    Camera_ErrorCode ret = OH_CaptureSession_LockFocusTracking(nullptr, focusPoint);
    if (ret != CAMERA_INVALID_ARGUMENT) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_LockFocusTracking failed.");
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestLockFocusTrackingWithUnconfiguredSession(napi_env env, napi_callback_info info)
{
    napi_value result;
    Camera_Point focusPoint = {0.5, 0.5};
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    Camera_ErrorCode ret = OH_CaptureSession_LockFocusTracking(captureSession, focusPoint);
    if (ret != CAMERA_SESSION_NOT_CONFIG) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_LockFocusTracking failed.");
        OH_CaptureSession_Release(captureSession);
        napi_create_int32(env, ret, &result);
        return result;
    }
    OH_CaptureSession_Release(captureSession);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestLockFocusTrackingRepeatLock(napi_env env, napi_callback_info info)
{
    napi_value result;
    CreatePhotoSession();
    Camera_Point focusPoint = {0.5, 0.5};
    Camera_ErrorCode ret = OH_CaptureSession_LockFocusTracking(captureSession, focusPoint);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_LockFocusTracking failed.");
        ReleasePhotoSession();
        napi_create_int32(env, ret, &result);
        return result;
    }
    ret = OH_CaptureSession_LockFocusTracking(captureSession, focusPoint);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_LockFocusTracking failed.");
        ReleasePhotoSession();
        napi_create_int32(env, ret, &result);
        return result;
    }
    OH_CaptureSession_UnlockFocusTracking(captureSession);
    ReleasePhotoSession();
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestUnlockFocusTracking(napi_env env, napi_callback_info info)
{
    napi_value result;
    CreatePhotoSession();
    Camera_Point focusPoint = {0.5, 0.5};
    OH_CaptureSession_LockFocusTracking(captureSession, focusPoint);
    Camera_ErrorCode ret = OH_CaptureSession_UnlockFocusTracking(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_UnlockFocusTracking failed.");
        ReleasePhotoSession();
        napi_create_int32(env, ret, &result);
        return result;
    }
    ReleasePhotoSession();
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestUnlockFocusTrackingWithNullptr(napi_env env, napi_callback_info info)
{
    Camera_ErrorCode ret = OH_CaptureSession_UnlockFocusTracking(nullptr);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestUnlockFocusTrackingWithUnconfiguredSession(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    Camera_ErrorCode ret = OH_CaptureSession_UnlockFocusTracking(captureSession);
    if (ret != CAMERA_SESSION_NOT_CONFIG) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_UnlockFocusTracking failed.");
        OH_CaptureSession_Release(captureSession);
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestLockFocusTrackingRepeatUnlock(napi_env env, napi_callback_info info)
{
    napi_value result;
    CreatePhotoSession();
    Camera_Point focusPoint = {0.5, 0.5};
    Camera_ErrorCode ret = OH_CaptureSession_UnlockFocusTracking(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_UnlockFocusTracking failed.");
        ReleasePhotoSession();
        napi_create_int32(env, ret, &result);
        return result;
    }
    ret = OH_CaptureSession_UnlockFocusTracking(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_UnlockFocusTracking failed.");
        ReleasePhotoSession();
        napi_create_int32(env, ret, &result);
        return result;
    }
    ReleasePhotoSession();
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestOHMetadataObjectExtGetBoundingBox(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_Camera_MetadataObjectExt* MetadataObjectExt;
    Camera_ErrorCode result;
    OH_Camera_Rect_Ext boundingBox;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetBoundingBox(nullptr, &boundingBox);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetEmotion(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    OH_Camera_MetadataObjectEmotion emotion;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetEmotion(nullptr, &emotion);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetLeftEyeBoundingBox(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    OH_Camera_Rect_Ext leftEyeBoundingBox;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetLeftEyeBoundingBox(nullptr, &leftEyeBoundingBox);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetMetadataObjectType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    Camera_MetadataObjectType type;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetMetadataObjectType(nullptr, &type);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetPitchAngle(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    float pitchAngle;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetPitchAngle(nullptr, &pitchAngle);
        break;
    case CASE_INDEX_2:
        OH_Camera_MetadataObjectExt* MetadataObjectExt;
        result = OH_MetadataObjectExt_GetPitchAngle(MetadataObjectExt, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetRightEyeBoundingBox(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    OH_Camera_MetadataObjectExt* MetadataObjectExt;
    OH_Camera_Rect_Ext rightEyeBoundingBox;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetRightEyeBoundingBox(nullptr, &rightEyeBoundingBox);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetRollAngle(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    OH_Camera_MetadataObjectExt* MetadataObjectExt;
    float rollAngle;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetRollAngle(nullptr, &rollAngle);
        break;
    case CASE_INDEX_2:
        result = OH_MetadataObjectExt_GetRollAngle(MetadataObjectExt, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetTimestamp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    OH_Camera_MetadataObjectExt* MetadataObjectExt;
    int64_t timestamp;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetTimestamp(nullptr, &timestamp);
        break;
    case CASE_INDEX_2:
        result = OH_MetadataObjectExt_GetTimestamp(MetadataObjectExt, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtGetYawAngle(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    Camera_ErrorCode result;
    OH_Camera_MetadataObjectExt* MetadataObjectExt;
    float yawAngle;
    switch (index) {
    case CASE_INDEX_1:
        result = OH_MetadataObjectExt_GetYawAngle(nullptr, &yawAngle);
        break;
    case CASE_INDEX_2:
        result = OH_MetadataObjectExt_GetYawAngle(MetadataObjectExt, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtDestroy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    bool result = false;
    uint32_t objectCount = 1;
    switch (index) {
    case CASE_INDEX_1: {
        OH_Camera_MetadataObjectExt** MetadataObjectExt = nullptr;
        OH_MetadataObjectExt_Destroy(MetadataObjectExt, objectCount);
        result = true;
        break;
    }
    default:
        break;
    }
    napi_value ret;
    napi_get_boolean(env, result, &ret);
    return ret;
}

napi_value TestOHMetadataObjectExtIsLockFocusTracked(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    bool result;
    napi_value ret = nullptr;
    switch (index) {
    case CASE_INDEX_1: {
        OH_Camera_MetadataObjectExt* MetadataObjectExt = nullptr;
        result = OH_MetadataObjectExt_IsLockFocusTracked(MetadataObjectExt);
        napi_get_boolean(env, result, &ret);
        break;
    }
    default:
        napi_get_boolean(env, false, &ret);
        break;
    }
    return ret;
}