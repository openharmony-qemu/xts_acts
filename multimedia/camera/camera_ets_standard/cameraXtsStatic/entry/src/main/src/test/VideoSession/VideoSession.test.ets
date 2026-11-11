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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium,
  Size,
  TestType} from '@ohos/hypium-static/src/main/indexStatic';
import { camera } from '@kit.CameraKit';
import {
  COMMON_WAIT_DURATION, getFd, getPermission, resourceName, sleep
} from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import { Context } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import Utils from '../Util.test';

const TAG = "CameraXtsVideoSessionStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mFullCameraOutputCap: camera.CameraOutputCapability | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let photoAsset: photoAccessHelper.PhotoAsset | undefined;
let mVideoSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let mVideoSession: camera.VideoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
let mCaptureStartInfo: camera.CaptureStartInfo | undefined;
let mFrameShutterInfo: camera.FrameShutterInfo | undefined;
let mFrameShutterEndInfo: camera.FrameShutterEndInfo | undefined;
let mCaptureEndInfo: camera.CaptureEndInfo | undefined;
let EstimatedCaptureDuratio: number | undefined;
let mFocusState:camera.FocusState | undefined;
let mControlCenterStatusInfo:camera.ControlCenterEffectType|undefined;
let MacroStatus:boolean | undefined;
let mAutoDeviceSwitchStatus:camera.AutoDeviceSwitchStatus|undefined;
let mIsoInfo:camera.IsoInfo | undefined;
let fdNumber: number | undefined;
let fdPath: string | undefined;
let mCameraOutputCap: camera.CameraOutputCapability | undefined;
let testContext:  Context;
let indexSurfaceId : string = "";
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
  profile: CameraVideoProfile!,
  url: 'file://',
};

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
let isEmptyAVRecorder = (data: media.AVRecorder | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function getOutputCapability(): void {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], mSupportedModes![0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
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


function getCameraInput(): void {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    let cameras = mCameraManager!.getSupportedCameras();
    console.info(TAG, 'getSupportedCameras.',cameras);
    if (cameras) {
      mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    }else {
      console.info(TAG, 'cameras null.');
    }
  }else{
    console.info(TAG, 'getSupportedCameraDeviceArray null.');
  }
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


async function getVideoSurfaceId() {
  console.info(TAG, 'getVideoSurfaceId begin.');
  let fileName: string = resourceName();
  fdNumber = await getFd(fileName);
  fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath!;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmptyAVRecorder(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder!.state);
  mAVRecorder!.prepare(videoConfig).then(() => {
    console.info('prepare success');
  })
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder!.state);
  mVideoSurfaceId = await mAVRecorder!.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}


async function createVideoOutput() {
  await getVideoSurfaceId();
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_VIDEO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let videoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
    let foundProfile = cameraOutputCap.videoProfiles.find((indexVideoProfile: camera.Profile) => {
      console.log(TAG, 'find videoProfile: w: ' + indexVideoProfile.size.width + 'h: ' + indexVideoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexVideoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexVideoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      videoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'videoProfile: w: ' + videoProfile.size.width + 'h: ' + videoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  CameraVideoProfile!.videoFrameWidth = videoProfile.size.width;
  CameraVideoProfile!.videoFrameHeight = videoProfile.size.height;
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId);
  console.log(TAG, 'createVideoOutput' + videoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager!.createVideoOutput(videoProfile, mVideoSurfaceId!);
  console.log(TAG, 'create preview output' + mPreviewOutput, 'createVideoOutput', mVideoOutput);
}



async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
  mVideoSession!.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession!.addInput(mCameraInput!);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput!.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession!.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession!.addOutput(videoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession!.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
  await mVideoSession!.start();
  console.info(TAG, testName + ' session start successfully.');
}
let startCameraSession = async (): Promise<boolean> => {
  console.info(TAG + "Enter startCameraSession");
  await createVideoOutput();
  await Utils.msSleep(1000);

  mVideoSession!.beginConfig();

  if (mCameraInput != undefined) {
    console.info(TAG + "Start to addInput");
    mVideoSession!.addInput(mCameraInput!);
  }

  if (mPreviewOutput != undefined) {
    console.info(TAG + "Start to addOutput mPreviewOutput");
    mVideoSession!.addOutput(mPreviewOutput!);
  }

  if (mPhotoOutput != undefined) {
    console.info(TAG + "Start to addOutput mPhotoOutput");
    mVideoSession!.addOutput(mVideoOutput!);
  }

  await Utils.msSleep(300);

  await mVideoSession!.commitConfig();
  console.info(TAG + "commitConfig end");
  await Utils.msSleep(50);

  await mVideoSession!.start();

  await Utils.msSleep(100);
  console.info(TAG + "Exit startCameraSession");

  return true;
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder!.release();
  await mPreviewOutput!.release();
  await mVideoOutput!.release();
  await mVideoSession!.release();
}
let defaultSize: int = 2;

function getFullOutputCapability(): void {
  console.info(TAG, 'getFullOutputCapability.');
  mFullCameraOutputCap = mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera, full output cap: ' + JSON.stringify(mFullCameraOutputCap));
}
let createCameraSessionInstance = () => {
  console.info('Enter createCameraSessionInstance');

  try {
    mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
  } catch (err) {
    console.info('createPhotoSession FAILED');
  }
  console.info('Exit createCameraSessionInstance');
  return true;
}
async function CameraPreconfigVideo(done: () => void, testName: string, callback: () => void) {
  if (isEmptyCameraDevice(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
    return;
  } else {
    await createVideoOutput();
    await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
    callback();
    await releaseVideoSession();
    done();
  }
}

export default function VideoSessionStaticTest():void {
  describe('VideoSessionStaticTest', () => {
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
      await sleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name  SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100
     * @tc.desc   onSystemPressureLevelChange success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            console.info(TAG,
              testName + ' succeed to createVideoOutput.');
            await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
            console.info(TAG,
              testName + ' succeed to getCreateVideoSession.');
            mVideoSession!.onSystemPressureLevelChange((error: BusinessError | null,
              pressureState: camera.SystemPressureLevel | undefined) => {
              if (error !== undefined && error!.code !== 0) {
                expect().assertFail();
                done();
              } else {
                expect(pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_NORMAL ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_MILD ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_SEVERE ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_CRITICAL ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_SHUTDOWN
                ).assertTrue();
                mVideoSession!.offSystemPressureLevelChange()
                }
            })
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releaseVideoSession();
          done();
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_OFF_ERROR_LISTEN_VIDEO_SESSION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_OFF_ERROR_LISTEN_VIDEO_SESSION_STATIC_0100
     * @tc.desc   No abnormal scenarios-listen off error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_OFF_ERROR_LISTEN_VIDEO_SESSION_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_OFF_ERROR_LISTEN_VIDEO_SESSION_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          let count = 0;
          mVideoSession!.onError((err: BusinessError) => {
            console.error(`Camera input error code: `,err);
            count = 1;
          })
          console.info(TAG, testName, "Entering start");
          if (mVideoSession!.isAutoDeviceSwitchSupported()) {
            mVideoSession!.offError();
            mVideoSession!.enableAutoDeviceSwitch(true);
            await Utils.msSleep(500);
            expect(count).assertEqual(0);
            console.info(TAG, testName, "Entering start PASSED");
          } else {
            console.info(TAG, testName, "当前设备不支持此功能");
            mVideoSession!.offError();
          }
          await releaseVideoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100
     * @tc.desc   onSmoothZoomInfoAvailable success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
            let supportedZoomRatioRange: Array<number> = mVideoSession!.getZoomRatioRange();
            console.info(TAG +
              "SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 supportedZoomRatioRange.length: " +
            supportedZoomRatioRange.length);
            let callbackFlag: boolean = false;
            if (supportedZoomRatioRange.length == defaultSize) {
              mVideoSession!.onSmoothZoomInfoAvailable(
                (err: BusinessError | null, smoothZoomInfo: camera.SmoothZoomInfo | undefined): void => {
                  if (!err || err.code == 0) {
                    console.info(TAG + testName + "Entering on smoothZoomInfoAvailable success");
                    callbackFlag = true;
                    expect(smoothZoomInfo!.duration>0).assertTrue();
                    mVideoSession!.offSmoothZoomInfoAvailable();
                    done();
                  } else {
                    console.info(TAG + testName + "Error in FAILED on smoothZoomInfoAvailable: " +
                    err.message);
                    expect().assertFail();
                    done();
                  }
                })
              // mVideoSession!.offSmoothZoomInfoAvailable((err: BusinessError | null, smoothZoomInfo: camera.SmoothZoomInfo | undefined): void => {
              //   if (!err || err.code == 0) {
              //     console.info(TAG + testName + "Entering on smoothZoomInfoAvailable success");
              //     callbackFlag = true;
              //     done();
              //   } else {
              //     console.info(TAG + testName + "Error in FAILED on smoothZoomInfoAvailable: " +
              //     err.message);
              //     expect().assertFail();
              //     done();
              //   }
              // });
              if (mVideoSession!.isAutoDeviceSwitchSupported()) {
                mVideoSession!.setZoomRatio((supportedZoomRatioRange[0] + 0.1) as number);
                await Utils.msSleep(100);
                console.info(TAG + testName + "Entering setZoomRatio: " + (supportedZoomRatioRange[0] + 0.1));
                mVideoSession!.setSmoothZoom((supportedZoomRatioRange[0] - 0.1) as number,
                  camera.SmoothZoomMode.NORMAL);
                console.info(TAG + testName + "Entering  targetZoomRatio: " +
                  (supportedZoomRatioRange[0] - 0.1));
                await Utils.msSleep(2000);
                let zoomRatio: number = mVideoSession!.getZoomRatio();
                if ((zoomRatio - supportedZoomRatioRange[0]) < 0.01) {
                  console.info(TAG + testName + "Entering  PASSED with ZoomRatio is: " + zoomRatio);
                } else {
                  console.info(TAG + testName + "Entering  FAILED with ZoomRatio is: " + zoomRatio);
                  expect().assertFail();
                }
              }else {
                console.info(TAG + testName + "该设备不支持" );
              }
            }
            let callbackTimeOut: int = 0; // 5 seconds
            while (!callbackFlag && callbackTimeOut < 5000) {
              await Utils.msSleep(100);
              callbackTimeOut += 100;
              console.info(TAG + "Waiting for smoothZoomInfoAvailable callback, timeout:1000, now time: " +
                callbackTimeOut);
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          } finally {
            await releaseVideoSession();
            done();
          }
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_on_FocusStateChange_static_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_on_FocusStateChange_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTESTs
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_on_FocusStateChange_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_on_FocusStateChange_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          mVideoSession?.onFocusStateChange((error, mFocusState) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen onFocusStateChange on, photoAsset: ' +
                JSON.stringify(mFocusState));
              expect(mFocusState == null).assertFalse();
              mVideoSession?.offFocusStateChange();
            }
          });
          if (mVideoSession!.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO)) {
            mVideoSession!.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO);
            let result = mVideoSession!.getExposureMode();
            console.info(TAG, testName, "Entering start PASSED", result);
          }
          await releaseVideoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0100
     * @tc.desc   canPreconfig PRECONFIG_HIGH_QUALITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0100';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
              camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0200
     * @tc.desc   canPreconfig PRECONFIG_720P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0200';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
              camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name  SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0300
     * @tc.desc   canPreconfig PRECONFIG_1080P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0300';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
              camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0400
     * @tc.desc   canPreconfig PRECONFIG_1080P + PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0400';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
                camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0500
     * @tc.desc   canPreconfig PRECONFIG_1080P + PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0500', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0500';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
              camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0600
     * @tc.desc   canPreconfig PRECONFIG_1080P + PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0600', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0600';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
                camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0700
     * @tc.desc   canPreconfig PRECONFIG_720P + PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0700', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0700';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
                camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0800
     * @tc.desc   canPreconfig PRECONFIG_720P + PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0800', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0800';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
                camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0900
     * @tc.desc   canPreconfig PRECONFIG_720P + PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0900', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_0900';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
                camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1000
     * @tc.desc   canPreconfig PRECONFIG_4K + PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1000', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1000';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1100
     * @tc.desc   canPreconfig PRECONFIG_4K + PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1100';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K,
                camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1200
     * @tc.desc   canPreconfig PRECONFIG_4K + PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1200';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1300
     * @tc.desc   canPreconfig PRECONFIG_HIGH_QUALITY + PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1300';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
              camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1400
     * @tc.desc   canPreconfig PRECONFIG_HIGH_QUALITY + PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1400';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
              camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1500
     * @tc.desc   canPreconfig PRECONFIG_HIGH_QUALITY + PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1500', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1500';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
              camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1600
     * @tc.desc   canPreconfig PRECONFIG_4K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1600', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_PRECONFIG_STATIC_1600';
        CameraPreconfigVideo(done, testName, () => {
          try {
            let result =
              mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
            console.info(TAG, testName, `canPreconfig result is : ${result}`);
            expect(result == null).assertFalse();
          } catch (error) {
            console.info(TAG, testName, error.message, error.code);
            expect().assertFalse();
            done();
          }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0100
         * @tc.desc   canPreconfig PRECONFIG_HIGH_QUALITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0100', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0100';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession?.preconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                    camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })
        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0200
         * @tc.desc   preconfig PRECONFIG_720P
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0200', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0200';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_720P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0300
         * @tc.desc   preconfig PRECONFIG_1080P
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0300', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0300';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_1080P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0400
         * @tc.desc   preconfig PRECONFIG_1080P + PRECONFIG_RATIO_4_3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0400', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0400';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_1080P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0500
         * @tc.desc   preconfig PRECONFIG_1080P + PRECONFIG_RATIO_16_9
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0500', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0500';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_1080P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0600
         * @tc.desc   preconfig PRECONFIG_1080P + PRECONFIG_RATIO_1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0600', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0600';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_1080P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0700
         * @tc.desc   preconfig PRECONFIG_720P + PRECONFIG_RATIO_4_3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0700', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0700';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_720P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0800
         * @tc.desc   preconfig PRECONFIG_720P + PRECONFIG_RATIO_16_9
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0800', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0800';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_720P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0900
         * @tc.desc   preconfig PRECONFIG_720P + PRECONFIG_RATIO_1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0900', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_0900';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                if(result) {
                  console.info(TAG, testName, `canPreconfig result is : ${result}`);
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_720P,
                    camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1000
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1000
         * @tc.desc   preconfig PRECONFIG_4K + PRECONFIG_RATIO_4_3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1000', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1000';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K,
                  camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1100
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1100
         * @tc.desc   preconfig PRECONFIG_4K + PRECONFIG_RATIO_16_9
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1100', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1100';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K,
                  camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1200
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1200
         * @tc.desc   preconfig PRECONFIG_4K + PRECONFIG_RATIO_1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1200', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1200';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1300
         * @tc.desc   preconfig PRECONFIG_HIGH_QUALITY + PRECONFIG_RATIO_4_3
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1300', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1300';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                  camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                    camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1400
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1400
         * @tc.desc   preconfig PRECONFIG_HIGH_QUALITY + PRECONFIG_RATIO_16_9
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1400', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1400';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                  camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                    camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1500
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1500
         * @tc.desc   preconfig PRECONFIG_HIGH_QUALITY + PRECONFIG_RATIO_1_1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1500', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1500';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
                    camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1600
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1600
         * @tc.desc   preconfig PRECONFIG_4K
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1600', Level.LEVEL0,
          async (done: () => void): Promise<void> => {
            const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_PRECONFIG_STATIC_1600';
            CameraPreconfigVideo(done, testName, () => {
              try {
                let result = mVideoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K,
                  camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                console.info(TAG, testName, `canPreconfig result is : ${result}`);
                if(result) {
                  mVideoSession!.preconfig(camera.PreconfigType.PRECONFIG_4K,
                    camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
                  expect(result == null).assertFalse();
                }else{
                  console.info(TAG, testName, `该设备不支持该预配置`);
                }
              } catch (error) {
                console.info(TAG, testName, error.message, error.code);
                expect().assertFalse();
                done();
              }
            })
          })
      })
  })
}