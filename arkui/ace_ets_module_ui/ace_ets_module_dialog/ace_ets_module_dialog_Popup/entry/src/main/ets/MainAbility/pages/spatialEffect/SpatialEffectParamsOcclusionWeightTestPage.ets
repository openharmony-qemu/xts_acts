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
struct SpatialEffectParamsOcclusionWeightTestPage {
  @State resultText: string = 'click button to test';

  build() {
    Column({ space: 10 }) {
      Text('SpatialEffectParams OcclusionWeight Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SpatialEffectParams.occlusionWeight property')
        .fontSize(16)
        .margin({ bottom: 10 })

      Text('Range: [0, 1], Default: undefined')
        .fontSize(14)
        .margin({ bottom: 10 })

      Button('Default (undefined)')
        .id('btn_default')
        .onClick(() => {
          this.resultText = 'occlusionWeight:undefined';
        })

      Row({ space: 10 }) {
        Button('Min 0')
          .id('btn_min')
          .onClick(() => {
            this.resultText = 'occlusionWeight:0';
          })

        Button('Max 1')
          .id('btn_max')
          .onClick(() => {
            this.resultText = 'occlusionWeight:1';
          })

        Button('Middle 0.5')
          .id('btn_middle')
          .onClick(() => {
            this.resultText = 'occlusionWeight:0.5';
          })
      }

      Row({ space: 10 }) {
        Button('Decimal 0.25')
          .id('btn_decimal')
          .onClick(() => {
            this.resultText = 'occlusionWeight:0.25';
          })

        Button('Assign 0.8')
          .id('btn_assign')
          .onClick(() => {
            this.resultText = 'occlusionWeight changed:0.8';
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