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

import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct TabsBottomOffsetMaxWidth {
  @Builder
  tabBlock(nodeId: string, style: FloatingTabBarStyle, w: Length) {
    Text(nodeId).fontSize(10)
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
    .id(nodeId)
    .barFloatingStyle(style)
    .barOverlap(true)
    .barMode(BarMode.Scrollable)
    .height(120)
    .width(w)
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('TabsBottomOffsetMaxWidth').id('tabsBottomOffsetMaxWidthTitle').fontSize(16)
        this.tabBlock('btm_offset_base', {}, '100%')
        this.tabBlock('btm_offset_xy', { offset: { x: 16, y: 8 } }, '100%')
        this.tabBlock('btm_offset_neg', { offset: { x: -16, y: -8 } }, '100%')
        this.tabBlock('btm_offset_edges_tb', { offset: { top: 10, bottom: 20 } }, '100%')
        this.tabBlock('btm_offset_edges_lr', { offset: { left: 10, right: 20 } }, '100%')
        this.tabBlock('btm_offset_le_start', { offset: { start: LengthMetrics.vp(16) } }, '100%')
        this.tabBlock('btm_offset_extreme', { offset: { x: 9999, y: 9999 } }, '100%')
        this.tabBlock('btm_offset_extreme_neg', { offset: { x: -9999, y: -9999 } }, '100%')
        this.tabBlock('btm_offset_zero', { offset: { x: 0, y: 0 } }, '100%')
        this.tabBlock('btm_offset_nan', { offset: { x: NaN, y: Infinity } }, '100%')
        this.tabBlock('btm_offset_pct', { offset: { x: '50%', y: '-20%' } }, '100%')
        this.tabBlock('btm_offset_side_base', { barSideMargin: 20 }, '100%')
        this.tabBlock('btm_offset_side_xy', { barSideMargin: 20, offset: { x: 16, y: 8 } }, '100%')
        this.tabBlock('btm_offset_bottom_base', { barBottomMargin: 24 }, '100%')
        this.tabBlock('btm_offset_bottom_xy', { barBottomMargin: 24, offset: { x: 16, y: 8 } }, '100%')
        this.tabBlock('btm_mw_base_350', {}, 350)
        this.tabBlock('btm_mw_200_350', { maxWidth: 200 }, 350)
        this.tabBlock('btm_mw_400_350', { maxWidth: 400 }, 350)
        this.tabBlock('btm_mw_100_350', { maxWidth: 100 }, 350)
        this.tabBlock('btm_mw_base_840', {}, 840)
        this.tabBlock('btm_mw_200_840', { maxWidth: 200 }, 840)
        this.tabBlock('btm_mw_400_840', { maxWidth: 400 }, 840)
        this.tabBlock('btm_mw_neg', { maxWidth: -1 }, '100%')
        this.tabBlock('btm_mw_nan', { maxWidth: NaN }, '100%')
        this.tabBlock('btm_mw_pct', { maxWidth: '10%' }, 350)
        this.tabBlock('btm_bw_mw_a', {
          barWidth: { smallBarWidth: 400, mediumBarWidth: 400, largeBarWidth: 400 },
          maxWidth: 300
        }, 500)
        this.tabBlock('btm_bw_mw_b', {
          barWidth: { smallBarWidth: 200, mediumBarWidth: 200, largeBarWidth: 200 },
          maxWidth: 300
        }, 500)
        this.tabBlock('btm_bw_mw_eq', {
          barWidth: { smallBarWidth: 200, mediumBarWidth: 200, largeBarWidth: 200 },
          maxWidth: 200
        }, 500)
        this.tabBlock('btm_side_mw_a', { barSideMargin: 100, maxWidth: 100 }, 500)
        this.tabBlock('btm_side_mw_b', { barSideMargin: 100, maxWidth: 600 }, 500)
        this.tabBlock('btm_tri_a', {
          barWidth: { smallBarWidth: 400, mediumBarWidth: 400, largeBarWidth: 400 },
          barSideMargin: 100,
          maxWidth: 600
        }, 500)
        this.tabBlock('btm_tri_b', {
          barWidth: { smallBarWidth: 400, mediumBarWidth: 400, largeBarWidth: 400 },
          barSideMargin: 100,
          maxWidth: 300
        }, 500)
      }.width('100%').padding(8)
    }.width('100%').height('100%')
  }
}
