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

class TextStrokeWidthModifier implements AttributeModifier<TextAttribute> {
  public strokeWidthValue: LengthMetrics | null | undefined;

  constructor(value: LengthMetrics | null | undefined) {
    this.strokeWidthValue = value;
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.strokeWidth(this.strokeWidthValue);
  }
}

@Entry
@Component
struct TextStrokeWidth {
  modifierPx: TextStrokeWidthModifier =
    new TextStrokeWidthModifier(LengthMetrics.px(5.0));
  modifierUndefined: TextStrokeWidthModifier =
    new TextStrokeWidthModifier(undefined);

  build() {
    Scroll() {
      Column() {
        Text('Text strokeWidth default')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_default')
          .key('text_strokeWidth_default')
          .strokeColor('#FF0000')

        Text('Text strokeWidth px positive')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_px_positive')
          .key('text_strokeWidth_px_positive')
          .strokeColor('#FF0000')
          .strokeWidth(LengthMetrics.px(3.0))

        Text('Text strokeWidth px negative')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_px_negative')
          .key('text_strokeWidth_px_negative')
          .strokeColor('#FF0000')
          .strokeWidth(LengthMetrics.px(-3.0))

        Text('Text strokeWidth vp')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_vp')
          .key('text_strokeWidth_vp')
          .strokeColor('#FF0000')
          .strokeWidth(LengthMetrics.vp(3.0))

        Text('Text strokeWidth null')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_null')
          .key('text_strokeWidth_null')
          .strokeColor('#FF0000')
          .strokeWidth(null)

        Text('Text strokeWidth undefined')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_undefined')
          .key('text_strokeWidth_undefined')
          .strokeColor('#FF0000')
          .strokeWidth(undefined)

        Text('Text strokeWidth px zero')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_px_zero')
          .key('text_strokeWidth_px_zero')
          .strokeColor('#FF0000')
          .strokeWidth(LengthMetrics.px(0))

        Text('Text strokeWidth percent')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_percent')
          .key('text_strokeWidth_percent')
          .strokeColor('#FF0000')
          .strokeWidth(LengthMetrics.percent(50))

        Text('Text strokeWidth modifier px')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_modifier_px')
          .key('text_strokeWidth_modifier_px')
          .strokeColor('#FF0000')
          .attributeModifier(this.modifierPx)

        Text('Text strokeWidth modifier undefined')
          .width('100%')
          .height('5%')
          .id('text_strokeWidth_modifier_undefined')
          .key('text_strokeWidth_modifier_undefined')
          .strokeColor('#FF0000')
          .attributeModifier(this.modifierUndefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}
