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

import { DialogPresenter, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct DialogBaseSizeBorder {
  @State lastAction: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('DialogBaseOptions size border').fontSize(18).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('size_border_action')
        Button('width percent')
          .id('btn_size_width_pct')
          .onClick(async () => {
            await this.presenter().present({
              title: 'WidthPctTitle',
              message: { content: 'WidthPctMsg' },
              width: '70%',
              buttons: [{ value: 'WidthPctOK', action: () => { this.lastAction = 'WidthPctOK'; } }]
            });
          })
        Button('width number')
          .id('btn_size_width_num')
          .onClick(async () => {
            await this.presenter().present({
              title: 'WidthNumTitle',
              message: { content: 'WidthNumMsg' },
              width: 300,
              buttons: [{ value: 'WidthNumOK', action: () => { this.lastAction = 'WidthNumOK'; } }]
            });
          })
        Button('height number')
          .id('btn_size_height')
          .onClick(async () => {
            await this.presenter().present({
              title: 'HeightTitle',
              message: { content: 'HeightMsg' },
              height: 240,
              buttons: [{ value: 'HeightOK', action: () => { this.lastAction = 'HeightOK'; } }]
            });
          })
        Button('borderWidth')
          .id('btn_size_bw')
          .onClick(async () => {
            await this.presenter().present({
              title: 'BWTitle',
              message: { content: 'BWMsg' },
              borderWidth: 4,
              borderColor: Color.Red,
              buttons: [{ value: 'BWOK', action: () => { this.lastAction = 'BWOK'; } }]
            });
          })
        Button('borderRadius')
          .id('btn_size_br')
          .onClick(async () => {
            await this.presenter().present({
              title: 'BRTitle',
              message: { content: 'BRMsg' },
              borderRadius: 20,
              buttons: [{ value: 'BROK', action: () => { this.lastAction = 'BROK'; } }]
            });
          })
        Button('borderStyle dashed')
          .id('btn_size_bs')
          .onClick(async () => {
            await this.presenter().present({
              title: 'BSTitle',
              message: { content: 'BSMsg' },
              borderWidth: 2,
              borderStyle: BorderStyle.Dashed,
              borderColor: Color.Green,
              buttons: [{ value: 'BSOK', action: () => { this.lastAction = 'BSOK'; } }]
            });
          })
        Button('offset dx dy')
          .id('btn_size_offset')
          .onClick(async () => {
            await this.presenter().present({
              title: 'OffsetTitle',
              message: { content: 'OffsetMsg' },
              offset: { dx: 12, dy: -16 },
              buttons: [{ value: 'OffsetOK', action: () => { this.lastAction = 'OffsetOK'; } }]
            });
          })
        Button('maskColor')
          .id('btn_size_mask')
          .onClick(async () => {
            await this.presenter().present({
              title: 'MaskColorTitle',
              message: { content: 'MaskColorMsg' },
              maskColor: '#88000000',
              buttons: [{ value: 'MaskColorOK', action: () => { this.lastAction = 'MaskColorOK'; } }]
            });
          })
        Button('autoCancel false')
          .id('btn_size_ac')
          .onClick(async () => {
            await this.presenter().present({
              title: 'ACTitle',
              message: { content: 'ACMsg' },
              autoCancel: false,
              buttons: [{ value: 'ACOK', action: () => { this.lastAction = 'ACOK'; } }]
            });
          })
        Button('focusable false')
          .id('btn_size_focusable')
          .onClick(async () => {
            await this.presenter().present({
              title: 'FocusableTitle',
              message: { content: 'FocusableMsg' },
              focusable: false,
              buttons: [{ value: 'FocusableOK', action: () => { this.lastAction = 'FocusableOK'; } }]
            });
          })
        Button('keyboardAvoidMode')
          .id('btn_size_kbd')
          .onClick(async () => {
            await this.presenter().present({
              title: 'KbdTitle',
              message: { content: 'KbdMsg' },
              keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
              keyboardAvoidDistance: LengthMetrics.vp(16),
              buttons: [{ value: 'KbdOK', action: () => { this.lastAction = 'KbdOK'; } }]
            });
          })
        Button('shadow OUTER')
          .id('btn_size_shadow')
          .onClick(async () => {
            await this.presenter().present({
              title: 'ShadowTitle',
              message: { content: 'ShadowMsg' },
              shadow: ShadowStyle.OUTER_DEFAULT_SM,
              buttons: [{ value: 'ShadowOK', action: () => { this.lastAction = 'ShadowOK'; } }]
            });
          })
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
