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

#include <hilog/log.h>
#define CAMERA_LOG_TAG "LOG_CAMERA_TEST_TAG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LogD(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
#define LogE(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)

NDKCamera::NDKCamera(char *str)
{
    valid_ = false;
    size_ = 0;
    previewSurfaceId_ = str;
    // 创建CameraManager实例。
    Camera_ErrorCode ret = OH_Camera_GetCameraManager(&cameraManager_);
    if (cameraManager_ == nullptr || ret != CAMERA_OK) {
        LogE("create camera manger failed... %{public}d", ret);
    }
    valid_ = true;
}

NDKCamera::~NDKCamera()
{
    valid_ = false;
    if (cameraManager_) {
        int ret = OH_Camera_DeleteCameraManager(cameraManager_);
        if (ret != CAMERA_OK) {
            LogE("删除CameraManager实例成功. %{public}d", ret);
        } else {
            LogE("删除CameraManager实例失败. %{public}d", ret);
        }
        cameraManager_ = nullptr;
    }
}

Camera_ErrorCode NDKCamera::CameraOperationNotAllowed()
{
    Camera_CaptureSession* captureSession = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession);
    ret = OH_CaptureSession_SetSessionMode(captureSession, Camera_SceneMode::NORMAL_VIDEO);
    ret = OH_CaptureSession_EnableMacro(captureSession, true);
    return ret;
}

Camera_ErrorCode NDKCamera::CameraSessionNotConfig()
{
    Camera_CaptureSession* captureSession;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession);
    bool isSupported = false;
    ret = OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession, STABILIZATION_MODE_MIDDLE, &isSupported);
    return ret;
}

Camera_ErrorCode NDKCamera::CameraSessionNotRunning()
{
    Camera_PhotoOutput* photoOutput_;
    Camera_Profile* profile_;
    Camera_SceneMode sceneMode_ = NORMAL_PHOTO;
    Camera_OutputCapability* cameraOutputCapability_;
    Camera_ErrorCode ret = GetSupportedCameras();
    Camera_Device* camera_ = &cameras_[0];
    ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, camera_, sceneMode_,
        &cameraOutputCapability_);
    profile_ = cameraOutputCapability_->photoProfiles[0];
    ret = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, previewSurfaceId_, &photoOutput_);
    ret = OH_PhotoOutput_Capture(photoOutput_);
    return ret;
}

Camera_ErrorCode NDKCamera::CameraSessionConfigLocked()
{
    Camera_ErrorCode ret = CreateSession();
    ret = SessionBegin();
    ret = SessionBegin();
    return ret;
}

Camera_ErrorCode NDKCamera::GetSupportedCameras(void)
{
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &cameras_, &size_);
    if (cameras_ == nullptr || size_ == 0) {
        LogE("Get supported cameras failed.");
        return CAMERA_INVALID_ARGUMENT;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::CreateCameraInput(void)
{
    Camera_ErrorCode ret_ = OH_CameraManager_CreateCameraInput(cameraManager_, &cameras_[0], &cameraInput_);
    if (cameraInput_ == nullptr || ret_ != CAMERA_OK) {
        LogE("CreateCameraInput failed.");
        return ret_;
    }
    CameraInputRegisterCallback();
    return ret_;
}

// CameraInput Callback
void OnCameraInputError(const Camera_Input *cameraInput, Camera_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnCameraInput errorCode = %{public}d", errorCode);
}

CameraInput_Callbacks *NDKCamera::GetCameraInputListener(void)
{
    static CameraInput_Callbacks cameraInputCallbacks = {.onError = OnCameraInputError};
    return &cameraInputCallbacks;
}

Camera_ErrorCode NDKCamera::CameraInputRegisterCallback(void)
{
    Camera_ErrorCode ret_ = OH_CameraInput_RegisterCallback(cameraInput_, GetCameraInputListener());
    if (ret_ != CAMERA_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_CameraInput_RegisterCallback failed.");
    }
    return ret_;
}

Camera_ErrorCode NDKCamera::CameraConflictCamera()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    Camera_Input* cameraInput = nullptr;
    ret = OH_CameraManager_CreateCameraInput(cameraManager_, deviceList, &cameraInput);
    return CAMERA_CONFLICT_CAMERA;
}

Camera_ErrorCode NDKCamera::CameraDeviceDisabled()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    return CAMERA_DEVICE_DISABLED;
}

Camera_ErrorCode NDKCamera::CameraDevicePreempted()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    return CAMERA_DEVICE_PREEMPTED;
}

Camera_ErrorCode NDKCamera::CameraUnresolvedConflictsWithCurrentConfigurations()
{
    Camera_Device* deviceList = nullptr;
    uint32_t deviceCount = 0;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameras(cameraManager_, &deviceList, &deviceCount);
    if (ret != CAMERA_OK || deviceCount == 0) {
        return ret;
    }
    return CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS;
}

Camera_ErrorCode NDKCamera::CreateSession(void)
{
    if (!cameraManager_) {
        return Camera_ErrorCode::CAMERA_INVALID_ARGUMENT;
    }
    Camera_ErrorCode ret =  OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    if (captureSession_ == nullptr || ret != CAMERA_OK) {
        LogE("ndkXTS Create captureSession failed.");
    }
    CaptureSessionRegisterCallback();
    return ret;
}

// Session Callback
void CaptureSessionOnFocusStateChange(Camera_CaptureSession* session, Camera_FocusState focusState)
{
    LogD("CaptureSessionOnFocusStateChange");
}

void CaptureSessionOnError(Camera_CaptureSession* session, Camera_ErrorCode errorCode)
{
    LogD("CaptureSession errorCode = %d", errorCode);
}

