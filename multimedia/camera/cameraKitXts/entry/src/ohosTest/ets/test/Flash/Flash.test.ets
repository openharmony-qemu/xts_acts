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

const TAG = 'FlashTest: ';
const SESSION_NOT_CONFIG_CODE: number = 7400103;

let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCap: camera.CameraOutputCapability;
let mPreviewProfile: camera.Profile;
let mPreviewOutput: camera.PreviewOutput | null;
let mPhotoSession: camera.PhotoSession;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

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

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera output cap: ' + JSON.stringify(mCameraOutputCap));
  mPreviewProfile = mCameraOutputCap.previewProfiles[0];
  expect(isEmpty(mPreviewProfile)).assertFalse();
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

function getPhotoSession() {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
}

async function photoSessionCommitConfig(caseName: string) {
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

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  try { await mPreviewOutput?.release(); } catch (e) { console.error(TAG, 'release mPreviewOutput err: ' + Number((e as BusinessError).code)); }
  try { await mPhotoSession?.release(); } catch (e) { console.error(TAG, 'release mPhotoSession err: ' + Number((e as BusinessError).code)); }
}

export default function FlashTest() {
  describe('FlashTest', () => {
    console.info(TAG + '----------FlashTest--------------');

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
//  setFlashMode
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0100
     * @tc.desc   Verify each supported FlashMode can be applied and queried back via getFlashMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0100', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0100';
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
        await photoSessionCommitConfig(caseName);
        await mPhotoSession.start();
        await sleep(COMMON_WAIT_DURATION);
        let hasFlashLight: boolean = mPhotoSession.hasFlash();
        console.info(TAG + caseName + ' hasFlash=' + hasFlashLight);
        if (!hasFlashLight) {
          console.info(TAG + caseName + ' device has no flash, skip.');
          return;
        }
        let supportedCount: number = 0;
        let modes: Array<camera.FlashMode> = [
          camera.FlashMode.FLASH_MODE_CLOSE,
          camera.FlashMode.FLASH_MODE_OPEN,
          camera.FlashMode.FLASH_MODE_AUTO,
          camera.FlashMode.FLASH_MODE_ALWAYS_OPEN
        ];
        for (let i: number = 0; i < modes.length; i++) {
          let supported: boolean = mPhotoSession.isFlashModeSupported(modes[i]);
          console.info(TAG + caseName + ' mode=' + modes[i] + ' supported=' + supported);
          if (supported) {
            mPhotoSession.setFlashMode(modes[i]);
            let current: camera.FlashMode = mPhotoSession.getFlashMode();
            console.info(TAG + caseName + ' set=' + modes[i] + ' get=' + current);
            expect(current).assertEqual(modes[i]);
            supportedCount++;
          }
        }
        expect(supportedCount).assertLarger(0);
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + Number(error.code) + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0200
     * @tc.desc   Verify null input follows the documented FLASH_MODE_CLOSE fallback behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0200', Level.LEVEL2, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0200';
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
        await photoSessionCommitConfig(caseName);
        await mPhotoSession.start();
        await sleep(COMMON_WAIT_DURATION);
        let hasFlashLight: boolean = mPhotoSession.hasFlash();
        if (!hasFlashLight) {
          console.info(TAG + caseName + ' device has no flash, skip.');
          return;
        }
        mPhotoSession.setFlashMode(camera.FlashMode.FLASH_MODE_CLOSE);
        let closeMode: camera.FlashMode = mPhotoSession.getFlashMode();
        mPhotoSession.setFlashMode(null as ESObject);
        let nullMode: camera.FlashMode = mPhotoSession.getFlashMode();
        console.info(TAG + caseName + ' close=' + closeMode + ' null=' + nullMode);
        expect(nullMode).assertEqual(closeMode);
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + Number(error.code) + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0300
     * @tc.desc   Verify undefined input follows the documented FLASH_MODE_CLOSE fallback behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0300', Level.LEVEL2, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0300';
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
        await photoSessionCommitConfig(caseName);
        await mPhotoSession.start();
        await sleep(COMMON_WAIT_DURATION);
        let hasFlashLight: boolean = mPhotoSession.hasFlash();
        if (!hasFlashLight) {
          console.info(TAG + caseName + ' device has no flash, skip.');
          return;
        }
        mPhotoSession.setFlashMode(camera.FlashMode.FLASH_MODE_CLOSE);
        let closeMode: camera.FlashMode = mPhotoSession.getFlashMode();
        mPhotoSession.setFlashMode(undefined as ESObject);
        let undefinedMode: camera.FlashMode = mPhotoSession.getFlashMode();
        console.info(TAG + caseName + ' close=' + closeMode + ' undefined=' + undefinedMode);
        expect(undefinedMode).assertEqual(closeMode);
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + Number(error.code) + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0400
     * @tc.desc   Verify setFlashMode reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0400', Level.LEVEL2, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FLASH_SET_FLASH_MODE_0400';
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
        let errorCode: number = -1;
        try {
          mPhotoSession.setFlashMode(camera.FlashMode.FLASH_MODE_AUTO);
        } catch (err) {
          errorCode = Number((err as BusinessError).code);
        }
        console.info(TAG + caseName + ' error code: ' + errorCode);
        expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + Number(error.code) + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        done();
      }
    });

