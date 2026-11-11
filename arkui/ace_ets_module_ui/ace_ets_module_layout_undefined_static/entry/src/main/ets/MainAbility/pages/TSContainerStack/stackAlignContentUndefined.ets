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

import {  Entry,  Column,  Component,  Text,  Color,  ItemAlign,  FlexAlign,  Scroll,  ColumnSplit,  FontWeight,
  TextAlign,  Stack,  Alignment, Divider,  Button, HorizontalAlign } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct StackExample {
  @State isUndefined: boolean = false;
  build() {
    Column() {
      Stack() {
        Column() {
          Text('video zone').height('80%').width('80%').textAlign(TextAlign.Center).fontSize(25)
        }.backgroundColor(Color.Pink).width('60%').height('80%').id('upperItemsId3')
        Column() {
          Text('video title')
            .width('80%')
            .height(20)
            .textAlign(TextAlign.Center)
            .backgroundColor('rgb(213, 213, 213)')
        }.width('80%').height('80%')
      }
      .height('15%')
      .backgroundColor(Color.Yellow)
      .alignContent(this.isUndefined ? undefined : Alignment.Start)
      .id('Stack_AlignContent')
      Divider()
      Button(this.isUndefined ? 'isUndefined = true' : 'isUndefined = false')
        .onClick(() => {
          this.isUndefined = !this.isUndefined
        }
        ).id('changeButton')
    }
    .alignItems(HorizontalAlign.Center)
  }
}