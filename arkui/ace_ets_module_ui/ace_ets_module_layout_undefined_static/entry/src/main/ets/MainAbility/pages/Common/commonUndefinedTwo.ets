'use static';

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

import {Stack, Row, Alignment, VerticalAlign, HorizontalAlign, RelativeContainer, Entry, Text, Column, Component,
  Button, ClickEvent, FlexAlign, AlignRuleOption, Flex, FlexDirection, ItemAlign, TextAlign, ColumnOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Align {
  @State isAlignUndefined: boolean = true;
  @State isAlignRulesUndefined: boolean = true;
  @State isAlignSelfUndefined: boolean = true;

  build() {
    Column({space:2} as ColumnOptions) {
      Column({space:2} as ColumnOptions) {
        Text('align').fontSize(9).fontColor('#ffcccccc').width('80%')
        Stack() {
          Text('First show in bottom end')
        }
        .id('MyStack')
        .width('80%')
        .height(50)
        .borderColor('#FFFFE4C4')
        .borderWidth(2)
        .align(this.isAlignUndefined ? Alignment.BottomEnd : undefined)
      }

      RelativeContainer() {
        Row() {
          Text('row1').height(15)
        }
        .justifyContent(FlexAlign.Center)
        .width(100)
        .height(100)
        .borderColor('#ffa3cf62')
        .borderWidth(2)
        .backgroundColor('#a3cf62')
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        } as AlignRuleOption)
        .id('MyRow1')

        Row() {
          Text('row2').height(15)
        }
        .justifyContent(FlexAlign.Center)
        .width(100)
        .height(100)
        .borderColor('#ff00ae9d')
        .borderWidth(2)
        .backgroundColor('#00ae9d')
        .alignRules(this.isAlignRulesUndefined ? {
          top: { anchor: '__container__', align: VerticalAlign.Top },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        } as AlignRuleOption : undefined)
        .id('MyRow2')
      }
      .width(200).height(70)
      .border({ width: 2, color: '#6699FF' })

      Column({space:2} as ColumnOptions) {
        Text('alignSelf').fontSize(15).fontColor('#ffcccccc').width('80%')
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text('alignSelf ItemAlign.Baseline')
            .id('MyText')
            .alignSelf(this.isAlignSelfUndefined ? ItemAlign.Baseline : undefined)
            .width('33%')
            .height(50)
            .borderColor('#ffD2B48C')
            .borderWidth(2)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
        }.width('80%').height(100)
        .borderColor('#ffAFEEEE')
        .borderWidth(2)
        .backgroundColor(0xAFEEEE)
      }.width('80%')

      Column({space:2} as ColumnOptions) {
        Button('isAlignUndefined = ' + this.isAlignUndefined)
          .onClick(() => {
            this.isAlignUndefined = !this.isAlignUndefined;
          })
          .height(15)
          .id('Common_Align')
        Button('isAlignRulesUndefined = ' + this.isAlignRulesUndefined)
          .onClick(() => {
            this.isAlignRulesUndefined = !this.isAlignRulesUndefined;
          })
          .height(15)
          .id('Common_AlignRules')
        Button('isAlignSelfUndefined = ' + this.isAlignSelfUndefined)
          .onClick(() => {
            this.isAlignSelfUndefined = !this.isAlignSelfUndefined;
          })
          .height(15)
          .id('Common_AlignSelf')
      }
    }.width('80%').height('80%')
    .alignItems(HorizontalAlign.Center)
  }
}