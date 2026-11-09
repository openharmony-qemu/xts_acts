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
import {describe,beforeAll,beforeEach,afterEach,afterAll,it,expect,Level,Hypium,Size,TestType} from '@ohos/hypium-static/src/main/indexStatic';
import { camera } from '@kit.CameraKit';
import { getPermission, resourceName, getFd } from '../Common.test';
import { Context } from '@kit.ArkUI';
import media from '@ohos.multimedia.media';
import Utils from '../Util.test';


const TAG = "CameraXtsPhotoOutputStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let mVideoSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let mVideoSession: camera.VideoSession | undefined;;
let mAVRecorder: media.AVRecorder | undefined;
let fdNumber: int | undefined;
let fdPath: string | undefined;
let testContext: Context;
let indexSurfaceId: string = "";
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

function getCameraInput(): boolean {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    mCameraInput!.open();
    if (isEmptyCameraInput(mCameraInput!)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
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

let indexZero: int = 0;
let indexOne: int = 1;
let defaultSize: int = 2;

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

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: CameraVideoProfile,
  url: 'file://',
};

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

async function createVideoOutput() {
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
  let mVideoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
    let foundProfile = cameraOutputCap.videoProfiles.find((indexVideoProfile: camera.Profile) => {
      console.log(TAG, 'find mVideoProfile: w: ' + indexVideoProfile.size.width + 'h: ' + indexVideoProfile.size.height);
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
  CameraVideoProfile.videoFrameWidth = mVideoProfile.size.width;
  CameraVideoProfile.videoFrameHeight = mVideoProfile.size.height;
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
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

async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput, videoOutput: camera.VideoOutput) {
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
  await mPreviewOutput!.release();
  await mVideoOutput!.release();
  await mVideoSession!.release();
}


export function photoSessionInfoChangeStaticTest(): void {
  describe('photoSessionInfoChangeStaticTest', () => {
    console.info(TAG + '----------photoSessionInfoChangeStatic--------------');
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
      await getVideoSurfaceId();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await Utils.msSleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_static_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_static_0100
     * @tc.desc   photoSessionInfoChange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_photoSessionInfoChange_static_0100';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
     console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      try {
        // 订阅ISO信息变化事件
        mPhotoSession!.onIsoInfoChange((isoInfo: camera.IsoInfo)=> {
          console.info(TAG, `${testName} ISO info changed,, isoInfo: ${JSON.stringify(isoInfo)}`);
          callbackTriggered = true;
        });
        // 检测是否支持ISO控制
        const hasIso: number = mPhotoSession!.getIso();
        console.info(TAG, `${testName} getIso: ${hasIso}`);
        let isoRange: Array<int> = mPhotoSession!.getSupportedIsoRange();
        if (isoRange != undefined && isoRange != null && isoRange.length >= 1) {
          mPhotoSession!.setIso(0);
          console.info(TAG, `${testName} setIsoFir: ${hasIso}`);
        }
        mPhotoSession!.offIsoInfoChange();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0100
     * @tc.desc onExposureInfoChange callback triggered test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const testName: string = 'SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      try {
        // 订阅onExposureInfoChange信息变化事件
        mPhotoSession!.onExposureInfoChange((expInfo: camera.ExposureInfo)=> {
          console.info(TAG, `${testName} ononExposureInfoChange info changed, exposureInfo: ${JSON.stringify(expInfo)}`);
          callbackTriggered = true;
        });
        console.info(TAG, `${testName} onIsoInfoChange success.`);
        mPhotoSession!.offExposureInfoChange();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0200
     * @tc.desc onExposureInfoChange callback triggered test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const testName: string = 'SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0200';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createVideoOutput();
      await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
      console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      try {
        // 订阅onExposureInfoChange信息变化事件
        mVideoSession!.onExposureInfoChange((expInfo: camera.ExposureInfo)=> {
          console.info(TAG, `${testName} ononExposureInfoChange info changed, exposureInfo: ${JSON.stringify(expInfo)}`);
          callbackTriggered = true;
        });
        console.info(TAG, `${testName} onIsoInfoChange success.`);
        mVideoSession!.offExposureInfoChange();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releaseVideoSession();
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0300
     * @tc.desc onExposureInfoChange callback triggered test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const testName: string = 'SUB_MULTIMEDIA_CAMERA_ONEXPOSUREINFOCHANGE_CALLBACK_TRIGGERED_STATIC_0300';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createVideoOutput();
      await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
      console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      let onExposureInfoChangecallback = (expInfo: camera.ExposureInfo)=> {
        console.info(TAG, `${testName} ononExposureInfoChange info changed, exposureInfo: ${JSON.stringify(expInfo)}`);
        callbackTriggered = true;
      }
      try {
        // 订阅onExposureInfoChange信息变化事件
        mVideoSession!.onExposureInfoChange(onExposureInfoChangecallback);
        console.info(TAG, `${testName} onIsoInfoChange success.`);
        mVideoSession!.offExposureInfoChange(onExposureInfoChangecallback);
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releaseVideoSession();
      done();
    });

  });
}

