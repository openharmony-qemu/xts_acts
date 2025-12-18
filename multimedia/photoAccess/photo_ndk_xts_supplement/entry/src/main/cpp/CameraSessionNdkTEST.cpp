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

#include "CameraSessionNdkTEST.h"

#define LOG_DOMAIN 0x0000
#define LOG_TAG "CameraSessionNDKLOGTAG"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

Camera_Manager* cameraManager = nullptr;
Camera_Input* cameraInput = nullptr;
Camera_Device* cameras = nullptr;
Camera_Profile* previewProfile = nullptr;
Camera_Profile* photoProfile = nullptr;
Camera_PreviewOutput* previewOutput = nullptr;
Camera_PhotoOutput *photoOutput = nullptr;
OH_MediaAsset *photoAsset = nullptr;

// 监听cameraStatus信息。
void CameraManagerStatusCallback(Camera_Manager* cameraManager, Camera_StatusInfo* status)
{
    OH_LOG_INFO(LOG_APP, "CameraManagerStatusCallback is called");
}

CameraManager_Callbacks* GetCameraManagerListener()
{
    static CameraManager_Callbacks cameraManagerListener = {
        .onCameraStatus = CameraManagerStatusCallback
    };
    return &cameraManagerListener;
}

// 监听cameraInput错误信息。
void OnCameraInputError(const Camera_Input* cameraInput, Camera_ErrorCode errorCode)
{
   OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode: %{public}d", errorCode);
}

CameraInput_Callbacks* GetCameraInputListener(void)
{
   static CameraInput_Callbacks cameraInputCallbacks = {
      .onError = OnCameraInputError
   };
   return &cameraInputCallbacks;
}

bool IsSupportedSceneMode(Camera_Device camera, Camera_SceneMode sceneMode)
{
    Camera_SceneMode* sceneModes = nullptr;
    uint32_t sceneModeSize = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedSceneModes(&camera, &sceneModes, &sceneModeSize);
    if (sceneModes == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedSceneModes failed.");
        return false;
    }
    for (uint32_t index = 0; index < sceneModeSize; index++) {
        OH_LOG_INFO(LOG_APP, "scene mode = %{public}u ", sceneModes[index]);    // 获取相机指定模式。
        if (sceneModes[index] == sceneMode) {
            return true;
        }
    }
    return false;
}

// 创建相机manager
void CreateAndOpenCamera()
{
    uint32_t size = 0;
    uint32_t cameraDeviceIndex = 0;
    // 创建CameraManager对象。
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager);
    if (cameraManager == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_Camera_GetCameraManager failed.");
        return;
    }
    // 监听相机状态变化。
    ret = OH_CameraManager_RegisterCallback(cameraManager, GetCameraManagerListener());
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_RegisterCallback failed.");
    }
    // 获取相机列表。
     ret = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
     if (cameras == nullptr || size == 0 || ret != CAMERA_OK) {
         OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameras failed.");
         return;
     }
    LOGI("OH_CameraManager_GetSupportedCameras %{public}d", size);
    // 创建相机输入流。
    ret = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[cameraDeviceIndex], &cameraInput);
    if (cameraInput == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreateCameraInput failed. %{public}d", ret);
        return;
    }
    ret = OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_RegisterCallback failed.");
    }
    // 打开相机。
    ret = OH_CameraInput_Open(cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_open failed.");
        return;
    }
    LOGI("camer input 创建成功");
}

// 创建相机photoOutput
void createPhotoOutput(char * surfaceID)
{
    const Camera_Device camera = cameras[0];
    Camera_OutputCapability* cameraOutputCapability = nullptr;
    // 示例代码以NORMAL_PHOTO模式为例，查询NORMAL_PHOTO在camera中是否支持。
    bool isSupported = IsSupportedSceneMode(camera, Camera_SceneMode::NORMAL_PHOTO);
    if (!isSupported) {
        OH_LOG_ERROR(LOG_APP, "NORMAL_PHOTO is not supported.");
    }
    // 获取相机设备支持的输出流能力。
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager, &camera,
        Camera_SceneMode::NORMAL_PHOTO, &cameraOutputCapability);
    if (cameraOutputCapability == nullptr || ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_GetSupportedCameraOutputCapability failed.");
    }
    // 以NORMAL_PHOTO模式为例，需要添加预览流、拍照流。
    if (cameraOutputCapability->previewProfiles == nullptr) {
        OH_LOG_ERROR(LOG_APP, "previewProfiles == null");
    } else {
        // 根据所需从cameraOutputCapability->previewProfiles中选择合适的预览分辨率。
        previewProfile = cameraOutputCapability->previewProfiles[0];
    }
    if (cameraOutputCapability->photoProfiles == nullptr) {
        OH_LOG_ERROR(LOG_APP, "photoProfiles == null");
    } else {
        // 根据所需从cameraOutputCapability->photoProfiles中选择合适的拍照分辨率。
        photoProfile = cameraOutputCapability->photoProfiles[0];
    }
    Camera_ErrorCode preCode = OH_CameraManager_CreatePreviewOutput(cameraManager, previewProfile, surfaceID, &previewOutput);
    if (cameraOutputCapability == nullptr || preCode != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePreviewOutput failed. %{public}d  %{public}s",preCode,surfaceID);
    }
    Camera_ErrorCode photoSurface = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, photoProfile, &photoOutput);
    if (cameraOutputCapability == nullptr || photoSurface != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraManager_CreatePhotoOutputWithoutSurface failed.");
    }
}

