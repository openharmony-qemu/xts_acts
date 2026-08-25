/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  closeFd,
  driveFn,
  getFd,
  getPermission,
  isEmpty,
  resourceName,
  sleep
} from '../common';
import { media } from '@kit.MediaKit';

const TAG = 'ImageGetComponentTestSupp'
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mReceiverSurfaceId: string;
let mPhotoSession: camera.PhotoSession;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

let CameraVideoProfile: media.AVRecorderProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  audioSampleRate: 48000,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 2000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
};

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: CameraVideoProfile,
  url: 'file://',
  location: { latitude: 30, longitude: 130 } as camera.Location,
  rotation: 0
};

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
  console.info(TAG, 'mCameraManager created successfully.');
  return true;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray.length);
  return true;
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray.length) {
    mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
    if (isEmpty(mCameraInput)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
    if (mSupportedModes.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
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
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, mReceiverSurfaceId);
  mPhotoOutput = mCameraManager.createPhotoOutput(photoProfile);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

async function ImageGetComponent(done: Function, testName: string, callback: (receiver:image.ImageReceiver) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
    } else {
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
      console.info(TAG,testName,"get receiver SurfaceId success");
      callback(receiver);
      await sleep(1000);
      done();
    }
  } catch (error) {
    console.info(TAG ,testName, error.message, error.code);
    done();
  }
}

