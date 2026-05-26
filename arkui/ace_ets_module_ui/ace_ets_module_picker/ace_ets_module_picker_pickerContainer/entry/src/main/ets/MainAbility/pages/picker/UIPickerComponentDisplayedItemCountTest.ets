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
struct UIPickerComponentDisplayedItemCountTest {
  private dataArray: string[] = [];

  aboutToAppear(): void {
    for (let i = 1; i <= 20; i++) {
      this.dataArray.push('Item' + i)
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('UIPickerComponent displayedItemCount Test - Default')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCountDefaultId')
        .width('70%')
        .height(200)

        Text('UIPickerComponent displayedItemCount Test - Number 2')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCount2Id')
        .width('70%')
        .height(200)
        .displayedItemCount(2)

        Text('UIPickerComponent displayedItemCount Test - Number 3')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCount3Id')
        .width('70%')
        .height(200)
        .displayedItemCount(3)

        Text('UIPickerComponent displayedItemCount Test - Number 5')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCount5Id')
        .width('70%')
        .height(200)
        .displayedItemCount(5)

        Text('UIPickerComponent displayedItemCount Test - Number 7')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCount7Id')
        .width('70%')
        .height(200)
        .displayedItemCount(7)

        Text('UIPickerComponent displayedItemCount Test - Number 9')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCount9Id')
        .width('70%')
        .height(200)
        .displayedItemCount(9)

        Text('UIPickerComponent displayedItemCount Test - Even Number 4')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCount4Id')
        .width('70%')
        .height(200)
        .displayedItemCount(4)

        Text('UIPickerComponent displayedItemCount Test - Even Number 8')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCount8Id')
        .width('70%')
        .height(200)
        .displayedItemCount(8)

        Text('UIPickerComponent displayedItemCount Test - Decimal 3.5')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCountDecimalId')
        .width('70%')
        .height(200)
        .displayedItemCount(3.5)

        Text('UIPickerComponent displayedItemCount Test - Less than min (1)')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCountLessMinId')
        .width('70%')
        .height(200)
        .displayedItemCount(1)

        Text('UIPickerComponent displayedItemCount Test - Greater than max (10)')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCountGreaterMaxId')
        .width('70%')
        .height(200)
        .displayedItemCount(10)

        Text('UIPickerComponent displayedItemCount Test - Undefined')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCountUndefinedId')
        .width('70%')
        .height(200)
        .displayedItemCount(undefined)

        Text('UIPickerComponent displayedItemCount Test - Null')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        UIPickerComponent() {
          ForEach(this.dataArray, (item: string) => {
            Text(item)
          })
        }
        .id('pickerDisplayedItemCountNullId')
        .width('70%')
        .height(200)
        .displayedItemCount(null)
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