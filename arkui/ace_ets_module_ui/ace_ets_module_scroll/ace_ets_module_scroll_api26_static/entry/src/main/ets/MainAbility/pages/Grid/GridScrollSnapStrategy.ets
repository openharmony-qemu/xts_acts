'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  ScrollSnapAlign,
  ScrollSnapOffsetProvider,
  TextAlign
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
class GridSnapOffsetProvider implements ScrollSnapOffsetProvider {
  calculateApproachOffset(velocity: int, decayOffset: int): int {
    return decayOffset;
  }

  calculateSnapOffset(velocity: int): int {
    return 0;
  }
}

@Entry
@Component
struct GridScrollSnapStrategy {
  @State arr: string[] = [];
  private snapProvider: GridSnapOffsetProvider = new GridSnapOffsetProvider();

  aboutToAppear() {
    let list: string[] = [];
    for (let i = 0; i < 20; i++) {
      list.push(i.toString());
    }
    this.arr = list;
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
      // 测试1: scrollSnapStrategy 设置为 ScrollSnapAlign.START
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.START)
      .id('grid_snapStrategy_start')

      // 测试2: scrollSnapStrategy 设置为 ScrollSnapAlign.CENTER
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.CENTER)
      .id('grid_snapStrategy_center')

      // 测试3: scrollSnapStrategy 设置为 ScrollSnapAlign.END
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.END)
      .id('grid_snapStrategy_end')

      // 测试4: scrollSnapStrategy 设置为 ScrollSnapAlign.NONE
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(ScrollSnapAlign.NONE)
      .id('grid_snapStrategy_none')

      // 测试5: scrollSnapStrategy 不设置
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .id('grid_snapStrategy_default')

      // 测试6: scrollSnapStrategy 设置为 undefined
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('10%')
      .scrollSnapStrategy(undefined)
      .id('grid_snapStrategy_undefined')

      // 测试8: scrollSnapStrategy 设置为 ScrollSnapOffsetProvider 对象
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
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
