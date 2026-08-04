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
  Entry,
  Column,
  ComponentV2,
  Color,
  $r,
  ColumnOptions,
  Local,
  ChipV2Size,
  ChipGroupV2,
  ChipGroupV2Items,
  ChipGroupV2IconGroupSuffix,
  SymbolGlyphModifier,
  ChipGroupV2ItemStyle,
  ChipGroupV2Space,
  ChipGroupV2Padding,
  ColorMetrics,
  ChipV2PrefixImageIconConfig,
  ChipV2PrefixSymbolIconConfig,
  ChipV2SuffixSymbolIconConfig,
  ChipGroupV2ItemConfig,
  LengthMetrics,
  SizeT,
  ChipV2CloseConfig,
  ChipV2SuffixImageIconConfig
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipGroupV2ItemOptionsPage2 {
  @Local selectedIndex: Array<Int> = [0];
  @Local prefixModifierNormal: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'));
  @Local tex1: string = 'ww'

  build() {
    Column() {
      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: {
              src: $r('app.media.startIcon'),
              size: { width: LengthMetrics.vp(18), height: LengthMetrics.vp(18) } as SizeT<LengthMetrics>
            } as ChipV2PrefixImageIconConfig,
            label: { text: '操作块1' },
            suffixIcon: {
              src: $r('sys.media.ohos_ic_public_cut'),
              action: () => {
                console.log('ww')
              }, accessibilityText: '后缀图标的无障碍文本属性'
            } as ChipV2SuffixImageIconConfig,
            closeIcon: { fontSize: LengthMetrics.vp(22) } as ChipV2CloseConfig,
            allowClose: false
          } as ChipGroupV2ItemConfig,
          {
            prefixSymbolIcon: { normal: this.prefixModifierNormal } as ChipV2PrefixSymbolIconConfig,
            label: { text: '操作块3' },
            suffixSymbolIcon: {
              normal: this.prefixModifierNormal, normalAccessibility: {
                accessibilityText: '保存'
              },
              action: () => {
                this.getUIContext().getPromptAction().showToast({
                  message: '后缀图标被点击！'
                });
              }
            } as ChipV2SuffixSymbolIconConfig,
            allowClose: true
          } as ChipGroupV2ItemConfig,
        ]),
        selectedIndexes: this.selectedIndex,
        multiple: false,
      })
    }
    .padding({
      top: '5%',
      bottom: '5%',
      left: '5%',
      right: '5%',
    })
  }
}