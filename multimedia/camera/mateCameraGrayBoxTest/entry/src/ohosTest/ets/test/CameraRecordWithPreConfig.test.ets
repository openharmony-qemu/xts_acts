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
  setZoomRatioRange,
  getSuppotredZoomRatioRange,
  createAvRecorder,
  getVideoOutput,
  createAndConfigSession,
  createCameraInput,
  openCamera,
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
  getSupportedCameras,
  getPreviewOutput,
  isSupportPreconfig,
  setPreconfig,
  getPhotoAssetsWithKeyFromFileNames,
} from './CameraCommonAPI';

let PreConfigSizeArr: Array<Array<camera.Size>> = [
  [{'width': 720, 'height': 720}, {'width': 960, 'height': 720}, {'width': 1280, 'height': 720}],
  [{'width': 1080, 'height': 1080}, {'width': 1440, 'height': 1080}, {'width': 1920, 'height': 1080}],
  [{'width': 2160, 'height': 2160}, {'width': 2880, 'height': 2160}, {'width': 3840, 'height': 2160}],
  [{'width': 2160, 'height': 2160}, {'width': 2880, 'height': 2160}, {'width': 3840, 'height': 2160}],
]

export default function CameraRecordWithPreConfig() {
  describe('cameraRecordWithPreConfig', () => {
    console.info('----------cameraRecordWithPreConfig begin--------------')
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission()
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
      sleep(1000);
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_RECORD_WITH_PRE_CONFIG_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_RECORD_WITH_PRE_CONFIG_0100
     * @tc.desc      : test sub multimedia camera recording with preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // 使用预配置流程，遍历所有预配置类型，录制视频
    it('SUB_MULTIMEDIA_CAMERA_RECORD_WITH_PRE_CONFIG_0100', Level.LEVEL1, async (done: Function) => {
      //--------------------------------------------预置条件------------------------------------------------------
      let context = getContext();
      let helperInstance = await getHelper();
      // 创建CameraManager对象。
      let cameraManager = await getCameraManager();
      let cameras = getSupportedCameras(cameraManager);

      //--------------------------------------------测试过程------------------------------------------------------
      let PreconfigTypeArr = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P,
        camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
      let PreconfigRatioArr = [camera.PreconfigRatio.PRECONFIG_RATIO_1_1, camera.PreconfigRatio.PRECONFIG_RATIO_4_3,
        camera.PreconfigRatio.PRECONFIG_RATIO_16_9];

      let videoProfile: camera.VideoProfile | undefined = undefined
      for (let cameraId of cameras) {
        for (let preconfigType of PreconfigTypeArr) {
          for (let preconfigRatio of PreconfigRatioArr) {
            const befortCount = await getAllPhotoAssetsCount();
            //创建会话。
            let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);

            // 查询Preconfig能力
            let isPreconfigSupport = isSupportPreconfig(session, preconfigType, preconfigRatio);
            console.info(`preConfigType: ${preconfigType}, preConfigRatio: ${preconfigRatio}, isSupport: ${isPreconfigSupport}`)
            if (!isPreconfigSupport) {
              continue
            }
            // 配置Preconfig
            setPreconfig(session, preconfigType, preconfigRatio)
            let preConfigSize = PreConfigSizeArr[preconfigType][preconfigRatio]
            console.info("preConfigSize: " + JSON.stringify(preConfigSize))
            videoProfile = {
              'format': preconfigType == camera.PreconfigType.PRECONFIG_HIGH_QUALITY ? camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 : camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
              'frameRateRange': {
                'min': 1, 'max': 30
              },
              'size': preConfigSize
            }

            // 创建空的视频文件
            let videoUri: string = `file://${context.filesDir}/${Date.now()}.mp4`; // 本地沙箱路径。
            let file: fs.File = await createVideoFile(videoUri)
            // 创建录制实例
            let avRecorder = await createAvRecorder();
            await setAvRecorderConfig(avRecorder, file, videoProfile, videoProfile.frameRateRange.max);
            // 创建VideoOutput对象。
            let videoOutput = await getVideoOutput(cameraManager, avRecorder);
            // 创建相机输入流。
            let cameraInput = createCameraInput(cameraManager, cameraId);
            // 打开相机。
            await openCamera(cameraInput);
            // 创建预览输出流，其中参数 surfaceId 参考下面 XComponent 组件，预览流为XComponent组件提供的surface。
            let previewOutPut = getPreviewOutput(cameraManager);

            // 向会话中添加相机输入流。
            await addInputIntoSession(session, cameraInput);
            // 向会话中添加预览输出流。
            await addOutputIntoSession(session, previewOutPut);
            // 向会话中添加录像输出流。
            await addOutputIntoSession(session, videoOutput);

            let activeProfile = videoOutput.getActiveProfile()
            console.info("activeProfile: " + JSON.stringify(activeProfile))
            // 设置色彩空间
            setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
              videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
            // 提交会话配置。
            await commitSessionConfig(session);
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
            // 启动会话。
            await startSession(session);
            // 启动录像输出流。
            startVideoOutput(videoOutput);
            // 开始录像。
            await onPreviewOutputFrameStart(previewOutPut!);
            await startAvRecoder(avRecorder);
            // 遍历焦距
            let zoomRatioRange = getSuppotredZoomRatioRange(session);
            for (let zoomRatio of zoomRatioRange!) {
              console.info('zoomRatio is ' + zoomRatio)
              setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
              await sleep(2000);
            }
            // 停止录像输出流。
            await stopVideoOutput(videoOutput);
            // 停止录像。
            await stopAvRecoder(avRecorder, file);
            await releaseAvRecoder(avRecorder);
            // 停止当前会话。
            offPreviewOutputFrameStart(previewOutPut!);
            stopSession(session);
            // 检查录制的资产
            let asset = await saveAsset(helperInstance, videoUri, context)
            await sleep(5000)
            if (videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 ||
              videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010) {
              let assets = await getPhotoAssetsWithKeyFromFileNames(helperInstance, [asset!.displayName]);
              asset = assets[0]
              isHdrVideo(asset!);
            }
            await expectEqualPhotoCount(befortCount, 1);

            //--------------------------------------------后置处理------------------------------------------------------
            // 释放相机输入流。
            releaseInPutStream(cameraInput);
            // 释放预览输出流。
            releaseOutPutStream(previewOutPut);
            // 释放录像输出流。
            releaseOutPutStream(videoOutput);
            // 释放会话。
            releaseSession(session)
            // 会话置空。
            session = undefined;
          }
        }
      }
      done()
    })

  })
}