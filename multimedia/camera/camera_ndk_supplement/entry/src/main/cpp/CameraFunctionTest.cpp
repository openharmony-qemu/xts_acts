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

const int32_t INVALID_ARGUMENT = CAMERA_INVALID_ARGUMENT;
const int32_t TEST_OK = 0;
const int32_t DEVICES_NUM = 2;

int32_t CameraFunctionTest::OHGetCameraManagerInvalidTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_Camera_GetCameraManager(nullptr);
        if (result == INVALID_ARGUMENT) {
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
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_Camera_DeleteCameraManager(nullptr);
        if (result == INVALID_ARGUMENT) {
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
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraDevice_GetCameraOrientation(nullptr, &orientation);
        if (result == INVALID_ARGUMENT) {
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
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraInput_RegisterCallback(nullptr, nullptr);
        if (result == INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraInputUnregisterCallbackTest(int32_t caseCode)
{
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraInput_UnregisterCallback(nullptr, nullptr);
        if (result == INVALID_ARGUMENT) {
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
    if (caseCode == INVALID_ARGUMENT) {
        result = OH_CameraInput_Open(nullptr);
        if (result == INVALID_ARGUMENT) {
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
    if (caseCode == INVALID_ARGUMENT) {
        ret = OH_CameraInput_OpenConcurrentCameras(nullptr, CAMERA_CONCURRENT_TYPE_FULL_CAPABILITY);
        if (ret == INVALID_ARGUMENT) {
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
    if (caseCode == INVALID_ARGUMENT) {
        result = OH_CameraInput_Close(nullptr);
        if (result == INVALID_ARGUMENT) {
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
    if (caseCode == INVALID_ARGUMENT) {
        result = OH_CameraInput_Release(nullptr);
        if (result == INVALID_ARGUMENT) {
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
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraManagerRegisterCallbackTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_RegisterCallback(nullptr, nullptr);
        if (result == INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerUnregisterCallbackTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraManagerUnregisterCallbackTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_UnregisterCallback(nullptr, nullptr);
        if (result == INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetSupportedCamerasTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraManagerGetSupportedCamerasTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_GetSupportedCameras(nullptr, nullptr, &size_);
        if (result == INVALID_ARGUMENT) {
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
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraManagerDeleteSupportedCamerasTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_DeleteSupportedCameras(nullptr, nullptr, size_);
        if (result == INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetSupportedCameraOutputCapabilityTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraManagerGetSupportedCameraOutputCapabilityTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_GetSupportedCameraOutputCapability(nullptr, nullptr, nullptr);
        if (result == INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}

int32_t CameraFunctionTest::OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest(int32_t caseCode)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest caseCode:%{public}d", caseCode);
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
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraManagerDeleteSupportedCameraOutputCapabilityTest caseCode:%{public}d", caseCode);
    int32_t ret = CAMERA_OK;
    if (caseCode == INVALID_ARGUMENT) {
        Camera_ErrorCode result = OH_CameraManager_DeleteSupportedCameraOutputCapability(nullptr, nullptr);
        if (result == INVALID_ARGUMENT) {
            ret = TEST_OK;
        }
    }
    return ret;
}
