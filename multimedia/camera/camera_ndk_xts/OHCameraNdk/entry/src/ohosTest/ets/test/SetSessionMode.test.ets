/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import cameras from 'libentry.so'
import image from '@ohos.multimedia.image';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const TAG = "CAMERA_LOGTAG_JS";
const CAMERA_OK = 0;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

async function getPhotoReceiverSurface() {
  console.log(TAG + '通过宽、高、图片格式、容量创建ImageReceiver实例。');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.log(TAG + '创建ImageReceiver实例 successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + '创建ImageReceiver实例 failed');
  }
}

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameras.initCamera(mPhotoSurface, 0);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(0);
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function isEmpty(data: cameras.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA"| "ohos.permission.MICROPHONE";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.MICROPHONE'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.ohcamerandk', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
};

export default function SetSessionModeTest() {
  describe('SetSessionModeTest', () => {
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      
    })
    beforeEach(async () => {
    })
    afterEach(async () => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   testOHCameraManagerSetSessionMode_0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateSessionSetMode_0100
     * @tc.desc   set session supported mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetSessionMode_0100', Level.LEVEL0, () => {
        let ret = cameras.oHCameraManagerCreateSessionSetMode();
        console.log(TAG+" testOHCameraManagerSetSessionMode_0100: "+ret);
        expect(ret).assertEqual(CAMERA_OK);
    })
  })
}