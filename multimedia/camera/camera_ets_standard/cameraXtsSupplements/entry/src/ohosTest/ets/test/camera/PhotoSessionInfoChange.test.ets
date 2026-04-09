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
import { closeFd, driveFn, getFd, getPermission, isEmpty, resourceName, sleep } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';
import { JSON } from '@kit.ArkTS';

const TAG = "CameraXts.CameraSessionIsoInfoChangeTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoSurfaceId: string;
let mPhotoSession: camera.PhotoSession;
let mProfessionalSession: camera.ProfessionalPhotoSession;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

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
function createProfessionalSessionOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
    if (mSupportedModes.includes(camera.SceneMode.PROFESSIONAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.PROFESSIONAL_PHOTO);
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
async function getCreateProfessionalSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreateProfessionalSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.PROFESSIONAL_PHOTO);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
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

async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
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

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

async function releaseProfessionalSession() {
  console.info(TAG, 'releasProfessionalSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

export default function PhotoSessIsoInfoChangeTest() {
  describe('PhotoSessIsoInfoChangeTest', () => {
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
      await sleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
      AppStorage.delete('string1')
    });



    /**
     * @tc.name: SUB_MULTIMEDIA_CAMERA_isoInfoChange_callback_triggered_0100
     * @tc.number: SUB_MULTIMEDIA_CAMERA_isoInfoChange_callback_triggered_0100
     * @tc.desc: onIsoInfoChange callback triggered test.
     * @tc.type: FUNCTION
     * @tc.size: MediumTest
     * @tc.level: Level1
     */
    it('SUB_MULTIMEDIA_CAMERA_isoInfoChange_callback_triggered_0100',0, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CAMERA_isoInfoChange_callback_triggered_0100';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
     console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      try {
        // 订阅ISO信息变化事件
        mPhotoSession.onIsoInfoChange((isoInfo: camera.IsoInfo)=> {
          console.info(TAG, `${testName} ISO info changed,, isoInfo: ${JSON.stringify(isoInfo)}`);
          callbackTriggered = true;
        });
        // 检测是否支持ISO控制
        const hasIso: number = mPhotoSession.getIso();
        console.info(TAG, `${testName} getIso: ${hasIso}`);
        mPhotoSession.setIso(0);
        console.info(TAG, `${testName} setIsoFir: ${hasIso}`);
        // mPhotoSession.setIso(3.3);
        // console.info(TAG, `${testName} getIsoSec: ${hasIso}`);
        await sleep(1000);
        mPhotoSession.offIsoInfoChange();
        await sleep(500);
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
     * @tc.name: SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_callback_triggered_0100
     * @tc.number: SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_callback_triggered_0100
     * @tc.desc: onExposureInfoChange callback triggered test.
     * @tc.type: FUNCTION
     * @tc.size: MediumTest
     * @tc.level: Level1
     */
    it('SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_callback_triggered_0100',0, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CAMERA_onExposureInfoChange_callback_triggered_0100';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      console.info(TAG, `${testName} in success isoInfo`);
      // ========== 测试过程 ==========
      let callbackTriggered: boolean = false;
      try {
        // 订阅onExposureInfoChange信息变化事件
        mPhotoSession.onExposureInfoChange((expInfo: camera.ExposureInfo)=> {
          console.info(TAG, `${testName} ononExposureInfoChange info changed, exposureInfo: ${JSON.stringify(expInfo)}`);
          callbackTriggered = true;
        });
        console.info(TAG, `${testName} onIsoInfoChange success.`);
        mPhotoSession.offExposureInfoChange();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, `${testName} failed. err: ${error.code}, msg: ${error.message}`);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });

  });
}