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
  AttributeModifier, TextAttribute, Entry,
  Component, Scroll, Column, Text,
  Color, LengthMetrics
} from '@kit.ArkUI';

class TextStrokeColorModifier implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.strokeWidth(LengthMetrics.vp(3));
    instance.strokeColor('#FF0000');
  }
}

@Entry
@Component
struct TextStrokeColor {
  modifier: TextStrokeColorModifier = new TextStrokeColorModifier();

  build() {
    Scroll() {
      Column() {
        Text('strokeColor default')
          .id('text_strokeColor_default')
          .height('5%')
          .fontColor('#000000')
          .strokeWidth(LengthMetrics.vp(3))

        Text('strokeColor string hex')
          .id('text_strokeColor_string_hex')
          .height('5%')
          .fontColor('#000000')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeColor('#FF0000')

        Text('strokeColor number')
          .id('text_strokeColor_number')
          .height('5%')
          .fontColor('#000000')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeColor(0xFF0000)

        Text('strokeColor Color enum')
          .id('text_strokeColor_color_enum')
          .height('5%')
          .fontColor('#000000')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeColor(Color.Red)

        Text('strokeColor rgb string')
          .id('text_strokeColor_rgb_string')
          .height('5%')
          .fontColor('#000000')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeColor('rgb(39,135,217)')

        Text('strokeColor undefined')
          .id('text_strokeColor_undefined')
          .height('5%')
          .fontColor('#0000FF')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeColor(undefined)

        Text('strokeColor empty string')
          .id('text_strokeColor_empty_string')
          .height('5%')
          .fontColor('#00FF00')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeColor('')

        Text('strokeColor invalid string')
          .id('text_strokeColor_invalid_string')
          .height('5%')
          .fontColor('#00FF00')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeColor('invalidColor')

        Text('strokeColor modifier')
          .id('text_strokeColor_modifier')
          .height('5%')
          .fontColor('#000000')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}
