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
  TabBarStyle, TabBarDisplayMode, BarPosition, Color, TabVisibility
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TabsApiCoverageAbnormalStatic {
  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabsApiCoverageAbnormalStatic] router error ' + error);
    }
  }

  @Builder
  twoTabs() {
    TabContent() {
      Column().width('100%').height(30).backgroundColor(Color.Blue)
    }.tabBar('A')
    TabContent() {
      Column().width('100%').height(30).backgroundColor(Color.Green)
    }.tabBar('B')
  }

  @Builder
  barStyleSection() {
    Text('barStyle default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_barStyle_default')
    .width('100%').height(80)
    Text('barStyle undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_barStyle_undefined')
    .barStyle(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarPositionSection() {
    Text('sidebarPosition default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarPosition_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarPosition undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarPosition_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarPosition(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarHeaderSection() {
    Text('sidebarHeader default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarHeader_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarHeader undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarHeader_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarHeader(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarSearchSection() {
    Text('sidebarSearchable default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSearchable_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarSearchable undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSearchable_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarSearchable(undefined)
    .width('100%').height(80)
  }

  @Builder
  breakpointSection() {
    Text('barDisplayModeBreakpoint default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_barDisplayModeBreakpoint_default')
    .barStyle(TabBarStyle.SIDEBAR_ADAPTABLE)
    .width('100%').height(80)
    Text('barDisplayModeBreakpoint undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_barDisplayModeBreakpoint_undefined')
    .barStyle(TabBarStyle.SIDEBAR_ADAPTABLE)
    .barDisplayModeBreakpoint(undefined)
    .width('100%').height(80)
  }

  @Builder
  onBarModeSection() {
    Text('onBarDisplayModeChange default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_onBarDisplayModeChange_default')
    .barStyle(TabBarStyle.SIDEBAR_ADAPTABLE)
    .width('100%').height(80)
    Text('onBarDisplayModeChange undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_onBarDisplayModeChange_undefined')
    .barStyle(TabBarStyle.SIDEBAR_ADAPTABLE)
    .onBarDisplayModeChange(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarSelectedIconColorSection() {
    Text('sidebarSelectedIconColor default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSelectedIconColor_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarSelectedIconColor undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSelectedIconColor_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarSelectedIconColor(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarSelectedTextColorSection() {
    Text('sidebarSelectedTextColor default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSelectedTextColor_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarSelectedTextColor undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSelectedTextColor_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarSelectedTextColor(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarUnselectedIconColorSection() {
    Text('sidebarUnselectedIconColor default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarUnselectedIconColor_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarUnselectedIconColor undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarUnselectedIconColor_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarUnselectedIconColor(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarUnselectedTextColorSection() {
    Text('sidebarUnselectedTextColor default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarUnselectedTextColor_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarUnselectedTextColor undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarUnselectedTextColor_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarUnselectedTextColor(undefined)
    .width('100%').height(80)
  }

  @Builder
  sidebarSelectedBoardColorSection() {
    Text('sidebarSelectedBoardColor default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSelectedBoardColor_default')
    .barStyle(TabBarStyle.SIDEBAR)
    .width('100%').height(80)
    Text('sidebarSelectedBoardColor undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      this.twoTabs()
    }
    .id('tabs_sidebarSelectedBoardColor_undefined')
    .barStyle(TabBarStyle.SIDEBAR)
    .sidebarSelectedBoardColor(undefined)
    .width('100%').height(80)
  }

  @Builder
  tabVisSection() {
    Text('tabBarVisibility default').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Blue)
      }
      .id('tabVis_default')
      .tabBar('A')
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Green)
      }.tabBar('B')
    }
    .id('tabs_tabBarVisibility_default')
    .width('100%').height(80)
    Text('tabBarVisibility undefined').fontSize(12)
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Blue)
      }
      .id('tabVis_undefined')
      .tabBar('A')
      .tabBarVisibility(TabVisibility.VISIBLE, undefined)
      TabContent() {
        Column().width('100%').height(30).backgroundColor(Color.Green)
      }.tabBar('B')
    }
    .id('tabs_tabBarVisibility_undefined')
    .width('100%').height(80)
  }

  build() {
    Scroll() {
      Column({ space: 8 } as ColumnOptions) {
        Text('TabsApiCoverageAbnormalStatic').id('tabsApiCovAbnStaticTitle').fontSize(16)
        this.barStyleSection()
        this.sidebarPositionSection()
        this.sidebarHeaderSection()
        this.sidebarSearchSection()
        this.breakpointSection()
        this.onBarModeSection()
        this.sidebarSelectedIconColorSection()
        this.sidebarSelectedTextColorSection()
        this.sidebarUnselectedIconColorSection()
        this.sidebarUnselectedTextColorSection()
        this.sidebarSelectedBoardColorSection()
        this.tabVisSection()
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }
}