// ══════════════════════════════════════════════════════════
//  getFlashMode
// ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0100
     * @tc.desc   Verify getFlashMode returns the mode previously applied on an active session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0100', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0100';
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
        await photoSessionCommitConfig(caseName);
        await mPhotoSession.start();
        await sleep(COMMON_WAIT_DURATION);
        let hasFlash: boolean = mPhotoSession.hasFlash();
        if (!hasFlash) {
          console.info(TAG + caseName + ' device has no flash, skip.');
          return;
        }
        let modes: Array<camera.FlashMode> = [
          camera.FlashMode.FLASH_MODE_CLOSE,
          camera.FlashMode.FLASH_MODE_OPEN,
          camera.FlashMode.FLASH_MODE_AUTO,
          camera.FlashMode.FLASH_MODE_ALWAYS_OPEN
        ];
        let found: boolean = false;
        for (let i: number = 0; i < modes.length; i++) {
          if (mPhotoSession.isFlashModeSupported(modes[i])) {
            mPhotoSession.setFlashMode(modes[i]);
            let currentMode: camera.FlashMode = mPhotoSession.getFlashMode();
            console.info(TAG + caseName + ' set=' + modes[i] + ' get=' + currentMode);
            expect(currentMode).assertEqual(modes[i]);
            found = true;
            break;
          }
        }
        expect(found).assertTrue();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + Number(error.code) + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0200
     * @tc.desc   Verify getFlashMode returns a valid FlashMode value within the known enum range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0200', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0200';
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
        await photoSessionCommitConfig(caseName);
        await mPhotoSession.start();
        await sleep(COMMON_WAIT_DURATION);
        let mode: camera.FlashMode = mPhotoSession.getFlashMode();
        console.info(TAG + caseName + ' mode=' + mode);
        expect(Number(mode)).assertLargerOrEqual(0);
        expect(Number(mode)).assertLessOrEqual(3);
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + Number(error.code) + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0300
     * @tc.desc   Verify getFlashMode reports session-not-config (7400103) before commitConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0300', Level.LEVEL2, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FLASH_GET_FLASH_MODE_0300';
      try {
        if (isEmpty(mCameraManager) || isEmpty(mCameraDeviceArray)) { expect().assertFail(); return; }
        let errorCode: number = -1;
        try {
          mPhotoSession.getFlashMode();
        } catch (err) {
          errorCode = Number((err as BusinessError).code);
        }
        console.info(TAG + caseName + ' error code: ' + errorCode);
        expect(errorCode).assertEqual(SESSION_NOT_CONFIG_CODE);
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + Number(error.code) + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        done();
      }
    });

  });
}
