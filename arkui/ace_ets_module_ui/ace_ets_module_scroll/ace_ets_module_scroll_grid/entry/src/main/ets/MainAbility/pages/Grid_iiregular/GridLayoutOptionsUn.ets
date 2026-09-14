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
struct GridLayoutOptionsUndefined {
  @State numbers: string[] = [];
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i <= 12; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column({ space: 5 }) {
      //GridLayoutOptions set undefined
      Grid(this.scroller, undefined) {
        ForEach(this.numbers, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('30%')
              .textAlign(TextAlign.Center)
          }

        }, (day: string) => day)
      }
      .id('grid_layoutOptions_undefined')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBar(BarState.Off)
      .width('90%')
      .height('30%')
      .backgroundColor(0xFAEEE0)

      //GridLayoutOptions set null
      Grid(this.scroller, null) {
        ForEach(this.numbers, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('30%')
              .textAlign(TextAlign.Center)
          }

        }, (day: string) => day)
      }
      .id('grid_layoutOptions_null')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBar(BarState.Off)
      .width('90%')
      .height('30%')
      .backgroundColor(0xFAEEE0)
    }
    .width('100%')
    .height('100%')
  }
}