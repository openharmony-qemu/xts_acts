'use static';
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
import { PixelMapDrawableDescriptor } from '@ohos.arkui.drawableDescriptor'
import image from '@ohos.multimedia.image'
import { fileUri } from '@kit.CoreFileKit'
import fs from '@ohos.file.fs';

const BASE64_STR: string =
  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwADhQGAWjR9awAAAABJRU5ErkJggg=='

@Entry
@Component
struct PixelMapDrawableDescriptorConstructor {
  @State testResult001: string = ''
  @State testResult002: string = ''
  @State testResult003: string = ''
  @State testResult004: string = ''
  @State testResult005: string = ''

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('PixelMapDrawableDescriptor Constructor Test')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)

        this.BuildSectionTitle('1. Constructor with no parameter')
        Button('E2E_001_no_param')
          .id('btnTest001')
          .onClick(() => this.Test001())
        Text(this.testResult001)
          .id('txtTestResult001')
          .fontSize(14)

        this.BuildSectionTitle('2. Constructor with PixelMap')
        Button('E2E_002_pixelMap_param')
          .id('btnTest002')
          .onClick(() => this.Test002())
        Text(this.testResult002)
          .id('txtTestResult002')
          .fontSize(14)

        this.BuildSectionTitle('3. Constructor with Resource')
        Button('E2E_003_resource_param')
          .id('btnTest003')
          .onClick(() => this.Test003())
        Text(this.testResult003)
          .id('txtTestResult003')
          .fontSize(14)

        this.BuildSectionTitle('4. Constructor with sandbox path string')
        Button('E2E_004_sandbox_path_param')
          .id('btnTest004')
          .onClick(() => this.Test004())
        Text(this.testResult004)
          .id('txtTestResult004')
          .fontSize(14)

        this.BuildSectionTitle('5. Constructor with Base64 string')
        Button('E2E_005_base64_param')
          .id('btnTest005')
          .onClick(() => this.Test005())
        Text(this.testResult005)
          .id('txtTestResult005')
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

  Test001() {
    try {
      let drawable: PixelMapDrawableDescriptor = new PixelMapDrawableDescriptor()
      let isReleased: boolean = drawable.isReleased()
      if (!isReleased) {
        this.testResult001 = 'PASS'
      } else {
        this.testResult001 = 'FAIL: isReleased should be false for new object'
      }
    } catch (e) {
      this.testResult001 = `FAIL: exception ${JSON.stringify(e)}`
    }
  }

  Test002() {
    try {
      let resManager = this.getUIContext().getHostContext()?.resourceManager
      if (!resManager) {
        this.testResult002 = 'FAIL: resManager not available'
        return
      }
      let unit8Array: Uint8Array = resManager.getMediaContentSync($r('app.media.startIcon').id)
      let imageSource: image.ImageSource | undefined = image.createImageSource(unit8Array.buffer)
      let pixelMap: image.PixelMap | undefined = imageSource?.createPixelMapSync({
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      })
      let drawable: PixelMapDrawableDescriptor = new PixelMapDrawableDescriptor(pixelMap)
      let resultPixelMap: image.PixelMap | undefined = drawable.getPixelMap()
      let originInfo: image.ImageInfo | undefined = pixelMap?.getImageInfoSync()
      let resultInfo: image.ImageInfo | undefined = resultPixelMap?.getImageInfoSync()
      if (originInfo?.size.width === resultInfo?.size.width &&
        originInfo?.size.height === resultInfo?.size.height) {
        this.testResult002 = 'PASS'
      } else {
        this.testResult002 =
          `FAIL: dimension mismatch origin=${originInfo?.size.width}x${originInfo?.size.height} result=${resultInfo?.size.width}x${resultInfo?.size.height}`
      }
      imageSource?.release()
    } catch (e) {
      this.testResult002 = `FAIL: exception ${JSON.stringify(e)}`
    }
  }

  Test003() {
    try {
      let drawable: PixelMapDrawableDescriptor = new PixelMapDrawableDescriptor($r('app.media.startIcon'))
      let resultPixelMap: image.PixelMap | undefined = drawable.getPixelMap()
      if (resultPixelMap !== undefined) {
        let resultInfo: image.ImageInfo = resultPixelMap.getImageInfoSync()
        if (resultInfo.size.width > 0 && resultInfo.size.height > 0) {
          this.testResult003 = 'PASS'
        } else {
          this.testResult003 = `FAIL: invalid dimensions ${resultInfo.size.width}x${resultInfo.size.height}`
        }
      } else {
        this.testResult003 = 'FAIL: getPixelMap returns undefined'
      }
    } catch (e) {
      this.testResult003 = `FAIL: exception ${JSON.stringify(e)}`
    }
  }

  Test004() {
    try {
      let resManager = this.getUIContext().getHostContext()?.resourceManager
      let context = this.getUIContext().getHostContext()
      if (!resManager || !context) {
        this.testResult004 = 'FAIL: context not available'
        return
      }
      let unit8Array: Uint8Array = resManager.getMediaContentSync($r('app.media.startIcon').id)
      let filesDir: string = context.filesDir
      let sandboxFilePath: string = filesDir + '/test_constructor_sandbox.png'
      let file = fs.openSync(sandboxFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
      fs.writeSync(file.fd, unit8Array.buffer)
      fs.closeSync(file)
      let uri: string = fileUri.getUriFromPath(sandboxFilePath)
      let drawable: PixelMapDrawableDescriptor = new PixelMapDrawableDescriptor(uri)
      let resultPixelMap: image.PixelMap | undefined = drawable.getPixelMap()
      if (resultPixelMap !== undefined) {
        let resultInfo: image.ImageInfo = resultPixelMap.getImageInfoSync()
        if (resultInfo.size.width > 0 && resultInfo.size.height > 0) {
          this.testResult004 = 'PASS'
        } else {
          this.testResult004 = `FAIL: invalid dimensions ${resultInfo.size.width}x${resultInfo.size.height}`
        }
      } else {
        this.testResult004 = 'FAIL: getPixelMap returns undefined'
      }
    } catch (e) {
      this.testResult004 = `FAIL: exception ${JSON.stringify(e)}`
    }
  }

  Test005() {
    try {
      let drawable: PixelMapDrawableDescriptor = new PixelMapDrawableDescriptor(BASE64_STR)
      let resultPixelMap: image.PixelMap | undefined = drawable.getPixelMap()
      if (resultPixelMap !== undefined) {
        let resultInfo: image.ImageInfo = resultPixelMap.getImageInfoSync()
        if (resultInfo.size.width > 0 && resultInfo.size.height > 0) {
          this.testResult005 = 'PASS'
        } else {
          this.testResult005 = `FAIL: invalid dimensions ${resultInfo.size.width}x${resultInfo.size.height}`
        }
      } else {
        this.testResult005 = 'FAIL: getPixelMap returns undefined'
      }
    } catch (e) {
      this.testResult005 = `FAIL: exception ${JSON.stringify(e)}`
    }
  }
}