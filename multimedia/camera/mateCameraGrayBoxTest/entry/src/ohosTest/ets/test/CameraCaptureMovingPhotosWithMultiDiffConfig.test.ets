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
  getPhotoOutputFromProfile,
  createPreviewOutputFromProfile,
  setImageColorSpace,
  createFile,
  writeFile,
  readFile,
  waitForStatus,
  enableMovingPhoto,
  expectEqualMovingPhotoVideoNum,
  getMovingPhotoVideoNum,
  IsexistMovingPhotoVideo,
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


export default function CameraCaptureMovingPhotosWithMultiDiffConfig() {
  describe('CameraCaptureMovingPhotosWithMultiDiffConfig', () => {
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
      // Presets a clear action, which is performed after e ach unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_DYNAMIC_PHOTO_WITH_MULTI_CONFIG_0000
     * @tc.name      : camera_capture_dynamic_photo_with_multi_config_0000
     * @tc.desc      : camera capture 1 dynamic photo with multi Different config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //相机在不同摄像头、不同照片格式、不同分辨率、不同焦距下拍摄1张动态照片
    it('camera_capture_dynamic_photo_with_multi_config_0001', 0, async (done: Function) => {
      let testNum = 'camera_capture_dynamic_photo_with_multi_config_0001'
      try {
        //预制条件
        let capturePhotoNum = 1;
        await getPermission();

        createFile()
        // 先等待测试数据下发完成
        await waitForStatus("1");
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        // // 读取测试数据
        let testData = await readFile();
        console.info("testData is: " + JSON.stringify(testData))
        let caseInfo: CaseInfo = JSON.parse(testData)
        let cameraId: camera.CameraDevice = caseInfo.cameraId
        let photoOutputProfile: camera.Profile = caseInfo.photoOutputProfile
        let previewOutPutProfile: camera.Profile = caseInfo.previewOutputProfile
        let isHdrImage: boolean = caseInfo.isHdr

        // let cameras = getSupportedCameras(cameraManager);
        // console.log("error is getSupportedCameras(cameraManager) is "+JSON.stringify(cameras))
        // let cameraId = getSupportedCameras(cameraManager)[0]
        // let photoOutputProfile: camera.Profile =  {'format': 2000, 'size': {'width': 640, 'height': 480}}
        // let previewOutPutProfile: camera.Profile = {'format': 2001, 'size': {'width': 480, 'height': 480}}
        // let isHdrImage: boolean = false

        let fileNames: Array<string> = [];
        let photoOutput: camera.PhotoOutput | undefined = undefined
        let cameraInput: camera.CameraInput | undefined = undefined
        let previewOutPut: camera.PreviewOutput | undefined = undefined
        let session: ESObject = undefined
        photoOutput = getPhotoOutputFromProfile(cameraManager, photoOutputProfile)
        cameraInput = createCameraInput(cameraManager, cameraId);
        previewOutPut = createPreviewOutputFromProfile(cameraManager, previewOutPutProfile!);
        await openCamera(cameraInput);
        session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
        await addInputIntoSession(session, cameraInput);
        await addOutputIntoSession(session, previewOutPut);
        await addOutputIntoSession(session, photoOutput);
        await commitSessionConfig(session);
        setImageColorSpace(session, isHdrImage)
        await startSession(session);
        enableMovingPhoto(photoOutput)
        setFocusMode(session);
        await onPreviewOutputFrameStart(previewOutPut!);
        let zoomRatioRange = getSuppotredZoomRatioRange(session);
        onCaptureReady(photoOutput);
        for (let zoomRatio of zoomRatioRange!) {
          const befortCount = await getAllPhotoAssetsCount();
          setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
          //测试过程
          onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
          await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
          let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
          await expectEqualPhotoCount(befortCount, capturePhotoNum);
          if (globalThis.isSupportMovingPhoto) {
            await IsexistMovingPhotoVideo(assets);
          }
        }
        //恢复过程
        offCaptureReady(photoOutput);
        await sleep(2000)
        offPreviewOutputFrameStart(previewOutPut!);
        stopSession(session);
        releaseInPutStream(cameraInput);
        releaseOutPutStream(previewOutPut)
        releaseOutPutStream(photoOutput)
        releaseSession(session)
        await helperInstance.release();
        done();
      } catch (error) {
        console.error(`${testNum} error is ${error}`)
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
      console.info("error is cameras is "+ JSON.stringify(cameras))
      for (let cameraId of cameras) {
        let cameraInfo: CameraInfo = {
          camera: cameraId,
          capability: []
        }
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, cameraId, camera.SceneMode.NORMAL_PHOTO)
        console.info("cameraOutputCapability is "+JSON.stringify(cameraOutputCapability));
          // console.info("error is cameraOutputCapability is "+ JSON.stringify(cameraOutputCapability))
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
