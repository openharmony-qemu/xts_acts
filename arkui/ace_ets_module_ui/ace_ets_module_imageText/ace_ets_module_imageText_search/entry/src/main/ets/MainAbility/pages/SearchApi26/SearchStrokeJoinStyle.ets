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

class SearchStrokeJoinStyleModifier implements AttributeModifier<SearchAttribute> {
  public strokeJoinStyleValue: StrokeJoinStyle | undefined;

  constructor(value: StrokeJoinStyle | undefined) {
    this.strokeJoinStyleValue = value;
  }

  applyNormalAttribute(instance: SearchAttribute):void {
    instance.strokeJoinStyle(this.strokeJoinStyleValue);
  }
}

@Entry
@Component
struct SearchStrokeJoinStyle {
  modifierMiter: SearchStrokeJoinStyleModifier =
    new SearchStrokeJoinStyleModifier(StrokeJoinStyle.MITER_JOIN);
  modifierRound: SearchStrokeJoinStyleModifier =
    new SearchStrokeJoinStyleModifier(StrokeJoinStyle.ROUND_JOIN);
  modifierBevel: SearchStrokeJoinStyleModifier =
    new SearchStrokeJoinStyleModifier(StrokeJoinStyle.BEVEL_JOIN);

  build() {
    Column({ space: 5 }) {
      Search({ value: 'Search strokeJoinStyle MITER_JOIN' })
        .id('search_strokeJoinStyle_miter_join')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(StrokeJoinStyle.MITER_JOIN)

      Search({ value: 'Search strokeJoinStyle ROUND_JOIN' })
        .id('search_strokeJoinStyle_round_join')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(StrokeJoinStyle.ROUND_JOIN)

      Search({ value: 'Search strokeJoinStyle BEVEL_JOIN' })
        .id('search_strokeJoinStyle_bevel_join')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(StrokeJoinStyle.BEVEL_JOIN)

      Search({ value: 'Search strokeJoinStyle null' })
        .id('search_strokeJoinStyle_null')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(null)

      Search({ value: 'Search strokeJoinStyle undefined' })
        .id('search_strokeJoinStyle_undefined')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .strokeJoinStyle(undefined)

      Search({ value: 'Search strokeJoinStyle default' })
        .id('search_strokeJoinStyle_default')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)

      Search({ value: 'Search strokeJoinStyle modifier miter' })
        .id('search_strokeJoinStyle_modifier_miter')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .attributeModifier(this.modifierMiter)

      Search({ value: 'Search strokeJoinStyle modifier round' })
        .id('search_strokeJoinStyle_modifier_round')
        .height('5%')
        .width('100%')
        .strokeWidth(LengthMetrics.px(3.0))
        .strokeColor(Color.Red)
        .attributeModifier(this.modifierRound)

      Search({ value: 'Search strokeJoinStyle modifier bevel' })
        .id('search_strokeJoinStyle_modifier_bevel')
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