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

import {  Entry,  Text,  Column,  Component,  Button,
  ClickEvent,  $r,  Row,  Divider,  ColumnOptions,
  BorderOptions,  Color,  Toggle,  Blank,  Margin,
  List,  Padding, HorizontalAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct BlankExample {
  @State isUndefined: boolean = false;

  build() {
    Column() {
      Button('isUndefined = ' + this.isUndefined)
        .onClick(() => {
          this.isUndefined == true ? this.isUndefined = false : this.isUndefined = true;
        })
        .id('Blank_color')
        .height(60)
        .width(200)

      Column() {
        Text('Blank-color-动态切换(undefined/Color.Yellow)')
          .fontSize(20)
          .width('80%')
        Row() {
          Text('Bluetooth').fontSize(18)
          Blank('160')
            .color(this.isUndefined ? undefined : Color.Yellow)
            .id('MyBlank')
        }
        .borderRadius(15)
        .width('80%')
        Divider()
      }
    }
    .backgroundColor('#EFEFEF')
    .width('80%')
    .height('80%')
    .alignItems(HorizontalAlign.Center)
  }
}