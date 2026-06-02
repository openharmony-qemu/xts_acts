'use static'
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

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Scroll,
  FontWeight,
  Color,
  $r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import {
  PictureDrawableDescriptor,
  HdrCompositionConfig
} from '@ohos.arkui.drawableDescriptor'
import image from '@ohos.multimedia.image'

@Entry
@Component
struct PictureDrawableDescriptorSetHdrComposition {
  @State testResult001: string = ''
  @State testResult002: string = ''
  @State testResult003: string = ''
  @State testResult004: string = ''
  @State testResult005: string = ''
  @State testResult006: string = ''

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('PictureDrawableDescriptor setHdrComposition')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)

        this.BuildSectionTitle('1. Normal parameter')

        Button('E2E_001_normal_rect')
          .id('btnTest001')
          .onClick(() => { this.Test001() })
        Text(this.testResult001)
          .id('txtTestResult001')
          .fontSize(14)

        this.BuildSectionTitle('2. Boundary parameter')

        Button('E2E_002_zero_rect')
          .id('btnTest002')
          .onClick(() => { this.Test002() })
        Text(this.testResult002)
          .id('txtTestResult002')
          .fontSize(14)

        Button('E2E_003_large_rect')
          .id('btnTest003')
          .onClick(() => { this.Test003() })
        Text(this.testResult003)
          .id('txtTestResult003')
          .fontSize(14)

        this.BuildSectionTitle('3. Invalid parameter')

        Button('E2E_004_negative_rect')
          .id('btnTest004')
          .onClick(() => { this.Test004() })
        Text(this.testResult004)
          .id('txtTestResult004')
          .fontSize(14)

        this.BuildSectionTitle('4. Overwrite behavior')

        Button('E2E_005_overwrite')
          .id('btnTest005')
          .onClick(() => { this.Test005() })
        Text(this.testResult005)
          .id('txtTestResult005')
          .fontSize(14)

        this.BuildSectionTitle('5. Error scenario')

        Button('E2E_006_after_release')
          .id('btnTest006')
          .onClick(() => { this.Test006() })
        Text(this.testResult006)
          .id('txtTestResult006')
          .fontSize(14)

      }
      .width('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }

  @Builder
  BuildSectionTitle(title: string) {
    Text(title)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(Color.Black)
      .width('100%')
  }

  private async createPictureDrawableDescriptorInner(): PictureDrawableDescriptor | null {
    let resManager = this.getUIContext().getHostContext()?.resourceManager;
    if (!resManager) {
      return null;
    }
    try {
      let uint8buffer = resManager.getMediaContentSync($r('app.media.startIcon').id);
      let imageSource = image.createImageSource(uint8buffer.buffer);
      let options: image.DecodingOptionsForPicture = {
        desiredPixelFormat: image.PixelMapFormat.NV12
      };
      let picture = await imageSource.createPicture(options);
      let drawable = new PictureDrawableDescriptor(picture);
      imageSource.release();
      return drawable;
    } catch (e) {
      console.error(`createPictureDrawableDescriptor failed: ${JSON.stringify(e)}`);
      return null;
    }
  }

  async Test001() {
    try {
      let drawable = await this.createPictureDrawableDescriptorInner();
      if (!drawable) {
        this.testResult001 = 'FAIL: drawable not created';
        return;
      }
      let config: HdrCompositionConfig = {
        rect: { x: 100, y: 100, width: 200, height: 200 }
      };
      drawable.setHdrComposition(config);
      this.testResult001 = 'PASS';
    } catch (e) {
      this.testResult001 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  async Test002() {
    try {
      let drawable = await this.createPictureDrawableDescriptorInner();
      if (!drawable) {
        this.testResult002 = 'FAIL: drawable not created';
        return;
      }
      let config: HdrCompositionConfig = {
        rect: { x: 0, y: 0, width: 0, height: 0 }
      };
      drawable.setHdrComposition(config);
      this.testResult002 = 'PASS';
    } catch (e) {
      this.testResult002 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  async Test003() {
    try {
      let drawable = await this.createPictureDrawableDescriptorInner();
      if (!drawable) {
        this.testResult003 = 'FAIL: drawable not created';
        return;
      }
      let config: HdrCompositionConfig = {
        rect: { x: 5000, y: 5000, width: 5000, height: 5000 }
      };
      drawable.setHdrComposition(config);
      this.testResult003 = 'PASS';
    } catch (e) {
      this.testResult003 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  async Test004() {
    try {
      let drawable = await this.createPictureDrawableDescriptorInner();
      if (!drawable) {
        this.testResult004 = 'FAIL: drawable not created';
        return;
      }
      let config: HdrCompositionConfig = {
        rect: { x: -100, y: -100, width: -100, height: -100 }
      };
      drawable.setHdrComposition(config);
      this.testResult004 = 'PASS';
    } catch (e) {
      this.testResult004 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  async Test005() {
    try {
      let drawable = await this.createPictureDrawableDescriptorInner();
      if (!drawable) {
        this.testResult005 = 'FAIL: drawable not created';
        return;
      }
      let config1: HdrCompositionConfig = {
        rect: { x: 50, y: 50, width: 100, height: 100 }
      };
      drawable.setHdrComposition(config1);
      let config2: HdrCompositionConfig = {
        rect: { x: 200, y: 200, width: 300, height: 300 }
      };
      drawable.setHdrComposition(config2);
      this.testResult005 = 'PASS';
    } catch (e) {
      this.testResult005 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  async Test006() {
    try {
      let drawable = await this.createPictureDrawableDescriptorInner();
      if (!drawable) {
        this.testResult006 = 'FAIL: drawable not created';
        return;
      }
      drawable.release();
      try {
        let config: HdrCompositionConfig = {
          rect: { x: 100, y: 100, width: 200, height: 200 }
        };
        drawable.setHdrComposition(config);
        this.testResult006 = 'FAIL: should throw error after release';
      } catch (e) {
        this.testResult006 = 'PASS';
      }
    } catch (e) {
      this.testResult006 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }
}