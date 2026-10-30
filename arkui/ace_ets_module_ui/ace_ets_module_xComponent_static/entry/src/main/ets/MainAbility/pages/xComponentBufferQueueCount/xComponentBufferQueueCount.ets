'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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


import {
  Column,
  ColumnOptions,
  Text,
  XComponent,
  XComponentType,
  XComponentController,
  Entry,
  XComponentOptions,
  Component,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct XComponentBufferQueueCount {
  xcMin: XComponentController = new XComponentController();
  xcMax: XComponentController = new XComponentController();
  xcMid: XComponentController = new XComponentController();
  xcBelowMin: XComponentController = new XComponentController();
  xcAboveMax: XComponentController = new XComponentController();
  xcZero: XComponentController = new XComponentController();
  xcNegative: XComponentController = new XComponentController();
  xcDefault: XComponentController = new XComponentController();
  xcMidTwo: XComponentController = new XComponentController();
  xcLargeValue: XComponentController = new XComponentController();
  xcSmallValue: XComponentController = new XComponentController();

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('xcBqc_mounted', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('XComponent bufferQueueCount Test Page')
        .fontSize(11)
        .width('100%')
        .height('8%')
        .id('xcBqc_title');

      // 正常值: count = 2 (最小有效值)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcMin,
      } as XComponentOptions)
        .bufferQueueCount(2)
        .height('5%')
        .width('100%')
        .id('xcBqc_min');

      // 正常值: count = 5 (最大有效值)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcMax,
      } as XComponentOptions)
        .bufferQueueCount(5)
        .height('5%')
        .width('100%')
        .id('xcBqc_max');

      // 正常值: count = 3 (中间值)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcMid,
      } as XComponentOptions)
        .bufferQueueCount(3)
        .height('5%')
        .width('100%')
        .id('xcBqc_mid');

      // 边界值: count = 1 (小于最小值2，应被钳制为2)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcBelowMin,
      } as XComponentOptions)
        .bufferQueueCount(1)
        .height('5%')
        .width('100%')
        .id('xcBqc_below_min');

      // 边界值: count = 6 (大于最大值5，应被钳制为5)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcAboveMax,
      } as XComponentOptions)
        .bufferQueueCount(6)
        .height('5%')
        .width('100%')
        .id('xcBqc_above_max');

      // 边界值: count = 0 (小于最小值2，应被钳制为2)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcZero,
      } as XComponentOptions)
        .bufferQueueCount(0)
        .height('5%')
        .width('100%')
        .id('xcBqc_zero');

      // 异常值: count = -1 (负数，应被钳制为2)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcNegative,
      } as XComponentOptions)
        .bufferQueueCount(-1)
        .height('5%')
        .width('100%')
        .id('xcBqc_negative');

      // 默认值: 不调用 bufferQueueCount，默认为5
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcDefault,
      } as XComponentOptions)
        .height('5%')
        .width('100%')
        .id('xcBqc_default');

      // 正常值: count = 4 (另一个中间值)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcMidTwo,
      } as XComponentOptions)
        .bufferQueueCount(4)
        .height('5%')
        .width('100%')
        .id('xcBqc_mid_two');

      // 极大值: count = 100 (远超最大值，应被钳制为5)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcLargeValue,
      } as XComponentOptions)
        .bufferQueueCount(100)
        .height('5%')
        .width('100%')
        .id('xcBqc_large');

      // 极小值: count = -100 (远小于最小值，应被钳制为2)
      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xcSmallValue,
      } as XComponentOptions)
        .bufferQueueCount(-100)
        .height('5%')
        .width('100%')
        .id('xcBqc_small');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
