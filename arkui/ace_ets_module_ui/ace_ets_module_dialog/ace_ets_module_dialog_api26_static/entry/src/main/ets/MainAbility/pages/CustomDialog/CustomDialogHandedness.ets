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
  Entry, Component, Column, Button, Text, FlexAlign, ColumnOptions,
  CustomDialogController, CustomDialogControllerOptions, DialogAlignment, Builder,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

/** HandednessFollowMode numeric values (NONE/FOLLOW_ANCHOR/FOLLOW_GRIP_HAND). */
const HAND_NONE: number = 0;
const HAND_FOLLOW_ANCHOR: number = 1;
const HAND_FOLLOW_GRIP: number = 2;

@Entry
@Component
struct CustomDialogHandedness {
  noneDialog!: CustomDialogController;
  anchorDialog!: CustomDialogController;
  gripDialog!: CustomDialogController;
  @State enumResult: string = 'idle';

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    // Same shape as CustomDialogSystemMaterial (CI-green in this module):
    // builder lambda must sit on CustomDialogController object-literal.
    // adaptToHandedness uses numeric constants; whole opts cast (CI may omit enum).
    this.noneDialog = new CustomDialogController({
      builder: (): void => {
        this.handBuilder(this.noneDialog, 'mode_NONE');
      },
      alignment: DialogAlignment.Center,
      adaptToHandedness: HAND_NONE,
    } as CustomDialogControllerOptions);
    this.anchorDialog = new CustomDialogController({
      builder: (): void => {
        this.handBuilder(this.anchorDialog, 'mode_FOLLOW_ANCHOR');
      },
      alignment: DialogAlignment.Center,
      adaptToHandedness: HAND_FOLLOW_ANCHOR,
    } as CustomDialogControllerOptions);
    this.gripDialog = new CustomDialogController({
      builder: (): void => {
        this.handBuilder(this.gripDialog, 'mode_FOLLOW_GRIP_HAND');
      },
      alignment: DialogAlignment.Center,
      adaptToHandedness: HAND_FOLLOW_GRIP,
    } as CustomDialogControllerOptions);
  }

  @Builder
  handBuilder(controller: CustomDialogController, label: string): void {
    Column() {
      Text(label).fontSize(18).id('handedness_dialog_text')
      Button('Close_handedness').id('close_handedness_btn').onClick((): void => {
        controller.close();
      })
    }.padding(20)
  }

  private enumOk(): boolean {
    return HAND_NONE === 0 && HAND_FOLLOW_ANCHOR === 1 && HAND_FOLLOW_GRIP === 2;
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Check_enum').id('check_enum')
        .onClick((): void => {
          this.enumResult = this.enumOk() ? 'PASS' : 'FAIL';
        })
      Button('Open_NONE').id('open_none')
        .onClick((): void => { this.noneDialog.open(); })
      Button('Open_FOLLOW_ANCHOR').id('open_anchor')
        .onClick((): void => { this.anchorDialog.open(); })
      Button('Open_FOLLOW_GRIP_HAND').id('open_grip')
        .onClick((): void => { this.gripDialog.open(); })
      Text(this.enumResult).id('handedness_enum_text')
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}
