/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { PictureDrawableDescriptor } from '@ohos.arkui.drawableDescriptor';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct PictureDrawableDescriptorSetHdrCompositionTest {
  private resManager = this.getUIContext().getHostContext()?.resourceManager;
  @State testResult001: string = '';
  @State testResult002: string = '';
  @State testResult003: string = '';
  @State testResult004: string = '';
  @State testResult005: string = '';
  @State drawable: PictureDrawableDescriptor | undefined = undefined;

  build() {
    Scroll() {
      Column({ space: 5 }) {
        // PictureDrawableDescriptor setHdrComposition
        Image(this.drawable)
          .width('50%')
          .height('10%')
          .borderColor(Color.Red)
          .borderWidth(1)
          .id('imgDrawable')

        Button('创建PictureDrawableDescriptor对象')
          .height('5%')
          .id('btnCreateDrawable')
          .onClick(async () => await this.createPictureDrawableDescriptor())

        // 1. 正常参数测试
        Button('setHdrComposition正常rect')
          .height('5%')
          .id('btnTest001')
          .onClick(() => this.Test001())
        Text(this.testResult001)
          .id('txtTestResult001')
          .fontSize(12)

        Button('setHdrComposition + invalidate触发重建')
          .height('5%')
          .id('btnTest002')
          .onClick(() => this.Test002())
        Text(this.testResult002)
          .id('txtTestResult002')
          .fontSize(12)

        // 2. 边界值测试
        Button('setHdrComposition rect为0')
          .height('5%')
          .id('btnTest003')
          .onClick(() => this.Test003())
        Text(this.testResult003)
          .id('txtTestResult003')
          .fontSize(12)

        // 3. 异常参数测试
        Button('setHdrComposition rect负数')
          .height('5%')
          .id('btnTest004')
          .onClick(() => this.Test004())
        Text(this.testResult004)
          .id('txtTestResult004')
          .fontSize(12)
      }
      .width('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }

  async createPictureDrawableDescriptor() {
    let resMgr = this.getUIContext().getHostContext()?.resourceManager
    if (resMgr) {
      try {
        let uint8buffer = resMgr.getMediaContentSync($r('app.media.528').id)
        let imageSource = image.createImageSource(uint8buffer.buffer)
        let options: image.DecodingOptionsForPicture = {
          desiredAuxiliaryPictures: [image.AuxiliaryPictureType.GAINMAP, image.AuxiliaryPictureType.LHDR_GAINMAP],
          desiredPixelFormat: image.PixelMapFormat.NV12
        }
        let picture = await imageSource.createPicture(options)
        await picture.hdrComposeToMainPixelmap()
        let drawable = new PictureDrawableDescriptor(picture)
        imageSource.release()
        this.drawable = drawable
      } catch (error) {
        console.error(`get media content failed`)
      }
    }
  }

  Test001() {
    try {
      if (!this.drawable) {
        this.testResult001 = 'FAIL: drawable未创建';
        return;
      }
      this.drawable.setHdrComposition({
        rect: {
          x: 200,
          y: 200,
          width: 300,
          height: 300
        }
      });
      this.testResult001 = 'PASS';
    } catch (e) {
      this.testResult001 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test002() {
    try {
      if (!this.drawable) {
        this.testResult002 = 'FAIL: drawable未创建';
        return;
      }
      this.drawable.setHdrComposition({
        rect: {
          x: 200,
          y: 200,
          width: 300,
          height: 300
        }
      });
      this.drawable.invalidate();
      this.testResult002 = 'PASS';
    } catch (e) {
      this.testResult002 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test003() {
    try {
      if (!this.drawable) {
        this.testResult003 = 'FAIL: drawable未创建';
        return;
      }
      this.drawable.setHdrComposition({
        rect: {
          x: 0,
          y: 0,
          width: 0,
          height: 0
        }
      });
      this.testResult003 = 'PASS';
    } catch (e) {
      this.testResult003 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test004() {
    try {
      if (!this.drawable) {
        this.testResult004 = 'FAIL: drawable未创建';
        return;
      }
      this.drawable.setHdrComposition({
        rect: {
          x: -10,
          y: -10,
          width: -10,
          height: -10
        }
      });
      this.testResult004 = 'PASS';
    } catch (e) {
      this.testResult004 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }
}