// 创建相机Session
void CreateCaptureSession()
{
    Camera_CaptureSession* captureSession = nullptr;
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
    // 向会话中添加相机输入流。
    ret = OH_CaptureSession_AddInput(captureSession, cameraInput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddInput failed.");
    }
    // 向会话中添加预览输出流。
    ret = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPreviewOutput failed.");
    }
    // 向会话中添加拍照输出流。
    ret = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_AddPhotoOutput failed.");
    }
    // 提交会话配置。
    ret = OH_CaptureSession_CommitConfig(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_CommitConfig failed.");
    }
    // 启动会话。
    ret = OH_CaptureSession_Start(captureSession);
    if (ret != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CaptureSession_Start failed.");
    }
    LOGI("camer session start end");
}


napi_value initWithSurface(napi_env env, napi_callback_info info) 
{
    size_t uuidLen = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char faceID[256];
    napi_get_value_string_utf8(env, args[0], faceID, sizeof(faceID), &uuidLen);
    LOGI("surface ID %{public}s", faceID);
    CreateAndOpenCamera();
    createPhotoOutput(faceID);
    CreateCaptureSession();
    
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

napi_value captureSessionStart(napi_env env, napi_callback_info info)
{
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    
    return ret;
}


void PhotoAssetAvailable(Camera_PhotoOutput *photoOutput, OH_MediaAsset *photoAsset) {
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "multimedia", "PhotoAssetAvailable ===========");
    LOGI("get photoAsset");
    photoAsset = photoAsset;
}
napi_value TestOhMediaAsset(napi_env env, napi_callback_info info) {
    LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    char surfaceId[256];
    size_t uuidLen = 0;
    napi_get_value_string_utf8(env, argValue[1], surfaceId, sizeof(surfaceId), &uuidLen);
    LOGI("surface ID %{public}s", surfaceId);
    Camera_Manager *cameraManager = nullptr;
    Camera_ErrorCode code;
    code = OH_Camera_GetCameraManager(&cameraManager);
    LOGI("Get 1  %{public}d", code);
    Camera_CaptureSession *captureSession = nullptr;
    code = OH_CameraManager_CreateCaptureSession(cameraManager, &captureSession);
    LOGI("Get 2  %{public}d", code);
    Camera_SceneMode sceneMode = NORMAL_PHOTO;
    code = OH_CaptureSession_SetSessionMode(captureSession, sceneMode);
    LOGI("Get 3  %{public}d", code);
    Camera_Device *cameras = nullptr;
    uint32_t size = 0;
    code = OH_CameraManager_GetSupportedCameras(cameraManager, &cameras, &size);
    LOGI("Get 4  %{public}d", code);
    Camera_OutputCapability *cameraOutputCapability = nullptr;
    code = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager, cameras, sceneMode,
                                                                            &cameraOutputCapability);
    LOGI("Get 5  %{public}d", code);
    Camera_Profile *profile = cameraOutputCapability->previewProfiles[0];
    Camera_PreviewOutput *previewOutput = nullptr;
    code = OH_CameraManager_CreatePreviewOutput(cameraManager, profile, surfaceId, &previewOutput);
    LOGI("Get 6  %{public}d", code);
    //code = OH_PreviewOutput_RegisterCallback(previewOutput, GetPreviewOutputListener());
    LOGI("Get 7  %{public}d", code);
    Camera_Input *cameraInput = nullptr;
    code = OH_CameraManager_CreateCameraInput(cameraManager, &cameras[0], &cameraInput);
    LOGI("Get 8  %{public}d", code);
    code = OH_CameraInput_RegisterCallback(cameraInput, GetCameraInputListener());
    LOGI("Get 9  %{public}d", code);
    code = OH_CameraInput_Open(cameraInput);
    LOGI("Get 10  %{public}d", code);
    code = OH_CaptureSession_BeginConfig(captureSession);
    LOGI("Get 11  %{public}d", code);
    bool isSuccess = false;
    code = OH_CaptureSession_CanAddInput(captureSession, cameraInput, &isSuccess);
    LOGI("Get 12  %{public}d", code);
    code = OH_CaptureSession_AddInput(captureSession, cameraInput);
    LOGI("Get 13  %{public}d", code);
    isSuccess = false;
    code = OH_CaptureSession_CanAddPreviewOutput(captureSession, previewOutput, &isSuccess);
    LOGI("Get 14  %{public}d", code);
    code = OH_CaptureSession_AddPreviewOutput(captureSession, previewOutput);
    LOGI("Get 15  %{public}d", code);
    profile = cameraOutputCapability->photoProfiles[0];
    Camera_PhotoOutput *photoOutput = nullptr;
    code = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager, profile, &photoOutput);
    LOGI("Get 16  %{public}d", code);
    isSuccess = false;
    code = OH_CaptureSession_CanAddPhotoOutput(captureSession, photoOutput, &isSuccess);
    LOGI("Get 17  %{public}d", code);
    code = OH_CaptureSession_AddPhotoOutput(captureSession, photoOutput);
    LOGI("Get 18  %{public}d", code);
    code = OH_PhotoOutput_RegisterPhotoAssetAvailableCallback(photoOutput, PhotoAssetAvailable);
    LOGI("Get 19  %{public}d", code);
    code = OH_CaptureSession_CommitConfig(captureSession);
    LOGI("Get 20  %{public}d", code);
    code = OH_CaptureSession_SetFocusMode(captureSession, Camera_FocusMode::FOCUS_MODE_AUTO);
    LOGI("Get 21  %{public}d", code);
    code = OH_CaptureSession_Start(captureSession);
    LOGI("Get 22  %{public}d", code);
    code = OH_PhotoOutput_Capture(photoOutput);
    LOGI("Get 23  %{public}d", code);
    return nullptr;
}


napi_value TestORequest(napi_env env, napi_callback_info info) {

    
}



