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
  Entry, Component, Column, ColumnOptions, Text, Scroll, Button, Tabs, TabContent,
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
  @State searchCbHit: string = 'init';
  @State searchFilterHit: string = 'init';
  @State searchFilterRet: string = 'init';
  @State searchProbeCb: string = 'init';
  @State searchProbeFilter: string = 'init';
  @State searchProbeRet: string = 'init';
  @State tabVisParamVisible: string = 'init';
  @State tabVisParamHidden: string = 'init';
  @State tabVisParamUndefMode: string = 'init';
  @State useAdaptable: boolean = true;
  @State tabVisVisibleSpec: string = `${TabVisibility.VISIBLE}`;
  @State tabVisHiddenSpec: string = `${TabVisibility.HIDDEN}`;
  @State displayModeBottomSpec: string = `${TabBarDisplayMode.BOTTOM_TABBAR}`;
  @State displayModeSidebarSpec: string = `${TabBarDisplayMode.SIDEBAR}`;

  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabsApi12CoverageStatic] router error ' + error);
    }
    this.tabVisParamVisible =
      `vis=${TabVisibility.VISIBLE},mode=${TabBarDisplayMode.SIDEBAR}`;
    this.tabVisParamHidden =
      `vis=${TabVisibility.HIDDEN},mode=${TabBarDisplayMode.BOTTOM_TABBAR}`;
    this.tabVisParamUndefMode = `vis=${TabVisibility.VISIBLE},mode=undefined`;
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

  private onSearchCallback(text: string): void {
    this.searchCbHit = text;
  }

  private onSearchFilter(idx: int, text: string): boolean {
    this.searchFilterHit = `${idx}:${text}`;
    return text.length > 0;
  }

  private applyBarModeChange(mode: TabBarDisplayMode): void {
    if (mode === TabBarDisplayMode.BOTTOM_TABBAR) {
      this.barModeChangeFlag = 'BOTTOM_TABBAR';
    } else if (mode === TabBarDisplayMode.SIDEBAR) {
      this.barModeChangeFlag = 'SIDEBAR';
    } else {
      this.barModeChangeFlag = `${mode}`;
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
      // Drive the same handler registered on onBarDisplayModeChange with real return value
      this.applyBarModeChange(mode);
    } catch (err) {
      console.info('[TabsApi12CoverageStatic] getBarDisplayMode error ' + err);
      this.ctrlModeFlag = 'fail';
    }
  }

  private probeSearchOptions(): void {
    // Dedicated probe flags (framework may also invoke the live hooks with other idx)
    this.onSearchCallback('api12cov');
    this.searchProbeCb = this.searchCbHit;
    const passed: boolean = this.onSearchFilter(0, 'api12probe');
    this.searchProbeFilter = this.searchFilterHit;
    this.searchProbeRet = passed ? 'true' : 'false';
  }

  private flipBarStyle(): void {
    this.useAdaptable = !this.useAdaptable;
    this.probeTabsCtrl();
  }

  build() {
    Scroll() {
      Column({ space: 8 } as ColumnOptions) {
        Text('TabsApi12CoverageStatic').id('tabsApi12CoverageStaticTitle').fontSize(16)
        Text(this.tabVisVisibleSpec).id('tabsApi12_visVisibleSpec').fontSize(12)
        Text(this.tabVisHiddenSpec).id('tabsApi12_visHiddenSpec').fontSize(12)
        Text(this.displayModeBottomSpec).id('tabsApi12_modeBottomSpec').fontSize(12)
        Text(this.displayModeSidebarSpec).id('tabsApi12_modeSidebarSpec').fontSize(12)
        Text(this.tabVisParamVisible).id('tabsApi12_tabVisParamVisible').fontSize(12)
        Text(this.tabVisParamHidden).id('tabsApi12_tabVisParamHidden').fontSize(12)
        Text(this.tabVisParamUndefMode).id('tabsApi12_tabVisParamUndefMode').fontSize(12)
        Text(this.ctrlModeFlag).id('tabsApi12_ctrlModeFlag').fontSize(12)
        Text(this.barModeChangeFlag).id('tabsApi12_barModeChangeFlag').fontSize(12)
        Text(this.headerInitFlag).id('tabsApi12_headerInitFlag').fontSize(12)
        Text(this.searchCbHit).id('tabsApi12_searchCbHit').fontSize(12)
        Text(this.searchFilterHit).id('tabsApi12_searchFilterHit').fontSize(12)
        Text(this.searchFilterRet).id('tabsApi12_searchFilterRet').fontSize(12)
        Text(this.searchProbeCb).id('tabsApi12_searchProbeCb').fontSize(12)
        Text(this.searchProbeFilter).id('tabsApi12_searchProbeFilter').fontSize(12)
        Text(this.searchProbeRet).id('tabsApi12_searchProbeRet').fontSize(12)
        Button('flipBarStyle')
          .id('tabsApi12_flipBarStyle')
          .onClick((): void => {
            this.flipBarStyle();
          })
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
        Column().width('100%').height(36).backgroundColor(Color.Blue)
      }
      .id('tabsApi12_tabVisible')
      .tabBar('Vis')
      .tabBarVisibility(TabVisibility.VISIBLE, TabBarDisplayMode.SIDEBAR)
      TabContent() {
        Column().width('100%').height(36).backgroundColor(Color.Green)
      }
      .id('tabsApi12_tabHidden')
      .tabBar('Hid')
      .tabBarVisibility(TabVisibility.HIDDEN, TabBarDisplayMode.BOTTOM_TABBAR)
      TabContent() {
        Column().width('100%').height(36).backgroundColor(Color.Orange)
      }
      .id('tabsApi12_tabUndefMode')
      .tabBar('Und')
      .tabBarVisibility(TabVisibility.VISIBLE, undefined)
    }
    .id('tabsApi12_tabs')
    .width('100%')
    .height(180)
    .onAppear((): void => {
      this.probeTabsCtrl();
      this.probeSearchOptions();
    })
    .barStyle(this.useAdaptable ? TabBarStyle.SIDEBAR_ADAPTABLE : TabBarStyle.SIDEBAR)
    .sidebarPosition(BarPosition.Start)
    .sidebarHeader(this.sidebarHeader)
    .sidebarSearchable({
      searchText: 'api12cov',
      placeholder: 'api12search',
      searchCallback: (text: string): void => {
        this.onSearchCallback(text);
      },
      searchFilter: (idx: int, text: string): boolean => {
        return this.onSearchFilter(idx, text);
      }
    })
    .barDisplayModeBreakpoint({
      sm: TabBarDisplayMode.BOTTOM_TABBAR,
      md: TabBarDisplayMode.SIDEBAR,
      lg: TabBarDisplayMode.SIDEBAR
    })
    .onBarDisplayModeChange((mode: TabBarDisplayMode): void => {
      this.applyBarModeChange(mode);
    })
  }
}
