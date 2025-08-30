/*
 * Copyright (C) 2025-2025 Huawei Device Co., Ltd.
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
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { getPermission, driveFn } from '../common';

const TAG = "CameraConcurrentTestSupp: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;
let receiver: image.ImageReceiver;
let context = getContext();


let power: ESObject;

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
  await sleep(500)
}

export function isSupportCameras() : boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context = getContext();
  let isSupportedCameras = true;
  let isSupportCamera = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info(TAG + 'Enter getCameraManagerInstance');
  mCameraManager = camera.getCameraManager(context);
  if (isEmpty(mCameraManager)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  mCameraDevicesArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDevicesArray)) {
    isSupportedCameras = false;
  }
  if (cameraAvailable && isSupportedCameras) {
    isSupportCamera = true;
  } else {
    isSupportCamera = false;
  }
  return isSupportCamera;
}

export function CameraConcurrentTest() {

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


  describe('CameraConcurrentTest', () => {
    console.info(TAG + '----------CameraConcurrentTest--------------')

    beforeAll(async () => {
      let dr = Driver.create();
      sleep(1000);
      await getPermission();
      await driveFn();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await ability();
    })

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(async () => {
      console.info('afterAll case');
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0100
     * @tc.desc      : check camerainput open by concurrent cameraPosition -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0100 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: -1,
            cameraOrientation: 180,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0100 camera concurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraId is empty: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0200
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0200
     * @tc.desc      : check camerainput open by concurrent cameraPosition 4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0200--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0200 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          {
            cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: 4,
            cameraOrientation: 180,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0200 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0300
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0300
     * @tc.desc      : check camerainput open by concurrent cameraType 5
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0300--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0300 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: 5,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation: 180,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0300 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0400
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0400
     * @tc.desc      : check camerainput open by concurrent cameraType -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0400--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0400 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          {
            cameraId: "lcam001",
            cameraType: -1,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation: 180,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0400 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0500
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0500
     * @tc.desc      : check camerainput open by concurrent cameraOrientation -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0500--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0500 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:-1,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0500 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0600
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0600
     * @tc.desc      : check camerainput open by concurrent cameraOrientation 361
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0600--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0600 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          {
            cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation: 361,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0600 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0700
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0700
     * @tc.desc      : check camerainput open by concurrent ConnectionType 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0700', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0700--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0700 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType: 3,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0700 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0800
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0800
     * @tc.desc      : check camerainput open by concurrent ConnectionType -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0800', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0800--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0800 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType: -1,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0800 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0900
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0900
     * @tc.desc      : check camerainput open by concurrent hostDeviceName empty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0900', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0900--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0900 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType:camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_0900 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: hostDeviceName is Empty: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01000
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01000
     * @tc.desc      : check camerainput open by concurrent hostDeviceType -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01000', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01000--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01000 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType:camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType:-1
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01000 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: hostDeviceType is -1: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01100
     * @tc.desc      : check camerainput open by concurrent hostDeviceType  0x12
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01100 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType:camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType:	0x12
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01100 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: hostDeviceType is 0x12: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01200
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01200
     * @tc.desc      : check camerainput open by concurrent CameraConcurrentInfos empty
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01200', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01200--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01200 FAILED with NoCamera");
        done();
        return;
      }
      try {
        console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
        let devicesArray: camera.CameraDevice[] = []
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01200 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: CameraConcurrentInfos is empty: " + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01300
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01300
     * @tc.desc      : check camerainput open by concurrent CameraConcurrentInfos null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01300', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01300--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01300 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] | null= null
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01300 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: CameraConcurrentInfos is null: " + err.code);
        expect(err.code == 401).assertTrue();
      }
      done();
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01400
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01400
     * @tc.desc      : check camerainput open by concurrent CameraConcurrentInfos undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01400', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01400--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01400 FAILED with NoCamera");
        done();
        return;
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] | undefined= undefined
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_01400 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: CameraConcurrentInfos is undefined: " + err.code);
        expect(err.code == 401).assertTrue();
      }
      done();
    })


  })
}