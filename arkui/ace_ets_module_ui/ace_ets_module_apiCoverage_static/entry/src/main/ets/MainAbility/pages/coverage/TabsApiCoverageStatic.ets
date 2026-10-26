'use static'
/*
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
  Entry, Component, Column, Text, Scroll, Tabs, TabContent,
  TabBarStyle, TabBarDisplayMode, BarPosition, Color, TabVisibility,
  TabsController
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TabsApiCoverageStatic {
  private tabsController: TabsController = new TabsController();
  @State ctrlModeFlag: string = 'init';

  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabsApiCoverageStatic] router error ' + error);
    }
  }

  private probeTabsCtrl(): void {
    try {
      const mode: TabBarDisplayMode = this.tabsController.getBarDisplayMode();
      this.ctrlModeFlag =
        (mode === TabBarDisplayMode.BOTTOM_TABBAR || mode === TabBarDisplayMode.SIDEBAR) ?
          `${mode}` : 'other';
    } catch (err) {
      console.info('[TabsApiCoverageStatic] getBarDisplayMode error ' + err);
      this.ctrlModeFlag = 'fail';
    }
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('TabsApiCoverageStatic').id('tabsApiCoverageStaticTitle').fontSize(18)
        Text(this.ctrlModeFlag).id('tabsCtrlModeFlag').fontSize(12)
        this.tabsMainSection()
        this.tabsBottomSection()
        this.tabsBarStyleBottomSection()
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  tabsMainSection() {
    Tabs({ barPosition: BarPosition.Start, controller: this.tabsController }) {
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Blue)
      }
      .id('tabsApiCovStatic_tabA')
      .tabBar('A')
      .tabBarVisibility(TabVisibility.VISIBLE, TabBarDisplayMode.SIDEBAR)
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Green)
      }
      .id('tabsApiCovStatic_tabB')
      .tabBar('B')
      .tabBarVisibility(TabVisibility.HIDDEN, TabBarDisplayMode.BOTTOM_TABBAR)
    }
    .id('tabsApiCovStatic_tabs')
    .width('100%')
    .height(140)
    .onAppear((): void => {
      this.probeTabsCtrl();
    })
    .barStyle(TabBarStyle.SIDEBAR_ADAPTABLE)
    .sidebarPosition(BarPosition.Start)
    .sidebarSearchable({
      searchText: 'cov',
      placeholder: 'search',
      searchCallback: (_text: string): void => {
      },
      searchFilter: (_idx: number, _text: string): boolean => {
        return true;
      }
    })
    .barDisplayModeBreakpoint({
      sm: TabBarDisplayMode.BOTTOM_TABBAR,
      md: TabBarDisplayMode.SIDEBAR,
      lg: TabBarDisplayMode.SIDEBAR
    })
    .sidebarSelectedIconColor('#007DFF')
    .sidebarSelectedTextColor('#007DFF')
    .sidebarUnselectedIconColor('#182431')
    .sidebarUnselectedTextColor('#182431')
    .sidebarSelectedBoardColor('#0A007DFF')
  }

  @Builder
  tabsBottomSection() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Blue)
      }.tabBar('C')
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Green)
      }.tabBar('D')
    }
    .id('tabsApiCovStatic_tabsBottom')
    .width('100%')
    .height(100)
    .barStyle(TabBarStyle.BOTTOM)
  }

  @Builder
  tabsBarStyleBottomSection() {
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Blue)
      }.tabBar('E')
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Green)
      }.tabBar('F')
    }
    .id('tabsApiCovStatic_tabsSidebar')
    .width('100%')
    .height(100)
    .barStyle(TabBarStyle.SIDEBAR)
  }
}
