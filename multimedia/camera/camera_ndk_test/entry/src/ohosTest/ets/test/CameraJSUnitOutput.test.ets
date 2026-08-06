/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import cameraObj from 'libentry.so';
import MediaUtils from './MediaUtils';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { GlobalThis } from './Constants';
import { Context } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Camera_MediaType, Parameter_Setting, Camera_ErrorCode } from './Constants';

const TAG = "CameraXts CameraUnitTest: ";
const CAMERA_INVALID_ARGUMENT = 7400101;

// 创建视频录制的参数
let mediaUtil = MediaUtils.getInstance();
let videoRecorder: media.AVRecorder;
let videoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 512000,
    videoCodec: media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
  },
  url: 'fd://',
  rotation: 0
}

let surfaceId1: string;
let cameraManager: number;
let videoSurfaceId: string;
let fdNumber: number;
let receiver: image.ImageReceiver;

async function getImageReceiverSurfaceId() {
  console.log(TAG + 'Entering create Image receiver');
  receiver = image.createImageReceiver(640, 480, 4, 8);
  console.log(TAG + 'before receiver check');
  if (receiver !== undefined) {
    console.log(TAG + 'Receiver is ok');
    surfaceId1 = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Received id: ' + JSON.stringify(surfaceId1));
  } else {
    console.log(TAG + 'Receiver is not ok');
  }
}

async function closeFd() {
        console.info('case come in closeFd')
        if (fdNumber != null) {
            fs.closeSync(fdNumber);
        } else {
            console.info('[fs.closeSync] case fdNumber is null');
        }
}

async function release() {
  console.log(TAG + "start release");
  await cameraObj.sessionRelease();
  console.log(TAG + "release end");
}

function isEmpty(data: cameraObj.cameraInfo | cameraObj.cameraOutputCapability | number | string | undefined) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function getSupportedOutputCapabilityInPromise() {
  if (isEmpty(cameraManager)) {
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined");
    expect().assertFail();
    return undefined;
  }
  let outputCapabilityPromise = cameraObj.getSupportedOutputCapability();
  console.info(TAG + "CameraUnitTest: Entering testSupportedOutputCapabilityPromise: " + JSON.stringify(outputCapabilityPromise));
  expect(isEmpty(outputCapabilityPromise)).assertFalse();

  return outputCapabilityPromise;
}

async function getVideoSurfaceId() {
  const mContext: Context = getContext();
  console.info(TAG + 'start getVideoSurfaceID ');
  try {
    videoRecorder = await media.createAVRecorder();
  } catch (error) {
    let err = error as BusinessError;
    console.error(`createAVRecorder call failed error code: ${err.code}`);
  }
  if (videoRecorder === undefined) {
    console.error(`createAVRecorder call failed`);
  }
  console.info(TAG + 'createAVRecorder videoRecorder : ' + JSON.stringify(videoRecorder));
  videoConfig.url = `fd://${await mediaUtil.createAndGetUriVideoNew(Camera_MediaType.VIDEO, mContext)}`;
  console.info(TAG + 'getVideoSurfaceID videoConfig.url : ' + JSON.stringify(videoConfig.url));
  try {
    await videoRecorder.prepare(videoConfig);
    console.info(TAG + 'getVideoSurfaceID  videoRecorder.prepare');
  } catch (err) {
    console.error(TAG + 'prepare failed with err: ' + err);
  }
  videoSurfaceId = await videoRecorder.getInputSurface();
  console.info(TAG + 'getVideoSurfaceID videoSurfaceId : ' + JSON.stringify(videoSurfaceId));
}

