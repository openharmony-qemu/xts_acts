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
import Utils from '../Util.test';

const TAG = "CameraXtsPreviewOutputStaticTest";
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
let mVideoSession: camera.VideoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
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
  let previewProfile = cameraOutputCap.previewProfiles![0];
  let photoProfile = cameraOutputCap.photoProfiles![0];
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
  let previewProfile = cameraOutputCap.previewProfiles![0];
  let videoProfile = cameraOutputCap.videoProfiles![0];
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
  await mPhotoSession!.start();
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
    if (supportedFrameRatesArray.length > 0) {
      callback(supportedFrameRatesArray);
    } else {
      done();
    }
    await releasePhotoSession();
  }
}

export default function PreviewOutputStaticTest():void {
  describe('PreviewOutputStaticTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
      // getOutputCapability();
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
     * @tc.name   SUB_MULTIMEDIA_PREVIEW_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PREVIEW_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100
     * @tc.desc   camera.PreviewOutput getSupportedFrameRates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_PREVIEW_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PREVIEW_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let supportedFrameRates = mPreviewOutput!.getSupportedFrameRates();
            console.info(TAG, testName, "end :");
            expect(supportedFrameRates!= null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200';
        previewOutputSetFrameRate(done, testName, (supportedFrameRatesArray) => {
          try {
            if (supportedFrameRatesArray![0].max > 0) {
              console.info(TAG, testName, `supportedFrameRatesArray.length: `, supportedFrameRatesArray!.length)
              mPreviewOutput!.setFrameRate(30, -31);
              console.info(TAG, testName,
                `videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray![0].min},max:${supportedFrameRatesArray![0].max}`)
              done();
            } else {
              console.info(TAG, testName, 'The Device is Not supportedFrameRates');
              done();
            }
          } catch (err) {
            console.error(TAG, testName, "fail error:", err.message, err.code);
            expect(err.code).assertEqual('7400110');
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300';
        previewOutputSetFrameRate(done, testName, (supportedFrameRatesArray) => {
          try {
            if (supportedFrameRatesArray![0].max > 0) {
              console.info(TAG, testName, `supportedFrameRatesArray.length: `, supportedFrameRatesArray!.length)
              mPreviewOutput!.setFrameRate(30000, -10000);
              console.info(TAG, testName,
                `videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray![0].min},max:${supportedFrameRatesArray![0].max}`)
              done();
            } else {
              console.info(TAG, testName, 'The Device is Not supportedFrameRates');
              done();
            }
          } catch (err) {
            console.error(TAG, testName, "fail error:", err.message, err.code);
            expect(err.code).assertEqual('7400110');
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_PREVIEW_ROTATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_PREVIEW_ROTATION_STATIC_0100
     * @tc.desc   getPreviewRotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_PREVIEW_ROTATION_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_PREVIEW_ROTATION_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let imageRotation: camera.ImageRotation = camera.ImageRotation.ROTATION_270;
        mPreviewOutput!.setPreviewRotation(imageRotation);
        let res: camera.ImageRotation = mPreviewOutput!.getPreviewRotation()
        console.info(TAG, testName, 'getPreviewOutputRotation, expected: ', res, 'actual: ', imageRotation);
        expect(res == camera.ImageRotation.ROTATION_0 ||
          res == camera.ImageRotation.ROTATION_90 ||
          res == camera.ImageRotation.ROTATION_180 ||
          res == camera.ImageRotation.ROTATION_270).assertTrue();
        await releaseVideoSession();
        done()
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_PREVIEW_ROTATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_PREVIEW_ROTATION_STATIC_0100
     * @tc.desc   setPreviewRotation first parameter enum coverage, second parameter true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_PREVIEW_ROTATION_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_PREVIEW_ROTATION_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      const formats = [
        camera.ImageRotation.ROTATION_90,
        camera.ImageRotation.ROTATION_180,
        camera.ImageRotation.ROTATION_270
      ];
      for (const format of formats) {
        try {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          console.info(TAG, 'start');
          let previewRotation: camera.ImageRotation = format;
          mPreviewOutput!.setPreviewRotation(previewRotation, true);
          console.info(TAG, 'success setPreviewRotation');
          let res: camera.ImageRotation = mPreviewOutput!.getPreviewRotation();
          console.info(TAG, testName, 'getPreviewOutputRotation, expected: ', res, 'actual: ', previewRotation);
          expect(
            res == camera.ImageRotation.ROTATION_0 ||
              res == camera.ImageRotation.ROTATION_90 ||
              res == camera.ImageRotation.ROTATION_180 ||
              res == camera.ImageRotation.ROTATION_270
          ).assertTrue();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
          expect().assertFail();
          done();
        } finally {
          await mAVRecorder!.release();
          await mPreviewOutput!.release();
          await mVideoOutput!.release();
          await mVideoSession!.release();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.desc   getActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput()
        let newProfile = mPreviewOutput!.getActiveProfile();
        console.info(TAG, 'newProfile', JSON.stringify(newProfile))
        expect(newProfile != null).assertTrue();
        expect(newProfile.size.width>0).assertTrue();
        expect(newProfile.size.height>0).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_BAND_SUPP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_BAND_SUPP_STATIC_0100
     * @tc.desc   test camera isBandwidthCompressionSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_BAND_SUPP_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_BAND_SUPP_STATIC_0100'
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let supp = mPreviewOutput!.isBandwidthCompressionSupported();
          console.info(TAG, testName, 'isBandwidthCompressionSupported', supp);
          expect(supp != null).assertTrue();
        }
      } catch (err) {
        console.error(TAG, testName, JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_ERROR_LISTEN_PREVIEWOUTPUT_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let count = 0;
          mPreviewOutput!.onError((err: BusinessError) => {
            console.error(`Camera input error code: `,err);
            count = 1;
          })
          console.info(TAG, testName, "Entering start");
          if (mPreviewOutput!.isBandwidthCompressionSupported()) {
            mPreviewOutput!.offError();
            mPreviewOutput!.enableBandwidthCompression(true);
            await Utils.msSleep(500);
            expect(count).assertEqual(0);
            console.info(TAG, testName, "Entering start PASSED");
          } else {
            console.info(TAG, testName, "当前设备不支持此功能");
            mPreviewOutput!.offError();
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally {
        await mPhotoSession!.release();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_Frame_Start_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_Frame_Start_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off FrameStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_Frame_Start_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_Frame_Start_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let count = 0;
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPreviewOutput?.onFrameStart((error) => {
            console.error(`Camera input error code: `,error);
            count = 1;
          });
          mPreviewOutput?.offFrameStart();
          mPhotoSession?.start();
          await Utils.msSleep(500);
          expect(count).assertEqual(0);
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally {
        await mPhotoSession!.release();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_FRAME_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_FRAME_END_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off FrameEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_FRAME_END_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_OFF_FRAME_END_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let count = 0;
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPreviewOutput?.onFrameEnd((error) => {
            console.error(`Camera input error code: `,error);
            count = 1;
          });
          mPreviewOutput?.offFrameEnd();
          mPhotoSession?.start();
          await Utils.msSleep(500);
          mPhotoSession?.stop();
          await Utils.msSleep(500);
          expect(count).assertEqual(0);
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally {
        await mPhotoSession!.release();
        done();
      }
    })
  })
}
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  COMMON_WAIT_DURATION, getFd, getPermission, resourceName, sleep
} from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import { Context } from '@kit.ArkUI';
import Utils from '../Util.test';

const TAG = "CameraXtsManualExposureStaticTest";
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
let mVideoSession: camera.VideoSession | undefined;
let cPhotoSession: camera.PhotoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
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
  let previewProfile = cameraOutputCap.previewProfiles![0];
  let photoProfile = cameraOutputCap.photoProfiles![0];
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
  let previewProfile = cameraOutputCap.previewProfiles![0];
  let videoProfile = cameraOutputCap.videoProfiles![0];
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
  await mPhotoSession!.start();
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

export default function ManualExposureStaticTest():void {
  describe('ManualExposureStaticTest', () => {
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
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0100
     * @tc.desc   getRAWCaptureZoomRatioRange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
        console.info(TAG, testName, "photoSesion", mPhotoSession);
        let rawCaptureZoomRatioRange = mPhotoSession!.getRAWCaptureZoomRatioRange();
        console.info(TAG, testName + ' rawCaptureZoomRatioRange: ' + JSON.stringify(rawCaptureZoomRatioRange));
        expect(rawCaptureZoomRatioRange).assertUndefined;
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releasePhotoSession();
        done();
      }
    })
    // /**
    //  * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0200
    //  * @tc.number SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0200
    //  * @tc.desc   getRAWCaptureZoomRatioRange abnormal test 7400103.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL2
    //  */
    // it('SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   const testName = 'SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0200';
    //   if (isEmptyCameraManager(mCameraManager)) {
    //     console.info(TAG, `${testName} cameraManager is null.`);
    //     done();
    //     return;
    //   }
    //   try {
    //     createPhotoOutput();
    //     // mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
    //     // console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
    //     let rawCaptureZoomRatioRange = mPhotoSession!.getRAWCaptureZoomRatioRange();
    //     console.info(TAG, testName + ' rawCaptureZoomRatioRange: ' + JSON.stringify(rawCaptureZoomRatioRange));
    //     expect().assertFail();
    //     await releasePhotoSession();
    //     done();
    //   } catch (err) {
    //     console.error(TAG, testName, err.message, err.code);
    //     expect(err.code).assertEqual(7400103);
    //     expect(err.code).assertEqual(7400103);
    //     await releasePhotoSession();
    //     done();
    //   }
    // })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0300
     * @tc.desc   getRAWCaptureZoomRatioRange normal test 7400102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0300', Level.LEVEL2,async (done: () => void): Promise<void> =>  {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_STATIC_0300';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        await mPhotoSession!.commitConfig();
        mPhotoSession!.beginConfig();
        mPhotoSession!.addInput(mCameraInput!);
        await mCameraInput!.open();
        let rawCaptureZoomRatioRange = mPhotoSession!.getRAWCaptureZoomRatioRange();
        console.info(TAG, testName + ' rawCaptureZoomRatioRange: ' + JSON.stringify(rawCaptureZoomRatioRange));
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(err.code).assertEqual(7400102);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0100
     * @tc.desc   getSupportedExposureDurationRange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager)) {
          console.info(TAG, `${testName} cameraManager is null.`);
          done();
          return;
        }
        try {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let durationRange = mPhotoSession!.getSupportedExposureDurationRange();
          console.info(TAG, testName + ' durationRange: ' + JSON.stringify(durationRange));
          expect(durationRange != null).assertTrue();
          await releasePhotoSession();
          done();
        } catch (err) {
          console.error(TAG, testName, err.message, err.code);
          expect().assertFail()
          await releasePhotoSession();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0200
     * @tc.desc   getSupportedExposureDurationRange normal test 7400102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> =>  {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager)) {
          console.info(TAG, `${testName} cameraManager is null.`);
          done();
          return;
        }
        try {
          createPhotoOutput();
          mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
          console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
          await mPhotoSession!.commitConfig();
          mPhotoSession!.beginConfig();
          mPhotoSession!.addInput(mCameraInput!);
          await mCameraInput!.open();
          let durationRange = mPhotoSession!.getSupportedExposureDurationRange();
          console.info(TAG, testName + ' durationRange: ' + JSON.stringify(durationRange));
          expect().assertFail();
          await releasePhotoSession();
          done();
        } catch (err) {
          console.error(TAG, testName, err.message, err.code);
          expect(err.code).assertEqual(7400102);
          await releasePhotoSession();
          done();
        }
      })
    // /**
    //  * @tc.name   SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0300
    //  * @tc.number SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0300
    //  * @tc.desc   getSupportedExposureDurationRange normal test 7400103.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL2
    //  */
    // it('SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0300', Level.LEVEL2,
    //   async (done: () => void): Promise<void> =>  {
    //     const testName = 'SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_STATIC_0300';
    //     if (isEmptyCameraManager(mCameraManager)) {
    //       console.info(TAG, `${testName} cameraManager is null.`);
    //       done();
    //       return;
    //     }
    //     try {
    //       createPhotoOutput();
    //       mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
    //       let durationRange = mPhotoSession!.getSupportedExposureDurationRange();
    //       console.info(TAG, testName + ' durationRange: ' + JSON.stringify(durationRange));
    //       expect().assertFail();
    //       await releasePhotoSession();
    //       done();
    //     } catch (err) {
    //       console.error(TAG, testName, err.message, err.code);
    //       expect(err.code).assertEqual(7400103);
    //       await releasePhotoSession();
    //       done();
    //     }
    //   })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0100
     * @tc.desc   getExposureBiasStep abnormal test 7400103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        let biasStep = mPhotoSession!.getExposureBiasStep();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + biasStep);
        expect(biasStep !=null).assertTrue();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0200
     * @tc.desc   getExposureBiasStep abnormal test 7400102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      const testName = 'SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_STATIC_0200';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        await mPhotoSession!.commitConfig();
        mPhotoSession!.beginConfig();
        mPhotoSession!.addInput(mCameraInput!);
        await mCameraInput!.open();
        let biasStep: number = mPhotoSession!.getExposureBiasStep();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + biasStep);
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(err.code).assertEqual(7400102);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0100
     * @tc.desc   getExposureDuration abnormal test 7400103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        let exposureDuration = mPhotoSession!.getExposureDuration();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + exposureDuration);
        expect(exposureDuration !=null).assertTrue();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0200
     * @tc.desc   getExposureDuration abnormal test 7400102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_STATIC_0200';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        await mPhotoSession!.commitConfig();
        mPhotoSession!.beginConfig();
        mPhotoSession!.addInput(mCameraInput!);
        await mCameraInput!.open();
        let exposureDuration: number = mPhotoSession!.getExposureDuration();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + exposureDuration);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(err.code).assertEqual(7400102);
      }finally {
        sleep(1000);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_STATIC_0100
     * @tc.desc   addDeferredSurface abnormal test 7400101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_STATIC_0100', Level.LEVEL2,async (done: () => void): Promise<void> =>  {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
        mPreviewOutput!.addDeferredSurface("");
        console.info(TAG, testName + ' addDeferredSurface success: ');
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(err.code).assertEqual(7400101);
        await releasePhotoSession();
        done();
      }
    })

  })
}