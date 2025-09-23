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
#include "native_common.h"
#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include <string>
#include <vector>
#include <map>
#include <functional>

#define TEST_OK 0
#define TEST_FAILED (-1)

static CameraFunctionTest *g_ndkCamera = nullptr;
using ArkCameraTestFunc = napi_value (*)(napi_env, napi_callback_info);
using ArkCameraTestFuncEx = napi_value (*)(napi_env, napi_callback_info, int32_t);

static napi_value ExecuteCameraFunction(napi_env env, napi_callback_info info, std::function<int()> cameraFunc)
{
    int ret = cameraFunc();
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ExecuteCameraIntArgFunction(napi_env env, napi_callback_info info, int32_t caseCode,
                             const std::function<int32_t(int32_t)>& cameraFunc)
{
    int ret = cameraFunc(caseCode);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ExecuteCameraIntArgOp(napi_env env, napi_callback_info info,
                                       std::function<Camera_ErrorCode(int32_t)> cameraOp) {
    int32_t index = CameraTestUtils::GetArgsOneParameterByInt(env, info);
    int ret = TEST_FAILED;
    if (cameraOp(index) == CAMERA_OK) {
        ret = TEST_OK;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value InitCamera(napi_env env, napi_callback_info info)
{
    char *surfaceId = CameraTestUtils::GetArgsOneParameterByStr(env, info);
    g_ndkCamera = new CameraFunctionTest(surfaceId);
    napi_value result;
    if (g_ndkCamera->valid_) {
        napi_create_int32(env, CAMERA_OK, &result);
    } else {
        napi_create_int32(env, CAMERA_SERVICE_FATAL_ERROR, &result);
    }
    return result;
}

static napi_value ReleaseCameraManger(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_ndkCamera->valid_) {
        int ret = g_ndkCamera->ReleaseCameraManger();
        napi_create_int32(env, ret, &result);
        return result;
    }
    napi_create_int32(env, CAMERA_OK, &result);
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
    char *errcode = CameraTestUtils::GetArgsOneParameterByStr(env, info);
    std::string key(errcode);

    auto it = FunctionErroCodeMap.find(key);
    if (it != FunctionErroCodeMap.end()) {
        return it->second(env, info);
    } else {
        OH_LOG_ERROR(LOG_APP, "CameraErrorCode find %{public}s failed....", key.c_str());
        napi_value result;
        napi_create_int32(env, TEST_FAILED, &result);
        return result;
    }
}

static napi_value OHCameraGetCameraManagerTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode,[](int32_t code) {
        return g_ndkCamera->OHGetCameraManagerInvalidTest(code);
    });
}

static napi_value OHCameraDeleteCameraManagerTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode,[](int32_t code) {
        return g_ndkCamera->OHCameraDeleteCameraManagerTest(code);
    });
}

static napi_value OHCameraDeviceGetCameraOrientationTest(napi_env env, napi_callback_info info, int32_t caseCode)
{
    return ExecuteCameraIntArgFunction(env, info, caseCode,[](int32_t code) {
        return g_ndkCamera->OHCameraDeviceGetCameraOrientationTest(code);
    });
}

static napi_value OHCameraDeviceGetHostDeviceNameTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraDeviceGetHostDeviceNameTest(code);
    });
}

static napi_value OHCameraDeviceGetHostDeviceTypeTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraDeviceGetHostDeviceTypeTest(code);
    });
}

static napi_value OHCameraInputRegisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputRegisterCallbackTest(code);
    });
}

static napi_value OHCameraInputUnregisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputUnregisterCallbackTest(code);
    });
}

static napi_value OHCameraInputOpenTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputOpenTest(code);
    });
}

static napi_value OHCameraInputOpenSecureCameraTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputOpenSecureCameraTest(code);
    });
}

static napi_value OHCameraInputOpenConcurrentCamerasTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputOpenConcurrentCamerasTest(code);
    });
}

static napi_value OHCameraInputCloseTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputCloseTest(code);
    });
}

static napi_value OHCameraInputReleaseTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraInputReleaseTest(code);
    });
}

static napi_value OHCameraManagerRegisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerRegisterCallbackTest(code);
    });
}

static napi_value OHCameraManagerUnregisterCallbackTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerUnregisterCallbackTest(code);
    });
}

static napi_value OHCameraManagerGetSupportedCamerasTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetSupportedCamerasTest(code);
    });
}

static napi_value OHCameraManagerDeleteSupportedCamerasTest(napi_env env, napi_callback_info info, int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerDeleteSupportedCamerasTest(code);
    });
}

static napi_value OHCameraManagerGetSupportedCameraOutputCapabilityTest(napi_env env, napi_callback_info info,
                                                                        int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetSupportedCameraOutputCapabilityTest(code);
    });
}

static napi_value OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest(napi_env env,
                                                                                     napi_callback_info info,
                                                                                     int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest(code);
    });
}

