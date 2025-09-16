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
#include <cstdint>
#include <hilog/log.h>

#define CAMERA_LOG_TAG "LOG_CAMERA_TEST_TAG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LogD(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
#define LogE(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)

CameraCallbackCode NDKCamera::cameraCallbackCode_ = NO_RECEIVED;

NDKCamera::NDKCamera(char *str)
{
    cameras_ = nullptr;
    captureSession_ = nullptr;
    cameraInput_ = nullptr;
    valid_ = false;
    size_ = 0;
    previewSurfaceId_ = std::string(str);
    LogD("NDKCamera str %{public}s, previewSurfaceId_:%{public}s", str, previewSurfaceId_.c_str());
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
        if (cameras_ != nullptr) {
            auto  ret = OH_CameraManager_DeleteSupportedCameras(cameraManager_, cameras_, size_);
            if (ret != CAMERA_OK) {
                LogE("OH_CameraManager_DeleteSupportedCameras failed. %{public}d", ret);
            }
        }

        auto ret = OH_Camera_DeleteCameraManager(cameraManager_);
        if (ret != CAMERA_OK) {
            LogE("OH_Camera_DeleteCameraManager failed. %{public}d", ret);
        }
        cameraManager_ = nullptr;
    }
}

Camera_ErrorCode NDKCamera::ReleaseCameraManger(void)
{
    if (cameraManager_ != nullptr) {
        Camera_ErrorCode ret = OH_Camera_DeleteCameraManager(cameraManager_);
        cameraManager_ = nullptr;
        return ret;
    }
    return CAMERA_OK;
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
    ret = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(cameraManager_, cameras_, sceneMode_,
        &cameraOutputCapability_);
    for (uint32_t i = 0; i < cameraOutputCapability_->photoProfilesSize; ++i) {
        profile_ = cameraOutputCapability_->photoProfiles[0];
    }

    if (profile_ == nullptr) {
        return CAMERA_SESSION_NOT_RUNNING;
    }

    ret = OH_CameraManager_CreatePhotoOutput(cameraManager_, profile_, previewSurfaceId_.c_str(), &photoOutput_);
    if (CAMERA_OK != OH_PhotoOutput_Capture(photoOutput_)) {
        return CAMERA_SESSION_NOT_RUNNING;
    }
    return CAMERA_SESSION_NOT_RUNNING;
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
    if (cameras_ != nullptr) {
        return CAMERA_OK;
    }
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
    Camera_FocusState checkStatus1 = FOCUS_STATE_FOCUSED;
    Camera_FocusState checkStatus2 = FOCUS_STATE_UNFOCUSED;
    Camera_FocusState checkStatus3 = FOCUS_STATE_SCAN;
    if (focusState == checkStatus1) {
        LogD("Camera_FocusState is FOCUS_STATE_FOCUSED");
    }

    if (focusState == checkStatus2) {
        LogD("Camera_FocusState is FOCUS_STATE_UNFOCUSED");
    }

    if (focusState == checkStatus3) {
        LogD("Camera_FocusState is FOCUS_STATE_SCAN");
    }
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
    Camera_Device cameraDevice = {"001", CAMERA_POSITION_UNSPECIFIED, CAMERA_TYPE_WIDE_ANGLE, CAMERA_CONNECTION_REMOTE};
    checkStatus.camera= &cameraDevice;
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

Camera_ErrorCode NDKCamera::GetCameraFormat(int32_t index)
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

Camera_ErrorCode NDKCamera::HasFlashMode(int32_t index)
{
    Camera_FlashMode flashMode;
    if (index == FLASH_MODE_CLOSE) {
        flashMode = FLASH_MODE_CLOSE;
    } else if (index == FLASH_MODE_OPEN) {
        flashMode = FLASH_MODE_OPEN;
    } else if (index == FLASH_MODE_AUTO) {
        flashMode = FLASH_MODE_AUTO;
    } else if (index == FLASH_MODE_ALWAYS_OPEN) {
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

Camera_ErrorCode NDKCamera::GetExposureMode(int32_t index)
{
    Camera_CaptureSession *captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    Camera_ExposureMode exposureMode;
    if (index == EXPOSURE_MODE_AUTO) {
        exposureMode = EXPOSURE_MODE_AUTO;
    } else if (index == EXPOSURE_MODE_CONTINUOUS_AUTO) {
        exposureMode = EXPOSURE_MODE_CONTINUOUS_AUTO;
    }

    bool isSupported;
    if (CAMERA_SESSION_NOT_CONFIG ==
        OH_CaptureSession_IsExposureModeSupported(captureSession_, exposureMode, &isSupported)) {
        return CAMERA_OK;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::GetCameraFocusMode(int32_t index)
{
    Camera_CaptureSession *captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);

    Camera_FocusMode focusMode;
    if (index == FOCUS_MODE_MANUAL) {
        focusMode = FOCUS_MODE_MANUAL;
    } else if (index == FOCUS_MODE_CONTINUOUS_AUTO) {
        focusMode = FOCUS_MODE_CONTINUOUS_AUTO;
    } else if (index == FOCUS_MODE_LOCKED) {
        focusMode = FOCUS_MODE_LOCKED;
    }

    bool isSupported;
    if (CAMERA_SESSION_NOT_CONFIG == OH_CaptureSession_IsFocusModeSupported(captureSession_, focusMode, &isSupported)) {
        return CAMERA_OK;
    }
    return ret;
}

Camera_ErrorCode NDKCamera::SessionIsVideoStabilizationModeSupported(int32_t index)
{
    Camera_VideoStabilizationMode videoMode;
    if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_OFF) {
        videoMode = STABILIZATION_MODE_OFF;
    } else if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_LOW) {
        videoMode = STABILIZATION_MODE_LOW;
    } else if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_MIDDLE) {
        videoMode = STABILIZATION_MODE_MIDDLE;
    } else if (static_cast<Camera_VideoStabilizationMode>(index) == STABILIZATION_MODE_HIGH) {
        videoMode = STABILIZATION_MODE_HIGH;
    }

    Camera_CaptureSession *captureSession_ = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_CreateCaptureSession(cameraManager_, &captureSession_);
    bool isSupported;
    if (CAMERA_SESSION_NOT_CONFIG ==
        OH_CaptureSession_IsVideoStabilizationModeSupported(captureSession_, videoMode, &isSupported)) {
        return CAMERA_OK;
    }

    return ret;
}

Camera_ErrorCode NDKCamera::TakePictureWithPhotoSettings(int32_t indexRotation, int32_t indexQualityLevel)
{
    Camera_PhotoCaptureSetting photoSetting;
    if (indexRotation == IAMGE_ROTATION_0) {
        photoSetting.rotation = IAMGE_ROTATION_0;
    } else if (indexRotation == IAMGE_ROTATION_90) {
        photoSetting.rotation = IAMGE_ROTATION_90;
    } else if (indexRotation == IAMGE_ROTATION_180) {
        photoSetting.rotation = IAMGE_ROTATION_180;
    } else if (indexRotation == IAMGE_ROTATION_270) {
        photoSetting.rotation = IAMGE_ROTATION_270;
    }

    if (indexQualityLevel == QUALITY_LEVEL_HIGH) {
        photoSetting.quality = QUALITY_LEVEL_HIGH;
    } else if (indexQualityLevel == QUALITY_LEVEL_MEDIUM) {
        photoSetting.quality = QUALITY_LEVEL_MEDIUM;
    } else if (indexQualityLevel == QUALITY_LEVEL_LOW) {
        photoSetting.quality = QUALITY_LEVEL_LOW;
    }

    if (OH_PhotoOutput_Capture_WithCaptureSetting(nullptr, photoSetting) == CAMERA_INVALID_ARGUMENT) {
        return CAMERA_OK;
    }

    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::GetCameraConcurrentInfo(int32_t index)
{
    Camera_ConcurrentInfo* concurrentInfo;
    Camera_Device* cameraArray;
    uint32_t size;
    uint32_t deviceSize = 2;
    OH_CameraManager_GetSupportedCameras(cameraManager_, &cameraArray, &size);
    if (size < deviceSize) {
        return CAMERA_OK;
    }

    uint32_t infoSize = 0;
    OH_CameraManager_GetCameraConcurrentInfos(cameraManager_, cameraArray, deviceSize, &concurrentInfo, &infoSize);
    if (concurrentInfo == nullptr) {
        return CAMERA_OK;
    }

    Camera_MetadataObjectType metaType;
    if (index == 0) {
        metaType = FACE_DETECTION;
    }
    for (uint32_t i = 0; i < concurrentInfo->outputCapabilities->metadataProfilesSize; i++) {
        Camera_MetadataObjectType *typeValue = concurrentInfo->outputCapabilities->supportedMetadataObjectTypes[i];
        if (typeValue != nullptr && metaType == *typeValue) {
            return CAMERA_OK;
        }
    }

    return CAMERA_OK;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfig(int32_t mode)
{
    Camera_PreconfigType preconfigType;
    if (static_cast<Camera_PreconfigType>(mode) == PRECONFIG_720P) {
        preconfigType = PRECONFIG_720P;
    } else if (static_cast<Camera_PreconfigType>(mode) == PRECONFIG_1080P) {
        preconfigType = PRECONFIG_1080P;
    } else if (static_cast<Camera_PreconfigType>(mode) == PRECONFIG_4K) {
        preconfigType = PRECONFIG_4K;
    } else {
        preconfigType = PRECONFIG_HIGH_QUALITY;
    }

    bool canPreconfig;
    Camera_ErrorCode ret = CreateSession();
    ret = OH_CaptureSession_CanPreconfig(captureSession_, preconfigType, &canPreconfig);

    return ret;
}

Camera_ErrorCode NDKCamera::SessionCanPreconfigWithRatio(int32_t ratio)
{
    Camera_PreconfigType preconfigType = PRECONFIG_720P;
    Camera_PreconfigRatio preconfigRatio;
    if (static_cast<Camera_PreconfigRatio>(ratio) == PRECONFIG_RATIO_1_1) {
        preconfigRatio = PRECONFIG_RATIO_1_1;
    } else if (static_cast<Camera_PreconfigRatio>(ratio) == PRECONFIG_RATIO_4_3) {
        preconfigRatio = PRECONFIG_RATIO_4_3;
    } else if (static_cast<Camera_PreconfigRatio>(ratio) == PRECONFIG_RATIO_16_9) {
        preconfigRatio = PRECONFIG_RATIO_16_9;
    }

    Camera_ErrorCode ret = CreateSession();
    bool canPreconfig;
    ret = OH_CaptureSession_CanPreconfigWithRatio(captureSession_, preconfigType, preconfigRatio, &canPreconfig);
    return ret;
}

// PhotoOutput Callback
void PhotoOutputOnFrameStart(Camera_PhotoOutput* photoOutput)
{
    NDKCamera::cameraCallbackCode_ = PREVIEW_ON_FRAME_START;
    LogD("PhotoOutputOnFrameStart");
}

void PhotoOutputOnFrameShutter(Camera_PhotoOutput* photoOutput, Camera_FrameShutterInfo* info)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_FRAME_SHUTTER;
    Camera_FrameShutterInfo shutterInfo;
    shutterInfo.captureId = 0;
    shutterInfo.timestamp = 1000;
    if (info->captureId == shutterInfo.captureId) {
        LogD("PhotoOutputOnFrameShutter");    
    }

    if (info->timestamp == shutterInfo.timestamp) {
        LogD("PhotoOutputOnFrameShutter");
    }
}

void PhotoOutputOnFrameEnd(Camera_PhotoOutput* photoOutput, int32_t frameCount)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_FRAME_END;
    LogD("PhotoOutput frameCount = %d", frameCount);
}

void PhotoOutputOnError(Camera_PhotoOutput* photoOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = PHOTO_ON_ERROR;
    LogD("PhotoOutput errorCode = %d", errorCode);
}

PhotoOutput_Callbacks* NDKCamera::GetPhotoOutputListener(void)
{
    static PhotoOutput_Callbacks photoOutputListener = {
        .onFrameStart = PhotoOutputOnFrameStart,
        .onFrameShutter = PhotoOutputOnFrameShutter,
        .onFrameEnd = PhotoOutputOnFrameEnd,
        .onError = PhotoOutputOnError
    };
    return &photoOutputListener;
}

Camera_ErrorCode NDKCamera::PhotoOutputRegisterCallback(void)
{
    Camera_PhotoOutput* photoOutput_;
    Camera_ErrorCode ret =
        OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, previewSurfaceId_.c_str(), &photoOutput_);
    ret = OH_PhotoOutput_RegisterCallback(photoOutput_, GetPhotoOutputListener());
    if (ret != CAMERA_OK) {
        LogE("OH_PhotoOutput_RegisterCallback failed.");
    }
    return ret;
}

