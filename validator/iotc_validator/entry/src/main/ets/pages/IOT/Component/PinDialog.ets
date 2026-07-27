/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import promptAction from '@ohos.promptAction';

@CustomDialog
export struct PinDialog {
  controller: CustomDialogController;
  @State pinCode: string = '';
  confirmAction?: (pinCode: string) => void;

  build() {
    Column() {
      Text('PIN码验证')
        .fontSize(18)
        .fontColor('#191919')
        .fontWeight(FontWeight.Medium)

      Text('请输入设备PIN码进行连接')
        .fontSize(14)
        .fontColor('#999999')
        .margin({ top: 4, bottom: 16 });

      TextInput({ placeholder: '请输入PIN码', text: this.pinCode })
        .height(44)
        .width('100%')
        .key('pinCode')
        .type(InputType.Password)
        .borderRadius(8)
        .backgroundColor('#F5F5F5')
        .padding({ left: 12 })
        .fontSize(16)
        .inputFilter('^[a-zA-Z0-9]+$', (irregular: string) => {
          promptAction.showToast({ message: 'PIN码仅支持英文及数字', duration: 1000 });
        })
        .onChange((value) => {
          this.pinCode = value;
        });

      Row() {
        Button('取消')
          .fontColor('#666666')
          .backgroundColor('#F5F5F5')
          .width('45%')
          .height(40)
          .borderRadius(20)
          .fontSize(16)
          .onClick(() => {
            this.controller.close();
          });

        Button('确定')
          .fontColor('#FFFFFF')
          .backgroundColor('#007DFF')
          .width('45%')
          .height(40)
          .borderRadius(20)
          .fontSize(16)
          .onClick(() => {
            if (this.pinCode == '') {
              promptAction.showToast({ message: '请输入PIN码', duration: 1000 });
              return;
            }
            this.confirmAction?.(this.pinCode);
            this.controller.close();
          });
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 20 });
    }
    .padding(24);
  }
}