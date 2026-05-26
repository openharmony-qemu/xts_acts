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

import { LengthMetrics } from '@kit.ArkUI';

class TextAreaStrokeJoinStyleModifier implements AttributeModifier<TextAreaAttribute> {
  public strokeJoinStyleValue: StrokeJoinStyle | undefined;

  constructor(value: StrokeJoinStyle | undefined) {
    this.strokeJoinStyleValue = value;
  }

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.strokeJoinStyle(this.strokeJoinStyleValue);
  }
}

@Entry
@Component
struct TextAreaStrokeJoinStyle {
  modifierMiter: TextAreaStrokeJoinStyleModifier =
    new TextAreaStrokeJoinStyleModifier(StrokeJoinStyle.MITER_JOIN);
  modifierRound: TextAreaStrokeJoinStyleModifier =
    new TextAreaStrokeJoinStyleModifier(StrokeJoinStyle.ROUND_JOIN);
  modifierBevel: TextAreaStrokeJoinStyleModifier =
    new TextAreaStrokeJoinStyleModifier(StrokeJoinStyle.BEVEL_JOIN);

  build() {
    Column({ space: 5 }) {
      TextArea({ placeholder: 'TextArea strokeJoinStyle MITER_JOIN' })
        .id('textarea_strokeJoinStyle_miter_join')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(StrokeJoinStyle.MITER_JOIN)

      TextArea({ placeholder: 'TextArea strokeJoinStyle ROUND_JOIN' })
        .id('textarea_strokeJoinStyle_round_join')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(StrokeJoinStyle.ROUND_JOIN)

      TextArea({ placeholder: 'TextArea strokeJoinStyle BEVEL_JOIN' })
        .id('textarea_strokeJoinStyle_bevel_join')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(StrokeJoinStyle.BEVEL_JOIN)

      TextArea({ placeholder: 'TextArea strokeJoinStyle null' })
        .id('textarea_strokeJoinStyle_null')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(null)

      TextArea({ placeholder: 'TextArea strokeJoinStyle undefined' })
        .id('textarea_strokeJoinStyle_undefined')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(undefined)

      TextArea({ placeholder: 'TextArea strokeJoinStyle default' })
        .id('textarea_strokeJoinStyle_default')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)

      TextArea({ placeholder: 'TextArea strokeJoinStyle modifier miter' })
        .id('textarea_strokeJoinStyle_modifier_miter')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .attributeModifier(this.modifierMiter)

      TextArea({ placeholder: 'TextArea strokeJoinStyle modifier round' })
        .id('textarea_strokeJoinStyle_modifier_round')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .attributeModifier(this.modifierRound)

      TextArea({ placeholder: 'TextArea strokeJoinStyle modifier bevel' })
        .id('textarea_strokeJoinStyle_modifier_bevel')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .attributeModifier(this.modifierBevel)
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}