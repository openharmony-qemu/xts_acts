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

/**
 * WaterFlow组件scrollSnapStrategy从API 26.1.0开始新增，设置瀑布流的限位滚动策略。
 * 传入ScrollSnapAlign枚举时使用内置对齐方式：START、CENTER、END分别将目标FlowItem对齐到
 * 视口沿滚动轴的起始、中央和末尾位置；NONE或不设置、传入undefined时不启用限位滚动。
 * 本页面为内置对齐方式的基础验证页面，自定义吸附位置见WaterFlowScrollSnapStrategyProvider页面。
 */
@Entry
@Component
struct WaterFlowScrollSnapStrategy {
  private arr: number[] = [];

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.arr.push(i);
    }
  }

  build() {
    Column({ space: 2 }) {
      Row() {
        // 测试1: scrollSnapStrategy 设置为 ScrollSnapAlign.START
        WaterFlow({ layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW }) {
          ForEach(this.arr, (item: number) => {
            FlowItem() {
              Text(`${item}`)
                .fontSize(20)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80 + (item % 4) * 20)
            .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .width('50%')
        .height('100%')
        .backgroundColor(0xFAEEE0)
        .scrollSnapStrategy(ScrollSnapAlign.START)
        .id('wf_snapStrategy_start')

        // 测试2: scrollSnapStrategy 设置为 ScrollSnapAlign.CENTER
        WaterFlow({ layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW }) {
          ForEach(this.arr, (item: number) => {
            FlowItem() {
              Text(`${item}`)
                .fontSize(20)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80 + (item % 4) * 20)
            .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .width('50%')
        .height('100%')
        .backgroundColor(0xFAEEE0)
        .scrollSnapStrategy(ScrollSnapAlign.CENTER)
        .id('wf_snapStrategy_center')
      }
      .height('25%')

      Row() {
        // 测试3: scrollSnapStrategy 设置为 ScrollSnapAlign.END
        WaterFlow({ layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW }) {
          ForEach(this.arr, (item: number) => {
            FlowItem() {
              Text(`${item}`)
                .fontSize(20)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80 + (item % 4) * 20)
            .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .width('50%')
        .height('100%')
        .backgroundColor(0xFAEEE0)
        .scrollSnapStrategy(ScrollSnapAlign.END)
        .id('wf_snapStrategy_end')

        // 测试4: scrollSnapStrategy 设置为 ScrollSnapAlign.NONE
        WaterFlow({ layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW }) {
          ForEach(this.arr, (item: number) => {
            FlowItem() {
              Text(`${item}`)
                .fontSize(20)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80 + (item % 4) * 20)
            .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .width('50%')
        .height('100%')
        .backgroundColor(0xFAEEE0)
        .scrollSnapStrategy(ScrollSnapAlign.NONE)
        .id('wf_snapStrategy_none')
      }
      .height('25%')

      Row() {
        // 测试5: scrollSnapStrategy 设置为 undefined
        WaterFlow({ layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW }) {
          ForEach(this.arr, (item: number) => {
            FlowItem() {
              Text(`${item}`)
                .fontSize(20)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80 + (item % 4) * 20)
            .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .width('50%')
        .height('100%')
        .backgroundColor(0xFAEEE0)
        .scrollSnapStrategy(undefined)
        .id('wf_snapStrategy_undefined')

        // 测试6: scrollSnapStrategy 设置为 null
        WaterFlow({ layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW }) {
          ForEach(this.arr, (item: number) => {
            FlowItem() {
              Text(`${item}`)
                .fontSize(20)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80 + (item % 4) * 20)
            .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(20)
        .width('50%')
        .height('100%')
        .backgroundColor(0xFAEEE0)
        .scrollSnapStrategy(null)
        .id('wf_snapStrategy_null')
      }
      .height('25%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
