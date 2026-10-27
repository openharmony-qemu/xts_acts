'use static';

/*
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

import { ChipGroup, ChipGroupItemOptions } from '@ohos.arkui.advanced.ChipGroup';
import { ChipSize } from '@ohos.arkui.advanced.Chip';
import { Entry, Component, Column, Row, Text, Button, $r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ChipGroupOnItemsChange {
  @State chipop: ChipGroupItemOptions[] = [
    { label: { text: 'item0' }, allowClose: true } as ChipGroupItemOptions,
    { label: { text: 'item1' }, allowClose: true } as ChipGroupItemOptions,
    { label: { text: 'item2' }, allowClose: true } as ChipGroupItemOptions,
  ];
  @State callbackCount: number = 0;
  @State callbackText: string = '';
  @State selectedIndex: Array<Int> = [0];

  build() {
    Column() {
      ChipGroup({
        items: this.chipop,
        itemStyle: {
          size: ChipSize.NORMAL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selectedIndex,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('ChipGroupOnItemsChange onChange: ' + activatedChipsIndex);
        },
        onItemsChange: (items: ChipGroupItemOptions[]) => {
          console.info('ChipGroupOnItemsChange onItemsChange triggered, items.length=' + items.length);
          this.callbackCount = this.callbackCount + 1;
          let texts: string[] = [];
          for (let i = 0; i < items.length; i++) {
            let item = items[i];
            if (item && item.label && item.label.text) {
              texts.push(item.label.text);
            } else {
              texts.push('');
            }
          }
          this.callbackText = texts.join('|');
          console.info('ChipGroupOnItemsChange onItemsChange callbackCount=' + this.callbackCount + ' text=' + this.callbackText);
        }
      }).key('ChipGroupOnItemsChange_group').width('80%').height('20%')

      Row() {
        Button('add').key('ChipGroupOnItemsChange_btn_add').width('40%').height('5%')
          .onClick((): void => {
            console.info('ChipGroupOnItemsChange add clicked, before len=' + this.chipop.length);
            let newArr: ChipGroupItemOptions[] = [];
            for (let i = 0; i < this.chipop.length; i++) {
              newArr.push(this.chipop[i]);
            }
            newArr.push({ label: { text: 'item_new_' + this.chipop.length }, allowClose: true } as ChipGroupItemOptions);
            this.chipop = newArr;
            console.info('ChipGroupOnItemsChange add clicked, after len=' + this.chipop.length + ' callbackCount=' + this.callbackCount);
          })
        Button('reset').key('ChipGroupOnItemsChange_btn_reset').width('40%').height('5%')
          .onClick((): void => {
            this.chipop = [
              { label: { text: 'item0' }, allowClose: true } as ChipGroupItemOptions,
              { label: { text: 'item1' }, allowClose: true } as ChipGroupItemOptions,
              { label: { text: 'item2' }, allowClose: true } as ChipGroupItemOptions,
            ];
            this.callbackCount = 0;
            this.callbackText = '';
            this.selectedIndex = [0];
            console.info('ChipGroupOnItemsChange reset clicked, callbackCount=0');
          })
      }.width('80%').height('6%')

      Text('count=' + this.callbackCount + '|text=' + this.callbackText)
        .key('ChipGroupOnItemsChange_result').width('80%').height('5%')
    }.width('100%').height('100%')
  }
}
