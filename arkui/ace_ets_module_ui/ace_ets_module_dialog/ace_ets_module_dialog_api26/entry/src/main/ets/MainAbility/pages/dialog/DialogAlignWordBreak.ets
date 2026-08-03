/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { DialogPresenter } from '@ohos.arkui.UIContext';
import { DialogBaseAlignment } from '@ohos.arkui.dialog';

@Entry
@Component
struct DialogAlignWordBreak {
  @State lastAction: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('Align x wordBreak part1').fontSize(16).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('align_wb_action')
        Button('TOP x NORMAL')
          .id('btn_aw_top_normal')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_NORMAL',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_NORMAL',
                wordBreak: WordBreak.NORMAL
              },
              alignment: DialogBaseAlignment.TOP,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_NORMAL',
                action: () => { this.lastAction = 'act_TOP_NORMAL'; }
              }]
            });
          })
        Button('TOP x BREAK_ALL')
          .id('btn_aw_top_break_all')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_BREAK_ALL',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_BREAK_ALL',
                wordBreak: WordBreak.BREAK_ALL
              },
              alignment: DialogBaseAlignment.TOP,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_BREAK_ALL',
                action: () => { this.lastAction = 'act_TOP_BREAK_ALL'; }
              }]
            });
          })
        Button('TOP x BREAK_WORD')
          .id('btn_aw_top_break_word')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_BREAK_WORD',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_BREAK_WORD',
                wordBreak: WordBreak.BREAK_WORD
              },
              alignment: DialogBaseAlignment.TOP,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_BREAK_WORD',
                action: () => { this.lastAction = 'act_TOP_BREAK_WORD'; }
              }]
            });
          })
        Button('CENTER x NORMAL')
          .id('btn_aw_center_normal')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWCENTER_NORMAL',
              message: {
                content: 'AlignWordBreakLongMessageContent_CENTER_NORMAL',
                wordBreak: WordBreak.NORMAL
              },
              alignment: DialogBaseAlignment.CENTER,
              width: '75%',
              buttons: [{
                value: 'OK_CENTER_NORMAL',
                action: () => { this.lastAction = 'act_CENTER_NORMAL'; }
              }]
            });
          })
        Button('CENTER x BREAK_ALL')
          .id('btn_aw_center_break_all')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWCENTER_BREAK_ALL',
              message: {
                content: 'AlignWordBreakLongMessageContent_CENTER_BREAK_ALL',
                wordBreak: WordBreak.BREAK_ALL
              },
              alignment: DialogBaseAlignment.CENTER,
              width: '75%',
              buttons: [{
                value: 'OK_CENTER_BREAK_ALL',
                action: () => { this.lastAction = 'act_CENTER_BREAK_ALL'; }
              }]
            });
          })
        Button('CENTER x BREAK_WORD')
          .id('btn_aw_center_break_word')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWCENTER_BREAK_WORD',
              message: {
                content: 'AlignWordBreakLongMessageContent_CENTER_BREAK_WORD',
                wordBreak: WordBreak.BREAK_WORD
              },
              alignment: DialogBaseAlignment.CENTER,
              width: '75%',
              buttons: [{
                value: 'OK_CENTER_BREAK_WORD',
                action: () => { this.lastAction = 'act_CENTER_BREAK_WORD'; }
              }]
            });
          })
        Button('BOTTOM x NORMAL')
          .id('btn_aw_bottom_normal')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWBOTTOM_NORMAL',
              message: {
                content: 'AlignWordBreakLongMessageContent_BOTTOM_NORMAL',
                wordBreak: WordBreak.NORMAL
              },
              alignment: DialogBaseAlignment.BOTTOM,
              width: '75%',
              buttons: [{
                value: 'OK_BOTTOM_NORMAL',
                action: () => { this.lastAction = 'act_BOTTOM_NORMAL'; }
              }]
            });
          })
        Button('BOTTOM x BREAK_ALL')
          .id('btn_aw_bottom_break_all')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWBOTTOM_BREAK_ALL',
              message: {
                content: 'AlignWordBreakLongMessageContent_BOTTOM_BREAK_ALL',
                wordBreak: WordBreak.BREAK_ALL
              },
              alignment: DialogBaseAlignment.BOTTOM,
              width: '75%',
              buttons: [{
                value: 'OK_BOTTOM_BREAK_ALL',
                action: () => { this.lastAction = 'act_BOTTOM_BREAK_ALL'; }
              }]
            });
          })
        Button('BOTTOM x BREAK_WORD')
          .id('btn_aw_bottom_break_word')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWBOTTOM_BREAK_WORD',
              message: {
                content: 'AlignWordBreakLongMessageContent_BOTTOM_BREAK_WORD',
                wordBreak: WordBreak.BREAK_WORD
              },
              alignment: DialogBaseAlignment.BOTTOM,
              width: '75%',
              buttons: [{
                value: 'OK_BOTTOM_BREAK_WORD',
                action: () => { this.lastAction = 'act_BOTTOM_BREAK_WORD'; }
              }]
            });
          })
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
