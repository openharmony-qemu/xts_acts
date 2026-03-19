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
import { getPermission, sleep, CameraStatusInfoComparisonsCameraDevice } from './CameraCommonAPI';

export default function CameraStatusInfoEqualCameraDevice() {
  describe('CameraStatusInfoEqualCameraDevice', () => {
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
     * @tc.desc      : cameraStatusInfo Equal cameraDevice
     * @tc.url       : https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/camera-shooting-case
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
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

      let context = getContext();
      await CameraStatusInfoComparisonsCameraDevice(context, done);
      await sleep(9000);
      done();
    })
  })
}