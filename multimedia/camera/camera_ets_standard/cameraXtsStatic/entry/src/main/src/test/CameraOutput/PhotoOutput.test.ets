'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../hypium/index';
import { camera } from '@kit.CameraKit';
import { getPermission, sleep, isEmpty } from '../Common.test';
import { Context } from '@ohos.arkui.UIContext'
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

const TAG = "CameraXts.PhotoOutputTest";
const InvalidParam: int = -1;

const captureLocation: camera.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0
};
const InvalidLocation: camera.Location = {
  latitude: InvalidParam,
  longitude: InvalidParam,
  altitude: InvalidParam
};
const NewCaptureLocation: camera.Location = {
  latitude: 99999,
  longitude: 99999,
  altitude: 99999
};

let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mCameraOutputCap: camera.CameraOutputCapability | undefined;
let mFullCameraOutputCap: camera.CameraOutputCapability | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
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

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  testContext = Hypium.get("Context") as Context;
  indexSurfaceId = Hypium.get('SurfaceId') as string;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmptyCameraManager(mCameraManager)) {
    return false;
  }
  console.info(TAG, 'mCameraManager created successfully.');
  return true;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmptyCameraDevice(mCameraDeviceArray!)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
  if (isEmptyCameraInput(mCameraInput!)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

function getSupportedModes() {
  console.info(TAG, 'getSupportedModes.');
  for (let i: int = 0; i < mCameraDeviceArray!.length; i++) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(mCameraDeviceArray![i]);
    if (mSupportedModes!.length > 0) {
      return false;
    }
    console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes!));
  }
  return true;
}

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], mSupportedModes![0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap!));
}

function getFullOutputCapability() {
  console.info(TAG, 'getFullOutputCapability.');
  mFullCameraOutputCap = mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera, full output cap: ' + JSON.stringify(mFullCameraOutputCap!));
}

