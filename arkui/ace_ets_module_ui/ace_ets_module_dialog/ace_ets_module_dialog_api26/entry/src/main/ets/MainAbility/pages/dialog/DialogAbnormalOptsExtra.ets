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
  dialog,
} from '@kit.ArkUI';

@Entry
@Component
struct DialogAbnormalOptsExtra {
  @State lastAction: string = 'none';
  @State lastError: string = 'none';
  @State coverFlag: string = 'none';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  private baseOpts(title: string, msg: string, ok: string, act: string): dialog.DialogStyleOptions {
    let message: dialog.DialogMessage = { content: msg };
    let button: dialog.DialogButton = {
      value: ok,
      action: () => {
        this.lastAction = act;
      }
    };
    let buttons: dialog.DialogButton[] = [button];
    let opts: dialog.DialogStyleOptions = {
      title: title,
      message: message,
      buttons: buttons
    };
    return opts;
  }

  private async runProbe(tag: string, opts: dialog.DialogStyleOptions): Promise<void> {
    this.lastError = 'none';
    try {
      await this.presenter().present(opts);
      this.coverFlag = 'ok:' + tag;
    } catch (err) {
      this.lastError = String(err);
      this.coverFlag = 'fail:' + tag;
      this.lastAction = 'error';
    }
  }

  build() {
    Column({ space: 6 }) {
      Text('DialogAbnormalOptsExtra').fontSize(16).fontWeight(FontWeight.Bold)
      Text('action=' + this.lastAction).id('abn_action')
      Text('error=' + this.lastError).id('abn_error')
      Text('cover=' + this.coverFlag).id('abn_cover')
        Button('undefined autoCancel')
          .id('btn_abn_autoCancel')
          .onClick(async () => {
            let opts = this.baseOpts('AbnACTitle', 'AbnMsg_autoCancel', 'AbnOK_autoCancel', 'autoCancel_undefined');
            opts.autoCancel = undefined;
            await this.runProbe('autoCancel', opts);
          })
        Button('undefined isModal')
          .id('btn_abn_isModal')
          .onClick(async () => {
            let opts = this.baseOpts('AbnModalTitle', 'AbnMsg_isModal', 'AbnOK_isModal', 'isModal_undefined');
            opts.isModal = undefined;
            await this.runProbe('isModal', opts);
          })
        Button('undefined backgroundColor')
          .id('btn_abn_backgroundColor')
          .onClick(async () => {
            let opts = this.baseOpts(
              'AbnBgTitle', 'AbnMsg_backgroundColor', 'AbnOK_backgroundColor',
              'backgroundColor_undefined');
            opts.backgroundColor = undefined;
            await this.runProbe('backgroundColor', opts);
          })
        Button('undefined buttonDirection')
          .id('btn_abn_buttonDirection')
          .onClick(async () => {
            let opts = this.baseOpts(
              'AbnDirTitle', 'AbnMsg_buttonDirection', 'AbnOK_buttonDirection',
              'buttonDirection_undefined');
            opts.buttonDirection = undefined;
            await this.runProbe('buttonDirection', opts);
          })
        Button('undefined wordBreak')
          .id('btn_abn_wordBreak')
          .onClick(async () => {
            let msg: dialog.DialogMessage = {
              content: 'AbnWordBreakMsg',
              wordBreak: undefined
            };
            let button: dialog.DialogButton = {
              value: 'AbnOK_wordBreak',
              action: () => { this.lastAction = 'wordBreak_undefined'; }
            };
            let buttons: dialog.DialogButton[] = [button];
            let opts: dialog.DialogStyleOptions = {
              title: 'AbnWBTitle',
              message: msg,
              buttons: buttons
            };
            await this.runProbe('wordBreak', opts);
          })
        Button('undefined levelMode')
          .id('btn_abn_levelMode')
          .onClick(async () => {
            let opts = this.baseOpts('AbnLevelTitle', 'AbnMsg_levelMode', 'AbnOK_levelMode', 'levelMode_undefined');
            opts.levelMode = undefined;
            await this.runProbe('levelMode', opts);
          })
        Button('undefined focusable')
          .id('btn_abn_focusable')
          .onClick(async () => {
            let opts = this.baseOpts('AbnFocusTitle', 'AbnMsg_focusable', 'AbnOK_focusable', 'focusable_undefined');
            opts.focusable = undefined;
            await this.runProbe('focusable', opts);
          })
        Button('omit optional all')
          .id('btn_abn_omit')
          .onClick(async () => {
            await this.runProbe('omit', this.baseOpts('AbnOmitTitle', 'AbnOmitMsg', 'AbnOmitOK',
              'omit_ok'));
          })
        Button('null probe cover note')
          .id('btn_abn_null_note')
          .onClick(() => {
            this.coverFlag = 'null_compile_skip';
            this.lastAction = 'null_noted';
          })
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}
