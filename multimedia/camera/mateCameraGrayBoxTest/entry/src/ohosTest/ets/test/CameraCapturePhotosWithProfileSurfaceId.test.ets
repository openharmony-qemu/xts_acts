import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  addInputIntoSession,
  addOutputIntoSession,
  commitSessionConfig,
  createAndConfigSession,
  createCameraInput,
  createPreviewOutput,
  getCameraManager,
  getCameraOutputCapability,
  getPermission,
  getPhotoOutputWithRatio,
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
  offPhotoOutputPhotoAvailable,
  onPhotoOutputPhotoAvailable,
  getPhotoOutputBySurfaceId,
  onPreviewOutputFrameStart,
  offPreviewOutputFrameStart,
  getImageReceiver,
  onImageArrival,
  offImageArrival,
  enableMovingPhoto
} from './CameraCommonAPI'
import { camera } from '@kit.CameraKit';


export default function CameraCapturePhotosWithProfileSurfaceId() {
  describe('CameraCapturePhotosWithProfileSurfaceId', () => {
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
    it('camera_capture_photo_with_profile_surfaceId_0100', 0, async (done: Function) => {
      try {
        let testNum = 'camera_capture_photo_with_profile_surfaceId_0100'
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
          let ImageReceiver = await getImageReceiver(cameraOutputCapability!.photoProfiles[0]);
          onImageArrival(ImageReceiver!);
          let photoOutput =
            await getPhotoOutputBySurfaceId(cameraManager, cameraOutputCapability!.photoProfiles[0], helperInstance,
              ImageReceiver);
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
          onCaptureReady(photoOutput);
          await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
          offCaptureReady(photoOutput);
          await offImageArrival(ImageReceiver!, capturePhotoNum);
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
