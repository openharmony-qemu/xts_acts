/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import ndkTest from 'libentry.so'
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import { image } from '@kit.ImageKit';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import {UiDriver, BY } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult, Permissions } from '@kit.AbilityKit';

let mReceiverSurfaceId: string;
let latestImage: image.Image | undefined;

const sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

let getPermission = async () => {
  console.info('getPermission start');
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  console.info('permissions: Array<Permissions> = [\'ohos.permission.CAMERA\']')
  try {
      atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
          console.info('data:' + JSON.stringify(data))
          console.info('data permissions:' + data.permissions)
    })
  } catch (err) {
      console.info('err is ' + err);
  }
}

async function permissionClick() {
  console.info(`come in permissionClick`);
  let driver = await UiDriver.create();
  console.info(`driver is ${JSON.stringify(driver)}`);
  await sleep(100);
  console.info(`UiDriver start`);
  let button1 = await driver.findComponent(BY.text('允许'));
  let button2 = await driver.findComponent(BY.text('始终允许'));
  console.info(`button1 is ${JSON.stringify(button1)}`);
  console.info(`button2 is ${JSON.stringify(button2)}`);
  if (button1 == null && button2 == null) {
      let delegator = abilityDelegatorRegistry.getAbilityDelegator();
      let cmd = "hidumper -s WindowManagerService -a'-a'"
      await delegator.executeShellCommand(cmd);
  }
  await sleep(100);
  await button1?.click();
  await button2?.click();
  await sleep(1000);
}

async function startCamera() {
  let testContext: common.UIAbilityContext = AppStorage.get('thisContext') as common.UIAbilityContext;
  let cameraManager = camera.getCameraManager(testContext);
  let cameraDeviceArray = cameraManager.getSupportedCameras();
  let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
  console.log(`cameraOutputCap is ${cameraOutputCap}`);

  let size: image.Size = {
    height: 8,
    width: 8192
  };
  const ImageFormat = image.ImageFormat.JPEG;
  let receiver: image.ImageReceiver = image.createImageReceiver(size, ImageFormat, 8);
  mReceiverSurfaceId = await receiver.getReceivingSurfaceId();

  let cameraInput = cameraManager.createCameraInput(cameraDeviceArray[0]);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  console.log('photoProfile: w: ' + photoProfile.size.width + 'h: ' + photoProfile.size.height);
  console.log('previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  let previewOutput = cameraManager.createPreviewOutput(previewProfile, mReceiverSurfaceId);
  let photoOutput = cameraManager.createPhotoOutput(photoProfile);
  console.info('getCreatePhotoSession.');
  let photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  console.info('getCreatePhotoSession.', photoSession);
  photoSession.beginConfig();
  photoSession.addInput(cameraInput);
  cameraInput.open();
  photoSession.addOutput(previewOutput);
  photoSession.addOutput(photoOutput);
  await photoSession.commitConfig();
  await photoSession.start();
  await sleep (1000);
  console.info('getCreatePhotoSession.success');
  photoOutput.capture();
  console.info('capture success');
  for (let i = 0; i < 25; i++) {
    latestImage = await receiver.readLatestImage();
    if (latestImage !== undefined) {
      console.info('get latestImage success');
      break;
    }
    await sleep(200);
  }
  expect(latestImage != undefined).assertTrue();
  console.info('Got latest image:', latestImage);
}

export default function ImageEnumTest() {
  describe('ImageEnumTest', () => {
    beforeAll(async () => {
      await getPermission();
      await permissionClick();
      await startCamera();
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_001
     * @tc.number SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_001
     * @tc.desc   OHOS_IMAGE_COMPONENT_FORMAT_YUV_Y、U、V、JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_001', Level.LEVEL1, async (done: Function) => {
      let testNum = 'SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_001';
      try {
        let ret: number = ndkTest.imageComponentFormatEnum();
        console.info(testNum + 'ret is ' + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err) {
        console.error(testNum + "fail: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_002
     * @tc.number SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_002
     * @tc.desc   OHOS_IMAGE_COMPONENT_FORMAT_YUV_Y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_002', Level.LEVEL1, async (done: Function) => {
      let testNum = 'SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_002';
      try {
        let ret: number = ndkTest.imageComponentFormatYUVY(latestImage);
        console.info(testNum + 'ret is ' + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err) {
        console.error(testNum + "fail: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_003
     * @tc.number SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_003
     * @tc.desc   OHOS_IMAGE_COMPONENT_FORMAT_YUV_U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_003', Level.LEVEL1, async (done: Function) => {
      let testNum = 'SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_003';
      try {
        let ret: number = ndkTest.imageComponentFormatYUVU(latestImage);
        console.info(testNum + 'ret is ' + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err) {
        console.error(testNum + "fail: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_004
     * @tc.number SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_004
     * @tc.desc   OHOS_IMAGE_COMPONENT_FORMAT_YUV_V
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_004', Level.LEVEL1, async (done: Function) => {
      let testNum = 'SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_004';
      try {
        let ret: number = ndkTest.imageComponentFormatYUVV(latestImage);
        console.info(testNum + 'ret is ' + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err) {
        console.error(testNum + "fail: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_005
     * @tc.number SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_005
     * @tc.desc   OHOS_IMAGE_COMPONENT_FORMAT_JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_005', Level.LEVEL1, async (done: Function) => {
      let testNum = 'SUB_OH_IMAGE_COMPINENT_FORMAT_ENUM_005';
      try {
        let ret: number = ndkTest.imageComponentFormatJPEG(latestImage);
        console.info(testNum + 'ret is ' + ret);
        expect(ret).assertEqual(0);
        done();
      } catch (err) {
        console.error(testNum + "fail: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_OHOS_IMAGE_RECT_001
     * @tc.number SUB_OHOS_IMAGE_RECT_001
     * @tc.desc   struct OhosImageRect {...}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OHOS_IMAGE_RECT_001', Level.LEVEL1, async (done: Function) => {
      let testNum = 'SUB_OHOS_IMAGE_RECT_001';
      try {
        let result = ndkTest.imageClipRect(latestImage);
        console.info(testNum + 'result is ' + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error(testNum + "fail: " + err);
        expect().assertFail();
        done();
      }
    });

  })
}