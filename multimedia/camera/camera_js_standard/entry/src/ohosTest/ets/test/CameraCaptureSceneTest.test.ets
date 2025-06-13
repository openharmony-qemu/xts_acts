/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import cameraObj from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import image from '@ohos.multimedia.image';

const TAG = "cameraCaptureSceneTest: ";

let context: common.UIAbilityContext;
let imageObj: image.Image;

let captureLocation: cameraObj.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0,
}
let captureSetting: cameraObj.PhotoCaptureSetting = {
  quality: cameraObj.QualityLevel.QUALITY_LEVEL_HIGH,
  rotation: cameraObj.ImageRotation.ROTATION_0, 
  location: captureLocation,
  mirror: false
}

let cameraManager: cameraObj.CameraManager;
let cameraDevicesArray: Array<cameraObj.CameraDevice>;
let cameraSession: cameraObj.PhotoSession; 
let cameraInput: cameraObj.CameraInput;
let previewOutput: cameraObj.PreviewOutput;
let photoOutput: cameraObj.PhotoOutput;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let permission = ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
  'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
  'ohos.permission.START_INVISIBLE_ABILITY',
  'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
];

let power: ESObject;

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'TestAbility'
  }
  await delegator.startAbility(want)
  await sleep(1000)
}

let isEmpty = (data: ESObject) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let createInput = async (index: number) => {
  cameraInput = cameraManager.createCameraInput(cameraDevicesArray[index]);
  if (!isEmpty(cameraInput)) {
    await cameraInput.open();
  }
}

let createOutput = (index: number, mode: number) => {
    let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevicesArray[index], mode);
    previewOutput = cameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
    let photoProfile = cameraOutputCap.photoProfiles.find((photoProfile: cameraObj.Profile) => {
        return Math.abs((photoProfile.size.width / photoProfile.size.height) - (cameraOutputCap.previewProfiles[0].size.width / cameraOutputCap.previewProfiles[0].size.height)) < Number.EPSILON;
      });
    if (isEmpty(photoProfile)) {
        console.error("Can not find photoProfile match the previewProfile")
        return
    }
    photoOutput = cameraManager.createPhotoOutput(photoProfile);
    console.log(TAG + `createPhotoOutput ok: ${JSON.stringify(photoOutput)}`)
}

let createPhotoSession = (mode: number) => {
  cameraSession = cameraManager.createSession(mode);
  cameraSession.beginConfig();
}

let stopCameraSession = async () => {;
  cameraSession.beginConfig();
  if (!isEmpty(cameraInput)) {
    cameraSession.removeInput(cameraInput);
    await cameraInput.close();
  }
  if (!isEmpty(previewOutput)) {
    cameraSession.removeOutput(previewOutput);
    await previewOutput.release();
  }
  if (!isEmpty(photoOutput)) {
    cameraSession.removeOutput(photoOutput);
    await photoOutput.release();
  }
  await cameraSession.release();
}

let addCommit = async (i: number, mode: number) => {
  await createInput(i);
  createOutput(i, mode);
  if (cameraInput) {
    cameraSession.addInput(cameraInput);
  }
  if (previewOutput) {
    cameraSession.addOutput(previewOutput);
  }
  if (photoOutput) {
    cameraSession.addOutput(photoOutput);
  }
}

let getCameraDevices = () => {
  cameraManager = cameraObj.getCameraManager(context);
  sleep(1000);
  cameraDevicesArray = cameraManager.getSupportedCameras();
  console.log(`cameraDevicesArray:  + ${JSON.stringify(cameraDevicesArray)}`)

  let sceneModes: Array<cameraObj.SceneMode> = cameraManager.getSupportedSceneModes(cameraDevicesArray[0]);
  console.log(`supportedSceneModes:  + ${JSON.stringify(sceneModes)}`)
}

let startCameraSession = async (index: number, mode: number) => {
    getCameraDevices()
    createPhotoSession(mode)
    await addCommit(index, mode)
    await cameraSession.commitConfig();
    await cameraSession.start().then(() => {
        console.info('Promise returned to indicate the session start success.');
    });
}

interface OutPutFormatArray {
  previewProfiles: cameraObj.CameraFormat[];
  photoProfiles: cameraObj.CameraFormat[];
  videoProfiles: cameraObj.CameraFormat[];
}

