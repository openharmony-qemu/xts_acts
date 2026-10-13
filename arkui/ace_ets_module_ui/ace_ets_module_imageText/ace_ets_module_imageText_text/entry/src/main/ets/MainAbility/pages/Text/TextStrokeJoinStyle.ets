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

class TextStrokeJoinStyleModifier implements AttributeModifier<TextAttribute> {
  public strokeJoinStyleValue: StrokeJoinStyle | undefined;

  constructor(value: StrokeJoinStyle | undefined) {
    this.strokeJoinStyleValue = value;
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.strokeJoinStyle(this.strokeJoinStyleValue);
  }
}

@Entry
@Component
struct TextStrokeJoinStyle {
  modifierRoundJoin: TextStrokeJoinStyleModifier =
    new TextStrokeJoinStyleModifier(StrokeJoinStyle.ROUND_JOIN);
  modifierUndefined: TextStrokeJoinStyleModifier =
    new TextStrokeJoinStyleModifier(undefined);

  build() {
    Row() {
      Column() {
        Text('Text strokeJoinStyle default')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_default')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')

        Text('Text strokeJoinStyle MITER_JOIN')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_MITER_JOIN')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .strokeJoinStyle(StrokeJoinStyle.MITER_JOIN)

        Text('Text strokeJoinStyle ROUND_JOIN')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_ROUND_JOIN')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .strokeJoinStyle(StrokeJoinStyle.ROUND_JOIN)

        Text('Text strokeJoinStyle BEVEL_JOIN')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_BEVEL_JOIN')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .strokeJoinStyle(StrokeJoinStyle.BEVEL_JOIN)

        Text('Text strokeJoinStyle undefined')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_undefined')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .strokeJoinStyle(undefined)

        Text('Text strokeJoinStyle null')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_null')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .strokeJoinStyle(null)

        Text('Text strokeJoinStyle invalid enum')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_invalid_enum')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .strokeJoinStyle(99 as StrokeJoinStyle)

        Text('Text strokeJoinStyle modifier ROUND_JOIN')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_modifier_ROUND_JOIN')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .attributeModifier(this.modifierRoundJoin)

        Text('Text strokeJoinStyle modifier undefined')
          .width('100%')
          .height('5%')
          .id('text_strokeJoinStyle_modifier_undefined')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')
          .attributeModifier(this.modifierUndefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}
