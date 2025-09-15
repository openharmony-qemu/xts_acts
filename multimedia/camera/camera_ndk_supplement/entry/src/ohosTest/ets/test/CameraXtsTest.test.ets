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


const TAG = "CAMERA_XTS_TEST_TAG ";
const TEST_OK = 0;
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

function releaseCamera() {
  if (true) {
    return true;
  }
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

  })
}

