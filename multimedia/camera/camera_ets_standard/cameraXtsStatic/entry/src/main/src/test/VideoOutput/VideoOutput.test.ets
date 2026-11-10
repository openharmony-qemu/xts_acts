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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  COMMON_WAIT_DURATION, getFd, getPermission, resourceName, sleep
} from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import { Context } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import Utils from '../Util.test';

const TAG = "CameraXtsVideoOutputStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mFullCameraOutputCap: camera.CameraOutputCapability | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let photoAsset: photoAccessHelper.PhotoAsset | undefined;
let mVideoSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let mVideoSession: camera.VideoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
let mCaptureStartInfo: camera.CaptureStartInfo | undefined;
let mFrameShutterInfo: camera.FrameShutterInfo | undefined;
let mFrameShutterEndInfo: camera.FrameShutterEndInfo | undefined;
let mCaptureEndInfo: camera.CaptureEndInfo | undefined;
let EstimatedCaptureDuratio: number | undefined;
let fdNumber: number | undefined;
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
let isEmptyCameraInput = (data: camera.CameraInput | undefined) => {
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

function getOutputCapability(): void {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], mSupportedModes![0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
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


function getCameraInput(): void {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    let cameras = mCameraManager!.getSupportedCameras();
    console.info(TAG, 'getSupportedCameras.',cameras);
    if (cameras) {
      mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    }else {
      console.info(TAG, 'cameras null.');
    }
  }else{
    console.info(TAG, 'getSupportedCameraDeviceArray null.');
  }
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

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![0]);
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
    mSupportedModes = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![0]);
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
  let videoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
    let foundProfile = cameraOutputCap.videoProfiles.find((indexVideoProfile: camera.Profile) => {
      console.log(TAG, 'find videoProfile: w: ' + indexVideoProfile.size.width + 'h: ' + indexVideoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexVideoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexVideoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      videoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'videoProfile: w: ' + videoProfile.size.width + 'h: ' + videoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  CameraVideoProfile.videoFrameWidth = videoProfile.size.width;
  CameraVideoProfile.videoFrameHeight = videoProfile.size.height;
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
  console.log(TAG, 'createVideoOutput' + videoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager!.createVideoOutput(videoProfile, mVideoSurfaceId!);
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

async function previewOutputSetFrameRate(done: () => void, testName: string,
  callback: (supportedFrameRatesArray: Array<camera.FrameRateRange>) => void) {
  console.info(TAG, testName);
  if (isEmptyCameraDevice(mCameraDeviceArray)) {
    console.info(TAG, testName + ' mCameraDeviceArray is null.');
    return;
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
    let supportedFrameRatesArray: Array<camera.FrameRateRange> = mPreviewOutput!.getSupportedFrameRates();
    console.info(TAG, testName, `The Device is supportedFrameRates: ${JSON.stringify(supportedFrameRatesArray)}`)
    if (supportedFrameRatesArray!.length > 0) {
      callback(supportedFrameRatesArray);
    } else {
      done();
    }
    await releasePhotoSession();
  }
}

async function captureWithSettingsCallback(done: () => void, testName: string,
  settings: camera.PhotoCaptureSetting | undefined | null) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
        if (error !== undefined && error!.code !== 0) {
          console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
          expect().assertFail();
        } else {
          console.info(TAG, testName + ' capture passed.');
          expect(true).assertTrue();
        }
      });
      console.info(TAG, testName + ' capture end.');
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await releasePhotoSession();
    done();
  }
}


