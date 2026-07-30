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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  COMMON_WAIT_DURATION,
  driveFn,
  getPermission,
  isEmpty,
  sleep,
  waitForTrigger
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = 'AutoExposureTest: ';
const INVALID_PARAMETER_CODE: number = 7400101;
const SESSION_NOT_CONFIG_CODE: number = 7400103;
const POINT_TOLERANCE: number = 0.05;
const EXPOSURE_TOLERANCE: number = 1;

let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCap: camera.CameraOutputCapability;
let mPreviewProfile: camera.Profile;
let mPreviewOutput: camera.PreviewOutput | null;
let mPhotoSession: camera.PhotoSession;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

function getCameraManager(): boolean {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
  console.info(TAG, 'mCameraManager created successfully.');
  return true;
}

function getSupportedCameraDeviceArray(): boolean {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray.length);
  return true;
}

function getOutputCapability(): void {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera output cap: ' + JSON.stringify(mCameraOutputCap));
  mPreviewProfile = mCameraOutputCap.previewProfiles[0];
  expect(isEmpty(mPreviewProfile)).assertFalse();
}

function getCameraInput(): boolean {
  console.info(TAG, 'getCameraInput.');
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

function getPhotoSession(): void {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
}

async function photoSessionCommitConfig(caseName: string): Promise<void> {
  console.info(TAG, 'photoSessionCommitConfig.');
  getCameraInput();
  mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
  mPhotoSession.beginConfig();
  console.info(TAG, caseName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, caseName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, caseName + ' camera open passed.');
  mPhotoSession.addOutput(mPreviewOutput);
  console.info(TAG, caseName + ' addOutput previewOutput passed.');
  await mPhotoSession.commitConfig();
  await sleep(COMMON_WAIT_DURATION);
  console.info(TAG, caseName + ' session commitConfig successfully.');
}

async function releasePhotoSession(): Promise<void> {
  console.info(TAG, 'releasePhotoSession.');
  try { await mPreviewOutput?.release(); } catch (e) { console.error(TAG, 'release mPreviewOutput err: ' + Number((e as BusinessError).code)); }
  try { await mPhotoSession?.release(); } catch (e) { console.error(TAG, 'release mPhotoSession err: ' + Number((e as BusinessError).code)); }
}

export default function AutoExposureTest() {
  describe('AutoExposureTest', () => {
    console.info(TAG + '----------AutoExposureTest--------------');

    beforeAll(async () => {
      console.info(TAG + 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      await getPermission();
      await driveFn();
      getOutputCapability();
    });

    beforeEach(async () => {
      console.info(TAG + 'beforeEach case.');
      await sleep(COMMON_WAIT_DURATION);
      getPhotoSession();
    });

    afterEach(async () => {
      console.info(TAG + 'afterEach case.');
      await releasePhotoSession();
      mPreviewOutput = null;
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(async () => {
      console.info(TAG + 'afterAll case.');
    });

// ══════════════════════════════════════════════════════════
//  getExposureMode
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0100
     * @tc.desc   Verify getExposureMode returns the mode previously applied on an active session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0100';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let modes: Array<camera.ExposureMode> = [
            camera.ExposureMode.EXPOSURE_MODE_LOCKED,
            camera.ExposureMode.EXPOSURE_MODE_AUTO,
            camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO
          ];
          let supportedMode: camera.ExposureMode = -1 as camera.ExposureMode;
          for (let i: number = 0; i < modes.length; i++) {
            if (mPhotoSession.isExposureModeSupported(modes[i])) {
              supportedMode = modes[i];
              break;
            }
          }
          console.info(TAG + caseName + ' supportedMode=' + supportedMode);
          expect(Number(supportedMode)).assertLarger(-1);
          mPhotoSession.setExposureMode(supportedMode);
          let currentMode: camera.ExposureMode = mPhotoSession.getExposureMode();
          console.info(TAG + caseName + ' setMode=' + supportedMode + ' getMode=' + currentMode);
          expect(currentMode).assertEqual(supportedMode);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0200
     * @tc.desc   Verify getExposureMode reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_MODE_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.getExposureMode();
          } catch (err) {
            errorCode = Number((err as BusinessError).code);
          }
          console.info(TAG + caseName + ' error code: ' + errorCode);
          expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

// ══════════════════════════════════════════════════════════
//  setExposureMode
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0100
     * @tc.desc   Verify each supported exposure mode can be applied and queried back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0100';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let supportedCount: number = 0;
          let modes: Array<camera.ExposureMode> = [
            camera.ExposureMode.EXPOSURE_MODE_LOCKED,
            camera.ExposureMode.EXPOSURE_MODE_AUTO,
            camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO
          ];
          for (let i: number = 0; i < modes.length; i++) {
            if (mPhotoSession.isExposureModeSupported(modes[i])) {
              mPhotoSession.setExposureMode(modes[i]);
              let current: camera.ExposureMode = mPhotoSession.getExposureMode();
              console.info(TAG + caseName + ' set=' + modes[i] + ' get=' + current);
              expect(current).assertEqual(modes[i]);
              supportedCount++;
            }
          }
          console.info(TAG + caseName + ' supportedCount=' + supportedCount);
          expect(supportedCount).assertLarger(0);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0200
     * @tc.desc   Verify setExposureMode reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO);
          } catch (err) {
            errorCode = Number((err as BusinessError).code);
          }
          console.info(TAG + caseName + ' error code: ' + errorCode);
          expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0300
     * @tc.desc   Verify setExposureMode with null input does not throw (silently accepted by implementation).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0300', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0300';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let didThrow: boolean = false;
          try {
            mPhotoSession.setExposureMode(null as ESObject);
          } catch (err) {
            didThrow = true;
            console.info(TAG + caseName + ' threw code: ' + Number((err as BusinessError).code));
          }
          expect(didThrow).assertFalse();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0400
     * @tc.desc   Verify setExposureMode with undefined input does not throw (silently accepted by implementation).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0400', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_MODE_0400';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let didThrow: boolean = false;
          try {
            mPhotoSession.setExposureMode(undefined as ESObject);
          } catch (err) {
            didThrow = true;
            console.info(TAG + caseName + ' threw code: ' + Number((err as BusinessError).code));
          }
          expect(didThrow).assertFalse();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

// ══════════════════════════════════════════════════════════
//  getMeteringPoint
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0100
     * @tc.desc   Verify getMeteringPoint returns normalized coordinates on an active session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0100';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let point: camera.Point = mPhotoSession.getMeteringPoint();
          console.info(TAG + caseName + ' x=' + point.x + ' y=' + point.y);
          expect(point.x).assertLargerOrEqual(0);
          expect(point.x).assertLessOrEqual(1);
          expect(point.y).assertLargerOrEqual(0);
          expect(point.y).assertLessOrEqual(1);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0200
     * @tc.desc   Verify getMeteringPoint reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_METERING_POINT_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.getMeteringPoint();
          } catch (err) {
            errorCode = Number((err as BusinessError).code);
          }
          console.info(TAG + caseName + ' error code: ' + errorCode);
          expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

// ══════════════════════════════════════════════════════════
//  setMeteringPoint
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0100
     * @tc.desc   Verify setMeteringPoint applies a normalized point and can be queried back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0100';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let testPoint: camera.Point = { x: 0.5, y: 0.5 };
          mPhotoSession.setMeteringPoint(testPoint);
          let result: camera.Point = mPhotoSession.getMeteringPoint();
          console.info(TAG + caseName + ' setX=0.5 setY=0.5 getX=' + result.x + ' getY=' + result.y);
          expect(Math.abs(result.x - testPoint.x) <= POINT_TOLERANCE).assertTrue();
          expect(Math.abs(result.y - testPoint.y) <= POINT_TOLERANCE).assertTrue();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0200
     * @tc.desc   Verify setMeteringPoint reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.setMeteringPoint({ x: 0.5, y: 0.5 });
          } catch (err) {
            errorCode = Number((err as BusinessError).code);
          }
          console.info(TAG + caseName + ' error code: ' + errorCode);
          expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0300
     * @tc.desc   Verify setMeteringPoint with null input does not throw (silently accepted by implementation).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0300', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0300';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let didThrow: boolean = false;
          try {
            mPhotoSession.setMeteringPoint(null as ESObject);
          } catch (err) {
            didThrow = true;
            console.info(TAG + caseName + ' threw code: ' + Number((err as BusinessError).code));
          }
          expect(didThrow).assertFalse();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0400
     * @tc.desc   Verify setMeteringPoint with undefined input does not throw (silently accepted by implementation).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0400', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0400';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let didThrow: boolean = false;
          try {
            mPhotoSession.setMeteringPoint(undefined as ESObject);
          } catch (err) {
            didThrow = true;
            console.info(TAG + caseName + ' threw code: ' + Number((err as BusinessError).code));
          }
          expect(didThrow).assertFalse();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0500
     * @tc.desc   Verify out-of-range metering coordinates are clamped into the supported boundary range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0500', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_METERING_POINT_0500';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          mPhotoSession.setMeteringPoint({ x: -0.2, y: 1.4 });
          let result: camera.Point = mPhotoSession.getMeteringPoint();
          console.info(TAG + caseName + ' clamp x=' + result.x + ' y=' + result.y);
          expect(result.x).assertLargerOrEqual(0);
          expect(result.x).assertLessOrEqual(POINT_TOLERANCE);
          expect(result.y).assertLargerOrEqual(1 - POINT_TOLERANCE);
          expect(result.y).assertLessOrEqual(1);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

// ══════════════════════════════════════════════════════════
//  setExposureBias
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0100
     * @tc.desc   Verify setExposureBias applies a valid bias within the supported range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0100';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let biasRange: Array<number> = mPhotoSession.getExposureBiasRange();
          console.info(TAG + caseName + ' biasRange=' + JSON.stringify(biasRange));
          expect(biasRange.length).assertLargerOrEqual(2);
          let testBias: number = biasRange[0];
          mPhotoSession.setExposureBias(testBias);
          let currentValue: number = mPhotoSession.getExposureValue();
          console.info(TAG + caseName + ' setBias=' + testBias + ' getValue=' + currentValue);
          expect(currentValue).assertLargerOrEqual(biasRange[0]);
          expect(currentValue).assertLessOrEqual(biasRange[biasRange.length - 1]);
          expect(Math.abs(currentValue - testBias) <= EXPOSURE_TOLERANCE).assertTrue();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0200
     * @tc.desc   Verify setExposureBias reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.setExposureBias(0);
          } catch (err) {
            errorCode = Number((err as BusinessError).code);
          }
          console.info(TAG + caseName + ' error code: ' + errorCode);
          expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0300
     * @tc.desc   Verify out-of-range bias values are clamped to the nearest supported boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0300', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0300';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let biasRange: Array<number> = mPhotoSession.getExposureBiasRange();
          expect(biasRange.length).assertLargerOrEqual(2);
          let minBias: number = biasRange[0];
          let maxBias: number = biasRange[biasRange.length - 1];
          mPhotoSession.setExposureBias(maxBias + 5);
          let highValue: number = mPhotoSession.getExposureValue();
          console.info(TAG + caseName + ' high clamp: set=' + (maxBias + 5) + ' get=' + highValue);
          expect(highValue).assertLargerOrEqual(minBias);
          expect(highValue).assertLessOrEqual(maxBias);
          expect(Math.abs(highValue - maxBias) <= EXPOSURE_TOLERANCE).assertTrue();
          mPhotoSession.setExposureBias(minBias - 5);
          let lowValue: number = mPhotoSession.getExposureValue();
          console.info(TAG + caseName + ' low clamp: set=' + (minBias - 5) + ' get=' + lowValue);
          expect(lowValue).assertLargerOrEqual(minBias);
          expect(lowValue).assertLessOrEqual(maxBias);
          expect(Math.abs(lowValue - minBias) <= EXPOSURE_TOLERANCE).assertTrue();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0400
     * @tc.desc   Verify non-step bias input produces an effective value within the supported range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0400', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_SET_EXPOSURE_BIAS_0400';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let biasRange: Array<number> = mPhotoSession.getExposureBiasRange();
          expect(biasRange.length).assertLargerOrEqual(2);
          let minBias: number = biasRange[0];
          let maxBias: number = biasRange[biasRange.length - 1];
          let requestedBias: number = Math.min(maxBias, Math.max(minBias, (minBias + maxBias) / 2 + 0.2));
          let beforeValue: number = mPhotoSession.getExposureValue();
          mPhotoSession.setExposureBias(requestedBias);
          await waitForTrigger((): boolean => {
            let currentValue: number = mPhotoSession.getExposureValue();
            return Math.abs(currentValue - beforeValue) > 0.01;
          }, 3000, 100);
          let effectiveValue: number = mPhotoSession.getExposureValue();
          console.info(TAG + caseName + ' requested=' + requestedBias + ' effective=' + effectiveValue);
          expect(effectiveValue).assertLargerOrEqual(minBias);
          expect(effectiveValue).assertLessOrEqual(maxBias);
          expect(Math.abs(effectiveValue - requestedBias) <= EXPOSURE_TOLERANCE).assertTrue();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

// ══════════════════════════════════════════════════════════
//  getExposureValue
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0100
     * @tc.desc   Verify getExposureValue returns a value within the supported bias range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0100';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let biasRange: Array<number> = mPhotoSession.getExposureBiasRange();
          expect(biasRange.length).assertLargerOrEqual(2);
          let value: number = mPhotoSession.getExposureValue();
          console.info(TAG + caseName + ' value=' + value + ' range=[' + biasRange[0] + ',' + biasRange[biasRange.length - 1] + ']');
          expect(value).assertLargerOrEqual(biasRange[0]);
          expect(value).assertLessOrEqual(biasRange[biasRange.length - 1]);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0200
     * @tc.desc   Verify getExposureValue reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_GET_EXPOSURE_VALUE_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.getExposureValue();
          } catch (err) {
            errorCode = Number((err as BusinessError).code);
          }
          console.info(TAG + caseName + ' error code: ' + errorCode);
          expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
