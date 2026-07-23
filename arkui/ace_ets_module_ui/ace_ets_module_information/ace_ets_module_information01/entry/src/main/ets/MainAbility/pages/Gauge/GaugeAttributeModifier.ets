/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { AttributeUpdater } from '@ohos.arkui.modifier'

class MyGaugeModifier extends AttributeUpdater<GaugeAttribute> {
  initializeModifier(instance: GaugeAttribute): void {
    instance.startAngle(210)
    instance.strokeWidth(20)
  }
}

@Entry
@Component
struct GaugeAttributeModifier {
  modifier: MyGaugeModifier = new MyGaugeModifier()

  build() {
    Column() {
      Text('Gauge AttributeModifier Test')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
      Row() {
        Button('Set startAngle 0')
          .onClick(() => {
            this.modifier.attribute?.startAngle(0)
          })
          .id('btn_startAngle_0')
          .height('5%')

        Button('Set startAngle 210')
          .onClick(() => {
            this.modifier.attribute?.startAngle(210)
          })
          .id('btn_startAngle_210')
          .height('5%')
      }

      Row() {
        Button('Set strokeWidth 30')
          .onClick(() => {
            this.modifier.attribute?.strokeWidth(30)
          })
          .id('btn_strokeWidth_30')
          .height('5%')

        Button('Set strokeWidth 20')
          .onClick(() => {
            this.modifier.attribute?.strokeWidth(20)
          })
          .id('btn_strokeWidth_20')
          .height('5%')
      }
      Gauge({ value: 75, min: 0, max: 100 })
        .width(200)
        .height(200)
        .attributeModifier(this.modifier)
        .id('gauge_attribute_modifier')


    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
  }
}
