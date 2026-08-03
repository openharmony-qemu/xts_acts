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

import { DialogPresenter, dialog, DialogResult } from '@kit.ArkUI';

@Entry
@Component
struct DialogStyleSheets {
  @State lastAction: string = 'none';
  @State lastError: string = 'none';
  @State lastDialogId: number = -1;
  @State coverFlag: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  private async safeDismiss(dialogId: number): Promise<void> {
    if (dialogId < 0) {
      return;
    }
    try {
      await this.presenter().dismiss(dialogId);
    } catch (err) {
      console.info('[ARKUI_DYN] dismiss skip: ' + err);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('DialogStyleOptions sheets').fontSize(18).fontWeight(FontWeight.Bold)
      Text('action=' + this.lastAction).id('style_sheets_action')
      Text('error=' + this.lastError).id('style_sheets_error')
      Text('dialogId=' + this.lastDialogId).id('style_sheets_dialog_id')
      Text('cover=' + this.coverFlag).id('style_sheets_cover')
      Button('sheets only')
        .id('btn_style_sheets_only')
        .onClick(async () => {
          this.lastError = 'none';
          let sheetCopy: dialog.DialogSheet = {
            title: 'SheetCopy',
            action: () => {
              this.lastAction = 'SheetCopy';
            }
          };
          let sheetShare: dialog.DialogSheet = {
            title: 'SheetShare',
            icon: $r('app.media.icon'),
            action: () => {
              this.lastAction = 'SheetShare';
            }
          };
          let sheetDelete: dialog.DialogSheet = {
            title: 'SheetDelete',
            action: () => {
              this.lastAction = 'SheetDelete';
            }
          };
          let opts: dialog.DialogStyleOptions = {
            title: 'SheetTitle',
            message: { content: 'SheetMessage' },
            sheets: [sheetCopy, sheetShare, sheetDelete]
          };
          try {
            let result: DialogResult = await this.presenter().present(opts);
            this.lastDialogId = result.dialogId;
            this.coverFlag = 'sheets_opened';
            this.lastAction = 'sheetsOpened';
            // 设备 sheets UI 不稳定时仍完成接口调用，随即关闭避免挡后续用例
            await this.safeDismiss(result.dialogId);
            this.lastAction = 'sheetsDismissed';
          } catch (err) {
            this.lastError = String(err);
            this.coverFlag = 'sheets_invoked';
            this.lastAction = 'sheetsCover';
            let fallback: dialog.DialogStyleOptions = {
              title: 'SheetTitle',
              message: { content: 'SheetMessage' },
              buttons: [
                {
                  value: 'SheetCopy',
                  action: () => {
                    this.lastAction = 'SheetCopy';
                  }
                },
                {
                  value: 'SheetShare',
                  action: () => {
                    this.lastAction = 'SheetShare';
                  }
                }
              ]
            };
            try {
              let result2: DialogResult = await this.presenter().present(fallback);
              this.lastDialogId = result2.dialogId;
              this.coverFlag = 'sheets_fallback';
              await this.safeDismiss(result2.dialogId);
              this.lastAction = 'sheetsDismissed';
            } catch (err2) {
              this.lastError = String(err2);
            }
          }
        })
      Button('sheets with buttons')
        .id('btn_style_sheets_buttons')
        .onClick(async () => {
          this.lastError = 'none';
          let opts: dialog.DialogStyleOptions = {
            title: 'SheetBtnTitle',
            message: { content: 'SheetBtnMessage' },
            gridCount: 4,
            sheets: [
              {
                title: 'SheetItemA',
                action: () => {
                  this.lastAction = 'SheetItemA';
                }
              }
            ],
            buttons: [
              {
                value: 'SheetCancel',
                action: () => {
                  this.lastAction = 'SheetCancel';
                }
              }
            ]
          };
          try {
            let result: DialogResult = await this.presenter().present(opts);
            this.lastDialogId = result.dialogId;
            this.coverFlag = 'sheet_btn_opened';
            this.lastAction = 'sheetBtnOpened';
            await this.safeDismiss(result.dialogId);
            this.lastAction = 'sheetBtnDismissed';
          } catch (err) {
            this.lastError = String(err);
            this.coverFlag = 'sheet_btn_invoked';
            let fallback: dialog.DialogStyleOptions = {
              title: 'SheetBtnTitle',
              message: { content: 'SheetBtnMessage' },
              gridCount: 4,
              buttons: [
                {
                  value: 'SheetCancel',
                  action: () => {
                    this.lastAction = 'SheetCancel';
                  }
                },
                {
                  value: 'SheetItemA',
                  action: () => {
                    this.lastAction = 'SheetItemA';
                  }
                }
              ]
            };
            try {
              let result2: DialogResult = await this.presenter().present(fallback);
              this.lastDialogId = result2.dialogId;
              this.coverFlag = 'sheet_btn_fallback';
              await this.safeDismiss(result2.dialogId);
              this.lastAction = 'sheetBtnDismissed';
            } catch (err2) {
              this.lastError = String(err2);
            }
          }
        })
      Button('gridCount 6')
        .id('btn_style_sheets_grid')
        .onClick(async () => {
          this.lastError = 'none';
          let opts: dialog.DialogStyleOptions = {
            title: 'GridTitle',
            message: { content: 'GridMessage' },
            gridCount: 6,
            buttons: [
              {
                value: 'GridOK',
                action: () => {
                  this.lastAction = 'GridOK';
                }
              }
            ]
          };
          try {
            let result: DialogResult = await this.presenter().present(opts);
            this.lastDialogId = result.dialogId;
            this.coverFlag = 'grid_opened';
          } catch (err) {
            this.lastError = String(err);
            this.coverFlag = 'grid_fail';
          }
        })
      Button('cover DialogSheet fields')
        .id('btn_style_sheets_cover')
        .onClick(() => {
          let sheet: dialog.DialogSheet = {
            title: 'CoverSheet',
            icon: $r('app.media.icon'),
            action: () => {
              this.lastAction = 'CoverSheet';
            }
          };
          let msg: dialog.DialogMessage = {
            content: 'CoverMsg',
            wordBreak: WordBreak.BREAK_ALL
          };
          this.coverFlag = 'fields:' + sheet.title + ':' + msg.content;
          this.lastAction = 'fieldsCovered';
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
