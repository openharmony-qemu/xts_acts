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
  waitPreviewOutputFrameStart,
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

/**
 * @desc 相机框架的录像灰盒用例
 * @returns 是否成功
 */
async function cameraVideoRecordTest(testNum: string, testCameraId: number,
  testZoomRatioRange: number): Promise<boolean> {
  try {
    //预制条件
    await getPermission();
    let captureVideoTotalNum = 0;
    let helper = await getHelper();
    let cameraManager = await getCameraManager();
    let cameras = getSupportedCameras(cameraManager);
    if (cameras.length <= 0) {
      console.error(`${testNum} cameras length is ${cameras.length}, cameraIndex is 0`)
      await helper.release();
      expect(true).assertFail();
      return false;
    } else if (cameras.length < testCameraId + 1) {  //判断单前需要测试的相机数量是否已经测完（当前测试序号是否大于相机总数）
      console.info(`${testNum} this camera number is end, cameras.length is ${cameras.length}`)
      return true;
    }
    const beforeVideoNum = await getAllPhotoAssetsCount();
    let camreId = cameras[testCameraId];
    let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_VIDEO);
    for (let videoProfile of cameraOutputCapability?.videoProfiles!) {
      for (let previewProfile of cameraOutputCapability?.previewProfiles!) {
        //  视频流和预览流格式和宽高比保持一致，为防止小数溢出，两边同乘分母
        if (videoProfile.size.height * previewProfile.size.width != videoProfile.size.width * previewProfile.size.height
          || previewProfile.format != videoProfile.format) {
          continue;
        }
        let frameRateRange = getSuppotredFrameRateRange(videoProfile);
        console.info(`${testNum} rameRateRange length is ${frameRateRange.length}`)
        let frameRate = frameRateRange[0]
          
        let videoOutput: camera.VideoOutput | undefined = undefined
        let cameraInput: camera.CameraInput | undefined = undefined
        let previewOutPut: camera.PreviewOutput | undefined = undefined
        let session: ESObject = undefined
        let avRecoder: media.AVRecorder | undefined = undefined              
        try {
          console.info(`${testNum} videoProfile frameRateRange is ${videoProfile.frameRateRange}`);
          console.info(`${testNum} videoProfile format is ${videoProfile.format} size is ${videoProfile.size.width} * ${videoProfile.size.height}`);
          console.info(`${testNum} previewProfile format is ${previewProfile.format} size is ${previewProfile.size.width} * ${previewProfile.size.height}`);
          console.info(`${testNum} camrePosition is ${camreId.cameraPosition} camreType is ${camreId.connectionType}`);
          // 创建空的视频文件
          let videoName = await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, camreId, videoProfile, previewProfile)
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
          console.info(`${testNum} openCamera is finish`);
          await addInputIntoSession(session, cameraInput);
          await addOutputIntoSession(session, previewOutPut);
          await addOutputIntoSession(session, videoOutput);

          // 设置色彩空间
          setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
            videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)

          await commitSessionConfig(session);
          // 更新视频旋转角度
          let rotation = await getVideoRotation(videoOutput)
          console.info(`${testNum} videoRotation: ${rotation}`);
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
          onPreviewOutputFrameStart(previewOutPut!);
          await startSession(session);
          startVideoOutput(videoOutput);
          setFocusMode(session);
          await waitPreviewOutputFrameStart(previewOutPut!);
          let zoomRatioRange = getSuppotredZoomRatioRange(session);
          await startAvRecoder(avRecoder);
          captureVideoTotalNum++;
          let zoomRatio: number;
          let findZoomRatioRange: boolean;
          if (zoomRatioRange != undefined) {
            if (zoomRatioRange.length < testZoomRatioRange + 1) {  //判断单前需要测试的放大焦距是否已经测完（当前测试序号是否大于需要测试总数）
              console.info(`${testNum} this camera zoom number is end, zoomRatioRange.length is ${zoomRatioRange.length}`);
              await stopSession(session);
              console.info(`${testNum} stopSession is finish`);
              await releaseInPutStream(cameraInput);
              await releaseOutPutStream(previewOutPut);
              await releaseOutPutStream(videoOutput);
              console.info(`releaseStream is finish`);
              await releaseSession(session);
              return true;
            }
            findZoomRatioRange = true;
            zoomRatio = zoomRatioRange[testZoomRatioRange];
            setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
            await sleep(1000);
          } else {
            findZoomRatioRange = false
            zoomRatio = 1
            await sleep(1000);
          }
          stopVideoOutput(videoOutput);
          await stopAvRecoder(avRecoder, file);
          await releaseAvRecoder(avRecoder);
          await saveAsset(helper, videoUri, getContext())

          //恢复过程
          offPreviewOutputFrameStart(previewOutPut!);
          await stopSession(session);
          console.info(`${testNum} stopSession is finish`);
          await releaseInPutStream(cameraInput);
          await releaseOutPutStream(previewOutPut);
          await releaseOutPutStream(videoOutput);
          await releaseSession(session)
          await sleep(200);
        } catch (error) {
          console.error(`${testNum} error is ${JSON.stringify(error)}`)
          //失败恢复过程
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
    const afterVideoNum = await getAllPhotoAssetsCount();
    console.info(`beforeNum is ${beforeVideoNum}, captureNum is ${captureVideoTotalNum}, afterNum is ${afterVideoNum}`);
    if (beforeVideoNum + captureVideoTotalNum != afterVideoNum) {
      expect().assertFail();
    }
    await sleep(1000);
    await helper.release();
    return true;
  } catch (error) {
    console.error('error is ' + JSON.stringify(error))
    expect().assertFail();
    return false;
  }
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
     * @tc.number SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0100
     * @tc.name SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0100
     * @tc.desc camera recorde HDR 1 video and Test HDR info
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0100'
      let ret = await cameraVideoRecordTest(testNum, 0, 0);
 	    expect(ret).assertTrue();
 	    done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0200
     * @tc.name SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0200
     * @tc.desc camera recorde HDR 1 video and Test HDR info
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0200'
      let ret = await cameraVideoRecordTest(testNum, 0, 1);
 	    expect(ret).assertTrue();
 	    done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0300
     * @tc.name SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0300
     * @tc.desc camera recorde HDR 1 video and Test HDR info
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0300'
      let ret = await cameraVideoRecordTest(testNum, 0, 2);
 	    expect(ret).assertTrue();
 	    done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0400
     * @tc.name SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0400
     * @tc.desc camera recorde HDR 1 video and Test HDR info
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0400'
      let ret = await cameraVideoRecordTest(testNum, 1, 0);
 	    expect(ret).assertTrue();
 	    done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0500
     * @tc.name SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0500
     * @tc.desc camera recorde HDR 1 video and Test HDR info
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0500'
      let ret = await cameraVideoRecordTest(testNum, 1, 1);
 	    expect(ret).assertTrue();
 	    done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0600
     * @tc.name SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0600
     * @tc.desc camera recorde HDR 1 video and Test HDR info
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_HDR_VIDEO_RECORDER_MULTI_CONFIG_0600'
      let ret = await cameraVideoRecordTest(testNum, 1, 2);
 	    expect(ret).assertTrue();
 	    done();
    })

  })
}
