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

#ifndef CAMERA_NDK_SUPPLEMENT_CAMERAFUNCTIONTEST_H
#define CAMERA_NDK_SUPPLEMENT_CAMERAFUNCTIONTEST_H

#include <CameraTest.h>

class CameraFunctionTest : public NDKCamera {
public:
    explicit CameraFunctionTest(char* str) : NDKCamera(str) {}

    int32_t OHGetCameraManagerInvalidTest(int32_t caseCode);
    int32_t OHCameraDeleteCameraManagerTest(int32_t caseCode);
    int32_t OHCameraDeviceGetCameraOrientationTest(int32_t caseCode);
    int32_t OHCameraDeviceGetHostDeviceNameTest(int32_t caseCode);
    int32_t OHCameraDeviceGetHostDeviceTypeTest(int32_t caseCode);
    int32_t OHCameraInputRegisterCallbackTest(int32_t caseCode);
    int32_t OHCameraInputUnregisterCallbackTest(int32_t caseCode);
    int32_t OHCameraInputOpenTest(int32_t caseCode);
    int32_t OHCameraInputOpenSecureCameraTest(int32_t caseCode);
    int32_t OHCameraInputOpenConcurrentCamerasTest(int32_t caseCode);
    int32_t OHCameraInputCloseTest(int32_t caseCode);
    int32_t OHCameraInputReleaseTest(int32_t caseCode);
    int32_t OHCameraManagerRegisterCallbackTest(int32_t caseCode);
    int32_t OHCameraManagerUnregisterCallbackTest(int32_t caseCode);
    int32_t OHCameraManagerGetSupportedCamerasTest(int32_t caseCode);
    int32_t OHCameraManagerDeleteSupportedCamerasTest(int32_t caseCode);
    int32_t OHCameraManagerGetSupportedCameraOutputCapabilityTest(int32_t caseCode);
    int32_t OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneModeTest(int32_t caseCode);
    int32_t OHCameraManagerDeleteSupportedCameraOutputCapabilityTest(int32_t caseCode);
};


#endif //CAMERA_NDK_SUPPLEMENT_CAMERAFUNCTIONTEST_H
