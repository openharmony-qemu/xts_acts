/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <js_native_api.h>
#include "CameraSessionNdkTest.h"
#include "CameraNdkTest.h"

#define DESCRIPTOR(jsmethod, method)                                                                                   \
    { jsmethod, nullptr, method, nullptr, nullptr, nullptr, napi_default, nullptr }


napi_property_descriptor desc1[] = {
    DESCRIPTOR("initWithSurface", initWithSurface),
    DESCRIPTOR("captureSessionStart", captureSessionStart),
    DESCRIPTOR("captureSessionIsVideoStabilizationModeSupported", captureSessionIsVideoStabilizationModeSupported),
    DESCRIPTOR("captureSessionEnableControlCenter", captureSessionEnableControlCenter),
    DESCRIPTOR("captureSessionEnableAutoDeviceSwitch", captureSessionEnableAutoDeviceSwitch),
    DESCRIPTOR("captureSessionEnableMacro", captureSessionEnableMacro),
    DESCRIPTOR("captureSessionIsMacroSupported", captureSessionIsMacroSupported),
    DESCRIPTOR("captureSessionIsAutoDeviceSwitchSupported", captureSessionIsAutoDeviceSwitchSupported),
    DESCRIPTOR("captureSessionSetWhiteBalance", captureSessionSetWhiteBalance),
    DESCRIPTOR("captureSessionGetWhiteBalanceRange", captureSessionGetWhiteBalanceRange),
    DESCRIPTOR("captureSessionAddPreviewOutput", captureSessionAddPreviewOutput),
    DESCRIPTOR("captureSessionRemovePreviewOutput", captureSessionRemovePreviewOutput),
    DESCRIPTOR("captureSessionBeginConfig", captureSessionBeginConfig),
    DESCRIPTOR("captureSessionEnableMacroConfigAllow", captureSessionEnableMacroConfigAllow),
    DESCRIPTOR("captureSessionSetVideoStabilizationMode", captureSessionSetVideoStabilizationMode),
    DESCRIPTOR("captureSessionRelease", captureSessionRelease),
    DESCRIPTOR("captureSessionEmu", captureSessionEmu),
    DESCRIPTOR("OHCaptureSessionDeleteSupportedEffectTypes", OHCaptureSessionDeleteSupportedEffectTypes),
    DESCRIPTOR("OHCameraInputOpenConcurrentCameras", OHCameraInputOpenConcurrentCameras),
    DESCRIPTOR("OHCameraInputOpenConcurrentCamerasErr", OHCameraInputOpenConcurrentCamerasErr),
    DESCRIPTOR("TestCreateDeferredPreviewOutputSucc", TestCreateDeferredPreviewOutputSucc),
    DESCRIPTOR("TestCreateDeferredPreviewOutputWithNullArgs", TestCreateDeferredPreviewOutputWithNullArgs),
    DESCRIPTOR("TestCreateDeferredPreviewOutputWithInvalidProfile", TestCreateDeferredPreviewOutputWithInvalidProfile),
    DESCRIPTOR("TestIsTorchLevelControlSupportedErr", TestIsTorchLevelControlSupportedErr),
    DESCRIPTOR("TestIsTorchLevelControlSupportedSucc", TestIsTorchLevelControlSupportedSucc),
    DESCRIPTOR("TestSetTorchModeOnWithLevelErr", TestSetTorchModeOnWithLevelErr),
    DESCRIPTOR("TestGetPhysicalApertureSucc", TestGetPhysicalApertureSucc),
    DESCRIPTOR("TestGetPhysicalApertureWithNullSession", TestGetPhysicalApertureWithNullSession),
    DESCRIPTOR("TestGetPhysicalApertureWithUnconfiguredSession", TestGetPhysicalApertureWithUnconfiguredSession),
    DESCRIPTOR("TestSetPhysicalApertureSucc", TestSetPhysicalApertureSucc),
    DESCRIPTOR("TestSetPhysicalApertureWithNullSession", TestSetPhysicalApertureWithNullSession),
    DESCRIPTOR("TestSetPhysicalApertureWithUnconfiguredStream", TestSetPhysicalApertureWithUnconfiguredStream),
    DESCRIPTOR("TestGetSupportedExposureDurationRangeSucc", TestGetSupportedExposureDurationRangeSucc),
    DESCRIPTOR("TestGetSupportedExposureDurationRangeWithNullSession",
        TestGetSupportedExposureDurationRangeWithNullSession),
    DESCRIPTOR("TestGetSupportedExposureDurationRangeWithUnconfiguredStream",
        TestGetSupportedExposureDurationRangeWithUnconfiguredStream),
    DESCRIPTOR("TestSetExposureDurationSucc", TestSetExposureDurationSucc),
    DESCRIPTOR("TestSetExposureDurationWithInvalidValue", TestSetExposureDurationWithInvalidValue),
    DESCRIPTOR("TestSetExposureDurationWithUnconfiguredStream", TestSetExposureDurationWithUnconfiguredStream),
    DESCRIPTOR("TestGetExposureDurationSucc", TestGetExposureDurationSucc),
    DESCRIPTOR("TestGetExposureDurationWithUnconfiguredStream", TestGetExposureDurationWithUnconfiguredStream),
    DESCRIPTOR("TestAddDeferredSurfaceSucc", TestAddDeferredSurfaceSucc),
    DESCRIPTOR("TestAddDeferredSurfaceErr", TestAddDeferredSurfaceErr),
    DESCRIPTOR("TestAddDeferredSurfaceWithEmptyStr", TestAddDeferredSurfaceWithEmptyStr),
    DESCRIPTOR("OHCaptureSessionGetSupportedEffectTypesSupp", OHCaptureSessionGetSupportedEffectTypesSupp),
    DESCRIPTOR("captureSessionRegisterIsoChangeCallback", captureSessionRegisterIsoChangeCallback),
    DESCRIPTOR("captureSessionUnregisterIsoChangeCallback", captureSessionUnregisterIsoChangeCallback),
    DESCRIPTOR("captureDeleteCameraDevices", captureDeleteCameraDevices),
    DESCRIPTOR("captureIsBandwidthCompressionSupported", captureIsBandwidthCompressionSupported),
    DESCRIPTOR("captureEnableBandwidthCompression", captureEnableBandwidthCompression),
    DESCRIPTOR("captureGetSupportedFullCameraOutputCapabilityWithSceneMode",
               captureGetSupportedFullCameraOutputCapabilityWithSceneMode),
    DESCRIPTOR("captureRegisterOcclusionDetectionCallback", captureRegisterOcclusionDetectionCallback),
    DESCRIPTOR("captureUnregisterOcclusionDetectionCallback", captureUnregisterOcclusionDetectionCallback),
    DESCRIPTOR("captureCameraPreconfigType", captureCameraPreconfigType),
    DESCRIPTOR("captureGetCameraDevices", captureGetCameraDevices),
    DESCRIPTOR("captureGetCameraDevicesError", captureGetCameraDevicesError),
    DESCRIPTOR("captureCameraDeviceQueryInfoCameraType", captureCameraDeviceQueryInfoCameraType),
    DESCRIPTOR("captureSessionIsBandwidthCompressionSupportedTest", captureSessionIsBandwidthCompressionSupportedTest),
    DESCRIPTOR("captureCameraDeviceQueryInfoConnectionTypes", captureCameraDeviceQueryInfoConnectionTypes),
    DESCRIPTOR("captureCameraDeviceQueryInfoConnectionType", captureCameraDeviceQueryInfoConnectionType),
    DESCRIPTOR("captureCameraDeviceQueryInfoCameraPositions", captureCameraDeviceQueryInfoCameraPositions),
    DESCRIPTOR("captureCameraDeviceQueryInfoCameraTypeSize", captureCameraDeviceQueryInfoCameraTypeSize),
    DESCRIPTOR("captureCameraDeviceQueryInfoCameraTypeSizes", captureCameraDeviceQueryInfoCameraTypeSizes),
    DESCRIPTOR("captureCameraDeviceQueryInfo", captureCameraDeviceQueryInfo),
    DESCRIPTOR("initWithSurfaces", initWithSurfaces),
    DESCRIPTOR("captureEnableBandwidthCompressionError", captureEnableBandwidthCompressionError),
    DESCRIPTOR("captureIsGetCameraDevices", captureIsGetCameraDevices),
    DESCRIPTOR("getPreviewRotationWithoutDisplayRotation", getPreviewRotationWithoutDisplayRotation),
    DESCRIPTOR("metadataOutputAddMetadataObjectTypes", metadataOutputAddMetadataObjectTypes),
    DESCRIPTOR("metadataOutputRemoveMetadataObjectTypes", metadataOutputRemoveMetadataObjectTypes),
    DESCRIPTOR("OHCameraManagerCreateMetadataOutputWithObjectTypesSupp",
        OHCameraManagerCreateMetadataOutputWithObjectTypesSupp),
    DESCRIPTOR("OHVideoOutputGetVideoRotationWithoutDeviceDegreeSupp",
        OHVideoOutputGetVideoRotationWithoutDeviceDegreeSupp),
    DESCRIPTOR("OHPhotoOutputGetPhotoRotationWithoutDeviceDegreeSupp",
        OHPhotoOutputGetPhotoRotationWithoutDeviceDegreeSupp),
    DESCRIPTOR("checkMetadataObjectTypeEnumValues", checkMetadataObjectTypeEnumValues),
    DESCRIPTOR("checkMetadataObjectEmotionEnumValues", checkMetadataObjectEmotionEnumValues),
    DESCRIPTOR("TestRegisterMetadataCallbackNullOutput", TestRegisterMetadataCallbackNullOutput),
    DESCRIPTOR("TestRegisterMetadataCallbackNullCallback", TestRegisterMetadataCallbackNullCallback),
    DESCRIPTOR("TestRegisterMetadataCallbackAllNull", TestRegisterMetadataCallbackAllNull),
    DESCRIPTOR("TestRegisterMetadataCallbackNormal", TestRegisterMetadataCallbackNormal),
    DESCRIPTOR("TestRegisterMetadataCallbackDuplicate", TestRegisterMetadataCallbackDuplicate),
    DESCRIPTOR("TestRegisterAndUnregisterMetadataCallback", TestRegisterAndUnregisterMetadataCallback),
    DESCRIPTOR("TestUnregisterMetadataCallbackNullOutput", TestUnregisterMetadataCallbackNullOutput),
    DESCRIPTOR("TestUnregisterMetadataCallbackNullCallback", TestUnregisterMetadataCallbackNullCallback),
    DESCRIPTOR("TestUnregisterMetadataCallbackNotRegistered", TestUnregisterMetadataCallbackNotRegistered),
    DESCRIPTOR("TestUnregisterMetadataCallbackRegistered", TestUnregisterMetadataCallbackRegistered),
    DESCRIPTOR(
        "TestRegisterMetadataCallbackTriggerAfterUnregister", TestRegisterMetadataCallbackTriggerAfterUnregister),
    DESCRIPTOR("TestUnregisterMetadataCallbackTwice", TestUnregisterMetadataCallbackTwice),
    DESCRIPTOR("TestRegisterErrorCallbackNullOutput", TestRegisterErrorCallbackNullOutput),
    DESCRIPTOR("TestRegisterErrorCallbackNullCallback", TestRegisterErrorCallbackNullCallback),
    DESCRIPTOR("TestRegisterErrorCallbackAllNull", TestRegisterErrorCallbackAllNull),
    DESCRIPTOR("TestRegisterErrorCallbackNormal", TestRegisterErrorCallbackNormal),
    DESCRIPTOR("TestUnregisterErrorCallbackNullOutput", TestUnregisterErrorCallbackNullOutput),
    DESCRIPTOR("TestUnregisterErrorCallbackNullCallback", TestUnregisterErrorCallbackNullCallback),
    DESCRIPTOR("TestUnregisterErrorCallbackNotRegistered", TestUnregisterErrorCallbackNotRegistered),
    DESCRIPTOR("TestUnregisterErrorCallbackRegistered", TestUnregisterErrorCallbackRegistered),
    DESCRIPTOR("TestUnregisterErrorCallbackTwice", TestUnregisterErrorCallbackTwice),
    DESCRIPTOR("TestCheckLockTrackingSupportReturnValue", TestCheckLockTrackingSupportReturnValue),
	DESCRIPTOR("TestCheckLockTrackingSupportReturnBoolean", TestCheckLockTrackingSupportReturnBoolean),
    DESCRIPTOR("TestLockWhenTrackingNotSupported", TestLockWhenTrackingNotSupported),
    DESCRIPTOR("TestLockTrackingNullMetadataOutput", TestLockTrackingNullMetadataOutput),
    DESCRIPTOR("TestLockTrackingNullPoint", TestLockTrackingNullPoint),
    DESCRIPTOR("TestLockTrackingInvalidPoint", TestLockTrackingInvalidPoint),
    DESCRIPTOR("TestLockTrackingValidPoint", TestLockTrackingValidPoint),
    DESCRIPTOR("TestLockTrackingWithoutSessionConfig", TestLockTrackingWithoutSessionConfig),
    DESCRIPTOR("TestUnlockTrackingNullMetadataOutput", TestUnlockTrackingNullMetadataOutput),
    DESCRIPTOR("TestUnlockTrackingNormal", TestUnlockTrackingNormal),
    DESCRIPTOR("TestUnlockThenLock", TestUnlockThenLock),
    DESCRIPTOR("TestUnlockWhenNotLocked", TestUnlockWhenNotLocked),
    DESCRIPTOR("TestUnlockWithoutSessionConfig", TestUnlockWithoutSessionConfig),
    DESCRIPTOR("TestOHCaptureSessionIsLockFocusTrackingSupported", TestOHCaptureSessionIsLockFocusTrackingSupported),
    DESCRIPTOR("TestLockFocusTrackingWhenNotSupported", TestLockFocusTrackingWhenNotSupported),
    DESCRIPTOR("TestUnlockFocusTrackingWhenNotSupported", TestUnlockFocusTrackingWhenNotSupported),
    DESCRIPTOR("TestIsLockFocusTrackingSupportedWithUnconfiguredSession",
        TestIsLockFocusTrackingSupportedWithUnconfiguredSession),
    DESCRIPTOR("TestIsLockFocusTrackingSupportedWithNullptr", TestIsLockFocusTrackingSupportedWithNullptr),
    DESCRIPTOR("TestLockFocusTrackingNormalValidPoint", TestLockFocusTrackingNormalValidPoint),
    DESCRIPTOR("TestLockFocusTrackingWithNullptr", TestLockFocusTrackingWithNullptr),
    DESCRIPTOR("TestLockFocusTrackingWithUnconfiguredSession", TestLockFocusTrackingWithUnconfiguredSession),
    DESCRIPTOR("TestLockFocusTrackingRepeatLock", TestLockFocusTrackingRepeatLock),
    DESCRIPTOR("TestUnlockFocusTracking", TestUnlockFocusTracking),
    DESCRIPTOR("TestUnlockFocusTrackingWithNullptr", TestUnlockFocusTrackingWithNullptr),
    DESCRIPTOR("TestUnlockFocusTrackingWithUnconfiguredSession", TestUnlockFocusTrackingWithUnconfiguredSession),
    DESCRIPTOR("TestLockFocusTrackingRepeatUnlock", TestLockFocusTrackingRepeatUnlock),
    DESCRIPTOR("TestOHMetadataObjectExtGetBoundingBox", TestOHMetadataObjectExtGetBoundingBox),
    DESCRIPTOR("TestOHMetadataObjectExtGetEmotion", TestOHMetadataObjectExtGetEmotion),
    DESCRIPTOR("TestOHMetadataObjectExtGetLeftEyeBoundingBox", TestOHMetadataObjectExtGetLeftEyeBoundingBox),
    DESCRIPTOR("TestOHMetadataObjectExtGetMetadataObjectType", TestOHMetadataObjectExtGetMetadataObjectType),
    DESCRIPTOR("TestOHMetadataObjectExtGetPitchAngle", TestOHMetadataObjectExtGetPitchAngle),
    DESCRIPTOR("TestOHMetadataObjectExtGetRightEyeBoundingBox", TestOHMetadataObjectExtGetRightEyeBoundingBox),
    DESCRIPTOR("TestOHMetadataObjectExtGetRollAngle", TestOHMetadataObjectExtGetRollAngle),
    DESCRIPTOR("TestOHMetadataObjectExtGetTimestamp", TestOHMetadataObjectExtGetTimestamp),
    DESCRIPTOR("TestOHMetadataObjectExtGetYawAngle", TestOHMetadataObjectExtGetYawAngle),
    DESCRIPTOR("PhotoOutputIsAutoExtendedGainmapSupported", PhotoOutputIsAutoExtendedGainmapSupported),
    DESCRIPTOR("PhotoOutputEnableAutoExtendedGainmapDelivery", PhotoOutputEnableAutoExtendedGainmapDelivery),
    DESCRIPTOR("TestOHMetadataObjectExtDestroy", TestOHMetadataObjectExtDestroy),
    DESCRIPTOR("TestOHMetadataObjectExtIsLockFocusTracked", TestOHMetadataObjectExtIsLockFocusTracked),
    DESCRIPTOR("TestIsLockFocusTracked", TestIsLockFocusTracked),
    DESCRIPTOR("TestGetYawAngle", TestGetYawAngle),
    DESCRIPTOR("TestGetTimestamp", TestGetTimestamp),
    DESCRIPTOR("TestGetRollAngle", TestGetRollAngle),
    DESCRIPTOR("TestGetRightEyeBoundingBox", TestGetRightEyeBoundingBox),
    DESCRIPTOR("TestGetPitchAngle", TestGetPitchAngle),
    DESCRIPTOR("TestGetMetadataObjectType", TestGetMetadataObjectType),
    DESCRIPTOR("TestGetLeftEyeBoundingBox", TestGetLeftEyeBoundingBox),
    DESCRIPTOR("TestGetEmotion", TestGetEmotion),
    DESCRIPTOR("TestGetBoundingBox", TestGetBoundingBox),
    DESCRIPTOR("TestDestroy", TestDestroy),
    DESCRIPTOR("checkOptionalPropertyNotExistEnumValues", CheckOptionalPropertyNotExistEnumValues),
};

EXTERN_C_START 
static napi_value Init(napi_env env, napi_value exports)
{
    size_t mergedLength =
        sizeof(desc1) / sizeof(desc1[0]) ;
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[i] = desc1[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
};
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}