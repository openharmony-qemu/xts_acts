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
  SheetKeyboardAvoidMode,
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
struct bindSheetKeyboardAvoidMode {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State keyboardAvoidMode: SheetKeyboardAvoidMode = SheetKeyboardAvoidMode.NONE

  build() {
    Column() {
      Button('SheetKeyboardAvoidMode.NONE')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
        })
        .id('noneButton')
        .fontSize(20)
        .margin(10)


      Button('SheetKeyboardAvoidMode.TRANSLATE_AND_RESIZE')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
          this.keyboardAvoidMode = SheetKeyboardAvoidMode.TRANSLATE_AND_RESIZE
        })
        .id('translateResizeButton')
        .fontSize(20)
        .margin(10)
      Button('SheetKeyboardAvoidMode.RESIZE_ONLY')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
          this.keyboardAvoidMode = SheetKeyboardAvoidMode.RESIZE_ONLY
        })
        .id('resizeOnlyButton')
        .fontSize(20)
        .margin(10)
      Button('SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL')
        .onClick((e: ClickEvent) => {
          this.isShow1 = !this.isShow1
          this.keyboardAvoidMode = SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL

        })
        .id('translateScrollButton')
        .fontSize(20)
        .margin(10)


    }
    .width('100%')
  }
}