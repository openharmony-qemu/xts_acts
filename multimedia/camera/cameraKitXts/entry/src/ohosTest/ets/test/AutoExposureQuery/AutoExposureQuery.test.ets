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
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = 'AutoExposureQueryTest: ';
const INVALID_PARAMETER_CODE: number = 7400101;
const SESSION_NOT_CONFIG_CODE: number = 7400103;

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

export default function AutoExposureQueryTest() {
  describe('AutoExposureQueryTest', () => {
    console.info(TAG + '----------AutoExposureQueryTest--------------');

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

// ═════════════════════════════════════════════════════════════════
// isExposureModeSupported
// ═════════════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0100
     * @tc.desc   Verify isExposureModeSupported traverses all ExposureMode values in running state and returns boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0100';
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
          for (let i: number = 0; i < modes.length; i++) {
            let firstSupported: boolean = mPhotoSession.isExposureModeSupported(modes[i]);
            let secondSupported: boolean = mPhotoSession.isExposureModeSupported(modes[i]);
            console.info(TAG + caseName + ' mode=' + modes[i] + ' supported=' + firstSupported);
            expect(typeof firstSupported === 'boolean').assertTrue();
            expect(secondSupported).assertEqual(firstSupported);
          }
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0200
     * @tc.desc   Verify null aeMode does not throw and returns boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let didThrow: boolean = false;
          let result: boolean = false;
          try {
            result = mPhotoSession.isExposureModeSupported(null as ESObject);
          } catch (err) {
            didThrow = true;
            console.info(TAG + caseName + ' threw code: ' + Number((err as BusinessError).code));
          }
          expect(didThrow).assertFalse();
          expect(typeof result === 'boolean').assertTrue();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0300
     * @tc.desc   Verify undefined aeMode does not throw and returns boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0300', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0300';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let didThrow: boolean = false;
          let result: boolean = false;
          try {
            result = mPhotoSession.isExposureModeSupported(undefined as ESObject);
          } catch (err) {
            didThrow = true;
            console.info(TAG + caseName + ' threw code: ' + Number((err as BusinessError).code));
          }
          expect(didThrow).assertFalse();
          expect(typeof result === 'boolean').assertTrue();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0400
     * @tc.desc   Verify isExposureModeSupported reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0400', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_IS_EXPOSURE_MODE_SUPPORTED_0400';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO);
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

// ═════════════════════════════════════════════════════════════════
// getExposureBiasRange
// ═════════════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0100
     * @tc.desc   Verify getExposureBiasRange returns Array<number> with two ordered members in running state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0100', Level.LEVEL1,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0100';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          await photoSessionCommitConfig(caseName);
          await mPhotoSession.start();
          await sleep(COMMON_WAIT_DURATION);
          let firstRange: Array<number> = mPhotoSession.getExposureBiasRange();
          let secondRange: Array<number> = mPhotoSession.getExposureBiasRange();
          console.info(TAG + caseName + ' range=[' + firstRange[0] + ',' + firstRange[1] + ']');
          expect(firstRange.length).assertEqual(2);
          expect(firstRange[0]).assertLessOrEqual(firstRange[1]);
          expect(secondRange.length).assertEqual(firstRange.length);
          expect(secondRange[0]).assertEqual(firstRange[0]);
          expect(secondRange[1]).assertEqual(firstRange[1]);
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' FAILED: code=' + Number(error.code) + ', message=' + error.message);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0200
     * @tc.desc   Verify getExposureBiasRange reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0200', Level.LEVEL2,
      async (done: () => void) => {
        let caseName: string = 'SUB_MULTIMEDIA_CAMERA_AUTO_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_RANGE_0200';
        try {
          if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
          let errorCode: number = -1;
          try {
            mPhotoSession.getExposureBiasRange();
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
