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
 
import { ChipSize, ChipGroup, ChipGroupItemOptions } from '@kit.ArkUI';

type OnItemsChangeCb = Callback<ChipGroupItemOptions[]>;

@Entry
@Preview
@Component
struct ChipGroupOnItemsChangeAbnormal {
  @State chipop: ChipGroupItemOptions[] = [
    { label: { text: 'item0' }, allowClose: true },
    { label: { text: 'item1' }, allowClose: true },
    { label: { text: 'item2' }, allowClose: true },
    { label: { text: 'item3' }, allowClose: true },
  ];
  @State callbackCount: number = 0;
  @State callbackText: string = '';
  @State selectedIndex: Array<number> = [0];
  @State cbEnabled: boolean = true;

  private onItemsCb: OnItemsChangeCb = (items: ChipGroupItemOptions[]) => {
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
    console.info('ChipGroupOnItemsChangeAbnormal onItemsChange triggered, count=' + this.callbackCount + ' text=' + this.callbackText);
  };

  build() {
    Column() {
      if (this.cbEnabled) {
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
          onChange: (activatedChipsIndex: Array<number>) => {
            console.info('ChipGroupOnItemsChangeAbnormal onChange: ' + activatedChipsIndex);
          },
          onItemsChange: this.onItemsCb
        }).key('ChipGroupOnItemsChangeAbnormal_group').width('80%').height('20%')
      } else {
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
          onChange: (activatedChipsIndex: Array<number>) => {
            console.info('ChipGroupOnItemsChangeAbnormal onChange: ' + activatedChipsIndex);
          },
        }).key('ChipGroupOnItemsChangeAbnormal_group_noCb').width('80%').height('20%')
      }

      Row() {
        Button('setNull').key('ChipGroupOnItemsChangeAbnormal_btn_setNull').width('40%').height('5%')
          .onClick(() => {
            this.cbEnabled = false;
            console.info('ChipGroupOnItemsChangeAbnormal setNull clicked, cbEnabled=false');
          })
        Button('setUndefined').key('ChipGroupOnItemsChangeAbnormal_btn_setUndefined').width('40%').height('5%')
          .onClick(() => {
            this.cbEnabled = false;
            console.info('ChipGroupOnItemsChangeAbnormal setUndefined clicked, cbEnabled=false');
          })
      }.width('80%').height('6%')

      Row() {
        Button('setValid').key('ChipGroupOnItemsChangeAbnormal_btn_setValid').width('40%').height('5%')
          .onClick(() => {
            this.cbEnabled = true;
            console.info('ChipGroupOnItemsChangeAbnormal setValid clicked, cbEnabled=true');
          })
        Button('reset').key('ChipGroupOnItemsChangeAbnormal_btn_reset').width('40%').height('5%')
          .onClick(() => {
            this.chipop = [
              { label: { text: 'item0' }, allowClose: true },
              { label: { text: 'item1' }, allowClose: true },
              { label: { text: 'item2' }, allowClose: true },
              { label: { text: 'item3' }, allowClose: true },
            ];
            this.callbackCount = 0;
            this.callbackText = '';
            this.selectedIndex = [0];
            this.cbEnabled = true;
            console.info('ChipGroupOnItemsChangeAbnormal reset clicked, callbackCount=0 cbEnabled=true');
          })
      }.width('80%').height('6%')

      Text('count=' + this.callbackCount + '|text=' + this.callbackText)
        .key('ChipGroupOnItemsChangeAbnormal_result').width('80%').height('5%')
    }.width('100%').height('100%')
  }
}
