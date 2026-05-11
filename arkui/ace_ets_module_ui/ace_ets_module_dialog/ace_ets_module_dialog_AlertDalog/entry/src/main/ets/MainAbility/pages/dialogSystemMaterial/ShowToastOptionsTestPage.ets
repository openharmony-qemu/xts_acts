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
import { ComponentContent, FrameNode } from '@kit.ArkUI';

class Params {
  public text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

let contentNode: ComponentContent<Params>;

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
    Text('Distortion Content')
      .fontSize(16)
  }
}

@Entry
@Component
struct Vector4TestPage {
  @State vectorX: number = 0;
  @State vectorY: number = 0;
  @State vectorZ: number = 0;
  @State vectorW: number = 0;

  aboutAppear() {
    contentNode = new ComponentContent(this.getUIContext(), wrapBuilder(buildText), new Params('Vector4 Test'));
  }

  build() {
    Column({ space: 10 }) {
      Text('Vector4 Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('Vector4 used in DistortionComponent.barrelDistortion')
        .fontSize(16)
        .margin({ bottom: 10 })

      Text('x: left edge, y: right edge, z: top edge, w: bottom edge')
        .fontSize(14)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('x=0.1')
          .id('btn_x_positive')
          .onClick(() => {
            this.vectorX = 0.1;
          })

        Button('x=-0.1')
          .id('btn_x_negative')
          .onClick(() => {
            this.vectorX = -0.1;
          })

        Button('x=0')
          .id('btn_x_zero')
          .onClick(() => {
            this.vectorX = 0;
          })
      }

      Row({ space: 10 }) {
        Button('y=0.1')
          .id('btn_y_positive')
          .onClick(() => {
            this.vectorY = 0.1;
          })

        Button('y=-0.1')
          .id('btn_y_negative')
          .onClick(() => {
            this.vectorY = -0.1;
          })

        Button('y=0')
          .id('btn_y_zero')
          .onClick(() => {
            this.vectorY = 0;
          })
      }

      Row({ space: 10 }) {
        Button('z=0.1')
          .id('btn_z_positive')
          .onClick(() => {
            this.vectorZ = 0.1;
          })

        Button('z=-0.1')
          .id('btn_z_negative')
          .onClick(() => {
            this.vectorZ = -0.1;
          })

        Button('z=0')
          .id('btn_z_zero')
          .onClick(() => {
            this.vectorZ = 0;
          })
      }

      Row({ space: 10 }) {
        Button('w=0.1')
          .id('btn_w_positive')
          .onClick(() => {
            this.vectorW = 0.1;
          })

        Button('w=-0.1')
          .id('btn_w_negative')
          .onClick(() => {
            this.vectorW = -0.1;
          })

        Button('w=0')
          .id('btn_w_zero')
          .onClick(() => {
            this.vectorW = 0;
          })
      }

      Button('All Positive 0.5')
        .id('btn_all_positive')
        .onClick(() => {
          this.vectorX = 0.5;
          this.vectorY = 0.5;
          this.vectorZ = 0.5;
          this.vectorW = 0.5;
        })

      Button('All Negative -0.5')
        .id('btn_all_negative')
        .onClick(() => {
          this.vectorX = -0.5;
          this.vectorY = -0.5;
          this.vectorZ = -0.5;
          this.vectorW = -0.5;
        })

      Button('All Zero')
        .id('btn_all_zero')
        .onClick(() => {
          this.vectorX = 0;
          this.vectorY = 0;
          this.vectorZ = 0;
          this.vectorW = 0;
        })

      Button('All Max 1')
        .id('btn_all_max')
        .onClick(() => {
          this.vectorX = 1;
          this.vectorY = 1;
          this.vectorZ = 1;
          this.vectorW = 1;
        })

      Button('All Min -1')
        .id('btn_all_min')
        .onClick(() => {
          this.vectorX = -1;
          this.vectorY = -1;
          this.vectorZ = -1;
          this.vectorW = -1;
        })

      DistortionComponent(contentNode, {
        distortion: {
          topLeft: { x: 0, y: 0 },
          topRight: { x: 1, y: 0 },
          bottomLeft: { x: 0, y: 1 },
          bottomRight: { x: 1, y: 1 },
          barrelDistortion: { x: this.vectorX, y: this.vectorY, z: this.vectorZ, w: this.vectorW }
        }
      })
        .id('distortion_component')
        .width(200)
        .height(200)
        .backgroundColor(Color.Pink)

      Text('barrelDistortion: x=' + this.vectorX + ',y=' + this.vectorY + ',z=' + this.vectorZ + ',w=' + this.vectorW)
        .id('result_text')
        .fontSize(14)
        .margin({ top: 10 })

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
  }
}