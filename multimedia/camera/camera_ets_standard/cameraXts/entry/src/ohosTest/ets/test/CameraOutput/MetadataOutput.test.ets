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
import { media } from '@kit.MediaKit';
import { common } from '@kit.AbilityKit';
import { cameraErrorCode, driveFn, getPermission, isEmpty, sleep, resourceName, getFd } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = "CameraXts.MetadataOutputTest";
const InvalidParam = -1;
const captureLocation: camera.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0
};
const InvalidLocation: camera.Location = {
  latitude: InvalidParam,
  longitude: InvalidParam,
  altitude: InvalidParam
};
const NewCaptureLocation: camera.Location = {
  latitude: 99999,
  longitude: 99999,
  altitude: 99999
};

let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCap: camera.CameraOutputCapability;
let mFullCameraOutputCap: camera.CameraOutputCapability;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mMetadataOutput: camera.MetadataOutput;
let mMetadataObjectTypes: Array<camera.MetadataObjectType>;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mVideoSurfaceId: string;
let mVideoOutput: camera.VideoOutput
let fdNumber: number;
let fdPath: string;
let mAVRecorder: media.AVRecorder;
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

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mMetadataOutput?.release();
  await mPhotoSession?.release();
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mMetadataOutput?.release();
  await mVideoSession?.release();
}

async function releaseMetadataSession() {
  console.info(TAG, 'releaseMetadataSession.');
  await mPreviewOutput?.release();
  await mMetadataOutput?.release();
  await mPhotoSession?.release();
}

export async function waitForTrigger(check: () => boolean, timeoutMs: number = 1000,
  intervalMs: number = 100): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < timeoutMs) {
    if (check()) {
      return true;
    }
    await sleep(intervalMs);
    elapsed += intervalMs;
  }
  return check();
}

let videoProfile: media.AVRecorderProfile = {
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
}

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: videoProfile,
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

async function getPhotoSession(testName: string, sceneMode: camera.SceneMode, previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput, metadataOutput: camera.MetadataOutput) {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager.createSession(sceneMode);
  console.info(TAG, testName + ' createSession passed.');
  mPhotoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' open passed.');
  mPhotoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession.addOutput(photoOutput);
  console.info(TAG, testName + ' addOutput photoOutput passed.');
  mPhotoSession.addOutput(metadataOutput);
  console.info(TAG, testName + ' addOutput metadataOutput passed.');
  await mPhotoSession.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
  await mPhotoSession.start();
  console.info(TAG, testName + ' start passed.');
}

async function getVideoSession(testName: string, sceneMode: camera.SceneMode, previewOutput: camera.PreviewOutput, videoOutput: camera.VideoOutput, metadataOutput: camera.MetadataOutput) {
  console.info(TAG, 'getVideoSession.');
  mVideoSession = mCameraManager.createSession(sceneMode);
  console.info(TAG, testName + ' createSession passed.');
  mVideoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' open passed.');
  mVideoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession.addOutput(videoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  mVideoSession.addOutput(metadataOutput);
  console.info(TAG, testName + ' addOutput metadataOutput passed.');
  await mVideoSession.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
  await mVideoSession.start();
  console.info(TAG, testName + ' start passed.');
}

async function getMetadataSession(testName: string, sceneMode: camera.SceneMode, previewOutput: camera.PreviewOutput, metadataOutput: camera.MetadataOutput) {
  console.info(TAG, 'getMetadataSession.');
  mPhotoSession = mCameraManager.createSession(sceneMode);
  console.info(TAG, testName + ' createSession passed.');
  mPhotoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' open passed.');
  mPhotoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession.addOutput(metadataOutput);
  console.info(TAG, testName + ' addOutput metadataOutput passed.');
  await mPhotoSession.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
  await mPhotoSession.start();
  console.info(TAG, testName + ' start passed.');
}

