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
  driveFn,
  getPermission,
  isEmpty,
  getFd,
  resourceName,
} from '../common';
import { media } from '@kit.MediaKit';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = 'FocusTest: ';
const INVALID_PARAMETER_CODE: number = 401;
const SESSION_NOT_CONFIG_CODE: number = 7400103;

let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mCameraInput: camera.CameraInput;
let mVideoSurfaceId: string;
let mPreviewOutput: camera.PreviewOutput | null;
let mPhotoOutput: camera.PhotoOutput;
let mPhotoSession: camera.PhotoSession;
let mVideoOutput: camera.VideoOutput | null;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
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

function getCameraInput(cameraNum: number) {
  console.info(TAG, 'getCameraInput.');
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[cameraNum]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

async function createVideoOutput(cameraNum: number) {
  await getVideoSurfaceId();
  let useDevice: camera.CameraDevice = mCameraDeviceArray[cameraNum];
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let mvideoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
    let foundProfile = cameraOutputCap.videoProfiles.find((indexVideoProfile: camera.Profile) => {
      console.log(TAG, 'find videoProfile: w: ' + indexVideoProfile.size.width + 'h: ' + indexVideoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexVideoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexVideoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      mvideoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'videoProfile: w: ' + mvideoProfile.size.width + 'h: ' + mvideoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  CameraVideoProfile.videoFrameWidth = mvideoProfile.size.width;
  CameraVideoProfile.videoFrameHeight = mvideoProfile.size.height;
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, indexSurfaceId);
  console.log(TAG, 'createVideoOutput' + mvideoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager.createVideoOutput(mvideoProfile, mVideoSurfaceId);
  console.log(TAG, 'create preview output' + mPreviewOutput, 'createVideoOutput', mVideoOutput);
}

function createPhotoOutput(cameraNum: number) {
  let useDevice: camera.CameraDevice = mCameraDeviceArray[cameraNum];
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

async function photoSessionCommitConfig(caseName: string, cameraNum: number) {
  console.info(TAG, 'photoSessionCommitConfig.');
  getCameraInput(cameraNum);
  createPhotoOutput(cameraNum);
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession.beginConfig();
  console.info(TAG, caseName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, caseName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, caseName + ' camera open passed.');
  mPhotoSession.addOutput(mPreviewOutput);
  console.info(TAG, caseName + ' addOutput previewOutput passed.');
  await mPhotoSession.commitConfig();
  console.info(TAG, caseName + ' session commitConfig successfully.');
}

async function photoSessionWithoutCommitConfig(caseName: string, cameraNum: number) {
  console.info(TAG, 'photoSessionCommitConfig.');
  getCameraInput(cameraNum);
  createPhotoOutput(cameraNum);
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession.beginConfig();
  console.info(TAG, caseName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, caseName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, caseName + ' camera open passed.');
  mPhotoSession.addOutput(mPreviewOutput);
  console.info(TAG, caseName + ' addOutput previewOutput passed.');
}

let CameraVideoProfile: media.AVRecorderProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  audioSampleRate: 48000,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 2000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
};

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: 0,
  profile: CameraVideoProfile,
  url: 'file://',
  location: { latitude: 30, longitude: 130 } as camera.Location,
  rotation: 0
};

async function getVideoSurfaceId() {
  console.info(TAG, 'getVideoSurfaceId begin.');
  let fileName: string = resourceName();
  fdNumber = await getFd(fileName);
  fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmpty(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder.state);
  await mAVRecorder.prepare(videoConfig).then(() => {
    console.info('prepare success');
  }).catch((error: BusinessError) => {
    console.error(TAG, 'failed to prepare, err: ' + error.code + ', msg: ' + error.message);
  });
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder.state);
  mVideoSurfaceId = await mAVRecorder.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}

async function videoSessionCommitConfig(testName: string, cameraNum: number) {
  console.info(TAG, 'videoSessionCommitConfig.');
  getCameraInput(cameraNum);
  await createVideoOutput(cameraNum);
  mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
  mVideoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession.addOutput(mPreviewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession.addOutput(mVideoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  try { await mPreviewOutput?.release(); } catch (e) { console.error(TAG, 'release mPreviewOutput err: ' + (e as BusinessError).code); }
  try { await mPhotoSession?.release(); } catch (e) { console.error(TAG, 'release mPhotoSession err: ' + (e as BusinessError).code); }
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

export default function CameraLockFocusTest() {
  describe('CameraLockFocusTest', () => {
    console.info(TAG + '----------FocusTest--------------');

    beforeAll(async () => {
      console.info(TAG + 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      await getPermission();
      await driveFn();
      await getVideoSurfaceId();
    });

    beforeEach(async () => {
      console.info(TAG + 'beforeEach case.');
    });

    afterEach(async () => {
      console.info(TAG + 'afterEach case.');
    });

    afterAll(async () => {
      console.info(TAG + 'afterAll case.');
    });

    // ══════════════════════════════════════════════════════════
    //  isLockFocusTrackingSupported
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0100
     * @tc.desc   photoSession isLockFocusTrackingSupported retrun true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0100', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0100';
      try {
        for (let i = 0; i < 2; i++) {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          expect(typeof(isSupported) === "boolean").assertTrue();
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          mPhotoSession.lockFocusTracking({ x: 0.0, y: 0.0 });
          mPhotoSession.unlockFocusTracking();
          await releasePhotoSession();
        }
      } catch (err) {
        let error = err;
        console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releasePhotoSession();
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0200
     * @tc.desc   photoSession isLockFocusTrackingSupported retrun false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0200', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0200';
      try {
        for (let i = 0; i < 2; i++) {
          if (mCameraDeviceArray.length == 1 && i == 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return;
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          expect(typeof(isSupported) === "boolean").assertTrue();
          if (isSupported) {
            console.info(`${caseName} is supported lock focus tracking`);
            done();
            return;
          }
          const points = [0, 0.5, 1];
          for (let x of points) {
            for (let y of points) {
              console.info(`${caseName} focus point is {${x}, ${y}}`);
              mPhotoSession.lockFocusTracking({x, y});
            }
          }
          mPhotoSession.unlockFocusTracking();
          console.info(`${caseName} unlockFocusTracking`);
        }
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0300
     * @tc.desc   photoSession isLockFocusTrackingSupported not beginConfig, error code is 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0300', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0300';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          console.info(`${caseName} mPhotoSession.start`);
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          expect().assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect(err.code).assertEqual(SESSION_NOT_CONFIG_CODE);
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0400
     * @tc.desc   videoSession isLockFocusTrackingSupported retrun true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0400', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0400';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await videoSessionCommitConfig(caseName, i);
          await mVideoSession.start();
          let isSupported = await mVideoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          expect(typeof(isSupported) === "boolean").assertTrue();
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          mVideoSession.lockFocusTracking({ x: 0.0, y: 0.0 });
          mVideoSession.unlockFocusTracking();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        }
      }
      await releaseVideoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0500
     * @tc.desc   videoSession isLockFocusTrackingSupported retrun false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0500', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0500';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await videoSessionCommitConfig(caseName, i);
          await mVideoSession.start();
          let isSupported = await mVideoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          expect(typeof(isSupported) === "boolean").assertTrue();
          if (isSupported) {
            console.info(`${caseName} is supported lock focus tracking`);
            done();
            return;
          }
          const points = [0, 0.5, 1];
          for (let x of points) {
            for (let y of points) {
              console.info(`${caseName} focus point is {${x}, ${y}}`);
              mVideoSession.lockFocusTracking({x, y});
            }
          }
          mVideoSession.unlockFocusTracking();
          await releaseVideoSession();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          await releaseVideoSession();
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0600
     * @tc.desc   videoSession isLockFocusTrackingSupported not beginConfig, error code is 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0600', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_IS_LOCK_FOCUS_TRACKING_SUPPORTED_0600';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
          console.info(`${caseName} mVideoSession.start`);
          let isSupported = await mVideoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          expect().assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          await mVideoSession?.release(); 
          expect(err.code).assertEqual(SESSION_NOT_CONFIG_CODE);
        }
      }    
      done();
    });

    // ══════════════════════════════════════════════════════════
    //  lockFocusTracking
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0100
     * @tc.desc   lockFocusTracking normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0100', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0100';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          const points = [0, 0.5, 1];
          for (let x of points) {
            for (let y of points) {
              console.info(`${caseName} focus point is {${x}, ${y}}`);
              mPhotoSession.lockFocusTracking({x, y});
            }
          }
          mPhotoSession.unlockFocusTracking();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0200
     * @tc.desc   lockFocusTracking null, error code is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0200', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0200';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          mPhotoSession.lockFocusTracking(null);
          mPhotoSession.unlockFocusTracking();
          expect().assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect(err.code).assertEqual(INVALID_PARAMETER_CODE);
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0300
     * @tc.desc   lockFocusTracking undefined, error code is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0300', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0300';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          mPhotoSession.lockFocusTracking(undefined);
          mPhotoSession.unlockFocusTracking();
          expect().assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect(err.code).assertEqual(INVALID_PARAMETER_CODE);
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0400
     * @tc.desc   lockFocusTracking not commit, error code is 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0400', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0400';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionWithoutCommitConfig(caseName, i);
          console.info(`${caseName} start`);
          mPhotoSession.lockFocusTracking({ x: 0.0, y: 0.0 });
          expect().assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect(err.code).assertEqual(SESSION_NOT_CONFIG_CODE);
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0500
     * @tc.desc   lockFocusTracking invalid parameter, error code is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0500', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0500';
      try {
        for (let i = 0; i < 2; i++) {
          if (mCameraDeviceArray.length == 1 && i == 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          const points = [0, -1, 2];
          for (let x of points) {
            for (let y of points) {
              try {
              if (x === 0 && y === 0) continue;
              console.info(`${caseName} focus point is {${x}, ${y}}`);
              mPhotoSession.lockFocusTracking({x, y});
                expect().assertFail();
              } catch (err) {
                let error: BusinessError = err as BusinessError;
                console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
                expect(err.code).assertEqual(INVALID_PARAMETER_CODE);
              }
            }
          }
          mPhotoSession.unlockFocusTracking();
        }
      } catch (err) {
        console.error(TAG + caseName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0600
     * @tc.desc   lockFocusTracking twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0600', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_LOCK_FOCUES_TRACKING_0600';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          console.info(`${caseName} start`);
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          mPhotoSession.lockFocusTracking({ x: 0.0, y: 0.0 });
          mPhotoSession.lockFocusTracking({ x: 0.0, y: 0.0 });
          mPhotoSession.unlockFocusTracking();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        }
      }
      await releasePhotoSession();
      done();
    });

    // ══════════════════════════════════════════════════════════
    //  unlockFocusTracking
    // ══════════════════════════════════════════════════════════

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0100
     * @tc.desc   unlockFocusTracking normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0100', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0100';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          console.info(`${caseName} start`);
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          mPhotoSession.lockFocusTracking({ x: 0.0, y: 0.0 });
          mPhotoSession.unlockFocusTracking();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0200
     * @tc.desc   unlockFocusTracking without lockFocusTracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0200', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0200';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          console.info(`${caseName} start`);
          mPhotoSession.unlockFocusTracking();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0300
     * @tc.desc   unlockFocusTracking twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0300', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0300';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionCommitConfig(caseName, i);
          await mPhotoSession.start();
          console.info(`${caseName} start`);
          let isSupported = await mPhotoSession.isLockFocusTrackingSupported();
          console.info(`${caseName} isSupported is: ${isSupported}`);
          if (!isSupported) {
            console.info(`${caseName} is not supported lock focus tracking`);
            done();
            return;
          }
          mPhotoSession.lockFocusTracking({ x: 0.0, y: 0.0 });
          mPhotoSession.unlockFocusTracking();
          mPhotoSession.unlockFocusTracking();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        }
      }
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0400
     * @tc.desc   unlockFocusTracking without commit, error code is 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0400', Level.LEVEL1, async (done: () => void) => {
      let caseName: string = 'SUB_MULTIMEDIA_CAMERA_FOCUS_UNLOCK_FOCUS_TRACKING_0400';
      for (let i = 0; i < 2; i++) {
        try {
          if (mCameraDeviceArray.length === 1 && i === 1) {
            console.info(`${caseName} mCameraDeviceArray.length is 1`);
            done();
            return; 
          }
          await photoSessionWithoutCommitConfig(caseName, i);
          console.info(`${caseName} start`);
          mPhotoSession.unlockFocusTracking();
          expect().assertFail();
        } catch (err) {
          let error = err;
          console.error(TAG + caseName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect(err.code).assertEqual(SESSION_NOT_CONFIG_CODE)
        }
      }
      await releasePhotoSession();
      done();
    });

  });
}
