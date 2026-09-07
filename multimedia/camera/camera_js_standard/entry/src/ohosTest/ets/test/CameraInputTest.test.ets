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
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { surfaceIds } from '../testability/pages/Index';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';

const TAG = "CameraInputTest: ";
const CAMERA_INVALID_ARGUMENT = "7400101"

// Define global variables
let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.CaptureSession;

let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
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

export default function CameraInputTest() {


  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');

    mCameraManager = cameraObj.getCameraManager(context);
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
    /*
    mCameraManager.getSupportedCameras(async (err, data) => {
        console.info(TAG + "Entering getCameraSupportDevicesArray callback");
        if (!err) {
            if (data != null || data != undefined) {
                mCameraDevicesArray = data;
                console.info(TAG + "Entering getCameraSupportDevicesArray PASSED with CameraDevicesArray is: " + data);
            } else {
                console.info(TAG + "Entering getCameraSupportDevicesArray FAILED with CameraDevicesArray is: " + data);
            }
        } else {
            console.info(TAG + "Entering getCameraSupportDevicesArray FAILED : " + err.message);
        }
    })
    await sleep(300);
    */
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    //mCameraNum = 1;
    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let beginCameraSessionConfig = () => {
    console.info('Enter beginCameraSessionConfig');

    console.info(TAG + "Entering beginConfig start");
    mCameraSession.beginConfig();
    console.info(TAG + "Entering beginConfig end");
    console.info('Exit beginCameraSessionConfig');

    return true;
  }

  let commitCameraSessionConfig = async () => {
    console.info('Enter commitCameraSessionConfig');

    mCameraSession.commitConfig(async (err: BusinessError) => {
      if (!err) {
        console.info(TAG + "Entering commitConfig PASSED");
      } else {
        console.info(TAG + "Entering commitConfig FAILED : " + err.message);
      }
    })

    await sleep(500);

    console.info('Exit commitCameraSessionConfig');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createCaptureSession();
    } catch {
      console.info('createCaptureSession FAILED');
    }

    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }

    beginCameraSessionConfig();

    console.info('Exit createCameraSessionInstance');

    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession.release();
  }

  let createInput = async (idx: number) => {
    console.info('Enter createInput');

    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);

    if (isEmpty(mCameraInput)) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }

    await mCameraInput.open();

    sleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async () => {
    console.info('Enter releaseInput');

    if (!isEmpty(mCameraInput)) {
      await mCameraInput.close();
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
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async () => {
    console.info('Enter releaseOutput');

    if (!isEmpty(mPreviewOutput)) {
      await mPreviewOutput.release();
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number) => {
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

    await sleep(1);

    await commitCameraSessionConfig();

    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async () => {
    console.info(TAG + "Enter stopCameraSession");

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

  let occlusionDetectChange = async (err: BusinessError, result: cameraObj.CameraOcclusionDetectionResult) => {
    if (err) {
      console.info(TAG, 'cameraOcclusionDetection err.');
    }
    if (!result) {
      console.info(TAG, 'cameraOcclusionDetection: undefined');
      return;
    }
    if (result.isCameraOccluded) {
      console.info(TAG, `onCameraOcclusionDetection isCameraOccluded: ${result.isCameraOccluded}`);
    }
    if (result.isCameraLensDirty) {
      console.info(TAG, `onCameraOcclusionDetection isCameraLensDirty: ${result.isCameraLensDirty}`);
    }
  }

  describe('CameraInputTest', () => {
    console.info(TAG + '----------CameraInputTest--------------');
    beforeAll(async () => {
      let dr = Driver.create();
      sleep(1000);
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
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
    });
    beforeEach(() => {
      sleep(1000);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100
     * @tc.desc   camera status callback on CameraInput async api for error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100--------------");
   
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 start for camera[" + i + "]");
          await startCameraSession(i);
   
          mCameraInput.on('error', mCameraDevicesArray[i], async (err: BusinessError) => {
            if (isEmpty(err)) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 err == null || undefined");
              expect().assertFail();
            } else {
              console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 Callback SUCCESSFUL");
              expect(true).assertTrue();
            }
            await sleep(1);
          })

          try {
            mCameraInput.off('error', mCameraDevicesArray[i]);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 off('reeor') SUCCESSFUL");
            done();
          } catch (error) {
            let err = error as BusinessError
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 off('error') FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            expect().assertFail()
            done();
          }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_ERROR_0100 PASSED");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100
     * @tc.desc   camera status callback on CameraInput async api for cameraOcclusionDetection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100--------------");
   
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100 start for camera[" + i + "]");
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          try {
            cameraInput.on('cameraOcclusionDetection', occlusionDetectChange);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100 on('cameraOcclusionDetection') SUCCESSFUL");
            done();
          } catch (error) {
            let err = error as BusinessError
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100 on('cameraOcclusionDetection') FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            expect().assertFail()
            done();
          }

          try {
            cameraInput.off('cameraOcclusionDetection', occlusionDetectChange);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100 off('cameraOcclusionDetection') SUCCESSFUL");
            done();
          } catch (error) {
            let err = error as BusinessError
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100 off('cameraOcclusionDetection') FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            expect().assertFail()
            done();
          }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0100 PASSED");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200
     * @tc.desc   test cameraInput off cameraOcclusionDetection with no callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200--------------");
   
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200 start for camera[" + i + "]");
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          try {
            cameraInput.on('cameraOcclusionDetection', occlusionDetectChange);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200 on('cameraOcclusionDetection') SUCCESSFUL");
            done();
          } catch (error) {
            let err = error as BusinessError
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200 on('cameraOcclusionDetection') FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            expect().assertFail()
            done();
          }

          try {
            cameraInput.off('cameraOcclusionDetection');
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200 off('cameraOcclusionDetection') SUCCESSFUL");
            done();
          } catch (error) {
            let err = error as BusinessError
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200 off('cameraOcclusionDetection') FAILED!");
            console.info(TAG + 'ERRORCODE: ' + error.code)
            expect().assertFail()
            done();
          }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_ON_CAMERAOCCLUSIONDETECTION_0200 PASSED");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100
     * @tc.desc   camera status callback on RELEASE async api for error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        //for (let i = 0; i < mCameraNum; i++) {
          //console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100 start for camera[" + i + "]");
          //await startCameraSession(i);
          mCameraSession.release( async (err: BusinessError) => {
            if (err) {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100 callback err.code:"+err.code);
              console.info('Promise returned to indicate that the CaptureSession instance is released successfully.');
            }
            await sleep(1);
          })
          //console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100 end for camera[" + i + "]");
        //}
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_RELEASE_ERROR_0100 ends here");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100
     * @tc.desc   open/close Camera with cameraInput callback api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let successFlag = false;
          console.info(TAG + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          expect(isEmpty(cameraInput)).assertFalse();
          await cameraInput.open(async (err) => {
            if (!err) {
              successFlag = true;
              console.info(TAG +
                " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 PASSED open with CameraID :" +
              camerasArray[i].cameraId);
            } else {
              successFlag = false;
              console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 open FAILED: " +
              err.message);
            }
          });
          await sleep(400);
          cameraInput.close(async (err) => {
            if (!err) {
              console.info(TAG +
                " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 PASSED close with CameraID :" +
              camerasArray[i].cameraId);
              expect(true).assertEqual(true);
            } else {
              console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 close FAILED: " +
              err.message);
              expect(false).assertEqual(true);
            }
          });
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_CALLBACK_0100 ends here");
      await sleep(1000);
      done();
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100
     * @tc.desc   open/close Camera with cameraInput open api errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let successFlag = false;
          console.info(TAG + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          let cameraInput2 = mCameraManager.createCameraInput(camerasArray[i]);
          expect(isEmpty(cameraInput)).assertFalse();
          try {
            await cameraInput.open();
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100 open cameraInput" )
            await sleep(5000);
            await cameraInput2.open();
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100 open cameraInput2" )
          } catch(err) {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100 open FAILED: " +
            err.code);
            expect(err.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          }
          await sleep(400);
          cameraInput.close();
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN__ERRORCODE_0100 ends here");
      await sleep(1000);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100
     * @tc.desc   open/close Camera with cameraInput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100";
      console.info(functionTag);
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let successFlag = false;
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 createCameraInput with camera: " +
          camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 cameraInput open with camera: " +
          camerasArray[i].cameraId);
          await cameraInput.open().then(async () => {
            successFlag = true;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 PASSED open with CameraID :" +
            camerasArray[i].cameraId);
          }).catch((err: BusinessError) => {
            successFlag = false;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 open FAILED: " + err.message);
          });
          await sleep(400);
          successFlag = false;
          await cameraInput.close().then(async () => {
            successFlag = true;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 PASSED close with CameraID :" +
            camerasArray[i].cameraId);
          }).catch((err: BusinessError) => {
            successFlag = false;
            console.info(TAG + functionTag +
              " SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 close FAILED: " + err.message);
          });
          await sleep(100);
          expect(successFlag).assertEqual(true);
          await sleep(600);
        }
        //await sleep(400 * camerasArray.length);
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_CLOSE_PROMISE_0100 ends here");
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100
     * @tc.desc   query whether physical camera orientation is variable under different fold status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100', Level.LEVEL0, async (done: Function) => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100";
      console.info(functionTag);
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100 createCameraInput with camera: " +
          camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100 cameraInput open with camera: " +
          camerasArray[i].cameraId);

          try {
            let isVariable: boolean = cameraInput.isPhysicalCameraOrientationVariable();
          } catch (error) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100 FAILED");
            console.info(TAG + "ERRORCODE: " + error.code);
            expect().assertFail()
            done();
          }
        }
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_IS_ORIENTATION_VARIABLE_0100 ends here");
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100
     * @tc.desc   get physical camera orientation under current fold status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100', Level.LEVEL0, async (done: Function) => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100";
      console.info(functionTag);
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100 createCameraInput with camera: " +
          camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100 cameraInput open with camera: " +
          camerasArray[i].cameraId);

          try {
            let orientation: number = cameraInput.getPhysicalCameraOrientation();
          } catch (error) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100 FAILED");
            console.info(TAG + "ERRORCODE: " + error.code);
            expect().assertFail()
            done();
          }
        }
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_GETPHYSICALCAMERAORIENTATION_0100 ends here");
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100
     * @tc.desc   get physical camera orientation under current fold status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100', Level.LEVEL0, async (done: Function) => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100";
      console.info(functionTag);
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 createCameraInput with camera: " +
          camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 cameraInput open with camera: " +
          camerasArray[i].cameraId);

          try {
            if (cameraInput.isPhysicalCameraOrientationVariable()) {
              cameraInput.usePhysicalCameraOrientation(true);
              await sleep(100);
              cameraInput.usePhysicalCameraOrientation(false);
            }
          } catch (error) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 FAILED");
            console.info(TAG + "ERRORCODE: " + error.code);
            expect().assertFail()
            done();
          }
        }
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0100 ends here");
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0200
     * @tc.desc   cameraInput open api when param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0200"
      console.info("--------------" + caseName + "--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering " + caseName + " cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          console.info(TAG + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          expect(isEmpty(cameraInput)).assertFalse();
          try {
            await cameraInput.open(null);
            console.info(TAG + " " + caseName + " open cameraInput" )
          } catch(err) {
            console.info(TAG + " " + caseName + " open FAILED: " +
            err.code);
            expect(err.code).assertEqual(CAMERA_INVALID_ARGUMENT);
          }
          await cameraInput.close();
        }
      }
      console.info(TAG + "Entering " + caseName + " ends here");
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0300
     * @tc.desc   cameraInput open api when param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0300', Level.LEVEL2, async (done: Function) => {
      let caseName = "SUB_MULTIMEDIA_CAMERA_CAMERA_INPUT_OPEN_ERRORCODE_0300"
      console.info("--------------" + caseName + "--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering " + caseName + " cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          console.info(TAG + "Entering createCameraInput with camera: " + camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);
          expect(isEmpty(cameraInput)).assertFalse();
          try {
            await cameraInput.open(undefined);
            console.info(TAG + " " + caseName + " open cameraInput" )
          } catch(err) {
            console.info(TAG + " " + caseName + " open FAILED: " +
            err.code);
            expect(err.code).assertEqual(CAMERA_INVALID_ARGUMENT);
          }
          await cameraInput.close();
        }
      }
      console.info(TAG + "Entering " + caseName + " ends here");
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200
     * @tc.desc   cameraInput usePhysicalCameraOrientation when param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200', Level.LEVEL0, async (done: Function) => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200";
      console.info(functionTag);
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200 createCameraInput with camera: " +
          camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200 cameraInput open with camera: " +
          camerasArray[i].cameraId);

          try {
            cameraInput.usePhysicalCameraOrientation(null);
            console.info(`cameraInput usePhysicalCameraOrientation expect failed, but success`)
            expect().assertFail()
          } catch (error) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200 FAILED");
            console.info(TAG + "ERRORCODE: " + error.code);
            expect(error.code).assertEqual(CAMERA_INVALID_ARGUMENT)
            done();
          }
        }
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0200 ends here");
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300
     * @tc.desc   cameraInput usePhysicalCameraOrientation when param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300', Level.LEVEL0, async (done: Function) => {
      let functionTag = "SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300";
      console.info(functionTag);
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300 createCameraInput with camera: " +
          camerasArray[i].cameraId);
          let cameraInput = mCameraManager.createCameraInput(camerasArray[i]);

          expect(isEmpty(cameraInput)).assertFalse();
          console.info(TAG + functionTag +
            "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300 cameraInput open with camera: " +
          camerasArray[i].cameraId);

          try {
            cameraInput.usePhysicalCameraOrientation(undefined);
            console.info(`cameraInput usePhysicalCameraOrientation expect failed, but success`)
            expect().assertFail()
          } catch (error) {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300 FAILED");
            console.info(TAG + "ERRORCODE: " + error.code);
            expect(error.code).assertEqual(CAMERA_INVALID_ARGUMENT)
            done();
          }
        }
      }
      console.info(TAG + functionTag + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_USEPHYSICALCAMERAORIENTATION_0300 ends here");
      done();
    });

  })
}