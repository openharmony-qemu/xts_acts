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
  LengthMetrics, StrokeJoinStyle
} from '@kit.ArkUI';

class TextStrokeJoinStyleModifier implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.strokeWidth(LengthMetrics.vp(3));
    instance.strokeJoinStyle(StrokeJoinStyle.ROUND_JOIN);
  }
}

@Entry
@Component
struct TextStrokeJoinStyle {
  modifier: TextStrokeJoinStyleModifier = new TextStrokeJoinStyleModifier();

  build() {
    Scroll() {
      Column() {
        Text('strokeJoinStyle default')
          .id('text_strokeJoinStyle_default')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(3))

        Text('strokeJoinStyle MITER_JOIN')
          .id('text_strokeJoinStyle_miter_join')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeJoinStyle(StrokeJoinStyle.MITER_JOIN)

        Text('strokeJoinStyle ROUND_JOIN')
          .id('text_strokeJoinStyle_round_join')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeJoinStyle(StrokeJoinStyle.ROUND_JOIN)

        Text('strokeJoinStyle BEVEL_JOIN')
          .id('text_strokeJoinStyle_bevel_join')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeJoinStyle(StrokeJoinStyle.BEVEL_JOIN)

        Text('strokeJoinStyle undefined')
          .id('text_strokeJoinStyle_undefined')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(3))
          .strokeJoinStyle(undefined)

        Text('strokeJoinStyle modifier')
          .id('text_strokeJoinStyle_modifier')
          .height('5%')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}