async function createVideoOutput() {
  cameraObj.getSupportedOutputCapability();

  let videoProfiles = cameraObj.getVideoProfiles();
  console.info("videoProfiles is "+ JSON.stringify(videoProfiles));
  let videoProfileIndex = 0;
  let videoProfileHeigth = 1080;
  let videoProfileWidth = 1920;
  let FrameRate = 30;
  //View the videoProfile with an aspect ratio of 4:3
  for (let i = 0; i < videoProfiles.length; i++) {
    if (Math.abs((videoProfiles[i].width / videoProfiles[i].height) -(4 / 3)) < 0.1) {
      videoProfileWidth = videoProfiles[i].width;
      videoProfileHeigth = videoProfiles[i].height;
      FrameRate = videoProfiles[i].min;
      videoProfileIndex = i;
      break;
    }
  }

  videoConfig = {
    audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
    profile : {
      audioBitrate : 48000,
      audioChannels : 2,
      audioCodec : media.CodecMimeType.AUDIO_AAC,
      audioSampleRate : 48000,
      fileFormat : media.ContainerFormatType.CFT_MPEG_4,
      videoBitrate : 512000,
      videoCodec : media.CodecMimeType.VIDEO_AVC,
      videoFrameWidth : videoProfileWidth,
      videoFrameHeight : videoProfileHeigth,
      videoFrameRate : FrameRate
    },
    url : 'fd://',
    rotation : 0,
  }

  console.log("videoConfig is "+JSON.stringify(videoConfig));
  
  await getVideoSurfaceId();
  if (cameraObj.createVideoOutputByIndex(videoSurfaceId, videoProfileIndex)) {
    console.info(TAG + "createVideoOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit createVideoOutput');
}

export default function cameraJSUnitOutput() {
  describe('cameraJSUnitOutput', () => {
    console.info(TAG + '----------cameraJSUnitOutput begin--------------');

    let startVideoSession = async () => {
      let ret = cameraObj.initCamera(GlobalThis.getInstance().getValue());
      if (ret != 0) {
        console.error(TAG + "cameraObj initCamera FAILED")
        expect().assertFail();
      }
      let cameraInfo = cameraObj.getSupportedCameras();
      if (isEmpty(cameraInfo)) {
        console.error(TAG + "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
        expect().assertFail();
      }
      await createVideoOutput();
      ret = cameraObj.createCameraInput();
      if (ret) {
        console.error(TAG + "cameraObj createCameraInput FAILED");
        expect().assertFail();
      }
      ret = cameraObj.cameraInputOpen();
      if (ret) {
        console.error(TAG + "cameraObj cameraInputOpen FAILED");
        expect().assertFail();
      }
      ret = cameraObj.createPreviewOutput();
      if (ret) {
        console.error(TAG + "cameraObj createPreviewOutput FAILED");
        expect().assertFail();
      }
      ret = cameraObj.createSession();
      if (ret) {
        console.error(TAG + "cameraObj createSession FAILED");
        expect().assertFail();
      }
      ret = cameraObj.sessionBegin();
      if (ret) {
        console.error(TAG + "cameraObj sessionBegin FAILED");
        expect().assertFail();
      }
      ret = cameraObj.sessionAddInput();
      if (ret) {
        console.error(TAG + "cameraObj sessionAddInput FAILED");
        expect().assertFail();
      }
      ret = cameraObj.sessionAddPreviewOutput();
      if (ret) {
        console.error(TAG + "cameraObj sessionAddPreviewOutput FAILED");
        expect().assertFail();
      }
      ret = cameraObj.sessionAddVideoOutput();
      if (ret) {
        console.error(TAG + "cameraObj sessionAddVideoOutput FAILED");
        expect().assertFail();
      }
      ret = cameraObj.sessionCommitConfig();
      if (ret) {
        console.error(TAG + "cameraObj sessionCommitConfig FAILED");
        expect().assertFail();
      }
      ret = cameraObj.sessionStart();
      if (ret) {
        console.error(TAG + "cameraObj sessionStart FAILED");
        expect().assertFail();
      }
    }

    beforeAll(async () => {
      console.info(TAG + 'getImageReceiverSurfaceId');
      await getImageReceiverSurfaceId();
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(() => {
      console.info(TAG + 'beforeEach case');
    });
    afterEach(async () => {
      console.info(TAG + 'afterEach case');
    });
    afterAll(() => {
      closeFd();
      cameraObj.releaseCamera()
      console.info(TAG + 'afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERA_MANAGER_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERA_MANAGER_CALLBACK_0100
     * @tc.desc   Create CameraManager instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERA_MANAGER_CALLBACK_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERA_MANAGER_CALLBACK_0100--------------");
      cameraManager = cameraObj.initCamera(GlobalThis.getInstance().getValue());
      if (cameraManager != 0) {
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERAS_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERAS_CALLBACK_0100
     * @tc.desc   Get camera from cameramanager to get array of camera async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_GET_CAMERAS_CALLBACK_0100', Level.LEVEL1, async () => {
      console.info(TAG + "--------------GET_CAMERAS--------------");
      let cameraInfo = cameraObj.getSupportedCameras();
      if (isEmpty(cameraInfo)) {
        console.info(TAG + "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
        expect().assertFail();
      }
      else {
        console.info(TAG + "Entering GET_CAMERAS data is not null || undefined");
        let cameraId = cameraInfo.cameraId;
        expect(isEmpty(cameraId)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS camera Id: " + cameraId);
        let cameraPosition = cameraInfo.cameraPosition;
        expect(isEmpty(cameraPosition)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS camera Position: " + cameraPosition);
        let cameraType = cameraInfo.cameraType;
        expect(isEmpty(cameraType)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS camera Type: " + cameraType);
        let connectionType = cameraInfo.connectionType;
        expect(isEmpty(connectionType)).assertFalse();
        console.info(TAG + "Entering GET_CAMERAS connection Type: " + connectionType);
        expect(true).assertTrue();
        console.info(TAG + "Entering GET_CAMERAS PASSED");
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAMERA_INPUT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAMERA_OUTPUT_PROMISE_0100
     * @tc.desc   Create previewOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAMERA_INPUT_PROMISE_0100', Level.LEVEL2, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
      let ret = cameraObj.createCameraInput();
      if (ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
        expect().assertFail();
      }
      ret = cameraObj.cameraInputOpen();
      if (ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PREVIEW_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PREVIEW_OUTPUT_CALLBACK_0100
     * @tc.desc   Create previewOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PREVIEW_OUTPUT_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 cameraManager == null || undefined");
        expect().assertFail();
      }
      else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PREVIEW_OUTPUT_CALLBACK_0100");
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        if (cameraOutputCap == undefined) {
          expect().assertFail();
        } else {
          let previewProfilesSize = cameraOutputCap.previewProfilesSize;
          if (isEmpty(previewProfilesSize)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 previewProfilesSize == null || undefined");
            expect(isEmpty(previewProfilesSize)).assertFalse();
          }
        }
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PHOTO_OUTPUT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PHOTO_OUTPUT_PROMISE_0100
     * @tc.desc   Create photoOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PHOTO_OUTPUT_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PHOTO_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PHOTO_OUTPUT_PROMISE_0100 cameraManager == null || undefined");
        expect().assertFail();
      }
      else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        if (cameraOutputCap == undefined) {
          expect().assertFail();
        } else {
          let photoProfilesSize = cameraOutputCap.photoProfilesSize;
          if (isEmpty(photoProfilesSize)) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PHOTO_OUTPUT_PROMISE_0100 photoProfilesSize == null || undefined");
            expect().assertFalse();
          }
        }
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CREATE_VIDEO_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CREATE_VIDEO_OUTPUT_CALLBACK_0100
     * @tc.desc   Create videoOutput instance api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CREATE_VIDEO_OUTPUT_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CREATE_VIDEO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_VIDEO_OUTPUT_CALLBACK_0100 cameraManager == null || undefined");
        expect().assertFail();
      }
      else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        expect(isEmpty(cameraOutputCap)).assertFalse();
        if (cameraOutputCap == undefined) {
          expect().assertFail();
        } else {
          let videoProfilesSize = cameraOutputCap.videoProfilesSize;
          expect(isEmpty(videoProfilesSize)).assertFalse();
        }
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CREATE_METADATA_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CREATE_METADATA_OUTPUT_CALLBACK_0100
     * @tc.desc   Create metadataOutput instance api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CREATE_METADATA_OUTPUT_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CREATE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_METADATA_OUTPUT_CALLBACK_0100 cameraManager == null || undefined");
        expect().assertFail();
      }
      else {
        let cameraOutputCap = getSupportedOutputCapabilityInPromise();
        expect(isEmpty(cameraOutputCap)).assertFalse();
        if (cameraOutputCap == undefined) {
          expect().assertFail();
        } else {
          let metadataProfilesSize = cameraOutputCap.metadataProfilesSize;
          if (isEmpty(metadataProfilesSize)) {
            console.info("SUB_MULTIMEDIA_CAMERA_NDK_CREATE_METADATA_OUTPUT_CALLBACK_0100 end with metadataProfilesSize is null");
          }
        }
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAPTURE_SESSION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAPTURE_SESSION_CALLBACK_0100
     * @tc.desc   Create CaptureSession instance api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAPTURE_SESSION_0100', Level.LEVEL1, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAPTURE_SESSION_CALLBACK_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAPTURE_SESSION_CALLBACK_0100 cameraManager == null || undefined");
        expect().assertFail();
      }
      else {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_NDK_CREATE_CAPTURE_SESSION_CALLBACK_0100");
        let ret = cameraObj.createSession();
        if (ret) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CREATE_PHOTO_OUTPUT_PROMISE_0100 data is empty");
          expect().assertFalse();
        }
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_BEGIN_CONFIG_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100
     * @tc.desc   captureSession beginConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_BEGIN_CONFIG_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100--------------");
      let ret = cameraObj.sessionBegin();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 sessionBegin fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_INPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100
     * @tc.desc   captureSession addInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_INPUT_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100--------------");
      let ret = cameraObj.sessionAddInput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 sessionAddInput fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100
     * @tc.desc   captureSession add previewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100--------------");
      await cameraObj.createPreviewOutput();
      let ret = cameraObj.sessionAddPreviewOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100 sessionAddPreviewOutput fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100
     * @tc.desc   captureSession add photoOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100--------------");
      cameraObj.createPhotoOutput(surfaceId1);
      let ret = cameraObj.sessionAddPhotoOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 csessionAddPhotoOutput fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100
     * @tc.desc   captureSession remove photoOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100--------------");
      await cameraObj.createVideoOutput(surfaceId1);
      let ret = cameraObj.sessionAddVideoOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 sessionAddVideoOutput fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100
     * @tc.desc   captureSession commitConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100--------------");
      let ret = await cameraObj.sessionCommitConfig();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 sessionCommitConfig fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_START_PREVIEW_OUTPUT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_START_PREVIEW_OUTPUT_PROMISE_0100
     * @tc.desc   Create previewOutput instance promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_START_PREVIEW_OUTPUT_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_START_PREVIEW_OUTPUT_PROMISE_0100--------------");
      let ret = cameraObj.previewOutputStart();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_START_PREVIEW_OUTPUT_PROMISE_0100 previewOutputStart fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_STOP_PREVIEW_OUTPUT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_STOP_PREVIEW_OUTPUT_PROMISE_0100
     * @tc.desc   Create previewOutput instance promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_STOP_PREVIEW_OUTPUT_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_STOP_PREVIEW_OUTPUT_PROMISE_0100--------------");
      let ret = cameraObj.previewOutputStop();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_STOP_PREVIEW_OUTPUT_PROMISE_0100 previewOutputStop fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_START_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_START_PROMISE_0100
     * @tc.desc   videoOutput start promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_START_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_START_PROMISE_0100--------------");
      let ret = cameraObj.videoOutputStart();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_START_PROMISE_0100 videoOutputStart fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_STOP_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_STOP_PROMISE_0100
     * @tc.desc   videoOutput stop promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_STOP_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_STOP_PROMISE_0100--------------");
      let ret = cameraObj.videoOutputStop();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_STOP_PROMISE_0100 videoOutputStop fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_UNREGISTER_CALLBACK_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_UNREGISTER_CALLBACK_PROMISE_0100
     * @tc.desc   unregister callback promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_UNREGISTER_CALLBACK_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_UNREGISTER_CALLBACK_PROMISE_0100--------------");
      let ret = cameraObj.videoOutputRelease();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_VIDEO_OUTPUT_UNREGISTER_CALLBACK_PROMISE_0100 fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100
     * @tc.desc   preview output callback on frameStart api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
      let ret = cameraObj.createPreviewOutput(); //test PreviewOutputRegisterCallback onFrameStart
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 PreviewOutputRegisterCallback fail");
        expect().assertFail();
      }
      cameraObj.previewOutputStart();
      cameraObj.previewOutputStop();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100
     * @tc.desc   preview output callback on frameEnd api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      let ret = cameraObj.createPreviewOutput(); //test PreviewOutputRegisterCallback onFrameEnd
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 PreviewOutputRegisterCallback fail");
        expect().assertFail();
      }
      cameraObj.previewOutputStart();
      cameraObj.previewOutputStop();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.desc   preview output callback on frameEnd api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      let ret = cameraObj.createPreviewOutput(); //test PreviewOutputRegisterCallback onError
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 PreviewOutputRegisterCallback fail");
        expect().assertFail();
      }
      cameraObj.previewOutputStart();
      cameraObj.previewOutputStop();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_UNREGISTER_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_UNREGISTER_CALLBACK_0100
     * @tc.desc   preview output callback api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_UNREGISTER_CALLBACK_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
      let ret = cameraObj.createPreviewOutput();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PREVIEW_OUTPUT_UNREGISTER_CALLBACK_0100 fail");
        expect().assertFail();
      }
      cameraObj.previewOutputStart();
      cameraObj.previewOutputStop();
      cameraObj.previewOutputRelease();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100
     * @tc.desc   photoOutput capture with promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100--------------");
      try {
        await cameraObj.photoOutputCapture();
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_FUNCTION_COMBINATION_PREVIEW_AND_PHOTO_002 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
     * @tc.desc   photo output callback on captureStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100--------------");
      cameraObj.initCamera(GlobalThis.getInstance().getValue());
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability();
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1); //test PhotoOutputRegisterCallback onFrameStart
      if (ret) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START createPhotoOutput fail");
        expect().assertFail();
      }
      else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100
     * @tc.desc   photo output callback on frameShutter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100--------------");
      cameraObj.initCamera(GlobalThis.getInstance().getValue());
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability();
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1); //test PhotoOutputRegisterCallback onFrameShutter
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 createPhotoOutput fail");
        expect().assertFail();
      }
      else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100
     * @tc.desc   photo output callback on captureEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100--------------");
      cameraObj.initCamera(GlobalThis.getInstance().getValue());
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability();
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1); //test PhotoOutputRegisterCallback onFrameEnd
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 createPhotoOutput fail");
        expect().assertFail();
      }
      else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.desc   photo output callback on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100', Level.LEVEL1, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      cameraObj.initCamera(GlobalThis.getInstance().getValue());
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability();
      cameraObj.createSession();
      cameraObj.sessionBegin();
      let ret = cameraObj.createPhotoOutput(surfaceId1); //test PhotoOutputRegisterCallback onError
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 createPhotoOutput fail");
        expect().assertFail();
      }
      else {
        cameraObj.sessionAddPhotoOutput();
        await cameraObj.sessionCommitConfig();
        await cameraObj.photoOutputCapture();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_RELEASE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_RELEASE_CALLBACK_0100
     * @tc.desc   PhotoOutputRelease instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_RELEASE_CALLBACK_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_RELEASE_CALLBACK_0100--------------");
      let ret = cameraObj.photoOutputRelease();
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 photoOutputRelease fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_START_METADATA_OUTPUT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_START_METADATA_OUTPUT_PROMISE_0100
     * @tc.desc   Start metadataOutput sync api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_START_METADATA_OUTPUT_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_START_METADATA_OUTPUT_PROMISE_0100--------------");
      try {
        await cameraObj.metadataOutputStart();
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_START_METADATA_OUTPUT_PROMISE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_STOP_METADATA_OUTPUT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_STOP_METADATA_OUTPUT_PROMISE_0100
     * @tc.desc   Stop metadataOutput aync api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_STOP_METADATA_OUTPUT_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_NDK_STOP_METADATA_OUTPUT_PROMISE_0100--------------");
      try {
        await cameraObj.metadataOutputStop();
      }
      catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_STOP_METADATA_OUTPUT_PROMISE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0100
     * @tc.desc   captureSession add previewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0100', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0100--------------");
      let surfaceId = GlobalThis.getInstance().getValue();
      cameraObj.initCamera(surfaceId);
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability();
      cameraObj.createDeferredPreviewOutput();
      let ret = cameraObj.oHPreviewOutputAddDeferredSurface(Parameter_Setting.ALL_PARAMETER_OK, surfaceId);
      if (ret) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0100 sessionAddPreviewOutput fail");
        expect().assertFail();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0200
     * @tc.desc   captureSession add previewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0200', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0200--------------");
      let surfaceId = GlobalThis.getInstance().getValue();
      cameraObj.initCamera(surfaceId);
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability();
      cameraObj.createDeferredPreviewOutput();
      let ret = cameraObj.oHPreviewOutputAddDeferredSurface(Parameter_Setting.FIRST_PARAMETER_ERROR, surfaceId);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0200:" + ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0300
     * @tc.desc   captureSession add previewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0300', Level.LEVEL1, async () => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0300--------------");
      let surfaceId = GlobalThis.getInstance().getValue();
      cameraObj.initCamera(surfaceId);
      cameraObj.getSupportedCameras();
      cameraObj.getSupportedOutputCapability();
      cameraObj.createDeferredPreviewOutput();
      let ret = cameraObj.oHPreviewOutputAddDeferredSurface(Parameter_Setting.SECOND_PARAMETER_ERROR, surfaceId);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_DEFERRED_PREVIEW_OUTPUT_ADD_DEFERRED_SURFACE_0300:" + ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    });
    /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_ADD_METADATA_TYPES_PROMISE_0200
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_ADD_METADATA_TYPES_PROMISE_0200
      * @tc.desc   MetadataOutputAddMetadataObjectTypes metadataOutput aync api
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ADD_METADATA_TYPES_PROMISE_0200', Level.LEVEL1, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ADD_METADATA_TYPES_PROMISE_0200--------------");
      try {
          cameraObj.initCamera(GlobalThis.getInstance().getValue());
          cameraObj.getSupportedCameras();
          cameraObj.getSupportedOutputCapability();
          cameraObj.createSession();
          if (cameraObj.IsMetadataObjectTypeValid() == 0) {
            console.info(TAG + "IsMetadataObjectTypeValid invalid"); 
            expect(true).assertTrue();
          }
          else {
            let result = cameraObj.createMetadataOutput();
            result = cameraObj.createCameraInput();
            result = cameraObj.cameraInputOpen();
            cameraObj.sessionBegin();
            result = cameraObj.sessionAddInput();
            result = cameraObj.sessionAddMetadataOutput();
            result = cameraObj.sessionCommitConfig();
            result = cameraObj.sessionStart();
            result = await cameraObj.MetadataOutputAddMetadataObjectTypes();
            expect(result).assertEqual(0);
          }
      } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ADD_METADATA_TYPES_PROMISE_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect().assertFail();
      }
    });
 	  /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_REMOVE_METADATA_TYPES_PROMISE_0200
      * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_REMOVE_METADATA_TYPES_PROMISE_0200
      * @tc.desc   MetadataOutputRemoveMetadataObjectTypes metadataOutput aync api
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
 	  it('SUB_MULTIMEDIA_CAMERA_NDK_REMOVE_METADATA_TYPES_PROMISE_0200', Level.LEVEL1, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_REMOVE_METADATA_TYPES_PROMISE_0200--------------");
      try {
          cameraObj.initCamera(GlobalThis.getInstance().getValue());
          cameraObj.getSupportedCameras();
          cameraObj.getSupportedOutputCapability();
          cameraObj.createSession();
          if (cameraObj.IsMetadataObjectTypeValid() == 0) {
            console.info(TAG + "IsMetadataObjectTypeValid invalid"); 
            expect(true).assertTrue();
          }
          else {
            let result = cameraObj.createMetadataOutput();
            result = cameraObj.createCameraInput();
            result = cameraObj.cameraInputOpen();
            cameraObj.sessionBegin();
            result = cameraObj.sessionAddInput();
            result = cameraObj.sessionAddMetadataOutput();
            result = cameraObj.sessionCommitConfig();
            result = cameraObj.sessionStart();
            result = await cameraObj.MetadataOutputAddMetadataObjectTypes();
            result = await cameraObj.MetadataOutputRemoveMetadataObjectTypes();
            expect(result).assertEqual(0);
          }
      } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_REMOVE_METADATA_TYPES_PROMISE_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect().assertFail();
      }
 	  });
 	  /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATEMETADATAOUTPUTWITHOBJECTTYPES_PROMISE_0100
      * @tc.number SUB_MULTIMEDIA_CAMERA_CREATEMETADATAOUTPUTWITHOBJECTTYPES_PROMISE_0100
      * @tc.desc   CreateMetadataOutputWithObjectTypes metadataOutput aync api
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
 	  it('SUB_MULTIMEDIA_CAMERA_CREATEMETADATAOUTPUTWITHOBJECTTYPES_PROMISE_0100', Level.LEVEL1, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATEMETADATAOUTPUTWITHOBJECTTYPES_PROMISE_0100--------------");
      try {
          cameraObj.initCamera(GlobalThis.getInstance().getValue());
          cameraObj.getSupportedCameras();
          cameraObj.getSupportedOutputCapability();
          cameraObj.createSession();
          cameraObj.sessionBegin();
          let result = cameraObj.CreateMetadataOutputWithObjectTypes();
          expect(result).assertEqual(0);
      } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATEMETADATAOUTPUTWITHOBJECTTYPES_PROMISE_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect().assertFail();
      }
 	  });

    /**
     * @tc.number   SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0100
     * @tc.name     SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0100
     * @tc.desc     test sub multimedia camera enum ColorSpaceName
     * @tc.size     MEDIUMTEST
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0100', Level.LEVEL2, async () => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0100"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        class TestEnumColorSpaceName {
          static readonly BT2020_LOG_FULL = 0;
          static readonly BT2020_LOG_LIMIT = 1;
        }

        //--------------------------------------------测试过程------------------------------------------------------
        let enumVal = cameraObj.getEnumColorSpaceName(TestEnumColorSpaceName.BT2020_LOG_FULL)
        console.info("ColorSpaceName BT2020_LOG_FULL: ", enumVal)
        expect(enumVal).assertEqual(27)
        enumVal = cameraObj.getEnumColorSpaceName(TestEnumColorSpaceName.BT2020_LOG_LIMIT)
        console.info("ColorSpaceName BT2020_LOG_LIMIT: ", enumVal)
        expect(enumVal).assertEqual(28)
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
        
        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0200
     * @tc.name      SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0200
     * @tc.desc      test sub multimedia camera isLogViewAssistSupported all param ok
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0200', Level.LEVEL0, async () => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0200"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        await startVideoSession()

        //--------------------------------------------测试过程------------------------------------------------------
        let isSupported = cameraObj.isLogViewAssistSupported(Parameter_Setting.ALL_PARAMETER_OK)
        console.info(`isLogViewAssistSupported, ret: ${isSupported}`)
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {

        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
        cameraObj.releaseCamera()
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0300
     * @tc.name      SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0300
     * @tc.desc      test sub multimedia camera isLogViewAssistSupported with first param null
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0300', Level.LEVEL2, async () => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0300"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        await startVideoSession()

        //--------------------------------------------测试过程------------------------------------------------------
        let isSupported = cameraObj.isLogViewAssistSupported(Parameter_Setting.FIRST_PARAMETER_ERROR)
        console.info(`isLogViewAssistSupported, ret: ${isSupported}`)
        expect(isSupported).assertFalse();
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {

        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
        cameraObj.releaseCamera()
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0400
     * @tc.name      SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0400
     * @tc.desc      test sub multimedia camera setLogViewAssistEnable with all param ok
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0400', Level.LEVEL1, async () => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0400"
      let CAMERA_ERROR_CAPABILITY_NOT_SUPPORTED = 7400114
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        await startVideoSession()

        //--------------------------------------------测试过程------------------------------------------------------
        let isSupported = cameraObj.isLogViewAssistSupported(Parameter_Setting.ALL_PARAMETER_OK)
        console.info(`isLogViewAssistSupported, ret: ${isSupported}`)
        if (isSupported) {
          let ret = cameraObj.setLogViewAssistEnable(Parameter_Setting.ALL_PARAMETER_OK, true)
          console.info(`setLogViewAssist enable, ret: ${ret}`)
          expect(ret).assertEqual(Camera_ErrorCode.CAMERA_OK);
          ret = cameraObj.setLogViewAssistEnable(Parameter_Setting.ALL_PARAMETER_OK, false)
          console.info(`setLogViewAssist disable , ret: ${ret}`)
          expect(ret).assertEqual(Camera_ErrorCode.CAMERA_OK);
        } else {
          try {
            cameraObj.setLogViewAssistEnable(Parameter_Setting.ALL_PARAMETER_OK, true)
          } catch (err) {
            console.info(`setLogViewAssist enable, err: ${JSON.stringify(err)}`)
            expect(err.code === CAMERA_ERROR_CAPABILITY_NOT_SUPPORTED).assertTrue()
          }
          try {
            cameraObj.setLogViewAssistEnable(Parameter_Setting.ALL_PARAMETER_OK, false)
          } catch (err) {
            console.info(`setLogViewAssist disable, err: ${JSON.stringify(err)}`)
            expect(err.code === CAMERA_ERROR_CAPABILITY_NOT_SUPPORTED).assertTrue()
          }
        }
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {

        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
        cameraObj.releaseCamera()
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0500
     * @tc.name      SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0500
     * @tc.desc      test sub multimedia camera setLogViewAssistEnable with firse param null
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0500', Level.LEVEL1, async () => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0500"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        await startVideoSession()

        //--------------------------------------------测试过程------------------------------------------------------
        let ret = cameraObj.setLogViewAssistEnable(Parameter_Setting.FIRST_PARAMETER_ERROR, true)
        console.info(`setLogViewAssist enable, ret: ${ret}`)
        expect(ret).assertEqual(Camera_ErrorCode.CAMERA_INVALID_ARGUMENT);
        ret = cameraObj.setLogViewAssistEnable(Parameter_Setting.FIRST_PARAMETER_ERROR, false)
        console.info(`setLogViewAssist disable , ret: ${ret}`)
        expect(ret).assertEqual(Camera_ErrorCode.CAMERA_INVALID_ARGUMENT);
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {

        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
        cameraObj.releaseCamera()
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0600
     * @tc.name      SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0600
     * @tc.desc      test sub multimedia camera setLogViewAssistEnable with session not config
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0600', Level.LEVEL1, async () => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0600"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        cameraObj.initCamera(GlobalThis.getInstance().getValue());
        cameraObj.getSupportedCameras();
        await createVideoOutput();
        cameraObj.createCameraInput();
        cameraObj.cameraInputOpen();
        cameraObj.createPreviewOutput();
        cameraObj.createSession();
        cameraObj.sessionBegin();
        cameraObj.sessionAddInput();
        cameraObj.sessionAddPreviewOutput();
        cameraObj.sessionAddVideoOutput();

        //--------------------------------------------测试过程------------------------------------------------------
        let isSupported = cameraObj.isLogViewAssistSupported(Parameter_Setting.ALL_PARAMETER_OK)
        console.info(`isLogViewAssistSupported, ret: ${isSupported}`)
        if (isSupported) {
          let ret = cameraObj.setLogViewAssistEnable(Parameter_Setting.ALL_PARAMETER_OK, true)
          console.info(`setLogViewAssist enable, ret: ${ret}`)
          expect(ret).assertEqual(Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG);
          ret = cameraObj.setLogViewAssistEnable(Parameter_Setting.ALL_PARAMETER_OK, false)
          console.info(`setLogViewAssist disable , ret: ${ret}`)
          expect(ret).assertEqual(Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG);
        }
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {

        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
      }
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0700
     * @tc.name      SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0700
     * @tc.desc      test sub multimedia camera setLogViewAssistEnable whit mo session
     * @tc.size      MEDIUMTEST
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0700', Level.LEVEL1, async () => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_RECORD_LOG_0700"
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        console.info(`Enter ${caseName}`)
        let ret = cameraObj.initCamera(GlobalThis.getInstance().getValue());
        if (ret != 0) {
          console.error(TAG + "cameraObj initCamera FAILED")
          expect().assertFail();
        }
        let cameraInfo = cameraObj.getSupportedCameras();
        if (isEmpty(cameraInfo)) {
          console.error(TAG + "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
          expect().assertFail();
        }
        await createVideoOutput();
        ret = cameraObj.createCameraInput();
        if (ret) {
          console.error(TAG + "cameraObj createCameraInput FAILED");
          expect().assertFail();
        }
        ret = cameraObj.cameraInputOpen();
        if (ret) {
          console.error(TAG + "cameraObj cameraInputOpen FAILED");
          expect().assertFail();
        }
        ret = cameraObj.createPreviewOutput();
        if (ret) {
          console.error(TAG + "cameraObj createPreviewOutput FAILED");
          expect().assertFail();
        }
 
        //--------------------------------------------测试过程------------------------------------------------------
        let isSupported = cameraObj.isLogViewAssistSupported(Parameter_Setting.ALL_PARAMETER_OK)
        console.info(`isLogViewAssistSupported, ret: ${isSupported}`)
        expect(isSupported == false).assertTrue();
        console.info(`${caseName} PASSED`)
      } catch (error) {
        console.error(`${caseName} FAILED, ${JSON.stringify(error)}`)
        expect().assertFail()
      } finally {
 
        //--------------------------------------------后置处理------------------------------------------------------
        console.info(`Exit ${caseName}`)
      }
    })

  })
}