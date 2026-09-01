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
import { getPermission, sleep } from '../Common.test';
import { Context } from '@kit.ArkUI';
import { colorSpaceManager } from '@kit.ArkGraphics2D';


const TAG = "CameraXtsPhotoOutputStaticTest";
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

export default function ApertureTest(): void {
  describe('ApertureTest', () => {
    console.info(TAG + '----------ApertureTest--------------');
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
    });

    afterAll(async () => {
      console.info('afterAll case');
    });


    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_static_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_static_0100
     * @tc.desc getPhysicalAperture normal test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_static_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      try {
        let physicalAperture: number = mPhotoSession!.getPhysicalAperture();
        console.info(TAG, testName + ' physicalAperture: ' + physicalAperture);
        // 返回值验证：必须为 number 类型
        expect(typeof physicalAperture).assertEqual('number');
        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      // 说明：测试执行后的清理操作
      // 内容：
      // 1. 相机会话的释放
      // 2. 测试过程中创建的资源的释放
      // 3. 其他必要的清理操作
      await releasePhotoSession();
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0200
     * @tc.desc getPhysicalAperture error code 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0200';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
        try {
          mPhotoSession!.getPhysicalAperture();
          console.error(TAG, testName + ' should throw error 7400103.');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName + ' catch error: ' + error.code + ', msg: ' + error.message);
          expect(Number(error.code)).assertEqual(7400103);
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0100
     * @tc.desc setPhysicalAperture normal test with minimum value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      await mPhotoSession!.start();
      try {
        // 先查后用：获取支持的物理光圈范围
        let supportedApertures: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' supportedApertures: ' + JSON.stringify(supportedApertures));
        if (supportedApertures.length > 0) {
          // 设置物理光圈值为最小边界值
          let minAperture = supportedApertures[0];
          console.info(TAG, testName + ' set aperture to min: ' + minAperture);
          
          // 先设置焦距，焦距在对应的变焦范围内，设置对应的物理光圈值才会生效
          mPhotoSession!.setZoomRatio(minAperture.zoomRange.min);
          let zoomRatioRange: number[] = mPhotoSession!.getZoomRatioRange()
          console.info(`zoomRatioRange: ${zoomRatioRange}`)
          let expectRatio: number = minAperture.zoomRange.min
          if (minAperture.zoomRange.min < zoomRatioRange[0]) {
            expectRatio = zoomRatioRange[0]
          }
          console.info(`expectRatio: ${expectRatio}`)

          // 等待焦距设置成功
          let startTime: number = Date.now()
          while (Date.now() - startTime < 3000) {
            let currentRatio: number = mPhotoSession!.getZoomRatio();
            console.info(`currentRatio: ${currentRatio}`)
            if (currentRatio == expectRatio) {
              break
            }
            await sleep(100)
          }
          // 设置物理光圈值
          mPhotoSession!.setPhysicalAperture(minAperture.apertures[0]);
          // 设置生效验证：获取当前物理光圈值验证设置是否生效
          let currentAperture: number = mPhotoSession!.getPhysicalAperture();
          console.info(TAG, testName + ' currentAperture: ' + currentAperture);
          // 验证设置的值与获取的值一致
          expect(currentAperture).assertEqual(minAperture.apertures[0]);
        }
        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0200
     * @tc.desc setPhysicalAperture normal test with maximum value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_static_0200';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      await mPhotoSession!.start();
      // ========== 预制过程 ==========
      try {
        // 先查后用：获取支持的物理光圈范围
        let supportedApertures = mPhotoSession!.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' supportedApertures: ' + JSON.stringify(supportedApertures));
        if (supportedApertures.length > 0) {
          // 设置物理光圈值为最大边界值
          let maxAperture = supportedApertures[supportedApertures.length - 1];
          console.info(TAG, testName + ' set aperture to max: ' + maxAperture);

          // 先设置焦距，焦距在对应的变焦范围内，设置对应的物理光圈值才会生效
          mPhotoSession!.setZoomRatio(maxAperture.zoomRange.min);
          let zoomRatioRange: number[] = mPhotoSession!.getZoomRatioRange()
          console.info(`zoomRatioRange: ${zoomRatioRange}`)
          let expectRatio: number = maxAperture.zoomRange.min
          if (maxAperture.zoomRange.min > zoomRatioRange[0]) {
            expectRatio = zoomRatioRange[1]
          }
          console.info(`expectRatio: ${expectRatio}`)

          // 等待焦距设置成功
          let startTime: number = Date.now()
          while (Date.now() - startTime < 3000) {
            let currentRatio: number = mPhotoSession!.getZoomRatio();
            console.info(`currentRatio: ${currentRatio}`)
            if (currentRatio == expectRatio) {
              break
            }
            await sleep(100)
          }
          // 设置物理光圈值
          mPhotoSession!.setPhysicalAperture(maxAperture.apertures[0]);
          // 设置生效验证：获取当前物理光圈值验证设置是否生效
          let currentAperture: number = mPhotoSession!.getPhysicalAperture();
          console.info(TAG, testName + ' currentAperture: ' + currentAperture);
          // 验证设置的值与获取的值一致
          expect(currentAperture).assertEqual(maxAperture.apertures[0]);
        }
        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abNormal_static_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abNormal_static_0200
     * @tc.desc setPhysicalAperture error code 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abNormal_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abNormal_static_0200';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
         // ========== 预制过程 ==========
        // 预期错误码 7400103：会话未配置
        try {
          mPhotoSession!.setPhysicalAperture(1.8);
          console.error(TAG, testName + ' should throw error 7400103.');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName + ' catch error: ' + error.code + ', msg: ' + error.message);
          expect(Number(error.code)).assertEqual(7400103);
      }
      // ========== 恢复过程 ==========
    await releasePhotoSession();
    done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0300
     * @tc.desc getPhysicalAperture error code 7400102 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0300',
        TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abNormal_static_0300';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      await mCameraInput!.close();
      try {
        mPhotoSession!.getPhysicalAperture();
        console.error(TAG, testName + ' should throw error 7400102.');
        getCameraInput();
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName + ' catch error: ' + error.code + ', msg: ' + error.message);
        getCameraInput();
        expect(error.code).assertEqual(camera.CameraErrorCode.OPERATION_NOT_ALLOWED);
      }
      // ========== 恢复过程 ==========
      await releasePhotoSession();
      done();
    });

  });
}