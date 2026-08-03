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

@Entry
@Component
struct DialogButtonMatrix {
  @State lastAction: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('DialogButton property matrix').fontSize(18).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('btn_matrix_action')
        Button('value only')
          .id('btn_matrix_value')
          .onClick(async () => {
            await this.presenter().present({
              title: 'ValueTitle',
              message: { content: 'ValueMsg' },
              buttons: [{
                value: 'ValueOK',
                action: () => { this.lastAction = 'ValueOK'; }
              }]
            });
          })
        Button('fontColor')
          .id('btn_matrix_font')
          .onClick(async () => {
            await this.presenter().present({
              title: 'FontTitle',
              message: { content: 'FontMsg' },
              buttons: [{
                value: 'FontOK',
                fontColor: Color.Red,
                action: () => { this.lastAction = 'FontOK'; }
              }]
            });
          })
        Button('backgroundColor')
          .id('btn_matrix_bg')
          .onClick(async () => {
            await this.presenter().present({
              title: 'BgBtnTitle',
              message: { content: 'BgBtnMsg' },
              buttons: [{
                value: 'BgBtnOK',
                backgroundColor: Color.Orange,
                action: () => { this.lastAction = 'BgBtnOK'; }
              }]
            });
          })
        Button('enabled true')
          .id('btn_matrix_enabled')
          .onClick(async () => {
            await this.presenter().present({
              title: 'EnabledTitle',
              message: { content: 'EnabledMsg' },
              buttons: [{
                value: 'EnabledOK',
                enabled: true,
                action: () => { this.lastAction = 'EnabledOK'; }
              }]
            });
          })
        Button('defaultFocus')
          .id('btn_matrix_focus')
          .onClick(async () => {
            await this.presenter().present({
              title: 'FocusTitle',
              message: { content: 'FocusMsg' },
              buttons: [{
                value: 'FocusOK',
                defaultFocus: true,
                action: () => { this.lastAction = 'FocusOK'; }
              }]
            });
          })
        Button('primary true')
          .id('btn_matrix_primary')
          .onClick(async () => {
            await this.presenter().present({
              title: 'PrimaryTitle',
              message: { content: 'PrimaryMsg' },
              buttons: [{
                value: 'PrimaryOK',
                primary: true,
                action: () => { this.lastAction = 'PrimaryOK'; }
              }]
            });
          })
        Button('style DEFAULT')
          .id('btn_matrix_style_def')
          .onClick(async () => {
            await this.presenter().present({
              title: 'StyleDefTitle',
              message: { content: 'StyleDefMsg' },
              buttons: [{
                value: 'StyleDefOK',
                style: DialogButtonStyle.DEFAULT,
                action: () => { this.lastAction = 'StyleDefOK'; }
              }]
            });
          })
        Button('style HIGHLIGHT')
          .id('btn_matrix_style_hi')
          .onClick(async () => {
            await this.presenter().present({
              title: 'StyleHiTitle',
              message: { content: 'StyleHiMsg' },
              buttons: [{
                value: 'StyleHiOK',
                style: DialogButtonStyle.HIGHLIGHT,
                action: () => { this.lastAction = 'StyleHiOK'; }
              }]
            });
          })
        Button('two buttons mix')
          .id('btn_matrix_mix')
          .onClick(async () => {
            await this.presenter().present({
              title: 'MixTitle',
              message: { content: 'MixMsg' },
              buttons: [
                {
                  value: 'MixCancel',
                  fontColor: Color.Gray,
                  enabled: true,
                  primary: false,
                  style: DialogButtonStyle.DEFAULT,
                  action: () => { this.lastAction = 'MixCancel'; }
                },
                {
                  value: 'MixOK',
                  fontColor: Color.White,
                  backgroundColor: Color.Blue,
                  enabled: true,
                  defaultFocus: true,
                  primary: true,
                  style: DialogButtonStyle.HIGHLIGHT,
                  action: () => { this.lastAction = 'MixOK'; }
                }
              ]
            });
          })
        Button('action callback')
          .id('btn_matrix_action_cb')
          .onClick(async () => {
            await this.presenter().present({
              title: 'ActionTitle',
              message: { content: 'ActionMsg' },
              buttons: [{
                value: 'ActionOK',
                action: () => { this.lastAction = 'ActionFired'; }
              }]
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
