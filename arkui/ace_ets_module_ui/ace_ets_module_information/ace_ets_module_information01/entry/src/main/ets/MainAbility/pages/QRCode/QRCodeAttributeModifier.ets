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

class MyQRCodeModifier extends AttributeUpdater<QRCodeAttribute> {
  initializeModifier(instance: QRCodeAttribute): void {
    instance.color('#FF0000FF')
    instance.backgroundColor('#FF008000')
  }
}

@Entry
@Component
struct QRCodeAttributeModifier {
  modifier: MyQRCodeModifier = new MyQRCodeModifier()

  build() {
    Column() {
      Text('QRCode AttributeModifier Test')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
      Row() {
        Button('Set color red')
          .onClick(() => {
            this.modifier.attribute?.color('#FFFF0000')
          })
          .id('btn_color_red')
          .height('5%')

        Button('Set color blue')
          .onClick(() => {
            this.modifier.attribute?.color('#FF0000FF')
          })
          .id('btn_color_blue')
          .height('5%')
      }

      Row() {
        Button('Set backgroundColor white')
          .onClick(() => {
            this.modifier.attribute?.backgroundColor('#FFFFFFFF')
          })
          .id('btn_backgroundColor_white')
          .height('5%')

        Button('Set backgroundColor green')
          .onClick(() => {
            this.modifier.attribute?.backgroundColor('#FF008000')
          })
          .id('btn_backgroundColor_green')
          .height('5%')
      }

      QRCode('hello')
        .attributeModifier(this.modifier)
        .id('qrCode_attribute_modifier')


    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
  }
}
