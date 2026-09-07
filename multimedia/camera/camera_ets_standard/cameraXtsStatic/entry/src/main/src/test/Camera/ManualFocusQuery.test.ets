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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium,
  TestType,
  Size,
} from '../../../../hypium/index';
import { camera } from '@kit.CameraKit';
import { getFd, getPermission, isEmpty, resourceName } from '../Common.test';
import media from '@ohos.multimedia.media';
import { Context } from '@ohos.arkui.UIContext';

const TAG = "CameraXts.ManualFocusQueryTest";
let mCameraManager: camera.CameraManager | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let mVideoSession: camera.VideoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
let fdNumber: int | undefined;
let fdPath: string | undefined;
let indexSurfaceId: string = "";
let mVideoSurfaceId: string | undefined;
let testContext: Context;

let isEmpty01 = (data: camera.CameraManager | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmpty02 = (data: camera.CameraDevice[] | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty04 = (data: media.AVRecorder | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
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
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: CameraVideoProfile!,
  url: 'file://',
};

let getCameraManagerInstance = () => {
  console.info('Enter getCameraManagerInstance');
  testContext = Hypium.get("Context") as Context;
  indexSurfaceId = Hypium.get('SurfaceId') as string;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty01(mCameraManager!)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');

  return true;
}

function getSupportedCameraDeviceArray(): boolean {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmpty02(mCameraDeviceArray!)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}

function getCameraInput(): void {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    let cameras = mCameraManager!.getSupportedCameras();
    console.info(TAG, 'getSupportedCameras.', cameras);
    if (cameras) {
      mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    } else {
      console.info(TAG, 'cameras null.');
    }
  } else {
    console.info(TAG, 'getSupportedCameraDeviceArray null.');
  }
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
  expect(isEmpty04(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder!.state);
  mAVRecorder!.prepare(videoConfig).then(() => {
    console.info('prepare success');
  })
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder!.state);
  mVideoSurfaceId = await mAVRecorder!.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  mPreviewProfile = cameraOutputCap.previewProfiles[0];
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
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
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
  mPhotoOutput = mCameraManager!.createPhotoOutput(photoProfile);
}

async function createVideoOutput() {
  await getVideoSurfaceId();
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_VIDEO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let mVideoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
    let foundProfile = cameraOutputCap.videoProfiles.find((indexVideoProfile: camera.Profile) => {
      console.log(TAG, 'find videoProfile: w: ' + indexVideoProfile.size.width + 'h: ' + indexVideoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexVideoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexVideoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      mVideoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'mVideoProfile: w: ' + mVideoProfile.size.width + 'h: ' + mVideoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  CameraVideoProfile!.videoFrameWidth = mVideoProfile.size.width;
  CameraVideoProfile!.videoFrameHeight = mVideoProfile.size.height;
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId);
  console.log(TAG, 'createVideoOutput' + mVideoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager!.createVideoOutput(mVideoProfile, mVideoSurfaceId!);
  console.log(TAG, 'create preview output' + mPreviewOutput, 'createVideoOutput', mVideoOutput);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession!.beginConfig();
  mPhotoSession!.addInput(mCameraInput!);
  await mCameraInput!.open();
  mPhotoSession!.addOutput(previewOutput);
  mPhotoSession!.addOutput(photoOutput);
  await mPhotoSession!.commitConfig();
}

async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
  mVideoSession!.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession!.addInput(mCameraInput!);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput!.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession!.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession!.addOutput(videoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession!.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput!.release();
  await mPhotoOutput!.release();
  await mPhotoSession!.release();
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder!.release();
  await mPreviewOutput!.release();
  await mVideoOutput!.release();
  await mVideoSession!.release();
}

export default function ManualFocusQueryTest(): void {
  describe('ManualFocusQueryTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0100
     * @tc.desc   isFocusDistanceSupported return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0100';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            let isSupported: boolean = mPhotoSession!.isFocusDistanceSupported();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'isFocusDistanceSupported, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0200
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0200
     * @tc.desc   isFocusDistanceSupported return 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_STATIC_0200';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession!.isFocusDistanceSupported();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'isFocusDistanceSupported, failed', JSON.stringify(error), error.code,
              error);
            expect(error.code).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0300
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0300
     * @tc.desc   getFocusDistance return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0300';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            let isSupported: number = mPhotoSession!.getFocusDistance();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'getFocusDistance, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0400
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0400
     * @tc.desc   getFocusDistance return 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0400';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession!.getFocusDistance();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'getFocusDistance, failed', JSON.stringify(error), error.code,
              error);
            expect(error.code).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0500
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0500
     * @tc.desc   getSupportedIsoRange return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0500';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            let isSupported: Array<int> = mPhotoSession!.getSupportedIsoRange();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'getSupportedIsoRange, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0600
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0600
     * @tc.desc   getSupportedIsoRange return 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_STATIC_0600';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession!.getSupportedIsoRange();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'getSupportedIsoRange, failed', JSON.stringify(error), error.code,
              error);
            expect(error.code).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0700
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0700
     * @tc.desc   getIso return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0700';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            let isSupported: number = mPhotoSession!.getIso();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'getIso, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0800
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0800
     * @tc.desc   getIso return 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0800';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession!.getIso();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'getIso, failed', JSON.stringify(error), error.code,
              error);
            expect(error.code).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0500
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0500
     * @tc.desc   getFocusDistance with errorcode 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_STATIC_0500';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          await mCameraInput!.close();
          try {
            let distance: number = mPhotoSession!.getFocusDistance();
            console.error(`getFocusDistance expected fail, but success, distance: ${distance}`)
            getCameraInput();
            expect().assertFail()
          } catch (error) {
            console.error(TAG, testName, 'getFocusDistance, failed', JSON.stringify(error), error.code,
              error);
            getCameraInput();
            expect(error.code).assertEqual(camera.CameraErrorCode.OPERATION_NOT_ALLOWED);
          }
          await releasePhotoSession();
          done();
        }
      });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0900
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0900
     * @tc.desc   getIso return 7400102 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_ISO_STATIC_0900';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          await mCameraInput!.close();
          try {
            let isoValue: number = mPhotoSession!.getIso();
            console.error(`getIso expected fail, but success, iso: ${isoValue}`)
            getCameraInput();
            expect().assertFail()
          } catch (error) {
            console.error(TAG, testName, 'getIso, failed', JSON.stringify(error), error.code,
              error);
            getCameraInput();
            expect(error.code).assertEqual(camera.CameraErrorCode.OPERATION_NOT_ALLOWED);
          }
          await releasePhotoSession();
          done();
        }
      });

  });
}