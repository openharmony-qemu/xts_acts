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
@Entry
@Component
struct layoutModeWaterFlowUndefined {
  @State numbers: string[] = [];
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i <= 12; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column({ space: 5 }) {
      //WaterFlow layoutMode set undefined
      WaterFlow({ scroller: this.scroller, layoutMode: undefined }) {
        ForEach(this.numbers, (item: string) => {
          FlowItem() {
            Column() {
              Text('N' + item)
                .fontSize(12)
                .height('16')
            }
          }
          .width('100%')
          .height(80)
        }, (item: string) => item)
      }
      .id('waterFlow_layoutMode_undefined')
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .scrollBar(BarState.On)
      .scrollBarWidth(10)
      .width('100%')
      .height('30%')
      .backgroundColor(0xFAEEE0)

      //WaterFlow layoutMode set null
      WaterFlow({ scroller: this.scroller, layoutMode: null }) {
        ForEach(this.numbers, (item: string) => {
          FlowItem() {
            Column() {
              Text('N' + item)
                .fontSize(12)
                .height('16')
            }
          }
          .width('100%')
          .height(80)
        }, (item: string) => item)
      }
      .id('waterFlow_layoutMode_null')
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .scrollBar(BarState.On)
      .scrollBarWidth(10)
      .width('100%')
      .height('30%')
      .backgroundColor(0xFAEEE0)

    }
  }
}