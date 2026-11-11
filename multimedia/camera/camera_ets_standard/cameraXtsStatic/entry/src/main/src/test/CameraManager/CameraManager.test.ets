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
let mMetaDataOutput: camera.MetadataOutput | undefined;
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
let testContext: Context = Hypium.get("Context") as Context;
let indexSurfaceId = Hypium.get('SurfaceId') as string | undefined;
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
let isEmpty03 = (data: camera.CameraInput | undefined) => {
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

function getOutputCapability(): void {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], mSupportedModes![0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
}

let getCameraManagerInstance = () => {
  console.info('Enter getCameraManagerInstance');
  let appContext: Context = Hypium.get("Context") as Context;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty01(mCameraManager!)) {
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
  if (isEmpty02(mCameraDeviceArray!)) {
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

export default function CameraManagerStaticTest():void {
  describe('CameraManagerStaticTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      await sleep(500);
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_STATIC_0100
     * @tc.desc   No abnormal scenarios--Get supported camera device objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_STATIC_0100', Level.LEVEL0, (done: () => void): void => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty01(mCameraManager!)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraDeviceArray: Array<camera.CameraDevice> = mCameraManager!.getSupportedCameras();
          console.info(TAG, testName + ' supported camera list: ' + JSON.stringify(cameraDeviceArray));
          if (cameraDeviceArray !== null && cameraDeviceArray.length > 0) {
            for (let i = 0; i < cameraDeviceArray.length; i++) {
              let cameraId = cameraDeviceArray[i].cameraId;
              expect(cameraId == undefined).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', id: ' + cameraId);
              let cameraPosition = cameraDeviceArray[i].cameraPosition;
              expect(cameraPosition == undefined).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', position: ' + cameraPosition);
              let cameraType = cameraDeviceArray[i].cameraType;
              expect(cameraType == undefined).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', type: ' + cameraType);
              let connectionType = cameraDeviceArray[i].connectionType;
              expect(connectionType == undefined).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', connection type: ' + connectionType);
              let cameraOrientation = cameraDeviceArray[i].cameraOrientation;
              expect(cameraOrientation == undefined).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', orientation: ' + cameraOrientation);
              let hostDeviceName = cameraDeviceArray[i].hostDeviceName;
              expect(hostDeviceName == undefined).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', host device name: ' + hostDeviceName);
              let hostDeviceType = cameraDeviceArray[i].hostDeviceType;
              expect(hostDeviceType == undefined).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', host device type: ' + hostDeviceType);
            }
          } else {
            expect().assertFail();
            console.info(TAG, testName + ' cameraDeviceArray is null.');
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_SESSION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_SESSION_STATIC_0100
     * @tc.desc   createSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_SESSION_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_SESSION_STATIC_0100';
      try {
        mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
        expect(mPhotoSession != null).assertTrue();
        await mPhotoSession!.release();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0100
     * @tc.desc   createPhotoOutput profile format CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let mFormat:camera.CameraFormat= camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.photoProfiles.length; j++)
              {
                if (mCameraOutputCapability.photoProfiles[j].format === mFormat) {
                  mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCapability.photoProfiles[j]);
                  let newProfile = mPhotoOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPhotoOutput!.release();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0200
     * @tc.desc   createPhotoOutput profile format CAMERA_FORMAT_JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTESTs
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.photoProfiles.length; j++) {
                if (mCameraOutputCapability.photoProfiles[j].format === mFormat) {
                  mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCapability.photoProfiles[j]);
                  let newProfile = mPhotoOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPhotoOutput!.release();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0300
     * @tc.desc   createPhotoOutput profile format CAMERA_FORMAT_YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0300';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.photoProfiles.length; j++) {
                if (mCameraOutputCapability.photoProfiles[j].format === mFormat) {
                  mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCapability.photoProfiles[j]);
                  let newProfile = mPhotoOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPhotoOutput!.release();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0400
     * @tc.desc   createPhotoOutput profile format CAMERA_FORMAT_YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.photoProfiles.length; j++) {
                if (mCameraOutputCapability.photoProfiles[j].format === mFormat) {
                  mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCapability.photoProfiles[j]);
                  let newProfile = mPhotoOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPhotoOutput!.release();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0500
     * @tc.desc   createPhotoOutput profile format CAMERA_FORMAT_HEIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.photoProfiles.length; j++) {
                if (mCameraOutputCapability.photoProfiles[j].format === mFormat) {
                  mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCapability.photoProfiles[j]);
                  let newProfile = mPhotoOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPhotoOutput!.release();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0600
     * @tc.desc   createPhotoOutput profile format CAMERA_FORMAT_YUV_420_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_STATIC_0600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.photoProfiles.length; j++) {
                if (mCameraOutputCapability.photoProfiles[j].format === mFormat) {
                  mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCapability.photoProfiles[j]);
                  let newProfile = mPhotoOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPhotoOutput!.release();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0100
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_1100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_1100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let indexSurfaceId = Hypium.get('SurfaceId') as string;
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_RGBA_8888;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.previewProfiles.length; j++) {
                if (mCameraOutputCapability.previewProfiles[j].format === mFormat) {
                  mPreviewOutput =
                    mCameraManager!.createPreviewOutput(mCameraOutputCapability.previewProfiles[j], indexSurfaceId);
                  let newProfile = mPreviewOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPreviewOutput!.release();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0200
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTESTs
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let indexSurfaceId = Hypium.get('SurfaceId') as string;
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_JPEG;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.previewProfiles.length; j++) {
                if (mCameraOutputCapability.previewProfiles[j].format === mFormat) {
                  mPreviewOutput =
                    mCameraManager!.createPreviewOutput(mCameraOutputCapability.previewProfiles[j], indexSurfaceId);
                  let newProfile = mPreviewOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPreviewOutput!.release();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0300
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0300';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let indexSurfaceId = Hypium.get('SurfaceId') as string;
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.previewProfiles.length; j++) {
                if (mCameraOutputCapability.previewProfiles[j].format === mFormat) {
                  mPreviewOutput =
                    mCameraManager!.createPreviewOutput(mCameraOutputCapability.previewProfiles[j], indexSurfaceId);
                  let newProfile = mPreviewOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPreviewOutput!.release();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0400
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let indexSurfaceId = Hypium.get('SurfaceId') as string;
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.previewProfiles.length; j++) {
                if (mCameraOutputCapability.previewProfiles[j].format === mFormat) {
                  mPreviewOutput =
                    mCameraManager!.createPreviewOutput(mCameraOutputCapability.previewProfiles[j], indexSurfaceId);
                  let newProfile = mPreviewOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPreviewOutput!.release();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0500
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_HEIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let indexSurfaceId = Hypium.get('SurfaceId') as string;
            let mFormat: camera.CameraFormat = camera.CameraFormat.CAMERA_FORMAT_HEIC;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.previewProfiles.length; j++) {
                if (mCameraOutputCapability.previewProfiles[j].format === mFormat) {
                  mPreviewOutput =
                    mCameraManager!.createPreviewOutput(mCameraOutputCapability.previewProfiles[j], indexSurfaceId);
                  let newProfile = mPreviewOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
        mPreviewOutput!.release();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0600
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_YUV_420_SP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let indexSurfaceId = Hypium.get('SurfaceId') as string;
            let mFormat:camera.CameraFormat= camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              let mCameraOutputCapability =
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
              for (let j = 0; j < mCameraOutputCapability.previewProfiles.length; j++)
              {
                if (mCameraOutputCapability.previewProfiles[j].format === mFormat) {
                  mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCapability.previewProfiles[j], indexSurfaceId);
                  let newProfile = mPreviewOutput!.getActiveProfile();
                  expect(newProfile.format).assertEqual(mFormat);
                  break;
                }else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        mPreviewOutput!.release();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0700
     * @tc.desc   createPreviewOutput surfaceId ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0700';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_VIDEO);
            mPreviewOutput = mCameraManager!.createPreviewOutput(cameraOutputCapability.previewProfiles[0], "");
            console.info(TAG, "success newPreviewOutput", mPreviewOutput)
            expect(mPreviewOutput != null).assertTrue();
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        mPreviewOutput!.release();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0800
     * @tc.desc   createPreviewOutput surfaceId ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_STATIC_0800';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            mPreviewOutput = mCameraManager!.createPreviewOutput("");
            console.info(TAG, "success newPreviewOutput", mPreviewOutput)
            expect(mPreviewOutput != null).assertTrue();
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        mPreviewOutput!.release();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_STATIC_0100
     * @tc.desc   createMetadataOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_METADATA_OUTPUT_STATIC_0100';
      try {
        mMetaDataOutput = mCameraManager!.createMetadataOutput([]);
        console.info(TAG, "success createMetadataOutput", mMetaDataOutput)
        expect(mMetaDataOutput != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail()
      }
      mMetaDataOutput!.release();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0100
     * @tc.desc   createVideoOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0100';
      try {
        mVideoOutput = mCameraManager!.createVideoOutput("");
        console.info(TAG, "success createVideoOutput", mVideoOutput)
        expect(mVideoOutput != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
      }
      mVideoOutput!.release();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0200
     * @tc.desc   createVideoOutput Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_STATIC_0200';
      try {
        let cameraOutputCapability =
          mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_VIDEO);
        mVideoOutput = mCameraManager!.createVideoOutput(cameraOutputCapability.videoProfiles[0],"");
        console.info(TAG, "success createVideoOutput", mVideoOutput)
        expect(mVideoOutput != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
      }
      mVideoOutput!.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0100
     * @tc.desc   createCameraInput camera CameraPosition CAMERA_POSITION_FRONT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              console.info(TAG, testName, "createCameraInput ok:",mCameraDeviceArray![i].cameraPosition);
              if (mCameraDeviceArray![i].cameraPosition === position ) {
                console.info(TAG, testName, "createCameraInput ok:", mCameraManager);
                const input = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(input != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0200
     * @tc.desc   createCameraInput camera CameraPosition CAMERA_POSITION_UNSPECIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0400
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0500
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0600
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0700
     * @tc.desc   createCameraInput camera CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0700';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0800
     * @tc.desc   createCameraInput camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0800';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0900
     * @tc.desc   createCameraInput camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_0900';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1000
     * @tc.desc   createCameraInput camera HostDeviceType PHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1000';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hosDeviceType = camera.HostDeviceType.PHONE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hosDeviceType === mCameraDeviceArray![i].hostDeviceType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1100
     * @tc.desc   createCameraInput camera HostDeviceType TABLET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_CAMERA_DEVICE_STATIC_1100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hosDeviceType = camera.HostDeviceType.TABLET;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hosDeviceType === mCameraDeviceArray![i].hostDeviceType) {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![i]);
                console.info(TAG, testName, "createCameraInput ok:");
                expect(mCameraInput != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0100
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_UNSPECIFIED and CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
            let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0200
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0300
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_BACK and CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0300';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_BACK;
            let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0400
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_BACK and CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_BACK;
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0500
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0600
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0700
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0700';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0800
     * @tc.desc   createCameraInput CameraPosition CAMERA_POSITION_FRONT and CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0800';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                if (type === mCameraDeviceArray![i].cameraType) {
                  mCameraInput = mCameraManager!.createCameraInput(position, type);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(mCameraInput != null).assertTrue();
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0900
     * @tc.desc   createCameraInput Camera service fatal error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_STATIC_0900';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            mCameraInput = mCameraManager!.createCameraInput(position, type);
            expect().assertFail();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0100
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_UNSPECIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL20
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position ===mCameraDeviceArray![i].cameraPosition) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0200
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_BACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_BACK;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0300
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_FRONT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0300';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0400
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0500
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0600
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0700
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0700';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0800
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0800';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0900
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_BUILT_IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_0900';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1000
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1000';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1100
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_REMOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1200
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType UNKNOWN_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hostType = camera.HostDeviceType.UNKNOWN_TYPE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hostType === mCameraDeviceArray![i].hostDeviceType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1300
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType PHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1300';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hostType = camera.HostDeviceType.PHONE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hostType === mCameraDeviceArray![i].hostDeviceType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1400
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType TABLET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hostType = camera.HostDeviceType.TABLET;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hostType === mCameraDeviceArray![i].hostDeviceType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1500
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if ("" === mCameraDeviceArray![i].cameraId) {
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                expect().assertFail();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1600
     * @tc.desc   getSupportedOutputCapability camera hostDeviceName ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if ("" === mCameraDeviceArray![i].hostDeviceName) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1700
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_UNSPECIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1700';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1800
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_BACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1800';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_BACK;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1900
     * @tc.desc   getSupportedOutputCapability camera CameraPosition CAMERA_POSITION_FRONT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_1900';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (position === mCameraDeviceArray![i].cameraPosition) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2000
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2000';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2100
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_WIDE_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2200
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_ULTRA_WIDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2300
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TELEPHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2300';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2400
     * @tc.desc   getSupportedOutputCapability camera CameraType CAMERA_TYPE_TRUE_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (type === mCameraDeviceArray![i].cameraType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2500
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2500
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_BUILT_IN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2600
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_USB_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2700
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2700
     * @tc.desc   getSupportedOutputCapability camera ConnectionType CAMERA_CONNECTION_REMOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2700';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (connectType === mCameraDeviceArray![i].connectionType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2800
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType UNKNOWN_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2800';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hostType = camera.HostDeviceType.UNKNOWN_TYPE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hostType === mCameraDeviceArray![i].hostDeviceType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2900
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType PHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_2900';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hostType = camera.HostDeviceType.PHONE;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hostType === mCameraDeviceArray![i].hostDeviceType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3000
     * @tc.desc   getSupportedOutputCapability camera HostDeviceType TABLET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3000';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let hostType = camera.HostDeviceType.TABLET;
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (hostType === mCameraDeviceArray![i].hostDeviceType) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3100
     * @tc.desc   getSupportedOutputCapability Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if ("" === mCameraDeviceArray![i].cameraId) {
                mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                expect().assertFail();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3200
     * @tc.desc   getSupportedOutputCapability camera hostDeviceName ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if ("" === mCameraDeviceArray![i].hostDeviceName) {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![i], camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3300
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability photoProfiles format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3300';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_PHOTO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.photoProfiles[0].format != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3400
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability photoProfiles size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3400';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_PHOTO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.photoProfiles[0].size.height > 0).assertTrue();
            expect(cameraOutputCapability.photoProfiles[0].size.width > 0).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3500
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability videoProfiles frameRateRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_VIDEO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.videoProfiles[0].frameRateRange.min > 0).assertTrue();
            expect(cameraOutputCapability.videoProfiles[0].frameRateRange.max > 0).assertTrue();
            console.info(TAG, testName, "done ok:");
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3600
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability videoProfiles format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_VIDEO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.videoProfiles[0].format != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3700
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability videoProfiles size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3700';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_VIDEO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.videoProfiles[0].size.height > 0).assertTrue();
            expect(cameraOutputCapability.videoProfiles[0].size.width > 0).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3800
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability previewProfiles size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3800';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_PHOTO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
            expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3900
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability previewProfiles format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_3900';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_PHOTO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_4000
     * @tc.desc   getSupportedOutputCapability cameraOutputCapability supportedMetadataObjectTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_4000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_OUTPUT_CAPABILITY_STATIC_4000';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            let cameraOutputCapability =
              mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], camera.SceneMode.NORMAL_PHOTO);
            console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
            expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
          }
          done();
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0100
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraPosition .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0100';
        const formats = [
          camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
          camera.CameraPosition.CAMERA_POSITION_BACK,
          camera.CameraPosition.CAMERA_POSITION_FRONT
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].cameraPosition) {
                  let result = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![i]);
                  console.info(TAG, testName, "createCameraInput ok:");
                  expect(result != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0200
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraType -all camera types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0200';
        const formats = [
          camera.CameraType.CAMERA_TYPE_DEFAULT,
          camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
          camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
          camera.CameraType.CAMERA_TYPE_TELEPHOTO,
          camera.CameraType.CAMERA_TYPE_TRUE_DEPTH
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].cameraType) {
                  let result = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![i]);
                  console.info(TAG, testName, "getSupportedSceneModes ok:");
                  expect(result != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0300
     * @tc.desc   CameraManager -getSupportedSceneModes -connectionType -all connection types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0300';
        const formats = [
          camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
          camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
          camera.ConnectionType.CAMERA_CONNECTION_REMOTE
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].connectionType) {
                  let result = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![i]);
                  console.info(TAG, testName, "getSupportedSceneModes ok:");
                  expect(result != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0400
     * @tc.desc   CameraManager -getSupportedSceneModes -hostDeviceType -all host types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0400';
        const formats = [
          camera.HostDeviceType.UNKNOWN_TYPE,
          camera.HostDeviceType.PHONE,
          camera.HostDeviceType.TABLET
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].hostDeviceType) {
                  let result = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![i]);
                  console.info(TAG, testName, "getSupportedSceneModes ok:");
                  expect(result != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0500
     * @tc.desc   CameraManager -getSupportedSceneModes -cameraId "".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (mCameraDeviceArray![i].cameraId === "") {
                let result = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![i]);
                console.info(TAG, testName, "getSupportedSceneModes ok:");
                expect().assertFail();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0600
     * @tc.desc   CameraManager -getSupportedSceneModes -hostDeviceName "".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_MANAGER_GET_SUPPORTED_SCENE_MODES_STATIC_0600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (mCameraDeviceArray![i].hostDeviceName === "") {
                let result = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![i]);
                console.info(TAG, testName, "getSupportedSceneModes ok:");
                expect(result != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0100
     * @tc.desc   getSupportedFullOutputCapability camera CameraPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0100';
        const formats = [
          camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
          camera.CameraPosition.CAMERA_POSITION_BACK,
          camera.CameraPosition.CAMERA_POSITION_FRONT
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].cameraPosition) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.NORMAL_PHOTO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.photoProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.photoProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.photoProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0200
     * @tc.desc   getSupportedFullOutputCapability camera CameraType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0200';
        const formats = [
          camera.CameraType.CAMERA_TYPE_DEFAULT,
          camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
          camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
          camera.CameraType.CAMERA_TYPE_TELEPHOTO,
          camera.CameraType.CAMERA_TYPE_TRUE_DEPTH
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].cameraType) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.NORMAL_PHOTO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.photoProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.photoProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.photoProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0300
     * @tc.desc   getSupportedFullOutputCapability camera ConnectionType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0300';
        const formats = [
          camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
          camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
          camera.ConnectionType.CAMERA_CONNECTION_REMOTE
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].connectionType) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.SECURE_PHOTO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0400
     * @tc.desc   getSupportedFullOutputCapability camera HostDeviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0400';
        const formats = [
          camera.HostDeviceType.UNKNOWN_TYPE,
          camera.HostDeviceType.PHONE,
          camera.HostDeviceType.TABLET
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].hostDeviceType) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.SECURE_PHOTO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0500
     * @tc.desc   getSupportedFullOutputCapability camera hostDeviceName ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0500';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (mCameraDeviceArray![i].hostDeviceName === "") {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                    camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability.photoProfiles[0].format != null).assertTrue();
                expect(cameraOutputCapability.photoProfiles[0].size.height > 0).assertTrue();
                expect(cameraOutputCapability.photoProfiles[0].size.width > 0).assertTrue();
                expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0600
     * @tc.desc   getSupportedFullOutputCapability camera cameraId ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0600';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (mCameraDeviceArray![i].cameraId === "") {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                    camera.SceneMode.NORMAL_PHOTO);
                console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                expect().assertFail();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0700
     * @tc.desc   getSupportedFullOutputCapability camera CameraPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0700';
        const formats = [
          camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
          camera.CameraPosition.CAMERA_POSITION_BACK,
          camera.CameraPosition.CAMERA_POSITION_FRONT
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].cameraPosition) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.NORMAL_VIDEO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.min > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.max > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0800
     * @tc.desc   getSupportedFullOutputCapability camera CameraType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0800';
        const formats = [
          camera.CameraType.CAMERA_TYPE_DEFAULT,
          camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
          camera.CameraType.CAMERA_TYPE_ULTRA_WIDE,
          camera.CameraType.CAMERA_TYPE_TELEPHOTO,
          camera.CameraType.CAMERA_TYPE_TRUE_DEPTH
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].cameraType) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.NORMAL_VIDEO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.min > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.max > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0900
     * @tc.desc   getSupportedFullOutputCapability camera ConnectionType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_0900';
        const formats = [
          camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
          camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN,
          camera.ConnectionType.CAMERA_CONNECTION_REMOTE
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].connectionType) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.NORMAL_VIDEO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.min > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.max > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1000
     * @tc.desc   getSupportedFullOutputCapability camera HostDeviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1000';
        const formats = [
          camera.HostDeviceType.UNKNOWN_TYPE,
          camera.HostDeviceType.PHONE,
          camera.HostDeviceType.TABLET
        ];
        for (const format of formats) {
          try {
            console.info(TAG, testName, "start :");
            if (mCameraDeviceArray!.length > 0) {
              for (let i = 0; i < mCameraDeviceArray!.length; i++) {
                if (format === mCameraDeviceArray![i].hostDeviceType) {
                  let cameraOutputCapability =
                    mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                      camera.SceneMode.NORMAL_VIDEO);
                  console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.min > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].frameRateRange.max > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.videoProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                  expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                  expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                  break;
                } else {
                  console.info(TAG, testName, "该设备不支持:");
                }
              }
            }
          } catch (error) {
            console.error(TAG, testName, "fail,errorCode :", error.code);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1100
     * @tc.desc   getSupportedFullOutputCapability camera hostDeviceName ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (mCameraDeviceArray![i].hostDeviceName === "") {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                    camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                expect(cameraOutputCapability.videoProfiles[0].frameRateRange.min > 0).assertTrue();
                expect(cameraOutputCapability.videoProfiles[0].frameRateRange.max > 0).assertTrue();
                expect(cameraOutputCapability.videoProfiles[0].format != null).assertTrue();
                expect(cameraOutputCapability.videoProfiles[0].size.height > 0).assertTrue();
                expect(cameraOutputCapability.videoProfiles[0].size.width > 0).assertTrue();
                expect(cameraOutputCapability.previewProfiles[0].size.height > 0).assertTrue();
                expect(cameraOutputCapability.previewProfiles[0].size.width > 0).assertTrue();
                expect(cameraOutputCapability.previewProfiles[0].format != null).assertTrue();
                expect(cameraOutputCapability.supportedMetadataObjectTypes != null).assertTrue();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1200
     * @tc.desc   getSupportedFullOutputCapability camera cameraId ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST0
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_FULL_OUTPUT_CAPABILITY_STATIC_1200';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            for (let i = 0; i < mCameraDeviceArray!.length; i++) {
              if (mCameraDeviceArray![i].cameraId === "") {
                let cameraOutputCapability =
                  mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![i],
                    camera.SceneMode.NORMAL_VIDEO);
                console.info(TAG, testName, "getSupportedFullOutputCapability ok:", cameraOutputCapability);
                expect().assertFail();
                break;
              } else {
                console.info(TAG, testName, "该设备不支持:");
              }
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect(Number(error.code)).assertEqual(7400101);
        }
        done();
      })
  })
}