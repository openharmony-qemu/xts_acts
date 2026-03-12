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
  getSupportedCameras,
  getCameraOutputCapability,
  writeFile,
  waitForStatus,
  createFile,
  readFile,
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
  getVideoRotation,
} from './CameraCommonAPI';

// 相机上报能力
interface CameraInfo {
  camera: camera.CameraDevice,
  capability: Array<OutputCapabilityInfo>
}

interface OutputCapabilityInfo {
  mode: camera.SceneMode,
  cameraOutputCapability?: camera.CameraOutputCapability
}

// 用例需要用到的测试数据
interface CaseInfo {
  cameraId: camera.CameraDevice,
  videoOutputProfile: camera.VideoProfile,
  previewOutputProfile: camera.Profile,
  frameRate: number,
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

    afterEach(() => {
      console.info('afterEach case');
      sleep(1000);
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : CAMERA_HDR_VIDEO_RECORDER_WITH_DEFAULT_CONFIG_0000
     * @tc.name      : camera_HDR_video_recorde_0000
     * @tc.desc      : camera recorde HDR 1 video and Test HDR info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //相机在不同摄像头、不同照片格式、不同分辨率、不同焦距下拍摄视频，并测试该视频资产的HDR标签信息
    it('camera_HDR_video_recorde_0000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'camera_HDR_video_recorde_0000'
      createFile()
      // 先等待测试数据下发完成
      await waitForStatus("1");
      // 读取测试数据
      let testData = await readFile();
      let caseInfo: CaseInfo = JSON.parse(testData)
      console.info("testcase is: " + JSON.stringify(caseInfo))
      let cameraId: camera.CameraDevice = caseInfo.cameraId
      let videoProfile: camera.VideoProfile = caseInfo.videoOutputProfile
      let previewProfile: camera.Profile = caseInfo.previewOutputProfile
      let frameRate = caseInfo.frameRate

      //--------------------------------------------预置条件------------------------------------------------------
      try {
        let context = getContext();
        let helperInstance = await getHelper();
        // 创建CameraManager对象。
        let cameraManager = await getCameraManager();
        const befortCount = await getAllPhotoAssetsCount();
        // 创建空的视频文件
        let videoName = await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, cameraId, videoProfile, previewProfile)
        let videoUri: string = `file://${context.filesDir}/${videoName}.mp4`; // 本地沙箱路径。
        let file: fs.File = await createVideoFile(videoUri)
        // 创建录制实例
        let avRecorder = await createAvRecorder();
        await setAvRecorderConfig(avRecorder, file, videoProfile, frameRate);
        // 创建VideoOutput对象。
        let videoOutput = await getVideoOutput(cameraManager, avRecorder, videoProfile);
        //创建会话。
        let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
        // 创建相机输入流。
        let cameraInput = createCameraInput(cameraManager, cameraId);
        // 创建预览输出流，其中参数 surfaceId 参考下面 XComponent 组件，预览流为XComponent组件提供的surface。
        let previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);

        //--------------------------------------------测试过程------------------------------------------------------
        // 打开相机。
        await openCamera(cameraInput);
        // 向会话中添加相机输入流。
        await addInputIntoSession(session, cameraInput);
        // 向会话中添加预览输出流。
        await addOutputIntoSession(session, previewOutPut);
        // 向会话中添加录像输出流。
        await addOutputIntoSession(session, videoOutput);
        // 设置色彩空间
        setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
          videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
        // 提交会话配置。
        await commitSessionConfig(session);
        // 更新视频旋转角度
        let rotation = await getVideoRotation(videoOutput)
        console.info(`videoRotation: ${rotation}`)
        avRecorder.updateRotation(rotation)
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
        stopVideoOutput(videoOutput);
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
        console.info(`视频文件：${asset!.displayName}`)
        await writeFile(asset!.displayName, "response.txt")
        await waitForStatus("0")

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
        done()
      } catch (err) {
        console.info("error is :" + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : camera_HDR_video_recorde_0100
     * @tc.name      : camera_HDR_video_recorde_0100
     * @tc.desc      : camera recorde HDR 1 video and Test HDR info, set colorSpace after commit session
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //相机在不同摄像头、不同照片格式、不同分辨率、不同焦距下, 提交会话之后设置色彩空间拍摄视频，并测试该视频资产的HDR标签信息
    it('camera_HDR_video_recorde_0100', Level.LEVEL0, async (done: Function) => {
      //--------------------------------------------预置条件------------------------------------------------------
      createFile()
      // 先等待测试数据下发完成
      await waitForStatus("1");
      // 读取测试数据
      let testData = await readFile();
      let caseInfo: CaseInfo = JSON.parse(testData)
      console.info("testcase is: " + JSON.stringify(caseInfo))
      let cameraId: camera.CameraDevice = caseInfo.cameraId
      let videoProfile: camera.VideoProfile = caseInfo.videoOutputProfile
      let previewProfile: camera.Profile = caseInfo.previewOutputProfile
      let frameRate = caseInfo.frameRate

      //--------------------------------------------预置条件------------------------------------------------------
      try {
        let context = getContext();
        let helperInstance = await getHelper();
        // 创建CameraManager对象。
        let cameraManager = await getCameraManager();
        const befortCount = await getAllPhotoAssetsCount();
        // 创建空的视频文件
        let videoName = await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, cameraId, videoProfile, previewProfile)
        let videoUri: string = `file://${context.filesDir}/${videoName}.mp4`; // 本地沙箱路径。
        let file: fs.File = await createVideoFile(videoUri)
        // 创建录制实例
        let avRecorder = await createAvRecorder();
        await setAvRecorderConfig(avRecorder, file, videoProfile, frameRate);
        // 创建VideoOutput对象。
        let videoOutput = await getVideoOutput(cameraManager, avRecorder, videoProfile);
        //创建会话。
        let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
        // 创建相机输入流。
        let cameraInput = createCameraInput(cameraManager, cameraId);
        // 创建预览输出流，其中参数 surfaceId 参考下面 XComponent 组件，预览流为XComponent组件提供的surface。
        let previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);

        //--------------------------------------------测试过程------------------------------------------------------
        // 打开相机。
        await openCamera(cameraInput);
        // 向会话中添加相机输入流。
        await addInputIntoSession(session, cameraInput);
        // 向会话中添加预览输出流。
        await addOutputIntoSession(session, previewOutPut);
        // 向会话中添加录像输出流。
        await addOutputIntoSession(session, videoOutput);
        // 提交会话配置。
        await commitSessionConfig(session);
        // 更新视频旋转角度
        let rotation = await getVideoRotation(videoOutput)
        console.info(`videoRotation: ${rotation}`)
        avRecorder.updateRotation(rotation)
        // 设置色彩空间
        setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
          videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
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
        stopVideoOutput(videoOutput);
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
        console.info(`视频文件：${asset!.displayName}`)
        await writeFile(asset!.displayName, "response.txt")
        await waitForStatus("0")

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
        done()
      } catch (err) {
        console.info("error is :" + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : camera_HDR_video_recorde_0200
     * @tc.name      : camera_HDR_video_recorde_0200
     * @tc.desc      : camera recorde HDR 1 video and Test HDR info, set setVideoStabilizationMode and colorSpace after commit session
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //相机在不同摄像头、不同照片格式、不同分辨率、不同焦距下, 提交会话之后设置防抖、色彩空间拍摄视频，并测试该视频资产的HDR标签信息
    it('camera_HDR_video_recorde_0200', Level.LEVEL0, async (done: Function) => {
      let testNum = 'camera_HDR_video_recorde_0200'
      createFile()
      // 先等待测试数据下发完成
      await waitForStatus("1");
      // 读取测试数据
      let testData = await readFile();
      let caseInfo: CaseInfo = JSON.parse(testData)
      console.info("testcase is: " + JSON.stringify(caseInfo))
      let cameraId: camera.CameraDevice = caseInfo.cameraId
      let videoProfile: camera.VideoProfile = caseInfo.videoOutputProfile
      let previewProfile: camera.Profile = caseInfo.previewOutputProfile
      let frameRate = caseInfo.frameRate

      //--------------------------------------------预置条件------------------------------------------------------
      try {
        let context = getContext();
        let helperInstance = await getHelper();
        // 创建CameraManager对象。
        let cameraManager = await getCameraManager();
        const befortCount = await getAllPhotoAssetsCount();
        // 创建空的视频文件
        let videoName = await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, cameraId, videoProfile, previewProfile)
        let videoUri: string = `file://${context.filesDir}/${videoName}.mp4`; // 本地沙箱路径。
        let file: fs.File = await createVideoFile(videoUri)
        // 创建录制实例
        let avRecorder = await createAvRecorder();
        await setAvRecorderConfig(avRecorder, file, videoProfile, frameRate);
        // 创建VideoOutput对象。
        let videoOutput = await getVideoOutput(cameraManager, avRecorder, videoProfile);

        //创建会话。
        let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
        // 创建相机输入流。
        let cameraInput = createCameraInput(cameraManager, cameraId);
        // 创建预览输出流，其中参数 surfaceId 参考下面 XComponent 组件，预览流为XComponent组件提供的surface。
        let previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);

        //--------------------------------------------测试过程------------------------------------------------------
        // 打开相机。
        await openCamera(cameraInput);
        // 向会话中添加相机输入流。
        await addInputIntoSession(session, cameraInput);
        // 向会话中添加预览输出流。
        await addOutputIntoSession(session, previewOutPut);
        // 向会话中添加录像输出流。
        await addOutputIntoSession(session, videoOutput);
        // 提交会话配置。
        await commitSessionConfig(session);
        // 更新视频旋转角度
        let rotation = await getVideoRotation(videoOutput)
        console.info(`videoRotation: ${rotation}`)
        avRecorder.updateRotation(rotation)
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
        // 设置色彩空间
        setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
          videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
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
        stopVideoOutput(videoOutput);
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
        console.info(`视频文件：${asset!.displayName}`)
        // await writeFile(asset!.displayName, "response.txt")
        // await waitForStatus("0")

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
        done()
      } catch (err) {
        console.info("error is :" + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : GET_TEST_DATA
     * @tc.name      : get test data
     * @tc.desc      : get test data
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 4
     */
    //获取用例的测试数据
    it('GET_TEST_DATA', Level.LEVEL4, async (done: Function) => {
      let data: Array<CameraInfo> = []
      let cameraManager = await getCameraManager();
      let cameras = getSupportedCameras(cameraManager);
      for (let cameraId of cameras) {
        let cameraInfo: CameraInfo = {
          camera: cameraId,
          capability: []
        }
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, cameraId, camera.SceneMode.NORMAL_VIDEO)
        cameraInfo.capability?.push({
          mode: camera.SceneMode.NORMAL_VIDEO,
          cameraOutputCapability: cameraOutputCapability
        })
        data.push(cameraInfo)
      }
      await writeFile(JSON.stringify(data))
      await waitForStatus("0")
      done();
    })

  })
}