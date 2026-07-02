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
  SizeT
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipGroupV2ItemOptionsPage {
  @Local selectedIndex: Array<Int> = [0, 1, 2, 3, 4, 5, 6];

  build() {
    Column() {
      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: { src: $r('app.media.startIcon') } as ChipV2PrefixImageIconConfig,
            label: { text: 'string' },
            accessibilityDescription: 'accessibilityDescription_str',
          } as ChipGroupV2ItemConfig,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') } as ChipV2PrefixImageIconConfig,
            label: { text: 'undefined' },
            accessibilityDescription: undefined,
          } as ChipGroupV2ItemConfig,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') } as ChipV2PrefixImageIconConfig,
            label: { text: '空字符串' },
            accessibilityDescription: '',
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: 10, bottom: 10 }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_clock') } as ChipV2PrefixImageIconConfig,
            label: { text: 'auto' },
            accessibilityLevel: 'auto',
          } as ChipGroupV2ItemConfig,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') } as ChipV2PrefixImageIconConfig,
            label: { text: 'yes' },
            accessibilityLevel: 'yes',
          } as ChipGroupV2ItemConfig,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') } as ChipV2PrefixImageIconConfig,
            label: { text: 'no' },
            accessibilityLevel: 'no',
          } as ChipGroupV2ItemConfig,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') } as ChipV2PrefixImageIconConfig,
            label: { text: '空字符串' },
            accessibilityLevel: '',
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: 10, bottom: 10 }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') } as ChipV2PrefixImageIconConfig,
            label: { text: 'no-hide-descendants' },
            accessibilityLevel: 'no-hide-descendants',
          } as ChipGroupV2ItemConfig,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') } as ChipV2PrefixImageIconConfig,
            label: { text: 'undefined' },
            accessibilityLevel: undefined,
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: 10, bottom: 10 }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') } as ChipV2PrefixImageIconConfig,
            label: { text: 'string-20vp' },
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, startSpace: '20vp', endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: '20vp', bottom: '20vp' }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') } as ChipV2PrefixImageIconConfig,
            label: { text: 'double-20' },
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, startSpace: 20, endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: 20, bottom: 20 }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })

      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') } as ChipV2PrefixImageIconConfig,
            label: { text: 'undefined' },
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, startSpace: undefined, endSpace: 0 }),
        chipGroupPadding: undefined,
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })

      ChipGroupV2({
        items: new ChipGroupV2Items([
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') } as ChipV2PrefixImageIconConfig,
            label: { text: '空字符串' },
          } as ChipGroupV2ItemConfig,
        ]),
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.SMALL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, startSpace: '', endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: '', bottom: '' }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
    }.width('100%').margin({ top: 30 })
  }
}