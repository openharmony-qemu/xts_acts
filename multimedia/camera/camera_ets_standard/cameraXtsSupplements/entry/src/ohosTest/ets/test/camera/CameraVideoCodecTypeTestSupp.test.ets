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
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  closeFd,
  COMMON_WAIT_DURATION,
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
import { tag } from '@kit.ConnectivityKit';

const TAG = "CameraXts.CameraVideoCodecTypeTest";
const abnormalValue = -1;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCapModePhoto: camera.CameraOutputCapability;
let mCameraOutputCapModeVideo: camera.CameraOutputCapability;
let mPreviewProfilesArray: Array<camera.Profile>;
let mPreviewProfile: camera.Profile | undefined;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoSurfaceId: string;
let mVideoProfile: camera.VideoProfile;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
let mCameraNum: number;

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
  location: { latitude: 30, longitude: 130 } as camera.Location,
  rotation: 0
};



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
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

function getSupportedModes() {
  console.info(TAG, 'getSupportedModes.');
  for (let i = 0; i < mCameraDeviceArray.length; i++) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
    if (isEmpty(mSupportedModes)) {
      return false;
    }
    console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes));
  }
  return true;
}

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCapModePhoto = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCapModePhoto));
  mCameraOutputCapModeVideo = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[1]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCapModeVideo));
  mPreviewProfilesArray = mCameraOutputCapModeVideo.previewProfiles;
  mVideoProfile = mCameraOutputCapModeVideo.videoProfiles[0];
  expect(isEmpty(mVideoProfile)).assertFalse();
  CameraVideoProfile.videoFrameWidth = mVideoProfile.size.width;
  CameraVideoProfile.videoFrameHeight = mVideoProfile.size.height;
}

function getPreviewProfile() {
  mPreviewProfile = mPreviewProfilesArray.find((previewProfile: camera.Profile) => {
    return Math.abs((previewProfile.size.width / previewProfile.size.height) -
      (mVideoProfile.size.width / mVideoProfile.size.height)) < Number.EPSILON;
  });
}

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

async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
  mVideoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession.addOutput(videoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
}



async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
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

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}


export default function CameraVideoCodecTypeTest() {
  describe('CameraVideoCodecTypeTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      await getPermission();
      await driveFn();
      getCameraInput();
      getOutputCapability();
      getPreviewProfile();
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0100
     * @tc.desc      : Check capture session set moving photo video error with Illegal value -10000
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0100 FAILED with NoCamera");
        done();
        return;
      }
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoOutput.setMovingPhotoVideoCodecType(-10000);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0100 finish");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0100 FAILED with VideoCodecType is: " +
        err.code);
        expect().assertFail();
      }
      await sleep(1000);
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0200
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0200
     * @tc.desc      : Check capture session set moving photo video error with Illegal value -2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0200--------------");
      if (mCameraNum == 0) {
        console.info(TAG +  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0200 FAILED with NoCamera");
        done();
        return;
      }
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoOutput.setMovingPhotoVideoCodecType(-2);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0200 finish");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0200 FAILED with VideoCodecType is: " +
        err.code);
        expect().assertFail();
      }
      await sleep(1000);
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0300
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0300
     * @tc.desc      : Check capture session set moving photo video error with Illegal value 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0300--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0300 FAILED with NoCamera");
        done();
        return;
      }
      try {
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
        mPreviewOutput =
          mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoOutput.setMovingPhotoVideoCodecType(3);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0300 finish");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0300 FAILED with VideoCodecType is: " +
        err.code);
        expect().assertFail()
      }
      await sleep(1000);
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0400
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0400
     * @tc.desc      : Check capture session set moving photo video error with null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0400', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0400--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0400 FAILED with NoCamera");
        done();
        return;
      }
      try {
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
        mPreviewOutput =
          mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoOutput.setMovingPhotoVideoCodecType(null);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0400 finish");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0400 FAILED with VideoCodecType is: " +
        err.code);
        expect(err.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      await sleep(1000);
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0500
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0500
     * @tc.desc      : Check capture session set moving photo video error with undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0500', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0500--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0500 FAILED with NoCamera");
        done();
        return;
      }
      try {
        mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
        mPreviewOutput =
          mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoOutput.setMovingPhotoVideoCodecType(undefined);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0500 finish");
      } catch (err) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_ERROR_TYPE_0500 FAILED with VideoCodecType is: " +
        err.code);
        expect(err.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      await sleep(1000);
      await releasePhotoSession();
      done();
    })

  })
}