export default function MetadataOutputTest() {
  describe('MetadataOutputTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      await getPermission();
      await driveFn();
      getSupportedCameraDeviceArray();
      await getVideoSurfaceId();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100
     * @tc.desc   test back camera NORMAL_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100';
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[0];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getPhotoSession(testName, mode, mPreviewOutput, mPhotoOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            triggered = true;
          });
          mMetadataOutput.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput.lockMetadataObjectTracking({ x: 1, y: 1});
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + ' find object result is ' + result);
          mMetadataOutput.off('metadataObjectsAvailable');
          mMetadataOutput.unlockMetadataObjectTracking();
        }
        console.info(TAG, testName + ' start release');
        await releasePhotoSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releasePhotoSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0200
     * @tc.desc   test back camera NORMAL_VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0200';
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[0];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.NORMAL_VIDEO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mCameraOutputCap.videoProfiles[0], mVideoSurfaceId);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getVideoSession(testName, mode, mPreviewOutput, mVideoOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            triggered = true;
          });
          mMetadataOutput.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput.lockMetadataObjectTracking({ x: 1, y: 1});
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + ' find object result is ' + result);
          mMetadataOutput.off('metadataObjectsAvailable');
          mMetadataOutput.unlockMetadataObjectTracking();
        }
        console.info(TAG, testName + ' start release');
        await releaseVideoSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releaseVideoSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0300
     * @tc.desc   test back camera SECURE_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0300';
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[0];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.SECURE_PHOTO;
        if (!mSupportedModes.includes(mode)) {
          console.info(TAG, testName + ' SECURE_PHOTO mode not supported');
          done();
          return;
        }
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getMetadataSession(testName, camera.SceneMode.NORMAL_PHOTO, mPreviewOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            triggered = true;
          });
          mMetadataOutput.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput.lockMetadataObjectTracking({ x: 1, y: 1});
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + ' find object result is ' + result);
          mMetadataOutput.off('metadataObjectsAvailable');
          mMetadataOutput.unlockMetadataObjectTracking();
        }
        console.info(TAG, testName + ' start release');
        await releaseMetadataSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releaseMetadataSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0400
     * @tc.desc   test front camera NORMAL_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0400';
      if (mCameraDeviceArray.length < 2) {
        console.info(TAG, 'mCameraDeviceArray does not have enough devices for this test.');
        done();
        return;
      }
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[1];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getPhotoSession(testName, mode, mPreviewOutput, mPhotoOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            triggered = true;
          });
          mMetadataOutput.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput.lockMetadataObjectTracking({ x: 1, y: 1});
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + ' find object result is ' + result);
          mMetadataOutput.off('metadataObjectsAvailable');
          mMetadataOutput.unlockMetadataObjectTracking();
        }
        console.info(TAG, testName + ' start release');
        await releasePhotoSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releasePhotoSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0500
     * @tc.desc   test front camera NORMAL_VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0500';
      if (mCameraDeviceArray.length < 2) {
        console.info(TAG, 'mCameraDeviceArray does not have enough devices for this test.');
        done();
        return;
      }
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[1];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.NORMAL_VIDEO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mCameraOutputCap.videoProfiles[0], mVideoSurfaceId);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getVideoSession(testName, mode, mPreviewOutput, mVideoOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            triggered = true;
          });
          mMetadataOutput.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput.lockMetadataObjectTracking({ x: 1, y: 1});
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + ' find object result is ' + result);
          mMetadataOutput.off('metadataObjectsAvailable');
          mMetadataOutput.unlockMetadataObjectTracking();
        }
        console.info(TAG, testName + ' start release');
        await releaseVideoSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releaseVideoSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0600
     * @tc.desc   test front camera SECURE_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0600';
      if (mCameraDeviceArray.length < 2) {
        console.info(TAG, 'mCameraDeviceArray does not have enough devices for this test.');
        done();
        return;
      }
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[1];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.SECURE_PHOTO;
        if (!mSupportedModes.includes(mode)) {
          console.info(TAG, testName + ' SECURE_PHOTO mode not supported');
          done();
          return;
        }
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getMetadataSession(testName, camera.SceneMode.NORMAL_PHOTO, mPreviewOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            triggered = true;
          });
          mMetadataOutput.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput.lockMetadataObjectTracking({ x: 1, y: 1});
          let result: boolean = await waitForTrigger((): boolean => triggered);
          console.info(TAG, testName + ' find object result is ' + result);
          mMetadataOutput.off('metadataObjectsAvailable');
          mMetadataOutput.unlockMetadataObjectTracking();
        }
        console.info(TAG, testName + ' start release');
        await releaseMetadataSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releaseMetadataSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0700
     * @tc.desc   Test lockMetadataObjectTracking point not within the range 0-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0700';
      try {
        for (let device of mCameraDeviceArray) {
          mSupportedModes = mCameraManager.getSupportedSceneModes(device);
          for (let mode of mSupportedModes) {
            mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
            mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
            mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
            const invalidPoints: camera.Point[] = [{ x: -1, y: 1 }, { x: 1, y: -1 }, { x: -1, y: -1 }, { x: 1, y: 2 }, { x: 2, y: 1 }];
            for (const point of invalidPoints) {
              try {
                mMetadataOutput.lockMetadataObjectTracking(point);
                console.error(TAG, testName + 'success, expect fail');
                expect().assertFail();
              } catch (error) {
                console.error(TAG, testName + ' failed ' + error, error.code);
                expect(Number(error.code)).assertEqual(401);
              }
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0800
     * @tc.desc   test unlock before lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0800';
      try {
        const device = mCameraDeviceArray[0];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getPhotoSession(testName, mode, mPreviewOutput, mPhotoOutput, mMetadataOutput);
        // unlockMetadataObjectTracking
        mMetadataOutput.unlockMetadataObjectTracking();
        console.info(TAG, testName + ' start release');
        await releasePhotoSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releasePhotoSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0900
     * @tc.desc   test lockMetadataObjectTracking 7400103 - Session not config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0900';
      try {
        const device = mCameraDeviceArray[0];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        // mMetadataOutput not config
        mMetadataOutput.lockMetadataObjectTracking({ x: 0, y: 0});
        console.error(TAG, testName + ' success, expect fail');
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400103);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1000
     * @tc.desc   test unlockMetadataObjectTracking 7400103 - Session not config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1000';
      try {
        const device = mCameraDeviceArray[0];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        // mMetadataOutput not config
        mMetadataOutput.unlockMetadataObjectTracking();
        console.error(TAG, testName + ' success, expect fail');
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400103);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1100
     * @tc.desc   test enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1100';
      try {
        console.info(TAG, testName + ' CAT_FACE is ' + JSON.stringify(camera.MetadataObjectType.CAT_FACE));
        expect(camera.MetadataObjectType.CAT_FACE).assertEqual(2);
        console.info(TAG, testName + ' CAT_BODY is ' + JSON.stringify(camera.MetadataObjectType.CAT_BODY));
        expect(camera.MetadataObjectType.CAT_BODY).assertEqual(3);
        console.info(TAG, testName + ' DOG_FACE is ' + JSON.stringify(camera.MetadataObjectType.DOG_FACE));
        expect(camera.MetadataObjectType.DOG_FACE).assertEqual(4);
        console.info(TAG, testName + ' DOG_BODY is ' + JSON.stringify(camera.MetadataObjectType.DOG_BODY));
        expect(camera.MetadataObjectType.DOG_BODY).assertEqual(5);
        console.info(TAG, testName + ' SALIENT_DETECTION is ' + JSON.stringify(camera.MetadataObjectType.SALIENT_DETECTION));
        expect(camera.MetadataObjectType.SALIENT_DETECTION).assertEqual(6);
        console.info(TAG, testName + ' BAR_CODE_DETECTION is ' + JSON.stringify(camera.MetadataObjectType.BAR_CODE_DETECTION));
        expect(camera.MetadataObjectType.BAR_CODE_DETECTION).assertEqual(7);
        console.info(TAG, testName + ' BASIC_FACE_DETECTION is ' + JSON.stringify(camera.MetadataObjectType.BASIC_FACE_DETECTION));
        expect(camera.MetadataObjectType.BASIC_FACE_DETECTION).assertEqual(8);
        console.info(TAG, testName + ' TEXT_DETECTION is ' + JSON.stringify(camera.MetadataObjectType.TEXT_DETECTION));
        expect(camera.MetadataObjectType.TEXT_DETECTION).assertEqual(9);
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1200
     * @tc.desc   test MetadataObject isLockFocusTracked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1200';
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[0];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getPhotoSession(testName, mode, mPreviewOutput, mPhotoOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            if (metadataObjectArr.length > 0) {
              let metadataObject = metadataObjectArr[0]
              console.info(TAG + testName + " metadataObject isLockFocusTracked: " + metadataObject.isLockFocusTracked);
              let boundingBox = metadataObject.boundingBox
              console.info(TAG + testName + " metadataObject boundingBox topLeftX: " + boundingBox.topLeftX);
              console.info(TAG + testName + " metadataObject boundingBox topLeftY: " + boundingBox.topLeftY);
              console.info(TAG + testName + " metadataObject boundingBox width: " + boundingBox.width);
              console.info(TAG + testName + " metadataObject boundingBox height: " + boundingBox.height);
            }
            triggered = true;
          });
        }
        console.info(TAG, testName + ' start release');
        await releasePhotoSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releasePhotoSession();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1300
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1300
     * @tc.desc   test front camera NORMAL_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1300';
      if (mCameraDeviceArray.length < 2) {
        console.info(TAG, 'mCameraDeviceArray does not have enough devices for this test.');
        done();
        return;
      }
      let isSupported: boolean;
      let triggered: boolean = false;
      try {
        const device = mCameraDeviceArray[1];
        mSupportedModes = mCameraManager.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager.createCameraInput(device);
        mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypes);
        await getPhotoSession(testName, mode, mPreviewOutput, mPhotoOutput, mMetadataOutput);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput.on('metadataObjectsAvailable', (err: BusinessError, metadataObjectArr: Array<camera.MetadataObject>) => {
            console.info(TAG + testName + " metadataObjectArr: " + metadataObjectArr);
            triggered = true;
          });
          try {
            mMetadataOutput.lockMetadataObjectTracking(null);
          } catch (error) {
            console.error(TAG, testName + 'lockMetadataObjectTracking failed. err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue()
          }
        }
        console.info(TAG, testName + ' start release');
        await releasePhotoSession();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await releasePhotoSession();
        expect().assertFail();
        done();
      }
    })

  })
}