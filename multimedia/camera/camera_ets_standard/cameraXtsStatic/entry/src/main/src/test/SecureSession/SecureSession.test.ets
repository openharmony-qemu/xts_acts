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

const TAG = "CameraXtsSecureSessionStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mFocusState:camera.FocusState | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mFullCameraOutputCap: camera.CameraOutputCapability | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let mSecureOutput: camera.PreviewOutput | undefined;
let photoAsset: photoAccessHelper.PhotoAsset | undefined;
let mVideoSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let mVideoSession: camera.VideoSession | undefined;
let mSecureSession: camera.SecureSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
let mCaptureStartInfo: camera.CaptureStartInfo | undefined;
let mFrameShutterInfo: camera.FrameShutterInfo | undefined;
let mFrameShutterEndInfo: camera.FrameShutterEndInfo | undefined;
let mCaptureEndInfo: camera.CaptureEndInfo | undefined;
let EstimatedCaptureDuratio: number | undefined;
let fdNumber: number | undefined;
let mCameraOutputCap: camera.CameraOutputCapability | undefined;
let testContext:  Context;
let indexSurfaceId : string = "";
let receiver: image.ImageReceiver | undefined;
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
  let fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig!.url = fdPath;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmptyAVRecorder(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder!.state);
  mAVRecorder!.prepare(videoConfig!).then(() => {
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
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
  mPhotoOutput = mCameraManager!.createPhotoOutput(photoProfile);
}

async function createSecurePhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.SECURE_PHOTO)) {
      console.log(TAG, 'mSupportedModes', JSON.stringify(mSupportedModes));
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return haveValidDevice;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.SECURE_PHOTO);
  console.log(TAG, 'getSupportedOutputCapability', JSON.stringify(cameraOutputCap));

  let previewProfile = cameraOutputCap.previewProfiles[0];
  // 创建输入流
  console.log(TAG, 'find previewProfile: 111: ',previewProfile);
  mCameraInput = mCameraManager!.createCameraInput(useDevice);
  console.log(TAG, 'find mCameraInput: 21: ',mCameraInput);
  // 创建普通预览输出流
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId);
  console.log(TAG, 'find previewOutput: 13: ',mPreviewOutput);
  // 创建安全数据输出流
  const receiver = image.createImageReceiver({ width: previewProfile.size.width, height: previewProfile.size.height }, image.ImageFormat.JPEG, 8);
  console.log(TAG, 'find receiver: 14: ',receiver);
  const secureSurfaceId: string = await receiver!.getReceivingSurfaceId();
  console.log(TAG, 'find secureSurfaceId: 15: ',secureSurfaceId);
  mSecureOutput = mCameraManager!.createPreviewOutput(previewProfile, secureSurfaceId);
  console.log(TAG, 'find mSecureOutput: 16: ',mSecureOutput);
  return true;
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
  console.log(TAG, 'find cameraOutputCap: 111: ',cameraOutputCap);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  console.log(TAG, 'find previewProfile: 2222 ',previewProfile);
  let videoProfile = cameraOutputCap.videoProfiles[0];
  console.log(TAG, 'find videoProfile: 2222 ',videoProfile);
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
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
  CameraVideoProfile!.videoFrameWidth = videoProfile.size.width;
  CameraVideoProfile!.videoFrameHeight = videoProfile.size.height;
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
  console.log(TAG, 'createVideoOutput' + videoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager!.createVideoOutput(videoProfile, mVideoSurfaceId!);
  console.log(TAG, 'create preview output' + mPreviewOutput, 'createVideoOutput', mVideoOutput);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
  console.log(TAG, 'find mPhotoSession: 11: ');
  mPhotoSession!.beginConfig();
  console.log(TAG, 'find mPhotoSession: 2: ');
  mPhotoSession!.addInput(mCameraInput!);
  console.log(TAG, 'find mPhotoSession: 3: ');
  await mCameraInput!.open();
  console.log(TAG, 'find mPhotoSession: 4: ');
  mPhotoSession!.addOutput(previewOutput);
  console.log(TAG, 'find mPhotoSession: 5: ');
  mPhotoSession!.addOutput(photoOutput);
  console.log(TAG, 'find mPhotoSession: 6: ');
  await mPhotoSession!.commitConfig();
}

