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

#include "CameraFunctionTest.h"
#include <hilog/log.h>
#include "native_common.h"

const int32_t TEST_OK = 0;
const int32_t DEVICES_NUM = 2;
const int32_t DEVICES_MIN_NUM = 2;

Camera_ErrorCode CameraFunctionTest::CreateVideoOutput(void)
{
    Camera_OutputCapability* outputCap = nullptr;
    Camera_ErrorCode ret = OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &outputCap);
    if (ret != CAMERA_OK) {
        LogE("=======chenbo CreateVideoOutputCapability failed... %{public}d", ret);
        return ret;
    }
    if (outputCap->videoProfilesSize <= 0) {
        return ret;
    }
    auto profile_ = outputCap->videoProfiles[0];
    ret = OH_CameraManager_CreateVideoOutput(cameraManager_, profile_, videoId_.c_str(), &videoOutput_);
    return ret;
}

Camera_ErrorCode CameraFunctionTest::ReleaseVideoOutput(void)
{
    if (videoOutput_ == nullptr) {
        return CAMERA_OK;
    }
    Camera_ErrorCode ret = OH_VideoOutput_Release(videoOutput_);
    if (ret != CAMERA_OK) {
        LogE("ndkXTS OH_VideoOutput_Release failed.");
    }
    videoOutput_ = nullptr;
    return ret;
}

