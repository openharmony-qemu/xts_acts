import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  sleep,
  addInputIntoSession,
  addOutputIntoSession,
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
  stopSession,
  getPhotoOutputFromProfile,
  createPreviewOutputFromProfile,
  getHelper,
  commitSessionConfig,
  startSession,
  onPreviewOutputFrameStart,
  onCaptureReady,
  offCaptureReady,
  offPreviewOutputFrameStart,
  createAvRecorder,
  setAvRecorderConfig,
  getVideoOutput,
  createVideoFile,
  createVideoPreviewOutputFromProFile,
  getMemOfProcess,
} from './CameraCommonAPI'
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';


export default function CameraMacroStatusChangeTest() {
  describe('CameraMacroStatusChangeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermission();
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_JS_PHOTO_MACRO_STATUS_STABILITY_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_JS_PHOTO_MACRO_STATUS_STABILITY_0100
     * @tc.desc      : capture mode repeated register and unregister on macroStatusChanged
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // 拍照模式反复注册和注销超级微距状态上报
    it('camera_photo_session_on_macro_status_change', Level.LEVEL0, async (done: Function) => {
      let testNum = 'camera_photo_session_on_macro_status_change'
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let cameraId: camera.CameraDevice = cameras[0]
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, cameraId, camera.SceneMode.NORMAL_PHOTO)
        let photoOutputProfile = cameraOutputCapability?.photoProfiles[0]
        let previewOutPutProfile = cameraOutputCapability?.previewProfiles[0]
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
        await startSession(session);
        await onPreviewOutputFrameStart(previewOutPut!);
        onCaptureReady(photoOutput);

        //--------------------------------------------测试过程------------------------------------------------------
        let pssStart = await getMemOfProcess()
        let num = 1
        while (num <= 100) {
          console.info(`the ${num}/100 times photoSession on/off macroStatusChanged`)
          session.on('macroStatusChanged', (err: BusinessError, status: boolean): void => {
            console.info(`on, macroStatusChanged:  ${status}`);
          });
          await sleep(100)
          session.off('macroStatusChanged', (err: BusinessError, status: boolean): void => {
            console.info(`off, macroStatusChanged:  ${status}`);
          });
          num = num + 1
        }
        console.info("wait 60s for resource release")
        await sleep(60000)
        // 检查内存泄露
        let pssEnd = await getMemOfProcess()
        console.info(`test before mem: ${pssStart}, test after mem: ${pssEnd}, Value added: ${pssEnd - pssStart} KB`)
        expect(pssEnd - pssStart).assertLess(1024)

        //--------------------------------------------后置处理------------------------------------------------------
        offCaptureReady(photoOutput);
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_JS_VIDEO_MACRO_STATUS_STABILITY_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_JS_VIDEO_MACRO_STATUS_STABILITY_0100
     * @tc.desc      : video mode repeated register and unregister on macroStatusChanged
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // 录像模式反复注册和注销超级微距状态上报
    it('SUB_MULTIMEDIA_CAMERA_JS_VIDEO_MACRO_STATUS_STABILITY_0100', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_MULTIMEDIA_CAMERA_JS_VIDEO_MACRO_STATUS_STABILITY_0100'
      try {
        //--------------------------------------------预置条件------------------------------------------------------
        let context = getContext();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let cameraId: camera.CameraDevice = cameras[0]
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, cameraId, camera.SceneMode.NORMAL_VIDEO)
        if (cameraOutputCapability === undefined) {
          return;
        }
        let videoProfile = cameraOutputCapability.videoProfiles[0]
        let previewProfile = cameraOutputCapability?.previewProfiles.find((previewProfile: camera.Profile) => {
          return Math.abs((previewProfile.size.width / previewProfile.size.height) - (videoProfile.size.width / videoProfile.size.height)) < Number.EPSILON;
        });
        if (previewProfile === undefined) {
          return;
        }
        let videoOutput: camera.VideoOutput | undefined = undefined
        let cameraInput: camera.CameraInput | undefined = undefined
        let previewOutPut: camera.PreviewOutput | undefined = undefined
        let session: ESObject = undefined
        // 创建空的视频文件
        let videoUri: string = `file://${context.filesDir}/${Date.now()}.mp4`; // 本地沙箱路径。
        let file = await createVideoFile(videoUri)
        // 创建录制实例
        let avRecorder = await createAvRecorder();
        await setAvRecorderConfig(avRecorder, file, videoProfile, videoProfile.frameRateRange.max);
        // 创建VideoOutput对象。
        videoOutput = await getVideoOutput(cameraManager, avRecorder, videoProfile);
        cameraInput = createCameraInput(cameraManager, cameraId);
        previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);
        await openCamera(cameraInput);
        session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
        await addInputIntoSession(session, cameraInput);
        await addOutputIntoSession(session, previewOutPut);
        await addOutputIntoSession(session, videoOutput);
        await commitSessionConfig(session);
        await startSession(session);
        await onPreviewOutputFrameStart(previewOutPut!);

        //--------------------------------------------测试过程------------------------------------------------------
        let pssStart = await getMemOfProcess()
        let num = 1
        while (num <= 100) {
          console.info(`the ${num}/100 times videoSession on/off macroStatusChanged`)
          session.on('macroStatusChanged', (err: BusinessError, status: boolean): void => {
            console.info(`on, macroStatusChanged:  ${status}`);
          });
          await sleep(100)
          session.off('macroStatusChanged', (err: BusinessError, status: boolean): void => {
            console.info(`off, macroStatusChanged:  ${status}`);
          });
          num = num + 1
        }
        console.info("wait 60s for resource release")
        await sleep(60000)
        // 检查内存泄露
        let pssEnd = await getMemOfProcess()
        console.info(`test before mem: ${pssStart}, test after mem: ${pssEnd}, Value added: ${pssEnd - pssStart} KB`)
        expect(pssEnd - pssStart).assertLess(1024)

        //--------------------------------------------后置处理------------------------------------------------------
        offPreviewOutputFrameStart(previewOutPut!);
        stopSession(session);
        releaseInPutStream(cameraInput);
        releaseOutPutStream(previewOutPut)
        releaseOutPutStream(videoOutput)
        releaseSession(session)
        await helperInstance.release();
        done();
      } catch (error) {
        console.error(`${testNum} error is ${error}`)
        expect(true).assertFail();
        done();
      }
    })
  })
}
