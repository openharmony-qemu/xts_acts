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
 * WaterFlow组件scrollSnapStrategy从API 26.1.0开始新增，支持传入实现ScrollSnapOffsetProvider
 * 接口的对象自定义吸附位置：calculateApproachOffset确定惯性阶段的滚动距离，
 * calculateSnapOffset确定最终吸附位置。本页面为自定义吸附位置的验证页面，
 * 绑定Scroller读取当前偏移量，按固定间隔SNAP_INTERVAL计算吸附目标，抛滑后沿原方向吸附。
 */
const SNAP_INTERVAL: number = 240;

class WaterFlowSnapProvider implements ScrollSnapOffsetProvider {
  private scroller: Scroller;

  constructor(scroller: Scroller) {
    this.scroller = scroller;
  }

  calculateApproachOffset(velocity: number, decayOffset: number): number {
    // 返回距离大小，滚动方向由组件根据速度处理。
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
struct WaterFlowScrollSnapStrategyProvider {
  private arr: number[] = [];
  private snapScroller: Scroller = new Scroller();
  private snapProvider: ScrollSnapOffsetProvider = new WaterFlowSnapProvider(this.snapScroller);

  aboutToAppear() {
    for (let i = 0; i < 50; i++) {
      this.arr.push(i);
    }
  }

  build() {
    Column({ space: 2 }) {
      // 测试1: scrollSnapStrategy 设置为 ScrollSnapOffsetProvider 对象（按固定间隔吸附）
      WaterFlow({ scroller: this.snapScroller }) {
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
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('40%')
      .scrollSnapStrategy(this.snapProvider)
      .id('wf_snapStrategy_provider')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
