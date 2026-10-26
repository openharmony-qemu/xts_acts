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
struct maxCountMin {
  @State arr: number[] = []
  scroller: Scroller = new Scroller;

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.arr.push(i)
    }
  }
  build() {
    Column() {
      Text('maxCount default')
      Grid(this.scroller) {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text('' + item)
              .width('100%')
              .height('50%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('grid_maxCount_default')
      .columnsTemplate('1fr 1fr 1fr')
      .clip(false)
      .border({width:1})
      .width('80%')
      .height('25%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)

      Text('maxCount(0)')
      Grid(this.scroller) {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text('' + item)
              .width('100%')
              .height('50%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('grid_maxCount_zero')
      .maxCount(0)
      .columnsTemplate('1fr 1fr 1fr')
      .clip(false)
      .border({width:1})
      .width('80%')
      .height('25%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)

      Text('maxCount(1)')
      Grid(this.scroller) {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text('' + item)
              .width('100%')
              .height('50%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('grid_maxCount_one')
      .maxCount(1)
      .columnsTemplate('1fr 1fr 1fr')
      .clip(false)
      .border({width:1})
      .width('80%')
      .height('25%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)

    }.width('100%')
    .height('100%')
  }
}
