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
  Entry, Component, Column, ColumnOptions, Text, Scroll, Tabs, TabContent,
  TabBarStyle, TabBarDisplayMode, BarPosition, Color, TabVisibility,
  TabsController, wrapBuilder
} from '@ohos.arkui.component';
import { ComponentContent } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Builder
function tabsApi12SidebarHeaderBuilder() {
  Text('api12Header').id('tabsApi12_sidebarHeaderText').fontSize(12)
}

@Entry
@Component
struct TabsApi12CoverageStatic {
  private tabsController: TabsController = new TabsController();
  private sidebarHeader?: ComponentContent<undefined> = undefined;
  @State ctrlModeFlag: string = 'init';
  @State barModeChangeFlag: string = 'init';
  @State headerInitFlag: string = 'init';
  @State tabVisVisibleSpec: string = `${TabVisibility.VISIBLE}`;
  @State tabVisHiddenSpec: string = `${TabVisibility.HIDDEN}`;

  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabsApi12CoverageStatic] router error ' + error);
    }
    this.initSidebarHeader();
  }

  private initSidebarHeader(): void {
    try {
      this.sidebarHeader = new ComponentContent<undefined>(
        this.getUIContext(), wrapBuilder(tabsApi12SidebarHeaderBuilder));
      this.headerInitFlag = 'ok';
    } catch (err) {
      console.info('[TabsApi12CoverageStatic] sidebarHeader init error ' + err);
      this.sidebarHeader = undefined;
      this.headerInitFlag = 'fail';
    }
  }

  private probeTabsCtrl(): void {
    try {
      const mode: TabBarDisplayMode = this.tabsController.getBarDisplayMode();
      if (mode === TabBarDisplayMode.BOTTOM_TABBAR) {
        this.ctrlModeFlag = 'BOTTOM_TABBAR';
      } else if (mode === TabBarDisplayMode.SIDEBAR) {
        this.ctrlModeFlag = 'SIDEBAR';
      } else {
        this.ctrlModeFlag = `${mode}`;
      }
    } catch (err) {
      console.info('[TabsApi12CoverageStatic] getBarDisplayMode error ' + err);
      this.ctrlModeFlag = 'fail';
    }
  }

  build() {
    Scroll() {
      Column({ space: 8 } as ColumnOptions) {
        Text('TabsApi12CoverageStatic').id('tabsApi12CoverageStaticTitle').fontSize(16)
        Text(this.tabVisVisibleSpec).id('tabsApi12_visVisibleSpec').fontSize(12)
        Text(this.tabVisHiddenSpec).id('tabsApi12_visHiddenSpec').fontSize(12)
        Text(this.ctrlModeFlag).id('tabsApi12_ctrlModeFlag').fontSize(12)
        Text(this.barModeChangeFlag).id('tabsApi12_barModeChangeFlag').fontSize(12)
        Text(this.headerInitFlag).id('tabsApi12_headerInitFlag').fontSize(12)
        this.tabsMainSection()
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
      .id('tabsApi12_tabVisible')
      .tabBar('Vis')
      .tabBarVisibility(TabVisibility.VISIBLE, TabBarDisplayMode.SIDEBAR)
      TabContent() {
        Column().width('100%').height(40).backgroundColor(Color.Green)
      }
      .id('tabsApi12_tabHidden')
      .tabBar('Hid')
      .tabBarVisibility(TabVisibility.HIDDEN, TabBarDisplayMode.BOTTOM_TABBAR)
    }
    .id('tabsApi12_tabs')
    .width('100%')
    .height(160)
    .onAppear((): void => {
      this.probeTabsCtrl();
    })
    .barStyle(TabBarStyle.SIDEBAR_ADAPTABLE)
    .sidebarPosition(BarPosition.Start)
    .sidebarHeader(this.sidebarHeader)
    .sidebarSearchable({
      searchText: 'api12cov',
      placeholder: 'api12search',
      searchCallback: (_text: string): void => {
      },
      searchFilter: (_idx: int, _text: string): boolean => {
        return true;
      }
    })
    .barDisplayModeBreakpoint({
      sm: TabBarDisplayMode.BOTTOM_TABBAR,
      md: TabBarDisplayMode.SIDEBAR,
      lg: TabBarDisplayMode.SIDEBAR
    })
    .onBarDisplayModeChange((mode: TabBarDisplayMode): void => {
      if (mode === TabBarDisplayMode.BOTTOM_TABBAR) {
        this.barModeChangeFlag = 'BOTTOM_TABBAR';
      } else if (mode === TabBarDisplayMode.SIDEBAR) {
        this.barModeChangeFlag = 'SIDEBAR';
      } else {
        this.barModeChangeFlag = `${mode}`;
      }
    })
  }
}