static napi_value OHCameraManagerDeleteSupportedCameraOutputCapabilityTest(napi_env env, napi_callback_info info,
                                                                           int32_t caseCode) {
    return ExecuteCameraIntArgFunction(env, info, caseCode, [](int32_t code) {
        return g_ndkCamera->OHCameraManagerDeleteSupportedCameraOutputCapabilityTest(code);
    });
}

const std::map<std::string, ArkCameraTestFuncEx> CameraFunctionMap = {
    {"OH_Camera_GetCameraManager", OHCameraGetCameraManagerTest},
    {"OH_Camera_DeleteCameraManager", OHCameraDeleteCameraManagerTest},
    {"OH_CameraDevice_GetCameraOrientation", OHCameraDeviceGetCameraOrientationTest},
    {"OH_CameraDevice_GetHostDeviceName", OHCameraDeviceGetHostDeviceNameTest},
    {"OH_CameraDevice_GetHostDeviceType", OHCameraDeviceGetHostDeviceTypeTest},
    {"OH_CameraInput_RegisterCallback", OHCameraInputRegisterCallbackTest},
    {"OH_CameraInput_UnregisterCallback", OHCameraInputUnregisterCallbackTest},
    {"OH_CameraInput_Open", OHCameraInputOpenTest},
    {"OH_CameraInput_OpenSecureCamera", OHCameraInputOpenSecureCameraTest},
    {"OH_CameraInput_OpenConcurrentCameras", OHCameraInputOpenConcurrentCamerasTest},
    {"OH_CameraInput_Close", OHCameraInputCloseTest},
    {"OH_CameraInput_Release", OHCameraInputReleaseTest},
    {"OH_CameraManager_RegisterCallback", OHCameraManagerRegisterCallbackTest},
    {"OH_CameraManager_UnregisterCallback", OHCameraManagerUnregisterCallbackTest},
    {"OH_CameraManager_GetSupportedCameras", OHCameraManagerGetSupportedCamerasTest},
    {"OH_CameraManager_DeleteSupportedCameras", OHCameraManagerDeleteSupportedCamerasTest},
    {"OH_CameraManager_GetSupportedCameraOutputCapability", OHCameraManagerGetSupportedCameraOutputCapabilityTest},
    {"OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode",
     OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest},
    {"OH_CameraManager_DeleteSupportedCameraOutputCapability",
     OHCameraManagerDeleteSupportedCameraOutputCapabilityTest},
};

static napi_value OHCameraFunctionHandle(napi_env env, napi_callback_info info)
{
    auto parameters = CameraTestUtils::GetArgsTwoParameters(env, info);
    std::string key(parameters.first);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "CameraKit", "=======chenbo  OHCameraFunctionHandle key:%{public}s", key.c_str());
    auto it = CameraFunctionMap.find(key);
    if (it != CameraFunctionMap.end()) {
        return it->second(env, info, parameters.second);
    } else {
        OH_LOG_ERROR(LOG_APP, "OHCameraFunctionHandle find %{public}s failed....", key.c_str());
        napi_value result;
        napi_create_int32(env, TEST_FAILED, &result);
        return result;
    }
}

static napi_value CameraStatusInfo(napi_env env, napi_callback_info info)
{
    char *charStatus = CameraTestUtils::GetArgsOneParameterByStr(env, info);
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
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetCameraFormat(index);
    });
}

static napi_value CameraFlashMode(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->HasFlashMode(index);
    });
}

static napi_value GetExposureMode(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetExposureMode(index);
    });
}

static napi_value GetCameraFocusMode(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetCameraFocusMode(index);
    });
}

static napi_value GetCameraFocusState(napi_env env, napi_callback_info info)
{
    int32_t index = CameraTestUtils::GetArgsOneParameterByInt(env, info);
    int ret = TEST_FAILED;
    if (g_ndkCamera->CreateSession() == CAMERA_OK) {
        ret = TEST_OK;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionIsVideoStabilizationModeSupported(index);
    });
}

static napi_value TakePictureWithPhotoSettings(napi_env env, napi_callback_info info)
{
    auto indexPair = CameraTestUtils::GetArgsTwoParametersByInit(env, info);
    int ret = TEST_FAILED;
    if (g_ndkCamera->TakePictureWithPhotoSettings(indexPair.first, indexPair.second) == CAMERA_OK) {
        ret = TEST_OK;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetCameraConcurrentInfo(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->GetCameraConcurrentInfo(index);
    });
}

static napi_value SessionCanPreconfig(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionCanPreconfig(index);
    });
}

static napi_value SessionCanPreconfigWithRatio(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionCanPreconfigWithRatio(index);
    });
}

static napi_value PhotoOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->PhotoOutputRegisterCallback(); });
}

static napi_value MetadataOutputRegisterCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->MetadataOutputRegisterCallback(); });
}

static napi_value CameraManagerRegisterTorchStatusCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->CameraManagerRegisterTorchStatusCallback(); });
}

static napi_value CaptureSessionRegisterSmoothZoomInfoCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->CaptureSessionRegisterSmoothZoomInfoCallback(); });
}