let getOutPutFormatArray = (idx: number, mode: number) => {

  let fornatData: OutPutFormatArray = {
    previewProfiles: [],
    photoProfiles: [],
    videoProfiles: [],
  };
  if (isEmpty(cameraManager)) {
    cameraManager = cameraObj.getCameraManager(context);
  }
  if (isEmpty(cameraDevicesArray)) {
    cameraDevicesArray = cameraManager.getSupportedCameras();
  }
  let cameraOutputCap =
  cameraManager.getSupportedOutputCapability(cameraDevicesArray[idx], mode);
  if(cameraOutputCap.previewProfiles){
    console.info('cameraOutputCap.previewProfiles = ' + JSON.stringify(cameraOutputCap.previewProfiles));
    let formatSet: Set<number> = new Set()
    for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
      let previewFoamat = cameraOutputCap.previewProfiles[i].format;
      formatSet.add(previewFoamat)
    }
    fornatData.previewProfiles = Array.from(formatSet)
  }
  if (cameraOutputCap.photoProfiles) {
    console.info('cameraOutputCap.photoProfiles = ' + JSON.stringify(cameraOutputCap.photoProfiles));
    let formatSet: Set<number> = new Set()
    for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
      let photoFoamat = cameraOutputCap.photoProfiles[i].format;
      formatSet.add(photoFoamat)
    }
    fornatData.photoProfiles = Array.from(formatSet)
  }
  if (cameraOutputCap.videoProfiles) {
    console.info('cameraOutputCap.videoProfiles = ' + JSON.stringify(cameraOutputCap.videoProfiles));
    let formatSet: Set<number> = new Set()
    for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
      let videoFoamat = cameraOutputCap.videoProfiles[i].format;
      formatSet.add(videoFoamat)
    }
    fornatData.videoProfiles = Array.from(formatSet)
  }
  return fornatData
}

let setAutoFlashMode = (session: cameraObj.PhotoSession) => {
  let flashStatus: boolean = false;
  try {
    flashStatus = session.hasFlash();
  } catch (error) {
    let err = error as BusinessError;
    console.info('Failed to hasFlash. errorCode = ' + err.code);
  }
  console.info('Returned with the flash light support status:' + flashStatus);
  if (flashStatus) {
    let flashModeStatus: boolean = false;
    try {
      let status: boolean = session.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
      flashModeStatus = status;
    } catch (error) {
      let err = error as BusinessError;
      console.error('Failed to check whether the flash mode is supported. errorCode = ' + err.code);
    }
    if(flashModeStatus) {
      try {
        session.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
      } catch (error) {
        let err = error as BusinessError;
        console.error('Failed to set the flash mode. errorCode = ' + err.code);
      }
    }
  }
}

let setAutoFocusMode = (session: cameraObj.PhotoSession) => {
  let focusModeStatus: boolean = false;
  try {
    let status: boolean = session.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    focusModeStatus = status;
  } catch (error) {
    let err = error as BusinessError;
    console.error('Failed to check whether the focus mode is supported. errorCode = ' + err.code);
  }

  if (focusModeStatus) {
    try {
      session.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    } catch (error) {
      let err = error as BusinessError;
      console.error('Failed to set the focus mode. errorCode = ' + err.code);
    }
  }
}

let setAutoZoomRatio = (session: cameraObj.PhotoSession) => {
  let zoomRatioRange: Array<number> = [];
  try {
    zoomRatioRange = session.getZoomRatioRange();
  } catch (error) {
    let err = error as BusinessError;
    console.error('Failed to get the zoom ratio range. errorCode = ' + err.code);
  }
  if (zoomRatioRange.length <= 0) {
    return;
  }

  try {
    session.setZoomRatio(zoomRatioRange[0]);
  } catch (error) {
    let err = error as BusinessError;
    console.error('Failed to set the zoom ratio value. errorCode = ' + err.code);
  }
}

let setPhotoOutputCb = async (photoOutput: cameraObj.PhotoOutput, ) => {
  photoOutput.on('photoAvailable', (errCode: BusinessError, photo: cameraObj.Photo): void => {
    console.info('getPhoto start');
    console.info(`err: ${JSON.stringify(errCode)}`);
    if (errCode || photo === undefined) {
      console.error('getPhoto failed');
      return;
    }
    imageObj = photo.main;
    imageObj.getComponent(image.ComponentType.JPEG, (errCode: BusinessError, component: image.Component): void => {
      console.info('getComponent start');
      if (errCode || component === undefined) {
        console.error('getComponent failed');
        return;
      }
      let buffer: ArrayBuffer;
      if (component.byteBuffer) {
        buffer = component.byteBuffer;
      } else {
        console.error('byteBuffer is null');
        return;
      }
    });
  });
}

