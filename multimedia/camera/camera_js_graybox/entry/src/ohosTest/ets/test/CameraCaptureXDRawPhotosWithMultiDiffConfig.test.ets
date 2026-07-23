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
  generateNameForAsset,
  onPhotoOutputPhotoAvailable,
  offPhotoOutputPhotoAvailable,
  getRAWCaptureZoomRatioRange,
  enableMovingPhoto,
  setImageColorSpaceBycolorSpace
} from './CameraCommonAPI'
import { camera } from '@kit.CameraKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

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


export default function CameraCaptureXDRawPhotosWithMultiDiffConfig() {
  describe('CameraCaptureXDRawPhotosWithMultiDiffConfig', () => {
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
     * @tc.number    : CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0000
     * @tc.name      : CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0000
     * @tc.desc      : camera capture 1 XD Raw photo with multi Different config Deferred
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //相机使用逻辑摄像头在不同照片格式、不同分辨率、不同焦距下拍摄1张XD RAW动态照片  分段式拍照
    it('CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0000', 0, async (done: Function) => {
      let testNum = 'CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0000'
      try {
        //预制条件
        let capturePhotoNum = 1;
        let capturePhotoTotalNum = 0;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let supportCameras = cameraManager.getSupportedCameras();
        const beforePhotoTotalNum = await getAllPhotoAssetsCount();
        console.info("supportCameras is " + JSON.stringify(supportCameras))
        for (let mCameraId of supportCameras) {
          console.info("mCameraIdi " + JSON.stringify(mCameraId))
          let ability =
            cameraManager.getSupportedFullOutputCapability(mCameraId, camera.SceneMode.NORMAL_PHOTO);
          console.info("ability.previewProfiles is " + JSON.stringify(ability.previewProfiles))
          console.info("ability.photoProfiles is " + JSON.stringify(ability.photoProfiles))
          let cameraId: camera.CameraDevice = mCameraId
          for (let PhotoProfile of ability.photoProfiles) {
            if (PhotoProfile.format != camera.CameraFormat.CAMERA_FORMAT_DNG_XDRAW) {
              continue
            }
            let photoOutputProfile: camera.Profile = PhotoProfile
            for (let PreviewProfile of ability.previewProfiles) {
              let previewOutPutProfile: camera.Profile = PreviewProfile
              let isHdrImage: boolean = false;
              console.info("photoOutputProfile is " + JSON.stringify(photoOutputProfile))
              console.info("previewOutPutProfile is " + JSON.stringify(previewOutPutProfile))
              let fileNames: Array<string> = [];
              let newTitle: string =
                await generateNameForAsset(camera.SceneMode.NORMAL_PHOTO, cameraId, photoOutputProfile,
                  previewOutPutProfile)
              let photoOutput: camera.PhotoOutput | undefined = undefined
              let cameraInput: camera.CameraInput | undefined = undefined
              let previewOutPut: camera.PreviewOutput | undefined = undefined
              let session: ESObject = undefined
              photoOutput = getPhotoOutputFromProfile(cameraManager, photoOutputProfile)
              cameraInput = createCameraInput(cameraManager, cameraId);
              previewOutPut = createPreviewOutputFromProfile(cameraManager, previewOutPutProfile!);
              let colorSpace: colorSpaceManager.ColorSpace;
              if (previewOutPutProfile.format == 2001 || previewOutPutProfile.format == 2002) {
                colorSpace = colorSpaceManager.ColorSpace.BT2020_HLG;
              } else {
                colorSpace = colorSpaceManager.ColorSpace.DISPLAY_P3;
              }
              globalThis.isCaptureReady = true;
              await openCamera(cameraInput);
              session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              await addOutputIntoSession(session, photoOutput);
              setImageColorSpaceBycolorSpace(session, true, colorSpace);
              await commitSessionConfig(session);
              enableMovingPhoto(photoOutput)
              await startSession(session);
              setFocusMode(session);
              await onPreviewOutputFrameStart(previewOutPut!);
              let zoomRatioRange: number[] = []
              zoomRatioRange = getRAWCaptureZoomRatioRange(session)
              onCaptureReady(photoOutput);

              //测试过程
              onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
              await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum, newTitle);
              capturePhotoTotalNum++;
              console.info(`${testNum} capturePhotoNum is ${capturePhotoTotalNum}`);
              await sleep(3000);
              await offPhotoOutputPhotoAssetAvailable(photoOutput)
              
              //恢复过程
              offCaptureReady(photoOutput);
              await sleep(500)
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              console.info(`图片文件：${newTitle}.jpg`)
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              await releaseSession(session)
              await sleep(1000)
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
        done();
      } catch (error) {
        console.error(`${testNum} error is ${JSON.stringify(error)}`)
        expect(true).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0100
     * @tc.name      : CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0100
     * @tc.desc      : camera capture 1 XD Raw photo with multi Different config single
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    //相机使用逻辑摄像头在不同照片格式、不同分辨率、不同焦距下拍摄1张XD RAW静态照片-单段式拍照
    it('CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0100', 0, async (done: Function) => {
      let testNum = 'CAMERA_CAPTURE_XD_RAW_PHOTO_WITH_MULTI_CONFIG_0100'
      try {
        //预制条件
        let capturePhotoNum = 1;
        await getPermission();

        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let types: camera.CameraType [] =
          [camera.CameraType.CAMERA_TYPE_DEFAULT, camera.CameraType.CAMERA_TYPE_WIDE_ANGLE,
            camera.CameraType.CAMERA_TYPE_ULTRA_WIDE, camera.CameraType.CAMERA_TYPE_TELEPHOTO,
            camera.CameraType.CAMERA_TYPE_TRUE_DEPTH]
        let supportCameras = cameraManager.getSupportedCameras();
        console.info("supportCameras is " + JSON.stringify(supportCameras))
        for (let mCameraId of supportCameras) {
          console.info("mCameraIdi " + JSON.stringify(mCameraId))
          let ability =
            cameraManager.getSupportedFullOutputCapability(mCameraId, camera.SceneMode.NORMAL_PHOTO);
          let cameraId: camera.CameraDevice = mCameraId
          for (let PhotoProfile of ability.photoProfiles) {
            if (PhotoProfile.format != camera.CameraFormat.CAMERA_FORMAT_DNG_XDRAW){
              continue
            }
            let photoOutputProfile: camera.Profile = PhotoProfile
            for (let PreviewProfile of ability.previewProfiles) {
              let previewOutPutProfile: camera.Profile = PreviewProfile
              let isHdrImage: boolean = false;
              console.info("photoOutputProfile is " + JSON.stringify(photoOutputProfile))
              console.info("previewOutPutProfile is " + JSON.stringify(previewOutPutProfile))
              let fileNames: Array<string> = [];
              let newTitle: string =
                await generateNameForAsset(camera.SceneMode.NORMAL_PHOTO, cameraId, photoOutputProfile,
                  previewOutPutProfile)
              let photoOutput: camera.PhotoOutput | undefined = undefined
              let cameraInput: camera.CameraInput | undefined = undefined
              let previewOutPut: camera.PreviewOutput | undefined = undefined
              let session: ESObject = undefined
              photoOutput = getPhotoOutputFromProfile(cameraManager, photoOutputProfile)
              cameraInput = createCameraInput(cameraManager, cameraId);
              previewOutPut = createPreviewOutputFromProfile(cameraManager, previewOutPutProfile!);
              let colorSpace: colorSpaceManager.ColorSpace;
              if (previewOutPutProfile.format == 2001 || previewOutPutProfile.format == 2002) {
                colorSpace = colorSpaceManager.ColorSpace.BT2020_HLG;
              } else {
                colorSpace = colorSpaceManager.ColorSpace.DISPLAY_P3;
              }
              globalThis.isCaptureReady = true;
              await openCamera(cameraInput);
              session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              await addInputIntoSession(session, cameraInput);
              await addOutputIntoSession(session, previewOutPut);
              await addOutputIntoSession(session, photoOutput);
              setImageColorSpaceBycolorSpace(session, true, colorSpace);
              await commitSessionConfig(session);
              await startSession(session);
              setFocusMode(session);
              await onPreviewOutputFrameStart(previewOutPut!);
              let zoomRatioRange: number[] = []
              zoomRatioRange = getRAWCaptureZoomRatioRange(session)
              onCaptureReady(photoOutput);
              let asset: photoAccessHelper.PhotoAsset | undefined = undefined
              let assetArray: photoAccessHelper.PhotoAsset[] = []
              for (let zoomRatio of zoomRatioRange!) {
                const beforeCount = await getAllPhotoAssetsCount();
                setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
                await sleep(500)
                //测试过程
                onPhotoOutputPhotoAvailable(photoOutput, helperInstance);
                await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum, newTitle);
                await offPhotoOutputPhotoAvailable(photoOutput, capturePhotoNum, fileNames, true)
                await expectEqualPhotoCount(beforeCount, capturePhotoNum);
                
              }
              //恢复过程
              offCaptureReady(photoOutput);
              await sleep(500)
              offPreviewOutputFrameStart(previewOutPut!);
              stopSession(session);
              console.info(`图片文件：${newTitle}.jpg`)
              releaseInPutStream(cameraInput);
              releaseOutPutStream(previewOutPut)
              releaseOutPutStream(photoOutput)
              await releaseSession(session)
              await sleep(1000)
            }
          }
        }
        await helperInstance.release();
        done();
      } catch (error) {
        console.error(`${testNum} error is ${JSON.stringify(error)}`)
        expect(true).assertFail();
        done();
      }
    })
  })
}
