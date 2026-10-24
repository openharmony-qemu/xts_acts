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
  $r,
  ChipGroupV2,
  ChipGroupV2Item,
  ChipGroupV2ItemStyle,
  ChipGroupV2Space,
  ChipGroupV2Padding,
  ChipV2Size,
  ColorMetrics,
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

@Entry
@ComponentV2
struct ChipGroupV2OnItemsChange {
  @Local chipItems: ChipGroupV2Items = defaultItems();
  @Local selectedIndex: Array<Int> = [0];
  @Local callbackCount: number = 0;

  onItemsCb: Callback<ChipGroupV2Items> = (items: ChipGroupV2Items) => {
    console.info('ChipGroupV2OnItemsChange onItemsChange triggered, count will be ' + (this.callbackCount + 1));
    this.callbackCount = this.callbackCount + 1;
  };

  build() {
    Column() {
      ChipGroupV2({
        onItemsChange: this.onItemsCb,
        items: this.chipItems,
        itemStyle: new ChipGroupV2ItemStyle({
          size: ChipV2Size.NORMAL,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
          selectedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          selectedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
        }),
        selectedIndexes: this.selectedIndex,
        multiple: true,
        chipGroupSpace: new ChipGroupV2Space({ itemSpace: 8, endSpace: 0 }),
        chipGroupPadding: new ChipGroupV2Padding({ top: 10, bottom: 10 }),
        onChange: (activatedChipsIndex: Array<Int>) => {
          console.info('ChipGroupV2OnItemsChange onChange: ' + activatedChipsIndex);
        },
      }).id('ChipGroupV2OnItemsChange_group').width('80%').height('20%')

      Row() {
        Button('reset').id('ChipGroupV2OnItemsChange_btn_reset').width('40%').height('5%')
          .onClick((): void => {
            this.chipItems = defaultItems();
            this.callbackCount = 0;
            this.selectedIndex = [0];
            console.info('ChipGroupV2OnItemsChange reset clicked, callbackCount=0');
          })
      }.width('80%').height('6%')

      Text('count=' + this.callbackCount)
        .id('ChipGroupV2OnItemsChange_result').width('80%').height('5%')
    }.width('100%').height('100%')
  }
}
