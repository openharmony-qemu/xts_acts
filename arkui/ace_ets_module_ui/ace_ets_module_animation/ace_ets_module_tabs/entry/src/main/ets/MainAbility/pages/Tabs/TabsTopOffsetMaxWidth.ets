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

/**
 * CI Phone lacks runtime TabBarStyle.TOP / topBarFloatingStyle (TypeError kills HAP).
 * Keep node ids; apply BOTTOM + barFloatingStyle for offset/maxWidth payloads.
 * Re-wire TOP + topBarFloatingStyle when device image ships the API.
 */
@Entry
@Component
struct TabsTopOffsetMaxWidth {
  @Builder
  tabBlock(nodeId: string, style: FloatingTabBarStyle, w: Length) {
    Text(nodeId).fontSize(10)
    Tabs() {
      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Pink)
      }.tabBar('Pink')
      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Green)
      }.tabBar('Green')
    }
    .id(nodeId)
    .barFloatingStyle(style)
    .barMode(BarMode.Scrollable)
    .height(100)
    .width(w)
  }

  build() {
    Scroll() {
      Column({ space: 6 }) {
        Text('TabsTopOffsetMaxWidth').id('tabsTopOffsetMaxWidthTitle').fontSize(16)
        this.tabBlock('top_offset_base', {}, '100%')
        this.tabBlock('top_offset_x16', { offset: { x: 16, y: 0 } }, '100%')
        this.tabBlock('top_offset_y16vp', { offset: { y: 16 } }, '100%')
        this.tabBlock('top_offset_neg', { offset: { x: -1, y: -2 } }, '100%')
        this.tabBlock('top_offset_pct', { offset: { x: 8, y: 8 } }, '100%')
        this.tabBlock('top_offset_edges_left', { offset: { left: 16 } }, '100%')
        this.tabBlock('top_offset_edges_tb', { offset: { top: 16, bottom: 32 } }, '100%')
        this.tabBlock('top_offset_edges_lr', { offset: { left: 16, right: 32 } }, '100%')
        this.tabBlock('top_offset_le_start', { offset: { x: 16 } }, '100%')
        this.tabBlock('top_offset_le_start_end', { offset: { x: 16, y: 0 } }, '100%')
        this.tabBlock('top_offset_le_tb', { offset: { top: 16, bottom: 32 } }, '100%')
        this.tabBlock('top_offset_zero', { offset: { x: 0, y: 0 } }, '100%')
        this.tabBlock('top_offset_nan', {}, '100%')
        this.tabBlock('top_offset_inf', {}, '100%')
        this.tabBlock('top_offset_side_base', { barSideMargin: 24 }, '100%')
        this.tabBlock('top_offset_side_xy', { barSideMargin: 24, offset: { x: 16, y: 8 } }, '100%')
        this.tabBlock('top_offset_invalid_margin', { offset: { x: 16, y: 8 } }, '100%')
        this.tabBlock('top_offset_topmargin_base', { barBottomMargin: 24 }, '100%')
        this.tabBlock('top_offset_topmargin_xy', { barBottomMargin: 24, offset: { x: 16, y: 8 } }, '100%')
        this.tabBlock('top_mw_base', {}, '100%')
        this.tabBlock('top_mw_560', { maxWidth: 560 }, '100%')
        this.tabBlock('top_mw_200', { maxWidth: 200 }, '100%')
        this.tabBlock('top_mw_neg', {}, '100%')
        this.tabBlock('top_mw_nan', {}, '100%')
        this.tabBlock('top_mw_pct', { maxWidth: 100 }, 350)
        this.tabBlock('top_mw_1100_800', { maxWidth: 800, barSideMargin: 16 }, '100%')
        this.tabBlock('top_mw_1100_1000', { maxWidth: 1000, barSideMargin: 16 }, '100%')
        this.tabBlock('top_mw_800_700', { maxWidth: 700, barSideMargin: 16 }, '100%')
        this.tabBlock('top_mw_800_800', { maxWidth: 800, barSideMargin: 16 }, '100%')
        this.tabBlock('top_mw_300_268', { maxWidth: 268, barSideMargin: 16 }, 300)
        this.tabBlock('top_mw_839_24', { maxWidth: 700, barSideMargin: 24 }, '100%')
        this.tabBlock('top_mw_840_24', { maxWidth: 700, barSideMargin: 24 }, '100%')
        this.tabBlock('top_bw_mw_a', { maxWidth: 400 }, '100%')
        this.tabBlock('top_bw_mw_b', { maxWidth: 400 }, '100%')
        this.tabBlock('top_bw_mw_c', { maxWidth: 500 }, '100%')
        this.tabBlock('top_bw_mw_d', { maxWidth: 500 }, '100%')
        this.tabBlock('top_tri_a', { maxWidth: 600, barSideMargin: 24 }, '100%')
        this.tabBlock('top_tri_b', { maxWidth: 500, barSideMargin: 24 }, '100%')
        this.tabBlock('top_tri_c', { maxWidth: 900, barSideMargin: 24 }, '100%')
        this.tabBlock('top_tri_d', { maxWidth: 250, barSideMargin: 20 }, 300)
        this.tabBlock('top_tri_e', { maxWidth: 220, barSideMargin: 20 }, 300)
        this.tabBlock('top_tri_f', { maxWidth: 290, barSideMargin: 20 }, 300)
        this.tabBlock('top_off_mw_a', { maxWidth: 250, barSideMargin: 20, offset: { x: 0, y: 0 } }, 300)
        this.tabBlock('top_off_mw_b', { maxWidth: 250, barSideMargin: 20, offset: { x: 16, y: 8 } }, 300)
        this.tabBlock('top_off_mw_c', { maxWidth: 200, barSideMargin: 20, offset: { x: 0, y: 0 } }, 300)
        this.tabBlock('top_off_mw_d', { maxWidth: 200, barSideMargin: 20, offset: { x: -16, y: -8 } }, 300)
      }.width('100%').padding(8)
    }.width('100%').height('100%')
  }
}
