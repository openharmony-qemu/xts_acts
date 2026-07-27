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
export struct WiFiDialog {
  controller: CustomDialogController;
  @State ssid: string = '';
  @State password: string = '';
  confirmAction?: (ssid: string, password: string) => void;

  build() {
    Column() {
      Text('配网信息')
        .fontSize(18)
        .fontColor('#191919')
        .fontWeight(FontWeight.Medium);

      Text('请输入Wi-Fi名称和密码')
        .fontSize(14)
        .fontColor('#999999')
        .margin({ top: 4, bottom: 16 });

      TextInput({ placeholder: '请输入Wi-Fi名称', text: this.ssid })
        .height(50)
        .width('100%')
        .key('ssid')
        .type(InputType.Normal)
        .onChange((value) => {
          this.ssid = value;
        })
        .margin({ top: 8 });

      TextInput({ placeholder: '请输入Wi-Fi密码', text: this.password })
        .height(50)
        .width('100%')
        .key('password')
        .type(InputType.Password)
        .onChange((value) => {
          this.password = value;
        })
        .margin({ top: 8 });

      Row() {
        Button('取消')
          .fontColor('#999999')
          .backgroundColor('#e1e5e8')
          .width('45%')
          .onClick(() => {
            this.controller.close();
          });

        Button('发送配网信息')
          .fontColor('#007DFF')
          .backgroundColor('#e1e5e8')
          .width('45%')
          .onClick(() => {
            if (this.ssid.trim() === '') {
              promptAction.showToast({ message: '请输入Wi-Fi名称' });
              return;
            }
            if (this.password.trim() === '') {
              promptAction.showToast({ message: '请输入Wi-Fi密码' });
              return;
            }
            this.confirmAction?.(this.ssid.trim(), this.password.trim());
            this.controller.close();
          });
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 12 });
    }
    .padding(16);
  }
}
