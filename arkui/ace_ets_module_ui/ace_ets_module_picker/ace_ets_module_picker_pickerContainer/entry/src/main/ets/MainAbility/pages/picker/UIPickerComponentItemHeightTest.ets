/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UIPickerComponentItemHeightTest {
  private dataArray: string[] = [];

  aboutToAppear(): void {
    for (let i = 1; i <= 10; i++) {
      this.dataArray.push('Item' + i)
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('UIPickerComponent itemHeight Test - Default')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightDefaultId')
        .width('70%')
        .height(200)

        Text('UIPickerComponent itemHeight Test - LengthMetrics vp 40')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightVp40Id')
        .width('70%')
        .height(200)
        .itemHeight(LengthMetrics.vp(40))

        Text('UIPickerComponent itemHeight Test - LengthMetrics vp 50')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightVp50Id')
        .width('70%')
        .height(200)
        .itemHeight(LengthMetrics.vp(50))

        Text('UIPickerComponent itemHeight Test - LengthMetrics vp 64')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightVp64Id')
        .width('70%')
        .height(200)
        .itemHeight(LengthMetrics.vp(64))

        Text('UIPickerComponent itemHeight Test - LengthMetrics px 40')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightPx40Id')
        .width('70%')
        .height(200)
        .itemHeight(LengthMetrics.px(40))

        Text('UIPickerComponent itemHeight Test - LengthMetrics fp 20')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightFp20Id')
        .width('70%')
        .height(200)
        .itemHeight(LengthMetrics.fp(20))

        Text('UIPickerComponent itemHeight Test - Less than min (30vp)')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightLessMinId')
        .width('70%')
        .height(200)
        .itemHeight(LengthMetrics.vp(30))

        Text('UIPickerComponent itemHeight Test - Greater than max (70vp)')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightGreaterMaxId')
        .width('70%')
        .height(200)
        .itemHeight(LengthMetrics.vp(70))

        Text('UIPickerComponent itemHeight Test - Undefined')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightUndefinedId')
        .width('70%')
        .height(200)
        .itemHeight(undefined)

        Text('UIPickerComponent itemHeight Test - Null')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerItemHeightNullId')
        .width('70%')
        .height(200)
        .itemHeight(null)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}