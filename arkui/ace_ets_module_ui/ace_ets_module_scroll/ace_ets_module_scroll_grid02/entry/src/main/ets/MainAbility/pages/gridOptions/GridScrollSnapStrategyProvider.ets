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
const ITEM_HEIGHT: number = 100;
const ROW_GAP: number = 20;
const SNAP_INTERVAL: number = 2 * (ITEM_HEIGHT + ROW_GAP);

class GridSnapProvider implements ScrollSnapOffsetProvider {
  private scroller: Scroller;

  constructor(scroller: Scroller) {
    this.scroller = scroller;
  }

  calculateApproachOffset(velocity: number, decayOffset: number): number {
    return velocity === 0 ? 0 : Math.min(decayOffset, SNAP_INTERVAL);
  }

  calculateSnapOffset(velocity: number): number {
    const offset = this.scroller.currentOffset().yOffset;
    const group = offset / SNAP_INTERVAL;
    let targetGroup = Math.round(group);
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
struct GridScrollSnapStrategyProviderExample {
  @State arr: string[] = [];
  private snapScroller: Scroller = new Scroller();
  private snapProvider: ScrollSnapOffsetProvider = new GridSnapProvider(this.snapScroller);

  aboutToAppear() {
    let list: string[] = [];
    for (let i = 0; i < 50; i++) {
      list.push(i.toString());
    }
    this.arr = list;
  }

  build() {
    Column({ space: 2 }) {
      // 测试1: scrollSnapStrategy 设置为 ScrollSnapOffsetProvider 对象（每两行一组吸附）
      Grid(this.snapScroller) {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(12)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .height(ITEM_HEIGHT)
          .backgroundColor(0xF9CF93)
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(ROW_GAP)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('50%')
      .scrollSnapStrategy(this.snapProvider)
      .id('grid_snapStrategy_provider')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
