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
struct scrollBarWidthMin {
  @State arr: number[] = []
  scroller: Scroller = new Scroller;

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.arr.push(i)
    }
  }
  build() {
    Column() {
      Text('scrollBarWidth(-1)')
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('20%')
              .backgroundColor(0xFFFFFF)
              .borderWidth(1)
              .borderColor(Color.Black)
              .borderRadius(15)
              .textAlign(TextAlign.Center)
          }, (item: number) => item.toString())
        }
      }
      .id('scroll_barWidth_negative')
      .scrollBarWidth(-1)
      .scrollBar(BarState.On)
      .width('80%')
      .height('30%')
      .backgroundColor(0xDCDCDC)

      Text("scrollBarWidth('-10')")
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('20%')
              .backgroundColor(0xFFFFFF)
              .borderWidth(1)
              .borderColor(Color.Black)
              .borderRadius(15)
              .textAlign(TextAlign.Center)
          }, (item: number) => item.toString())
        }
      }
      .id('scroll_barWidth_negative_str')
      .scrollBarWidth('-10')
      .scrollBar(BarState.On)
      .width('80%')
      .height('30%')
      .backgroundColor(0xDCDCDC)

    }.width('100%')
    .height('100%')
  }
}
