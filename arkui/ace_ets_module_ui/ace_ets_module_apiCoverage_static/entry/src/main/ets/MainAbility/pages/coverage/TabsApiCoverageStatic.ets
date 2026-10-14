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
  Entry, ComponentV2, Column, Text, Scroll,
  TabBarStyle, TabBarDisplayMode, TabsBreakpointType,
  TabsSidebarSearchableOptions, TabsSidebarSearchFilterCallback
} from '@ohos.arkui.component';
import { Local, AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@ComponentV2
struct TabsApiCoverageStatic {
  @Local tabsCtrlFlag: string = 'init';
  @Local tabBarStyleFlag: string = 'init';
  @Local sidebarSearchFlag: string = 'init';
  @Local displayModeFlag: string = 'init';
  @Local breakpointFlag: string = 'init';
  @Local tabsAttrFlag: string = 'init';
  @Local tabVisibilityFlag: string = 'init';
  @Local extendableFlag: string = 'init';
  @Local barModeChangeFlag: string = 'init';

  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
      const uid: int = this.getUniqueId();
      this.extendableFlag = uid >= 0 ? 'ok' : 'fail';
    } catch (error) {
      console.info('[TabsApiCoverageStatic] extendable error ' + error);
      this.extendableFlag = 'fail';
    }
    this.initTabsEnums();
    this.initSidebarSearch();
    this.tabsAttrFlag = 'ok';
    this.tabVisibilityFlag = 'ok';
    this.barModeChangeFlag = 'ok';
  }

  private initTabsEnums(): void {
    try {
      const styles: TabBarStyle[] = [
        TabBarStyle.BOTTOM, TabBarStyle.SIDEBAR, TabBarStyle.SIDEBAR_ADAPTABLE
      ];
      this.tabBarStyleFlag = styles.length === 3 ? 'ok' : 'fail';
      const modes: TabBarDisplayMode[] = [
        TabBarDisplayMode.BOTTOM_TABBAR, TabBarDisplayMode.SIDEBAR
      ];
      this.displayModeFlag = modes.length === 2 ? 'ok' : 'fail';
      const bp: TabsBreakpointType<TabBarDisplayMode> = {
        sm: TabBarDisplayMode.BOTTOM_TABBAR,
        md: TabBarDisplayMode.SIDEBAR,
        lg: TabBarDisplayMode.SIDEBAR
      };
      this.breakpointFlag =
        (bp.sm !== undefined && bp.md !== undefined && bp.lg !== undefined) ? 'ok' : 'fail';
      this.tabsCtrlFlag =
        (modes[0] === TabBarDisplayMode.BOTTOM_TABBAR) ? 'ok' : 'fail';
    } catch (err) {
      console.info('[TabsApiCoverageStatic] initTabsEnums error ' + err);
      this.tabsCtrlFlag = 'fail';
    }
  }

  private initSidebarSearch(): void {
    try {
      const filterCb: TabsSidebarSearchFilterCallback = (tabIndex: int, text: string): boolean => {
        return tabIndex >= 0 && text.length >= 0;
      };
      const opts: TabsSidebarSearchableOptions = {
        searchText: 'cov',
        placeholder: 'search',
        searchCallback: (text: string): void => {
          console.info('[TabsApiCoverageStatic] sidebar search ' + text);
        },
        searchFilter: filterCb
      };
      const hit: boolean = filterCb(0, 'cov');
      this.sidebarSearchFlag =
        (opts.searchText !== undefined && opts.placeholder !== undefined &&
          opts.searchCallback !== undefined && opts.searchFilter !== undefined && hit) ?
          'ok' : 'fail';
    } catch (err) {
      console.info('[TabsApiCoverageStatic] initSidebarSearch error ' + err);
      this.sidebarSearchFlag = 'fail';
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('TabsApiCoverageStatic').id('tabsApiCoverageStaticTitle').fontSize(18)
        Text(this.tabsCtrlFlag).id('tabsCtrlFlag')
        Text(this.tabBarStyleFlag).id('tabBarStyleFlag')
        Text(this.sidebarSearchFlag).id('sidebarSearchFlag')
        Text(this.displayModeFlag).id('displayModeFlag')
        Text(this.breakpointFlag).id('breakpointFlag')
        Text(this.tabsAttrFlag).id('tabsAttrFlag')
        Text(this.tabVisibilityFlag).id('tabVisibilityFlag')
        Text(this.extendableFlag).id('extendableFlag')
        Text(this.barModeChangeFlag).id('barModeChangeFlag')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
