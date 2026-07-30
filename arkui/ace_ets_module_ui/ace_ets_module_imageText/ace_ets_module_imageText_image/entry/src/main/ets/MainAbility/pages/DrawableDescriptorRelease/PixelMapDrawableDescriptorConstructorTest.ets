/**
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

import { PixelMapDrawableDescriptor, DrawableDescriptor } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { fileUri } from '@kit.CoreFileKit';

@Entry
@Component
struct PixelMapDrawableDescriptorConstructorTest {
  private resManager = this.getUIContext().getHostContext()?.resourceManager;
  @State testResult001: string = '';
  @State testResult002: string = '';
  @State testResult003: string = '';
  @State testResult004: string = '';
  @State testResult005: string = '';
  @State testResult006: string = '';
  @State testResult007: string = '';
  @State drawable001: DrawableDescriptor | undefined = undefined;
  @State drawable002: DrawableDescriptor | undefined = undefined;
  @State drawable003: DrawableDescriptor | undefined = undefined;
  @State drawable004: DrawableDescriptor | undefined = undefined;
  @State drawable005: DrawableDescriptor | undefined = undefined;
  @State drawable006: DrawableDescriptor | undefined = undefined;
  @State drawable007: DrawableDescriptor | undefined = undefined;

  build() {
    Scroll() {
      Column({ space: 5 }) {
        // PixelMapDrawableDescriptor构造函数测试
        // 1. PixelMap类型参数
        Row() {
          Button('构造-PixelMap正常值')
            .height('5%')
            .id('btnTest001')
            .onClick(async () => await this.Test001())
          Image(this.drawable001)
            .width('10%')
            .height('10%')
            .borderColor(Color.Blue)
            .borderWidth(1)
            .id('imgTest001')
          Text(this.testResult001)
            .id('txtTestResult001')
            .key('txtTestResult001')
            .fontSize(14)
        }

        // 2. ResourceStr类型参数
        Row() {
          Button('构造-应用资源$r')
            .height('5%')
            .id('btnTest002')
            .onClick(() => this.Test002())
          Image(this.drawable002)
            .width('10%')
            .height('10%')
            .borderColor(Color.Blue)
            .borderWidth(1)
            .id('imgTest002')
          Text(this.testResult002)
            .id('txtTestResult002')
            .key('txtTestResult002')
            .fontSize(14)
        }

        Row() {
          Button('构造-系统资源$r')
            .height('5%')
            .id('btnTest003')
            .onClick(() => this.Test003())
          Image(this.drawable003)
            .width('10%')
            .height('10%')
            .borderColor(Color.Blue)
            .borderWidth(1)
            .id('imgTest003')
          Text(this.testResult003)
            .id('txtTestResult003')
            .key('txtTestResult003')
            .fontSize(14)
        }

        // 3. 特殊参数测试
        Row() {
          Button('构造-undefined')
            .height('5%')
            .id('btnTest006')
            .onClick(() => this.Test006())
          Image(this.drawable006)
            .width('10%')
            .height('10%')
            .borderColor(Color.Blue)
            .borderWidth(1)
            .id('imgTest006')
          Text(this.testResult006)
            .id('txtTestResult006')
            .key('txtTestResult006')
            .fontSize(14)
        }
      }
      .width('80%')
      .margin({ top: 30 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }

  async Test001() {
    try {
      if (!this.resManager) {
        this.testResult001 = 'FAIL: resManager未初始化';
        return;
      }
      let uint8buffer = this.resManager.getMediaContentSync($r('app.media.tree').id);
      let imageSource = image.createImageSource(uint8buffer.buffer);
      let pixelMap = await imageSource.createPixelMap();
      imageSource.release();

      let drawable: DrawableDescriptor = new PixelMapDrawableDescriptor(pixelMap);
      this.drawable001 = drawable;

      if (drawable && drawable instanceof PixelMapDrawableDescriptor) {
        this.testResult001 = 'PASS';
      } else {
        this.testResult001 = 'FAIL: 类型不匹配';
      }
    } catch (e) {
      this.testResult001 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test002() {
    try {
      let drawable: DrawableDescriptor = new PixelMapDrawableDescriptor($r('app.media.tree') as ESObject);
      this.drawable002 = drawable;

      if (drawable && drawable instanceof PixelMapDrawableDescriptor) {
        this.testResult002 = 'PASS';
      } else {
        this.testResult002 = 'FAIL: 类型不匹配';
      }
    } catch (e) {
      this.testResult002 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test003() {
    try {
      let drawable: DrawableDescriptor = new PixelMapDrawableDescriptor(
        $r('sys.media.ohos_ic_public_more') as ESObject);
      this.drawable003 = drawable;

      if (drawable && drawable instanceof PixelMapDrawableDescriptor) {
        this.testResult003 = 'PASS';
      } else {
        this.testResult003 = 'FAIL: 类型不匹配';
      }
    } catch (e) {
      this.testResult003 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test006() {
    try {
      let drawable: DrawableDescriptor = new PixelMapDrawableDescriptor(undefined);
      this.drawable006 = drawable;

      if (drawable && drawable instanceof PixelMapDrawableDescriptor) {
        this.testResult006 = 'PASS';
      } else {
        this.testResult006 = 'FAIL: 类型不匹配';
      }
    } catch (e) {
      this.testResult006 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }
}