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


const TAG = "CAMERA_FUNCTION_TEST_TAG ";
const TEST_OK = 0;
const SLEEP_500 = 500;
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

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(SLEEP_500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), SLEEP_500);
  await sleep(SLEEP_500);
  await power?.click();
}

function releaseCamera() {
  return cameraObj.releaseCameraManger();
}

let getPermissionsCamera = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info(TAG + 'data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error(TAG + 'data:' + JSON.stringify(err))
  })
}

let getPermissionsMic = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info(TAG + 'data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error(TAG + 'data:' + JSON.stringify(err))
  })
}

export default function CameraFunctionTest() {
  describe("CameraFunctionTest", () => {
    beforeAll(async () => {
      await getPermissionsCamera()
      await driveFn()
      await getPermissionsMic()
      await driveFn()
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
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0100
     * @tc.name       testOH_Camera_GetCameraManager0100
     * @tc.desc       Test OH_Camera_GetCameraManager
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetCameraManager0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_Camera_GetCameraManager", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0300
     * @tc.name       testOH_Camera_DeleteCameraManager0100
     * @tc.desc       Test OH_Camera_DeleteCameraManager return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_DeleteCameraManager0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_Camera_DeleteCameraManager", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0500
     * @tc.name       testOH_Camera_GetCameraOrientation0100
     * @tc.desc       Test OH_CameraDevice_GetCameraOrientation return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetCameraOrientation0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetCameraOrientation", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0600
     * @tc.name       testOH_Camera_GetCameraOrientation0200
     * @tc.desc       Test OH_CameraDevice_GetCameraOrientation return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetCameraOrientation0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetCameraOrientation", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0700
     * @tc.name       testOH_Camera_GetHostDeviceName100
     * @tc.desc       Test OH_CameraDevice_GetHostDeviceName return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetHostDeviceName100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetHostDeviceName", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION0900
     * @tc.name       testOH_Camera_GetHostDeviceType100
     * @tc.desc       Test OH_CameraDevice_GetHostDeviceType return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_GetHostDeviceType100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraDevice_GetHostDeviceType", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION1100
     * @tc.name       testOH_Camera_RegisterCallback100
     * @tc.desc       Test OH_CameraInput_RegisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_RegisterCallback100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_RegisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_FUNCTION1200
     * @tc.name       testOH_Camera_UnregisterCallback100
     * @tc.desc       Test OH_CameraInput_RegisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_UnregisterCallback100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_UnregisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0100
     * @tc.name testOH_Camera_Input_FUNCTION0100
     * @tc.desc Test OH_CameraInput_Open return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Open", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0300
     * @tc.name testOH_Camera_Input_FUNCTION0300
     * @tc.desc Test OH_CameraInput_Open return CAMERA_DEVICE_DISABLED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Open", camera.CameraErrorCode.DEVICE_DISABLED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0400
     * @tc.name testOH_Camera_Input_FUNCTION0400
     * @tc.desc Test OH_CameraInput_Open return CAMERA_CONFLICT_CAMERA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Open", camera.CameraErrorCode.CONFLICT_CAMERA)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0600
     * @tc.name testOH_Camera_Input_FUNCTION0600
     * @tc.desc Test OH_CameraInput_OpenSecureCamera return CAMERA_DEVICE_DISABLED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret =
          cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenSecureCamera", camera.CameraErrorCode.DEVICE_DISABLED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0700
     * @tc.name testOH_Camera_Input_FUNCTION0700
     * @tc.desc Test OH_CameraInput_OpenSecureCamera return CAMERA_CONFLICT_CAMERA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret =
          cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenSecureCamera", camera.CameraErrorCode.CONFLICT_CAMERA)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION0800
     * @tc.name testOH_Camera_Input_FUNCTION0800
     * @tc.desc Test OH_CameraInput_OpenConcurrentCameras return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenConcurrentCameras", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1000
     * @tc.name testOH_Camera_Input_FUNCTION1000
     * @tc.desc Test OH_CameraInput_OpenConcurrentCameras return CAMERA_DEVICE_DISABLED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenConcurrentCameras", camera.CameraErrorCode.DEVICE_DISABLED)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1100
     * @tc.name testOH_Camera_Input_FUNCTION1100
     * @tc.desc Test OH_CameraInput_OpenConcurrentCameras return CAMERA_CONFLICT_CAMERA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_OpenConcurrentCameras", camera.CameraErrorCode.CONFLICT_CAMERA)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1200
     * @tc.name testOH_Camera_Input_FUNCTION1200
     * @tc.desc Test OH_CameraInput_Close return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Close", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number SUB_MULTIMEIDA_OH_Camera_Input_FUNCTION1400
     * @tc.name testOH_Camera_Input_FUNCTION1400
     * @tc.desc Test OH_CameraInput_Release return INVALID_ARGUMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it("testOH_Camera_Input_FUNCTION1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let ret = cameraObj.OHCameraFunctionHandle("OH_CameraInput_Release", camera.CameraErrorCode.INVALID_ARGUMENT)
        expect(ret).assertEqual(TEST_OK)
        done()
      })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0100
     * @tc.name       testOH_Camera_Manager_FUNCTION0100
     * @tc.desc       Test OH_CameraManager_RegisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_RegisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0200
     * @tc.name       testOH_Camera_Manager_FUNCTION0200
     * @tc.desc       Test OH_CameraManager_UnregisterCallback return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_UnregisterCallback", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0300
     * @tc.name       testOH_Camera_Manager_FUNCTION0300
     * @tc.desc       Test OH_CameraManager_GetSupportedCameras return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedCameras", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0400
     * @tc.name       testOH_Camera_Manager_FUNCTION0400
     * @tc.desc       Test OH_CameraManager_GetSupportedCameras return CAMERA_OK
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedCameras", 0)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0500
     * @tc.name       testOH_Camera_Manager_FUNCTION0500
     * @tc.desc       Test OH_CameraManager_DeleteSupportedCameras return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_DeleteSupportedCameras", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0600
     * @tc.name       testOH_Camera_Manager_FUNCTION0600
     * @tc.desc       Test OH_CameraManager_GetSupportedCameraOutputCapability return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedCameraOutputCapability", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0700
     * @tc.name       testOH_Camera_Manager_FUNCTION0700
     * @tc.desc       Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode return CAMERA_SERVICE_FATAL_ERROR
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode", camera.CameraErrorCode.SERVICE_FATAL_ERROR)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number     SUB_MULTIMEIDA_OH_Camera_Manager_FUNCTION0800
     * @tc.name       testOH_Camera_Manager_FUNCTION0800
     * @tc.desc       Test OH_CameraManager_DeleteSupportedCameraOutputCapability return INVALID_ARGUMENT
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("testOH_Camera_Manager_FUNCTION0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.OHCameraFunctionHandle("OH_CameraManager_DeleteSupportedCameraOutputCapability", camera.CameraErrorCode.INVALID_ARGUMENT)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

  })
}