/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import cameraObj from 'libentry.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import camera from '@ohos.multimedia.camera';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { abilityAccessCtrl, PermissionRequestResult, Permissions} from '@kit.AbilityKit';


const TAG = "CAMERA_FUNCTION_NO_PERMISSION_TEST_TAG ";
const TEST_OK = 0;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  if (ret != 0) {
    console.error(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }

  ret = cameraObj.cameraManagerGetSupportedCameras();
  console.info(TAG + "cameraManagerGetSupportedCameras ret" + ret);
  if (ret != 0) {
    console.error(TAG + "cameraManagerGetSupportedCameras FAILED");
    expect().assertFail();
  }
  return TEST_OK
}

async function getPhotoReceiverSurface() {
  receiver = image.createImageReceiver({ width: 1280, height: 960 }, 4, 8);
  if (receiver !== undefined) {
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.error(TAG + '创建ImageReceiver实例 failed');
  }
}

function releaseCamera() {
  return cameraObj.releaseCameraManger();
}

export default function CameraNoPermissionTest() {
  describe("CameraNoPermissionTest", () => {
    beforeAll(async () => {
      await getPhotoReceiverSurface()
      getCameraManagerInstance()
      console.info(TAG + "beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.")
    })
    beforeEach(async () => {
      console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.")
    })
    afterEach(() => {
      console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.")
    })
    afterAll(() => {
      if (releaseCamera() != TEST_OK) {
        console.error(TAG + " releaseCamera FAILED");
        expect().assertFail();
      }
      console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed")
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0200
     * @tc.name       testOH_Camera_GetCameraManager0200
     * @tc.desc       Test OH_Camera_GetCameraManager CAMERA_SERVICE_FATAL_ERROR
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetCameraManager0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_Camera_GetCameraManager", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0400
     * @tc.name       testOH_Camera_DeleteCameraManager0200
     * @tc.desc       Test OH_Camera_DeleteCameraManager return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_DeleteCameraManager0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_Camera_DeleteCameraManager", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0800
     * @tc.name       testOH_Camera_GetHostDeviceName200
     * @tc.desc       Test OH_CameraDevice_GetHostDeviceName return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetHostDeviceName200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetHostDeviceName", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION1000
     * @tc.name       testOH_Camera_GetHostDeviceType200
     * @tc.desc       Test OH_CameraDevice_GetHostDeviceType return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetHostDeviceType200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetHostDeviceType", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0200
     * @tc.name testOH_Camera_Input_FUNCTION0200
     * @tc.desc Test OH_CameraInput_Open return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Open", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0500
     * @tc.name testOH_Camera_Input_FUNCTION0500
     * @tc.desc Test OH_CameraInput_OpenSecureCamera return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenSecureCamera", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0900
     * @tc.name testOH_Camera_Input_FUNCTION0900
     * @tc.desc Test OH_CameraInput_OpenConcurrentCameras return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenConcurrentCameras", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1300
     * @tc.name testOH_Camera_Input_FUNCTION1300
     * @tc.desc Test OH_CameraInput_Close return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Close", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1500
     * @tc.name testOH_Camera_Input_FUNCTION1500
     * @tc.desc Test OH_CameraInput_Release return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Release", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
        expect(ret).assertEqual(TEST_OK)
        done()
      })


  })
}