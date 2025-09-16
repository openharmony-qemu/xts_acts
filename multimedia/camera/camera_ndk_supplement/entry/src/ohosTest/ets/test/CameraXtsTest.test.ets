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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import camera from '@ohos.multimedia.camera';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';


const TAG = "CAMERA_XTS_TEST_TAG ";
const TEST_OK = 0;
const SLEEP_500 = 500;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
  return TEST_OK
}

async function getPhotoReceiverSurface() {
  console.log(TAG + '通过宽、高、图片格式、容量创建ImageReceiver实例。');
  receiver = image.createImageReceiver({ width: 1280, height: 960 }, 4, 8);
  if (receiver !== undefined) {
    console.log(TAG + '创建ImageReceiver实例 successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + '创建ImageReceiver实例 failed');
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

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId()
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.ohcameraxtstest', applicationFlags, userId)
    let tokenId: number = applicationInfo.accessTokenId
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1)
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`)
  }
  console.info('getPermission end')
};

export default function CameraXtsTest() {
  describe("CameraXtsTest", () => {
    beforeAll(async () => {
      await getPermissions()
      await driveFn();
      await getPhotoReceiverSurface()
      getCameraManagerInstance()
      console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.")
    })
    beforeEach(async () => {
      console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.")
    })
    afterEach(() => {
      console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.")
    })
    afterAll(() => {
      if (!releaseCamera()) {
        console.error(TAG + "releaseCamera FAILED");
        expect().assertFail();
      }
      console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed")
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0100
     * @tc.name      : testCAMERAOPERATIONNOTALLOWED
     * @tc.desc      : Test CAMERA_OPERATION_NOT_ALLOWED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERAOPERATIONNOTALLOWED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_OPERATION_NOT_ALLOWED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0200
     * @tc.name      : testCAMERASESSIONNOTCONFIG
     * @tc.desc      : Test CAMERA_SESSION_NOT_CONFIG
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERASESSIONNOTCONFIG", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_NOT_CONFIG')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0300
     * @tc.name      : testCAMERASESSIONNOTRUNNING
     * @tc.desc      : Test CAMERA_SESSION_NOT_RUNNING
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERASESSIONNOTRUNNING", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_NOT_RUNNING')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0400
     * @tc.name      : testCAMERASESSIONCONFIGLOCKED
     * @tc.desc      : Test CAMERA_SESSION_CONFIG_LOCKED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERASESSIONCONFIGLOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_SESSION_CONFIG_LOCKED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0500
     * @tc.name      : testCAMERADEVICESETTINGLOCKED
     * @tc.desc      : Test CAMERA_DEVICE_SETTING_LOCKED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERADEVICESETTINGLOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_SETTING_LOCKED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0600
     * @tc.name      : testCAMERACONFLICTCAMERA
     * @tc.desc      : Test CAMERA_CONFLICT_CAMERA
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERACONFLICTCAMERA", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_CONFLICT_CAMERA')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0700
     * @tc.name      : testCAMERADEVICEDISABLED
     * @tc.desc      : Test CAMERA_DEVICE_DISABLED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERADEVICEDISABLED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_DISABLED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0800
     * @tc.name      : testCAMERADEVICEPREEMPTED
     * @tc.desc      : Test CAMERA_DEVICE_PREEMPTED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERADEVICEPREEMPTED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_DEVICE_PREEMPTED')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode0900
     * @tc.name      : testCAMERAUNRESOLVEDCONFLICTSWITHCURRENTCONFIGURATIONS
     * @tc.desc      : Test CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERAUNRESOLVEDCONFLICTSWITHCURRENTCONFIGURATIONS", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraErrorCode('CAMERA_UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1000
     * @tc.name      : testCAMERASTATUSAPPEAR
     * @tc.desc      : Test CAMERA_STATUS_APPEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERASTATUSAPPEAR", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_APPEAR')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1100
     * @tc.name      : testCAMERASTATUSDISAPPEAR
     * @tc.desc      : Test CAMERA_STATUS_DISAPPEAR
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERASTATUSDISAPPEAR", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_DISAPPEAR')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1200
     * @tc.name      : testCAMERASTATUSAVAILABLE
     * @tc.desc      : Test CAMERA_STATUS_AVAILABLE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERASTATUSAVAILABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_AVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1300
     * @tc.name      : testCAMERASTATUSUNAVAILABLE
     * @tc.desc      : Test CAMERA_STATUS_UNAVAILABLE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERASTATUSUNAVAILABLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1400
     * @tc.name      : testCAMERACONNECTIONBUILTIN
     * @tc.desc      : Test CAMERA_CONNECTION_BUILT_IN
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERACONNECTIONBUILTIN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_BUILT_IN')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1500
     * @tc.name      : testCAMERACONNECTIONUSBPLUGIN
     * @tc.desc      : Test CAMERA_CONNECTION_USB_PLUGIN
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERACONNECTIONUSBPLUGIN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_USB_PLUGIN')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1600
     * @tc.name      : testCAMERACONNECTIONREMOTE
     * @tc.desc      : Test CAMERA_CONNECTION_REMOTE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERACONNECTIONREMOTE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_CONNECTION_REMOTE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1700
     * @tc.name      : testCAMERAFORMATRGBA8888
     * @tc.desc      : Test CAMERA_FORMAT_RGBA_8888
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERAFORMATRGBA8888", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_RGBA_8888)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1800
     * @tc.name      : testCAMERAFORMATYCBCRP010
     * @tc.desc      : Test CAMERA_FORMAT_YCBCR_P010
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERAFORMATYCBCRP010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode1900
     * @tc.name      : testCAMERAFORMATYCRCBP010
     * @tc.desc      : Test CAMERA_FORMAT_YCRCB_P010
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCAMERAFORMATYCRCBP010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFormat(camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2000
     * @tc.name      : testFLASHMODECLOSE
     * @tc.desc      : Test FLASH_MODE_CLOSE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFLASHMODECLOSE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_CLOSE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2100
     * @tc.name      : testFLASHMODEOPEN
     * @tc.desc      : Test FLASH_MODE_OPEN
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFLASHMODEOPEN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_OPEN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2200
     * @tc.name      : testFLASHMODEAUTO
     * @tc.desc      : Test FLASH_MODE_AUTO
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFLASHMODEAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2300
     * @tc.name      : testFLASHMODEALWAYSOPEN
     * @tc.desc      : Test FLASH_MODE_ALWAYS_OPEN
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFLASHMODEALWAYSOPEN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraFlashMode(camera.FlashMode.FLASH_MODE_ALWAYS_OPEN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2400
     * @tc.name      : testEXPOSUREMODEAUTO
     * @tc.desc      : Test EXPOSURE_MODE_AUTO
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testEXPOSUREMODEAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2500
     * @tc.name      : testEXPOSUREMODECONTINUOUSAUTO
     * @tc.desc      : Test EXPOSURE_MODE_CONTINUOUS_AUTO
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testEXPOSUREMODECONTINUOUSAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getExposureMode(camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2600
     * @tc.name      : testFOCUSMODEMANUAL
     * @tc.desc      : Test FOCUS_MODE_MANUAL
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFOCUSMODEMANUAL", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_MANUAL)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2700
     * @tc.name      : testFOCUSMODECONTINUOUSAUTO
     * @tc.desc      : Test FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFOCUSMODECONTINUOUSAUTO", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2800
     * @tc.name      : testFOCUSMODELOCKED
     * @tc.desc      : Test FOCUS_MODE_LOCKED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFOCUSMODELOCKED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusMode(camera.FocusMode.FOCUS_MODE_LOCKED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode2900
     * @tc.name      : testFOCUSSTATESCAN
     * @tc.desc      : Test FOCUS_STATE_SCAN
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFOCUSSTATESCAN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_SCAN)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3000
     * @tc.name      : testFOCUSSTATEFOCUSED
     * @tc.desc      : Test FOCUS_STATE_FOCUSED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFOCUSSTATEFOCUSED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_FOCUSED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3100
     * @tc.name      : testFOCUSSTATEUNFOCUSED
     * @tc.desc      : Test FOCUS_STATE_UNFOCUSED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFOCUSSTATEUNFOCUSED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.FocusState.FOCUS_STATE_UNFOCUSED)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3200
     * @tc.name      : testSTABILIZATIONMODEOFF
     * @tc.desc      : Test STABILIZATION_MODE_OFF
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testSTABILIZATIONMODEOFF", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.OFF)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3300
     * @tc.name      : testSTABILIZATIONMODELOW
     * @tc.desc      : Test STABILIZATION_MODE_LOW
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testSTABILIZATIONMODELOW", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.LOW)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3400
     * @tc.name      : testSTABILIZATIONMODEMIDDLE
     * @tc.desc      : Test STABILIZATION_MODE_MIDDLE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testSTABILIZATIONMODEMIDDLE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.MIDDLE)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3500
     * @tc.name      : testSTABILIZATIONMODEHIGH
     * @tc.desc      : Test STABILIZATION_MODE_HIGH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testSTABILIZATIONMODEHIGH", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraFocusState(camera.VideoStabilizationMode.HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3600
     * @tc.name      : testIAMGEROTATION0
     * @tc.desc      : Test IAMGE_ROTATION_0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testIAMGEROTATION0", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_0, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3700
     * @tc.name      : testIAMGEROTATION90
     * @tc.desc      : Test IAMGE_ROTATION_90
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testIAMGEROTATION90", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3800
     * @tc.name      : testIAMGEROTATION180
     * @tc.desc      : Test IAMGE_ROTATION_180
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testIAMGEROTATION180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_180, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode3900
     * @tc.name      : testIAMGEROTATION270
     * @tc.desc      : Test IAMGE_ROTATION_270
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testIAMGEROTATION270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_270, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4000
     * @tc.name      : testQUALITYLEVELHIGH
     * @tc.desc      : Test QUALITY_LEVEL_HIGH
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testQUALITYLEVELHIGH", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_HIGH)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4100
     * @tc.name      : testQUALITYLEVELMEDIUM
     * @tc.desc      : Test QUALITY_LEVEL_MEDIUM
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testQUALITYLEVELMEDIUM", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_MEDIUM)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4200
     * @tc.name      : testQUALITYLEVELLOW
     * @tc.desc      : Test QUALITY_LEVEL_LOW
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testQUALITYLEVELLOW", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.takePictureWithPhotoSettings(camera.ImageRotation.ROTATION_90, camera.QualityLevel.QUALITY_LEVEL_LOW)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4300
     * @tc.name      : testFACEDETECTION
     * @tc.desc      : Test FACE_DETECTION
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testFACEDETECTION", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.getCameraConcurrentInfo(camera.MetadataObjectType.FACE_DETECTION)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4400
     * @tc.name      : testPRECONFIG720P
     * @tc.desc      : Test PRECONFIG_720P
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testPRECONFIG720P", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_720P)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4500
     * @tc.name      : testPRECONFIG1080P
     * @tc.desc      : Test PRECONFIG_1080P
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testPRECONFIG1080P", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_1080P)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4600
     * @tc.name      : testPRECONFIG4K
     * @tc.desc      : Test PRECONFIG_4K
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testPRECONFIG4K", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_4K)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4700
     * @tc.name      : testPRECONFIGHIGHQUALITY
     * @tc.desc      : Test PRECONFIG_HIGH_QUALITY
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testPRECONFIGHIGHQUALITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4800
     * @tc.name      : testPRECONFIGRATIO11
     * @tc.desc      : Test PRECONFIG_RATIO_1_1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testPRECONFIGRATIO11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_1_1)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode4900
     * @tc.name      : testPRECONFIGRATIO43
     * @tc.desc      : Test PRECONFIG_RATIO_4_3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testPRECONFIGRATIO43", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_4_3)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode5000
     * @tc.name      : testPRECONFIGRATIO169
     * @tc.desc      : Test PRECONFIG_RATIO_16_9
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testPRECONFIGRATIO169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.sessionCanPreconfigWithRatio(camera.PreconfigRatio.PRECONFIG_RATIO_16_9)
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode5100
     * @tc.name      : testCameraStatusInfocamera
     * @tc.desc      : Test CAMERA_STATUS_UNAVAILABLE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraStatusInfocamera", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode5200
     * @tc.name      : testCameraStatusInfostatus
     * @tc.desc      : Test CAMERA_STATUS_UNAVAILABLE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraStatusInfostatus", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.cameraStatusInfo('CAMERA_STATUS_UNAVAILABLE')
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode5300
     * @tc.name      : testCameraFrameShutterInfo
     * @tc.desc      : Test Camera_FrameShutterInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraFrameShutterInfo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode5400
     * @tc.name      : testCameraFrameShutterInfocaptureId
     * @tc.desc      : Test Camera_FrameShutterInfo captureId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraFrameShutterInfocaptureId", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode5500
     * @tc.name      : testCameraFrameShutterInfotimestamp
     * @tc.desc      : Test Camera_FrameShutterInfo timestamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraFrameShutterInfotimestamp", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.photoOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode5900
     * @tc.name      : testCameraRect
     * @tc.desc      : Test Camera_Rect
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraRect", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6000
     * @tc.name      : testCameraRecttopLeftX
     * @tc.desc      : Test Camera_Rect topLeftX
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraRecttopLeftX", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6100
     * @tc.name      : testCameraRecttopLeftY
     * @tc.desc      : Test Camera_Rect topLeftY
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraRecttopLeftY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6200
     * @tc.name      : testCameraRectwidth
     * @tc.desc      : Test Camera_Rect width
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraRectwidth", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6300
     * @tc.name      : testCameraRectheight
     * @tc.desc      : Test Camera_Rect height
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraRectheight", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6400
     * @tc.name      : testCameraMetadataObject
     * @tc.desc      : Test Camera_MetadataObject
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraMetadataObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6500
     * @tc.name      : testCameraMetadataObjecttype
     * @tc.desc      : Test Camera_MetadataObject type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraMetadataObjecttype", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6600
     * @tc.name      : testCameraMetadataObjecttimestamp
     * @tc.desc      : Test Camera_MetadataObject timestamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraMetadataObjecttimestamp", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEIDA_OH_Camera_ErrorCode6700
     * @tc.name      : testCameraMetadataObjectboundingBox
     * @tc.desc      : Test Camera_MetadataObject boundingBox
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testCameraMetadataObjectboundingBox", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let ret = cameraObj.metadataOutputRegisterCallback()
      expect(ret).assertEqual(TEST_OK)
      done()
    })


  })
}

