'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import {
  Entry, Component, Column, Button, Text, Menu, MenuItem, Builder, State,
} from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct subMenuBuilderIndex {
  @State isShow: boolean = false;
  @State clickResult: string = 'none';

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
  }

  @Builder
  SubMenuA(): void {
    Menu() {
      MenuItem({ content: 'SubItemA1', labelInfo: 'A1' })
        .onClick((): void => { this.clickResult = 'SubItemA1'; })
      MenuItem({ content: 'SubItemA2', labelInfo: 'A2' })
        .onClick((): void => { this.clickResult = 'SubItemA2'; })
    }.id('subMenuA')
  }

  @Builder
  SubMenuB(): void {
    Menu() {
      MenuItem({ content: 'SubItemB1' })
      MenuItem({ content: 'SubItemB2' })
      MenuItem({ content: 'SubItemB3' })
    }.id('subMenuB')
  }

  @Builder
  SubMenuC(): void {
    Menu() {
      MenuItem({ content: 'SubItemC1' })
    }.id('subMenuC')
  }

  @Builder
  ParentMenuBuilder(): void {
    Menu() {
      MenuItem({ content: 'ItemNoSub' })
        .id('menuItemNoSub')
        .height('15%')
        .onClick((): void => { this.clickResult = 'ItemNoSub'; })
      MenuItem({ content: 'ItemWithSubA' })
        .id('menuItemWithSubA')
        .height('15%')
        .subMenuBuilder(this.SubMenuA)
      MenuItem({ content: 'ItemWithSubB' })
        .id('menuItemWithSubB')
        .height('15%')
        .subMenuBuilder(this.SubMenuB)
      MenuItem({ content: 'ItemSubUndefined' })
        .id('menuItemSubUndefined')
        .height('15%')
        .subMenuBuilder(undefined)
      MenuItem({ content: 'ItemChaining' })
        .id('menuItemChaining')
        .height('15%')
        .subMenuBuilder(this.SubMenuC)
        .selected(true)
        .selectIcon(true)
    }
    .id('parentMenu')
    .height('180vp')
  }

  build() {
    Column() {
      Button('ShowMenu')
        .margin({ top: '10vp' })
        .id('showMenuBtn')
        .width('50%')
        .height('5%')
        .onClick((): void => { this.isShow = !this.isShow; })
        .bindMenu(this.isShow, this.ParentMenuBuilder, {
          showInSubWindow: false,
          onDisappear: (): void => { this.isShow = false; },
        })
      Text('clickResult:' + this.clickResult).id('clickResultText').fontSize(14)
      Text('isShow:' + this.isShow).id('isShowText').fontSize(14)
    }
  }
}
