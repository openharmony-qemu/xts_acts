/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  closeFd, COMMON_WAIT_DURATION, driveFn, getPermission, isEmpty, sleep
} from '../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraXts.CameraSessionInputOutputTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mCameraInput: camera.CameraInput;
let fdNumber: number;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
let count = 0;

interface TestCameraInfo {
  cameraId: string;
  cameraPosition: number;
  cameraType: number;
  connectionType: number;
  hostDeviceName: string;
  hostDeviceType: number;
  cameraOrientation: number;
  isRetractable?: boolean;
  lensEquivalentFocalLength?: Array<number>;
  isLogicalCamera?: boolean;
  constituentCameraDevices?: Array<TestCameraInfo>;
  lensFocalLength?: number;
  minimumFocusDistance?: number;
  lensDistortion?: Array<number>;
  lensIntrinsicCalibration?: Array<number>;
  sensorPhysicalSize?: Array<number>;
  sensorPixelArraySize?: Array<number>;
  sensorColorFilterArrangement?: number;
  automotiveCameraPosition?: number;
}

let mainBackCamera: TestCameraInfo;

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
  console.info(TAG, 'mCameraManager created successfully.');
  return true;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray.length);
  return true;
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray.length) {
    mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
    if (isEmpty(mCameraInput)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}

let callbackOn = (err: BusinessError) => {
  console.error(TAG, `Camera input error code: ${err.code}`);
  count = count + 1;
}

function getMainCameraInfo() {
  console.info(TAG, 'getMainCameraInfo.');
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  let cameraDevice = mCameraDeviceArray[0];
  mainBackCamera = {
    cameraType: cameraDevice.cameraType,
    lensIntrinsicCalibration: cameraDevice.lensIntrinsicCalibration,
    connectionType: cameraDevice.connectionType,
    cameraPosition: cameraDevice.cameraPosition,
    cameraId: cameraDevice.cameraId,
    lensDistortion: cameraDevice.lensDistortion,
    sensorPixelArraySize: cameraDevice.sensorPixelArraySize,
    isRetractable: cameraDevice.isRetractable,
    minimumFocusDistance: cameraDevice.minimumFocusDistance,
    automotiveCameraPosition: cameraDevice.automotiveCameraPosition,
    hostDeviceName: cameraDevice.hostDeviceName,
    cameraOrientation: cameraDevice.cameraOrientation,
    lensFocalLength: cameraDevice.lensFocalLength,
    isLogicalCamera: cameraDevice.isLogicalCamera,
    lensEquivalentFocalLength: cameraDevice.lensEquivalentFocalLength,
    hostDeviceType: cameraDevice.hostDeviceType,
    sensorPhysicalSize: cameraDevice.sensorPhysicalSize,
    sensorColorFilterArrangement: cameraDevice.sensorColorFilterArrangement,
    constituentCameraDevices: cameraDevice.constituentCameraDevices
  }
  return true;
}

export default function CameraInputOnerrorTest() {
  describe('CameraInputOnerrorTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getMainCameraInfo();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
    });

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014
     * @tc.desc   CameraInput -off_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.off(null, useDevice[0]);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015
     * @tc.desc   CameraInput -off_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.off(undefined, useDevice[0]);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016
     * @tc.desc   CameraInput -off_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.off('error', null);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017
     * @tc.number SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017
     * @tc.desc   CameraInput -off_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_OFF_ERROR_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.off('error', undefined);
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001
     * @tc.desc   CameraInput -on_error -cameraId -" ".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = {
        cameraId: " ",
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002
     * @tc.desc   CameraInput -on_error -hostDeviceName -" ".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: " ",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003
     * @tc.desc   CameraInput -on_error -cameraPosition -CAMERA_POSITION_UNSPECIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004
     * @tc.desc   CameraInput -on_error -cameraPosition -CAMERA_POSITION_BACK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_004';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005
     * @tc.desc   CameraInput -on_error -cameraPosition -CAMERA_POSITION_FOLD_INNER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_005';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FOLD_INNER,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006
     * @tc.desc   CameraInput -on_error -connectionType -CAMERA_CONNECTION_USB_PLUGIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_006';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007
     * @tc.desc   CameraInput -on_error -connectionType -CAMERA_CONNECTION_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_007';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: camera.ConnectionType.CAMERA_CONNECTION_REMOTE,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_008';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_ULTRA_WIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_009';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_TELEPHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_010';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TELEPHOTO,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_TRUE_DEPTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_011';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: camera.CameraType.CAMERA_TYPE_TRUE_DEPTH,
        hostDeviceType: 0,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012
     * @tc.desc   CameraInput -on_error -hostDeviceType -PHONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_012';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.PHONE,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013
     * @tc.desc   CameraInput -on_error -hostDeviceType -TABLET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_013';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let res = mCameraManager.getSupportedCameras();
      let useDevice: camera.CameraDevice = {
        cameraId: res[0].cameraId,
        cameraPosition: 2,
        connectionType: 0,
        hostDeviceName: "",
        cameraType: 1,
        hostDeviceType: camera.HostDeviceType.TABLET,
        lensEquivalentFocalLength: [],
        cameraOrientation: 0,
        isRetractable: false
      }
      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014
     * @tc.desc   CameraInput -on_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_014';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.on(null, useDevice[0], (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015
     * @tc.desc   CameraInput -on_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_015';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      let useDevice = mCameraManager.getSupportedCameras();
      try {
        mCameraInput.on(undefined, useDevice[0], (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016
     * @tc.desc   CameraInput -on_error -null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_016';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.on('error', null, (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017
     * @tc.desc   CameraInput -on_error -undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_017';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      getCameraInput();
      try {
        mCameraInput.on('error', undefined, (err: BusinessError) => {
          console.error(TAG, testName, `Camera input error code: ${err.code}`);
        });
        console.info(TAG, testName, 'Success');
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect(Number(err.code)).assertEqual(7400101);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1800
     * @tc.number SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1800
     * @tc.desc   CameraInput -on_error -cameraPosition -CAMERA_POSITION_FRONT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1800', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1800';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.cameraPosition = camera.CameraPosition.CAMERA_POSITION_FRONT

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1900
     * @tc.number SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1900
     * @tc.desc   CameraInput -on_error -cameraPosition - -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1900', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_CAMERA_POSITION_ERROR_1900';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.cameraPosition = -1

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_CAMERA_TYPE_ON_ERROR_0100
     * @tc.number SUB_CAMERA_CAMERA_INPUT_CAMERA_TYPE_ON_ERROR_0100
     * @tc.desc   CameraInput -on_error -cameraType -CAMERA_TYPE_WIDE_ANGLE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_CAMERA_TYPE_ON_ERROR_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_CAMERA_TYPE_ON_ERROR_0100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.cameraType = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0200
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0200
     * @tc.desc   CameraInput -on_error -cameraType - -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.cameraType = -1

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0300
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0300
     * @tc.desc   CameraInput -on_error -connectionType -CAMERA_CONNECTION_BUILT_IN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0300';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.connectionType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0400
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0400
     * @tc.desc   CameraInput -on_error -connectionType - -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0400';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.connectionType = -1

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0500
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0500
     * @tc.desc   CameraInput -on_error -hostDeviceType -UNKNOWN_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0500', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0500';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.hostDeviceType = camera.HostDeviceType.UNKNOWN_TYPE

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0600
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0600
     * @tc.desc   CameraInput -on_error -hostDeviceType - -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0600', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0600';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.hostDeviceType = -1

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0700
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0700
     * @tc.desc   CameraInput -on_error -hostDeviceName - empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0700', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0700';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.hostDeviceName = ""

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0800
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0800
     * @tc.desc   CameraInput -on_error -lensEquivalentFocalLength - not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0800', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0800';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.lensEquivalentFocalLength = [13]

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0900
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0900
     * @tc.desc   CameraInput -on_error -isLogicalCamera - true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0900', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_0900';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.isLogicalCamera = true

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1000
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1000
     * @tc.desc   CameraInput -on_error -isLogicalCamera - false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1000', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1000';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.isLogicalCamera = false

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1100
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1100
     * @tc.desc   CameraInput -on_error -constituentCameraDevices - null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.constituentCameraDevices = []

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1200
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1200
     * @tc.desc   CameraInput -on_error -cameraId - empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.cameraId = ""

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1300
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1300
     * @tc.desc   CameraInput -on_error -lensDistortion - null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1300';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.lensDistortion = []

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1400
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1400
     * @tc.desc   CameraInput -on_error -lensIntrinsicCalibration - null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1400';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.lensIntrinsicCalibration = []

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1500
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1500
     * @tc.desc   CameraInput -on_error -sensorPhysicalSize - null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1500', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1500';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.sensorPhysicalSize = []

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1600
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1600
     * @tc.desc   CameraInput -on_error -sensorPixelArraySize - null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1600', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1600';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.sensorPixelArraySize = []

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1700
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1700
     * @tc.desc   CameraInput -on_error -sensorColorFilterArrangement - BGGR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1700', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1700';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.sensorColorFilterArrangement = camera.SensorColorFilterArrangement.BGGR

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1800
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1800
     * @tc.desc   CameraInput -on_error -sensorColorFilterArrangement - GBRG.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1800', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1800';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.sensorColorFilterArrangement = camera.SensorColorFilterArrangement.GBRG

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1900
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1900
     * @tc.desc   CameraInput -on_error -sensorColorFilterArrangement - GRBG.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1900', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_1900';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.sensorColorFilterArrangement = camera.SensorColorFilterArrangement.GRBG

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2000
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2000
     * @tc.desc   CameraInput -on_error -sensorColorFilterArrangement - RGGB.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2000', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2000';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.sensorColorFilterArrangement = camera.SensorColorFilterArrangement.RGGB

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2100
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2100
     * @tc.desc   CameraInput -on_error -sensorColorFilterArrangement - -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let useDevice = mainBackCamera
      useDevice.sensorColorFilterArrangement = -1

      try {
        getCameraInput();
        mCameraInput.on('error', useDevice, callbackOn);
        await mCameraInput.open();
        await mCameraInput.open();
        mCameraInput.off('error', useDevice, callbackOn);
        console.info(TAG, testName, 'Success', count);
        expect(count == 1).assertTrue();
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        await mCameraInput?.close();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2200
     * @tc.number SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2200
     * @tc.desc   CameraInput -on_error -automotiveCameraPosition - all enum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAMERA_INPUT_ON_ERROR_2200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      let automotiveCameraPositionArray = [
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_OTHER,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_FRONT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_REAR,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_LEFT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_EXTERIOR_RIGHT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_OTHER,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_LEFT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_CENTER,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_1_RIGHT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_LEFT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_CENTER,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_2_RIGHT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_LEFT,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_CENTER,
        camera.AutomotiveCameraPosition.AUTOMOTIVE_CAMERA_POSITION_INTERIOR_ROW_3_RIGHT,
        -1
      ]

      try {
        for (let pos of automotiveCameraPositionArray) {
          count = 0
          let useDevice = mainBackCamera
          useDevice.sensorColorFilterArrangement = pos
  
          getCameraInput();
          mCameraInput.on('error', useDevice, callbackOn);
          await mCameraInput.open();
          await mCameraInput.open();
          mCameraInput.off('error', useDevice, callbackOn);
          console.info(TAG, testName, 'Success', count);
          expect(count == 1).assertTrue();
          await mCameraInput?.close();
        }
      } catch (err) {
        console.error(TAG, testName, 'Failed', err, err.code);
        expect().assertFail();
      } finally {
        count = 0;
        done();
      }
    })

  })
}