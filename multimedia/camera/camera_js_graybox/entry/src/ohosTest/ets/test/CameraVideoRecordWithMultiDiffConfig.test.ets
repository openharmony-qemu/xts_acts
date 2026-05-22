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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import {
  getPermission,
  sleep,
  isHdrVideo,
  setVideoColorSpace,
  getSupportedVideoStabilizationMode,
  setVideoStabilizationMode,
  expectEqualPhotoCount,
  getHelper,
  getAllPhotoAssetsCount,
  getCameraManager,
  getSupportedCameras,
  getCameraOutputCapability,
  setZoomRatioRange,
  getSuppotredZoomRatioRange,
  createAvRecorder,
  getVideoOutput,
  createAndConfigSession,
  createCameraInput,
  openCamera,
  createVideoPreviewOutputFromProFile,
  addInputIntoSession,
  addOutputIntoSession,
  commitSessionConfig,
  startSession,
  startVideoOutput,
  startAvRecoder,
  onPreviewOutputFrameStart,
  offPreviewOutputFrameStart,
  stopVideoOutput,
  stopAvRecoder,
  stopSession,
  releaseInPutStream,
  releaseOutPutStream,
  releaseSession,
  releaseAvRecoder,
  createVideoFile,
  setAvRecorderConfig,
  saveAsset,
  getActiveVideoStabilizationMode,
  getPhotoAssetsWithKeyFromFileNames,
  generateNameForAsset,
  getVideoRotation
} from './CameraCommonAPI';

import {
  setFocusMode, getSuppotredFrameRateRange,
} from './CameraCommonAPI'
import { media } from '@kit.MediaKit';
import { BusinessError } from '@kit.BasicServicesKit';

const MULTI_CONFIG_DIAG_TAG = '[CAMERA_MULTI_CONFIG_DIAG]';

function formatVideoError(error: ESObject): string {
  let err = error as BusinessError;
  return `code is ${err.code}, message is ${err.message}, error is ${JSON.stringify(error)}`;
}

