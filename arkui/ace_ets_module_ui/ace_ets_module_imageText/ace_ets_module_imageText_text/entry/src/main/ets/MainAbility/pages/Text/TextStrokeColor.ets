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

class TextStrokeColorModifier implements AttributeModifier<TextAttribute> {
  public strokeColorValue: ResourceColor | null | undefined;

  constructor(value: ResourceColor | null | undefined) {
    this.strokeColorValue = value;
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.strokeColor(this.strokeColorValue);
  }
}

@Entry
@Component
struct TextStrokeColor {
  modifierBlue: TextStrokeColorModifier = new TextStrokeColorModifier(Color.Blue);
  modifierNull: TextStrokeColorModifier = new TextStrokeColorModifier(null);

  build() {
    Scroll() {
      Column() {
        Text('Text strokeColor default')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_default')
          .key('text_strokeColor_default')
          .strokeWidth(LengthMetrics.px(3.0))

        Text('Text strokeColor string red')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_string_red')
          .key('text_strokeColor_string_red')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('#FF0000')

        Text('Text strokeColor Color enum')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_color_enum')
          .key('text_strokeColor_color_enum')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor(Color.Red)

        Text('Text strokeColor number')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_number')
          .key('text_strokeColor_number')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor(0xFF0000)

        Text('Text strokeColor null')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_null')
          .key('text_strokeColor_null')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor(null)

        Text('Text strokeColor undefined')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_undefined')
          .key('text_strokeColor_undefined')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor(undefined)

        Text('Text strokeColor empty string')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_empty_string')
          .key('text_strokeColor_empty_string')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('')

        Text('Text strokeColor invalid string')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_invalid_string')
          .key('text_strokeColor_invalid_string')
          .strokeWidth(LengthMetrics.px(3.0))
          .strokeColor('invalidcolor')

        Text('Text strokeColor modifier blue')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_modifier_blue')
          .key('text_strokeColor_modifier_blue')
          .strokeWidth(LengthMetrics.px(3.0))
          .attributeModifier(this.modifierBlue)

        Text('Text strokeColor modifier null')
          .width('100%')
          .height('5%')
          .id('text_strokeColor_modifier_null')
          .key('text_strokeColor_modifier_null')
          .strokeWidth(LengthMetrics.px(3.0))
          .attributeModifier(this.modifierNull)
      }
      .width('100%')
    }
    .height('100%')
  }
}
