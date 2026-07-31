'use static';
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

import {
  Entry, Component, Column, Row, Button, Text, FlexAlign, ColumnOptions, RowOptions,
  CustomDialogController, DialogDisplayMode, DialogAlignment, Builder,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomDialogDisplayModeInSubWindow {
  screenDialog!: CustomDialogController;
  windowDialog!: CustomDialogController;

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    this.screenDialog = new CustomDialogController({
      builder: (): void => { this.modeDialogBuilder(this.screenDialog); },
      alignment: DialogAlignment.Center,
      showInSubWindow: true,
      displayModeInSubWindow: DialogDisplayMode.SCREEN_BASED,
    });
    this.windowDialog = new CustomDialogController({
      builder: (): void => { this.modeDialogBuilder(this.windowDialog); },
      alignment: DialogAlignment.Center,
      showInSubWindow: true,
      displayModeInSubWindow: DialogDisplayMode.WINDOW_BASED,
    });
  }

  @Builder
  modeDialogBuilder(controller: CustomDialogController): void {
    Column() {
      Text('Dialog_Mode_Test').fontSize(20).id('dialog_mode_text')
      Row({ space: 20 } as RowOptions) {
        Button('Confirm_btn').id('confirm_btn').onClick((): void => { controller.close(); })
        Button('Cancel_btn').id('cancel_btn').onClick((): void => { controller.close(); })
      }
    }.padding(20)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Open_SCREEN_BASED').id('open_screen_based')
        .onClick((): void => { this.screenDialog.open(); })
      Button('Open_WINDOW_BASED').id('open_window_based')
        .onClick((): void => { this.windowDialog.open(); })
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}
