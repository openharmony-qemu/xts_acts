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
  BarPosition
} from '@ohos.arkui.component'

@Entry
@Component
struct TopFloatingBarStyle {
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
        .id('tabs_top_basic')
        .barStyle('top')
        .topBarFloatingStyle({
          barWidth: 400,
          maskColor: '#33000000',
          maskHeight: 200
        })
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
        .id('tabs_top_barWidth')
        .barStyle('top')
        .topBarFloatingStyle({ barWidth: 400 })
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
        .id('tabs_top_mask')
        .barStyle('top')
        .topBarFloatingStyle({
          maskColor: '#33000000',
          maskHeight: 200
        })
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
        .id('tabs_top_maxWidth')
        .barStyle('top')
        .topBarFloatingStyle({ maxWidth: 500 })
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
        .id('tabs_top_offset')
        .barStyle('top')
        .topBarFloatingStyle({ offset: { x: 20, y: 0 } })
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
        .id('tabs_top_margin')
        .barStyle('top')
        .topBarFloatingStyle({
          barSideMargin: 16,
          barTopMargin: 8
        })
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
        .id('tabs_top_barWidth_percent')
        .barStyle('top')
        .topBarFloatingStyle({ barWidth: '50%' })
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
        .id('tabs_top_maskHeight_percent')
        .barStyle('top')
        .topBarFloatingStyle({ maskHeight: '20%' })
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
        .id('tabs_top_maxWidth_percent')
        .barStyle('top')
        .topBarFloatingStyle({ maxWidth: '80%' })
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
        .id('tabs_top_margin_percent')
        .barStyle('top')
        .topBarFloatingStyle({
          barSideMargin: '5%',
          barTopMargin: '2%'
        })
        .barMode(BarMode.Scrollable)
        .height('20%')
        .width('100%')

        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
        }
        .id('tabs_top_barPosition_ignored')
        .barStyle('top')
        .topBarFloatingStyle({ barWidth: 400 })
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