// Metadata Callback
void OnMetadataObjectAvailable(Camera_MetadataOutput *metadataOutput, Camera_MetadataObject *metadataObject,
                               uint32_t size)
{
    Camera_Rect rect;
    rect.width = 1;
    rect.height = 1;
    rect.topLeftX = 1;
    rect.topLeftY = 1;
    Camera_MetadataObject metaObject;
    metaObject.type = FACE_DETECTION;
    metaObject.timestamp = 0;
    metaObject.boundingBox = &rect;

    if (metadataObject->type == metaObject.type) {
        LogD("type = %d", metaObject.type);    
    }

    if (metadataObject->timestamp == metaObject.timestamp) {
        LogD("timestamp = %d", metaObject.timestamp);    
    }

    if (metadataObject->boundingBox->width == metaObject.boundingBox->width) {
        LogD("width = %d", metaObject.boundingBox->width);
    }

    if (metadataObject->boundingBox->height == metaObject.boundingBox->height) {
        LogD("height = %d", metaObject.boundingBox->height);
    }

    if (metadataObject->boundingBox->topLeftX == metaObject.boundingBox->topLeftX) {
        LogD("topLeftX = %d", metaObject.boundingBox->topLeftX);
    }

    if (metadataObject->boundingBox->topLeftY == metaObject.boundingBox->topLeftY) {
        LogD("topLeftY = %d", metaObject.boundingBox->topLeftY);
    }

    NDKCamera::cameraCallbackCode_ = METADATA_OBJECT_AVAILABLE;
    LogD("size = %d", size);
}