export default function CameraVideoRecordWithMultiDiffConfig() {
  describe('CameraVideoRecordWithMultiDiffConfig', () => {
    console.info('----------CameraVideoRecordWithMultiDiffConfig begin--------------')
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission()
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(1000);
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0100
     * @tc.name      : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0100
     * @tc.desc      : camera recorde HDR 1 video and Test HDR info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let testNum = 'SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0100'
        //预制条件
        await getPermission();
        let helper = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        if (cameras.length <= 0) {
          console.error(`${testNum} cameras length is ${cameras.length}, cameraIndex is 0`)
          await helper.release();
          expect(true).assertFail();
          done();
          return;
        }
        let camreId = cameras[0];
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_VIDEO);
        for (let videoProfile of cameraOutputCapability?.videoProfiles!) {
          for (let previewProfile of cameraOutputCapability?.previewProfiles!) {
            if (previewProfile.size.height != videoProfile.size.height
              || previewProfile.size.width != videoProfile.size.width
              || previewProfile.format != videoProfile.format) {
              continue;
            }
            let frameRateRange = getSuppotredFrameRateRange(videoProfile);
            for (let frameRate of frameRateRange) {
              const befortCount = await getAllPhotoAssetsCount();
              let videoOutput: camera.VideoOutput | undefined = undefined
              let cameraInput: camera.CameraInput | undefined = undefined
              let previewOutPut: camera.PreviewOutput | undefined = undefined
              let session: ESObject = undefined
              let avRecoder: media.AVRecorder | undefined = undefined
              try {
                console.info(`${testNum} videoProfile frameRateRange is ${videoProfile.frameRateRange} videoProfile
                format is ${videoProfile.format} videoProfile size is ${videoProfile.size}`);
                console.info(`${testNum} previewProfile format is ${previewProfile.format} previewProfile
                size is ${previewProfile.size} `);
                console.info(`${testNum} camrePosition is ${camreId.cameraPosition} camreType
                is ${camreId.connectionType}`);
                // 创建空的视频文件
                let videoName =
                  await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, camreId, videoProfile, previewProfile)
                let videoUri: string = `file://${getContext().filesDir}/${videoName}.mp4`; // 本地沙箱路径。
                let file: fs.File = await createVideoFile(videoUri)
                avRecoder = await createAvRecorder();
                await setAvRecorderConfig(avRecoder, file, videoProfile, frameRate);
                // 创建VideoOutput对象。
                videoOutput = await getVideoOutput(cameraManager, avRecoder, videoProfile);
                session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
                cameraInput = createCameraInput(cameraManager, camreId);
                previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);
                await openCamera(cameraInput);
                await addInputIntoSession(session, cameraInput);
                await addOutputIntoSession(session, previewOutPut);
                await addOutputIntoSession(session, videoOutput);

                // 设置色彩空间
                setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
                  videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)

                await commitSessionConfig(session);
                // 更新视频旋转角度
                let rotation = await getVideoRotation(videoOutput)
                console.info(`videoRotation: ${rotation}`)
                avRecoder.updateRotation(rotation)
                let videoStabilizationModes = getSupportedVideoStabilizationMode(session);
                // 遍历防抖模式
                for (let vsMode of videoStabilizationModes) {
                  if (videoStabilizationModes.length > 0 && vsMode != camera.VideoStabilizationMode.OFF) {
                    console.info("set vsMode: " + vsMode)
                    setVideoStabilizationMode(session, vsMode)
                    let activeMode = getActiveVideoStabilizationMode(session)
                    console.info("get vsMode: " + activeMode)
                  }
                }
                await startSession(session);
                startVideoOutput(videoOutput);
                setFocusMode(session);
                await onPreviewOutputFrameStart(previewOutPut!);
                let zoomRatioRange = getSuppotredZoomRatioRange(session);
                await startAvRecoder(avRecoder);
                if (zoomRatioRange != undefined) {
                  for (let zoomRatio of zoomRatioRange!) {
                    console.info('Profile is zoomRatio is ' + zoomRatio)
                    setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
                    await sleep(2000);
                  }
                } else {
                  await sleep(3000);
                }
                stopVideoOutput(videoOutput);
                await stopAvRecoder(avRecoder, file);
                await releaseAvRecoder(avRecoder);

                //测试过程
                // 检查录制的资产
                let asset = await saveAsset(helper, videoUri, getContext())
                await sleep(5000)
                if (videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 ||
                  videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010) {
                  let assets = await getPhotoAssetsWithKeyFromFileNames(helper, [asset!.displayName]);
                  asset = assets[0]
                  isHdrVideo(asset!);
                }

                await expectEqualPhotoCount(befortCount, 1);
                console.info(`视频文件：${asset!.displayName}`)
                await sleep(4000);

                //恢复过程
                offPreviewOutputFrameStart(previewOutPut!);
                await stopSession(session);
                await releaseInPutStream(cameraInput);
                await releaseOutPutStream(previewOutPut);
                await releaseOutPutStream(videoOutput);
                await releaseSession(session)
                await sleep(2000);
              } catch (error) {
                console.error(`${testNum} error is ${JSON.stringify(error)}`)
                //恢复过程
                await releaseAvRecoder(avRecoder!);
                if (previewOutPut != undefined) {
                  offPreviewOutputFrameStart(previewOutPut!);
                }
                await stopSession(session);
                await releaseInPutStream(cameraInput);
                await releaseOutPutStream(previewOutPut)
                await releaseOutPutStream(videoOutput);
                await releaseSession(session)
                await sleep(2000);
                continue
              }
            }
          }
        }
        await sleep(4000);
        await helper.release();
        done();

      } catch (error) {
        console.error('error is ' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0200
     * @tc.name      : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0200
     * @tc.desc      : camera recorde HDR 1 video and Test HDR info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = `${MULTI_CONFIG_DIAG_TAG} SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_0200`
      try {
        //预制条件
        console.info(`${testNum} step getPermission begin`)
        await getPermission();
        console.info(`${testNum} step getPermission end`)
        console.info(`${testNum} step getHelper begin`)
        let helper = await getHelper();
        console.info(`${testNum} step getHelper end`)
        console.info(`${testNum} step getCameraManager begin`)
        let cameraManager = await getCameraManager();
        console.info(`${testNum} step getCameraManager end`)
        let cameras = getSupportedCameras(cameraManager);
        console.info(`${testNum} supported cameras length is ${cameras.length}`)
        for (let cameraIndex = 0; cameraIndex < cameras.length; cameraIndex++) {
          console.info(`${testNum} cameras[${cameraIndex}] position is ${cameras[cameraIndex].cameraPosition}, type is ${cameras[cameraIndex].connectionType}`)
        }
        if (cameras.length <= 1) {
          console.error(`${testNum} cameras length is ${cameras.length}, cameraIndex is 1`)
          await helper.release();
          expect(true).assertFail();
          done();
          return;
        }
        let camreId = cameras[1];
        console.info(`${testNum} selected cameras[1] position is ${camreId.cameraPosition}, type is ${camreId.connectionType}`)
        console.info(`${testNum} step getCameraOutputCapability begin`)
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_VIDEO);
        console.info(`${testNum} videoProfiles length is ${cameraOutputCapability?.videoProfiles?.length}, previewProfiles length is ${cameraOutputCapability?.previewProfiles?.length}`)
        let matchedProfileNum = 0;
        let skippedProfileNum = 0;
        let frameRateCaseNum = 0;
        for (let videoProfile of cameraOutputCapability?.videoProfiles!) {
          for (let previewProfile of cameraOutputCapability?.previewProfiles!) {
            if (previewProfile.size.height != videoProfile.size.height
              || previewProfile.size.width != videoProfile.size.width
              || previewProfile.format != videoProfile.format) {
              skippedProfileNum++;
              continue;
            }
            matchedProfileNum++;
            console.info(`${testNum} matched profile index is ${matchedProfileNum}, skipped profile count is ${skippedProfileNum}`)
            let frameRateRange = getSuppotredFrameRateRange(videoProfile);
            console.info(`${testNum} frameRateRange length is ${frameRateRange.length}, frameRateRange is ${JSON.stringify(frameRateRange)}`)
            for (let frameRate of frameRateRange) {
              frameRateCaseNum++;
              console.info(`${testNum} frameRate case index is ${frameRateCaseNum}, frameRate is ${JSON.stringify(frameRate)}`)
              const befortCount = await getAllPhotoAssetsCount();
              console.info(`${testNum} before asset count is ${befortCount}`)
              let videoOutput: camera.VideoOutput | undefined = undefined
              let cameraInput: camera.CameraInput | undefined = undefined
              let previewOutPut: camera.PreviewOutput | undefined = undefined
              let session: ESObject = undefined
              let avRecoder: media.AVRecorder | undefined = undefined
              try {
                console.info(`${testNum} videoProfile frameRateRange is ${videoProfile.frameRateRange} videoProfile
                format is ${videoProfile.format} videoProfile size is ${videoProfile.size}`);
                console.info(`${testNum} previewProfile format is ${previewProfile.format} previewProfile
                size is ${previewProfile.size} `);
                console.info(`${testNum} camrePosition is ${camreId.cameraPosition} camreType
                is ${camreId.connectionType}`);
                // 创建空的视频文件
                let videoName =
                  await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, camreId, videoProfile, previewProfile)
                let videoUri: string = `file://${getContext().filesDir}/${videoName}.mp4`; // 本地沙箱路径。
                console.info(`${testNum} step createVideoFile begin, videoUri is ${videoUri}`)
                let file: fs.File = await createVideoFile(videoUri)
                console.info(`${testNum} step createVideoFile end`)
                console.info(`${testNum} step createAvRecorder begin`)
                avRecoder = await createAvRecorder();
                console.info(`${testNum} step createAvRecorder end`)
                console.info(`${testNum} step setAvRecorderConfig begin`)
                await setAvRecorderConfig(avRecoder, file, videoProfile, frameRate);
                console.info(`${testNum} step setAvRecorderConfig end`)
                // 创建VideoOutput对象。
                console.info(`${testNum} step getVideoOutput begin`)
                videoOutput = await getVideoOutput(cameraManager, avRecoder, videoProfile);
                console.info(`${testNum} step getVideoOutput end`)
                console.info(`${testNum} step createSession begin`)
                session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
                console.info(`${testNum} step createSession end`)
                console.info(`${testNum} step createCameraInput begin`)
                cameraInput = createCameraInput(cameraManager, camreId);
                console.info(`${testNum} step createCameraInput end`)
                console.info(`${testNum} step createVideoPreviewOutput begin`)
                previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);
                console.info(`${testNum} step createVideoPreviewOutput end`)
                console.info(`${testNum} step openCamera begin`)
                await openCamera(cameraInput);
                console.info(`${testNum} step openCamera end`)
                console.info(`${testNum} step addInput begin`)
                await addInputIntoSession(session, cameraInput);
                console.info(`${testNum} step addInput end`)
                console.info(`${testNum} step addPreviewOutput begin`)
                await addOutputIntoSession(session, previewOutPut);
                console.info(`${testNum} step addPreviewOutput end`)
                console.info(`${testNum} step addVideoOutput begin`)
                await addOutputIntoSession(session, videoOutput);
                console.info(`${testNum} step addVideoOutput end`)

                // 设置色彩空间
                setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
                  videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)

                console.info(`${testNum} step commitSessionConfig begin`)
                await commitSessionConfig(session);
                console.info(`${testNum} step commitSessionConfig end`)
                // 更新视频旋转角度
                console.info(`${testNum} step getVideoRotation begin`)
                let rotation = await getVideoRotation(videoOutput)
                console.info(`${testNum} videoRotation is ${rotation}`)
                avRecoder.updateRotation(rotation)
                let videoStabilizationModes = getSupportedVideoStabilizationMode(session);
                // 遍历防抖模式
                for (let vsMode of videoStabilizationModes) {
                  if (videoStabilizationModes.length > 0 && vsMode != camera.VideoStabilizationMode.OFF) {
                    console.info(`${testNum} set vsMode is ${vsMode}`)
                    setVideoStabilizationMode(session, vsMode)
                    let activeMode = getActiveVideoStabilizationMode(session)
                    console.info(`${testNum} get vsMode is ${activeMode}`)
                  }
                }
                console.info(`${testNum} step startSession begin`)
                await startSession(session);
                console.info(`${testNum} step startSession end`)
                console.info(`${testNum} step startVideoOutput begin`)
                startVideoOutput(videoOutput);
                console.info(`${testNum} step startVideoOutput end`)
                setFocusMode(session);
                console.info(`${testNum} step onPreviewOutputFrameStart begin`)
                await onPreviewOutputFrameStart(previewOutPut!);
                console.info(`${testNum} step onPreviewOutputFrameStart end`)
                let zoomRatioRange = getSuppotredZoomRatioRange(session);
                console.info(`${testNum} zoomRatioRange length is ${zoomRatioRange?.length}`)
                console.info(`${testNum} step startAvRecoder begin`)
                await startAvRecoder(avRecoder);
                console.info(`${testNum} step startAvRecoder end`)
                if (zoomRatioRange != undefined) {
                  for (let zoomRatio of zoomRatioRange!) {
                    console.info(`${testNum} Profile is zoomRatio is ${zoomRatio}`)
                    setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
                    await sleep(2000);
                  }
                } else {
                  await sleep(3000);
                }
                console.info(`${testNum} step stopVideoOutput begin`)
                stopVideoOutput(videoOutput);
                console.info(`${testNum} step stopVideoOutput end`)
                console.info(`${testNum} step stopAvRecoder begin`)
                await stopAvRecoder(avRecoder, file);
                console.info(`${testNum} step stopAvRecoder end`)
                console.info(`${testNum} step releaseAvRecoder begin`)
                await releaseAvRecoder(avRecoder);
                console.info(`${testNum} step releaseAvRecoder end`)

                //测试过程
                // 检查录制的资产
                console.info(`${testNum} step saveAsset begin`)
                let asset = await saveAsset(helper, videoUri, getContext())
                console.info(`${testNum} step saveAsset end, displayName is ${asset!.displayName}`)
                await sleep(5000)
                if (videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 ||
                  videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010) {
                  let assets = await getPhotoAssetsWithKeyFromFileNames(helper, [asset!.displayName]);
                  asset = assets[0]
                  isHdrVideo(asset!);
                }

                await expectEqualPhotoCount(befortCount, 1);
                console.info(`${testNum} 视频文件：${asset!.displayName}`)
                await sleep(4000);

                //恢复过程
                console.info(`${testNum} step release resource begin`)
                offPreviewOutputFrameStart(previewOutPut!);
                await stopSession(session);
                await releaseInPutStream(cameraInput);
                await releaseOutPutStream(previewOutPut);
                await releaseOutPutStream(videoOutput);
                await releaseSession(session)
                console.info(`${testNum} step release resource end`)
                await sleep(2000);
              } catch (error) {
                console.error(`${testNum} inner error is ${formatVideoError(error)}`)
                //恢复过程
                await releaseAvRecoder(avRecoder!);
                if (previewOutPut != undefined) {
                  offPreviewOutputFrameStart(previewOutPut!);
                }
                await stopSession(session);
                await releaseInPutStream(cameraInput);
                await releaseOutPutStream(previewOutPut)
                await releaseOutPutStream(videoOutput);
                await releaseSession(session)
                await sleep(2000);
                continue
              }
            }
          }
        }
        console.info(`${testNum} matched profile count is ${matchedProfileNum}, skipped profile count is ${skippedProfileNum}, frameRate case count is ${frameRateCaseNum}`)
        await sleep(4000);
        await helper.release();
        console.info(`${testNum} helper release end`)
        done();

      } catch (error) {
        console.error(`${testNum} outer error is ${formatVideoError(error)}`)
        expect().assertFail();
        done();
      }
    })

  })
}
