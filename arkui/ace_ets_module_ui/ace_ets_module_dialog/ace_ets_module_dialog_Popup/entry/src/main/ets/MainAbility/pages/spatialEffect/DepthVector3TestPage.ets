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
struct DepthVector3TestPage {
  @State resultText: string = 'click button to test';

  build() {
    Column({ space: 10 }) {
      Text('DepthVector3 Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('DepthVector3: {x, y, z}')
        .fontSize(16)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('x=100')
          .id('btn_x_positive')
          .onClick(() => {
            this.resultText = 'x=100';
          })

        Button('y=200')
          .id('btn_y_positive')
          .onClick(() => {
            this.resultText = 'y=200';
          })

        Button('z=300')
          .id('btn_z_positive')
          .onClick(() => {
            this.resultText = 'z=300';
          })
      }

      Button('All Zero')
        .id('btn_all_zero')
        .onClick(() => {
          this.resultText = 'x=0,y=0,z=0';
        })

      Button('Negative')
        .id('btn_negative')
        .onClick(() => {
          this.resultText = 'x=-50,y=-50,z=-50';
        })

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