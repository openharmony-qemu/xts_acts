'use static';
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
  Entry,
  Component,
  Builder,
  Column,
  Text,
  Button,
  FlexAlign,
  Row,
  DismissDialogAction,
  DismissReason,
  ColumnOptions,
  RowOptions,
  DialogDisplayMode,
} from '@ohos.arkui.component';
import promptAction from '@ohos.promptAction';
import { PromptAction, Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct BaseDialogOptionsDisplayModeInSubWindow {
  @State dialogId: int = -1;
  @State showInSubWindowValue: boolean = true;
  promptAction: PromptAction = this.getUIContext().getPromptAction();
  private modeArray: DialogDisplayMode[] = [
    DialogDisplayMode.SCREEN_BASED,
    DialogDisplayMode.WINDOW_BASED,
  ];

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('BaseDialogOptionsDisplayModeInSubWindow router init error: ' + error);
    }
  }

  @Builder
  customDialogBuilder(): void {
    Column() {
      Text('弹窗').fontSize(30)
      Row({ space: 50 } as RowOptions) {
        Button('确认').onClick(() => {
          if (this.dialogId > 0) {
            this.promptAction.closeCustomDialog(this.dialogId);
            this.dialogId = -1;
          }
        })
        Button('取消').onClick(() => {
          if (this.dialogId > 0) {
            this.promptAction.closeCustomDialog(this.dialogId);
            this.dialogId = -1;
          }
        })
      }
    }
    .height(200)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  openDialog(mode: DialogDisplayMode): void {
    this.promptAction.openCustomDialog({
      showInSubWindow: this.showInSubWindowValue,
      displayModeInSubWindow: mode,
      builder: () => {
        this.customDialogBuilder();
      },
      onWillDismiss: (dismissDialogAction: DismissDialogAction): void => {
        if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
          dismissDialogAction.dismiss();
        }
        if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
          dismissDialogAction.dismiss();
        }
      },
    } as promptAction.CustomDialogOptions).then((dialogId: int): void => {
      this.dialogId = dialogId;
    });
  }

  build(): void {
    Column({ space: 20 } as ColumnOptions) {
      Button('showInSubWindowValue is true')
        .id('trueBtn')
        .onClick((): void => {
          this.showInSubWindowValue = true;
        })
      Button('showInSubWindowValue is false')
        .id('falseBtn')
        .onClick((): void => {
          this.showInSubWindowValue = false;
        })
      Text('弹窗SCREEN_BASED')
        .id('dialogScreenBased')
        .fontSize(30)
        .onClick((): void => {
          this.openDialog(this.modeArray[0]);
        })
      Text('弹窗WINDOW_BASED')
        .id('dialogWindowBased')
        .fontSize(30)
        .onClick((): void => {
          this.openDialog(this.modeArray[1]);
        })
    }
    .width('100%')
    .height('100%')
  }
}
