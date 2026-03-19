/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { getPermission, sleep } from './CameraCommonAPI';

export default function CameraShootingCase() {
  describe('CameraShootingCase', () => {
    console.info('----------CameraShootingCase begin--------------')
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission()
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
      sleep(1000);
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_CAPTURE_0100
     * @tc.desc      : test sub multimedia camera capture example code
     * @tc.url       : https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/camera-shooting-case
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    // 开发文档中的拍照实践示例代码
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_0100', Level.LEVEL1, async (done: Function) => {
      let setPhotoOutputCb = (photoOutput: camera.PhotoOutput) => {
        //设置回调之后，调用photoOutput的capture方法，就会将拍照的buffer回传到回调中。
        photoOutput.on('photoAvailable', (errCode: BusinessError, photo: camera.Photo): void => {
          console.info('getPhoto start');
          console.error(`err: ${errCode}`);
          if (errCode || photo === undefined) {
            console.error('getPhoto failed');
            return;
          }
          let imageObj = photo.main;
          imageObj.getComponent(image.ComponentType.JPEG, (errCode: BusinessError, component: image.Component): void => {
            console.info('getComponent start');
            if (errCode || component === undefined) {
              console.error('getComponent failed');
              return;
            }
            let buffer: ArrayBuffer;
            if (component.byteBuffer) {
              buffer = component.byteBuffer;
            } else {
              console.error('byteBuffer is null');
              return;
            }

            // 如需要在图库中看到所保存的图片、视频资源，请使用用户无感的安全控件创建媒体资源。

            // buffer处理结束后需要释放该资源，如果未正确释放资源会导致后续拍照获取不到buffer。
            imageObj.release();
          });
        });
      }

      let cameraShootingCase = async (context: Context, surfaceId: string) => {
        // 创建CameraManager对象。
        let cameraManager: camera.CameraManager = camera.getCameraManager(context);
        if (!cameraManager) {
          console.error("camera.getCameraManager error");
          return;
        }
        // 监听相机状态变化。
        cameraManager.on('cameraStatus', (err: BusinessError, cameraStatusInfo: camera.CameraStatusInfo) => {
          if (err !== undefined && err.code !== 0) {
            console.error('cameraStatus with errorCode = ' + err.code);
            return;
          }
          console.info(`camera : ${cameraStatusInfo.camera.cameraId}`);
          console.info(`status: ${cameraStatusInfo.status}`);
        });

        // 获取相机列表。
        let cameraArray: Array<camera.CameraDevice> = cameraManager.getSupportedCameras();
        if (cameraArray.length <= 0) {
          console.error("cameraManager.getSupportedCameras error");
          return;
        }

        for (let index = 0; index < cameraArray.length; index++) {
          console.info('cameraId : ' + cameraArray[index].cameraId);                          // 获取相机ID。
          console.info('cameraPosition : ' + cameraArray[index].cameraPosition);              // 获取相机位置。
          console.info('cameraType : ' + cameraArray[index].cameraType);                      // 获取相机类型。
          console.info('connectionType : ' + cameraArray[index].connectionType);              // 获取相机连接类型。
        }

        // 创建相机输入流。
        let cameraInput: camera.CameraInput | undefined = undefined;
        try {
          cameraInput = cameraManager.createCameraInput(cameraArray[0]);
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to createCameraInput errorCode = ' + err.code);
        }
        if (cameraInput === undefined) {
          return;
        }

        // 监听cameraInput错误信息。
        let cameraDevice: camera.CameraDevice = cameraArray[0];
        cameraInput.on('error', cameraDevice, (error: BusinessError) => {
          console.error(`Camera input error code: ${error.code}`);
        })

        // 打开相机。
        await cameraInput.open();

        // 获取支持的模式类型。
        let sceneModes: Array<camera.SceneMode> = cameraManager.getSupportedSceneModes(cameraArray[0]);
        let isSupportPhotoMode: boolean = sceneModes.indexOf(camera.SceneMode.NORMAL_PHOTO) >= 0;
        if (!isSupportPhotoMode) {
          console.error('photo mode not support');
          return;
        }
        // 获取相机设备支持的输出流能力。
        let cameraOutputCap: camera.CameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraArray[0], camera.SceneMode.NORMAL_PHOTO);
        if (!cameraOutputCap) {
          console.error("cameraManager.getSupportedOutputCapability error");
          return;
        }
        console.info("outputCapability: " + JSON.stringify(cameraOutputCap));

        let previewProfilesArray: Array<camera.Profile> = cameraOutputCap.previewProfiles;
        if (!previewProfilesArray) {
          console.error("createOutput previewProfilesArray == null || undefined");
        }

        let photoProfilesArray: Array<camera.Profile> = cameraOutputCap.photoProfiles;
        if (!photoProfilesArray) {
          console.error("createOutput photoProfilesArray == null || undefined");
        }

        // 创建预览输出流,其中参数 surfaceId 参考上文 XComponent 组件，预览流为XComponent组件提供的surface。
        let previewOutput: camera.PreviewOutput | undefined = undefined;
        try {
          previewOutput = cameraManager.createPreviewOutput(previewProfilesArray[0], surfaceId);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`Failed to create the PreviewOutput instance. error code: ${err.code}`);
        }
        if (previewOutput === undefined) {
          return;
        }
        // 监听预览输出错误信息。
        previewOutput.on('error', (error: BusinessError) => {
          console.error(`Preview output error code: ${error.code}`);
        });

        // 创建拍照输出流。
        let photoOutput: camera.PhotoOutput | undefined = undefined;
        try {
          photoOutput = cameraManager.createPhotoOutput(photoProfilesArray[0]);
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to createPhotoOutput errorCode = ' + err.code);
        }
        if (photoOutput === undefined) {
          return;
        }

        //调用上面的回调函数来保存图片。
        setPhotoOutputCb(photoOutput);

        //创建会话。
        let photoSession: camera.PhotoSession | undefined = undefined;
        try {
          photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to create the session instance. errorCode = ' + err.code);
        }
        if (photoSession === undefined) {
          return;
        }
        // 监听session错误信息。
        photoSession.on('error', (error: BusinessError) => {
          console.error(`Capture session error code: ${error.code}`);
        });

        // 开始配置会话。
        try {
          photoSession.beginConfig();
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to beginConfig. errorCode = ' + err.code);
        }

        // 向会话中添加相机输入流。
        try {
          photoSession.addInput(cameraInput);
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to addInput. errorCode = ' + err.code);
        }

        // 向会话中添加预览输出流。
        try {
          photoSession.addOutput(previewOutput);
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to addOutput(previewOutput). errorCode = ' + err.code);
        }

        // 向会话中添加拍照输出流。
        try {
          photoSession.addOutput(photoOutput);
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to addOutput(photoOutput). errorCode = ' + err.code);
        }

        // 提交会话配置。
        await photoSession.commitConfig();

        // 启动会话。
        await photoSession.start().then(() => {
          console.info('Promise returned to indicate the session start success.');
        });
        // 判断设备是否支持闪光灯。
        let flashStatus: boolean = false;
        try {
          flashStatus = photoSession.hasFlash();
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to hasFlash. errorCode = ' + err.code);
        }
        console.info('Returned with the flash light support status:' + flashStatus);

        if (flashStatus) {
          // 判断是否支持自动闪光灯模式。
          let flashModeStatus: boolean = false;
          try {
            let status: boolean = photoSession.isFlashModeSupported(camera.FlashMode.FLASH_MODE_AUTO);
            flashModeStatus = status;
          } catch (error) {
            let err = error as BusinessError;
            console.error('Failed to check whether the flash mode is supported. errorCode = ' + err.code);
          }
          if(flashModeStatus) {
            // 设置自动闪光灯模式。
            try {
              photoSession.setFlashMode(camera.FlashMode.FLASH_MODE_AUTO);
            } catch (error) {
              let err = error as BusinessError;
              console.error('Failed to set the flash mode. errorCode = ' + err.code);
            }
          }
        }

        // 判断是否支持连续自动变焦模式。
        let focusModeStatus: boolean = false;
        try {
          let status: boolean = photoSession.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          focusModeStatus = status;
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to check whether the focus mode is supported. errorCode = ' + err.code);
        }

        if (focusModeStatus) {
          // 设置连续自动变焦模式。
          try {
            photoSession.setFocusMode(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          } catch (error) {
            let err = error as BusinessError;
            console.error('Failed to set the focus mode. errorCode = ' + err.code);
          }
        }

        // 获取相机支持的可变焦距比范围。
        let zoomRatioRange: Array<number> = [];
        try {
          zoomRatioRange = photoSession.getZoomRatioRange();
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to get the zoom ratio range. errorCode = ' + err.code);
        }
        if (zoomRatioRange.length <= 0) {
          return;
        }
        // 设置可变焦距比。
        try {
          photoSession.setZoomRatio(zoomRatioRange[0]);
        } catch (error) {
          let err = error as BusinessError;
          console.error('Failed to set the zoom ratio value. errorCode = ' + err.code);
        }
        let photoCaptureSetting: camera.PhotoCaptureSetting = {
          quality: camera.QualityLevel.QUALITY_LEVEL_HIGH, // 设置图片质量高。
          rotation: camera.ImageRotation.ROTATION_0 // 设置图片旋转角度0。
        }
        // 使用当前拍照设置进行拍照。
        photoOutput.capture(photoCaptureSetting, (err: BusinessError) => {
          if (err) {
            console.error(`Failed to capture the photo ${err.message}`);
            return;
          }
          console.info('Callback invoked to indicate the photo capture request success.');
        });

        // 需要在拍照结束之后调用以下关闭相机和释放会话流程，避免拍照未结束就将会话释放。
        // 停止当前会话。
        await photoSession.stop();

        // 释放相机输入流。
        await cameraInput.close();

        // 释放预览输出流。
        await previewOutput.release();

        // 释放拍照输出流。
        await photoOutput.release();

        // 释放会话。
        await photoSession.release();

        // 会话置空。
        photoSession = undefined;
      }
      // exec case
      let context = getContext();
      await cameraShootingCase(context, globalThis.surfaceId)
      done()
    })
  })
}