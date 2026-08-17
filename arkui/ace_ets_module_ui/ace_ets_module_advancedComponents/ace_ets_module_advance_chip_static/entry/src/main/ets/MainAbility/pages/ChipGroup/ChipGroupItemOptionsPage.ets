'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Text, Column, Component, Button, ClickEvent, Color, $r, ColumnOptions, FlexAlign, Direction, Builder, Row, Margin } from '@ohos.arkui.component'
import { State, Watch, PropRef, StoragePropRef } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { ChipGroup, IconGroupSuffix, IconItemOptions, ChipGroupItemOptions, ChipItemStyle, SuffixImageIconOptions } from '@ohos.arkui.advanced.ChipGroup';
import { ChipSize , ChipSymbolGlyphOptions} from '@ohos.arkui.advanced.Chip';

@Entry
@Component
struct ChipGroupOptionsPage {
  @State selected_index: Array<int> = [0, 1, 2, 3, 4, 5, 6];
  @StoragePropRef('chipGroupOptionsTestIndex') testIndex: int = 0;

  build() {
    Column() {
      if (this.testIndex == 0) {
        ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('app.media.startIcon') },
            label: { text: 'string' },
            accessibilityDescription: 'accessibilityDescription_str',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') },
            label: { text: 'undefined' },
            accessibilityDescription: undefined,
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') },
            label: { text: '空字符串' },
            accessibilityDescription: '',
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
        })
      }
      if (this.testIndex == 1) {
        ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_clock') },
            label: { text: 'auto' },
            accessibilityLevel: 'auto',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: 'yes' },
            accessibilityLevel: 'yes',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: 'no' },
            accessibilityLevel: 'no',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: '空字符串' },
            accessibilityLevel: '',
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
        })
      }
      if (this.testIndex == 2) {
        ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'no-hide-descendants' },
            accessibilityLevel: 'no-hide-descendants',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: 'undefined' },
            accessibilityLevel: undefined,
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
        })
      }
      if (this.testIndex == 3) {
        ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'string-20vp' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: '20vp', endSpace: 0 },
        chipGroupPadding: { top: '20vp', bottom: '20vp' },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
        })
      }
      if (this.testIndex == 4) {
        ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'double-20' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: 20, endSpace: 0 },
        chipGroupPadding: { top: 20, bottom: 20 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
        })
      }

      if (this.testIndex == 5) {
        ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'undefined' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: undefined, endSpace: 0 },
        chipGroupPadding: undefined,
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
        })
      }

      if (this.testIndex == 6) {
        ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: '空字符串' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: '', endSpace: 0 },
        chipGroupPadding: { top: '', bottom: '' },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
        })
      }
    }.width('100%').margin({ top: 30 } as Margin)
  }
}
