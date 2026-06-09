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
import cameraObj from 'libentry.so';
import { cameraInfo } from 'libentry.so';
import image from '@ohos.multimedia.image';
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import { Camera_PreconfigType, Camera_SceneMode, Parameter_Setting, GlobalThis } from './Constants';

const TAG = "CameraXts CameraPhotoSesionCaptureWithPhotoSettingExt: ";

let mPhotoSurface: string;
let fdNumber: number;
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CAMERA_OPERATION_NOT_ALLOWED = 7400102;
const CAMERA_SESSION_NOT_CONFIG = 7400103;
const CAMERA_SESSION_NOT_RUNNING = 7400104;
let mEnableCheckInvalidFocusPoint = false;
let receiver: image.ImageReceiver;

function isEmpty(data: cameraInfo) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}


async function getPhotoReceiverSurface() {
  console.log(TAG + 'Entering getPhotoReceiverSurface');
  receiver = image.createImageReceiver(640, 480, 4, 8);
  console.log(TAG + 'before receiver check');
  if (receiver !== undefined) {
    console.log(TAG + 'Photo receiver is created successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + 'Photo receiver is created failed');
  }
  console.log(TAG + 'Exit getPhotoReceiverSurface');
}

function getCameraManagerInstance() {
  console.info(TAG + 'Enter getCameraManagerInstance');
  console.info(TAG + 'mSurfaceId : ' + GlobalThis.getInstance().getValue());
  let ret: number = cameraObj.initCamera(GlobalThis.getInstance().getValue());
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  return true;
}

function getCameraSupportDevicesArray() {
  console.info('Enter getCameraSupportDevicesArray');

  let camera = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
  if (isEmpty(camera)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }

  console.info('Exit getCameraSupportDevicesArray');
  return true;
}

function createCameraSessionInstance() {
  console.info('Enter createCameraSessionInstance');
  try {
    cameraObj.createSession();
  }
  catch {
    console.info('createCaptureSession FAILED');
    expect().assertFail();
  }
  cameraObj.oHCameraManagerSetSceneMode(0);
  console.info('Exit createCameraSessionInstance');
  return true;
}

async function releaseCameraSessionInstance() {
  await cameraObj.sessionRelease();
}

async function createInput() {
  console.info('Enter createInput');
  let ret: number = cameraObj.createCameraInput();

  if (ret != 0) {
    console.info(TAG + "createCameraInput FAILED");
    expect().assertFail();
    return false;
  }

  await cameraObj.cameraInputOpen();
  console.info('Exit createInput');
  return true;
}

async function releaseInput() {
  console.info('Enter releaseInput');
  await cameraObj.cameraInputClose();
  console.info('Exit releaseInput');
  return true;
}

function createOutput() {
  console.info(TAG + 'Enter createOutput');

  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  let mPreviewOutput = cameraObj.createPreviewOutput();
  if (mPreviewOutput != 0) {
    console.info(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
  let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
  if (mPhotoOutput != 0) {
    console.info(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
  console.info('Exit createOutputs');
  return true;
}

async function releaseOutput() {
  console.info('Enter releaseOutput');

  await cameraObj.previewOutputRelease();
  await cameraObj.photoOutputRelease();
  console.info('Exit releaseOutput');

  return true;
}

async function startCameraSession() {
  console.info(TAG + "Enter startCameraSession");

  await createInput();
  createOutput();
  let ret: number = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin had been execute, please check your operation");
  }
  let addInput = cameraObj.sessionAddInput();
  if (addInput != 0) {
    console.info(TAG + "addInput FAILED");
    expect().assertFail();
  }
  let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
  if (addPreviewOutput != 0) {
    console.info(TAG + "addPreviewOutput FAILED");
    expect().assertFail();
  }
  let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
  if (addPhotoOutput != 0) {
    console.info(TAG + "addPhotoOutput FAILED");
    expect().assertFail();
  }

  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.info(TAG + "CommitConfig FAILED");
    expect().assertFail();
  }
  ret = cameraObj.sessionStart();
  if (ret != 0) {
    console.info(TAG + "sessionStart FAILED");
    expect().assertFail();
  }
  console.info(TAG + "Exit startCameraSession");
  return true;
}


async function beginCameraSession() {
    console.info(TAG + "Enter beginCameraSession");
  
    await createInput();
    createOutput();
    let ret: number = cameraObj.sessionBegin();
    if (ret != 0) {
      console.info(TAG + "sessionBegin had been execute, please check your operation");
    }
    let addInput = cameraObj.sessionAddInput();
    if (addInput != 0) {
      console.info(TAG + "addInput FAILED");
      expect().assertFail();
    }
    let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
    if (addPreviewOutput != 0) {
      console.info(TAG + "addPreviewOutput FAILED");
      expect().assertFail();
    }
    let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
    if (addPhotoOutput != 0) {
      console.info(TAG + "addPhotoOutput FAILED");
      expect().assertFail();
    }
    return true;
}

async function CommitCameraSession() {
    console.info(TAG + "Enter CommitCameraSession");
    let commitConfig = cameraObj.sessionCommitConfig();
    if (commitConfig != 0) {
      console.info(TAG + "CommitConfig FAILED");
      expect().assertFail();
    }
    let ret: number = cameraObj.sessionStart();
    if (ret != 0) {
      console.info(TAG + "sessionStart FAILED");
      expect().assertFail();
    }
    console.info(TAG + "Exit CommitCameraSession");
    return true;
}



async function releaseOutputAndInput() {
    console.info(TAG + "Enter releaseOutputAndInput");
    await releaseInput();
    await releaseOutput();
    console.info(TAG + "Exit releaseOutputAndInput");
    return true;
}

async function stopCameraSession() {
  console.info(TAG + "Enter stopCameraSession");

  let ret: number = cameraObj.sessionStop();
  if (ret != 0) {
    console.info(TAG + "sessionStop FAILED");
    expect().assertFail();
  }
  cameraObj.sessionRemovePreviewOutput();
  cameraObj.sessionRemovePhotoOutput();
  await releaseInput();
  await releaseOutput();

  console.info(TAG + "Exit stopCameraSession");

  return true;
}

function getSupportedSceneModes(index: number) {
  let supportedSceneModes = cameraObj.oHCameraManagerGetSupportedSceneModes(index);
  if (supportedSceneModes.errorCode != 0) {
    console.error(TAG + "getSupportedSceneModes FAILED");
    expect().assertFail();
  }
  if (supportedSceneModes.isNormalPhoto) {
    console.info(TAG + "NORMAL_PHOTO is supported.");
  }
  if (supportedSceneModes.isNormalVideo) {
    console.info(TAG + "NORMAL_VIDEO is supported.");
  }
  if (supportedSceneModes.isSecurePhoto) {
    console.info(TAG + "SECURE_PHOTO is supported.");
  }
  cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  return supportedSceneModes;
}

function createPreviewOutput() {
  let ret: number = cameraObj.createPreviewOutput();
  if (ret != 0) {
    console.error(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
}

function addInput() {
  let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddInput.errorCode != 0) {
    console.error(TAG + "canAddInput FAILED" + canAddInput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
  if (canAddInput.isAddInput) {
    let ret: number = cameraObj.sessionAddInput();
    if (ret != 0) {
      console.error(TAG + "addInput FAILED" + ret);
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function addPreviewOutput() {
  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPreviewOutput.errorCode != 0) {
    console.error(TAG + "canAddPreviewOutput FAILED" + canAddPreviewOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
  if (canAddPreviewOutput.isAddPreviewOutput) {
    let ret: number = cameraObj.sessionAddPreviewOutput();
    if (ret != 0) {
      console.error(TAG + "addPreviewOutput FAILED" + ret);
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function CameraPhotoSesionCaptureWithPhotoSettingExt() {

  describe('CameraPhotoSesionCaptureWithPhotoSettingExt', () => {
    console.info(TAG + '----------CameraPhotoSesionCaptureWithPhotoSettingExt--------------');
    beforeAll(async (done: Function) => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      await sleep(10000);
      done();
      console.info('Device type = ' + deviceInfo.deviceType);
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async (done: Function) => {
      await sleep(1000);
      done();
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0100
     * @tc.desc   Check create photo capture setting ext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret: number = cameraObj.createPhotoCaptureSettingExt(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0100 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0)
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0200
     * @tc.desc   Check create photo capture setting ext ,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret: number = cameraObj.createPhotoCaptureSettingExt(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0300
     * @tc.desc   Check create photo capture setting ext ,throw CAMERA_INVALID_ARGUMENT with photoOutput is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret: number = cameraObj.createPhotoCaptureSettingExt(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_CAPTURE_SETTING_EXT_0300 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0100
     * @tc.desc   Check Destroy photo capture setting ext 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.destroyPhotoCaptureSettingExt(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0200
     * @tc.desc   Check Destroy photo capture setting ext ,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret: number = cameraObj.destroyPhotoCaptureSettingExt(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_DESTROY_PHOTO_CAPTURE_SETTING_EXT_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0100
     * @tc.desc   Check photo capture setting ext set compression quality 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setCompressionQuality(0, 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0100 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0200
     * @tc.desc   Check photo capture setting ext set compression quality 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setCompressionQuality(0, 50);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0200 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0300
     * @tc.desc   Check photo capture setting ext set compression quality 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setCompressionQuality(0, 100);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0300 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0400
     * @tc.desc   Check photo capture setting ext set compression quality -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0400', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0400--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setCompressionQuality(0, -1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0400 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0400 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0500
     * @tc.desc   Check photo capture setting ext set compression quality -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0500', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0500--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setCompressionQuality(0, -101);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0500 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0500 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0600
     * @tc.desc   Check photo capture setting ext set compression quality ,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0600', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0600--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setCompressionQuality(1, 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0600 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_COMPRESSION_QUALITY_0600 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0100
     * @tc.desc   Check photo capture setting ext set image rotation 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setImageRotation(0, 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0100 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0200
     * @tc.desc   Check photo capture setting ext set image rotation 90
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setImageRotation(0, 90);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0200 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0300
     * @tc.desc   Check photo capture setting ext set image rotation 180,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setImageRotation(0, 180);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0300 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0400
     * @tc.desc   Check photo capture setting ext set image rotation 270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0400', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0400--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setImageRotation(0, 270);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0400 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0400 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0500
     * @tc.desc   Check photo capture setting ext set image rotation,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0500', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0500--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setImageRotation(1, 270);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0500 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_IMAGE_ROTATION_0500 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0100
     * @tc.desc   Check photo capture setting ext set Mirror true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setMirror(0, true);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0100 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0200
     * @tc.desc   Check photo capture setting ext set Mirror false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setMirror(0, false);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0200 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0300
     * @tc.desc   Check photo capture setting ext set Mirror false,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setMirror(1, false);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_MIRROR_0300 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0100
     * @tc.desc   Check photo capture setting ext set location -90 -180 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setLocation(0, -90, -180, 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0100 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0200
     * @tc.desc   Check photo capture setting ext set location 90 180 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setLocation(0, 90, 180, 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0200 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0300
     * @tc.desc   Check photo capture setting ext set location  0 0 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setLocation(0, 0, 0, 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0300 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0400
     * @tc.desc   Check photo capture setting ext set location ,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0400', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0400--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.setLocation(1, 0, 0, 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0400 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_CAPTURE_SETTING_EXT_SET_LOCAION_0400 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0100
     * @tc.desc   Check capture with photo capture setting ext ,only set compressionQuality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      cameraObj.setCompressionQuality(0, 10);
      let ret: number = cameraObj.captureWithCaptureSettingExt(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0100 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0200
     * @tc.desc   Check capture with photo capture setting ext ,only set All Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      cameraObj.setCompressionQuality(0, 10);
      cameraObj.setImageRotation(0, 90);
      cameraObj.setLocation(0, 90, 90, 90);
      cameraObj.setMirror(0, true);
      let ret: number = cameraObj.captureWithCaptureSettingExt(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0200 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0300
     * @tc.desc   Check capture with photo capture setting ext,not set Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.captureWithCaptureSettingExt(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0300 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0400
     * @tc.desc   Check capture with photo capture setting ext,,throw CAMERA_INVALID_ARGUMENT with PhotoOutput is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0400', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0400--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.captureWithCaptureSettingExt(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0400 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0400 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0500
     * @tc.desc   Check capture with photo capture setting ext,,throw CAMERA_INVALID_ARGUMENT with PhotoCaptureSettingExt is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0500', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0500--------------");
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.captureWithCaptureSettingExt(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0500 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0500 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0600
     * @tc.desc   Check capture with photo capture setting ext,,throw CAMERA_SESSION_NOT_RUNNING 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0600', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0600--------------");
      createCameraSessionInstance();
      await createInput();
      createOutput();
      cameraObj.createPhotoCaptureSettingExt(0);
      let ret: number = cameraObj.captureWithCaptureSettingExt(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0600 ret is "+ret);
      expect(ret).assertEqual(CAMERA_SESSION_NOT_RUNNING)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_WITH_PHOTO_CAPTURE_SETTING_EXT_0600 ends here");
      cameraObj.destroyPhotoCaptureSettingExt(0);
      await releaseOutputAndInput();
      await releaseCameraSessionInstance();
    });

  })
}