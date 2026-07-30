'use static';
/*
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
import {
  Entry,
  Scroll,
  Column,
  Component,
  Button,
  $r,
  Row,
  Color,
  Text,
  ClickEvent,
  TextAlign,
  FlexAlign,
  PickerIndicatorType,
  Resource,
  UIPickerComponent,
  ForEach,
  UIPickerComponentOptions,
  UIPickerComponentAttribute,
  ColumnOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { LengthUnit, LengthMetrics } from 'arkui.Graphics'

@Entry
@Component
struct UIPickerDisplayedItemCount {
  private fontSize: Double = 20.0;
  private dataArray: string[] = [] as string[];

  aboutToAppear(): void {
    for (let i = 1; i <= 15; i++) {
      this.dataArray.push(i.toString())
    }
  }

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Row() {
          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCount2')
          .displayedItemCount(2)

          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCount3')
          .displayedItemCount(3)

          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCount5')
          .displayedItemCount(5)
        }

        Row() {
          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCount8')
          .displayedItemCount(8)

          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCount9')
          .displayedItemCount(9)

          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCountUndefined')
          .displayedItemCount(undefined)
        }

        Row() {
          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCount1')
          .displayedItemCount(1)

          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCount10')
          .displayedItemCount(10)
        }

        Row() {
          UIPickerComponent() {
            ForEach(this.dataArray, (item: string) => {
              Text(item)
                .fontSize(this.fontSize)
                .textAlign(TextAlign.Center)
                .fontColor(Color.Black)
            })
          }
          .width('30%')
          .id('UIPickerDisplayedItemCountNegative')
          .displayedItemCount(-1)
        }
      }.width('100%').height('100%')
    }
  }
}