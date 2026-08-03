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

import {
  DialogPresenter,
  DialogBaseController,
  DialogState,
  DialogResult,
  DialogDismissal,
  dialog,
} from '@kit.ArkUI';

@Entry
@Component
struct DialogBaseControllerLife {
  @State lastAction: string = 'none';
  @State stateBefore: string = 'none';
  @State stateAfter: string = 'none';
  @State dismissReason: string = 'none';
  @State dialogId: number = -1;
  private controller: DialogBaseController = new DialogBaseController();

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  private stateName(state: DialogState): string {
    switch (state) {
      case DialogState.UNINITIALIZED:
        return 'UNINITIALIZED';
      case DialogState.INITIALIZED:
        return 'INITIALIZED';
      case DialogState.APPEARING:
        return 'APPEARING';
      case DialogState.APPEARED:
        return 'APPEARED';
      case DialogState.DISAPPEARING:
        return 'DISAPPEARING';
      case DialogState.DISAPPEARED:
        return 'DISAPPEARED';
      default:
        return 'UNKNOWN';
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('DialogBaseController lifecycle').fontSize(18).fontWeight(FontWeight.Bold)
      Text('action=' + this.lastAction).id('ctrl_action')
      Text('stateBefore=' + this.stateBefore).id('ctrl_state_before')
      Text('stateAfter=' + this.stateAfter).id('ctrl_state_after')
      Text('dismissReason=' + this.dismissReason).id('ctrl_dismiss_reason')
      Text('dialogId=' + this.dialogId).id('ctrl_dialog_id')
      Button('present with controller')
        .id('btn_ctrl_present')
        .onClick(async () => {
          this.controller = new DialogBaseController();
          this.stateBefore = this.stateName(this.controller.getState());
          let opts: dialog.DialogStyleOptions = {
            title: 'CtrlTitle',
            message: { content: 'CtrlMessage' },
            controller: this.controller,
            buttons: [
              {
                value: 'CtrlOK',
                action: () => {
                  this.lastAction = 'CtrlOK';
                }
              }
            ]
          };
          let result: DialogResult = await this.presenter().present(opts);
          this.dialogId = result.dialogId;
          this.stateAfter = this.stateName(this.controller.getState());
        })
      Button('present then auto close')
        .id('btn_ctrl_auto_close')
        .onClick(async () => {
          this.controller = new DialogBaseController();
          let opts: dialog.DialogStyleOptions = {
            title: 'AutoCloseTitle',
            message: { content: 'AutoCloseMessage' },
            controller: this.controller,
            onDidAppear: () => {
              this.stateAfter = this.stateName(this.controller.getState());
              this.controller.close();
              this.lastAction = 'closed';
              this.stateAfter = this.stateName(this.controller.getState());
            },
            buttons: [
              {
                value: 'AutoCloseOK',
                action: () => {
                  this.lastAction = 'AutoCloseOK';
                }
              }
            ]
          };
          let result: DialogResult = await this.presenter().present(opts);
          this.dialogId = result.dialogId;
        })
      Button('onWillDismiss')
        .id('btn_ctrl_will_dismiss')
        .onClick(async () => {
          let opts: dialog.DialogStyleOptions = {
            title: 'WillDismissTitle',
            message: { content: 'WillDismissMessage' },
            autoCancel: true,
            onWillDismiss: (dismissal: DialogDismissal) => {
              this.dismissReason = String(dismissal.reason);
              this.lastAction = 'willDismiss';
              dismissal.dismiss();
            },
            buttons: [
              {
                value: 'WillDismissOK',
                action: () => {
                  this.lastAction = 'WillDismissOK';
                }
              }
            ]
          };
          await this.presenter().present(opts);
        })
      Button('construct getState only')
        .id('btn_ctrl_construct')
        .onClick(() => {
          let c = new DialogBaseController();
          this.stateBefore = this.stateName(c.getState());
          this.lastAction = 'constructed';
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
