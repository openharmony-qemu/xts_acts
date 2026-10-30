/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct IndexWritePixel {
  @State message: string = 'writePixel';
  @State pixelMap: image.PixelMap | undefined = undefined;

  async createAndWritePixelMap() {
    let msgStr: string = 'www data IndexWritePixel createAndWritePixelMap ';
    try {
      const color: ArrayBuffer = new ArrayBuffer(64);
      const opts: image.InitializationOptions = {
        editable: true,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 4 }
      };
      let pm: image.PixelMap = image.createPixelMapSync(color, opts);
      console.info(msgStr + 'createPixelMapSync success');

      const srcBuffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Uint8Array = new Uint8Array(srcBuffer);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = (i % 255) + 1;
      }
      await pm.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
      console.info(msgStr + 'writeAllPixelsFromBuffer success');
      this.pixelMap = pm;
      this.message = 'success';
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error(msgStr + 'failed code=' + err.code + ' msg=' + err.message);
      this.message = 'failed';
    }
  }

  build() {
    Column() {
      Text(this.message)
        .id('indexWritePixelText')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .onClick(() => {
          this.createAndWritePixelMap();
        })
      if (this.pixelMap) {
        Image(this.pixelMap)
          .width(200)
          .height(200)
          .margin({ top: 20 })
          .objectFit(ImageFit.Fill)
      }
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
