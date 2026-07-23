'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../hypium/index';
import { camera } from '@kit.CameraKit';
import {
  getFd, getPermission, resourceName, sleep
} from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import { Context } from '@kit.ArkUI';

const TAG = "CameraXtsPhotoOutputStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let mMetadataOutput: camera.MetadataOutput | undefined;
let mMetadataObjectTypes: Array<camera.MetadataObjectType> | undefined;
let mVideoSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let mVideoSession: camera.VideoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
let fdNumber: Int | undefined;
let fdPath: string | undefined;
let mCameraOutputCap: camera.CameraOutputCapability | undefined;
let testContext:  Context;
let indexSurfaceId : string = "";
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
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: CameraVideoProfile,
  url: 'file://',
};

let isEmptyCameraManager = (data: camera.CameraManager | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyCameraDevice = (data: camera.CameraDevice[] | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyAVRecorder = (data: media.AVRecorder | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let getCameraManagerInstance = () => {
  console.info('Enter getCameraManagerInstance');
  testContext = Hypium.get("Context") as Context;
  indexSurfaceId = Hypium.get('SurfaceId') as string;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmptyCameraManager(mCameraManager!)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');

  return true;
}

function getSupportedCameraDeviceArray(): boolean {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmptyCameraDevice(mCameraDeviceArray!)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}

async function getVideoSurfaceId() {
  console.info(TAG, 'getVideoSurfaceId begin.');
  let fileName: string = resourceName();
  fdNumber = await getFd(fileName);
  fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath!;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmptyAVRecorder(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder!.state);
  mAVRecorder!.prepare(videoConfig).then(() => {
    console.info('prepare success');
  })
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder!.state);
  mVideoSurfaceId = await mAVRecorder!.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}

async function getPhotoSession(testName: string, sceneMode: camera.SceneMode, previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput, metadataOutput: camera.MetadataOutput) {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(sceneMode);
  console.info(TAG, testName + ' createSession passed.');
  mPhotoSession!.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession!.addInput(mCameraInput!);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput!.open();
  console.info(TAG, testName + ' open passed.');
  mPhotoSession!.addOutput(previewOutput!);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession!.addOutput(photoOutput!);
  console.info(TAG, testName + ' addOutput photoOutput passed.');
  mPhotoSession!.addOutput(metadataOutput!);
  console.info(TAG, testName + ' addOutput metadataOutput passed.');
  await mPhotoSession!.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
  await mPhotoSession!.start();
  console.info(TAG, testName + ' start passed.');
}

async function getVideoSession(testName: string, sceneMode: camera.SceneMode, previewOutput: camera.PreviewOutput, videoOutput: camera.VideoOutput, metadataOutput: camera.MetadataOutput) {
  console.info(TAG, 'getVideoSession.');
  mVideoSession = mCameraManager!.createSession<camera.VideoSession>(sceneMode);
  console.info(TAG, testName + ' createSession passed.');
  mVideoSession!.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession!.addInput(mCameraInput!);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput!.open();
  console.info(TAG, testName + ' open passed.');
  mVideoSession!.addOutput(previewOutput!);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession!.addOutput(videoOutput!);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  mVideoSession!.addOutput(metadataOutput!);
  console.info(TAG, testName + ' addOutput metadataOutput passed.');
  await mVideoSession!.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
  await mVideoSession!.start();
  console.info(TAG, testName + ' start passed.');
}

async function getMetadataSession(testName: string, sceneMode: camera.SceneMode, previewOutput: camera.PreviewOutput, metadataOutput: camera.MetadataOutput) {
  console.info(TAG, 'getMetadataSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(sceneMode);
  console.info(TAG, testName + ' createSession passed.');
  mPhotoSession!.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession!.addInput(mCameraInput!);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput!.open();
  console.info(TAG, testName + ' open passed.');
  mPhotoSession!.addOutput(previewOutput!);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession!.addOutput(metadataOutput!);
  console.info(TAG, testName + ' addOutput metadataOutput passed.');
  await mPhotoSession!.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
  await mPhotoSession!.start();
  console.info(TAG, testName + ' start passed.');
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

export async function waitForTrigger(check: () => boolean, timeoutMs: Int = 1000,
  intervalMs: Int = 100): Promise<boolean> {
  let elapsed: Int = 0;
  while (elapsed < timeoutMs) {
    if (check()) {
      return true;
    }
    await sleep(intervalMs);
    elapsed += intervalMs;
  }
  return check();
}

export default function MetadataOutputStaticTest():void {
  describe('MetadataOutputStaticTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      await getVideoSurfaceId();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100
     * @tc.desc   test back camera NORMAL_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0100';
      let isSupported: boolean;
      try {
        const device = mCameraDeviceArray![0];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager!.createCameraInput(device);
        mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        await getPhotoSession(testName, mode, mPreviewOutput!, mPhotoOutput!, mMetadataOutput!);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput!.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput!.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput!.lockMetadataObjectTracking({ x: 1, y: 1});
          mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0200';
      let isSupported: boolean;
      try {
        const device = mCameraDeviceArray![0];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.NORMAL_VIDEO;
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager!.createCameraInput(device);
        // 预览和录像宽高比及格式匹配选择
        const previewProfiles = mCameraOutputCap!.previewProfiles;
        const videoProfiles = mCameraOutputCap!.videoProfiles;
        let isMatchFound = false;
        // 优先选择第一个预览配置和第一个视频配置的宽高比和格式
        for (const nPreviewProfile of previewProfiles) {
          const previewRatio = nPreviewProfile.size.width / nPreviewProfile.size.height;
          for (const nVideoProfile of videoProfiles) {
            const videoRatio = nVideoProfile.size.width / nVideoProfile.size.height;
            // 匹配宽高比和格式
            if (previewRatio === videoRatio && nPreviewProfile.format === nVideoProfile.format) {
              console.info(TAG, testName + ' nPreviewProfile is ' + JSON.stringify(nPreviewProfile));
              console.info(TAG, testName + ' nVideoProfile is ' + JSON.stringify(nVideoProfile));
              mPreviewOutput = mCameraManager!.createPreviewOutput(nPreviewProfile, indexSurfaceId);
              mVideoOutput = mCameraManager!.createVideoOutput(nVideoProfile, mVideoSurfaceId!);
              isMatchFound = true;
              break;
            }
          }
          if (isMatchFound) break;
        }
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        await getVideoSession(testName, mode, mPreviewOutput!, mVideoOutput!, mMetadataOutput!);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput!.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput!.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput!.lockMetadataObjectTracking({ x: 1, y: 1});
          mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0300';
      let isSupported: boolean;
      try {
        const device = mCameraDeviceArray![0];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.SECURE_PHOTO;
        if (!mSupportedModes!.includes(mode)) {
          console.info(TAG, testName + ' SECURE_PHOTO mode not supported');
          done();
          return;
        }
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager!.createCameraInput(device);
        mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        await getMetadataSession(testName, camera.SceneMode.NORMAL_PHOTO!, mPreviewOutput!, mMetadataOutput!);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput!.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput!.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput!.lockMetadataObjectTracking({ x: 1, y: 1});
          mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0400';
      if (mCameraDeviceArray!.length < 2) {
        console.info(TAG, 'mCameraDeviceArray does not have enough devices for this test.');
        done();
        return;
      }
      let isSupported: boolean;
      try {
        const device = mCameraDeviceArray![1];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager!.createCameraInput(device);
        mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        await getPhotoSession(testName, mode, mPreviewOutput!, mPhotoOutput!, mMetadataOutput!);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput!.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput!.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput!.lockMetadataObjectTracking({ x: 1, y: 1});
          mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0500';
      if (mCameraDeviceArray!.length < 2) {
        console.info(TAG, 'mCameraDeviceArray does not have enough devices for this test.');
        done();
        return;
      }
      let isSupported: boolean;
      try {
        const device = mCameraDeviceArray![1];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.NORMAL_VIDEO;
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager!.createCameraInput(device);
        mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
        mVideoOutput = mCameraManager!.createVideoOutput(mCameraOutputCap!.videoProfiles[0], mVideoSurfaceId!);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        await getVideoSession(testName, mode, mPreviewOutput!, mVideoOutput!, mMetadataOutput!);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput!.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput!.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput!.lockMetadataObjectTracking({ x: 1, y: 1});
          mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0600';
      if (mCameraDeviceArray!.length < 2) {
        console.info(TAG, 'mCameraDeviceArray does not have enough devices for this test.');
        done();
        return;
      }
      let isSupported: boolean;
      try {
        const device = mCameraDeviceArray![1];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_VIDEO
        const mode = camera.SceneMode.SECURE_PHOTO;
        if (!mSupportedModes!.includes(mode)) {
          console.info(TAG, testName + ' SECURE_PHOTO mode not supported');
          done();
          return;
        }
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager!.createCameraInput(device);
        mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        await getMetadataSession(testName, camera.SceneMode.NORMAL_PHOTO!, mPreviewOutput!, mMetadataOutput!);
        // isLockMetadataObjectTrackingSupported
        isSupported = mMetadataOutput!.isLockMetadataObjectTrackingSupported();
        console.info(TAG, testName + ' isSupported is ' + isSupported);
        expect(typeof isSupported).assertEqual('boolean');
        if (isSupported) {
          mMetadataOutput!.lockMetadataObjectTracking({ x: 0, y: 0});
          mMetadataOutput!.lockMetadataObjectTracking({ x: 1, y: 1});
          mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TRACKING_0700';
      try {
        for (let device of mCameraDeviceArray!) {
          mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
          for (let mode of mSupportedModes!) {
            mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
            mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
            mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
            const invalidPoints: camera.Point[] = [{ x: -1, y: 1 }, { x: 1, y: -1 }, { x: -1, y: -1 }, { x: 1, y: 2 }, { x: 2, y: 1 }];
            for (const point of invalidPoints) {
              try {
                mMetadataOutput!.lockMetadataObjectTracking(point);
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0800';
      try {
        const device = mCameraDeviceArray![0];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mCameraInput = mCameraManager!.createCameraInput(device);
        mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
        mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles[0]);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        await getPhotoSession(testName, mode, mPreviewOutput!, mPhotoOutput!, mMetadataOutput!);
        // unlockMetadataObjectTracking
        mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_0900';
      try {
        const device = mCameraDeviceArray![0];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        // mMetadataOutput not config
        mMetadataOutput!.lockMetadataObjectTracking({ x: 0, y: 0});
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1000';
      try {
        const device = mCameraDeviceArray![0];
        mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
        console.info(TAG, testName + ' mSupportedModes is ' + JSON.stringify(mSupportedModes));
        // NORMAL_PHOTO
        const mode = camera.SceneMode.NORMAL_PHOTO;
        mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(device, mode);
        mMetadataObjectTypes = mCameraOutputCap!.supportedMetadataObjectTypes;
        console.info(TAG, testName + ' mMetadataObjectTypes is ' + JSON.stringify(mMetadataObjectTypes));
        mMetadataOutput = mCameraManager!.createMetadataOutput(mMetadataObjectTypes!);
        // mMetadataOutput not config
        mMetadataOutput!.unlockMetadataObjectTracking();
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
    it('SUB_MULTIMEDIA_CAMERA_LOCK_METADATA_OBJECT_TTACKING_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
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

  })
}