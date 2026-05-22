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
import { BusinessError } from '@kit.BasicServicesKit';

const MULTI_CONFIG_DIAG_TAG = '[CAMERA_MULTI_CONFIG_DIAG]';

function formatCaptureError(error: ESObject): string {
  let err = error as BusinessError;
  return `code is ${err.code}, message is ${err.message}, error is ${JSON.stringify(error)}`;
}

export default function CameraCapturePhotosWithMultiDiffConfig() {
  describe('CameraCapturePhotosWithMultiDiffConfig', () => {
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
     * @tc.number    : SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0100
     * @tc.name      : SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0100
     * @tc.desc      : camera capture 1 dynamic photo with multi Different config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0100'
      try {
        //预制条件
        let capturePhotoNum = 1;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        if (cameras.length <= 0) {
          console.error(`${testNum} cameras length is ${cameras.length}, cameraIndex is 0`)
          await helperInstance.release();
          expect(true).assertFail();
          done();
          return;
        }
        let fileNames: Array<string> = [];
        let camreId = cameras[0];
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_PHOTO)
        for (let photoOutputProfile of cameraOutputCapability?.photoProfiles!) {
          for (let previewOutPutProfile of cameraOutputCapability?.previewProfiles!) {
            if (photoOutputProfile.size.width * previewOutPutProfile.size.height !=
              previewOutPutProfile.size.width * photoOutputProfile.size.height) {
              continue;
            }
            let photoOutput: camera.PhotoOutput | undefined = undefined
            let cameraInput: camera.CameraInput | undefined = undefined
            let previewOutPut: camera.PreviewOutput | undefined = undefined
            let session: ESObject = undefined
            let isHdrImage: boolean = true
            try {
              console.info(`${testNum} photoProfile format is ${photoOutputProfile.format} photoProfile size is ${photoOutputProfile.size}`);
              console.info(`${testNum} previewProfile format is ${previewOutPutProfile.format} previewProfile size is ${previewOutPutProfile.size} `);
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
              setImageColorSpace(session, isHdrImage)
              await startSession(session);
              await onPreviewOutputFrameStart(previewOutPut!);
              enableMovingPhoto(photoOutput)
              setFocusMode(session);
              let assetArray: photoAccessHelper.PhotoAsset[] = []
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              if (zoomRatioRange != undefined) {
                for (let zoomRatio of zoomRatioRange!) {
                  let newTitle: string = await generateNameForAsset(camera.SceneMode.NORMAL_PHOTO, camreId, photoOutputProfile, previewOutPutProfile, zoomRatio)
                  const befortCount = await getAllPhotoAssetsCount();
                  setZoomRatioRange(session, zoomRatioRange!, zoomRatio);

                  //测试过程
                  onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
                  onCaptureReady(photoOutput);
                  await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
                  let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
                  // 重命名资产
                  renameAsset(assets[0], `${newTitle}`)
                  await expectEqualPhotoCount(befortCount, capturePhotoNum);
                  assetArray.push(assets[0])
                  if (globalThis.isSupportMovingPhoto) {
                    await IsexistMovingPhotoVideo(assets);
                  }
                  await sleep(3000);
                }
              } else {
                //测试过程
                const befortCount = await getAllPhotoAssetsCount();
                onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
                onCaptureReady(photoOutput);
                await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
                let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
                await expectEqualPhotoCount(befortCount, capturePhotoNum);
                if (globalThis.isSupportMovingPhoto) {
                  await IsexistMovingPhotoVideo(assets);
                }
                await sleep(3000);
              }
              //恢复过程
              offCaptureReady(photoOutput);
              offPreviewOutputFrameStart(previewOutPut!);
              await stopSession(session);
              await releaseInPutStream(cameraInput);
              await releaseOutPutStream(previewOutPut)
              await releaseOutPutStream(photoOutput)
              await releaseSession(session)
              await sleep(4000);
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
              console.error(`${testNum} error is ${error}`)
              expect().assertFail();
            }
          }
        }
        await sleep(3000);
        await helperInstance.release();
        done();
      } catch (error) {
        console.error(`${testNum} error is ${error}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0200
     * @tc.name      : SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0200
     * @tc.desc      : camera capture 1 dynamic photo with multi Different config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = `${MULTI_CONFIG_DIAG_TAG} SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_0200`
      try {
        //预制条件
        let capturePhotoNum = 1;
        console.info(`${testNum} step getPermission begin`)
        await getPermission();
        console.info(`${testNum} step getPermission end`)
        console.info(`${testNum} step getHelper begin`)
        let helperInstance = await getHelper();
        console.info(`${testNum} step getHelper end`)
        console.info(`${testNum} step getCameraManager begin`)
        let cameraManager = await getCameraManager();
        console.info(`${testNum} step getCameraManager end`)
        let cameras = getSupportedCameras(cameraManager);
        console.info(`${testNum} supported cameras length is ${cameras.length}`)
        for (let cameraIndex = 0; cameraIndex < cameras.length; cameraIndex++) {
          console.info(`${testNum} cameras[${cameraIndex}] position is ${cameras[cameraIndex].cameraPosition}, type is ${cameras[cameraIndex].connectionType}`)
        }
        if (cameras.length <= 1) {
          console.error(`${testNum} cameras length is ${cameras.length}, cameraIndex is 1`)
          await helperInstance.release();
          expect(true).assertFail();
          done();
          return;
        }
        let fileNames: Array<string> = [];
        let camreId = cameras[1];
        console.info(`${testNum} selected cameras[1] position is ${camreId.cameraPosition}, type is ${camreId.connectionType}`)
        console.info(`${testNum} step getCameraOutputCapability begin`)
        let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_PHOTO)
        console.info(`${testNum} photoProfiles length is ${cameraOutputCapability?.photoProfiles?.length}, previewProfiles length is ${cameraOutputCapability?.previewProfiles?.length}`)
        let matchedProfileNum = 0;
        let skippedProfileNum = 0;
        for (let photoOutputProfile of cameraOutputCapability?.photoProfiles!) {
          for (let previewOutPutProfile of cameraOutputCapability?.previewProfiles!) {
            if (photoOutputProfile.size.width * previewOutPutProfile.size.height !=
              previewOutPutProfile.size.width * photoOutputProfile.size.height) {
              skippedProfileNum++;
              continue;
            }
            matchedProfileNum++;
            console.info(`${testNum} matched profile index is ${matchedProfileNum}, skipped profile count is ${skippedProfileNum}`)
            let photoOutput: camera.PhotoOutput | undefined = undefined
            let cameraInput: camera.CameraInput | undefined = undefined
            let previewOutPut: camera.PreviewOutput | undefined = undefined
            let session: ESObject = undefined
            let isHdrImage: boolean = true
            try {
              console.info(`${testNum} photoProfile format is ${photoOutputProfile.format} photoProfile size is ${photoOutputProfile.size}`);
              console.info(`${testNum} previewProfile format is ${previewOutPutProfile.format} previewProfile size is ${previewOutPutProfile.size} `);
              console.info(`${testNum} camrePosition is ${camreId.cameraPosition} camreType is ${camreId.connectionType}`);
              console.info(`${testNum} step createPhotoOutput begin`)
              photoOutput = getPhotoOutputFromProfile(cameraManager, photoOutputProfile)
              console.info(`${testNum} step createPhotoOutput end`)
              console.info(`${testNum} step createCameraInput begin`)
              cameraInput = createCameraInput(cameraManager, camreId);
              console.info(`${testNum} step createCameraInput end`)
              console.info(`${testNum} step createPreviewOutput begin`)
              previewOutPut = createPreviewOutputFromProfile(cameraManager, previewOutPutProfile!);
              console.info(`${testNum} step createPreviewOutput end`)
              console.info(`${testNum} step openCamera begin`)
              await openCamera(cameraInput);
              console.info(`${testNum} step openCamera end`)
              console.info(`${testNum} step createSession begin`)
              session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);
              console.info(`${testNum} step createSession end`)

              console.info(`${testNum} step addInput begin`)
              await addInputIntoSession(session, cameraInput);
              console.info(`${testNum} step addInput end`)
              console.info(`${testNum} step addPreviewOutput begin`)
              await addOutputIntoSession(session, previewOutPut);
              console.info(`${testNum} step addPreviewOutput end`)
              console.info(`${testNum} step addPhotoOutput begin`)
              await addOutputIntoSession(session, photoOutput);
              console.info(`${testNum} step addPhotoOutput end`)
              console.info(`${testNum} step commitSessionConfig begin`)
              await commitSessionConfig(session);
              console.info(`${testNum} step commitSessionConfig end`)
              setImageColorSpace(session, isHdrImage)
              console.info(`${testNum} step startSession begin`)
              await startSession(session);
              console.info(`${testNum} step startSession end`)
              console.info(`${testNum} step onPreviewOutputFrameStart begin`)
              await onPreviewOutputFrameStart(previewOutPut!);
              console.info(`${testNum} step onPreviewOutputFrameStart end`)
              enableMovingPhoto(photoOutput)
              setFocusMode(session);
              let assetArray: photoAccessHelper.PhotoAsset[] = []
              let zoomRatioRange = getSuppotredZoomRatioRange(session);
              console.info(`${testNum} zoomRatioRange length is ${zoomRatioRange?.length}`)
              if (zoomRatioRange != undefined) {
                for (let zoomRatio of zoomRatioRange!) {
                  let newTitle: string = await generateNameForAsset(camera.SceneMode.NORMAL_PHOTO, camreId, photoOutputProfile, previewOutPutProfile, zoomRatio)
                  const befortCount = await getAllPhotoAssetsCount();
                  console.info(`${testNum} capture begin, zoomRatio is ${zoomRatio}, beforeCount is ${befortCount}, newTitle is ${newTitle}`)
                  setZoomRatioRange(session, zoomRatioRange!, zoomRatio);

                  //测试过程
                  onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
                  onCaptureReady(photoOutput);
                  await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
                  let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
                  console.info(`${testNum} capture end, assets length is ${assets.length}`)
                  // 重命名资产
                  renameAsset(assets[0], `${newTitle}`)
                  await expectEqualPhotoCount(befortCount, capturePhotoNum);
                  assetArray.push(assets[0])
                  if (globalThis.isSupportMovingPhoto) {
                    await IsexistMovingPhotoVideo(assets);
                  }
                  await sleep(3000);
                }
              } else {
                //测试过程
                const befortCount = await getAllPhotoAssetsCount();
                console.info(`${testNum} capture begin without zoomRatioRange, beforeCount is ${befortCount}`)
                onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
                onCaptureReady(photoOutput);
                await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
                let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
                console.info(`${testNum} capture end without zoomRatioRange, assets length is ${assets.length}`)
                await expectEqualPhotoCount(befortCount, capturePhotoNum);
                if (globalThis.isSupportMovingPhoto) {
                  await IsexistMovingPhotoVideo(assets);
                }
                await sleep(3000);
              }
              //恢复过程
              console.info(`${testNum} step release resource begin`)
              offCaptureReady(photoOutput);
              offPreviewOutputFrameStart(previewOutPut!);
              await stopSession(session);
              await releaseInPutStream(cameraInput);
              await releaseOutPutStream(previewOutPut)
              await releaseOutPutStream(photoOutput)
              await releaseSession(session)
              console.info(`${testNum} step release resource end`)
              await sleep(4000);
            } catch (error) {
              console.error(`${testNum} inner error is ${formatCaptureError(error)}`)
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
              expect().assertFail();
            }
          }
        }
        console.info(`${testNum} matched profile count is ${matchedProfileNum}, skipped profile count is ${skippedProfileNum}`)
        await sleep(3000);
        await helperInstance.release();
        console.info(`${testNum} helper release end`)
        done();
      } catch (error) {
        console.error(`${testNum} outer error is ${formatCaptureError(error)}`)
        expect().assertFail();
        done();
      }
    })
  })
}
