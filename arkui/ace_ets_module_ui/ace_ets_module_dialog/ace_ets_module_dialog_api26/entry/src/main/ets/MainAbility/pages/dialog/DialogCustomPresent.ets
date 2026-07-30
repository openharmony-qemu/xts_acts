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
  DialogResult,
  ComponentContent,
  LengthMetrics,
  dialog,
} from '@kit.ArkUI';

interface CustomParam {
  text: string;
}

@Builder
function buildCustomDialog(param: CustomParam) {
  Column() {
    Text(param.text)
      .fontSize(18)
      .margin(12)
      .id('custom_dialog_text')
    Button('CustomClose')
      .id('custom_dialog_close')
  }
  .padding(16)
  .backgroundColor(Color.White)
}

@Entry
@Component
struct DialogCustomPresent {
  @State lastAction: string = 'none';
  @State dialogId: number = -1;
  @State lastError: string = 'none';
  contentNode: ComponentContent<CustomParam> | null = null;

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  build() {
    Column({ space: 12 }) {
      Text('DialogCustomOptions present').fontSize(18).fontWeight(FontWeight.Bold)
      Text('action=' + this.lastAction).id('custom_present_action')
      Text('dialogId=' + this.dialogId).id('custom_present_dialog_id')
      Text('error=' + this.lastError).id('custom_present_error')
      Button('customStyle ComponentContent')
        .id('btn_custom_style_true')
        .onClick(async () => {
          this.lastError = 'none';
          try {
            let param: CustomParam = { text: 'CustomStyleContent' };
            this.contentNode = new ComponentContent(this.getUIContext(),
              wrapBuilder<[CustomParam]>(buildCustomDialog), param);
            let opts: dialog.DialogCustomOptions = {
              customStyle: true,
              width: 300,
              height: 180,
              backgroundColor: Color.Transparent,
              autoCancel: true,
              focusable: true,
              // 非 modal，便于用例点击页上 dismiss/update
              isModal: false,
              keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
              keyboardAvoidDistance: LengthMetrics.vp(8)
            };
            let result: DialogResult = await this.presenter().present(this.contentNode, opts);
            this.dialogId = result.dialogId;
            this.lastAction = 'customOpened';
          } catch (err) {
            this.lastError = String(err);
            this.lastAction = 'error';
          }
        })
      Button('ComponentContent custom')
        .id('btn_custom_content')
        .onClick(async () => {
          this.lastError = 'none';
          try {
            let param: CustomParam = { text: 'ComponentContentDialog' };
            this.contentNode = new ComponentContent(this.getUIContext(),
              wrapBuilder<[CustomParam]>(buildCustomDialog), param);
            let opts: dialog.DialogCustomOptions = {
              customStyle: false,
              width: '70%',
              height: 200,
              backgroundColor: Color.White,
              borderRadius: 8,
              isModal: false,
              autoCancel: true
            };
            let result: DialogResult = await this.presenter().present(this.contentNode, opts);
            this.dialogId = result.dialogId;
            this.lastAction = 'contentOpened';
          } catch (err) {
            this.lastError = String(err);
            this.lastAction = 'error';
          }
        })
      Button('dismiss by id')
        .id('btn_custom_dismiss')
        .onClick(async () => {
          try {
            if (this.dialogId >= 0) {
              await this.presenter().dismiss(this.dialogId);
              this.lastAction = 'dismissed';
            }
          } catch (err) {
            this.lastError = String(err);
          }
        })
      Button('update options')
        .id('btn_custom_update')
        .onClick(async () => {
          try {
            if (this.contentNode !== null) {
              let opts: dialog.DialogBaseOptions = {
                backgroundColor: '#E8F5E9',
                borderWidth: 3,
                borderColor: Color.Green
              };
              await this.presenter().update(this.contentNode, opts);
              this.lastAction = 'updated';
            }
          } catch (err) {
            this.lastError = String(err);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