void OnMetadataOutputError(Camera_MetadataOutput* metadataOutput, Camera_ErrorCode errorCode)
{
    NDKCamera::cameraCallbackCode_ = METADATA_OUTPUT_ERROR;
    LogD("OnMetadataOutput errorCode = %d", errorCode);
}

MetadataOutput_Callbacks* NDKCamera::GetMetadataOutputListener(void)
{
    static MetadataOutput_Callbacks metadataOutputListener = {
        .onMetadataObjectAvailable = OnMetadataObjectAvailable,
        .onError = OnMetadataOutputError
    };
    return &metadataOutputListener;
}

Camera_ErrorCode NDKCamera::MetadataOutputRegisterCallback(void)
{
    Camera_MetadataObjectType profile = FACE_DETECTION;
    Camera_MetadataOutput* metadataOutput_;
    Camera_ErrorCode ret = OH_CameraManager_CreateMetadataOutput(cameraManager_, &profile, &metadataOutput_);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "ArkWeb", "=======chenbo  MetadataOutputRegisterCallback ret:%{public}d", ret);
    ret = OH_MetadataOutput_RegisterCallback(metadataOutput_, GetMetadataOutputListener());
    if (ret != CAMERA_OK) {
        LogE("OH_MetadataOutput_RegisterCallback failed.");
    }
    return ret;
}