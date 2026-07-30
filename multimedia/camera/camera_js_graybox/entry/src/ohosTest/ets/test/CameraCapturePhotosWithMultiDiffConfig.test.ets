import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  addInputIntoSession,
  addOutputIntoSession,
  commitSessionConfig,
  createAndConfigSession,
  createCameraInput,
  getCameraManager,
  getCameraOutputCapability,
  getPermission,
  getSupportedCameras,
  openCamera,
  releaseInPutStream,
  releaseOutPutStream,
  releaseSession,
  sleep,
  startSession,
  stopSession,
  cameraCaptureRelyOnNum,
  onPhotoOutputPhotoAssetAvailable,
  offPhotoOutputPhotoAssetAvailable,
  setFocusMode,
  getSuppotredZoomRatioRange,
  setZoomRatioRange,
  onCaptureReady,
  offCaptureReady,
  getHelper,
  onPreviewOutputFrameStart,
  waitPreviewOutputFrameStart,
  offPreviewOutputFrameStart,
  expectEqualPhotoCount,
  getAllPhotoAssetsCount,
  getPhotoOutputFromProfile,
  createPreviewOutputFromProfile,
  setImageColorSpace,
  IsexistMovingPhotoVideo,
  generateNameForAsset,
  renameAsset
} from './CameraCommonAPI'

import {
  enableMovingPhoto,
} from './CameraCommonAPI'

import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { camera } from '@kit.CameraKit';

/**
 * @desc 相机框架的拍照灰盒用例
 * @returns 是否成功
 */
async function cameraCapturePhotosTest(testNum: string, testCameraId: number,
  testZoomRatioRange: number): Promise<boolean>{
  try {
    //预制条件
    let capturePhotoNum = 1;
    let capturePhotoTotalNum = 0;
    await getPermission();
    let helperInstance = await getHelper();
    let cameraManager = await getCameraManager();
    let cameras = getSupportedCameras(cameraManager);
    if (cameras.length <= 0) {
      console.error(`${testNum} cameras length is ${cameras.length}, cameraIndex is 0`)
      await helperInstance.release();
      expect(true).assertFail();
      return false;
    } else if (cameras.length < testCameraId + 1) {
      return true;
    }
    const beforePhotoTotalNum = await getAllPhotoAssetsCount();
    let camreId = cameras[testCameraId];
    let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_PHOTO)
    for (let photoOutputProfile of cameraOutputCapability?.photoProfiles!) {
      for (let previewOutPutProfile of cameraOutputCapability?.previewProfiles!) {
        let photoOutput: camera.PhotoOutput | undefined = undefined
        let cameraInput: camera.CameraInput | undefined = undefined
        let previewOutPut: camera.PreviewOutput | undefined = undefined
        let session: ESObject = undefined
        try {
          console.info(`${testNum} photoProfile format is ${photoOutputProfile.format} size is ${photoOutputProfile.size.width} * ${photoOutputProfile.size.height}`);
          console.info(`${testNum} previewProfile format is ${previewOutPutProfile.format} size is ${previewOutPutProfile.size.width} * ${previewOutPutProfile.size.height}`);
          console.info(`${testNum} camrePosition is ${camreId.cameraPosition} camreType is ${camreId.connectionType}`);
          photoOutput = getPhotoOutputFromProfile(cameraManager, photoOutputProfile)
          cameraInput = createCameraInput(cameraManager, camreId);
          previewOutPut = createPreviewOutputFromProfile(cameraManager, previewOutPutProfile!);
          await openCamera(cameraInput);
          session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);

          await addInputIntoSession(session, cameraInput);
          await addOutputIntoSession(session, previewOutPut);
          await addOutputIntoSession(session, photoOutput);
          await commitSessionConfig(session);
          setImageColorSpace(session, true);
          onPreviewOutputFrameStart(previewOutPut!);
          await startSession(session);
          await waitPreviewOutputFrameStart(previewOutPut!);
          console.info(`${testNum} frameStart success`);
          setFocusMode(session);

          let zoomRatio: number;
          let findZoomRatioRange: boolean;
          let zoomRatioRange = getSuppotredZoomRatioRange(session);
          if (zoomRatioRange != undefined && zoomRatioRange.length == 3) {
            findZoomRatioRange = true
            zoomRatio = zoomRatioRange[testZoomRatioRange];
            setZoomRatioRange(session, zoomRatioRange!, zoomRatio, testCameraId);
          } else {
            findZoomRatioRange = false
            zoomRatio = 1
          }
          let newTitle: string = await generateNameForAsset(camera.SceneMode.NORMAL_PHOTO, camreId, photoOutputProfile, previewOutPutProfile, zoomRatio)
          console.info(`${testNum} findZoomRatioRange is ${findZoomRatioRange} zoomRatio is ${zoomRatio} newTitle is ${newTitle}`);
          //测试过程
          onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
          onCaptureReady(photoOutput);
          await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum, newTitle);
          capturePhotoTotalNum++;
          console.info(`${testNum} capturePhotoNum is ${capturePhotoTotalNum}`);
          await sleep(3000);
          offPhotoOutputPhotoAssetAvailable(photoOutput);
          
          //恢复过程
          offCaptureReady(photoOutput);
          offPreviewOutputFrameStart(previewOutPut!);
          await stopSession(session);
          console.info(`${testNum} stopSession is finish`);
          await releaseInPutStream(cameraInput);
          await releaseOutPutStream(previewOutPut)
          await releaseOutPutStream(photoOutput)
          await releaseSession(session)
          await sleep(500);
        } catch (error) {
          if (previewOutPut != undefined) {
            offPreviewOutputFrameStart(previewOutPut!);
          }
          if (photoOutput != undefined) {
            offCaptureReady(photoOutput);
          }
          await stopSession(session);
          await releaseInPutStream(cameraInput);
          await releaseOutPutStream(previewOutPut)
          await releaseOutPutStream(photoOutput)
          await releaseSession(session)
          console.error(`${testNum} error is ${JSON.stringify(error)}`)
          expect().assertFail();
        }
      }
    }
    const afterPhotoTotalNum = await getAllPhotoAssetsCount();
    console.info(`beforeNum is ${beforePhotoTotalNum}, captureNum is ${capturePhotoTotalNum}, afterNum is ${afterPhotoTotalNum}`);
    if (beforePhotoTotalNum + capturePhotoTotalNum != afterPhotoTotalNum) {
      expect().assertFail();
    }
    await sleep(500);
    await helperInstance.release();
    return true;
  } catch (error) {
    console.error(`${testNum} error is ${JSON.stringify(error)}`)
    expect().assertFail();
    return false;
  }
}