async function getCreateSecurePhotoSession(previewOutput: camera.PreviewOutput, secureOutput: camera.PreviewOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mSecureSession = mCameraManager!.createSession<camera.SecureSession>(camera.SceneMode.SECURE_PHOTO);
  console.log(TAG, 'find mSecureSession: 1: ',mSecureSession);
  mSecureSession!.beginConfig();
  console.log(TAG, 'find beginConfig: 2: ');
  mSecureSession!.addInput(mCameraInput!);
  console.log(TAG, 'find addInput: mCameraInput: ');
  await mCameraInput!.open(true);
  console.log(TAG, 'find open: ');
  mSecureSession!.addOutput(previewOutput);
  console.log(TAG, 'find addOutput: previewOutput: ');
  mSecureSession!.addOutput(secureOutput!);
  console.log(TAG, 'find addOutput: mSecureOutput: ');
  mSecureSession!.addSecureOutput(secureOutput!)
  console.log(TAG, 'find addSecureOutput: 2: ');
  await mSecureSession!.commitConfig();
  console.log(TAG, 'find commitConfig: 2: ');
  await mSecureSession!.start();
  console.log(TAG, 'find start: ');
}

function getCameraInput(): void {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    let cameras = mCameraManager!.getSupportedCameras();
    console.info(TAG, 'getSupportedCameras.',cameras[0]);
    if (cameras) {
      mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    }else {
      console.info(TAG, 'cameras null.');
    }
  }else{
    console.info(TAG, 'getSupportedCameraDeviceArray null.');
  }
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


function getFullOutputCapability(): void {
  console.info(TAG, 'getFullOutputCapability.');
  mFullCameraOutputCap = mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera, full output cap: ' + JSON.stringify(mFullCameraOutputCap));
}



let releasemSecureSessionInstance = async () => {
  await mSecureSession!.release();
}
export default function SecureSessionStaticTest():void {
  describe('SecureSessionStaticTest', () => {
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
      await sleep(1000);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OFF_ERROR_LISTEN_PREVIEW_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OFF_ERROR_LISTEN_PREVIEW_OUTPUT_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OFF_ERROR_LISTEN_PREVIEW_OUTPUT_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OFF_ERROR_LISTEN_PREVIEW_OUTPUT_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          console.info(TAG, testName + " start");
          let supp = await createSecurePhotoOutput();
          if(supp === true) {
            console.info(TAG, testName, " createSecurePhotoOutput");
            await getCreateSecurePhotoSession(mPreviewOutput!, mSecureOutput!);
            console.info(TAG, testName, " getCreateSecurePhotoSession");
            let count = 0;
            mSecureSession!.onError((err: BusinessError) => {
              console.error(`Camera input error code: `, err);
              count = 1;
            })
            console.info(TAG, testName, "Entering start");
            if (mSecureSession!.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO)) {
              mSecureSession!.offError();
              mSecureSession!.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO);
              let result = mSecureSession!.getExposureMode();
              await Utils.msSleep(500);
              expect(count).assertEqual(0);
              console.info(TAG, testName, "Entering start PASSED");
            } else {
              console.info(TAG, testName, "当前设备不支持此功能");
            }
            await releasemSecureSessionInstance();
          } else {
            console.info(TAG, testName, "创建相机流失败");
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasemSecureSessionInstance();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_FOCUS_STATECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_FOCUS_STATECHANGE_STATIC_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTESTs
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_FOCUS_STATECHANGE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ON_FOCUS_STATECHANGE_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let supp = await createSecurePhotoOutput();
          if(supp === true) {
            await getCreateSecurePhotoSession(mPreviewOutput!, mSecureOutput!);
            mSecureSession?.onFocusStateChange((error, mFocusState) => {
              if (error !== undefined && error!.code !== 0) {
                expect().assertFail();
              } else {
                console.info(TAG,
                  testName + ' succeed to listen onFocusStateChange on, photoAsset: ' +
                  JSON.stringify(mFocusState));
                expect(mFocusState == null).assertFalse();
                mSecureSession?.offFocusStateChange();
              }
            });
            if (mSecureSession!.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO)) {
              mSecureSession!.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO);
              let result = mSecureSession!.getExposureMode();
              console.info(TAG, testName, "Entering start PASSED", result);
            }
            await releasemSecureSessionInstance();
          } else {
            console.info(TAG, testName, "创建相机流失败");
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasemSecureSessionInstance();
        done();
      }
    })
  })
}