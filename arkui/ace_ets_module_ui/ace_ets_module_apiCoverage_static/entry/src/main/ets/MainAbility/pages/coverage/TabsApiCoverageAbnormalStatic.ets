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
  Entry, ComponentV2, Column, Text, Scroll
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@ComponentV2
struct TabsApiCoverageAbnormalStatic {
  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabsApiCoverageAbnormalStatic] router error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('TabsApiCoverageAbnormalStatic').id('tabsApiCovAbnStaticTitle').fontSize(16)
        Text('tabs_barStyle_default').id('tabs_barStyle_default').fontSize(12)
        Text('tabs_barStyle_undefined').id('tabs_barStyle_undefined').fontSize(12)
        Text('tabs_sidebarPosition_default').id('tabs_sidebarPosition_default').fontSize(12)
        Text('tabs_sidebarPosition_undefined').id('tabs_sidebarPosition_undefined').fontSize(12)
        Text('tabs_sidebarHeader_undefined').id('tabs_sidebarHeader_undefined').fontSize(12)
        Text('tabs_sidebarSearchable_undefined').id('tabs_sidebarSearchable_undefined').fontSize(12)
        Text('tabs_barDisplayModeBreakpoint_undefined').id('tabs_barDisplayModeBreakpoint_undefined').fontSize(12)
        Text('tabs_onBarDisplayModeChange_undefined').id('tabs_onBarDisplayModeChange_undefined').fontSize(12)
        Text('tabs_sidebarSelectedIconColor_undefined').id('tabs_sidebarSelectedIconColor_undefined').fontSize(12)
        Text('tabs_sidebarSelectedTextColor_undefined').id('tabs_sidebarSelectedTextColor_undefined').fontSize(12)
        Text('tabs_sidebarUnselectedIconColor_undefined').id('tabs_sidebarUnselectedIconColor_undefined').fontSize(12)
        Text('tabs_sidebarUnselectedTextColor_undefined').id('tabs_sidebarUnselectedTextColor_undefined').fontSize(12)
        Text('tabs_sidebarSelectedBoardColor_undefined').id('tabs_sidebarSelectedBoardColor_undefined').fontSize(12)
        Text('tabs_tabBarVisibility_undefined').id('tabs_tabBarVisibility_undefined').fontSize(12)
        Text('tabVis_undefined').id('tabVis_undefined').fontSize(12)
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }
}
