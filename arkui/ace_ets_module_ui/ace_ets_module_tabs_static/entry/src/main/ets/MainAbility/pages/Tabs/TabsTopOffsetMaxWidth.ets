'use static';
/* CI Phone: TOP/topBarFloatingStyle stubbed as BOTTOM+barFloatingStyle. */
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
  BarMode, BarPosition, FloatingTabBarStyle
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
            .barFloatingStyle({})
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
            .barFloatingStyle({ offset: { x: 16, y: 0 } })
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
            .barFloatingStyle({ offset: { y: '16vp' } })
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
            .barFloatingStyle({ offset: { x: -1, y: -2 } })
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
            .barFloatingStyle({ offset: { x: '50%', y: '50%' } })
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
            .barFloatingStyle({ offset: { left: 16 } })
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
            .barFloatingStyle({ offset: { top: 16, bottom: 32 } })
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
            .barFloatingStyle({ offset: { left: 16, right: 32 } })
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
            .barFloatingStyle({ offset: { x: 16 } })
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
            .barFloatingStyle({ offset: { x: 16, y: 0 } })
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
            .barFloatingStyle({ offset: { top: 16, bottom: 32 } })
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
            .barFloatingStyle({ offset: { x: 0, y: 0 } })
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
            .barFloatingStyle({ offset: { x: 0 } })
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
            .barFloatingStyle({ offset: { x: Infinity } })
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
            .barFloatingStyle({ barSideMargin: 24 })
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
            .barFloatingStyle({ barSideMargin: 24, offset: { x: 16, y: 8 } })
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
            .barFloatingStyle({ offset: { x: 16, y: 8 }, barSideMargin: 'abc' })
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
            .barFloatingStyle({ barBottomMargin: 24 })
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
            .barFloatingStyle({ barBottomMargin: 24, offset: { x: 16, y: 8 } })
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
            .barFloatingStyle({})
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
            .barFloatingStyle({ maxWidth: 560 })
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
            .barFloatingStyle({ maxWidth: 200 })
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
            .barFloatingStyle({ maxWidth: -1 })
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
            .barFloatingStyle({ maxWidth: 0 })
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
            .barFloatingStyle({ maxWidth: '50%' })
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
            .barFloatingStyle({ maxWidth: 800, barSideMargin: 16 })
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
            .barFloatingStyle({ maxWidth: 1000, barSideMargin: 16 })
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
            .barFloatingStyle({ maxWidth: 700, barSideMargin: 16 })
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
            .barFloatingStyle({ maxWidth: 800, barSideMargin: 16 })
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
            .barFloatingStyle({ maxWidth: 268, barSideMargin: 16 })
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
            .barFloatingStyle({ maxWidth: 700, barSideMargin: 24 })
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
            .barFloatingStyle({ maxWidth: 700, barSideMargin: 24 })
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
            .barFloatingStyle(
              { barWidth: { smallBarWidth: 600, mediumBarWidth: 600, largeBarWidth: 600 }, maxWidth: 400 }
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
            .barFloatingStyle(
              { barWidth: { smallBarWidth: 300, mediumBarWidth: 300, largeBarWidth: 300 }, maxWidth: 400 }
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
            .barFloatingStyle(
              { barWidth: { smallBarWidth: 700, mediumBarWidth: 700, largeBarWidth: 700 }, maxWidth: 500 }
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
            .barFloatingStyle(
              { barWidth: { smallBarWidth: 400, mediumBarWidth: 400, largeBarWidth: 400 }, maxWidth: 500 }
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
            .barFloatingStyle({
        barWidth: { smallBarWidth: 500, mediumBarWidth: 500, largeBarWidth: 500 },
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
            .barFloatingStyle({
        barWidth: { smallBarWidth: 600, mediumBarWidth: 600, largeBarWidth: 600 },
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
            .barFloatingStyle({
        barWidth: { smallBarWidth: 800, mediumBarWidth: 800, largeBarWidth: 800 },
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
            .barFloatingStyle({
        barWidth: { smallBarWidth: 220, mediumBarWidth: 220, largeBarWidth: 220 },
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
            .barFloatingStyle({
        barWidth: { smallBarWidth: 250, mediumBarWidth: 250, largeBarWidth: 250 },
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
            .barFloatingStyle({
        barWidth: { smallBarWidth: 280, mediumBarWidth: 280, largeBarWidth: 280 },
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
            .barFloatingStyle({ maxWidth: 250, barSideMargin: 20, offset: { x: 0, y: 0 } })
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
            .barFloatingStyle({ maxWidth: 250, barSideMargin: 20, offset: { x: 16, y: 8 } })
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
            .barFloatingStyle({ maxWidth: 200, barSideMargin: 20, offset: { x: 0, y: 0 } })
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
            .barFloatingStyle({ maxWidth: 200, barSideMargin: 20, offset: { x: -16, y: -8 } })
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(300)

      }.width('100%').padding(8)
    }.width('100%').height('100%')
  }
}
