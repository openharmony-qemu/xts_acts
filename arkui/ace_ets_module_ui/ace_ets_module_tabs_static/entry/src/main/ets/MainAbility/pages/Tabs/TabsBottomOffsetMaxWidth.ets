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
  BarPosition, BarMode, FloatingTabBarStyle
} from '@ohos.arkui.component'

@Entry
@Component
struct TabsBottomOffsetMaxWidth {
  build() {
    Scroll() {
      Column() {
        Text('TabsBottomOffsetMaxWidth').id('tabsBottomOffsetMaxWidthTitle').fontSize(16)

      Text('btm_offset_base').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_base')
      .barFloatingStyle({})
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_xy').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_xy')
      .barFloatingStyle({ offset: { x: 16, y: 8 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_neg').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_neg')
      .barFloatingStyle({ offset: { x: -16, y: -8 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_edges_tb').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_edges_tb')
      .barFloatingStyle({ offset: { top: 10, bottom: 20 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_edges_lr').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_edges_lr')
      .barFloatingStyle({ offset: { left: 10, right: 20 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_le_start').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_le_start')
      .barFloatingStyle({ offset: { x: 16 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_extreme').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_extreme')
      .barFloatingStyle({ offset: { x: 9999, y: 9999 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_extreme_neg').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_extreme_neg')
      .barFloatingStyle({ offset: { x: -9999, y: -9999 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_zero').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_zero')
      .barFloatingStyle({ offset: { x: 0, y: 0 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_nan').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_nan')
      .barFloatingStyle({ offset: { x: 0, y: 0 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_pct').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_pct')
      .barFloatingStyle({ offset: { x: '50%', y: '-20%' } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_side_base').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_side_base')
      .barFloatingStyle({ barSideMargin: 20 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_side_xy').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_side_xy')
      .barFloatingStyle({ barSideMargin: 20, offset: { x: 16, y: 8 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_bottom_base').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_bottom_base')
      .barFloatingStyle({ barBottomMargin: 24 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_offset_bottom_xy').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_offset_bottom_xy')
      .barFloatingStyle({ barBottomMargin: 24, offset: { x: 16, y: 8 } })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_mw_base_350').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_base_350')
      .barFloatingStyle({})
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(350)

      Text('btm_mw_200_350').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_200_350')
      .barFloatingStyle({ maxWidth: 200 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(350)

      Text('btm_mw_400_350').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_400_350')
      .barFloatingStyle({ maxWidth: 400 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(350)

      Text('btm_mw_100_350').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_100_350')
      .barFloatingStyle({ maxWidth: 100 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(350)

      Text('btm_mw_base_840').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_base_840')
      .barFloatingStyle({})
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(840)

      Text('btm_mw_200_840').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_200_840')
      .barFloatingStyle({ maxWidth: 200 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(840)

      Text('btm_mw_400_840').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_400_840')
      .barFloatingStyle({ maxWidth: 400 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(840)

      Text('btm_mw_neg').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_neg')
      .barFloatingStyle({ maxWidth: -1 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_mw_nan').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_nan')
      .barFloatingStyle({ maxWidth: 0 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width('100%')

      Text('btm_mw_pct').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_mw_pct')
      .barFloatingStyle({ maxWidth: '10%' })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(350)

      Text('btm_bw_mw_a').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_bw_mw_a')
      .barFloatingStyle({ barWidth: { smallBarWidth: 400, mediumBarWidth: 400, largeBarWidth: 400 }, maxWidth: 300 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(500)

      Text('btm_bw_mw_b').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_bw_mw_b')
      .barFloatingStyle({ barWidth: { smallBarWidth: 200, mediumBarWidth: 200, largeBarWidth: 200 }, maxWidth: 300 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(500)

      Text('btm_bw_mw_eq').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_bw_mw_eq')
      .barFloatingStyle({ barWidth: { smallBarWidth: 200, mediumBarWidth: 200, largeBarWidth: 200 }, maxWidth: 200 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(500)

      Text('btm_side_mw_a').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_side_mw_a')
      .barFloatingStyle({ barSideMargin: 100, maxWidth: 100 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(500)

      Text('btm_side_mw_b').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_side_mw_b')
      .barFloatingStyle({ barSideMargin: 100, maxWidth: 600 })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(500)

      Text('btm_tri_a').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_tri_a')
      .barFloatingStyle(
        { barWidth: { smallBarWidth: 400, mediumBarWidth: 400, largeBarWidth: 400 }, barSideMargin: 100, maxWidth: 600 }
      )
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(500)

      Text('btm_tri_b').fontSize(10)
      Tabs({ barPosition: BarPosition.End }) {
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
      .id('btm_tri_b')
      .barFloatingStyle(
        { barWidth: { smallBarWidth: 400, mediumBarWidth: 400, largeBarWidth: 400 }, barSideMargin: 100, maxWidth: 300 }
      )
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
      .height(120)
      .width(500)

      }.width('100%').padding(8)
    }.width('100%').height('100%')
  }
}