CaptureSession_Callbacks* NDKCamera::GetCaptureSessionRegister(void)
{
    static CaptureSession_Callbacks captureSessionCallbacks = {
        .onFocusStateChange = CaptureSessionOnFocusStateChange,
        .onError = CaptureSessionOnError
    };
    return &captureSessionCallbacks;
}

Camera_ErrorCode NDKCamera::CaptureSessionRegisterCallback(void)
{
    Camera_ErrorCode  ret = OH_CaptureSession_RegisterCallback(captureSession_, GetCaptureSessionRegister());
    if (ret != CAMERA_OK) {
        LogE("OH_CaptureSession_RegisterCallback failed.");
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionBegin(void)
{
    Camera_ErrorCode ret =  OH_CaptureSession_BeginConfig(captureSession_);
    LogD("OH_CaptureSession_RegisterCallback ret:%{public}d", ret);
    return ret;
}

Camera_ErrorCode NDKCamera::FrameworkToNdkCameraError(int ret)
{
    Camera_ErrorCode err = CAMERA_OK;
    switch (ret) {
    case Camera_ErrorCode::CAMERA_DEVICE_SETTING_LOCKED:
            err = CAMERA_DEVICE_SETTING_LOCKED;
            break;
        default:
            LogE("FrameworkToNdkCameraError matched failed. ret:%{public}d", ret);
    }
    
    return err;
}

void MyStatusCallback(Camera_Manager *cameraManager, Camera_StatusInfo *status)
{
    Camera_StatusInfo checkStatus;
    checkStatus.camera->cameraId = "001";
    checkStatus.status = CAMERA_STATUS_APPEAR;

    if (status->camera->cameraId == checkStatus.camera->cameraId) {
        LogD("camera is OK.");
    }

    if (status->status == checkStatus.status) {
        LogD("camera status is OK.");
    }
}

Camera_ErrorCode NDKCamera::SetCameraStatus(std::string info)
{
    Camera_Status status = CAMERA_STATUS_APPEAR;
    Camera_Connection conType = CAMERA_CONNECTION_REMOTE;
    if ("CAMERA_STATUS_APPEAR" == info) {
        status = CAMERA_STATUS_APPEAR;
    } else if ("CAMERA_STATUS_DISAPPEAR" == info) {
        status = CAMERA_STATUS_DISAPPEAR;
    } else if ("CAMERA_STATUS_AVAILABLE" == info) {
        status = CAMERA_STATUS_AVAILABLE;
    } else if ("CAMERA_STATUS_UNAVAILABLE" == info) {
        status = CAMERA_STATUS_UNAVAILABLE;
    } else if ("CAMERA_CONNECTION_BUILT_IN" == info) {
        conType = CAMERA_CONNECTION_BUILT_IN;
    } else if ("CAMERA_CONNECTION_USB_PLUGIN" == info) {
        conType = CAMERA_CONNECTION_USB_PLUGIN;
    } else if ("CAMERA_CONNECTION_REMOTE" == info) {
        conType = CAMERA_CONNECTION_REMOTE;
    }
    
    CameraManager_Callbacks callback = {
        .onCameraStatus = MyStatusCallback,
    };

    Camera_ErrorCode ret = OH_CameraManager_RegisterCallback(cameraManager_, &callback);
    return ret;
}

Camera_ErrorCode NDKCamera::GetCameraFormat(int index)
{
    Camera_Profile profile;
    profile.size.height = 0;
    profile.size.width = 0;

    if (index == CAMERA_FORMAT_RGBA_8888) {
        profile.format = CAMERA_FORMAT_RGBA_8888;
    } else if (index == CAMERA_FORMAT_YCBCR_P010) {
        profile.format = CAMERA_FORMAT_YCBCR_P010;
    } else if (index == CAMERA_FORMAT_YCRCB_P010) {
        profile.format = CAMERA_FORMAT_YCRCB_P010;
    }
    
    Camera_ErrorCode ret_ = GetSupportedCameras();
    Camera_OutputCapability* cameraOutputCapability_;
    ret_ = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &cameraOutputCapability_);
    
    for (decltype(cameraOutputCapability_->previewProfilesSize) i = 0; i < cameraOutputCapability_->previewProfilesSize;
         i++) {
        if (cameraOutputCapability_->previewProfiles[i]->size.width == profile.size.width &&
            cameraOutputCapability_->previewProfiles[i]->size.height == profile.size.height) {
            profile.format = cameraOutputCapability_->previewProfiles[i]->format;
            break;
        }
    }

    return ret_;
}

Camera_ErrorCode NDKCamera::HasFlashMode(int index)
{
    Camera_FlashMode flashMode;
    if (index = FLASH_MODE_CLOSE) {
        flashMode = FLASH_MODE_CLOSE;
    } else if (index = FLASH_MODE_OPEN) {
        flashMode = FLASH_MODE_OPEN;
    } else if (index = FLASH_MODE_AUTO) {
        flashMode = FLASH_MODE_AUTO;
    } else if (index = FLASH_MODE_ALWAYS_OPEN) {
        flashMode = FLASH_MODE_ALWAYS_OPEN;
    }
    
    Camera_CaptureSession* captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    if (ret != CAMERA_OK) {
        return ret;
    }

    bool hasFlash = false;
    ret = OH_CaptureSession_HasFlash(captureSession_, &hasFlash);
    if (ret != CAMERA_OK) {
        return ret;
    }

    if (!hasFlash) {
        return CAMERA_OK;
    }

    bool isSupported = false;
    ret = OH_CaptureSession_IsFlashModeSupported(captureSession_, flashMode, &isSupported);
    return ret;
}
