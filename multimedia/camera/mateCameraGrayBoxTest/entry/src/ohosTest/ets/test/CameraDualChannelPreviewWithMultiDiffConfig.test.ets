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
  onImageArrival,
  offImageArrival,
  enableMovingPhoto,
  createPreviewOutputBySurfaceId,
  createPreviewOutputFromProfile,
  onPreviewImageArrival,
  awaitingImageCapture,
  getPreviewImageReceiver,
  writeFile,
  waitForStatus,
  readFile,
  createFile
} from './CameraCommonAPI'
import { camera } from '@kit.CameraKit';


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
  photoOutputProfile: camera.Profile,
  previewOutputProfile: camera.Profile,
  isHdr: boolean,
}

export default function CameraDualChannelPreviewWithMultiDiffConfig() {
  describe('CameraDualChannelPreviewWithMultiDiffConfig', () => {
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
     * @tc.number    : CAMERA_DUAL_CHANNEL_PREVIEW_WITH_MULTI_DIFF_PROFILE_0100
     * @tc.name      : camera_dual_channel_preview_with_multi_diff_profile_0100
     * @tc.desc      : camera dual-channel preview with multi diff profile
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('camera_dual_channel_preview_with_multi_diff_profile_0100', 0, async (done: Function) => {
      try {
        let testNum = 'camera_dual_channel_preview_with_multi_diff_profile_0100'
        //预制条件
        let capturePhotoNum = 5;
        await getPermission();
        createFile()
        // 先等待测试数据下发完成
        await waitForStatus("1");
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        // 读取测试数据
        let testData = await readFile();
        console.info("testData is: " + JSON.stringify(testData))
        let caseInfo: CaseInfo = JSON.parse(testData)
        let cameraId: camera.CameraDevice = caseInfo.cameraId
        let previewOutPutProfile: camera.Profile = caseInfo.previewOutputProfile
        // let cameraId = getSupportedCameras(cameraManager)[0]
        // let photoOutputProfile: camera.Profile =  {'format': 2000, 'size': {'width': 640, 'height': 480}}
        // let previewOutPutProfile: camera.Profile = {'format': 1003, 'size': {'width': 640, 'height': 480}}

        let cameraInput: camera.CameraInput | undefined = undefined
        let previewOutPut: camera.PreviewOutput | undefined = undefined
        let session: ESObject = undefined
        const befortCount = await getAllPhotoAssetsCount();
        globalThis.isCaptureReady = true;
        let ImageReceiver = getPreviewImageReceiver(previewOutPutProfile);
        let ReceiverPreviewOutPut = await createPreviewOutputBySurfaceId(cameraManager, previewOutPutProfile,
                helperInstance,
                ImageReceiver);
        onPreviewImageArrival(ImageReceiver!, capturePhotoNum, befortCount);
        cameraInput = createCameraInput(cameraManager, cameraId);
        previewOutPut = createPreviewOutputFromProfile(cameraManager, previewOutPutProfile);
        await openCamera(cameraInput);
        session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
        await addInputIntoSession(session, cameraInput);
        await addOutputIntoSession(session, previewOutPut);
        await addOutputIntoSession(session, ReceiverPreviewOutPut);
        await commitSessionConfig(session);
        await startSession(session);
        setFocusMode(session);
        let zoomRatioRange = getSuppotredZoomRatioRange(session);
        setZoomRatioRange(session, zoomRatioRange!, 1);
        await onPreviewOutputFrameStart(previewOutPut!);
        //测试过程
        await awaitingImageCapture(capturePhotoNum);
        await offImageArrival(ImageReceiver!, capturePhotoNum);

        //恢复过程
        await sleep(3000);
        offPreviewOutputFrameStart(previewOutPut!);
        stopSession(session);
        releaseInPutStream(cameraInput);
        releaseOutPutStream(previewOutPut)
        releaseOutPutStream(ReceiverPreviewOutPut)
        releaseSession(session)
        await helperInstance.release();
        done();
      } catch (error) {
        console.info('before writeFailToFile, error is ' + JSON.stringify(error))
        expect(true).assertFail();
        done();
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
    it('GET_TEST_DATA', 4, async (done: Function) => {
      let data: Array<CameraInfo> = []
      await getPermission();
      let cameraManager = await getCameraManager();
      let cameras = getSupportedCameras(cameraManager);
      for (let cameraId of cameras) {
        let cameraInfo: CameraInfo = {
          camera: cameraId,
          capability: []
        }
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, cameraId, camera.SceneMode.NORMAL_PHOTO)
        cameraInfo.capability?.push({
          mode: camera.SceneMode.NORMAL_PHOTO,
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
