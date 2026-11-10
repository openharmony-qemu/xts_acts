'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Grid,
  GridItem,
  ForEach,
  LazyForEach,
  Scroller,
  ScrollSnapAlign,
  ScrollSnapOffsetProvider,
  TextAlign
} from '@ohos.arkui.component';
import { GridDataSource } from './GridDataSource';

const ITEM_HEIGHT: number = 100;
const ROW_GAP: number = 20;
const SNAP_INTERVAL: number = 2 * (ITEM_HEIGHT + ROW_GAP);

class GridSnapProvider implements ScrollSnapOffsetProvider {
  private scroller: Scroller;

  constructor(scroller: Scroller) {
    this.scroller = scroller;
  }

  calculateApproachOffset(velocity: double, decayOffset: double): double {
    // 返回距离大小，滚动方向由组件根据速度处理。
    return velocity === 0 ? 0 : Math.min(decayOffset, SNAP_INTERVAL);
  }

  calculateSnapOffset(velocity: double): double {
    const offset: number = this.scroller.currentOffset()?.yOffset!;
    const group: number = offset / SNAP_INTERVAL;
    let targetGroup: number = Math.round(group);
    if (velocity > 0) {
      targetGroup = Math.ceil(group);
    } else if (velocity < 0) {
      targetGroup = Math.floor(group);
    }
    return Math.max(0, targetGroup * SNAP_INTERVAL);
  }
}

@Entry
@Component
struct GridScrollSnapStrategy {
  numbers: GridDataSource = new GridDataSource(50);
  private snapScroller: Scroller = new Scroller();
  private snapProvider: ScrollSnapOffsetProvider = new GridSnapProvider(this.snapScroller);

  build() {
    Column({ space: 2 } as ColumnOptions) {
      // 测试1: scrollSnapStrategy 设置为 ScrollSnapAlign.START
      Grid() {
        LazyForEach(this.numbers, (item: string, index: int) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .height(ITEM_HEIGHT)
          .backgroundColor(0xF9CF93)
        }, (item: string, index: int): string => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(ROW_GAP)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.START)
      .id('grid_snapStrategy_start')

      // 测试2: scrollSnapStrategy 设置为 ScrollSnapAlign.CENTER
      Grid() {
        LazyForEach(this.numbers, (item: string, index: int) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .height(ITEM_HEIGHT)
          .backgroundColor(0xF9CF93)
        }, (item: string, index: int): string => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(ROW_GAP)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.CENTER)
      .id('grid_snapStrategy_center')

      // 测试3: scrollSnapStrategy 设置为 ScrollSnapAlign.END
      Grid() {
        LazyForEach(this.numbers, (item: string, index: int) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .height(ITEM_HEIGHT)
          .backgroundColor(0xF9CF93)
        }, (item: string, index: int): string => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(ROW_GAP)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.END)
      .id('grid_snapStrategy_end')

      // 测试4: scrollSnapStrategy 设置为 ScrollSnapAlign.NONE
      Grid() {
        LazyForEach(this.numbers, (item: string, index: int) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .height(ITEM_HEIGHT)
          .backgroundColor(0xF9CF93)
        }, (item: string, index: int): string => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(ROW_GAP)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.NONE)
      .id('grid_snapStrategy_none')

      // 测试5: scrollSnapStrategy 设置为 undefined
      Grid() {
        LazyForEach(this.numbers, (item: string, index: int) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .height(ITEM_HEIGHT)
          .backgroundColor(0xF9CF93)
        }, (item: string, index: int): string => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(ROW_GAP)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(undefined)
      .id('grid_snapStrategy_undefined')

      // 测试6: scrollSnapStrategy 设置为 ScrollSnapOffsetProvider 对象（每两行一组吸附）
      Grid(this.snapScroller) {
        LazyForEach(this.numbers, (item: string, index: int) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .height(ITEM_HEIGHT)
          .backgroundColor(0xF9CF93)
        }, (item: string, index: int): string => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(ROW_GAP)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(this.snapProvider)
      .id('grid_snapStrategy_provider')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
