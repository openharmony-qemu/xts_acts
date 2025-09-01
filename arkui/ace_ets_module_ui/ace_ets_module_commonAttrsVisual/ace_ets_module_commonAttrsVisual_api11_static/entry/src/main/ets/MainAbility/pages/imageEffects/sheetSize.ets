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
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
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
  Length,
  Margin,
  Row,
  Scroll,
  SheetDismiss,
  SheetOptions,
  SheetSize,
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
struct SheetSizeExample1 {
  @State detents: [(SheetSize | Length), (SheetSize | Length), (SheetSize | Length)] =
    [SheetSize.MEDIUM, SheetSize.LARGE,
      SheetSize.FIT_CONTENT] as [(SheetSize | Length), (SheetSize | Length), (SheetSize | Length)]
  @State isShow: boolean = false
  @State dismiss: string = "Init"

  build() {
    Column() {
      Text(this.dismiss).id("bindSheet_dismiss1").margin(10)
      Text(this.detents + '').key("detents").margin(10)
      Button("transition modal 1").id("bindSheet_SheetSize1")
        .onClick((e: ClickEvent) => {
          this.isShow = true

        })
        .fontSize(20)
        .margin(10)


    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}