'use static';
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
import {
  Entry,
  Text,
  Column,
  Component,
  Scroll,
  Tabs,
  TabContent,
  Color,
  BarMode,
  TabBarStyle
} from '@ohos.arkui.component'

@Entry
@Component
struct TopFloatingBarInvalid {
  build() {
    Scroll() {
      Column() {
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barWidth: -100 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barWidth_nan')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barWidth: NaN })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_sideMargin_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barSideMargin: -16 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_topMargin_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ barTopMargin: -8 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_maxWidth_negative')
        .barStyle(TabBarStyle.TOP)
        .topBarFloatingStyle({ maxWidth: -1 })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')
      }
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}
