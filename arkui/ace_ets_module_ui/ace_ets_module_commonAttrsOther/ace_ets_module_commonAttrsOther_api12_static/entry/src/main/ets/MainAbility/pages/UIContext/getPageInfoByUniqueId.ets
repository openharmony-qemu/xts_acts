/*
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

import { PageInfo, Router, UIContext } from '@ohos.arkui.UIContext';
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
  HorizontalAlign,
  Image,
  ItemAlign,
  Margin,
  NavDestination,
  Navigation,
  NavPathStack,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  TextArea
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { AppStorage, Link, Provide, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct getPageInfoByUniqueIdExample {
  build() {


  }
}

@Component
struct MyComponentUniqueId {
  @State navigationInfo: string = 'Init'

  build() {
    Column() {

      Button(this.navigationInfo).id('getNavigationInfoByUniqueId')
        .onClick((e: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();


        })
      TextArea({
        text: this.navigationInfo
      })
        .width('100%')
        .height(100)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}