export default function cameraCaptureSceneTest() {

  describe('cameraCaptureSceneTest', () => {
    console.info(TAG + '----------cameraCaptureSceneTest begin--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      await sleep(2000);
      console.info('beforeAll case');
      await ability();
      context = AppStorage.get('thisContext') as common.UIAbilityContext;
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
    })

    beforeEach(async () => {
      await sleep(1000);
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0100
     * @tc.name      : test sub multimedia camera photoOutput capture
     * @tc.desc      : test sub multimedia camera photoOutput capture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0100', Level.LEVEL2, async (done: Function) => {
      console.info(TAG + " --------------Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0100--------------");
      await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO)
      await setPhotoOutputCb(photoOutput)
      setAutoFlashMode(cameraSession)
      setAutoFocusMode(cameraSession)
      setAutoZoomRatio(cameraSession)
      photoOutput.capture(captureSetting);
      await sleep(10000)
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0100, imageObj: " + imageObj);
      expect(imageObj != undefined).assertTrue()
      imageObj.release()
      await stopCameraSession()
      console.info(TAG + " --------------Exit SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0100--------------");
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0200
     * @tc.name      : test sub multimedia camera photoOutput capture on all format
     * @tc.desc      : test sub multimedia camera photoOutput capture on all format
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0200--------------");
      let formatData = getOutPutFormatArray(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info("formatData: " + JSON.stringify(formatData))
      for (let i = 0; i < formatData.photoProfiles.length; i++) {
        let currentFormat = formatData.photoProfiles[i]
        console.info("currentFormat: " + JSON.stringify(currentFormat))
        getCameraDevices()
        await createInput(0);
        let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
        for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
          if ( cameraOutputCap.photoProfiles[i].format == currentFormat) {
            photoOutput = cameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
            console.log(`createPhotoOutput ok: ${JSON.stringify(photoOutput)}, format: ${JSON.stringify(cameraOutputCap.photoProfiles[i].format)}`)
            let previewProfile = cameraOutputCap.previewProfiles.find((previewProfile: cameraObj.Profile) => {
              return Math.abs((previewProfile.size.width / previewProfile.size.height) - (cameraOutputCap.photoProfiles[i].size.width / cameraOutputCap.photoProfiles[i].size.height)) < Number.EPSILON;
            });
            previewOutput = cameraManager.createPreviewOutput(previewProfile, surfaceIds);
            console.log(`createPreviewOutput ok: ${JSON.stringify(previewOutput)}`)
            break
          }
        }
        setPhotoOutputCb(photoOutput)
        createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO)
        if (cameraInput) {
          cameraSession.addInput(cameraInput);
        }
        if (previewOutput) {
          cameraSession.addOutput(previewOutput);
        }
        if (photoOutput) {
          cameraSession.addOutput(photoOutput);
        }
        await cameraSession.commitConfig();
        await cameraSession.start()

        photoOutput.capture(captureSetting);
        await sleep(10000)
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0200, imageObj: " + imageObj);
        expect(imageObj != undefined).assertTrue()
        imageObj.release()
        await stopCameraSession()
      }
      console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0200--------------");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0300
     * @tc.name      : test sub multimedia camera photoOutput capture on format CAMERA_FORMAT_HEIC
     * @tc.desc      : test sub multimedia camera photoOutput capture on format CAMERA_FORMAT_HEIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0300--------------");

      let currentFormat = cameraObj.CameraFormat.CAMERA_FORMAT_HEIC
      console.info("currentFormat: " + JSON.stringify(currentFormat))
      getCameraDevices()
      await createInput(0);
      let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      let photoProfile: cameraObj.Profile = {
        format: currentFormat,
        size: cameraOutputCap.photoProfiles[0].size
      }

      photoOutput = cameraManager.createPhotoOutput(photoProfile);
      console.log(`createPhotoOutput ok: ${JSON.stringify(photoOutput)}, ${JSON.stringify(photoProfile)}`)
      let previewProfile = cameraOutputCap.previewProfiles.find((previewProfile: cameraObj.Profile) => {
        return Math.abs((previewProfile.size.width / previewProfile.size.height) - (photoProfile.size.width / photoProfile.size.height)) < Number.EPSILON;
      });
      previewOutput = cameraManager.createPreviewOutput(previewProfile, surfaceIds);
      console.log(`createPreviewOutput ok: ${JSON.stringify(previewOutput)}, ${JSON.stringify(previewProfile)}`)

      await setPhotoOutputCb(photoOutput)
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO)
      if (cameraInput) {
        cameraSession.addInput(cameraInput);
      }
      if (previewOutput) {
        cameraSession.addOutput(previewOutput);
      }
      if (photoOutput) {
        try {
          cameraSession.addOutput(photoOutput);
        } catch (err) {
          console.info(`addOutput photoOutput failed, error code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`)
          let formatData = getOutPutFormatArray(0, cameraObj.SceneMode.NORMAL_PHOTO)
          if (formatData.photoProfiles.includes(currentFormat)) {
            expect().assertFail()
          } else {
            expect(err.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR)
            photoOutput.release()
            previewOutput.release()
            console.info("SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0300 success")
            done()
            return
          }
        }
      }
      await cameraSession.commitConfig();
      await cameraSession.start()

      photoOutput.capture(captureSetting);
      await sleep(10000)
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0300, imageObj: " + imageObj);
      expect(imageObj != undefined).assertTrue()
      imageObj.release()
      await stopCameraSession()

      console.info("--------------Exit SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_0300--------------");
      done();
    })

  })
}