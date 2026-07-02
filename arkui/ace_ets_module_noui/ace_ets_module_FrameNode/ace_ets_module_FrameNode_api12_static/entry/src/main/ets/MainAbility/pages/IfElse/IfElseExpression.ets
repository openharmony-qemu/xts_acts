'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import { Entry, Text, Column, ColumnOptions, Row, RowOptions, Component,
  Button, ClickEvent, Color, Divider, If, FlexAlign } from '@ohos.arkui.component'

@Entry
@Component
struct IfElseExpression {
  private value: number = 100;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('value: ' + this.value)
        .fontSize(15).fontColor(Color.Grey)
      Column({ space: 5 } as ColumnOptions) {
        Text('[if ..] 判断条件为逻辑表达式是否小于20')
          .fontSize(15).fontColor(Color.Grey)
        Row({ space: 10 } as RowOptions) {
          If(this.value < 20) {
            Text(`value小于20`)
              .fontSize(15)
          }
        }
      }.width('100%').borderWidth(1)

      Column({ space: 5 } as ColumnOptions) {
        Text('[if .. else ..] 判断条件为逻辑表达式')
          .fontSize(15)
          .fontColor(Color.Grey)
        Row({ space: 5 } as RowOptions) {
          If(this.value < 20) {
            Text(`value小于20`)
              .fontSize(15)
          }.Else() {
            Text(`value大于20`)
              .id('TextStringValue1')
              .fontSize(15)
          }
        }
      }.width('100%').borderWidth(1)

      Column({ space: 5 } as ColumnOptions) {
        Text('[if .. else if .. else ..] 判断条件为逻辑表达式')
          .fontSize(15).fontColor(Color.Grey)
        Row({ space: 5 } as RowOptions) {
          If(this.value < 20) {
            Text(`value小于20`)
              .fontSize(20)
          }.ElseIf(this.value < 1000) {
            Text(`value小于1000`)
              .id('TextStringValue2')
              .fontSize(15)
          }.Else() {
            Text(`value大于等于1000`)
              .fontSize(15)
          }
        }
      }.width('100%').borderWidth(1)
    }
    .width('100%')
    .height('100%')
  }
}