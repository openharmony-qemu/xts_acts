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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  closeFd,
  driveFn,
  getFd,
  getPermission,
  isEmpty,
  resourceName,
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';

const TAG = "xts.CameraPhotoOutputSuppTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
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

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
    if (mSupportedModes.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
    let foundProfile = cameraOutputCap.photoProfiles.find((indexPhotoProfile: camera.Profile) => {
      console.log(TAG, 'find photoProfile: w: ' + indexPhotoProfile.size.width + 'h: ' + indexPhotoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexPhotoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexPhotoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      photoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'photoProfile: w: ' + photoProfile.size.width + 'h: ' + photoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, indexSurfaceId);
  mPhotoOutput = mCameraManager.createPhotoOutput(photoProfile);
}
async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
}
async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

export default function CameraPhotoOutputSuppTest() {
  describe('CameraPhotoOutputSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });
    beforeEach(() => {
      console.info('afterEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(2000);
    });
    afterAll(async () => {
      console.info('afterAll case');
    });
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTOAUTOEXTENDEDGAINMAPDELIVERYSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTOAUTOEXTENDEDGAINMAPDELIVERYSUPPORTED_0100
     * @tc.desc   isAutoExtendedGainmapDeliverySupported normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOAUTOEXTENDEDGAINMAPDELIVERYSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PHOTOAUTOEXTENDEDGAINMAPDELIVERYSUPPORTED_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupport: boolean =mPhotoOutput.isAutoExtendedGainmapDeliverySupported();
        console.info(TAG, testName + `isAutoExtendedGainmapDeliverySupported = ${isSupport}`);
      } catch (error) {
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100
     * @tc.desc   enableAutoExtendedGainmapDelivery normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {

        let isSupport: boolean =mPhotoOutput.isAutoExtendedGainmapDeliverySupported();
        console.info(TAG, testName + `isAutoExtendedGainmapDeliverySupported = ${isSupport}`);
        if (isSupport) {
          mPhotoOutput.enableAutoExtendedGainmapDelivery(true);
          console.info(TAG, testName + ` enable success`);
        } else {
          console.info(TAG, testName + ` the device does not support extended gainmap delivery`);
        }
      } catch (error) {
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200
     * @tc.desc   enableAutoExtendedGainmapDelivery normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PHOTOENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {

        let isSupport: boolean = mPhotoOutput.isAutoExtendedGainmapDeliverySupported();
        console.info(TAG, testName + `isAutoExtendedGainmapDeliverySupported = ${isSupport}`);
        if (isSupport) {
          mPhotoOutput.enableAutoExtendedGainmapDelivery(false);
          console.info(TAG, testName + ` enable success`);
        } else {
          console.info(TAG, testName + ` the device does not support extended gainmap delivery`);
        }
      } catch (error) {
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100
     * @tc.desc   test camera enableAutoExtendedGainmapDelivery with paranm null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0100'
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);

          mPhotoOutput.enableAutoExtendedGainmapDelivery(null);

          }
      } catch (err) {
        console.error(TAG, testName, JSON.stringify(err), err.code);
        expect(Number(err.code)).assertEqual(401);
      } finally {
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200
     * @tc.desc   test camera enableAutoExtendedGainmapDelivery with paranm undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0200'
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);

          mPhotoOutput.enableAutoExtendedGainmapDelivery(undefined);

          }
      } catch (err) {
        console.error(TAG, testName, JSON.stringify(err), err.code);
        expect(Number(err.code)).assertEqual(401);
      } finally {
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0300
     * @tc.desc   test camera enableAutoExtendedGainmapDelivery with error code 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0300'
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoOutput.enableAutoExtendedGainmapDelivery(true);
          }
      } catch (err) {
        console.error(TAG, testName, JSON.stringify(err), err.code);
        expect(Number(err.code)).assertEqual(camera.CameraErrorCode.SESSION_NOT_CONFIG);
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0400
     * @tc.desc   test camera enableAutoExtendedGainmapDelivery with error code 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLEAUTOEXTENDEDGAINMAPDELIVERY_0400'
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          let isSupport: boolean =mPhotoOutput.isAutoExtendedGainmapDeliverySupported();
          console.info(TAG, testName + `isAutoExtendedGainmapDeliverySupported = ${isSupport}`);
          if (!isSupport) {
            mPhotoOutput.enableAutoExtendedGainmapDelivery(true);
            }
          }
      } catch (err) {
        console.error(TAG, testName, JSON.stringify(err), err.code);
        expect(Number(err.code)).assertEqual(camera.CameraErrorCode.OPERATION_NOT_ALLOWED);
      } finally {
        await releasePhotoSession();
        done();
      }
    })

  })
}