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

class MyDataPanelModifier extends AttributeUpdater<DataPanelAttribute> {
  initializeModifier(instance: DataPanelAttribute): void {
    instance.closeEffect(false)
    instance.trackBackgroundColor(Color.Black)
  }
}

@Entry
@Component
struct DataPanelAttributeModifier {
  modifier: MyDataPanelModifier = new MyDataPanelModifier()

  build() {
    Column() {
      Text('DataPanel AttributeModifier Test')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
      Row() {
        Button('Set closeEffect true')
          .onClick(() => {
            this.modifier.attribute?.closeEffect(true)
          })
          .id('btn_closeEffect_true')
          .height('5%')

        Button('Set closeEffect false')
          .onClick(() => {
            this.modifier.attribute?.closeEffect(false)
          })
          .id('btn_closeEffect_false')
          .height('5%')
      }

      Row() {
        Button('Set trackColor red')
          .onClick(() => {
            this.modifier.attribute?.trackBackgroundColor('#FFFF0000')
          })
          .id('btn_trackBackgroundColor_red')
          .height('5%')

        Button('Set trackBackgroundColor blue')
          .onClick(() => {
            this.modifier.attribute?.trackBackgroundColor('#FF0000FF')
          })
          .id('btn_trackBackgroundColor_blue')
          .height('5%')
      }

      DataPanel({ values: [20, 40, 20], max: 100, type: DataPanelType.Circle })
        .width(200)
        .height(200)
        .attributeModifier(this.modifier)
        .id('dataPanel_attribute_modifier')


    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
  }
}
