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
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';

import CameraNdkTest from "./camera/CameraNdkTest.test";
import CameraFunctionErrorTest from "./camera/CameraSessionNdkErrorTest.test";
import CameraFunctionTest from "./camera/CameraSessionNdkTest.test";
import CameraMetadataOutputNdkTest from "./camera/CameraMetadataOutputNdkTest.test";

let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
const cameraManager = camera.getCameraManager(testContext);
const cameraDeviceArray = cameraManager.getSupportedCameras();

export default function testsuite() {
  if (cameraDeviceArray.length != 0) {
    CameraFunctionErrorTest();
    CameraNdkTest();
    CameraFunctionTest();
    CameraMetadataOutputNdkTest();
  }
}