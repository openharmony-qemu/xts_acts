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

import { SegmentButtonV2Items, SegmentButtonV2Item, TabSegmentButtonV2,
  CapsuleSegmentButtonV2 } from '@ohos.arkui.advanced.SegmentButtonV2'

@Entry
@ComponentV2
struct SegmentButtonV2Hybrid {
  @Local isHybridResult1: string = '';
  @Local isHybridResult2: string = '';
  @Local isHybridResult3: string = '';
  @Local isHybridResult4: string = '';
  @Local hasHybridResult1: string = '';
  @Local hasHybridResult2: string = '';
  @Local hasHybridResult3: string = '';
  @Local selectedIndex0: number = 0;
  @Local selectedIndex1: number = 0;
  @Local selectedIndex2: number = 0;

  @Local hybridItem: SegmentButtonV2Item = new SegmentButtonV2Item(
    { text: 'hybrid', symbol: $r('sys.symbol.phone') }
  );

  @Local textOnlyItem: SegmentButtonV2Item = new SegmentButtonV2Item(
    { text: 'textOnly' }
  );

  @Local iconOnlyItem: SegmentButtonV2Item = new SegmentButtonV2Item(
    { text: 'iconItem', icon: $r('sys.media.ohos_ic_public_search_filled') }
  );

  @Local textIconSymbolItem: SegmentButtonV2Item = new SegmentButtonV2Item(
    { text: 'allTypes', icon: $r('sys.media.ohos_ic_public_search_filled'), symbol:undefined}
  );

  @Local itemsWithHybrid: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'search', icon: $r('sys.media.ohos_ic_public_search_filled') },
    { text: 'scan', icon: $r('sys.media.ohos_ic_public_scan') },
    { text: 'feedback', symbol: $r('sys.symbol.fade') }
  ]);

  @Local itemsWithoutHybrid: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'search', icon: $r('sys.media.ohos_ic_public_search_filled') },
    { text: 'scan', icon: $r('sys.media.ohos_ic_public_scan') },
    { text: 'share', icon: $r('sys.media.ohos_ic_public_share') }
  ]);

  @Local textOnlyItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '语文' },
    { text: '数学' },
    { text: '英语' }
  ]);

  build() {
    Scroll() {
      Column({ space: 3 }) {
        Button('getIsHybrid_hybridItem')
          .onClick(() => {
            this.isHybridResult1 = this.hybridItem.isHybrid.toString();
          })
          .id('btn_isHybrid_hybrid')

        Text(this.isHybridResult1)
          .id('isHybrid_result1')

        Button('getIsHybrid_textOnlyItem')
          .onClick(() => {
            this.isHybridResult2 = this.textOnlyItem.isHybrid.toString();
          })
          .id('btn_isHybrid_textOnly')

        Text(this.isHybridResult2)
          .id('isHybrid_result2')

        Button('getIsHybrid_iconOnlyItem')
          .onClick(() => {
            this.isHybridResult3 = this.iconOnlyItem.isHybrid.toString();
          })
          .id('btn_isHybrid_iconOnly')

        Text(this.isHybridResult3)
          .id('isHybrid_result3')

        Button('getIsHybrid_textIconSymbolItem')
          .onClick(() => {
            this.isHybridResult4 = this.textIconSymbolItem.isHybrid.toString();
          })
          .id('btn_isHybrid_textIconSymbol')

        Text(this.isHybridResult4)
          .id('isHybrid_result4')

        Button('getHasHybrid_withHybrid')
          .onClick(() => {
            this.hasHybridResult1 = this.itemsWithHybrid.hasHybrid.toString();
          })
          .id('btn_hasHybrid_withHybrid')

        Text(this.hasHybridResult1)
          .id('hasHybrid_result1')

        Button('getHasHybrid_withoutHybrid')
          .onClick(() => {
            this.hasHybridResult2 = this.itemsWithoutHybrid.hasHybrid.toString();
          })
          .id('btn_hasHybrid_withoutHybrid')

        Text(this.hasHybridResult2)
          .id('hasHybrid_result2')

        Button('getHasHybrid_textOnlyItems')
          .onClick(() => {
            this.hasHybridResult3 = this.textOnlyItems.hasHybrid.toString();
          })
          .id('btn_hasHybrid_textOnly')

        Text(this.hasHybridResult3)
          .id('hasHybrid_result3')

        TabSegmentButtonV2({
          items: this.itemsWithHybrid,
          selectedIndex: this.selectedIndex0,
          $selectedIndex: (selectedIndex: number) => {
            this.selectedIndex0 = selectedIndex;
          }
        }).key('TabSegmentButtonV2_hybrid_01')

        TabSegmentButtonV2({
          items: this.itemsWithoutHybrid,
          selectedIndex: this.selectedIndex1,
          $selectedIndex: (selectedIndex: number) => {
            this.selectedIndex1 = selectedIndex;
          }
        }).key('TabSegmentButtonV2_hybrid_02')

        CapsuleSegmentButtonV2({
          items: this.textOnlyItems,
          selectedIndex: this.selectedIndex2!!,
        }).key('CapsuleSegmentButtonV2_hybrid_01')
      }
      .constraintSize({ minHeight: '90%' })
      .justifyContent(FlexAlign.Start)
      .padding(5)
    }
    .backgroundColor('#f1f3f5')
    .width('100%')
    .height('90%')
  }
}
