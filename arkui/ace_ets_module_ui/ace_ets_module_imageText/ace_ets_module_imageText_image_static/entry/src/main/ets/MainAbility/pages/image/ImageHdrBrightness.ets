'use static'
/*
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
  Component,
  Scroll,
  Column,
  ColumnOptions,
  Image,
  ImageAttribute,
  AttributeModifier,
  Text,
  Button,
  Row,
  $r,
  FlexAlign,
  HorizontalAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

class HdrBrightnessUndefinedModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(undefined)
  }
}

class HdrBrightness00Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(0.0)
  }
}

class HdrBrightness03Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(0.3)
  }
}

class HdrBrightness08Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(0.8)
  }
}

class HdrBrightness10Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(1.0)
  }
}

class HdrBrightnessNeg1Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(-1)
  }
}

class HdrBrightness20Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(2)
  }
}

@Entry
@Component
struct ImageHdrBrightness {
  hdrBrightnessUndefinedModifier: HdrBrightnessUndefinedModifier = new HdrBrightnessUndefinedModifier()
  hdrBrightness00Modifier: HdrBrightness00Modifier = new HdrBrightness00Modifier()
  hdrBrightness03Modifier: HdrBrightness03Modifier = new HdrBrightness03Modifier()
  hdrBrightness08Modifier: HdrBrightness08Modifier = new HdrBrightness08Modifier()
  hdrBrightness10Modifier: HdrBrightness10Modifier = new HdrBrightness10Modifier()
  hdrBrightnessNeg1Modifier: HdrBrightnessNeg1Modifier = new HdrBrightnessNeg1Modifier()
  hdrBrightness20Modifier: HdrBrightness20Modifier = new HdrBrightness20Modifier()
  @State hdrBrightnessValue: number | undefined = 0.0

  build() {
    Scroll() {
      Column({ space: 8 } as ColumnOptions) {
        Text('hdrBrightness属性测试')
        Row() {
          Image($r('app.media.flower'))
            .width('32%')
            .aspectRatio(1)
            .hdrBrightness(this.hdrBrightnessValue)
            .id('hdrImageKey')
          Image($r('app.media.flower'))
            .width('32%')
            .aspectRatio(1)
            .id('noHdrBrightnessImageKey')
        }

        Row() {
          Button('0.0')
            .id('hdr00')
            .onClick(() => {
              this.hdrBrightnessValue = 0.0
            })
          Image($r('app.media.flower'))
            .id('modifier2')
            .attributeModifier(this.hdrBrightness00Modifier)
            .width('10%')
            .height(35)
        }

        Row() {
          Button('0.3')
            .id('hdr03')
            .onClick(() => {
              this.hdrBrightnessValue = 0.3
            })
          Image($r('app.media.flower'))
            .id('modifier3')
            .attributeModifier(this.hdrBrightness03Modifier)
            .width('10%')
            .height(35)
        }

        Row() {
          Button('0.8')
            .id('hdr08')
            .onClick(() => {
              this.hdrBrightnessValue = 0.8
            })
          Image($r('app.media.flower'))
            .id('modifier4')
            .attributeModifier(this.hdrBrightness08Modifier)
            .width('10%')
            .height(35)
        }

        Row() {
          Button('1.0')
            .id('hdr10')
            .onClick(() => {
              this.hdrBrightnessValue = 1.0
            })
          Image($r('app.media.flower'))
            .id('modifier5')
            .attributeModifier(this.hdrBrightness10Modifier)
            .width('10%')
            .height(35)
        }

        Row() {
          Button('-1')
            .id('hdr_1')
            .onClick(() => {
              this.hdrBrightnessValue = -1
            })
          Image($r('app.media.flower'))
            .id('modifier6')
            .attributeModifier(this.hdrBrightnessNeg1Modifier)
            .width('10%')
            .height(35)
        }

        Row() {
          Button('2')
            .id('hdr20')
            .onClick(() => {
              this.hdrBrightnessValue = 2
            })
          Image($r('app.media.flower'))
            .id('modifier7')
            .attributeModifier(this.hdrBrightness20Modifier)
            .width('10%')
            .height(35)
        }

        Row() {
          Button('undefined')
            .id('hdrUndefined')
            .onClick(() => {
              this.hdrBrightnessValue = undefined
            })
          Image($r('app.media.flower'))
            .id('modifier1')
            .attributeModifier(this.hdrBrightnessUndefinedModifier)
            .width('10%')
            .height(35)
        }
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}