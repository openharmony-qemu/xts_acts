'use static';
/*
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
import {
  Entry, Component, Column, Text, Scroll, Tabs, TabContent,
  TabBarStyle, BarPosition, Color, TabsSidebarDisplayStyle
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TabsSidebarDisplayStylePage {
  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabsSidebarDisplayStyle] router error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('TabsSidebarDisplayStyle').id('tabsSidebarDisplayStyleTitle').fontSize(16)
        this.sidebarDisplayStyleEmbedBlocks()
        this.sidebarDisplayStyleDisplaceBlocks()
        this.sidebarDisplayStyleUndefinedBlocks()
        this.sidebarDisplayStyleDefaultBlocks()
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  sidebarDisplayStyleEmbedBlocks() {
    Text('sidebarDisplayStyle EMBED').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Blue)
      }.tabBar('A')
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Green)
      }.tabBar('B')
    }
    .id('tabs_sidebarDisplayStyle_embed')
    .width('100%')
    .height(120)
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarDisplayStyle(TabsSidebarDisplayStyle.EMBED)
  }

  @Builder
  sidebarDisplayStyleDisplaceBlocks() {
    Text('sidebarDisplayStyle DISPLACE').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Blue)
      }.tabBar('A')
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Green)
      }.tabBar('B')
    }
    .id('tabs_sidebarDisplayStyle_displace')
    .width('100%')
    .height(120)
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarDisplayStyle(TabsSidebarDisplayStyle.DISPLACE)
  }

  @Builder
  sidebarDisplayStyleUndefinedBlocks() {
    Text('sidebarDisplayStyle undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Blue)
      }.tabBar('A')
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Green)
      }.tabBar('B')
    }
    .id('tabs_sidebarDisplayStyle_undefined')
    .width('100%')
    .height(120)
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarDisplayStyle(undefined)
  }

  @Builder
  sidebarDisplayStyleDefaultBlocks() {
    Text('sidebarDisplayStyle default (not set)').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Blue)
      }.tabBar('A')
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Green)
      }.tabBar('B')
    }
    .id('tabs_sidebarDisplayStyle_default')
    .width('100%')
    .height(120)
    .barStyle(TabBarStyle.SIDEBAR)
  }
}