export default function CameraCapturePhotosWithMultiDiffConfig() {
  describe('CameraCapturePhotosWithMultiDiffConfig', () => {
    console.info('---------------CameraCapturePhotosWithMultiDiffConfig begin---------------')
    beforeAll(async () => {
      console.info('beforeAll case');
    })
    beforeEach(() => {
      console.info('afterEach case');
    })
    afterEach(async () => {
      console.info('afterAll case');
    })
    afterAll(() => {
      console.info('afterAll case');
    })
    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0100
     * @tc.name SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0100
     * @tc.desc camera capture 1 dynamic photo with multi Different config
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0100'
      let ret = await cameraCapturePhotosTest(testNum, 0, 0);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0200
     * @tc.name SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0200
     * @tc.desc camera capture 1 dynamic photo with multi Different config
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0200'
      let ret = await cameraCapturePhotosTest(testNum, 0, 1);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0300
     * @tc.name SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0300
     * @tc.desc camera capture 1 dynamic photo with multi Different config
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0300'
      let ret = await cameraCapturePhotosTest(testNum, 0, 2);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0400
     * @tc.name SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0400
     * @tc.desc camera capture 1 dynamic photo with multi Different config
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0400'
      let ret = await cameraCapturePhotosTest(testNum, 1, 0);
      expect(ret).assertTrue();
      done();
    })

/**
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0500
     * @tc.name SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0500
     * @tc.desc camera capture 1 dynamic photo with multi Different config
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0500'
      let ret = await cameraCapturePhotosTest(testNum, 1, 1);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0600
     * @tc.name SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0600
     * @tc.desc camera capture 1 dynamic photo with multi Different config
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_CAPTURE_DYNAMIC_PHOTO_MULTI_CONFIG_0600'
      let ret = await cameraCapturePhotosTest(testNum, 1, 2);
      expect(ret).assertTrue();
      done();
    })
  })
}
