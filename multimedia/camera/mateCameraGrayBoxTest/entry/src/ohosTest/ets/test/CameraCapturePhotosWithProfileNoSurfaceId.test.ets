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
  onPreviewOutputFrameStart,
  offPreviewOutputFrameStart,
  expectEqualPhotoCount,
  getAllPhotoAssetsCount,
  offPhotoOutputPhotoAvailable,
  onPhotoOutputPhotoAvailable,
  getPhotoOutputWithRatio,
  createPreviewOutput,
  enableMovingPhoto,
  getMovingPhotoVideoNum,
  expectEqualMovingPhotoVideoNum
} from './CameraCommonAPI'
import { camera } from '@kit.CameraKit';


export default function CameraCapturePhotosWithProfileNoSurfaceId() {
  describe('CameraCapturePhotosWithProfileNoSurfaceId', () => {
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
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PROFILE_NO_SURFACEID_0100
     * @tc.name      : camera_capture_photo_with_profile_no_surfaceId_0100
     * @tc.desc      : camera capture 10 photo profile no surfaceid and enabled onPhotoAssetAvailable before addphotoOut
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //有profile无surfaceId拍摄10张照片，,addphotoOut前onPhotoAssetAvailable
    it('camera_capture_photo_with_profile_no_surfaceId_0100', 0, async (done: Function) => {
      try {
        let testNum = 'camera_capture_photo_with_profile_no_surfaceId_0100'
        //预制条件
        let capturePhotoNum = 10;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let cameradevice of cameras) {
          const befortCount = await getAllPhotoAssetsCount();
          let originalVideoNum = await getMovingPhotoVideoNum();
          globalThis.isCaptureReady = true;
          let cameraOutputCapability =
            getCameraOutputCapability(cameraManager, cameradevice, camera.SceneMode.NORMAL_PHOTO)
          let photoOutput = getPhotoOutputWithRatio(cameraManager, cameraOutputCapability!,
            camera.CameraFormat.CAMERA_FORMAT_JPEG);
          let cameraInput = createCameraInput(cameraManager, cameradevice);
          let previewOutPut = createPreviewOutput(cameraManager, cameraOutputCapability!);
          await openCamera(cameraInput);
          let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
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

          //恢复过程
          await sleep(3000);
          offPreviewOutputFrameStart(previewOutPut!);
          stopSession(session);
          releaseInPutStream(cameraInput);
          releaseOutPutStream(previewOutPut)
          releaseOutPutStream(photoOutput)
          releaseSession(session)
        }
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PROFILE_NO_SURFACEID_0200
     * @tc.name      : camera_capture_photo_with_profile_no_surfaceId_0200
     * @tc.desc      : camera capture 10 photo profile no surfaceid and After addphotoOut enabled onPhotoAssetAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //有profile无surfaceId拍摄10张照片，,addphotoOut后onPhotoAssetAvailable
    it('camera_capture_photo_with_profile_no_surfaceId_0200', 0, async (done: Function) => {
      try {
        let testNum = 'camera_capture_photo_with_profile_no_surfaceId_0200'
        //预制条件
        let capturePhotoNum = 10;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let cameradevice of cameras) {
          const befortCount = await getAllPhotoAssetsCount();
          let originalVideoNum = await getMovingPhotoVideoNum();
          globalThis.isCaptureReady = true;
          let cameraOutputCapability =
            getCameraOutputCapability(cameraManager, cameradevice, camera.SceneMode.NORMAL_PHOTO)
          let photoOutput = getPhotoOutputWithRatio(cameraManager, cameraOutputCapability!,
            camera.CameraFormat.CAMERA_FORMAT_JPEG)
          let cameraInput = createCameraInput(cameraManager, cameradevice);
          let previewOutPut = createPreviewOutput(cameraManager, cameraOutputCapability!);
          await openCamera(cameraInput);
          let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
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
          onCaptureReady(photoOutput);
          await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
          offCaptureReady(photoOutput);
          let fileNames = [];
          let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
          await expectEqualPhotoCount(befortCount, capturePhotoNum);
          await expectEqualMovingPhotoVideoNum(originalVideoNum, capturePhotoNum);

          //恢复过程
          await sleep(3000);
          offPreviewOutputFrameStart(previewOutPut!);
          stopSession(session);
          releaseInPutStream(cameraInput);
          releaseOutPutStream(previewOutPut)
          releaseOutPutStream(photoOutput)
          releaseSession(session)
        }
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PROFILE_NO_SURFACEID_0300
     * @tc.name      : camera_capture_photo_with_profile_no_surfaceId_0300
     * @tc.desc      : camera capture 10 photo with profile no surfaceid and After commitconfig enabled onPhotoAssetAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //有profile无surfaceId拍摄10张照片，,commitconfig后onPhotoAssetAvailable
    it('camera_capture_photo_with_profile_no_surfaceId_0300', 0, async (done: Function) => {
      try {
        let testNum = 'camera_capture_photo_with_profile_no_surfaceId_0300'
        //预制条件
        let capturePhotoNum = 10;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let cameradevice of cameras) {
          const befortCount = await getAllPhotoAssetsCount();
          let originalVideoNum = await getMovingPhotoVideoNum();
          globalThis.isCaptureReady = true;
          let cameraOutputCapability =
            getCameraOutputCapability(cameraManager, cameradevice, camera.SceneMode.NORMAL_PHOTO)
          let photoOutput = getPhotoOutputWithRatio(cameraManager, cameraOutputCapability!,
            camera.CameraFormat.CAMERA_FORMAT_JPEG)
          let cameraInput = createCameraInput(cameraManager, cameradevice);
          let previewOutPut = createPreviewOutput(cameraManager, cameraOutputCapability!);
          await openCamera(cameraInput);
          let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
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

          //恢复过程
          await sleep(3000);
          offPreviewOutputFrameStart(previewOutPut!);
          stopSession(session);
          releaseInPutStream(cameraInput);
          releaseOutPutStream(previewOutPut)
          releaseOutPutStream(photoOutput)
          releaseSession(session)
        }
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PROFILE_NO_SURFACEID_0400
     * @tc.name      : camera_capture_photo_with_profile_no_surfaceId_0400
     * @tc.desc      : camera capture 10 photo profile no surfaceid and enabled onPhotoAvailable before addphotoOut
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //有profile无surfaceId拍摄10张照片，,addphotoOut前onPhotoAvailable
    it('camera_capture_photo_with_profile_no_surfaceId_0400', 0, async (done: Function) => {
      try {
        let testNum = 'camera_capture_photo_with_profile_no_surfaceId_0400'
        //预制条件
        let capturePhotoNum = 10;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let cameradevice of cameras) {
          const befortCount = await getAllPhotoAssetsCount();
          globalThis.isCaptureReady = true;
          let cameraOutputCapability =
            getCameraOutputCapability(cameraManager, cameradevice, camera.SceneMode.NORMAL_PHOTO)
          let photoOutput = getPhotoOutputWithRatio(cameraManager, cameraOutputCapability!,
            camera.CameraFormat.CAMERA_FORMAT_JPEG)
          let cameraInput = createCameraInput(cameraManager, cameradevice);
          let previewOutPut = createPreviewOutput(cameraManager, cameraOutputCapability!);
          await openCamera(cameraInput);
          let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
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
          await sleep(3000);
          offPreviewOutputFrameStart(previewOutPut!);
          stopSession(session);
          releaseInPutStream(cameraInput);
          releaseOutPutStream(previewOutPut)
          releaseOutPutStream(photoOutput)
          releaseSession(session)
        }
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PROFILE_NO_SURFACEID_0500
     * @tc.name      : camera_capture_photo_with_profile_no_surfaceId_0500
     * @tc.desc      : camera capture 10 photo with profile no surfaceid and After addphotoOut enabled onPhotoAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //有profile无surfaceId拍摄10张照片，,addphotoOut后onPhotoAvailable
    it('camera_capture_photo_with_profile_no_surfaceId_0500', 0, async (done: Function) => {
      try {
        let testNum = 'camera_capture_photo_with_profile_no_surfaceId_0500'
        //预制条件
        let capturePhotoNum = 10;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let cameradevice of cameras) {
          const befortCount = await getAllPhotoAssetsCount();
          globalThis.isCaptureReady = true;
          let cameraOutputCapability =
            getCameraOutputCapability(cameraManager, cameradevice, camera.SceneMode.NORMAL_PHOTO)
          let photoOutput = getPhotoOutputWithRatio(cameraManager, cameraOutputCapability!,
            camera.CameraFormat.CAMERA_FORMAT_JPEG)
          let cameraInput = createCameraInput(cameraManager, cameradevice);
          let previewOutPut = createPreviewOutput(cameraManager, cameraOutputCapability!);
          await openCamera(cameraInput);
          let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
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
          await sleep(3000);
          offPreviewOutputFrameStart(previewOutPut!);
          stopSession(session);
          releaseInPutStream(cameraInput);
          releaseOutPutStream(previewOutPut)
          releaseOutPutStream(photoOutput)
          releaseSession(session)
        }
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_PHOTO_WITH_PROFILE_NO_SURFACEID_0600
     * @tc.name      : camera_capture_photo_with_profile_no_surfaceId_0600
     * @tc.desc      : camera capture 10 photo with profile no surfaceid and After commitconfig enabled onPhotoAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //有profile无surfaceId拍摄10张照片，,commitconfig后onPhotoAvailable
    it('camera_capture_photo_with_profile_no_surfaceId_0600', 0, async (done: Function) => {
      try {
        let testNum = 'camera_capture_photo_with_profile_no_surfaceId_0600'
        //预制条件
        let capturePhotoNum = 10;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let cameradevice of cameras) {
          const befortCount = await getAllPhotoAssetsCount();
          globalThis.isCaptureReady = true;
          let cameraOutputCapability =
            getCameraOutputCapability(cameraManager, cameradevice, camera.SceneMode.NORMAL_PHOTO)
          let photoOutput = getPhotoOutputWithRatio(cameraManager, cameraOutputCapability!,
            camera.CameraFormat.CAMERA_FORMAT_JPEG)
          let cameraInput = createCameraInput(cameraManager, cameradevice);
          let previewOutPut = createPreviewOutput(cameraManager, cameraOutputCapability!);
          await openCamera(cameraInput);
          let session: ESObject = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
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
          await sleep(3000);
          offPreviewOutputFrameStart(previewOutPut!);
          stopSession(session);
          releaseInPutStream(cameraInput);
          releaseOutPutStream(previewOutPut)
          releaseOutPutStream(photoOutput)
          releaseSession(session)
        }
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
