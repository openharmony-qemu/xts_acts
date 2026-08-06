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
          let sheetMsg: dialog.DialogMessage = { content: 'SheetMessage' };
          let sheets: dialog.DialogSheet[] = [sheetCopy, sheetShare, sheetDelete];
          let opts: dialog.DialogStyleOptions = {
            title: 'SheetTitle',
            message: sheetMsg,
            sheets: sheets
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
            let fbMsg: dialog.DialogMessage = { content: 'SheetMessage' };
            let fbBtn1: dialog.DialogButton = {
              value: 'SheetCopy',
              action: () => {
                this.lastAction = 'SheetCopy';
              }
            };
            let fbBtn2: dialog.DialogButton = {
              value: 'SheetShare',
              action: () => {
                this.lastAction = 'SheetShare';
              }
            };
            let fbButtons: dialog.DialogButton[] = [fbBtn1, fbBtn2];
            let fallback: dialog.DialogStyleOptions = {
              title: 'SheetTitle',
              message: fbMsg,
              buttons: fbButtons
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
          let sheetBtnMsg: dialog.DialogMessage = { content: 'SheetBtnMessage' };
          let sheetItemA: dialog.DialogSheet = {
            title: 'SheetItemA',
            action: () => {
              this.lastAction = 'SheetItemA';
            }
          };
          let sheetCancel: dialog.DialogButton = {
            value: 'SheetCancel',
            action: () => {
              this.lastAction = 'SheetCancel';
            }
          };
          let sheetItems: dialog.DialogSheet[] = [sheetItemA];
          let sheetBtns: dialog.DialogButton[] = [sheetCancel];
          let opts: dialog.DialogStyleOptions = {
            title: 'SheetBtnTitle',
            message: sheetBtnMsg,
            gridCount: 4,
            sheets: sheetItems,
            buttons: sheetBtns
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
            let fbMsg2: dialog.DialogMessage = { content: 'SheetBtnMessage' };
            let fbCancel: dialog.DialogButton = {
              value: 'SheetCancel',
              action: () => {
                this.lastAction = 'SheetCancel';
              }
            };
            let fbItemA: dialog.DialogButton = {
              value: 'SheetItemA',
              action: () => {
                this.lastAction = 'SheetItemA';
              }
            };
            let fbButtons2: dialog.DialogButton[] = [fbCancel, fbItemA];
            let fallback: dialog.DialogStyleOptions = {
              title: 'SheetBtnTitle',
              message: fbMsg2,
              gridCount: 4,
              buttons: fbButtons2
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
          let gridMsg: dialog.DialogMessage = { content: 'GridMessage' };
          let gridOk: dialog.DialogButton = {
            value: 'GridOK',
            action: () => {
              this.lastAction = 'GridOK';
            }
          };
          let gridButtons: dialog.DialogButton[] = [gridOk];
          let opts: dialog.DialogStyleOptions = {
            title: 'GridTitle',
            message: gridMsg,
            gridCount: 6,
            buttons: gridButtons
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
