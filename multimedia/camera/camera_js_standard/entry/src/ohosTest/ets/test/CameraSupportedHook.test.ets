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
import { BusinessError } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';

const TAG = "CameraMacroTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession|camera.VideoSession;

let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;

let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput | null = null;
let mPhotoOutput: camera.PhotoOutput | null = null;
let mVideoOutput: camera.VideoOutput | null = null;
let msecureOutput: camera.PreviewOutput | null = null;
let nbiasRangeArray: Array<number> ;
let nzoomRatioRange: Array<number> = [];

let receiver: image.ImageReceiver;
let context = getContext();

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

export default function CameraPhotoSessionTest() {

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
      mCameraSession.beginConfig();
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
      try {
      await mCameraSession.release();
      } catch(err) {
        console.info('Exit releaseCameraSessionInstance failed errcode is '+ err.code);
      }
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

    if (!isEmpty(mVideoOutput)) {
      await mVideoOutput?.release();
      mVideoOutput = null;
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number,mode: number) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    await sleep(1);


    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    if(mode == camera.SceneMode.NORMAL_PHOTO){
      if (!isEmpty(mPhotoOutput)) {
        console.info(TAG + "Start to addOutput mPhotoOutput");
        mCameraSession.addOutput(mPhotoOutput);
      }
    } else {
      if (!isEmpty(mVideoOutput)) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        mCameraSession.addOutput(mVideoOutput);
      }
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
    mCameraSession.beginConfig();
    await mCameraSession.stop();
    await sleep(100);

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession.removeInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession.removeOutput(mPreviewOutput);
    }

    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }



  describe('CameraSupportedHook', () => {
    console.info(TAG + '----------CameraSupportedHook--------------')

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
    })

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(100);
      await releaseCameraSessionInstance();
    })

    afterAll(async () => {
      await releaseCameraSessionInstance();
      await sleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100
     * @tc.desc   Test videoOutput start supported hook
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_VIDEO);
      await startCameraSession(0, camera.SceneMode.NORMAL_VIDEO);
      let isAddBefore = false;
      let isAddAfter = false;
      let isReplace = false;
      util.Aspect.addBefore(mVideoOutput!.constructor, 'start', false, () => {
        console.info(TAG, 'mVideoOutput.start test util.aspect.addBefore');
        isAddBefore = true;
      });

      util.Aspect.addAfter(mVideoOutput!.constructor, 'start', false, () => {
        console.info(TAG, 'mVideoOutput.start test util.aspect.addAfter');
        isAddAfter = true;
      });

      try {
        await mVideoOutput!.start();
        await sleep(500)
        await mVideoOutput!.stop();
        util.Aspect.replace(mVideoOutput!.constructor, 'start', false, () => {
            console.info(TAG, 'mVideoOutput.start test util.aspect.replace');
            isReplace = true;
        });
        await mVideoOutput!.start();
        await sleep(500)
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100 isAddBefore: " + isAddBefore);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100 isAddAfter: " + isAddAfter);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100 isReplace: " + isReplace);
        expect(isAddBefore && isAddAfter && isReplace).assertTrue();
      } catch (err) {
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_START_SUPORTED_HOOK_0100 FAILED" + err.code);
          expect(true).assertFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100
     * @tc.desc   Test videoOutput stop supported hook
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_VIDEO);
      await startCameraSession(0, camera.SceneMode.NORMAL_VIDEO);
      let isAddBefore = false;
      let isAddAfter = false;
      let isReplace = false;
      util.Aspect.addBefore(mVideoOutput!.constructor, 'stop', false, () => {
        console.info(TAG, 'mVideoOutput.stop test util.aspect.addBefore');
        isAddBefore = true;
      });

      util.Aspect.addAfter(mVideoOutput!.constructor, 'stop', false, () => {
        console.info(TAG, 'mVideoOutput.stop test util.aspect.addAfter');
        isAddAfter = true;
      });

      try {

        await mVideoOutput!.start();
        await sleep(500)
        await mVideoOutput!.stop();
        util.Aspect.replace(mVideoOutput!.constructor, 'stop', false, () => {
            console.info(TAG, 'mVideoOutput.stop test util.aspect.replace');
            isReplace = true;
        });
        await mVideoOutput!.stop();
        await sleep(500)
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100 isAddBefore: " + isAddBefore);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100 isAddAfter: " + isAddAfter);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100 isReplace: " + isReplace);
        expect(isAddBefore && isAddAfter && isReplace).assertTrue();
      } catch (err) {
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_VIDEOOUTPUT_STOP_SUPORTED_HOOK_0100 FAILED" + err.code);
          expect(true).assertFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100
     * @tc.desc   Test photoOutput capture supported hook
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      createCameraSessionInstance(camera.SceneMode.NORMAL_PHOTO);
      await startCameraSession(0, camera.SceneMode.NORMAL_PHOTO);
      let isAddBefore = false;
      let isAddAfter = false;
      let isReplace = false;
      util.Aspect.addBefore(mPhotoOutput!.constructor, 'capture', false, () => {
        console.info(TAG, 'mPhotoOutput.capture test util.aspect.addBefore');
        isAddBefore = true;
      });

      util.Aspect.addAfter(mPhotoOutput!.constructor, 'capture', false, () => {
        console.info(TAG, 'mPhotoOutput.capture test util.aspect.addAfter');
        isAddAfter = true;
      });

      try {
        await mPhotoOutput!.capture();
        await sleep(500)
        util.Aspect.replace(mPhotoOutput!.constructor, 'capture', false, () => {
            console.info(TAG, 'mPhotoOutput.capture test util.aspect.replace');
            isReplace = true;
        });
        await mPhotoOutput!.capture();
        await sleep(500)
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100 isAddBefore: " + isAddBefore);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100 isAddAfter: " + isAddAfter);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100 isReplace: " + isReplace);
        expect(isAddBefore && isAddAfter && isReplace).assertTrue();
      } catch (err) {
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_CAPTURE_SUPORTED_HOOK_0100 FAILED" + err.code);
          expect(true).assertFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_CLOSE_SUPORTED_HOOK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_CLOSE_SUPORTED_HOOK_0100
     * @tc.desc   Test cameraInput close supported hook
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_CLOSE_SUPORTED_HOOK_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_CLOSE_SUPORTED_HOOK_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_CLOSE_SUPORTED_HOOK_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      await createInput(0);
      let isAddBefore = false;
      let isAddAfter = false;
      let isReplace = false;
      util.Aspect.addBefore(mCameraInput.constructor, 'close', false, () => {
        console.info(TAG, 'mCameraInput.close test util.aspect.addBefore');
        isAddBefore = true;
      });

      util.Aspect.addAfter(mCameraInput.constructor, 'close', false, () => {
        console.info(TAG, 'mCameraInput.close test util.aspect.addAfter');
        isAddAfter = true;
      });

      try {
        await mCameraInput.open();
        await mCameraInput.close();
        let startTime = Date.now()
        util.Aspect.replace(mCameraInput.constructor, 'close', false, () => {
            console.info(TAG, 'mCameraInput.close test util.aspect.replace');
            isReplace = true;
        });
        await mCameraInput.close();
        await sleep(500)
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 isAddBefore: " + isAddBefore);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 isAddAfter: " + isAddAfter);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 isReplace: " + isReplace);
        expect(isAddBefore && isAddAfter && isReplace).assertTrue();
      } catch (err) {
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_CLOSE_SUPORTED_HOOK_0100 FAILED" + err.code);
          expect(true).assertFalse();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100
     * @tc.desc   Test cameraInput open supported hook
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      await createInput(0);
      let isAddBefore = false;
      let isAddAfter = false;
      let isReplace = false;
      util.Aspect.addBefore(mCameraInput.constructor, 'open', false, () => {
        console.info(TAG, 'mCameraInput.open test util.aspect.addBefore');
        isAddBefore = true;
      });

      util.Aspect.addAfter(mCameraInput.constructor, 'open', false, () => {
        console.info(TAG, 'mCameraInput.open test util.aspect.addAfter');
        isAddAfter = true;
      });

      try {
        await mCameraInput.open();
        util.Aspect.replace(mCameraInput.constructor, 'open', false, () => {
            console.info(TAG, 'mCameraInput.open test util.aspect.replace');
            isReplace = true;
        });
        await mCameraInput.open();
        await sleep(500)
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 isAddBefore: " + isAddBefore);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 isAddAfter: " + isAddAfter);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 isReplace: " + isReplace);
        expect(isAddBefore && isAddAfter && isReplace).assertTrue();
      } catch (err) {
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERAINPUT_OPEN_SUPORTED_HOOK_0100 FAILED" + err.code);
          expect(true).assertFalse();
      }
      done();
    })
  })
}