export default function ImageGetComponentSupp() {
  describe('ImageGetComponentSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty','')
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });
    beforeEach(async () => {
      await sleep(1000);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(1000)
    });
    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
      AppStorage.delete('empty')
    });

    /**
     * @tc.number     image_getComponent_AsyncCallback_001
     * @tc.name       image_getComponent_AsyncCallback_001
     * @tc.desc       Image.getComponent,ComponentType ComponentType.JPEG
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_001';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          receiver.on('imageArrival', async () => {
            try {
              console.info(TAG, testName, ' receiver.on begin');
              let img = await receiver.readNextImage();
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              img.getComponent(image.ComponentType.JPEG, (err: BusinessError, component: image.Component) => {
                if (err) {
                  console.error(TAG, testName, `Failed to get the component.code ${err.code},message is${err.message}`);
                  expect().assertFail();
                  done();
                } else {
                  console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                  expect(component.componentType).assertEqual(image.ComponentType.JPEG);
                  done();
                }
              });
            } catch (error) {
              console.error(TAG, testName, 'Unexpected error:', error.message, error.code);
              expect().assertFail();
              done();
            }
          });
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          await mPhotoSession.start();
          await sleep(2000);
          await releasePhotoSession();
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_AsyncCallback_002
     * @tc.name       image_getComponent_AsyncCallback_002
     * @tc.desc       Image.getComponent,ComponentType.YUV_Y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_002';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          receiver.on('imageArrival', async () => {
            try {
              console.info(TAG, testName, ' receiver.on begin');
              let img = await receiver.readNextImage();
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              img.getComponent(image.ComponentType.YUV_Y, (err: BusinessError, component: image.Component) => {
                if (err) {
                  console.error(TAG, testName, `Failed to get the component.code ${err.code},message is${err.message}`);
                  expect(Number(err.code)).assertEqual(1); 
                  done();
                } else {
                  console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                  expect(component.componentType).assertEqual(image.ComponentType.YUV_Y);
                  done();
                }
              });
            } catch (error) {
              console.error(TAG, testName, 'Unexpected error:', error.message, error.code);
              expect(Number(error.code)).assertEqual(1);
              done();
            }
          });
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          await mPhotoSession.start();
          await sleep(2000);
          await releasePhotoSession();
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });
         
    /**
     * @tc.number     image_getComponent_AsyncCallback_003
     * @tc.name       image_getComponent_AsyncCallback_003
     * @tc.desc       Image.getComponent,ComponentType ComponentType.YUV_U
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_003';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          receiver.on('imageArrival', async () => {
            try {
              console.info(TAG, testName, ' receiver.on begin');
              let img = await receiver.readNextImage();
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              img.getComponent(image.ComponentType.YUV_U, (err: BusinessError, component: image.Component) => {
                if (err) {
                  console.error(TAG, testName, `Failed to get the component.code ${err.code},message is${err.message}`);
                  expect(Number(err.code)).assertEqual(1);
                  done();
                } else {
                  console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                  expect(component.componentType).assertEqual(image.ComponentType.YUV_U);
                  done();
                }
              });
            } catch (error) {
              console.error(TAG, testName, 'Unexpected error:', error.message, error.code);
              expect(Number(error.code)).assertEqual(1);
              done();
            }
          });
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          await mPhotoSession.start();
          await sleep(2000);
          await releasePhotoSession();
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_AsyncCallback_004
     * @tc.name       image_getComponent_AsyncCallback_004
     * @tc.desc       Image.getComponent,ComponentType ComponentType.YUV_V
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_004';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          receiver.on('imageArrival', async () => {
            try {
              console.info(TAG, testName, ' receiver.on begin');
              let img = await receiver.readNextImage();
              console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
              img.getComponent(image.ComponentType.YUV_V, (err: BusinessError, component: image.Component) => {
                if (err) {
                  console.error(TAG, testName, `Failed to get the component.code ${err.code},message is${err.message}`);
                  expect(Number(err.code)).assertEqual(1);
                  done();
                } else {
                  console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                  expect(component.componentType).assertEqual(image.ComponentType.YUV_V);
                  done();
                }
              });
            } catch (error) {
              console.error(TAG, testName, 'Unexpected error:', error.message, error.code);
              expect(Number(error.code)).assertEqual(1);
              done();
            }
          });
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          await mPhotoSession.start();
          await sleep(2000);
          await releasePhotoSession();
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_AsyncCallback_005
     * @tc.name       image_getComponent_AsyncCallback_005
     * @tc.desc       Image.getComponent,return valve:img.format,img.clipRect,img.size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_005';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', async () => {
              try {
                let img = await receiver.readNextImage();
                console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.format);
                expect(img.format > 0).assertTrue();
                
                console.info(TAG, testName, 'image size:', img.size);
                expect(img.size.height > 0 && img.size.width > 0).assertTrue();
                
                console.info(TAG, testName, 'clipRect size:', img.clipRect.size);
                expect(img.clipRect.size.height > 0 && img.clipRect.size.width > 0).assertTrue();
                done();
              } catch (error) {
                console.error(TAG, testName, 'Image processing error:', error.message, error.code);
                expect().assertFail();
                done();
              }
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_AsyncCallback_006
     * @tc.name       image_getComponent_AsyncCallback_006
     * @tc.desc       Image.getComponent,return valve:img.clipRect.x,img.clipRect.y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_006';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', async () => {
              try {
                let img = await receiver.readNextImage();
                console.info(TAG, testName, 'receiver.readNextImage succeeded. ClipRect:', JSON.stringify(img.clipRect));
                expect(img.clipRect.x).assertEqual(0);
                expect(img.clipRect.y).assertEqual(0);
                done();
              } catch (error) {
                console.error(TAG, testName, 'Image processing error:', error.message, error.code);
                expect().assertFail();
                done();
              }
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_callback_return_valve_001
     * @tc.name       image_getComponent_callback_return_valve_001
     * @tc.desc       Image.getComponent,return valve:img.size,img.clipRect, img.format,img.timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_callback_return_valve_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_callback_return_valve_001';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', () => {
              receiver.readNextImage((err: BusinessError, img: image.Image) => {
                if (err) {
                  console.error(TAG, testName, `Failed to read image: code ${err.code}, message${err.message}`);
                  expect().assertFail();
                  done();
                  return;
                }
                try {
                  console.info(TAG, testName, 'Image properties:', {
                    clipRect: img.clipRect,
                    size: img.size,
                    format: img.format,
                    timestamp: img.timestamp
                  });
                  expect(img.clipRect.size.height > 0 && img.clipRect.size.width > 0).assertTrue();
                  expect(img.size.height > 0 && img.size.width > 0).assertTrue();
                  expect(img.format > 0).assertTrue();
                  expect(img.timestamp !== undefined).assertTrue();
                  done();
                } catch (assertError) {
                  console.error(TAG, testName, 'Assertion error:', assertError.message);
                  expect().assertFail();
                  done();
                }
              });
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_callback_return_valve_002
     * @tc.name       image_getComponent_callback_return_valve_002
     * @tc.desc       Image.getComponent,return valve:img.clipRect.x,img.clipRect.y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_callback_return_valve_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_callback_return_valve_002';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', () => {
              receiver.readNextImage((err: BusinessError, img: image.Image) => {
                if (err) {
                  console.error(TAG, testName, `Failed to read image: code ${err.code}, message${err.message}`);
                  expect().assertFail();
                  done();
                  return;
                }
                try {
                  console.info(TAG, testName, 'ClipRect properties:', img.clipRect);
                  expect(img.clipRect.x).assertEqual(0);
                  expect(img.clipRect.y).assertEqual(0);
                  done();
                } catch (assertError) {
                  console.error(TAG, testName, 'Assertion error:', assertError.message);
                  expect().assertFail();
                  done();
                }
              });
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_Promise_001
     * @tc.name       image_getComponent_Promise_001
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.JPEG
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_Promise_001';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', async () => {
              try {
                let img = await receiver.readNextImage();
                console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
                let component = await img.getComponent(image.ComponentType.JPEG);
                console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                expect(component.componentType).assertEqual(image.ComponentType.JPEG);
                done();
              } catch (error) {
                console.error(TAG, testName, 'Component get error:', error.message, error.code);
                expect().assertFail();
                done();
              }
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_Promise_002
     * @tc.name       image_getComponent_Promise_002
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.YUV_Y
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_Promise_002';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', async () => {
              try {
                let img = await receiver.readNextImage();
                console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
                let component = await img.getComponent(image.ComponentType.YUV_Y);
                console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                expect(component.componentType).assertEqual(image.ComponentType.YUV_Y);
                done();
              } catch (error) {
                console.error(TAG, testName, 'Component get error:', error.message, error.code);
                expect(Number(error.code)).assertEqual(1);
                done();
              }
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_Promise_003
     * @tc.name       image_getComponent_Promise_003
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.YUV_U
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_Promise_003';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', async () => {
              try {
                let img = await receiver.readNextImage();
                console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
                let component = await img.getComponent(image.ComponentType.YUV_U);
                console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                expect(component.componentType).assertEqual(image.ComponentType.YUV_U);
                done();
              } catch (error) {
                console.error(TAG, testName, 'Component get error:', error.message, error.code);
                expect(Number(error.code)).assertEqual(1);
                done();
              }
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_Promise_004
     * @tc.name       image_getComponent_Promise_004
     * @tc.desc       Image.getComponent,ComponentType：ComponentType.YUV_V
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_Promise_004';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', async () => {
              try {
                let img = await receiver.readNextImage();
                console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
                let component = await img.getComponent(image.ComponentType.YUV_V);
                console.info(TAG, testName, 'Succeeded in getting component.', component.componentType);
                expect(component.componentType).assertEqual(image.ComponentType.YUV_V);
                done();
              } catch (error) {
                console.error(TAG, testName, 'Component get error:', error.message, error.code);
                expect(Number(error.code)).assertEqual(1);
                done();
              }
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_Promise_005
     * @tc.name       image_getComponent_Promise_005
     * @tc.desc       Image.getComponent,return valve:img.timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_Promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_Promise_005';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', async () => {
              try {
                let img = await receiver.readNextImage();
                console.info(TAG, testName, 'receiver.readNextImage succeeded.', img.timestamp);
                expect(img.timestamp !== undefined).assertTrue();
                done();
              } catch (error) {
                console.error(TAG, testName, 'Image processing error:', error.message, error.code);
                expect().assertFail();
                done();
              }
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     image_getComponent_AsyncCallback_timestamp_Property_001
     * @tc.name       image_getComponent_AsyncCallback_timestamp_Property_001
     * @tc.desc       Image.getComponent,ComponentType,cover timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_getComponent_AsyncCallback_timestamp_Property_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_getComponent_AsyncCallback_timestamp_Property_001';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        ImageGetComponent(done, testName, async (receiver) => {
          try {
            receiver.on('imageArrival', () => {
              receiver.readNextImage((err: BusinessError, img: image.Image) => {
                if (err) {
                  console.error(TAG, testName, `Failed to read image: code ${err.code}, message${err.message}`);
                  expect().assertFail();
                  done();
                  return;
                }
                try {
                  console.info(TAG, testName, 'Image timestamp:', img.timestamp);
                  expect(img.timestamp >= 0).assertTrue();
                  done();
                } catch (assertError) {
                  console.error(TAG, testName, 'Assertion error:', assertError.message);
                  expect().assertFail();
                  done();
                }
              });
            });
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
            await mPhotoSession.start();
            await sleep(2000);
            await releasePhotoSession();
          } catch (error) {
            console.error(TAG, testName, 'Receiver setup error:', error.message, error.code);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, 'Test setup failed:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_GET_META_DATA_TEST_001
     * @tc.number IMAGE_GET_META_DATA_TEST_001
     * @tc.desc   getMetadata image.HdrMetadataKey.HDR_GAINMAP_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_GET_META_DATA_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_GET_META_DATA_TEST_001';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
        console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
        receiver.on('imageArrival', async () => {
          try {
            let img = await receiver.readNextImage();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            try {
              let value = img.getMetadata(image.HdrMetadataKey.HDR_GAINMAP_METADATA);
              console.info(TAG, testName, 'img.getMetadata succeeded.', value);
              // 验证获取到的元数据
              expect(value !== undefined).assertTrue();
            } catch (metaError) {
              console.error(TAG, testName, 'getMetadata error:', metaError.message, metaError.code);
              // 验证预期的错误码
              expect(Number(metaError.code)).assertEqual(7600302);
            }
            done();
          } catch (readError) {
            console.error(TAG, testName, 'readNextImage error:', readError.message, readError.code);
            expect().assertFail();
            done();
          }
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        await mPhotoSession.start();
        await sleep(2000);
        await releasePhotoSession();
      } catch (error) {
        console.error(TAG, testName, 'Test setup error:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_GET_BUFFER_DATA_SUPPORT_TEST_001
     * @tc.number IMAGE_GET_BUFFER_DATA_SUPPORT_TEST_001
     * @tc.desc   getBufferData  返回值属性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_GET_BUFFER_DATA_SUPPORT_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_GET_BUFFER_DATA_SUPPORT_TEST_001';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
        console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
        receiver.on('imageArrival', async () => {
          try {
            let img = await receiver.readNextImage();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            try {
              let bufferData = img.getBufferData();
              console.info(TAG, testName, 'img.getBufferData succeeded.', bufferData);
              expect(bufferData?.rowStride).not().assertUndefined();
              expect(bufferData?.pixelStride).not().assertUndefined();
              expect(bufferData?.byteBuffer).not().assertUndefined();
              done();
            } catch (bufferError) {
              console.error(TAG, testName, 'getBufferData error:', bufferError.message, bufferError.code);
              expect().assertFail();
              done();
            }
          } catch (readError) {
            console.error(TAG, testName, 'readNextImage error:', readError.message, readError.code);
            expect().assertFail();
            done();
          }
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        await mPhotoSession.start();
        await sleep(2000);
        await releasePhotoSession();
      } catch (error) {
        console.error(TAG, testName, 'Test setup error:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     IMAGE_GET_BUFFER_DATA_TEST_001
     * @tc.name       IMAGE_GET_BUFFER_DATA_TEST_001
     * @tc.desc       Image.getBufferData23 cover rowStride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('IMAGE_GET_BUFFER_DATA_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_GET_BUFFER_DATA_TEST_001';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
        console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
        receiver.on('imageArrival', async () => {
          try {
            let img = await receiver.readNextImage();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            try {
              let bufferData = img.getBufferData();
              console.info(TAG, testName, 'img.getBufferData succeeded.', bufferData);
              expect(bufferData!.rowStride.length > 0).assertTrue();
              done();
            } catch (bufferError) {
              console.error(TAG, testName, 'getBufferData error:', bufferError.message, bufferError.code);
              expect().assertFail();
              done();
            }
          } catch (readError) {
            console.error(TAG, testName, 'readNextImage error:', readError.message, readError.code);
            expect().assertFail();
            done();
          }
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        await mPhotoSession.start();
        await sleep(2000);
        await releasePhotoSession();
      } catch (error) {
        console.error(TAG, testName, 'Test setup error:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     IMAGE_GET_BUFFER_DATA_TEST_002
     * @tc.name       IMAGE_GET_BUFFER_DATA_TEST_002
     * @tc.desc       Image.getBufferData23 cover pixelStride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('IMAGE_GET_BUFFER_DATA_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_GET_BUFFER_DATA_TEST_002';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
        console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
        receiver.on('imageArrival', async () => {
          try {
            let img = await receiver.readNextImage();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            try {
              let bufferData = img.getBufferData();
              console.info(TAG, testName, 'img.getBufferData succeeded.', bufferData);
              expect(bufferData!.pixelStride.length > 0).assertTrue();
              done();
            } catch (bufferError) {
              console.error(TAG, testName, 'getBufferData error:', bufferError.message, bufferError.code);
              expect().assertFail();
              done();
            }
          } catch (readError) {
            console.error(TAG, testName, 'readNextImage error:', readError.message, readError.code);
            expect().assertFail();
            done();
          }
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        await mPhotoSession.start();
        await sleep(2000);
        await releasePhotoSession();
      } catch (error) {
        console.error(TAG, testName, 'Test setup error:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     IMAGE_GET_BUFFER_DATA_TEST_003
     * @tc.name       IMAGE_GET_BUFFER_DATA_TEST_003
     * @tc.desc       Image.getBufferData23 cover byteBuffer
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('IMAGE_GET_BUFFER_DATA_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_GET_BUFFER_DATA_TEST_003';
      if (isEmpty(mCameraDeviceArray)) {
        console.error(TAG, testName, 'mCameraDeviceArray is null.');
        done();
        return;
      }
      try {
        let size: image.Size = {
          height: 8192,
          width: 8
        };
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
        console.info(TAG, testName, "get receiver SurfaceId success", mReceiverSurfaceId);
        receiver.on('imageArrival', async () => {
          try {
            let img = await receiver.readNextImage();
            console.info(TAG, testName, 'receiver.readNextImage succeeded.', img);
            try {
              let bufferData = img.getBufferData();
              console.info(TAG, testName, 'img.getBufferData succeeded.', bufferData);
              expect(bufferData!.byteBuffer.byteLength > 0).assertTrue();
              done();
            } catch (bufferError) {
              console.error(TAG, testName, 'getBufferData error:', bufferError.message, bufferError.code);
              expect().assertFail();
              done();
            }
          } catch (readError) {
            console.error(TAG, testName, 'readNextImage error:', readError.message, readError.code);
            expect().assertFail();
            done();
          }
        });
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        await mPhotoSession.start();
        await sleep(2000);
        await releasePhotoSession();
      } catch (error) {
        console.error(TAG, testName, 'Test setup error:', error.message, error.code);
        expect().assertFail();
        done();
      }
    });

  })
}
