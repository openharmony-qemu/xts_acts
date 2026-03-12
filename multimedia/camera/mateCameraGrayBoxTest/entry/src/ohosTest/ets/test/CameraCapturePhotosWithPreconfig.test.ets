import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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
  expectEqualPhotoCount,
  getAllPhotoAssetsCount,
  getPhotoOutput, //add new api
  getPreviewOutput,
  isSupportedSceneMode,
  onPhotoOutputPhotoAvailable,
  offPhotoOutputPhotoAvailable,
  beginConfigSession,
  createSession,
  isSupportPreconfig,
  setPreconfig,
  onPreviewOutputFrameStart,
  offPreviewOutputFrameStart,
  enableMovingPhoto,
  getMovingPhotoVideoNum,
  expectEqualMovingPhotoVideoNum
} from './CameraCommonAPI'
import { camera } from '@kit.CameraKit';


export default function CameraCapturePhotosWithPreconfig() {
  describe('CameraCapturePhotosWithPreconfig', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(2000);
      // Presets a clear action, which is performed after e ach unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0000
     * @tc.name      : camera_capture_photo_with_preconfig_0000
     * @tc.desc      : camera capture 1 photo with preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //无profile无surfaceId使用不同preconfig拍摄1张照片,addphotoOut前onPhotoAssetAvailable
    it('camera_capture_photo_with_preconfig_0000', 0, async (done: Function) => {
      try {
        //预制条件
        let capturePhotoNum = 1;
        let testNum = 'camera_capture_photo_with_preconfig_0000'
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let PreconfigTypeArr = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P,
          camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let PreconfigRatioArr = [camera.PreconfigRatio.PRECONFIG_RATIO_1_1, camera.PreconfigRatio.PRECONFIG_RATIO_4_3,
          camera.PreconfigRatio.PRECONFIG_RATIO_16_9];
        console.log("error is cameras is ");
        for (let cameradevice of cameras) {
          for (let preconfigType of PreconfigTypeArr) {
            for (let preconfigRatio of PreconfigRatioArr) {
              globalThis.isCaptureReady = true;
              let originalVideoNum = await getMovingPhotoVideoNum();
              let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              let issupport = isSupportPreconfig(session, preconfigType, preconfigRatio);
              if (!issupport) {
                console.info("error is preconfigType is " + preconfigType)
                console.info("error is preconfigRatio is " + preconfigRatio)
                releaseSession(session)
                continue;
              }
              console.info("error is  cameraid is " + cameradevice.cameraId);
              console.info("error is support preconfigType is " + preconfigType);
              console.info("error is support preconfigRatio is " + preconfigRatio);
              setPreconfig(session, preconfigType, preconfigRatio);
              const befortCount = await getAllPhotoAssetsCount();
              let photoOutput = getPhotoOutput(cameraManager);
              let cameraInput = createCameraInput(cameraManager, cameradevice);
              let previewOutPut = getPreviewOutput(cameraManager);
              await openCamera(cameraInput);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
              await addOutputIntoSession(session, photoOutput);
              await commitSessionConfig(session);
              await startSession(session);
              enableMovingPhoto(photoOutput);
              setFocusMode(session);
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              setZoomRatioRange(session, zoomRatioRange!, 1);
              await onPreviewOutputFrameStart(previewOutPut!);

              //测试过程
              onCaptureReady(photoOutput);
              await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
              offCaptureReady(photoOutput);
              let fileNames = [];
              let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
              await expectEqualPhotoCount(befortCount, capturePhotoNum);
              await expectEqualMovingPhotoVideoNum(originalVideoNum, capturePhotoNum);
              await sleep(2000);
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              releaseSession(session)
            }
          }
        }

        //恢复过程
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0001
     * @tc.name      : CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0001
     * @tc.desc      : camera capture 1 photo with preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //无profile无surfaceId使用preconfig拍摄1张照片,addphotoOut后onPhotoAssetAvailable
    it('CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0001', 0, async (done: Function) => {
      try {
        //预制条件
        let capturePhotoNum = 1;
        let testNum = 'camera_capture_photo_with_preconfig_0001'
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let PreconfigTypeArr = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P,
          camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let PreconfigRatioArr = [camera.PreconfigRatio.PRECONFIG_RATIO_1_1, camera.PreconfigRatio.PRECONFIG_RATIO_4_3,
          camera.PreconfigRatio.PRECONFIG_RATIO_16_9];
        for (let cameradevice of cameras) {
          for (let preconfigType of PreconfigTypeArr) {
            for (let preconfigRatio of PreconfigRatioArr) {
              let originalVideoNum = await getMovingPhotoVideoNum();
              globalThis.isCaptureReady = true;
              let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              let issupport = isSupportPreconfig(session, preconfigType, preconfigRatio);
              if (!issupport) {
                console.info("error is preconfigType is " + preconfigType)
                console.info("error is preconfigRatio is " + preconfigRatio)
                releaseSession(session)
                continue;
              }
              setPreconfig(session, preconfigType, preconfigRatio);
              const befortCount = await getAllPhotoAssetsCount();
              let photoOutput = getPhotoOutput(cameraManager);
              let cameraInput = createCameraInput(cameraManager, cameradevice);
              let previewOutPut = getPreviewOutput(cameraManager);
              await openCamera(cameraInput);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              await addOutputIntoSession(session, photoOutput);
              onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
              await commitSessionConfig(session);
              await startSession(session);
              enableMovingPhoto(photoOutput);
              setFocusMode(session);
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              setZoomRatioRange(session, zoomRatioRange!, 1);
              await onPreviewOutputFrameStart(previewOutPut!);

              //测试过程
              onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
              onCaptureReady(photoOutput);
              await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
              offCaptureReady(photoOutput);
              let fileNames = [];
              let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
              await expectEqualPhotoCount(befortCount, capturePhotoNum);
              await expectEqualMovingPhotoVideoNum(originalVideoNum, capturePhotoNum);
              await sleep(2000);
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              releaseSession(session)
            }
          }
        }

        //恢复过程
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0002
     * @tc.name      : camera_capture_photo_with_preconfig_0002
     * @tc.desc      : camera capture 1 photo with preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //无profile无surfaceId使用不同preconfig拍摄1张照片,commitconfig后onPhotoAssetAvailable
    it('CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0002', 0, async (done: Function) => {
      try {
        //预制条件
        let capturePhotoNum = 1;
        let testNum = 'CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0002'
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let PreconfigTypeArr = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P,
          camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let PreconfigRatioArr = [camera.PreconfigRatio.PRECONFIG_RATIO_1_1, camera.PreconfigRatio.PRECONFIG_RATIO_4_3,
          camera.PreconfigRatio.PRECONFIG_RATIO_16_9];
        for (let cameradevice of cameras) {
          for (let preconfigType of PreconfigTypeArr) {
            for (let preconfigRatio of PreconfigRatioArr) {
              let originalVideoNum = await getMovingPhotoVideoNum();
              globalThis.isCaptureReady = true;
              let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              let issupport = isSupportPreconfig(session, preconfigType, preconfigRatio);
              if (!issupport) {
                console.info("error is preconfigType is " + preconfigType)
                console.info("error is preconfigRatio is " + preconfigRatio)
                releaseSession(session)
                continue;
              }
              setPreconfig(session, preconfigType, preconfigRatio);
              const befortCount = await getAllPhotoAssetsCount();
              let photoOutput = getPhotoOutput(cameraManager);
              let cameraInput = createCameraInput(cameraManager, cameradevice);
              let previewOutPut = getPreviewOutput(cameraManager);
              await openCamera(cameraInput);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              await addOutputIntoSession(session, photoOutput);
              await commitSessionConfig(session);
              await startSession(session);
              enableMovingPhoto(photoOutput);
              setFocusMode(session);
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              setZoomRatioRange(session, zoomRatioRange!, 1);
              await onPreviewOutputFrameStart(previewOutPut!);

              //测试过程
              onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
              onCaptureReady(photoOutput);
              await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
              offCaptureReady(photoOutput);
              let fileNames = [];
              let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
              await expectEqualPhotoCount(befortCount, capturePhotoNum);
              await expectEqualMovingPhotoVideoNum(originalVideoNum, capturePhotoNum);
              await sleep(2000);
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              releaseSession(session)
            }
          }
        }

        //恢复过程
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0004
     * @tc.name      : camera_capture_photo_with_preconfig_0004
     * @tc.desc      : camera capture 1 photo with preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //无profile无surfaceId使用不同preconfig拍摄1张照片,addOutput前onPhotoAvailable
    it('CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0004', 0, async (done: Function) => {
      try {
        //预制条件
        let capturePhotoNum = 1;
        let testNum = 'CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0004'
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let PreconfigTypeArr = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P,
          camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let PreconfigRatioArr = [camera.PreconfigRatio.PRECONFIG_RATIO_1_1, camera.PreconfigRatio.PRECONFIG_RATIO_4_3,
          camera.PreconfigRatio.PRECONFIG_RATIO_16_9];
        for (let cameradevice of cameras) {
          for (let preconfigType of PreconfigTypeArr) {
            for (let preconfigRatio of PreconfigRatioArr) {
              globalThis.isCaptureReady = true;
              let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              let issupport = isSupportPreconfig(session, preconfigType, preconfigRatio);
              if (!issupport) {
                console.info("error is preconfigType is " + preconfigType)
                console.info("error is preconfigRatio is " + preconfigRatio)
                releaseSession(session)
                continue;
              }
              console.info("error is  cameraid is " + cameradevice.cameraId);
              console.info("error is support preconfigType is " + preconfigType);
              console.info("error is support preconfigRatio is " + preconfigRatio);
              setPreconfig(session, preconfigType, preconfigRatio);
              const befortCount = await getAllPhotoAssetsCount();
              let photoOutput = getPhotoOutput(cameraManager);
              let cameraInput = createCameraInput(cameraManager, cameradevice);
              let previewOutPut = getPreviewOutput(cameraManager);
              await openCamera(cameraInput);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              onPhotoOutputPhotoAvailable(photoOutput, helperInstance);
              await addOutputIntoSession(session, photoOutput);
              await commitSessionConfig(session);
              await startSession(session);
              enableMovingPhoto(photoOutput);
              setFocusMode(session);
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              setZoomRatioRange(session, zoomRatioRange!, 1);
              await onPreviewOutputFrameStart(previewOutPut!);

              //测试过程
              onCaptureReady(photoOutput);
              await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
              offCaptureReady(photoOutput);
              let fileNames = [];
              let assets = await offPhotoOutputPhotoAvailable(photoOutput, capturePhotoNum, fileNames, true)
              await expectEqualPhotoCount(befortCount, capturePhotoNum);

              //恢复过程
              await sleep(2000);
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              releaseSession(session)
            }
          }
        }

        //恢复过程
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0005
     * @tc.name      : camera_capture_photo_with_preconfig_0005
     * @tc.desc      : camera capture 1 photo with preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //无profile无surfaceId使用不同preconfig拍摄1张照片,addOutput后onPhotoAvailable
    it('CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0005', 0, async (done: Function) => {
      try {
        //预制条件
        let capturePhotoNum = 1;
        let testNum = 'CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0005'
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let PreconfigTypeArr = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P,
          camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let PreconfigRatioArr = [camera.PreconfigRatio.PRECONFIG_RATIO_1_1, camera.PreconfigRatio.PRECONFIG_RATIO_4_3,
          camera.PreconfigRatio.PRECONFIG_RATIO_16_9];
        for (let cameradevice of cameras) {
          for (let preconfigType of PreconfigTypeArr) {
            for (let preconfigRatio of PreconfigRatioArr) {
              globalThis.isCaptureReady = true;
              let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              let issupport = isSupportPreconfig(session, preconfigType, preconfigRatio);
              if (!issupport) {
                console.info("error is preconfigType is " + preconfigType)
                console.info("error is preconfigRatio is " + preconfigRatio)
                releaseSession(session)
                continue;
              }
              console.info("error is  cameraid is " + cameradevice.cameraId);
              console.info("error is support preconfigType is " + preconfigType);
              console.info("error is support preconfigRatio is " + preconfigRatio);
              setPreconfig(session, preconfigType, preconfigRatio);
              const befortCount = await getAllPhotoAssetsCount();
              let photoOutput = getPhotoOutput(cameraManager);
              let cameraInput = createCameraInput(cameraManager, cameradevice);
              let previewOutPut = getPreviewOutput(cameraManager);
              await openCamera(cameraInput);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              await addOutputIntoSession(session, photoOutput);
              onPhotoOutputPhotoAvailable(photoOutput, helperInstance);
              await commitSessionConfig(session);
              await startSession(session);
              enableMovingPhoto(photoOutput);
              setFocusMode(session);
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              setZoomRatioRange(session, zoomRatioRange!, 1);
              await onPreviewOutputFrameStart(previewOutPut!);

              //测试过程
              onCaptureReady(photoOutput);
              await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
              offCaptureReady(photoOutput);
              let fileNames = [];
              let assets = await offPhotoOutputPhotoAvailable(photoOutput, capturePhotoNum, fileNames, true)
              await expectEqualPhotoCount(befortCount, capturePhotoNum);

              //恢复过程
              await sleep(2000);
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              releaseSession(session)
            }
          }
        }

        //恢复过程
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0006
     * @tc.name      : camera_capture_photo_with_preconfig_0006
     * @tc.desc      : camera capture 1 photo with preconfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //无profile无surfaceId使用不同preconfig拍摄1张照片,commitconfig后onPhotoAvailable
    it('CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0006', 0, async (done: Function) => {
      try {
        //预制条件
        let capturePhotoNum = 1;
        let testNum = 'CAMERA_CAPTURE_PHOTO_WITH_PRECONFIG_0006'
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let PreconfigTypeArr = [camera.PreconfigType.PRECONFIG_720P, camera.PreconfigType.PRECONFIG_1080P,
          camera.PreconfigType.PRECONFIG_4K, camera.PreconfigType.PRECONFIG_HIGH_QUALITY];
        let PreconfigRatioArr = [camera.PreconfigRatio.PRECONFIG_RATIO_1_1, camera.PreconfigRatio.PRECONFIG_RATIO_4_3,
          camera.PreconfigRatio.PRECONFIG_RATIO_16_9];
        for (let cameradevice of cameras) {
          for (let preconfigType of PreconfigTypeArr) {
            for (let preconfigRatio of PreconfigRatioArr) {
              globalThis.isCaptureReady = true;
              let session: ESObject = createSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              let issupport = isSupportPreconfig(session, preconfigType, preconfigRatio);
              if (!issupport) {
                console.info("error is preconfigType is " + preconfigType)
                console.info("error is preconfigRatio is " + preconfigRatio)
                releaseSession(session)
                continue;
              }
              console.info("error is  cameraid is " + cameradevice.cameraId);
              console.info("error is support preconfigType is " + preconfigType);
              console.info("error is support preconfigRatio is " + preconfigRatio);
              setPreconfig(session, preconfigType, preconfigRatio);
              beginConfigSession(session);
              const befortCount = await getAllPhotoAssetsCount();
              let photoOutput = getPhotoOutput(cameraManager);
              let cameraInput = createCameraInput(cameraManager, cameradevice);
              let previewOutPut = getPreviewOutput(cameraManager);
              await openCamera(cameraInput);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              await addOutputIntoSession(session, photoOutput);
              await commitSessionConfig(session);
              await startSession(session);
              enableMovingPhoto(photoOutput);
              setFocusMode(session);
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              setZoomRatioRange(session, zoomRatioRange!, 1);
              await onPreviewOutputFrameStart(previewOutPut!);

              //测试过程
              onPhotoOutputPhotoAvailable(photoOutput, helperInstance);
              onCaptureReady(photoOutput);
              await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
              offCaptureReady(photoOutput);
              let fileNames = [];
              let assets = await offPhotoOutputPhotoAvailable(photoOutput, capturePhotoNum, fileNames, true)
              await expectEqualPhotoCount(befortCount, capturePhotoNum);

              //恢复过程
              await sleep(2000);
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              releaseSession(session)
            }
          }
        }

        //恢复过程
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })
  })
}
