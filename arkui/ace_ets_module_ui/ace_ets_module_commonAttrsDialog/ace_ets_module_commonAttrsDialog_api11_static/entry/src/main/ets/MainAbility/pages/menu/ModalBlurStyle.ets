/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  BlurStyle,
  Button,
  ButtonType,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  ItemAlign,
  Margin,
  Scroll,
  SheetSize,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct SheetTransitionExample {
  @State isShow1: boolean = false;
  @State isShow2: boolean = false;
  @State isShow3: boolean = false;
  @State isShow4: boolean = false;
  @State isShow5: boolean = false;

  build() {
    Scroll() {
      Column() {
        Button('init').margin(20).key("blurStyle_init")
        Button("BlurStyle 1")
          .key("blurStyle_1")
          .onClick((e: ClickEvent) => {
            this.isShow1 = true
          })
          .fontSize(20)
          .margin(10)

        Button("BlurStyle 2")
          .key("blurStyle_2")
          .onClick((e: ClickEvent) => {
            this.isShow2 = true
          })
          .fontSize(20)
          .margin(10)

        Button("BlurStyle 3")
          .key("blurStyle_3")
          .onClick((e: ClickEvent) => {
            this.isShow3 = true
          })
          .fontSize(20)
          .margin(10)

        Button("BlurStyle 4")
          .key("blurStyle_4")
          .onClick((e: ClickEvent) => {
            this.isShow4 = true
          })
          .fontSize(20)
          .margin(10)

        Button("BlurStyle 5")
          .key("blurStyle_5")
          .onClick((e: ClickEvent) => {
            this.isShow5 = true
          })
          .fontSize(20)
          .margin(10)
      }.justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
