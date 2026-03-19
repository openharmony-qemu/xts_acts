import { BusinessError } from '@kit.BasicServicesKit';
import { camera } from '@kit.CameraKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { dataSharePredicates } from '@kit.ArkData';

export class CameraService {
  private imageWidth: number = 1920;
  private imageHeight: number = 1080;
  private cameraManager: camera.CameraManager | undefined = undefined;
  private cameras: Array<camera.CameraDevice> = [];
  private cameraInput: camera.CameraInput | undefined = undefined;
  private previewOutput: camera.PreviewOutput | undefined = undefined;
  private photoOutput: camera.PhotoOutput | undefined = undefined;
  private session: camera.PhotoSession | camera.VideoSession | undefined = undefined;
  private isFrameStart = false;
  public  photoHelper: photoAccessHelper.PhotoAccessHelper | undefined = undefined;
  private realCapturePhotoNum = 0;

  // 初始化相机。
  async initCamera(context: Context, surfaceId: string): Promise<string> {
    console.info(`initCamera surfaceId: ${surfaceId}`);
    try {
      await this.releaseCamera();
      // 获取相机管理器实例。
      this.cameraManager = camera.getCameraManager(context);
      if (this.cameraManager === undefined) {
        console.error('cameraManager is undefined');
        return "cameraManager is undefined";
      }
      this.cameras = this.cameraManager.getSupportedCameras();
      if (!this.cameras || this.cameras.length <= 0) {
        console.error("cameraManager.getSupportedCameras error");
        return "cameraManager.getSupportedCameras error";
      }
      // 创建cameraInput输出对象。
      this.cameraInput = this.cameraManager.createCameraInput(this.cameras[0]);
      if (this.cameraInput === undefined) {
        console.error('Failed to create the camera input.');
        return "Failed to create the camera input";
      }
      // 打开相机。
      await this.cameraInput.open();

      let previewProfile: camera.Profile = {
        format: camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP,
        size: {
          width: this.imageWidth,
          height: this.imageHeight
        }
      };
      // 创建预览流输出。
      this.previewOutput = this.cameraManager.createPreviewOutput(previewProfile, surfaceId);
      if (this.previewOutput === undefined) {
        console.error('Failed to create the preview stream.');
        this.releaseCamera();
        return "Failed to create the preview stream.";
      }

      let photoProfile: camera.Profile = {
        format: camera.CameraFormat.CAMERA_FORMAT_JPEG,
        size: {
          width: this.imageWidth,
          height: this.imageHeight
        }
      };
      // 创建拍照流输出。
      this.photoOutput = this.cameraManager.createPhotoOutput(photoProfile);
      if (this.photoOutput === undefined) {
        console.error('Failed to create the photoOutput.');
        this.releaseCamera();
        return "Failed to create the photoOutput.";
      }

      // 创建相机会话，启动会话。
      let session = this.cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
      if (!session) {
        console.error('session is null');
        this.releaseCamera();
        return "session is null";
      }
      this.session = session as camera.PhotoSession;
      this.session.beginConfig();
      this.session.addInput(this.cameraInput);
      this.session.addOutput(this.previewOutput);
      this.session.addOutput(this.photoOutput);
      await this.session.commitConfig();
      await this.session.start();
      // console.info('into onPreviewOutputFrameStart')
      // this.previewOutput.on('frameStart', async () => {
      //   this.isFrameStart = true;
      // });
      // //等待预览帧开始
      // let previewOutputFrameStartTime = Date.now();
      // while (!this.isFrameStart) {
      //   let previewOutputFrameEndTime = Date.now();
      //   if (previewOutputFrameEndTime - previewOutputFrameStartTime > 60000) {
      //     console.info('预览画面帧输出超时')
      //     return "预览画面帧输出超时";
      //   }
      // }
      // console.info('exit onPreviewOutputFrameStart')
      return "success";
    } catch (error) {
      let err = error as BusinessError;
      console.error(`initCamera fail: ${err}`);
      this.releaseCamera();
      return `initCamera fail: ${err}`
    }
  }

