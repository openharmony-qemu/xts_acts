/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { HandednessFollowMode } from '@ohos.arkui.dialog';
import { DialogPresenter } from '@kit.ArkUI';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct DialogHandedness {
  @State resultText: string = 'idle';
  private customCtrl: CustomDialogController | null = null;

  aboutToAppear(): void {
    this.customCtrl = new CustomDialogController({
      builder: (): void => {
        this.handednessBuilder();
      },
      adaptToHandedness: HandednessFollowMode.FOLLOW_ANCHOR,
    });
  }

  private setResult(ok: boolean, detail: string): void {
    this.resultText = (ok ? 'PASS:' : 'FAIL:') + detail;
  }

  @Builder
  handednessBuilder(): void {
    Column() {
      Text('HandednessCustom').id('handedness_custom_text').fontSize(16)
      Button('CloseHandedness').id('handedness_close_btn').onClick(() => {
        this.customCtrl?.close();
      })
    }.padding(16)
  }

  private enumOk(): boolean {
    return HandednessFollowMode.NONE === 0 &&
      HandednessFollowMode.FOLLOW_ANCHOR === 1 &&
      HandednessFollowMode.FOLLOW_GRIP_HAND === 2;
  }

  private optionsOk(): boolean {
    let alertOpts: AlertDialogParamWithConfirm = {
      message: 'alert',
      confirm: { value: 'ok', action: () => {} },
      adaptToHandedness: HandednessFollowMode.FOLLOW_GRIP_HAND,
    };
    let sheetOpts: ActionSheetOptions = {
      title: 'sheet',
      message: 'sheetMsg',
      sheets: [{ title: 'one', action: () => {} }],
      adaptToHandedness: HandednessFollowMode.FOLLOW_ANCHOR,
    };
    let showOpts: promptAction.ShowDialogOptions = {
      title: 'show',
      message: 'msg',
      buttons: [{ text: 'ok', color: '#000000' }],
      adaptToHandedness: HandednessFollowMode.NONE,
    };
    let menuOpts: promptAction.ActionMenuOptions = {
      title: 'menu',
      buttons: [{ text: 'a', color: '#000000' }],
      adaptToHandedness: HandednessFollowMode.FOLLOW_ANCHOR,
    };
    let baseOpts: promptAction.BaseDialogOptions = {
      adaptToHandedness: HandednessFollowMode.FOLLOW_GRIP_HAND,
    };
    return alertOpts.adaptToHandedness === HandednessFollowMode.FOLLOW_GRIP_HAND &&
      sheetOpts.adaptToHandedness === HandednessFollowMode.FOLLOW_ANCHOR &&
      showOpts.adaptToHandedness === HandednessFollowMode.NONE &&
      menuOpts.adaptToHandedness === HandednessFollowMode.FOLLOW_ANCHOR &&
      baseOpts.adaptToHandedness === HandednessFollowMode.FOLLOW_GRIP_HAND;
  }

  build() {
    Column({ space: 8 }) {
      Text('DialogHandedness').fontSize(16).fontWeight(FontWeight.Bold)
      Text(this.resultText).id('handedness_result').fontSize(14)
      Button('enum Values').id('btn_handedness_enum').onClick(() => {
        this.setResult(this.enumOk(), 'HandednessFollowMode');
      })
      Button('options assign').id('btn_handedness_opts').onClick(() => {
        this.setResult(this.optionsOk(), 'OptionsAssign');
      })
      Button('custom dialog open').id('btn_handedness_custom').onClick(() => {
        this.customCtrl?.open();
        this.setResult(true, 'CustomDialogOpen');
      })
      Button('presenter present').id('btn_handedness_present').onClick(async () => {
        let presenter: DialogPresenter = this.getUIContext().getDialogPresenter();
        await presenter.present({
          title: 'HandTitle',
          message: { content: 'HandMessage' },
          buttons: [{
            value: 'HandOK',
            action: () => {},
          }],
          adaptToHandedness: HandednessFollowMode.FOLLOW_ANCHOR,
        });
        this.setResult(true, 'DialogBaseOptions');
      })
      Button('alert show').id('btn_handedness_alert').onClick(() => {
        AlertDialog.show({
          message: 'HandAlert',
          confirm: { value: 'OK', action: () => {} },
          adaptToHandedness: HandednessFollowMode.NONE,
        });
        this.setResult(true, 'AlertDialogParam');
      })
      Button('action sheet').id('btn_handedness_sheet').onClick(() => {
        ActionSheet.show({
          title: 'HandSheet',
          message: 'HandSheetMsg',
          sheets: [{ title: 'Item', action: () => {} }],
          adaptToHandedness: HandednessFollowMode.FOLLOW_GRIP_HAND,
        });
        this.setResult(true, 'ActionSheetOptions');
      })
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}
