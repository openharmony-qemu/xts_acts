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

import {
  Entry,
  ComponentV2,
  Local,
  Column,
  Row,
  Text,
  Button,
  ChipGroupV2,
  ChipGroupV2Item,
  ChipGroupV2Items,
  Callback
} from '@kit.ArkUI';

function defaultItems(): ChipGroupV2Items {
  return new ChipGroupV2Items([
    { label: { text: 'item0' }, allowClose: true },
    { label: { text: 'item1' }, allowClose: true },
    { label: { text: 'item2' }, allowClose: true },
  ]);
}

type ItemsCb = Callback<ChipGroupV2Items>;

@Entry
@ComponentV2
struct ChipGroupV2OnItemsChangeAbnormal {
  @Local chipItems: ChipGroupV2Items = defaultItems();
  @Local selectedIndex: Array<Int> = [0];
  @Local callbackCount: number = 0;
  @Local cbEnabled: boolean = true;

  private onItemsCb: ItemsCb = (items: ChipGroupV2Items) => {
    this.callbackCount = this.callbackCount + 1;
    console.info('ChipGroupV2OnItemsChangeAbnormal onItemsChange triggered, count=' + this.callbackCount);
  };

  build() {
    Column() {
      if (this.cbEnabled) {
        ChipGroupV2({
          onItemsChange: this.onItemsCb,
          items: this.chipItems,
          selectedIndexes: this.selectedIndex,
          multiple: true,
          onChange: (activatedChipsIndex: Array<Int>) => {
            console.info('ChipGroupV2OnItemsChangeAbnormal onChange: ' + activatedChipsIndex);
          },
        }).id('ChipGroupV2OnItemsChangeAbnormal_group').width('80%').height('20%')
      } else {
        ChipGroupV2({
          items: this.chipItems,
          selectedIndexes: this.selectedIndex,
          multiple: true,
          onChange: (activatedChipsIndex: Array<Int>) => {
            console.info('ChipGroupV2OnItemsChangeAbnormal onChange: ' + activatedChipsIndex);
          },
        }).id('ChipGroupV2OnItemsChangeAbnormal_group_noCb').width('80%').height('20%')
      }

      Row() {
        Button('setNull').id('ChipGroupV2OnItemsChangeAbnormal_btn_setNull').width('40%').height('5%')
          .onClick((): void => {
            this.cbEnabled = false;
            console.info('ChipGroupV2OnItemsChangeAbnormal setNull clicked, cbEnabled=false');
          })
        Button('setUndefined').id('ChipGroupV2OnItemsChangeAbnormal_btn_setUndefined').width('40%').height('5%')
          .onClick((): void => {
            this.cbEnabled = false;
            console.info('ChipGroupV2OnItemsChangeAbnormal setUndefined clicked, cbEnabled=false');
          })
      }.width('80%').height('6%')

      Row() {
        Button('setValid').id('ChipGroupV2OnItemsChangeAbnormal_btn_setValid').width('40%').height('5%')
          .onClick((): void => {
            this.cbEnabled = true;
            console.info('ChipGroupV2OnItemsChangeAbnormal setValid clicked, cbEnabled=true');
          })
        Button('reset').id('ChipGroupV2OnItemsChangeAbnormal_btn_reset').width('40%').height('5%')
          .onClick((): void => {
            this.chipItems = defaultItems();
            this.callbackCount = 0;
            this.selectedIndex = [0];
            this.cbEnabled = true;
            console.info('ChipGroupV2OnItemsChangeAbnormal reset clicked, callbackCount=0 cbEnabled=true');
          })
      }.width('80%').height('6%')

      Text('count=' + this.callbackCount)
        .id('ChipGroupV2OnItemsChangeAbnormal_result').width('80%').height('5%')
    }.width('100%').height('100%')
  }
}
