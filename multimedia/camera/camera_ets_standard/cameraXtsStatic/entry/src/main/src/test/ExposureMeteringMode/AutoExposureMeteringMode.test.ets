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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium,
  Size,
  TestType
} from '../../../../hypium/index';
import { camera } from '@kit.CameraKit';
import { getPermission } from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';
import { Context } from '@kit.ArkUI';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
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

let isEmptyFocusState = (data: camera.FocusState) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

export default function ExposureMeteringModeStaticTest(): void {
  describe('ExposureMeteringModeStaticTest', () => {
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
      await Utils.msSleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0100
     * @tc.desc   isExposureMeteringModeSupported success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let matrixSupport = mPhotoSession!.isExposureMeteringModeSupported(camera.ExposureMeteringMode.MATRIX)
            expect(matrixSupport != undefined).assertTrue();

            let spotSupport = mPhotoSession!.isExposureMeteringModeSupported(camera.ExposureMeteringMode.SPOT)
            expect(spotSupport != undefined).assertTrue();

            let centerSupport = mPhotoSession!.isExposureMeteringModeSupported(camera.ExposureMeteringMode.CENTER)
            expect(centerSupport != undefined).assertTrue();

            mPhotoSession!.setExposureMeteringMode(camera.ExposureMeteringMode.MATRIX);
            let matrix = mPhotoSession!.getExposureMeteringMode();
            expect(matrix).assertEqual(0);
            mPhotoSession!.setExposureMeteringMode(camera.ExposureMeteringMode.CENTER);
            let center = mPhotoSession!.getExposureMeteringMode();
            expect(center).assertEqual(1);
            mPhotoSession!.setExposureMeteringMode(camera.ExposureMeteringMode.SPOT);
            let spot = mPhotoSession!.getExposureMeteringMode();
            expect(spot).assertEqual(2);
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0200
     * @tc.desc   getExposureMeteringMode with errorcode 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            await mCameraInput!.close();
            let matrixSupport = mPhotoSession!.isExposureMeteringModeSupported(camera.ExposureMeteringMode.MATRIX)
            expect(matrixSupport != undefined).assertTrue();
            try {
              let mode = mPhotoSession!.getExposureMeteringMode();
              console.error(`getExposureMeteringMode expected fail, but success, current mode: ${mode}`)
              expect().assertFail()
            } catch (err) {
              console.info(`getExposureMeteringMode error, code: ${err.code}, message: ${err.message}`)
              expect(err.code).assertEqual(camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            getCameraInput();
            expect().assertFail();
          }
          await releasePhotoSession();
          getCameraInput();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0300
     * @tc.desc   setExposureMeteringMode with errorcode 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_EXPOSURE_METERING_MODE_STATIC_0300';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            mCameraInput!.close();
            let matrixSupport = mPhotoSession!.isExposureMeteringModeSupported(camera.ExposureMeteringMode.MATRIX)
            expect(matrixSupport != undefined).assertTrue();
            try {
              mPhotoSession!.setExposureMeteringMode(camera.ExposureMeteringMode.MATRIX);
              console.error(`setExposureMeteringMode MATRIX expected fail, but success`)
              expect().assertFail()
            } catch (err) {
              console.info(`setExposureMeteringMode MATRIX error, code: ${err.code}, message: ${err.message}`)
              expect(err.code).assertEqual(camera.CameraErrorCode.OPERATION_NOT_ALLOWED)
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            getCameraInput();
            expect().assertFail();
          }
          await releasePhotoSession();
          getCameraInput();
          done();
        }
      })

  })
}