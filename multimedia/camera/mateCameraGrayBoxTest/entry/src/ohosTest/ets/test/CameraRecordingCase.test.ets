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
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import {
  getPermission,
  sleep,
} from './CameraCommonAPI';

export default function CameraRecordingCase() {
  describe('CameraRecordingCase', () => {
    console.info('----------CameraRecordingCase begin--------------')
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_RECORD_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_RECORD_0100
     * @tc.desc      : test sub multimedia camera recording example code
     * @tc.url       : https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/camera-recording-case
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // 开发文档中的录像实践示例代码
    it('SUB_MULTIMEDIA_CAMERA_RECORD_0100', Level.LEVEL1, async (done: Function) => {

      let videoRecording = async (context: common.Context, surfaceId: string) => {
        // 创建CameraManager对象。
        let cameraManager: camera.CameraManager = camera.getCameraManager(context);
        if (!cameraManager) {
          console.error("camera.getCameraManager error");
          return;
        }

        // 监听相机状态变化。
        cameraManager.on('cameraStatus', (err: BusinessError, cameraStatusInfo: camera.CameraStatusInfo) => {
          if (err !== undefined && err.code !== 0) {
            console.error('cameraStatus with errorCode = ' + err.code);
            return;
          }
          console.info(`camera : ${cameraStatusInfo.camera.cameraId}`);
          console.info(`status: ${cameraStatusInfo.status}`);
        });

        // 获取相机列表。
        let cameraArray: Array<camera.CameraDevice> = [];
        try {
          cameraArray = cameraManager.getSupportedCameras();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`getSupportedCameras call failed. error code: ${err.code}`);
        }

        if (cameraArray.length <= 0) {
          console.error("cameraManager.getSupportedCameras error");
          return;
        }

        // 获取支持的模式类型。
        let sceneModes: Array<camera.SceneMode> = cameraManager.getSupportedSceneModes(cameraArray[0]);
        let isSupportVideoMode: boolean = sceneModes.indexOf(camera.SceneMode.NORMAL_VIDEO) >= 0;
        if (!isSupportVideoMode) {
          console.error('video mode not support');
          return;
        }

        // 获取相机设备支持的输出流能力。
        let cameraOutputCap: camera.CameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraArray[0], camera.SceneMode.NORMAL_VIDEO);
        if (!cameraOutputCap) {
          console.error("cameraManager.getSupportedOutputCapability error")
          return;
        }
        console.info("outputCapability: " + JSON.stringify(cameraOutputCap));

        let previewProfilesArray: Array<camera.Profile> = cameraOutputCap.previewProfiles;
        if (!previewProfilesArray) {
          console.error("createOutput previewProfilesArray == null || undefined");
        }

        let photoProfilesArray: Array<camera.Profile> = cameraOutputCap.photoProfiles;
        if (!photoProfilesArray) {
          console.error("createOutput photoProfilesArray == null || undefined");
        }

        let videoProfilesArray: Array<camera.VideoProfile> = cameraOutputCap.videoProfiles;
        if (!videoProfilesArray || videoProfilesArray.length === 0) {
          console.error("createOutput videoProfilesArray == null || undefined");
        }

        // videoProfile的宽高需要与AVRecorderProfile的宽高保持一致，并且需要使用AVRecorderProfile所支持的宽高。
        // 示例代码默认选择第一个videoProfile，实际开发需根据所需筛选videoProfile。
        let videoProfile: camera.VideoProfile = videoProfilesArray[0];
        let isHdr = videoProfile.format === camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 || videoProfile.format === camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010;
        // 配置参数以实际硬件设备支持的范围为准。
        let aVRecorderProfile: media.AVRecorderProfile = {
          audioBitrate: 48000,
          audioChannels: 2,
          audioCodec: media.CodecMimeType.AUDIO_AAC,
          audioSampleRate: 48000,
          fileFormat: media.ContainerFormatType.CFT_MPEG_4,
          videoBitrate: 2000000,
          videoCodec: isHdr ? media.CodecMimeType.VIDEO_HEVC : media.CodecMimeType.VIDEO_AVC,
          videoFrameWidth: videoProfile.size.width,
          videoFrameHeight: videoProfile.size.height,
          videoFrameRate: 30,
          isHdr: isHdr
        };
        let videoUri: string = `file://${context.filesDir}/${Date.now()}.mp4`; // 本地沙箱路径。
        let file: fs.File = fs.openSync(videoUri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let aVRecorderConfig: media.AVRecorderConfig = {
          audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
          videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
          profile: aVRecorderProfile,
          url: `fd://${file.fd.toString()}`, // 文件需先由调用者创建，赋予读写权限，将文件fd传给此参数，eg.fd://45--file:///data/media/01.mp4
          rotation: 0, // 合理值0、90、180、270，非合理值prepare接口将报错。
          location: { latitude: 30, longitude: 130 }
        };

        let avRecorder: media.AVRecorder | undefined = undefined;
        try {
          avRecorder = await media.createAVRecorder();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`createAVRecorder call failed. error code: ${err.code}`);
        }

        if (avRecorder === undefined) {
          return;
        }

        try {
          await avRecorder.prepare(aVRecorderConfig);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`prepare call failed. error code: ${err.code}`);
        }

        let videoSurfaceId: string | undefined = undefined; // 该surfaceID用于传递给相机接口创造videoOutput。
        try {
          videoSurfaceId = await avRecorder.getInputSurface();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`getInputSurface call failed. error code: ${err.code}`);
        }
        if (videoSurfaceId === undefined) {
          return;
        }
        // 创建VideoOutput对象。
        let videoOutput: camera.VideoOutput | undefined = undefined;
        try {
          videoOutput = cameraManager.createVideoOutput(videoProfile, videoSurfaceId);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to create the videoOutput instance. error: ${err}`);
        }
        if (videoOutput === undefined) {
          return;
        }
        // 监听视频输出错误信息。
        videoOutput.on('error', (error: BusinessError) => {
          console.error(`Preview output error code: ${error.code}`);
        });

        //创建会话。
        let videoSession: camera.VideoSession | undefined = undefined;
        try {
          videoSession = cameraManager.createSession(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to create the session instance. error: ${err}`);
        }
        if (videoSession === undefined) {
          return;
        }
        // 监听session错误信息。
        videoSession.on('error', (error: BusinessError) => {
          console.error(`Video session error code: ${error.code}`);
        });

        // 开始配置会话。
        try {
          videoSession.beginConfig();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to beginConfig. error: ${err}`);
        }

        // 创建相机输入流。
        let cameraInput: camera.CameraInput | undefined = undefined;
        try {
          cameraInput = cameraManager.createCameraInput(cameraArray[0]);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to createCameraInput. error: ${err}`);
        }
        if (cameraInput === undefined) {
          return;
        }
        // 监听cameraInput错误信息。
        let cameraDevice: camera.CameraDevice = cameraArray[0];
        cameraInput.on('error', cameraDevice, (error: BusinessError) => {
          console.error(`Camera input error code: ${error.code}`);
        });

        // 打开相机。
        try {
          await cameraInput.open();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to open cameraInput. error: ${err}`);
        }

        // 向会话中添加相机输入流。
        try {
          videoSession.addInput(cameraInput);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to add cameraInput. error: ${err}`);
        }

        // 创建预览输出流，其中参数 surfaceId 参考下面 XComponent 组件，预览流为XComponent组件提供的surface。
        let previewOutput: camera.PreviewOutput | undefined = undefined;
        let previewProfile = previewProfilesArray.find((previewProfile: camera.Profile) => {
          return Math.abs((previewProfile.size.width / previewProfile.size.height) - (videoProfile.size.width / videoProfile.size.height)) < Number.EPSILON;
        }); // 筛选与录像分辨率宽高比一致的预览分辨率。
        if (previewProfile === undefined) {
          return;
        }
        try {
          previewOutput = cameraManager.createPreviewOutput(previewProfile, surfaceId);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to create the PreviewOutput instance. error: ${err}`);
        }
        if (previewOutput === undefined) {
          return;
        }

        // 向会话中添加预览输出流。
        try {
          videoSession.addOutput(previewOutput);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to add previewOutput. error: ${err}`);
        }

        // 向会话中添加录像输出流。
        try {
          videoSession.addOutput(videoOutput);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to add videoOutput. error: ${err}`);
        }

        // 提交会话配置。
        try {
          await videoSession.commitConfig();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`videoSession commitConfig error: ${err}`);
          return;
        }

        // 启动会话。
        try {
          await videoSession.start();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`videoSession start error: ${err}`);
        }

        // 启动录像输出流。
        videoOutput.start((err: BusinessError) => {
          if (err) {
            console.error(`Failed to start the video output. error: ${err}`);
            return;
          }
          console.info('Callback invoked to indicate the video output start success.');
        });

        // 开始录像。
        try {
          await avRecorder.start();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`avRecorder start error: ${err}`);
        }

        // 停止录像输出流。
        videoOutput.stop((err: BusinessError) => {
          if (err) {
            console.error(`Failed to stop the video output. error: ${err}`);
            return;
          }
          console.info('Callback invoked to indicate the video output stop success.');
        });

        // 停止录像。
        try {
          await avRecorder.stop();
        } catch (error) {
          let err = error as BusinessError;
          console.error(`avRecorder stop error: ${err}`);
        }

        // 停止当前会话。
        await videoSession.stop();

        // 关闭文件。
        fs.closeSync(file);

        // 释放相机输入流。
        await cameraInput.close();

        // 释放预览输出流。
        await previewOutput.release();

        // 释放录像输出流。
        await videoOutput.release();

        // 释放会话。
        await videoSession.release();

        // 会话置空。
        videoSession = undefined;
      }
      // exec case
      let context = getContext();
      await videoRecording(context, globalThis.surfaceId)
      done()
    })
  })
}