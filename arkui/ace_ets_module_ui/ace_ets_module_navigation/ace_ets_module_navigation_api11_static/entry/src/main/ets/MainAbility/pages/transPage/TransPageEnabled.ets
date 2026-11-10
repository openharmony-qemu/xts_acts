'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, ColumnOptions, Button, Text, ClickEvent, Margin } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TransPageEnabled {
  @State transPageResult: string = '';

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('Check Default')
        .id('transPage_check_btn')
        .fontSize(16)
        .height('5%')
        .width('80%')
        .onClick((e: ClickEvent) => {
          this.transPageResult = String(this.getUIContext().isTransPageEnabled());
        })

      Button('Set False')
        .id('transPage_setFalse_btn')
        .fontSize(16)
        .height('5%')
        .width('80%')
        .onClick((e: ClickEvent) => {
          this.getUIContext().setTransPageEnabled(false);
          this.transPageResult = String(this.getUIContext().isTransPageEnabled());
        })

      Button('Set True')
        .id('transPage_setTrue_btn')
        .fontSize(16)
        .height('5%')
        .width('80%')
        .onClick((e: ClickEvent) => {
          this.getUIContext().setTransPageEnabled(true);
          this.transPageResult = String(this.getUIContext().isTransPageEnabled());
        })

      Text(this.transPageResult)
        .id('transPage_result_text')
        .fontSize(20)
        .margin({ top: 10, bottom: 10 } as Margin)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}
