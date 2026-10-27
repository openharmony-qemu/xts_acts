'use static';

/*
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

import { Entry, Component, Column, ColumnOptions, Text, Row, Button, ComponentV2, 
Repeat, FlowItem, WaterFlow, FlexAlign, HorizontalAlign, TransitionEffect } from '@ohos.arkui.component';
import { Local, Provider, Consumer, Param, Require, ObservedV2, Trace } from '@ohos.arkui.stateManagement';

@ObservedV2
class FlowItemInfo {
  @Trace public info: string = '';
  @Trace public color: string = '';
  public key: string = '';
  constructor(info: string, color: string) {
    this.info = info;
    this.color = color;
    this.key = info;
  }
}

@ComponentV2
struct AnimFlowItemContent {
  @Param @Require info: string = '';
  @Param @Require color: string = '';
  @Param @Require index: number = 0;
  @Consumer() createCount: number = 0;

  aboutToAppear(): void {
    this.createCount = this.createCount + 1;
  }

  build() {
    Text(this.info)
      .id(`flowItem_${this.index}`)
      .fontSize(10)
      .backgroundColor(this.color)
      .width(150)
      .height(50)
      .border({ width: 1 })
      .transition(TransitionEffect.translate({ x: 300 }))
  }
}

@Entry
@ComponentV2
struct RepeatAllowReuseInAnimationWaterFlow {
  @Local dataArray: Array<FlowItemInfo> = [];
  private count: number = 0;
  @Provider() createCount: number = 0;

  aboutToAppear(): void {
    for (let i = 0; i < 5; i++) {
      this.dataArray.push(new FlowItemInfo(`Item ${i}`, `#FFFFFF`));
    }
  }

  build() {
    Column({ space: 3 } as ColumnOptions) {
      // 操作按钮区
      Row() {
        Button('Add')
          .id('flowAddBtn')
          .width(80)
          .onClick((): void => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray.splice(0, 0, new FlowItemInfo(`New item ${this.count++}`, `#FFFFFF`))
            })
          })
        Button('Delete')
          .id('flowDeleteBtn')
          .width(80)
          .onClick((): void => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray.splice(0, 1)
            })
          })
      }
      .height('6%')

      Row() {
        Button('Exchange')
          .id('flowExchangeBtn')
          .width(70)
          .onClick((): void => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              let temp: FlowItemInfo = this.dataArray[1];
              this.dataArray[1] = this.dataArray[0]
              this.dataArray[0] = temp;
            })
          })
        Button('UpdateSameKey')
          .id('flowUpdateSameKeyBtn')
          .width(70)
          .onClick((): void => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray[0].info = 'Item updated';
              this.dataArray[0].color = '#86C5E3';
            })
          })
        Button('UpdateNewKey')
          .id('flowUpdateNewKeyBtn')
          .width(70)
          .onClick((): void => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray[0] = new FlowItemInfo(`Replaced ${this.count++}`, '#86C5E3');
            })
          })
      }
      .height('6%')

      // 复用计数显示
      Text(`createCount: ${this.createCount.toString()}`)
        .id('flowCreateCountText')
        .fontSize(10)
        .height('3%')

      // WaterFlow 容器
      WaterFlow() {
        Repeat<FlowItemInfo>(this.dataArray, { allowReuseInAnimation: true })
          .each((repeatItem) => {
            FlowItem() {
              AnimFlowItemContent({ info: repeatItem.item.info, color: repeatItem.item.color, index: repeatItem.index })
            }
          })
          .key((item: FlowItemInfo, index: int) => item.key)
          .virtualScroll()
      }
      .columnsTemplate('1fr')
      .id('animReuseWaterFlow')
      .height('55%')
      .width('80%')
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