int32_t CameraFunctionTest::OHGetCameraManagerInvalidTest(int32_t caseCode) {
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_Camera_GetCameraManager(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_Manager* cameraManger;
        Camera_ErrorCode result = OH_Camera_GetCameraManager(&cameraManger);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraDeleteCameraManagerTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_Camera_DeleteCameraManager(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_Manager* cameraManger;
        OH_Camera_GetCameraManager(&cameraManger);
        Camera_ErrorCode result = OH_Camera_DeleteCameraManager(cameraManger);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraDeviceGetCameraOrientationTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    uint32_t orientation;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraDevice_GetCameraOrientation(nullptr, &orientation);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OK) {
        Camera_Manager* cameraManger;
        OH_Camera_GetCameraManager(&cameraManger);
        Camera_ErrorCode result = OH_CameraDevice_GetCameraOrientation(cameras_, &orientation);
        if (result == CAMERA_OK) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraDeviceGetHostDeviceNameTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_OK) {
        char* deviceName;
        Camera_ErrorCode result = OH_CameraDevice_GetHostDeviceName(cameras_, &deviceName);
        if (result == CAMERA_OK) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_ErrorCode result = OH_CameraDevice_GetHostDeviceName(cameras_, nullptr);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraDeviceGetHostDeviceTypeTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_OK) {
        Camera_HostDeviceType* deviceType;
        Camera_ErrorCode result = OH_CameraDevice_GetHostDeviceType(cameras_, deviceType);
        if (result == CAMERA_OK) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_ErrorCode result = OH_CameraDevice_GetHostDeviceType(cameras_, nullptr);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputRegisterCallbackTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraInput_RegisterCallback(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputUnregisterCallbackTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraInput_UnregisterCallback(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputOpenTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (CreateCameraInput() != CAMERA_OK) {
        return ret;
    }
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraInput_Open(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        result = OH_CameraInput_Open(cameraInput_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_DEVICE_DISABLED) {
        result = OH_CameraInput_Close(cameraInput_);
        result = OH_CameraInput_Open(cameraInput_);
        if (result == CAMERA_DEVICE_DISABLED) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_CONFLICT_CAMERA) {
        result = OH_CameraInput_Open(cameraInput_);
        result = OH_CameraInput_Open(cameraInput_);
        if (result == CAMERA_CONFLICT_CAMERA) {
            ret = TEST_OK;
        }
    }
    CloseCameraInput();
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputOpenSecureCameraTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (CreateCameraInput() != CAMERA_OK) {
        return ret;
    }
    Camera_ErrorCode result;
    uint64_t value = std::stoull(previewSurfaceId_);
    uint64_t* secureSeqId = &value;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        result = OH_CameraInput_OpenSecureCamera(cameraInput_, secureSeqId);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_DEVICE_DISABLED) {
        result = OH_CameraInput_OpenSecureCamera(nullptr, secureSeqId);
        if (result == CAMERA_DEVICE_DISABLED) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_CONFLICT_CAMERA) {
        result = OH_CameraInput_OpenSecureCamera(cameraInput_, secureSeqId);
        result = OH_CameraInput_OpenSecureCamera(cameraInput_, secureSeqId);
        if (result == CAMERA_CONFLICT_CAMERA) {
            ret = TEST_OK;
        }
    }
    CloseCameraInput();
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputOpenConcurrentCamerasTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        ret = OH_CameraInput_OpenConcurrentCameras(nullptr, CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY);
        if (ret == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    }

    if (size_ < DEVICES_NUM || cameraManager_ == nullptr) {
        return ret;
    }
    if (CreateCameraInput() != CAMERA_OK) {
        return ret;
    }
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        result = OH_CameraInput_OpenConcurrentCameras(cameraInput_, CAMERA_CONCURRENT_TYPE_LIMITED_CAPABILITY);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_DEVICE_DISABLED) {
        Camera_ConcurrentType type;
        result = OH_CameraInput_OpenConcurrentCameras(cameraInput_, type);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_CONFLICT_CAMERA) {
        OH_CameraInput_OpenConcurrentCameras(cameraInput_, CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY);
        result = OH_CameraInput_OpenConcurrentCameras(cameraInput_, CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    CloseCameraInput();
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputCloseTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraInput_Close(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    }

    if (CreateCameraInput() != CAMERA_OK) {
        return ret;
    }
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        result = OH_CameraInput_Close(cameraInput_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputReleaseTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraInput_Release(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    }

    if (CreateCameraInput() != CAMERA_OK) {
        return ret;
    }
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        result = OH_CameraInput_Release(cameraInput_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerRegisterCallbackTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_RegisterCallback(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerUnregisterCallbackTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_UnregisterCallback(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetSupportedCamerasTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_GetSupportedCameras(nullptr, nullptr, &size_);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OK) {
        Camera_ErrorCode result = OH_CameraManager_GetSupportedCameras(cameraManager_, &cameras_, &size_);
        if (result == CAMERA_OK) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerDeleteSupportedCamerasTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_DeleteSupportedCameras(nullptr, nullptr, size_);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetSupportedCameraOutputCapabilityTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_GetSupportedCameraOutputCapability(nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_ErrorCode result = OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode(
            cameraManager_, cameras_, NORMAL_PHOTO, nullptr);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerDeleteSupportedCameraOutputCapabilityTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_DeleteSupportedCameraOutputCapability(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerIsCameraMutedTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    bool isCameraMuted = false;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_IsCameraMuted(nullptr, &isCameraMuted);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OK) {
        Camera_ErrorCode result = OH_CameraManager_IsCameraMuted(cameraManager_, &isCameraMuted);
        if (result == CAMERA_OK) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreateCaptureSessionTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_CreateCaptureSession(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_CaptureSession *session = nullptr;
        Camera_ErrorCode result = OH_CameraManager_CreateCaptureSession(cameraManager_, &session);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreateCameraInputTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_Input* input = nullptr;
        Camera_ErrorCode result = OH_CameraManager_CreateCameraInput(cameraManager_, cameras_, &input);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreateCameraInputWithPositionAndTypeTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_CreateCameraInput_WithPositionAndType(nullptr, CAMERA_POSITION_BACK,
                                                                                         CAMERA_TYPE_DEFAULT, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreatePreviewOutputTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_CreatePreviewOutput(nullptr, nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_OutputCapability *output = nullptr;
        if (CAMERA_OK == OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &output)) {
            Camera_Profile *profile = output->previewProfiles[0];
            Camera_PreviewOutput *previewOutput = nullptr;
            Camera_ErrorCode result = OH_CameraManager_CreatePreviewOutput(cameraManager_, profile,
                                                                           previewSurfaceId_.c_str(), &previewOutput);
            if (result == CAMERA_SERVICE_FATAL_ERROR) {
                ret = TEST_OK;
            }
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreatePreviewOutputUsedInPreconfigTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_PreviewOutput *previewOutput = nullptr;
        Camera_ErrorCode result = OH_CameraManager_CreatePreviewOutputUsedInPreconfig(
            cameraManager_, previewSurfaceId_.c_str(), &previewOutput);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreatePhotoOutputTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_CreatePhotoOutput(nullptr, nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_OutputCapability* output = nullptr;
        if (CAMERA_OK == OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &output)) {
            Camera_Profile *profile = output->previewProfiles[0];
            Camera_PhotoOutput *output = nullptr;
            Camera_ErrorCode result =
                OH_CameraManager_CreatePhotoOutput(cameraManager_, profile, previewSurfaceId_.c_str(), &output);
            if (result == CAMERA_SERVICE_FATAL_ERROR) {
                ret = TEST_OK;
            }
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreatePhotoOutputUsedInPreconfigTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_PhotoOutput* photoOutput = nullptr;
        Camera_ErrorCode result = OH_CameraManager_CreatePhotoOutputUsedInPreconfig(cameraManager_, "1", &photoOutput);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreatePhotoOutputWithoutSurfaceTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraManager_CreatePhotoOutputWithoutSurface(nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else {
        Camera_OutputCapability* output = nullptr;
        Camera_PhotoOutput* photoOutput = nullptr;
        if (OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &output) != CAMERA_OK) {
            return ret;
        }
        if (output->photoProfilesSize <= 0) {
            return ret;
        }
        Camera_Profile *profile = output->photoProfiles[0];
        if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
            result = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, profile, &photoOutput);
            if (result == CAMERA_OK) {
                ret = TEST_OK;
            }
        } else if (caseCode == CAMERA_OK) {
            result = OH_CameraManager_CreatePhotoOutputWithoutSurface(cameraManager_, profile, &photoOutput);
            if (result == CAMERA_OK) {
                ret = TEST_OK;
            }
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreateVideoOutputTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraManager_CreateVideoOutput(nullptr, nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    }

    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_OutputCapability *output = nullptr;
        if (OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &output) != CAMERA_OK) {
            return ret;
        }

        int index = 0;
        if (output->videoProfilesSize <= index) {
            return ret;
        }
        Camera_VideoOutput *videoOut = nullptr;
        auto testProfile = output->videoProfiles[0];
        result = OH_CameraManager_CreateVideoOutput(cameraManager_, testProfile, previewSurfaceId_.c_str(), &videoOut);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreateVideoOutputUsedInPreconfigTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_VideoOutput* output = nullptr;
        result = OH_CameraManager_CreateVideoOutputUsedInPreconfig(cameraManager_, previewSurfaceId_.c_str(), &output);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerCreateMetadataOutputTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraManager_CreateMetadataOutput(nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else {
        Camera_OutputCapability *output = nullptr;
        Camera_MetadataOutput *metadataOutput = nullptr;
        if (OH_CameraManager_GetSupportedCameraOutputCapability(cameraManager_, cameras_, &output) != CAMERA_OK) {
            return ret;
        }
        if (output->metadataProfilesSize <= 0) {
            return ret;
        }
        const Camera_MetadataObjectType* metaType = output->supportedMetadataObjectTypes[0];
        if (metaType == nullptr) {
            return ret;
        }
        if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
            result = OH_CameraManager_CreateMetadataOutput(cameraManager_, metaType, &metadataOutput);
            if (result == CAMERA_SERVICE_FATAL_ERROR) {
                ret = TEST_OK;
            }
        } else if (caseCode == CAMERA_OK) {
            result = OH_CameraManager_CreateMetadataOutput(cameraManager_, metaType, &metadataOutput);
            if (result == CAMERA_OK) {
                ret = TEST_OK;
            }
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetSupportedSceneModesTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        Camera_SceneMode *sceneModes = nullptr;
        uint32_t size = 0;
        result = OH_CameraManager_GetSupportedSceneModes(cameras_, &sceneModes, &size);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraManager_GetSupportedSceneModes(nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerIsTorchSupportedByTorchModeTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        bool isTorchSupported = false;
        result = OH_CameraManager_IsTorchSupportedByTorchMode(nullptr, AUTO, &isTorchSupported);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerSetTorchModeTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        result = OH_CameraManager_SetTorchMode(cameraManager_, AUTO);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetCameraDeviceTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        result = OH_CameraManager_GetCameraDevice(cameraManager_, CAMERA_POSITION_UNSPECIFIED, CAMERA_TYPE_TRUE_DEPTH,
                                                  cameras_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraManager_GetCameraDevice(nullptr, CAMERA_POSITION_UNSPECIFIED, CAMERA_TYPE_DEFAULT, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetCameraConcurrentInfosTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CameraManager_GetCameraConcurrentInfos(nullptr, nullptr, 0, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else {
        uint32_t deviceSize = DEVICES_NUM;
        if (size_ < deviceSize) {
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "Concurrent Camera devices < 2");
            return ret;
        }
        Camera_ConcurrentInfo* info = nullptr;
        uint32_t infoSize = 0;
        if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
            deviceSize = DEVICES_MIN_NUM;
            result = OH_CameraManager_GetCameraConcurrentInfos(cameraManager_, cameras_, deviceSize, &info, &infoSize);
            if (result == CAMERA_SERVICE_FATAL_ERROR) {
                ret = TEST_OK;
            }
        } else if (caseCode == CAMERA_OK) {
            result = OH_CameraManager_GetCameraConcurrentInfos(cameraManager_, cameras_, deviceSize, &info, &infoSize);
            if (result == CAMERA_OK) {
                ret = TEST_OK;
            }
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionSetSessionModeTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetSessionModeTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SESSION_CONFIG_LOCKED) {
        // todo  没有这个错误码 OH_CaptureSession_SetSessionMode
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        result = OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_SetSessionMode(captureSession_, SECURE_PHOTO);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetSessionModeTest result:%{public}d", result);
        if (result == CAMERA_OPERATION_NOT_ALLOWED) {
            return TEST_OK;
        }
        ReleaseCaptureSession();
    }
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionAddSecureOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddSecureOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_SESSION_CONFIG_LOCKED) {
        // todo  没有这个错误码 OH_CaptureSession_AddSecureOutput
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddSecureOutputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionBeginConfigTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionBeginConfigTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CaptureSession_BeginConfig(nullptr);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionBeginConfigTest result:%{public}d", result);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionCommitConfigTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionCommitConfigTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_CommitConfig(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        CreateCaptureSession();
        result = OH_CaptureSession_CommitConfig(captureSession_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionCommitConfigTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionAddInputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddInputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_AddInput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        CreateCameraInput();
        result = OH_CaptureSession_AddInput(captureSession_, cameraInput_);
        if (result == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddInputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionRemoveInputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddInputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_RemoveInput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        CreateCameraInput();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_RemoveInput(captureSession_, cameraInput_);
        if (result == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddInputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionAddPreviewOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddPreviewOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CaptureSession_AddPreviewOutput(nullptr, nullptr);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddPreviewOutputTest result:%{public}d", result);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionRemovePreviewOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemovePreviewOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CaptureSession_RemovePreviewOutput(nullptr, nullptr);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemovePreviewOutputTest result:%{public}d", result);
        if (result == CAMERA_INVALID_ARGUMENT) {
            return TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionAddPhotoOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddPhotoOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_AddPhotoOutput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        CreatePhotoOutput();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_AddPhotoOutput(captureSession_, photoOutput_);
        if (result == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = TEST_OK;
        }
        ReleasePhotoOutput();
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddPhotoOutputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionRemovePhotoOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemovePhotoOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_RemovePhotoOutput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        CreatePhotoOutput();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_RemovePhotoOutput(captureSession_, photoOutput_);
        if (result == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = TEST_OK;
        }
        ReleasePhotoOutput();
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemovePhotoOutputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionAddVideoOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddVideoOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_AddVideoOutput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        CreateVideoOutput();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_AddVideoOutput(captureSession_, videoOutput_);
        if (result == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
        ReleaseVideoOutput();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddVideoOutputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionRemoveVideoOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemoveVideoOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_RemoveVideoOutput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        CreateVideoOutput();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_RemoveVideoOutput(captureSession_, videoOutput_);
        if (result == CAMERA_OPERATION_NOT_ALLOWED) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
        ReleaseVideoOutput();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemoveVideoOutputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionAddMetadataOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddMetadataOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_AddMetadataOutput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  0000");
        result = CreatePhotoOutput();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  11111 result:%{public}d", result);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  11111 outputCap_->metadataProfilesSize:%{public}d", outputCap_->metadataProfilesSize);
        if (outputCap_->metadataProfilesSize > 0) {
            Camera_MetadataOutput* metaOutput = nullptr;
            OH_CameraManager_CreateMetadataOutput(cameraManager_, outputCap_->supportedMetadataObjectTypes[0],
                                                  &metaOutput);
            result = OH_CaptureSession_AddMetadataOutput(captureSession_, metaOutput);
            if(result == CAMERA_OPERATION_NOT_ALLOWED) {
                ret = TEST_OK;
            }
        }
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  22222");
        ReleaseCaptureSession();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  33333");
        ReleasePhotoOutput();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionAddMetadataOutputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionRemoveMetadataOutputTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemoveMetadataOutputTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_RemoveMetadataOutput(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_OPERATION_NOT_ALLOWED) {
        CreateCaptureSession();
        result = CreatePhotoOutput();
        if (outputCap_->metadataProfilesSize > 0) {
            Camera_MetadataOutput* metaOutput = nullptr;
            OH_CameraManager_CreateMetadataOutput(cameraManager_, outputCap_->supportedMetadataObjectTypes[0],
                                                  &metaOutput);
            result = OH_CaptureSession_RemoveMetadataOutput(captureSession_, metaOutput);
            if(result == CAMERA_OPERATION_NOT_ALLOWED) {
                ret = TEST_OK;
            }
        }
        ReleaseCaptureSession();
        ReleasePhotoOutput();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionRemoveMetadataOutputTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionStartTestTest(int32_t caseCode) 
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionStartTestTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_Start(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        CreateCaptureSession();
        result = OH_CaptureSession_Start(captureSession_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionStartTestTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionStopTest(int32_t caseCode) 
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionStopTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_Stop(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        CreateCaptureSession();
        result = OH_CaptureSession_Stop(captureSession_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionStopTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionReleaseTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionReleaseTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_Release(nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SERVICE_FATAL_ERROR) {
        CreateCaptureSession();
        result = OH_CaptureSession_Release(captureSession_);
        if (result == CAMERA_SERVICE_FATAL_ERROR) {
            ret = TEST_OK;
        }
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionReleaseTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionHasFlashTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionHasFlashTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_HasFlash(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        bool hasFlash = false;
        result = CreateCaptureSession();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  1111 result:%{public}d", result);
        result = OH_CaptureSession_Start(captureSession_);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  2222 result:%{public}d", result);
        result = OH_CaptureSession_HasFlash(captureSession_, &hasFlash);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  333333 result:%{public}d", result);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionHasFlashTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionIsFlashModeSupportedTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionIsFlashModeSupportedTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_IsFlashModeSupported(nullptr, FLASH_MODE_CLOSE, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        CreateCaptureSession();
        bool isSupported = false;
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_IsFlashModeSupported(captureSession_, FLASH_MODE_CLOSE, &isSupported);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionIsFlashModeSupportedTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionGetFlashModeTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetFlashModeTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_GetFlashMode(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        Camera_FlashMode *flashMode = nullptr;
        CreateCaptureSession();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_GetFlashMode(captureSession_, flashMode);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetFlashModeTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionSetFlashModeTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetFlashModeTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_SetFlashMode(nullptr, FLASH_MODE_CLOSE);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        CreateCaptureSession();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_SetFlashMode(captureSession_, FLASH_MODE_CLOSE);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetFlashModeTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionIsExposureModeSupportedTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionIsExposureModeSupportedTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_IsExposureModeSupported(nullptr, EXPOSURE_MODE_LOCKED, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        bool isSupported = false;
        CreateCaptureSession();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_IsExposureModeSupported(captureSession_, EXPOSURE_MODE_LOCKED, &isSupported);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionIsExposureModeSupportedTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionGetExposureModeTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetExposureModeTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_GetExposureMode(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        Camera_ExposureMode exposureMode;
        CreateCaptureSession();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_GetExposureMode(captureSession_, &exposureMode);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetExposureModeTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionSetExposureModeTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetExposureModeTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_SetExposureMode(nullptr, EXPOSURE_MODE_LOCKED);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        CreateCaptureSession();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_SetExposureMode(captureSession_, EXPOSURE_MODE_LOCKED);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetExposureModeTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionGetMeteringPointTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetMeteringPointTest111 caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result = CAMERA_OK;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_GetMeteringPoint(nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        Camera_Point point = {0, 0};
        result = CreateCaptureSession();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  0000 result:%{public}d", result);
        result = OH_CaptureSession_Stop(captureSession_);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  1111 result:%{public}d", result);
        result = OH_CaptureSession_GetMeteringPoint(captureSession_, &point);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  2222 result:%{public}d", result);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetMeteringPointTest22 result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionSetMeteringPointTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetMeteringPointTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    Camera_Point point = {0, 0};
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_SetMeteringPoint(nullptr, point);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        result = CreateCaptureSession();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  0000 result:%{public}d", result);
        result = OH_CaptureSession_Start(captureSession_);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  1111 result:%{public}d", result);
        result = OH_CaptureSession_CommitConfig(captureSession_);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  xxxx result:%{public}d", result);
        result = OH_CaptureSession_SetMeteringPoint(captureSession_, point);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  3333 result:%{public}d", result);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        
        result = ReleaseCaptureSession();
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  4444 result:%{public}d", result);
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetMeteringPointTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionGetExposureBiasRangeTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetExposureBiasRangeTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_GetExposureBiasRange(nullptr, nullptr, nullptr, nullptr);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        float minExposureBias = 0;
        float maxExposureBias = 0;
        float step = 0;
        CreateCaptureSession();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_GetExposureBiasRange(captureSession_, &minExposureBias, &maxExposureBias, &step);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionGetExposureBiasRangeTest result:%{public}d", result);
    return ret;
}

int32_t CameraFunctionTest::OHCaptureSessionSetExposureBiasTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetExposureBiasTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    Camera_ErrorCode result;
    if (caseCode == CAMERA_INVALID_ARGUMENT) {
        result = OH_CaptureSession_SetExposureBias(nullptr, 0.0);
        if (result == CAMERA_INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    } else if (caseCode == CAMERA_SESSION_NOT_CONFIG) {
        CreateCaptureSession();
        OH_CaptureSession_Start(captureSession_);
        result = OH_CaptureSession_SetExposureBias(captureSession_, 0.0);
        if (result == CAMERA_SESSION_NOT_CONFIG) {
            ret = TEST_OK;
        }
        ReleaseCaptureSession();
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCaptureSessionSetExposureBiasTest result:%{public}d", result);
    return ret;
}
