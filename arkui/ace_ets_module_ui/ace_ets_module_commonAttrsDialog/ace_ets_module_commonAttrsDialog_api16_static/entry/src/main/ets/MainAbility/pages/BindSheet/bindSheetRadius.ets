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

import { LengthMetrics } from '@kit.ArkUI';
import {
  $$,
  $r,
  BindOptions,
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
  Image,
  ItemAlign,
  Margin,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false
  @State isShow3: boolean = false

  build() {
    Column() {
      Text($r('sys.float.window_radius_small'))
        .id('window_radius_small')
      Button('bindSheet 1')
        .id('bindSheet_001')
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)


      Button('bindSheet 2')
        .id('bindSheet_002')
        .onClick((e: ClickEvent) => {
          this.isShow1 = true
        })
        .fontSize(20)
        .margin(10)


      Button('bindSheet 3')
        .id('bindSheet_003')
        .onClick((e: ClickEvent) => {
          this.isShow2 = true
        })
        .fontSize(20)
        .margin(10)


      Button('bindSheet 4')
        .id('bindSheet_004')
        .onClick((e: ClickEvent) => {
          this.isShow3 = true
        })
        .fontSize(20)
        .margin(10)


    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
