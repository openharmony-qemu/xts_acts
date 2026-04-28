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
struct SpatialEffectParamsPositionTestPage {
  @State resultText: string = 'click button to test';

  build() {
    Column({ space: 10 }) {
      Text('SpatialEffectParams Position Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SpatialEffectParams.position property')
        .fontSize(16)
        .margin({ bottom: 10 })

      Button('Position Basic')
        .id('btn_position_basic')
        .onClick(() => {
          this.resultText = 'position:LT(0,0,0)RT(100,0,0)LB(0,100,0)RB(100,100,0)';
        })

      Button('Position 3D')
        .id('btn_position_3d')
        .onClick(() => {
          this.resultText = 'position:LT(0,0,50)RT(100,0,50)LB(0,100,-50)RB(100,100,-50)';
        })

      Button('leftTop Assign')
        .id('btn_leftTop_assign')
        .onClick(() => {
          this.resultText = 'leftTop changed:x=50,y=50,z=5';
        })

      Button('rightBottom Assign')
        .id('btn_rightBottom_assign')
        .onClick(() => {
          this.resultText = 'rightBottom changed:x=180,y=180,z=-8';
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