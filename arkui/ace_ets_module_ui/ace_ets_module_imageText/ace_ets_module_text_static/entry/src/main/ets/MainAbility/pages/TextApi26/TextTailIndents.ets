'use static';
/**
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
  LengthMetrics,AttributeModifier,
  TextAttribute,Entry,Component,
  State,Scroll,Column,Text,Observed,
} from '@kit.ArkUI';

@Observed
class TextModifier1 implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.tailIndents(LengthMetrics.vp(20))
  }
}

@Observed
class TextModifier2 implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.tailIndents(LengthMetrics.px(20))
  }
}

@Observed
class TextModifier3 implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.tailIndents(undefined)
  }
}
@Observed
class TextModifier5 implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.tailIndents([LengthMetrics.vp(10), LengthMetrics.vp(20), LengthMetrics.vp(30)])
  }
}

@Entry
@Component
struct TextTailIndents {
  @State modifier1: TextModifier1 = new TextModifier1()
  @State modifier2: TextModifier2 = new TextModifier2()
  @State modifier3: TextModifier3 = new TextModifier3()
  @State modifier5: TextModifier5 = new TextModifier5()

  build() {
    Scroll() {
      Column() {
        Text('Text: tailIndents(default)')
          .id('Text_tailIndents_default')
          .height('5%')

        Text('Text: tailIndents(vp20)')
          .id('Text_tailIndents_vp20')
          .tailIndents(LengthMetrics.vp(20))
          .height('5%')

        Text('Text: tailIndents(px20)')
          .id('Text_tailIndents_px20')
          .tailIndents(LengthMetrics.px(20))
          .height('5%')

        Text('Text: tailIndents(fp20)')
          .id('Text_tailIndents_fp20')
          .tailIndents(LengthMetrics.fp(20))
          .height('5%')

        Text('Text: tailIndents(lpx20)')
          .id('Text_tailIndents_lpx20')
          .tailIndents(LengthMetrics.lpx(20))
          .height('5%')

        Text('Text: tailIndents(vp0)')
          .id('Text_tailIndents_vp0')
          .tailIndents(LengthMetrics.vp(0))
          .height('5%')

        Text('Text: tailIndents(vpNegative)')
          .id('Text_tailIndents_vpNegative')
          .tailIndents(LengthMetrics.vp(-10))
          .height('5%')

        Text('Text: tailIndents(vpLarge)')
          .id('Text_tailIndents_vpLarge')
          .tailIndents(LengthMetrics.vp(999))
          .height('5%')

        Text('Text: tailIndents(undefined)')
          .id('Text_tailIndents_undefined')
          .tailIndents(undefined)
          .height('5%')

        Text('Text: tailIndents(arrayMulti)')
          .id('Text_tailIndents_arrayMulti')
          .tailIndents([LengthMetrics.vp(10), LengthMetrics.vp(20), LengthMetrics.vp(30)])
          .height('5%')

        Text('Text: tailIndents(arraySingle)')
          .id('Text_tailIndents_arraySingle')
          .tailIndents([LengthMetrics.vp(15)])
          .height('5%')

        Text('Text: tailIndents(arrayNegative)')
          .id('Text_tailIndents_arrayNegative')
          .tailIndents([LengthMetrics.vp(-5), LengthMetrics.vp(20)])
          .height('5%')

        Text('Text: tailIndents(percent)')
          .id('Text_tailIndents_percent')
          .tailIndents(LengthMetrics.percent(0.5))
          .height('5%')

        Text('TextModifier: vp20')
          .attributeModifier(this.modifier1)
          .id('TextModifier_tailIndents_vp20')
          .height('5%')
          .borderWidth(1)

        Text('TextModifier: px20')
          .attributeModifier(this.modifier2)
          .id('TextModifier_tailIndents_px20')
          .height('5%')
          .borderWidth(1)

        Text('TextModifier: undefined')
          .attributeModifier(this.modifier3)
          .id('TextModifier_tailIndents_undefined')
          .height('5%')
          .borderWidth(1)

        Text('TextModifier: array')
          .attributeModifier(this.modifier5)
          .id('TextModifier_tailIndents_array')
          .height('5%')
          .borderWidth(1)
      }.height('100%')
    }.height('100%')
  }
}
