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
struct SpatialPositionTestPage {
  @State resultText: string = 'click button to test';

  build() {
    Column({ space: 10 }) {
      Text('SpatialPosition Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SpatialPosition: {leftTop, rightTop, leftBottom, rightBottom}')
        .fontSize(16)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('leftTop')
          .id('btn_leftTop')
          .onClick(() => {
            this.resultText = 'leftTop:x=0,y=0,z=0';
          })

        Button('rightTop')
          .id('btn_rightTop')
          .onClick(() => {
            this.resultText = 'rightTop:x=100,y=0,z=0';
          })
      }

      Row({ space: 10 }) {
        Button('leftBottom')
          .id('btn_leftBottom')
          .onClick(() => {
            this.resultText = 'leftBottom:x=0,y=100,z=0';
          })

        Button('rightBottom')
          .id('btn_rightBottom')
          .onClick(() => {
            this.resultText = 'rightBottom:x=100,y=100,z=0';
          })
      }

      Button('All Corners')
        .id('btn_all_corners')
        .onClick(() => {
          this.resultText = 'LT:0,0,0 RT:100,0,0 LB:0,100,0 RB:100,100,0';
        })

      Button('3D Coordinates')
        .id('btn_3d')
        .onClick(() => {
          this.resultText = 'LT:0,0,10 RT:100,0,10 LB:0,100,-10 RB:100,100,-10';
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