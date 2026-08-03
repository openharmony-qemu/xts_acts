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
struct DialogAlignWordBreakExtra {
  @State lastAction: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('Align x wordBreak part2').fontSize(16).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('align_wb_action')
        Button('DEFAULT x NORMAL')
          .id('btn_aw_default_normal')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWDEFAULT_NORMAL',
              message: {
                content: 'AlignWordBreakLongMessageContent_DEFAULT_NORMAL',
                wordBreak: WordBreak.NORMAL
              },
              alignment: DialogBaseAlignment.DEFAULT,
              width: '75%',
              buttons: [{
                value: 'OK_DEFAULT_NORMAL',
                action: () => { this.lastAction = 'act_DEFAULT_NORMAL'; }
              }]
            });
          })
        Button('DEFAULT x BREAK_ALL')
          .id('btn_aw_default_break_all')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWDEFAULT_BREAK_ALL',
              message: {
                content: 'AlignWordBreakLongMessageContent_DEFAULT_BREAK_ALL',
                wordBreak: WordBreak.BREAK_ALL
              },
              alignment: DialogBaseAlignment.DEFAULT,
              width: '75%',
              buttons: [{
                value: 'OK_DEFAULT_BREAK_ALL',
                action: () => { this.lastAction = 'act_DEFAULT_BREAK_ALL'; }
              }]
            });
          })
        Button('DEFAULT x BREAK_WORD')
          .id('btn_aw_default_break_word')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWDEFAULT_BREAK_WORD',
              message: {
                content: 'AlignWordBreakLongMessageContent_DEFAULT_BREAK_WORD',
                wordBreak: WordBreak.BREAK_WORD
              },
              alignment: DialogBaseAlignment.DEFAULT,
              width: '75%',
              buttons: [{
                value: 'OK_DEFAULT_BREAK_WORD',
                action: () => { this.lastAction = 'act_DEFAULT_BREAK_WORD'; }
              }]
            });
          })
        Button('TOP_START x NORMAL')
          .id('btn_aw_top_start_normal')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_START_NORMAL',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_START_NORMAL',
                wordBreak: WordBreak.NORMAL
              },
              alignment: DialogBaseAlignment.TOP_START,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_START_NORMAL',
                action: () => { this.lastAction = 'act_TOP_START_NORMAL'; }
              }]
            });
          })
        Button('TOP_START x BREAK_ALL')
          .id('btn_aw_top_start_break_all')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_START_BREAK_ALL',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_START_BREAK_ALL',
                wordBreak: WordBreak.BREAK_ALL
              },
              alignment: DialogBaseAlignment.TOP_START,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_START_BREAK_ALL',
                action: () => { this.lastAction = 'act_TOP_START_BREAK_ALL'; }
              }]
            });
          })
        Button('TOP_START x BREAK_WORD')
          .id('btn_aw_top_start_break_word')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_START_BREAK_WORD',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_START_BREAK_WORD',
                wordBreak: WordBreak.BREAK_WORD
              },
              alignment: DialogBaseAlignment.TOP_START,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_START_BREAK_WORD',
                action: () => { this.lastAction = 'act_TOP_START_BREAK_WORD'; }
              }]
            });
          })
        Button('TOP_END x NORMAL')
          .id('btn_aw_top_end_normal')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_END_NORMAL',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_END_NORMAL',
                wordBreak: WordBreak.NORMAL
              },
              alignment: DialogBaseAlignment.TOP_END,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_END_NORMAL',
                action: () => { this.lastAction = 'act_TOP_END_NORMAL'; }
              }]
            });
          })
        Button('TOP_END x BREAK_ALL')
          .id('btn_aw_top_end_break_all')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_END_BREAK_ALL',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_END_BREAK_ALL',
                wordBreak: WordBreak.BREAK_ALL
              },
              alignment: DialogBaseAlignment.TOP_END,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_END_BREAK_ALL',
                action: () => { this.lastAction = 'act_TOP_END_BREAK_ALL'; }
              }]
            });
          })
        Button('TOP_END x BREAK_WORD')
          .id('btn_aw_top_end_break_word')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AWTOP_END_BREAK_WORD',
              message: {
                content: 'AlignWordBreakLongMessageContent_TOP_END_BREAK_WORD',
                wordBreak: WordBreak.BREAK_WORD
              },
              alignment: DialogBaseAlignment.TOP_END,
              width: '75%',
              buttons: [{
                value: 'OK_TOP_END_BREAK_WORD',
                action: () => { this.lastAction = 'act_TOP_END_BREAK_WORD'; }
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
