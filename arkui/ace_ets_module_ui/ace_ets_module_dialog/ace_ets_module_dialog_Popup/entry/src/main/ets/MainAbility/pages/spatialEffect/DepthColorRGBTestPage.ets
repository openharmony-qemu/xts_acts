/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';

@Entry
@Component
struct DepthColorRGBTestPage {
  @State resultText: string = 'click button to test';

  build() {
    Column({ space: 10 }) {
      Text('DepthColorRGB Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('DepthColorRGB: {red, green, blue}')
        .fontSize(16)
        .margin({ bottom: 10 })

      Text('Range: [0, 255]')
        .fontSize(14)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('Black')
          .id('btn_black')
          .onClick(() => {
            this.resultText = 'r=0,g=0,b=0';
          })

        Button('White')
          .id('btn_white')
          .onClick(() => {
            this.resultText = 'r=255,g=255,b=255';
          })

        Button('Red')
          .id('btn_red')
          .onClick(() => {
            this.resultText = 'r=255,g=0,b=0';
          })
      }

      Row({ space: 10 }) {
        Button('Green')
          .id('btn_green')
          .onClick(() => {
            this.resultText = 'r=0,g=255,b=0';
          })

        Button('Blue')
          .id('btn_blue')
          .onClick(() => {
            this.resultText = 'r=0,g=0,b=255';
          })

        Button('Gray')
          .id('btn_gray')
          .onClick(() => {
            this.resultText = 'r=128,g=128,b=128';
          })
      }

      Text(this.resultText)
        .id('result_text')
        .fontSize(18)
        .margin({ top: 20 })

      Button('Back')
        .id('btn_back')
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#E0E0E0')
  }
}