static napi_value PhotoOutputRegisterCaptureStartWithInfoCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->PhotoOutputRegisterCaptureStartWithInfoCallback(); });
}

static napi_value CameraManagerRegisterFoldStatusCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->CameraManagerRegisterFoldStatusCallback(); });
}

static napi_value RegisterAutoDeviceSwitchStatusCallback(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info,
                                 [&]() { return g_ndkCamera->RegisterAutoDeviceSwitchStatusCallback(); });
}

static napi_value SessionSetQualityPrioritization(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionSetQualityPrioritization(index);
    });
}

static napi_value CameraOpenConcurrentCameras(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->CameraOpenConcurrentCameras(index);
    });
}

static napi_value IsWhiteBalanceSupported(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->IsWhiteBalanceSupported(index);
    });
}

static napi_value RegisterSystemPressureLevel(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->RegisterSystemPressureLevel(); });
}

static napi_value CameraManagerGetSupportedCameras(napi_env env, napi_callback_info info)
{
    return ExecuteCameraFunction(env, info, [&]() { return g_ndkCamera->CreateCameras(); });
}

static napi_value SessionGetSupportedEffectTypes(napi_env env, napi_callback_info info)
{
    return ExecuteCameraIntArgOp(env, info, [](int32_t index) -> Camera_ErrorCode {
        return g_ndkCamera->SessionGetSupportedEffectTypes(index);
    });
    // int32_t index = CameraTestUtils::GetArgsOneParameterByInt(env, info);
    // auto ret = g_ndkCamera->SessionGetSupportedEffectTypes(index);
    // napi_value result;
    // napi_create_int32(env, ret, &result);
    // return result;
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc = {
        DECLARE_NAPI_FUNCTION("initCamera", InitCamera),
        DECLARE_NAPI_FUNCTION("cameraManagerGetSupportedCameras", CameraManagerGetSupportedCameras),
        DECLARE_NAPI_FUNCTION("releaseCameraManger", ReleaseCameraManger),
        DECLARE_NAPI_FUNCTION("cameraErrorCode", CameraErrorCode),
        DECLARE_NAPI_FUNCTION("cameraStatusInfo", CameraStatusInfo),
        DECLARE_NAPI_FUNCTION("cameraFormat", CameraFormat),
        DECLARE_NAPI_FUNCTION("cameraFlashMode", CameraFlashMode),
        DECLARE_NAPI_FUNCTION("getExposureMode", GetExposureMode),
        DECLARE_NAPI_FUNCTION("getCameraFocusMode", GetCameraFocusMode),
        DECLARE_NAPI_FUNCTION("getCameraFocusState", GetCameraFocusState),
        DECLARE_NAPI_FUNCTION("sessionIsVideoStabilizationModeSupported", SessionIsVideoStabilizationModeSupported),
        DECLARE_NAPI_FUNCTION("takePictureWithPhotoSettings", TakePictureWithPhotoSettings),
        DECLARE_NAPI_FUNCTION("getCameraConcurrentInfo", GetCameraConcurrentInfo),
        DECLARE_NAPI_FUNCTION("sessionCanPreconfig", SessionCanPreconfig),
        DECLARE_NAPI_FUNCTION("sessionCanPreconfigWithRatio", SessionCanPreconfigWithRatio),
        DECLARE_NAPI_FUNCTION("photoOutputRegisterCallback", PhotoOutputRegisterCallback),
        DECLARE_NAPI_FUNCTION("metadataOutputRegisterCallback", MetadataOutputRegisterCallback),
        DECLARE_NAPI_FUNCTION("cameraManagerRegisterTorchStatusCallback", CameraManagerRegisterTorchStatusCallback),
        DECLARE_NAPI_FUNCTION("captureSessionRegisterSmoothZoomInfoCallback",
                              CaptureSessionRegisterSmoothZoomInfoCallback),
        DECLARE_NAPI_FUNCTION("photoOutputRegisterCaptureStartWithInfoCallback",
                              PhotoOutputRegisterCaptureStartWithInfoCallback),
        DECLARE_NAPI_FUNCTION("cameraManagerRegisterFoldStatusCallback", CameraManagerRegisterFoldStatusCallback),
        DECLARE_NAPI_FUNCTION("registerAutoDeviceSwitchStatusCallback", RegisterAutoDeviceSwitchStatusCallback),
        DECLARE_NAPI_FUNCTION("sessionSetQualityPrioritization", SessionSetQualityPrioritization),
        DECLARE_NAPI_FUNCTION("cameraOpenConcurrentCameras", CameraOpenConcurrentCameras),
        DECLARE_NAPI_FUNCTION("isWhiteBalanceSupported", IsWhiteBalanceSupported),
        DECLARE_NAPI_FUNCTION("registerSystemPressureLevel", RegisterSystemPressureLevel),
        DECLARE_NAPI_FUNCTION("sessionGetSupportedEffectTypes", SessionGetSupportedEffectTypes),
        DECLARE_NAPI_FUNCTION("OHCameraFunctionHandle", OHCameraFunctionHandle),
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
