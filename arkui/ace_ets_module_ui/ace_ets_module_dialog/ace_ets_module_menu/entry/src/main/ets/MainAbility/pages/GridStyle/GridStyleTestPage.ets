/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { LengthMetrics } from '@kit.ArkUI';

import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct GridStyleTestPage {
  @State isShownDefault: boolean = false;
  @State isShownCount0: boolean = false;
  @State isShownCount1: boolean = false;
  @State isShownCount3: boolean = false;
  @State isShownCount6: boolean = false;
  @State isShownHSize1: boolean = false;
  @State isShownHSize2: boolean = false;
  @State isShownHSize3: boolean = false;
  @State isShownHSize4: boolean = false;
  @State isShownPosTop: boolean = false;
  @State isShownPosBottom: boolean = false;
  // @State isShownDefault: boolean = false;
  @State resultText: string = 'Ready';

  @State menuItems: MenuElement[] = [
    // { value: '复制' },
    // { value: '粘贴' },
    // { value: '剪切' },
    // { value: '删除' },
    // { value: '分享' },
    // { value: '全选' },
    // { value: '收藏' },
    // { value: '搜索' }
  ]

  @Builder
  MyMenu8() {
    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '复制' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '粘贴' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '剪切' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '删除' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '分享' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '全选' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '收藏' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '搜索' })
    }
    .width(150)
  }

  @Builder
  MyMenu4() {
    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '复制' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '粘贴' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '剪切' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '删除' })
    }
    .width(150)
  }

  build() {
    Column() {
      Column({ space: 10 }) {
        Text('gridStyle Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
          .id('title_text')

        Text(this.resultText)
          .fontSize(16)
          .id('result_text')
          .margin({ bottom: 10 })

        Text('MenuGridPosition Enum')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .id('section_enum')

        Row({ space: 10 }) {
          Button('MenuGridPosition.TOP=0')
            .id('btn_enum_top')
            .onClick(() => {
              this.resultText = 'MenuGridPosition.TOP = ' + MenuGridPosition.TOP;
            })

          Button('MenuGridPosition.BOTTOM=1')
            .id('btn_enum_bottom')
            .onClick(() => {
              this.resultText = 'MenuGridPosition.BOTTOM = ' + MenuGridPosition.BOTTOM;
            })
        }

        Text('count Tests')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .id('section_count')

        Row({ space: 10 }) {
          Text('count=0 (default)')
            .id('text_count_0')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownCount0, this.MyMenu4, {
              gridStyle: { count: 0 },
              onWillDisappear: () => {
                this.isShownCount0 = false;
              }
            })
            .onClick(() => {
              this.isShownCount0 = true;
              this.resultText = 'count=0 (default 3)';
            })

          Text('count=1')
            .id('text_count_1')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownCount1, this.MyMenu4, {
              gridStyle: { count: 1 },
              onWillDisappear: () => {
                this.isShownCount1 = false;
              }
            })
            .onClick(() => {
              this.isShownCount1 = true;
              this.resultText = 'count=1';
            })

          Text('count=3')
            .id('text_count_3')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownCount3, this.MyMenu4, {
              gridStyle: { count: 3 },
              onWillDisappear: () => {
                this.isShownCount3 = false;
              }
            })
            .onClick(() => {
              this.isShownCount3 = true;
              this.resultText = 'count=3 (default)';
            })

          Text('count=6')
            .id('text_count_6')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownCount6, this.MyMenu8, {
              gridStyle: { count: 6 },
              onWillDisappear: () => {
                this.isShownCount6 = false;
              }
            })
            .onClick(() => {
              this.isShownCount6 = true;
              this.resultText = 'count=6';
            })
        }

        Text('horizontalSize Tests')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .id('section_hsize')

        Row({ space: 10 }) {
          Text('hSize=1')
            .id('text_hsize_1')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownHSize1, this.MyMenu4, {
              gridStyle: { horizontalSize: 1 },
              onWillDisappear: () => {
                this.isShownHSize1 = false;
              }
            })
            .onClick(() => {
              this.isShownHSize1 = true;
              this.resultText = 'horizontalSize=1';
            })

          Text('hSize=2')
            .id('text_hsize_2')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownHSize2, this.MyMenu4, {
              gridStyle: { horizontalSize: 2 },
              onWillDisappear: () => {
                this.isShownHSize2 = false;
              }
            })
            .onClick(() => {
              this.isShownHSize2 = true;
              this.resultText = 'horizontalSize=2';
            })

          Text('hSize=3')
            .id('text_hsize_3')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownHSize3, this.MyMenu4, {
              gridStyle: { horizontalSize: 3 },
              onWillDisappear: () => {
                this.isShownHSize3 = false;
              }
            })
            .onClick(() => {
              this.isShownHSize3 = true;
              this.resultText = 'horizontalSize=3';
            })

          Text('hSize=4')
            .id('text_hsize_4')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownHSize4, this.MyMenu4, {
              gridStyle: { horizontalSize: 4 },
              onWillDisappear: () => {
                this.isShownHSize4 = false;
              }
            })
            .onClick(() => {
              this.isShownHSize4 = true;
              this.resultText = 'horizontalSize=4 (icon-only,4 per row)';
            })
        }

        Text('position Tests')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .id('section_position')

        Row({ space: 10 }) {
          Text('position=TOP')
            .id('text_pos_top')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownPosTop, this.MyMenu8, {
              gridStyle: { count: 4, position: MenuGridPosition.TOP },
              onWillDisappear: () => {
                this.isShownPosTop = false;
              }
            })
            .onClick(() => {
              this.isShownPosTop = true;
              this.resultText = 'position=TOP (grid above)';
            })

          Text('position=BOTTOM')
            .id('text_pos_bottom')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownPosBottom, this.MyMenu8, {
              gridStyle: { count: 4, position: MenuGridPosition.BOTTOM }

            })
            .onClick(() => {
              this.isShownPosBottom = true;
              this.resultText = 'position=BOTTOM (grid below)';
            })
        }

        Text('Combined Params Tests')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .id('section_combined')

        Row({ space: 10 }) {
          Text('count=4, hSize=3, pos=BOTTOM')
            .id('text_all_params')
            .fontSize(16)
            .bindContextMenuByIsShow(this.isShownDefault, this.MyMenu8, {
              gridStyle: { count: 4, horizontalSize: 3, position: MenuGridPosition.BOTTOM },
              onWillDisappear: () => {
                this.isShownDefault = false;
              }
            })
            .onClick(() => {
              this.isShownDefault = true;
              this.resultText = 'count=4 hSize=3 pos=BOTTOM';
            })
        }

        Text('Default(no gridStyle)')
          .id('text_no_grid')
          .fontSize(16)
          .bindContextMenuByIsShow(this.isShownDefault, this.MyMenu8, {
            onWillDisappear: () => {
              this.isShownDefault = false;
            }
          })
          .onClick(() => {
            this.isShownDefault = true;
            this.resultText = 'No gridStyle (default menu)';
          })
      }

      Text('bindMenu + MenuElement array')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .id('section_bindmenu')

      Row({ space: 10 }) {
        Text('bindMenu gridStyle')
          .id('text_bindmenu_grid')
          .fontSize(16)
          .bindMenu(this.menuItems, {
            gridStyle: { count: 4, horizontalSize: 2 }
          })
          .onClick(() => {
            this.resultText = 'bindMenu triggered with gridStyle';
          })
      }

      Text('Return Value Test')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .id('section_return')

      Row({ space: 10 }) {
        Button('Check Return Type')
          .id('btn_return_check')
          .onClick(() => {
            let result = this.bindContextMenuByIsShow(true, this.MyMenu8, {
              gridStyle: { count: 4, horizontalSize: 3, position: MenuGridPosition.BOTTOM },
              onWillDisappear: () => {
                this.isShownDefault = false;
              }
            });
            this.resultText = 'bindContextMenuByIsShow returns T (component itself)';
          })
      }

      Button('Back')
        .id('btn_back')
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
  }
}