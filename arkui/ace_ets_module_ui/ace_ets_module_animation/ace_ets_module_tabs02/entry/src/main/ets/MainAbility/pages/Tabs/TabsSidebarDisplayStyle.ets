/**
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

@Entry
@Component
struct TabsSidebarDisplayStylePage {
  build() {
    Scroll() {
      Column({ space: 5 }) {
        Text('Tabs sidebarDisplayStyle Tests')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text('sidebarDisplayStyle EMBED')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_sidebarDisplayStyle_embed')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarDisplayStyle(TabsSidebarDisplayStyle.EMBED)
        .width('100%')
        .height('15%')

        Divider()

        Text('sidebarDisplayStyle DISPLACE')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_sidebarDisplayStyle_displace')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarDisplayStyle(TabsSidebarDisplayStyle.DISPLACE)
        .width('100%')
        .height('15%')

        Divider()

        Text('sidebarDisplayStyle default (not set)')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_sidebarDisplayStyle_default')
        .barStyle(TabBarStyle.SIDEBAR)
        .width('100%')
        .height('15%')

        Divider()

        Text('sidebarDisplayStyle undefined')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_sidebarDisplayStyle_undefined')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarDisplayStyle(undefined)
        .width('100%')
        .height('15%')

        Divider()

        Text('sidebarDisplayStyle null')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_sidebarDisplayStyle_null')
        .barStyle(TabBarStyle.SIDEBAR)
        .sidebarDisplayStyle(null)
        .width('100%')
        .height('15%')
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#C0C0C0')
    }
    .height('100%')
    .width('100%')
  }
}
