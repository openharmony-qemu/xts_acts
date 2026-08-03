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
import dialog, {
  DialogBaseController,
  DialogState,
  DialogResult,
  DialogDismissal,
} from '@ohos.arkui.dialog';

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
          let ctrlMsg: dialog.DialogMessage = { content: 'CtrlMessage' };
          let ctrlOk: dialog.DialogButton = {
            value: 'CtrlOK',
            action: () => {
              this.lastAction = 'CtrlOK';
            }
          };
          let ctrlButtons: dialog.DialogButton[] = [ctrlOk];
          let opts: dialog.DialogStyleOptions = {
            title: 'CtrlTitle',
            message: ctrlMsg,
            controller: this.controller,
            buttons: ctrlButtons
          };
          let result: DialogResult = await this.presenter().present(opts);
          this.dialogId = result.dialogId;
          this.stateAfter = this.stateName(this.controller.getState());
        })
      Button('present then auto close')
        .id('btn_ctrl_auto_close')
        .onClick(async () => {
          this.controller = new DialogBaseController();
          let autoMsg: dialog.DialogMessage = { content: 'AutoCloseMessage' };
          let autoOk: dialog.DialogButton = {
            value: 'AutoCloseOK',
            action: () => {
              this.lastAction = 'AutoCloseOK';
            }
          };
          let autoButtons: dialog.DialogButton[] = [autoOk];
          let opts: dialog.DialogStyleOptions = {
            title: 'AutoCloseTitle',
            message: autoMsg,
            controller: this.controller,
            onDidAppear: () => {
              this.stateAfter = this.stateName(this.controller.getState());
              this.controller.close();
              this.lastAction = 'closed';
              this.stateAfter = this.stateName(this.controller.getState());
            },
            buttons: autoButtons
          };
          let result: DialogResult = await this.presenter().present(opts);
          this.dialogId = result.dialogId;
        })
      Button('onWillDismiss')
        .id('btn_ctrl_will_dismiss')
        .onClick(async () => {
          let willMsg: dialog.DialogMessage = { content: 'WillDismissMessage' };
          let willOk: dialog.DialogButton = {
            value: 'WillDismissOK',
            action: () => {
              this.lastAction = 'WillDismissOK';
            }
          };
          let willButtons: dialog.DialogButton[] = [willOk];
          let opts: dialog.DialogStyleOptions = {
            title: 'WillDismissTitle',
            message: willMsg,
            autoCancel: true,
            onWillDismiss: (dismissal: DialogDismissal) => {
              this.dismissReason = String(dismissal.reason);
              this.lastAction = 'willDismiss';
              dismissal.dismiss();
            },
            buttons: willButtons
          };
          await this.presenter().present(opts);
        })
      Button('construct getState only')
        .id('btn_ctrl_construct')
        .onClick(() => {
          let c: DialogBaseController = new DialogBaseController();
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