export default function VideoOutputStaticTest():void {
  describe('VideoOutputStaticTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
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
     * @tc.name   mVideoOutput_isMirrorSupported_static_0100
     * @tc.number mVideoOutput_isMirrorSupported_static_0100
     * @tc.desc   mVideoOutput isMirrorSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('mVideoOutput_isMirrorSupported_static_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'mVideoOutput_isMirrorSupported_static_0100';
        try {
          if (isEmptyCameraDevice(mCameraDeviceArray)) {
            console.info(TAG, testName, ' mCameraDeviceArray is null.');
          } else {
            await createVideoOutput();
            console.info(TAG, testName, ' createVideoOutput is .');
            await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
            console.info(TAG, testName, ' createVideoseSession is .');
            let isSupported = mVideoOutput!.isMirrorSupported();
            console.info(TAG, testName, ' isSupported is .',isSupported);
            expect(isSupported != null).assertTrue();
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        await releaseVideoSession();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100
     * @tc.desc   Check video output enable mirror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testName: string = "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100";
        try {
          if (isEmptyCameraManager(mCameraManager)) {
            console.info(TAG, testName, `cameraManager is null.`);
            done();
            return;
          }
          console.info(TAG, testName, 'Start');
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          if (mVideoOutput!.isMirrorSupported()) {
            mVideoOutput!.enableMirror(false);
            console.info(TAG, testName, `success`);
          } else {
            console.info(TAG, testName, '不支持镜像录像')
          }
        } catch (err) {
          console.error(TAG, testName, `failed:`, JSON.stringify(err), err!.code);
          expect().assertFail();
        } finally {
          await releaseVideoSession();
          done();
        }
      });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_VIDEO_GET_SUPPORTED_FRAME_RATES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_VIDEO_GET_SUPPORTED_FRAME_RATES_STATIC_0100
     * @tc.desc   camera.VideoOutput getSupportedFrameRates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_VIDEO_GET_SUPPORTED_FRAME_RATES_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_VIDEO_GET_SUPPORTED_FRAME_RATES_STATIC_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            await createVideoOutput();
            await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
            let supportedFrameRates = mVideoOutput!.getSupportedFrameRates();
            console.info(TAG, testName, "end :");
            expect(supportedFrameRates[0].min != null).assertTrue();
            expect(supportedFrameRates[0].max != null).assertTrue();
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error!.code);
          expect().assertFail();
        }
        await releaseVideoSession();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0100
     * @tc.desc   getActiveFrameRate activeFrameRate min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0100';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let supportedFrameRatesArray: Array<camera.FrameRateRange> = mVideoOutput!.getSupportedFrameRates();
          console.info(TAG,"rate",supportedFrameRatesArray.length);
          console.info(TAG,"min",supportedFrameRatesArray[0].min, supportedFrameRatesArray[0].max);
          mVideoOutput!.setFrameRate(supportedFrameRatesArray[0].min+1, supportedFrameRatesArray[0].max-1);
          let activeFrameRate = mVideoOutput!.getActiveFrameRate();
          expect(activeFrameRate.min == supportedFrameRatesArray[0].min+1).assertTrue()
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0200
     * @tc.desc   getActiveFrameRate activeFrameRate max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAMERATE_STATIC_0200';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let supportedFrameRatesArray: Array<camera.FrameRateRange> = mVideoOutput!.getSupportedFrameRates();
          console.info(TAG,"rate",supportedFrameRatesArray.length);
          console.info(TAG,"min",supportedFrameRatesArray[0].min, supportedFrameRatesArray[0].max);
          mVideoOutput!.setFrameRate(supportedFrameRatesArray[0].min+1, supportedFrameRatesArray[0].max-1);
          let activeFrameRate = mVideoOutput!.getActiveFrameRate();
          expect(activeFrameRate.max == supportedFrameRatesArray[0].max-1).assertTrue()
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0100
     * @tc.desc   getVideoRotation videoRotation ROTATION_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0100';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let videoRotation = mVideoOutput!.getVideoRotation(camera.ImageRotation.ROTATION_0);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0200
     * @tc.desc   getVideoRotation videoRotation ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0200';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let videoRotation = mVideoOutput!.getVideoRotation(camera.ImageRotation.ROTATION_90);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0300
     * @tc.desc   getVideoRotation videoRotation ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0300';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let videoRotation = mVideoOutput!.getVideoRotation(camera.ImageRotation.ROTATION_180);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0400
     * @tc.desc   getVideoRotation videoRotation ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_VIDEO_ROTATION_STATIC_0400';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let videoRotation = mVideoOutput!.getVideoRotation(camera.ImageRotation.ROTATION_270);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CAMERA_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CAMERA_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.desc   camera.VideoOutput getActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CAMERA_GET_ACTIVE_PROFILE_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CAMERA_GET_ACTIVE_PROFILE_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let newProfile = mVideoOutput!.getActiveProfile();
        console.info(TAG, 'newProfile', JSON.stringify(newProfile))
        expect(newProfile.format != null).assertTrue();
        expect(newProfile.size.width >0).assertTrue();
        expect(newProfile.size.height >0).assertTrue()
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await releaseVideoSession();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let count = 0;
          mVideoOutput!.onError((err: BusinessError) => {
            console.error(`Camera input error code: `,err);
            count = 1;
          })
          console.info(TAG, testName, "Entering start");
          if (mVideoOutput!.isMirrorSupported()) {
            mVideoOutput!.offError();
            mVideoOutput!.enableMirror(true);
            await Utils.msSleep(500);
            expect(count).assertEqual(0);
            console.info(TAG, testName, "Entering start PASSED");
          } else {
            console.info(TAG, testName, "当前设备不支持此功能");
            mVideoOutput!.offError();
          }
          await releaseVideoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_Frame_Start_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_Frame_Start_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off FrameStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_Frame_Start_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_Frame_Start_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let count = 0;
          mVideoOutput?.onFrameStart((error) => {
            console.error(`Camera input error code: `,error);
            count = 1;
          });
          mVideoOutput?.offFrameStart();
          mVideoOutput?.start();
          await Utils.msSleep(500);
          expect(count).assertEqual(0);
          await releaseVideoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_FRAME_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_FRAME_END_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off FrameEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_FRAME_END_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_OFF_FRAME_END_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let count = 0;
          mVideoOutput?.onFrameEnd((error) => {
            console.error(`Camera input error code: `,error);
            count = 1;
          });
          mVideoOutput?.offFrameEnd();
          mVideoOutput?.start();
          await Utils.msSleep(500);
          mVideoOutput?.stop();
          await Utils.msSleep(500);
          expect(count).assertEqual(0);
          await releaseVideoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_start_static_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_start_static_0100
     * @tc.desc   mVideoOutput start 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_start_static_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_start_static_0100';
        try {
          if (isEmptyCameraDevice(mCameraDeviceArray)) {
            console.info(TAG, testName, ' mCameraDeviceArray is null.');
          } else {
            await createVideoOutput();
            mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
            await mVideoOutput!.start();
            console.info(TAG, testName, ' start.');
            expect().assertFail();
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :",error.code,error);
          expect(error.code).assertEqual(7400103);
        }
        await releaseVideoSession();
        done();
      })
  })
}