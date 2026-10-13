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
  LengthMetrics
} from '@kit.ArkUI';

class TextStrokeWidthModifier implements AttributeModifier<TextAttribute> {
  applyNormalAttribute(instance: TextAttribute): void {
    instance.strokeWidth(LengthMetrics.vp(5));
  }
}

@Entry
@Component
struct TextStrokeWidth {
  modifier: TextStrokeWidthModifier = new TextStrokeWidthModifier();

  build() {
    Scroll() {
      Column() {
        Text('strokeWidth default')
          .id('text_strokeWidth_default')
          .height('5%')

        Text('strokeWidth vp positive')
          .id('text_strokeWidth_vp_positive')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(5))

        Text('strokeWidth px positive')
          .id('text_strokeWidth_px_positive')
          .height('5%')
          .strokeWidth(LengthMetrics.px(10))

        Text('strokeWidth fp positive')
          .id('text_strokeWidth_fp_positive')
          .height('5%')
          .strokeWidth(LengthMetrics.fp(3))

        Text('strokeWidth lpx positive')
          .id('text_strokeWidth_lpx_positive')
          .height('5%')
          .strokeWidth(LengthMetrics.lpx(5))

        Text('strokeWidth zero')
          .id('text_strokeWidth_zero')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(0))

        Text('strokeWidth negative')
          .id('text_strokeWidth_negative')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(-3))

        Text('strokeWidth percent')
          .id('text_strokeWidth_percent')
          .height('5%')
          .strokeWidth(LengthMetrics.percent(0.5))

        Text('strokeWidth undefined')
          .id('text_strokeWidth_undefined')
          .height('5%')
          .strokeWidth(undefined)

        Text('strokeWidth large')
          .id('text_strokeWidth_large')
          .height('5%')
          .strokeWidth(LengthMetrics.vp(999))

        Text('strokeWidth modifier')
          .id('text_strokeWidth_modifier')
          .height('5%')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}
