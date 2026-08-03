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
import { DialogButtonOrientation, DialogResult } from '@ohos.arkui.dialog';

@Entry
@Component
struct DialogStyleAlert {
  @State lastAction: string = 'none';
  @State lastDialogId: number = -1;
  @State lifeLog: string = '';

  private appendLife(tag: string): void {
    this.lifeLog = this.lifeLog + tag + ';';
  }

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('DialogStyleOptions alert').fontSize(18).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('style_alert_action')
        Text('dialogId=' + this.lastDialogId).id('style_alert_dialog_id')
        Text('life=' + this.lifeLog).id('style_alert_life')
        Button('basic title message buttons')
          .id('btn_style_alert_basic')
          .onClick(async () => {
            this.lifeLog = '';
            let result: DialogResult = await this.presenter().present({
              title: 'AlertTitle',
              subtitle: 'AlertSub',
              message: { content: 'AlertMessage', wordBreak: WordBreak.BREAK_WORD },
              buttons: [
                {
                  value: 'AlertCancel',
                  fontColor: Color.Gray,
                  backgroundColor: Color.White,
                  enabled: true,
                  defaultFocus: false,
                  primary: false,
                  style: DialogButtonStyle.DEFAULT,
                  action: () => {
                    this.lastAction = 'AlertCancel';
                  }
                },
                {
                  value: 'AlertOK',
                  fontColor: Color.White,
                  backgroundColor: Color.Blue,
                  enabled: true,
                  defaultFocus: true,
                  primary: true,
                  style: DialogButtonStyle.HIGHLIGHT,
                  action: () => {
                    this.lastAction = 'AlertOK';
                  }
                }
              ],
              buttonDirection: DialogButtonOrientation.HORIZONTAL,
              onWillAppear: () => {
                this.appendLife('willAppear');
              },
              onDidAppear: () => {
                this.appendLife('didAppear');
              },
              onWillDisappear: () => {
                this.appendLife('willDisappear');
              },
              onDidDisappear: () => {
                this.appendLife('didDisappear');
              }
            });
            this.lastDialogId = result.dialogId;
          })
        Button('vertical buttons')
          .id('btn_style_alert_vertical')
          .onClick(async () => {
            await this.presenter().present({
              title: 'VerticalTitle',
              message: { content: 'VerticalMessage' },
              buttonDirection: DialogButtonOrientation.VERTICAL,
              buttons: [
                {
                  value: 'VertA',
                  action: () => {
                    this.lastAction = 'VertA';
                  }
                },
                {
                  value: 'VertB',
                  action: () => {
                    this.lastAction = 'VertB';
                  }
                },
                {
                  value: 'VertC',
                  action: () => {
                    this.lastAction = 'VertC';
                  }
                }
              ]
            });
          })
        Button('auto orientation')
          .id('btn_style_alert_auto')
          .onClick(async () => {
            await this.presenter().present({
              title: 'AutoTitle',
              message: { content: 'AutoMessage' },
              buttonDirection: DialogButtonOrientation.AUTO,
              buttons: [
                {
                  value: 'AutoOK',
                  enabled: true,
                  action: () => {
                    this.lastAction = 'AutoOK';
                  }
                }
              ]
            });
          })
        Button('disabled button')
          .id('btn_style_alert_disabled')
          .onClick(async () => {
            await this.presenter().present({
              title: 'DisableTitle',
              message: { content: 'DisableMessage' },
              buttons: [
                {
                  value: 'DisabledBtn',
                  enabled: false,
                  action: () => {
                    this.lastAction = 'DisabledBtn';
                  }
                },
                {
                  value: 'EnableOK',
                  enabled: true,
                  action: () => {
                    this.lastAction = 'EnableOK';
                  }
                }
              ]
            });
          })
        Button('wordBreak NORMAL')
          .id('btn_style_alert_wordbreak')
          .onClick(async () => {
            await this.presenter().present({
              title: 'WordBreakTitle',
              message: {
                content: 'WordBreakNormalMessageContentLong',
                wordBreak: WordBreak.NORMAL
              },
              buttons: [
                {
                  value: 'WBClose',
                  action: () => {
                    this.lastAction = 'WBClose';
                  }
                }
              ]
            });
          })
        Button('wordBreak BREAK_ALL')
          .id('btn_style_alert_wb_all')
          .onClick(async () => {
            await this.presenter().present({
              title: 'WBAllTitle',
              message: {
                content: 'WBAllLongMessageContentForBreak',
                wordBreak: WordBreak.BREAK_ALL
              },
              buttons: [
                {
                  value: 'WBAllOK',
                  action: () => {
                    this.lastAction = 'WBAllOK';
                  }
                }
              ]
            });
          })
        Button('subtitle field')
          .id('btn_style_alert_subtitle')
          .onClick(async () => {
            await this.presenter().present({
              title: 'SubTitleMain',
              subtitle: 'SubTitleValue',
              message: { content: 'SubTitleMsg' },
              buttons: [
                {
                  value: 'SubTitleOK',
                  action: () => {
                    this.lastAction = 'SubTitleOK';
                  }
                }
              ]
            });
          })
        Button('dialogId result')
          .id('btn_style_alert_dialogid')
          .onClick(async () => {
            let result: DialogResult = await this.presenter().present({
              title: 'DialogIdTitle',
              message: { content: 'DialogIdMsg' },
              buttons: [
                {
                  value: 'DialogIdOK',
                  action: () => {
                    this.lastAction = 'DialogIdOK';
                  }
                }
              ]
            });
            this.lastDialogId = result.dialogId;
            this.lastAction = 'dialogId=' + result.dialogId;
          })
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
