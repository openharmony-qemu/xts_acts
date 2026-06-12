/*
 * Copyright (C) 2026-2026 Huawei Device Co., Ltd.
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

import camera from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { surfaceIds } from '../testability/pages/Index';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

const TAG = "CameraCapturePhotoWithCompressionQuality: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;

let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;

let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput | null = null;
let mPhotoOutput: camera.PhotoOutput | null = null;
let mVideoOutput: camera.VideoOutput | null = null;

let receiver: image.ImageReceiver;
let context = getContext();
let isSupportHEICEncode: boolean;

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

let power1: ESObject;
let power2: ESObject;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

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

export default function CameraCapturePhotoWithCompressionQuality() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = (sceneMode: camera.SceneMode) => {
    console.info('Enter createCameraSessionInstance' + sceneMode);
    try {
      mCameraSession = mCameraManager.createSession(sceneMode);
    } catch {
      console.info('createPhotoSession FAILED');
    }
    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createPhotoSession FAILED");
      return false;
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    console.info('Exit releaseCameraSessionInstance');
    if (!isEmpty(mCameraSession)) {
      await mCameraSession.release();
      // mCameraSession = null;
    }
    mPreviewOutput = null;
    mPhotoOutput = null;
  }

  let createInput = async (idx: number) => {
    console.info('Enter createInput');
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
    await mCameraInput.open();
    await sleep(100);
    console.info(idx + 'th CameraInput is: ' + mCameraInput);
    console.info('Exit createInput');
    return true;
  }

  let releaseInput = async () => {
    console.info('Enter releaseInput');
    if (!isEmpty(mCameraInput)) {
      await mCameraInput?.close();
    }
    console.info('Exit releaseInput');
    return true;
  }

  let createOutput = (idx: number) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);

    if (!isEmpty(cameraOutputCap)) {
      if (!isEmpty(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceIds);
          if (!isEmpty(mPreviewOutput)) {
            break;
          }
        }

        if (isEmpty(mPreviewOutput)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }

      if (!isEmpty(cameraOutputCap.photoProfiles)) {
        console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

        for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
          if (!isEmpty(mPhotoOutput)) {
            break;
          }
        }

        if (isEmpty(mPhotoOutput)) {
          console.info(TAG + "createPhotoOutput FAILED");
        }

        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
      }

      if (!isEmpty(cameraOutputCap.videoProfiles)) {
        console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length);
        for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
          try {
            mVideoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i],surfaceIds);
            if (!isEmpty(mVideoOutput)) {
              break;
            }
          } catch {
            console.info(TAG + "createVideoOutput FAILED");
          }
        }

        if (isEmpty(mVideoOutput)) {
          console.info(TAG + "createVideoOutput FAILED");
        }

        console.info(TAG + "createVideoOutput: " + mVideoOutput);
      }

    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async () => {
    console.info('Enter releaseOutput');

    if (!isEmpty(mPreviewOutput)) {
      await mPreviewOutput?.release();
      mPreviewOutput = null;
    }

    if (!isEmpty(mPhotoOutput)) {
      await mPhotoOutput?.release();
      mPhotoOutput = null;
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    await sleep(1);

    mCameraSession.beginConfig();

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    if (!isEmpty(mPhotoOutput)) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession.addOutput(mPhotoOutput);
    }

    await sleep(30);

    await mCameraSession.commitConfig();

    await sleep(50);

    await mCameraSession.start();

    if (!isEmpty(mPreviewOutput)) {
      mPreviewOutput?.getActiveProfile();
    }

    if (!isEmpty(mPhotoOutput)) {
      mPhotoOutput?.getActiveProfile();
    }

    await sleep(100);
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async () => {
    console.info(TAG + "Enter stopCameraSession");
    await releaseInput();
    await releaseOutput();
    console.info(TAG + "Exit stopCameraSession");
    return true;
  }

  describe('CameraCapturePhotoWithCompressionQuality', () => {
    console.info(TAG + '----------CameraCapturePhotoWithCompressionQuality--------------')

    beforeAll(async () => {
      let dr = Driver.create();
      sleep(100);
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await ability();
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power1 = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        power2 = await dr?.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
        await power1?.click();
        await power2?.click();
        power1 = null;
        power2 = null;
        await sleep(500);
      }
      isSupportHEICEncode = image.createImagePacker().supportedFormats.includes("image/heic");
      console.info('isSupportHEICEncode result is ' + isSupportHEICEncode);
    })

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(100);
      await stopCameraSession();
      await releaseCameraSessionInstance();
    })

    afterAll(async () => {
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0100
     * @tc.desc   Camera photo session capture with PhotoCaptureSetting All PARAMS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      let captureLocation: camera.Location = {
        latitude: 0,
        longitude: 0,
        altitude: 0
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      let photoCaptureSetting: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false,
        compressionQuality: 10
      }
      mPhotoOutput = mPhotoOutput as camera.PhotoOutput;
        try {
            await mPhotoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
                if (err) {
                  console.error(`Failed to capture the photo ${err.message}`);
                  expect().assertFail()
                  return;
                }
              });
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0100 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0200
     * @tc.desc   Camera photo session capture with PhotoCaptureSetting only compressionQuality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0200--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0200 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      let photoCaptureSetting: camera.PhotoCaptureSetting = {
        compressionQuality: 10
      }
      mPhotoOutput = mPhotoOutput as camera.PhotoOutput;
        try {
            await mPhotoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
                if (err) {
                  console.error(`Failed to capture the photo ${err.message}`);
                  expect().assertFail()
                  return;
                }
              });
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0200 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0300
     * @tc.desc   Camera photo session capture with PhotoCaptureSetting  compressionQuality 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0300--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0300 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      let photoCaptureSetting: camera.PhotoCaptureSetting = {
        compressionQuality: 0
      }
      mPhotoOutput = mPhotoOutput as camera.PhotoOutput;
        try {
            await mPhotoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
                if (err) {
                  console.error(`Failed to capture the photo ${err.message}`);
                  expect().assertFail()
                  return;
                }
              });
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0300 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0400
     * @tc.desc   Camera photo session capture with PhotoCaptureSetting  compressionQuality 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0400', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0400--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0400 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      let photoCaptureSetting: camera.PhotoCaptureSetting = {
        compressionQuality: 50
      }
      mPhotoOutput = mPhotoOutput as camera.PhotoOutput;
        try {
            await mPhotoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
                if (err) {
                  console.error(`Failed to capture the photo ${err.message}`);
                  expect().assertFail()
                  return;
                }
              });
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0400 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0500
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0500
     * @tc.desc   Camera photo session capture with PhotoCaptureSetting  compressionQuality 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0500', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0500--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0500 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      let photoCaptureSetting: camera.PhotoCaptureSetting = {
        compressionQuality: 100
      }
      mPhotoOutput = mPhotoOutput as camera.PhotoOutput;
        try {
            await mPhotoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
                if (err) {
                  console.error(`Failed to capture the photo ${err.message}`);
                  expect().assertFail()
                  return;
                }
              });
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0500 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0600
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0600
     * @tc.desc   Camera photo session capture with PhotoCaptureSetting  compressionQuality -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0600', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0600--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0600 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      let photoCaptureSetting: camera.PhotoCaptureSetting = {
        compressionQuality: -1
      }
      mPhotoOutput = mPhotoOutput as camera.PhotoOutput;
        try {
            await mPhotoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
                if (err) {
                  console.error(`Failed to capture the photo ${err.message}`);
                  expect().assertFail()
                  return;
                }
              });
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0600 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0700
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0700
     * @tc.desc   Camera photo session capture with PhotoCaptureSetting  compressionQuality 101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0700', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0700--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0700 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0);
      let photoCaptureSetting: camera.PhotoCaptureSetting = {
        compressionQuality: 101
      }
      mPhotoOutput = mPhotoOutput as camera.PhotoOutput;
        try {
            await mPhotoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
                if (err) {
                  console.error(`Failed to capture the photo ${err.message}`);
                  expect().assertFail()
                  return;
                }
              });
        } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_CAPTURE_WITH_COMPRESSIONQUALITY_0700 FAILED" + err.code);
            expect(true).assertFalse();
        }
      done();
    })
  })
}