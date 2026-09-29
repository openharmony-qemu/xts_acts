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
  Entry, Component, Column, Text, Scroll, Tabs, TabContent, Color, TabBarOptions
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TabBarOptionsCoverage {
  aboutToAppear(): void {
    try {
      const routerInst: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[TabBarOptionsCoverage] router error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('TabBarOptionsCoverage').id('tabBarOptionsCovTitle').fontSize(16)

        Text('TabBarOptions text normal').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_text_normal')
          .tabBar({ text: 'Home' } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_text_normal')
        .width('100%').height(120)

        Text('TabBarOptions text undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_text_undefined')
          .tabBar({ text: undefined } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_text_undefined')
        .width('100%').height(120)

        Text('TabBarBadgeStyle value normal').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeValue_normal')
          .tabBar({ text: 'Home', badge: { value: 8, maxCount: 99 } } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeValue_normal')
        .width('100%').height(120)

        Text('TabBarBadgeStyle value undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeValue_undefined')
          .tabBar({
            text: 'Home',
            badge: { value: undefined, maxCount: 99 }
          } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeValue_undefined')
        .width('100%').height(120)

        Text('TabBarBadgeStyle maxCount normal').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeMax_normal')
          .tabBar({ text: 'Home', badge: { value: 8, maxCount: 99 } } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeMax_normal')
        .width('100%').height(120)

        Text('TabBarBadgeStyle maxCount undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_badgeMax_undefined')
          .tabBar({
            text: 'Home',
            badge: { value: 8, maxCount: undefined }
          } as TabBarOptions)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBarOptions_badgeMax_undefined')
        .width('100%').height(120)

        Text('tabBar undefined').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_tabBar_undefined')
          .tabBar(undefined)
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBar_undefined')
        .width('100%').height(120)

        Text('tabBar default').fontSize(12)
        Tabs() {
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Blue)
          }
          .id('tabBarOptions_default')
          .tabBar('A')
          TabContent() {
            Column().width('100%').height(40).backgroundColor(Color.Green)
          }.tabBar('B')
        }
        .id('tabs_tabBar_default')
        .width('100%').height(120)
      }
      .width('100%')
      .padding(8)
    }
    .width('100%')
    .height('100%')
  }
}
