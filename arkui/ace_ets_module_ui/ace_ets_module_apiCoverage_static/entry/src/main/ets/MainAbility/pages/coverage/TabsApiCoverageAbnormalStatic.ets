'use static';
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
  Entry, ComponentV2, Column, Text, Scroll, Tabs, TabContent,
  TabBarStyle, TabVisibility, BarPosition, Color
} from '@ohos.arkui.component';
import { Local, AppStorage } from '@ohos.arkui.stateManagement';
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

        Text('barStyle default').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_barStyle_default')
        .width('100%').height(80)

        Text('barStyle undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_barStyle_undefined')
        .barStyle(undefined)
        .width('100%').height(80)

        Text('sidebarPosition default').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarPosition_default')
        .barStyle(TabBarStyle.SIDEBAR)
        .width('100%').height(80)

        Text('sidebarPosition undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarPosition_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarPosition(undefined)
        .width('100%').height(80)

        Text('sidebarHeader undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarHeader_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarHeader(undefined)
        .width('100%').height(80)

        Text('sidebarSearchable undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarSearchable_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSearchable(undefined)
        .width('100%').height(80)

        Text('barDisplayModeBreakpoint undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_barDisplayModeBreakpoint_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .barDisplayModeBreakpoint(undefined)
        .width('100%').height(80)

        Text('onBarDisplayModeChange undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_onBarDisplayModeChange_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .onBarDisplayModeChange(undefined)
        .width('100%').height(80)

        Text('sidebarSelectedIconColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarSelectedIconColor_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedIconColor(undefined)
        .width('100%').height(80)

        Text('sidebarSelectedTextColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarSelectedTextColor_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedTextColor(undefined)
        .width('100%').height(80)

        Text('sidebarUnselectedIconColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedIconColor_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedIconColor(undefined)
        .width('100%').height(80)

        Text('sidebarUnselectedTextColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarUnselectedTextColor_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarUnselectedTextColor(undefined)
        .width('100%').height(80)

        Text('sidebarSelectedBoardColor undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Blue) }.tabBar('A')
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_sidebarSelectedBoardColor_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarSelectedBoardColor(undefined)
        .width('100%').height(80)

        Text('tabBarVisibility displayMode undefined').fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height(30).backgroundColor(Color.Blue)
          }
          .id('tabVis_undefined')
          .tabBar('A')
          .tabBarVisibility(TabVisibility.VISIBLE, undefined)
          TabContent() { Column().width('100%').height(30).backgroundColor(Color.Green) }.tabBar('B')
        }
        .id('tabs_tabBarVisibility_undefined')
        .width('100%').height(80)
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }
}