async function getPhotoSession(testName: string, previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(mSupportedModes![0]);
  console.info(TAG, testName + ' createSession passed.');
  mPhotoSession!.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession!.addInput(mCameraInput!);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput!.open();
  console.info(TAG, testName + ' open passed.');
  mPhotoSession!.addOutput(previewOutput!);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession!.addOutput(photoOutput!);
  console.info(TAG, testName + ' addOutput photoOutput passed.');
  await mPhotoSession!.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
  await mPhotoSession!.start();
  console.info(TAG, testName + ' start passed.');
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

export default function PhotoOutputTest(): void {
  describe('PhotoOutputTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      getOutputCapability();
      getFullOutputCapability();
      getCameraInput();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0100
     * @tc.desc   No abnormal scenarios-capture-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture((error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
          console.info(TAG, testName + ' release session.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0200
     * @tc.desc   No abnormal scenarios-capture-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0200';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture().then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch((error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect().assertFail();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
          console.info(TAG, testName + ' release session.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0300
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0300';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0400
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0400';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0500
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0500';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0600
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0600';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_90,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0700
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0700';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_180,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0800
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0800';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_270,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0900
     * @tc.desc   No abnormal scenarios-location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_0900';
      let settings: camera.PhotoCaptureSetting = {
        location: NewCaptureLocation,
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1000
     * @tc.desc   No abnormal scenarios-mirror-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1000';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        mirror: true
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1100
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1100';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1200
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1200';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1300
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1300';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1400
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1400';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_90,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1500
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1500';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_180,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1600
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1600';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_270,
        location: captureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1700
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1700';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: NewCaptureLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1800
     * @tc.desc   No abnormal scenarios-mirror-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1800';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: true
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1900
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_1900';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isCapture: boolean = false;
          mPhotoOutput!.onPhotoAvailable((error, photo) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable on, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              let mainImage: image.Image = photo!.main;
              console.info(TAG, testName + ' succeed to listen photoAvailable on.');
              expect(isEmpty(mainImage)).assertFalse();
              isCapture = true
            }
          });
          mPhotoOutput!.capture();
          const maxRetry: int = 50;
          const interval: int = 200;
          for (let i: int = 0; i < maxRetry; i++) {
            await sleep(interval);
            if (isCapture) {
              console.info(TAG, `${testName} succeed to listen photoAvailable on.`);
              break;
            }
            if (i === maxRetry - 1) {
              console.error(TAG, `${testName} failed to listen photoAvailable on.`);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2000
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2000';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isCapture: boolean = false;
          mPhotoOutput!.onPhotoAvailable((error, photo) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable on, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              let mainImage: image.Image = photo!.main;
              console.info(TAG, testName + ' succeed to listen photoAvailable on.');
              expect(isEmpty(mainImage)).assertFalse();
              isCapture = true
            }
          });
          mPhotoOutput!.capture();
          const maxRetry: int = 50;
          const interval: int = 200;
          for (let i: int = 0; i < maxRetry; i++) {
            await sleep(interval);
            if (isCapture) {
              console.info(TAG, `${testName} succeed to listen photoAvailable on.`);
              break;
            }
            if (i === maxRetry - 1) {
              console.error(TAG, `${testName} failed to listen photoAvailable on.`);
              expect().assertFail();
            }
          }
          mPhotoOutput!.offPhotoAvailable((error: BusinessError | null, photo: camera.Photo | undefined) => {
            if (error !== undefined && error !== null && error!.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable off, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              let mainImage: image.Image = photo!.main;
              console.info(TAG, testName + ' succeed to listen photoAvailable off.');
              expect(isEmpty(mainImage)).assertFalse();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.onPhotoAssetAvailable((error: BusinessError | null,
            photoAsset: photoAccessHelper.PhotoAsset | undefined) => {
            if ((error !== undefined && error!.code !== 0) || photoAsset === undefined) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable on, err: ' + error!.code + ', msg: ' + error!.message);
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAvailable on, photoAsset: ' + JSON.stringify(photoAsset));
              expect(isEmpty(photoAsset)).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2200
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2200';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.onPhotoAssetAvailable((error: BusinessError | null,
            photoAsset: photoAccessHelper.PhotoAsset | undefined) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAssetAvailable on, err: ' + error!.code + ', msg: ' +
                error!.message);
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAssetAvailable on, photoAsset: ' + JSON.stringify(photoAsset));
              expect(isEmpty(photoAsset)).assertFalse();
            }
          });
          mPhotoOutput!.offPhotoAvailable((error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAssetAvailable off, err: ' + error!.code + ', msg: ' +
                error!.message);
              expect().assertFail();
              done();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAssetAvailable off.');

              done();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2300
     * @tc.desc   No abnormal scenarios-release-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2300';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          console.info(TAG, testName + ' getPhotoSession passed.');
          await mPreviewOutput!.release();
          mPhotoOutput!.release((error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG,
                testName + ' failed to release photoOutput, err: ' + error!.code + ', msg: ' + error!.message);
              expect(error!.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            } else {
              console.info(TAG, testName + ' release passed.');

            }
          });
          await mPhotoSession!.release();
          console.info(TAG, testName + ' end.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2400
     * @tc.desc   No abnormal scenarios-release-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_2400';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          console.info(TAG, testName + ' getPhotoSession passed.');
          await mPreviewOutput!.release();
          mPhotoOutput!.release().then(() => {
            console.info(TAG, testName + ' release passed.');
          }).catch((error: Error) => {
            console.error(TAG,
              testName + ' failed to release photoOutput, err: ' + error!.code + ', msg: ' + error!.message);
            expect().assertFail();
          });
          await mPhotoSession!.release();
          console.info(TAG, testName + ' end.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3300
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3300
     * @tc.desc   promise, settings location-abnormal -> passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3300';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: InvalidLocation,
        mirror: false
      };
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3500
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3500
     * @tc.desc   No session, only capture-callback -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3500';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          await mCameraInput!.open();
          console.info(TAG, testName + ' open passed.');
          mPhotoOutput!.capture((error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect(error!.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput!.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3600
     * @tc.desc   No session, only capture-promise -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3600';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          await mCameraInput!.open();
          mPhotoOutput!.capture().then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput!.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' capture failed. err: ' + error!.code + ', msg: ' + error!.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3700
     * @tc.desc   No session, only capture with settings-callback -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3700';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          await mCameraInput!.open();
          console.info(TAG, testName + ' open passed.');
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
            rotation: camera.ImageRotation.ROTATION_0
          }
          mPhotoOutput!.capture(settings, (error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
              expect(error!.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            } else {
              console.info(TAG, testName + ' capture passed.');
            }
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput!.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3800
     * @tc.desc   No session, only capture with settings-promise -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3800';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          await mCameraInput!.open();
          console.info(TAG, testName + ' open passed.');
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
            rotation: camera.ImageRotation.ROTATION_0
          }
          mPhotoOutput!.capture(settings).then(() => {
            console.info(TAG, testName + ' capture passed.');
          }).catch(async (error: Error) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
            expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput!.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3900
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_3900';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let targetProfile = mFullCameraOutputCap!.photoProfiles![0];
          for (let i: int = 0; i < mFullCameraOutputCap!.photoProfiles.length; i++) {
            if (mFullCameraOutputCap!.photoProfiles![i].format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
              targetProfile = mFullCameraOutputCap!.photoProfiles![i];
              break;
            }
          }
          console.info(TAG, 'yuv test, photo profile: ' + JSON.stringify(targetProfile));
          mPhotoOutput = mCameraManager!.createPhotoOutput(targetProfile);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.onCapturePhotoAvailable((CapturePhoto: camera.CapturePhoto) => {
            if (!CapturePhoto || !CapturePhoto.main) {
              console.error(TAG, testName + ' received invalid CapturePhoto or missing main image');
              expect().assertFail();
              return;
            }
            let mainImage: image.Image | image.Picture = CapturePhoto.main;
            console.info(TAG, testName + ' succeed to listen photoAvailable on.');
            expect(isEmpty(mainImage)).assertFalse();
            CapturePhoto.release();
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4000
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4000';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let targetProfile = mFullCameraOutputCap!.photoProfiles![0];
          for (let i: int = 0; i < mFullCameraOutputCap!.photoProfiles.length; i++) {
            if (mFullCameraOutputCap!.photoProfiles![i].format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
              targetProfile = mFullCameraOutputCap!.photoProfiles![i];
              break;
            }
          }
          console.info(TAG, 'yuv test, photo profile: ' + JSON.stringify(targetProfile));
          mPhotoOutput = mCameraManager!.createPhotoOutput(targetProfile);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.onCapturePhotoAvailable((CapturePhoto: camera.CapturePhoto) => {
            if (!CapturePhoto || !CapturePhoto.main) {
              console.error(TAG, testName + ' received invalid CapturePhoto or missing main image');
              expect().assertFail();
              return;
            }
            let mainImage: image.Image | image.Picture = CapturePhoto.main;
            console.info(TAG, testName + ' succeed to listen photoAvailable on.');
            expect(isEmpty(mainImage)).assertFalse();
            CapturePhoto.release();
          });
          await mPhotoOutput!.capture();
          mPhotoOutput!.offCapturePhotoAvailable();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4100
     * @tc.desc   isC2PASignatureSupported returns boolean in normal session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let result: boolean = mPhotoOutput!.isC2PASignatureSupported();
          console.info(TAG, testName + ' isC2PASignatureSupported result: ' + result);
          expect(result === true || result === false).assertTrue();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4200
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4200
     * @tc.desc   configureC2PASignature enable=true with full config (authorID + authorName).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4200';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isSupported: boolean = mPhotoOutput!.isC2PASignatureSupported();
          console.info(TAG, testName + ' isC2PASignatureSupported: ' + isSupported);
          let c2paConfig: camera.C2PASignatureConfig = {
            authorID: 'testAuthorID',
            authorName: 'testAuthorName'
          };
          if (isSupported) {
            mPhotoOutput!.configureC2PASignature(true, c2paConfig);
            console.info(TAG, testName + ' configureC2PASignature with full config success.');
          } else {
            console.info(TAG, testName + ' C2PA signature not supported, skip configure.');
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4300
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4300
     * @tc.desc   configureC2PASignature enable=false without config parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4300';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isSupported: boolean = mPhotoOutput!.isC2PASignatureSupported();
          console.info(TAG, testName + ' isC2PASignatureSupported: ' + isSupported);
          if (isSupported) {
            mPhotoOutput!.configureC2PASignature(false);
            console.info(TAG, testName + ' configureC2PASignature disable without config success.');
          } else {
            console.info(TAG, testName + ' C2PA signature not supported, skip configure.');
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4400
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4400
     * @tc.desc   configureC2PASignature enable=true with config containing only authorID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4400';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isSupported: boolean = mPhotoOutput!.isC2PASignatureSupported();
          console.info(TAG, testName + ' isC2PASignatureSupported: ' + isSupported);
          let c2paConfig: camera.C2PASignatureConfig = {
            authorID: 'testAuthorIDOnly'
          };
          if (isSupported) {
            mPhotoOutput!.configureC2PASignature(true, c2paConfig);
            console.info(TAG, testName + ' configureC2PASignature with authorID only success.');
          } else {
            console.info(TAG, testName + ' C2PA signature not supported, skip configure.');
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4500
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4500
     * @tc.desc   configureC2PASignature enable=true with config containing only authorName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4500';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isSupported: boolean = mPhotoOutput!.isC2PASignatureSupported();
          console.info(TAG, testName + ' isC2PASignatureSupported: ' + isSupported);
          let c2paConfig: camera.C2PASignatureConfig = {
            authorName: 'testAuthorNameOnly'
          };
          if (isSupported) {
            mPhotoOutput!.configureC2PASignature(true, c2paConfig);
            console.info(TAG, testName + ' configureC2PASignature with authorName only success.');
          } else {
            console.info(TAG, testName + ' C2PA signature not supported, skip configure.');
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4600
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4600
     * @tc.desc   configureC2PASignature enable=true with empty config object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4600';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isSupported: boolean = mPhotoOutput!.isC2PASignatureSupported();
          console.info(TAG, testName + ' isC2PASignatureSupported: ' + isSupported);
          let c2paConfig: camera.C2PASignatureConfig = {};
          if (isSupported) {
            mPhotoOutput!.configureC2PASignature(true, c2paConfig);
            console.info(TAG, testName + ' configureC2PASignature with empty config success.');
          } else {
            console.info(TAG, testName + ' C2PA signature not supported, skip configure.');
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4700
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4700
     * @tc.desc   configureC2PASignature repeated call: enable then disable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4700';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPreviewOutput = mCameraManager!.createPreviewOutput(mCameraOutputCap!.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput!, mPhotoOutput!);
          let isSupported: boolean = mPhotoOutput!.isC2PASignatureSupported();
          console.info(TAG, testName + ' isC2PASignatureSupported: ' + isSupported);
          let c2paConfig: camera.C2PASignatureConfig = {
            authorID: 'repeatTestID',
            authorName: 'repeatTestName'
          };
          if (isSupported) {
            mPhotoOutput!.configureC2PASignature(true, c2paConfig);
            console.info(TAG, testName + ' first configureC2PASignature enable success.');
            mPhotoOutput!.configureC2PASignature(false);
            console.info(TAG, testName + ' second configureC2PASignature disable success.');
          } else {
            console.info(TAG, testName + ' C2PA signature not supported, skip configure.');
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4800
     * @tc.number SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4800
     * @tc.desc   configureC2PASignature without session, expect error code 7400113 or 7400116 or 7400201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_OUTPUT_PHOTO_STATIC_4800';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager!.createPhotoOutput(mCameraOutputCap!.photoProfiles![0]);
          mPhotoOutput!.configureC2PASignature(true);
          console.info(TAG, testName + ' configureC2PASignature without session should throw error.');
          expect().assertFail();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        let errCode: number = error.code;
        expect(errCode === 7400103 || errCode === 7400113 || errCode === 7400116 || errCode === 7400201).assertTrue();
        done();
      }
    })
  })
}