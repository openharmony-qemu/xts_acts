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
  Entry, Text, Column, Component, Tabs, TabContent, Color, Scroll,
  BarMode, BarPosition, TabBarStyle
} from '@ohos.arkui.component'

@Entry
@Component
struct TabsTopOffsetMaxWidth {
  build() {
    Scroll() {
      Column() {
        Text('TabsTopOffsetMaxWidth').id('tabsTopOffsetMaxWidthTitle').fontSize(16)

      Text('top_offset_base').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_base')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({})
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_x16').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_x16')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: 16, y: 0 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_y16vp').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_y16vp')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { y: '16vp' } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_neg').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_neg')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: -1, y: -2 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_pct').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_pct')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: '50%', y: '50%' } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_edges_left').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_edges_left')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { left: 16 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_edges_tb').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_edges_tb')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { top: 16, bottom: 32 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_edges_lr').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_edges_lr')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { left: 16, right: 32 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_le_start').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_le_start')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: 16 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_le_start_end').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_le_start_end')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: 16, y: 0 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_le_tb').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_le_tb')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { top: 16, bottom: 32 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_zero').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_zero')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: 0, y: 0 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_nan').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_nan')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: 0 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_inf').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_inf')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: Infinity } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_side_base').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_side_base')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ barSideMargin: 24 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_side_xy').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_side_xy')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ barSideMargin: 24, offset: { x: 16, y: 8 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_invalid_margin').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_invalid_margin')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ offset: { x: 16, y: 8 }, barSideMargin: 'abc' })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_topmargin_base').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_topmargin_base')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ barTopMargin: 24 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_offset_topmargin_xy').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_offset_topmargin_xy')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ barTopMargin: 24, offset: { x: 16, y: 8 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_mw_base').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_base')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({})
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_mw_560').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_560')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 560 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_mw_200').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_200')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 200 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_mw_neg').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_neg')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: -1 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_mw_nan').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_nan')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 0 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_mw_pct').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_pct')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: '50%' })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('top_mw_1100_800').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_1100_800')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 800, barSideMargin: 16 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(1100)

      Text('top_mw_1100_1000').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_1100_1000')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 1000, barSideMargin: 16 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(1100)

      Text('top_mw_800_700').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_800_700')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 700, barSideMargin: 16 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(800)

      Text('top_mw_800_800').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_800_800')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 800, barSideMargin: 16 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(800)

      Text('top_mw_300_268').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_300_268')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 268, barSideMargin: 16 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      Text('top_mw_839_24').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_839_24')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 700, barSideMargin: 24 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(839)

      Text('top_mw_840_24').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_mw_840_24')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 700, barSideMargin: 24 })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(840)

      Text('top_bw_mw_a').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_bw_mw_a')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle(
              { barWidth: 600, maxWidth: 400 }
            )
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(720)

      Text('top_bw_mw_b').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_bw_mw_b')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle(
              { barWidth: 300, maxWidth: 400 }
            )
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(720)

      Text('top_bw_mw_c').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_bw_mw_c')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle(
              { barWidth: 700, maxWidth: 500 }
            )
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(1000)

      Text('top_bw_mw_d').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_bw_mw_d')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle(
              { barWidth: 400, maxWidth: 500 }
            )
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(1000)

      Text('top_tri_a').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_tri_a')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({
        barWidth: 500,
        maxWidth: 600,
        barSideMargin: 24
      })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(1000)

      Text('top_tri_b').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_tri_b')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({
        barWidth: 600,
        maxWidth: 500,
        barSideMargin: 24
      })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(1000)

      Text('top_tri_c').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_tri_c')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({
        barWidth: 800,
        maxWidth: 900,
        barSideMargin: 24
      })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(1000)

      Text('top_tri_d').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_tri_d')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({
        barWidth: 220,
        maxWidth: 250,
        barSideMargin: 20
      })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      Text('top_tri_e').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_tri_e')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({
        barWidth: 250,
        maxWidth: 220,
        barSideMargin: 20
      })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      Text('top_tri_f').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_tri_f')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({
        barWidth: 280,
        maxWidth: 290,
        barSideMargin: 20
      })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      Text('top_off_mw_a').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_off_mw_a')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 250, barSideMargin: 20, offset: { x: 0, y: 0 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      Text('top_off_mw_b').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_off_mw_b')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 250, barSideMargin: 20, offset: { x: 16, y: 8 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      Text('top_off_mw_c').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_off_mw_c')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 200, barSideMargin: 20, offset: { x: 0, y: 0 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      Text('top_off_mw_d').fontSize(10)
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('Pink')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('Green')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Orange)
        }.tabBar('Orange')
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('Blue')
      }
      .id('top_off_mw_d')
            .barStyle(TabBarStyle.TOP)
            .topBarFloatingStyle({ maxWidth: 200, barSideMargin: 20, offset: { x: -16, y: -8 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      }.width('100%').padding(8)
    }.width('100%').height('100%')
  }
}
