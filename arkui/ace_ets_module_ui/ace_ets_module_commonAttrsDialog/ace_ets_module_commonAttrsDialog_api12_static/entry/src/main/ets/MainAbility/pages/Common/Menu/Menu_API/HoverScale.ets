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
import {
  $r,
  Builder,
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
  Margin,
  Menu,
  MenuItem,
  MenuItemOptions,
  ResourceStr,
  Row,
  Scroll,
  Text,
  TextAlign,
  TouchEvent
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../../../hypium/index';
import testsuite from '../../../../../../src/test/List.test'

@Entry
@Component
struct HoverScale {
  @State mText: string = '';
  private iconStr: ResourceStr = $r("app.media.icon");

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" } as MenuItemOptions)
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.mText).id('hoverScale')
        Text('preview-image')
          .id('btn')
          .onTouch((event: TouchEvent) => {
            this.mText = 'hoverScale'
          })
          .width(200)
          .height(100)
          .textAlign(TextAlign.Center)
          .margin(100)
          .fontSize(30)


          .backgroundColor("#ff3df2f5")
      }
    }.height('100%').width('100%').id('row')
  }
}