  async sleep(ms: number = 66): Promise<string> {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve('');
      }, ms)
    })
  }

  async  getAllPhotoAssetsCount(context: Context): Promise<number> {
    let Helper: photoAccessHelper.PhotoAccessHelper =  photoAccessHelper.getPhotoAccessHelper(context);
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOption: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await Helper.getAssets(fetchOption);
    let photoAssetsCount = await fetchResult.getCount();
    Helper!.release();
    return photoAssetsCount
  }

  async capturePhoto(context: Context): Promise<string> {
    let beforenum = await this.getAllPhotoAssetsCount(context)
    console.info("capturePhoto beforenum is " + beforenum)
    this.photoHelper =  photoAccessHelper.getPhotoAccessHelper(context);
    console.info("capturePhoto photoHelper "+ this.photoHelper);
    this.photoOutput!.on('photoAssetAvailable', async (err: BusinessError, photoAsset: photoAccessHelper.PhotoAsset) => {
      try {
        if (err) {
          console.info(`photoAssetAvailable error: ${JSON.stringify(err)}.`);
          return;
        }
        console.info("photoAssetAvailable photoHelper " + this.photoHelper)
        console.info('photoOutPutCallBack photoAssetAvailable photoAsset.uri is ' + photoAsset.uri);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        console.info("photoAssetAvailable create assetChangeRequest")
        assetChangeRequest.saveCameraPhoto();
        console.info("photoAssetAvailable  saveCameraPhoto")
        this.photoHelper!.applyChanges(assetChangeRequest)
        console.info("photoAssetAvailable  applyChanges")
        let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset()
        console.info('error is asset.uri' + asset.uri);
        console.info('error is asset.displayName' + asset.displayName);
        this.realCapturePhotoNum++;
        console.info('realCapturePhotoNum is ' + this.realCapturePhotoNum);
      } catch (err) {
        console.error("photoAssetAvailable error is " + JSON.stringify(err))
      }
    });
    let captureLocation: camera.Location = {
      latitude: 0,
      longitude: 0,
      altitude: 0
    }
    let photoCaptureSetting: camera.PhotoCaptureSetting = {
      quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
      rotation: camera.ImageRotation.ROTATION_0,
      location: captureLocation,
      mirror: false
    }
    this.photoOutput!.capture(photoCaptureSetting, (err: BusinessError) => {
      if (err) {
        console.error(`capturePhoto Failed to capture the photo ${err.message}`);
      }
    });
    let beginTime = Date.now();
    while (this.realCapturePhotoNum < 1) {
      await this.sleep(200);
      let tmpTime = Date.now();
      if (tmpTime - beginTime > 150000) {
        beginTime = 0;
        return "capturePhoto delay fail realCapturePhotoNum is not equal 1"
      }
    }
    const afterCount = await this.getAllPhotoAssetsCount(context);
    console.info("capturePhoto afterCount is " + afterCount)
    if (afterCount != (beforenum + 1)) {
      return "capturePhoto afterCount is not equal  beforenum + 1"
    }
    return "success";
  }

  // 释放相机资源。
  async releaseCamera(): Promise<string> {
    console.info('releaseCamera is called');
    // 停止当前会话。
    await this.session?.stop().catch((e: BusinessError) => {console.error('releaseCamera Failed to stop session: ', e)});
    // 释放相机输入流。
    await this.cameraInput?.close().catch((e: BusinessError) => {console.error('releaseCamera Failed to close the camera: ', e)});
    // 释放预览输出流。
    await this.previewOutput?.release().catch((e: BusinessError) => {console.error('releaseCamera Failed to stop the preview stream: ', e)});
    // 释放拍照输出流。
    await this.photoOutput?.release().catch((e: BusinessError) => {console.error('releaseCamera Stop Photo Stream Failure: ', e)});
    // 释放会话。
    await this.session?.release().catch((e: BusinessError) => {console.error('releaseCamera Failed to release session: ', e)});
    console.info('releaseCamera success');
    return "success";
  }
}