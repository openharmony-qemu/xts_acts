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
export struct CmdDialog {
  controller: CustomDialogController;
  @State sid: string = '';
  @State data: string = '';
  confirmAction?: (sid: string, data: string) => void;

  build() {
    Column() {
      Text('下发指令')
        .fontSize(18)
        .fontColor('#191919')
        .fontWeight(FontWeight.Medium);
      Text('请输入sid和data参数')
        .fontSize(14)
        .fontColor('#999999')
        .margin({ top: 4, bottom: 16 });
      TextInput({ placeholder: '请输入sid', text: this.sid })
        .height(44)
        .width('100%')
        .key('sid')
        .type(InputType.Normal)
        .borderRadius(8)
        .backgroundColor('#F5F5F5')
        .padding({ left: 12 })
        .fontSize(16)
        .onChange((value) => {
          this.sid = value;
        });
      TextInput({ placeholder: '请输入data', text: this.data })
        .height(44)
        .width('100%')
        .key('data')
        .type(InputType.Normal)
        .borderRadius(8)
        .backgroundColor('#F5F5F5')
        .padding({ left: 12 })
        .fontSize(16)
        .onChange((value) => {
          this.data = value;
        })
        .margin({ top: 8 });
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
        Button('发送')
          .fontColor('#FFFFFF')
          .backgroundColor('#007DFF')
          .width('45%')
          .height(40)
          .borderRadius(20)
          .fontSize(16)
          .onClick(() => {
            if (this.sid == '') {
              promptAction.showToast({ message: '请输入sid', duration: 1000 });
              return;
            }
            if (this.data == '') {
              promptAction.showToast({ message: '请输入data', duration: 1000 });
              return;
            }
            this.confirmAction?.(this.sid, this.data);
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
