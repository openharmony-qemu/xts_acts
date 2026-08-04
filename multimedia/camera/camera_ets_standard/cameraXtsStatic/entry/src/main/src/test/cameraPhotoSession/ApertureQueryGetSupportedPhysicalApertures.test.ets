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
import {describe,beforeAll,beforeEach,afterEach,afterAll,it,expect,Level,Hypium,Size,TestType} from '../../../../hypium/index';
import { camera } from '@kit.CameraKit';
import { getPermission } from '../Common.test';
import { Context } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';

const TAG = 'xts-API24-ApertureQueryGetSupportedPhysicalAperturesTest';

let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let fdNumber: int | undefined;
let testContext: Context;
let indexSurfaceId: string = "";

let isEmptyCameraManager = (data: camera.CameraManager | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyCameraDevice = (data: camera.CameraDevice[] | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyCameraInput = (data: camera.CameraInput | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let getCameraManagerInstance = () => {
  console.info('Enter getCameraManagerInstance');
  testContext = Hypium.get("Context") as Context;
  indexSurfaceId = Hypium.get('SurfaceId') as string;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmptyCameraManager(mCameraManager!)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');

  return true;
}

function getCameraInput(): boolean {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    mCameraInput!.open();
    if (isEmptyCameraInput(mCameraInput!)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}

function getSupportedCameraDeviceArray(): boolean {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmptyCameraDevice(mCameraDeviceArray!)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
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
  mPreviewProfile = cameraOutputCap.previewProfiles[0];
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

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput!.release();
  await mPhotoOutput!.release();
  await mPhotoSession!.release();
}

let getContext = (): Context => {
  return Hypium.get('Context') as Context
}



export default function ApertureQueryGetSupportedPhysicalAperturesTest(): void {
  describe('ApertureQueryGetSupportedPhysicalAperturesTest', () => {
  console.info(TAG + '----------ApertureQueryGetSupportedPhysicalAperturesTest--------------');
  beforeAll(async () => {
    console.info('beforeAll case');
    await getPermission();
    getCameraManagerInstance();
    getSupportedCameraDeviceArray();
    getCameraInput();
  });

  beforeEach(() => {
    console.info('afterEach case');
  });

  afterEach(async () => {
    console.info('afterEach case');
    // await Utils.msSleep(500);
  });

  afterAll(async () => {
    console.info('afterAll case');
  });


  /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0100
     * @tc.desc   getSupportedPhysicalApertures normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      try {
        // 14. 调用 getSupportedPhysicalApertures 获取支持的物理光圈
        let apertures: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();
        // 15. 验证返回值类型为 Array<PhysicalAperture>
        console.info(TAG, testName + ' apertures: ' + JSON.stringify(apertures));
        expect(Array.isArray(apertures)).assertTrue();
        // 16. 验证数组中的每个元素都是 PhysicalAperture 类型
        for (const aperture of apertures) {
          expect(typeof aperture.apertures[0]).assertEqual('number');
        }
        console.info(TAG, testName + ' success.');
        done();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0200
     * @tc.desc   getSupportedPhysicalApertures repeated call test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0200';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      try {
        // 14. 第一次调用 getSupportedPhysicalApertures
        let apertures1: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' first call apertures: ' + JSON.stringify(apertures1));
        // 15. 第二次调用 getSupportedPhysicalApertures
        let apertures2: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' second call apertures: ' + JSON.stringify(apertures2));
        // 16. 验证两次调用返回值类型一致
        expect(Array.isArray(apertures1)).assertTrue();
        expect(Array.isArray(apertures2)).assertTrue();
        // 17. 验证两次调用返回值长度一致
        expect(apertures1.length).assertEqual(apertures2.length);

        // 18. 验证两次调用返回值内容一致
        for (let i = 0; i < apertures1.length; i++) {
          expect(JSON.stringify(apertures1[i])).assertEqual(JSON.stringify(apertures2[i]));
        }
        console.info(TAG, testName + ' success.');
        done();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0400
     * @tc.desc   getSupportedPhysicalApertures error code 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_static_0400';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      try {
        mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
        // 12. 在会话未配置时调用 getSupportedPhysicalApertures，期望抛出错误码 7400103
        let apertures: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();

        // 如果没有抛出异常，测试失败
        console.error(TAG, testName + ' failed. Expected error 7400103, but no error was thrown.',apertures);
        expect().assertFail();
        done();
      } catch (error) {
        // ========== 错误处理 ==========
        let err = error as BusinessError;
        console.error(TAG, testName + ' caught error. code: ' + err.code + ', msg: ' + err.message);
        // 13. 验证错误码为 7400103
        expect(Number(err.code)).assertEqual(7400103);
        console.info(TAG, testName + ' success.');
        done();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });
  });
}