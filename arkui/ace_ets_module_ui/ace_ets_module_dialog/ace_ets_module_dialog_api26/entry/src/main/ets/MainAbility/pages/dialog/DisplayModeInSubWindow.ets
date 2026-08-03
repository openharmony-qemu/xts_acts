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

import promptAction from '@ohos.promptAction';

@Entry
@Component
struct DisplayModeInSubWindow {
  @State dialogId: number = -1;
  @State showInSubWindowValue: boolean = true;
  @State lastMode: string = 'none';

  @Builder
  customDialogBuilder() {
    Column() {
      Text('dialog content ' + this.lastMode)
        .fontSize(20)
        .id('dialog_display_content')
      Row({ space: 20 }) {
        Button('confirm')
          .id('dialog_confirm')
          .onClick(() => {
            if (this.dialogId > 0) {
              this.getUIContext().getPromptAction().closeCustomDialog(this.dialogId);
              this.dialogId = -1;
            }
          })
        Button('cancel')
          .id('dialog_cancel')
          .onClick(() => {
            if (this.dialogId > 0) {
              this.getUIContext().getPromptAction().closeCustomDialog(this.dialogId);
              this.dialogId = -1;
            }
          })
      }
    }
    .height(180)
    .padding(12)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  openDialog(mode: DialogDisplayMode, tag: string) {
    this.lastMode = tag;
    this.getUIContext().getPromptAction().openCustomDialog({
      showInSubWindow: this.showInSubWindowValue,
      displayModeInSubWindow: mode,
      builder: (): void => {
        this.customDialogBuilder();
      },
      onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
        dismissDialogAction.dismiss();
      }
    } as promptAction.CustomDialogOptions).then((id: number) => {
      this.dialogId = id;
    });
  }

  build() {
    Column({ space: 12 }) {
      Text('BaseDialogOptions.displayModeInSubWindow').fontSize(16).fontWeight(FontWeight.Bold)
      Text('showInSubWindow=' + this.showInSubWindowValue).id('dialog_subwindow_flag')
      Button('subWindow true').id('btn_subwindow_true').onClick(() => {
        this.showInSubWindowValue = true;
      })
      Button('subWindow false').id('btn_subwindow_false').onClick(() => {
        this.showInSubWindowValue = false;
      })
      Button('SCREEN_BASED')
        .id('btn_dialog_screen_based')
        .onClick(() => {
          this.openDialog(DialogDisplayMode.SCREEN_BASED, 'SCREEN_BASED');
        })
      Button('WINDOW_BASED')
        .id('btn_dialog_window_based')
        .onClick(() => {
          this.openDialog(DialogDisplayMode.WINDOW_BASED, 'WINDOW_BASED');
        })
      Button('SCREEN with sub false')
        .id('btn_dialog_screen_nosub')
        .onClick(() => {
          this.showInSubWindowValue = false;
          this.openDialog(DialogDisplayMode.SCREEN_BASED, 'SCREEN_NOSUB');
        })
      Button('WINDOW with sub true')
        .id('btn_dialog_window_sub')
        .onClick(() => {
          this.showInSubWindowValue = true;
          this.openDialog(DialogDisplayMode.WINDOW_BASED, 'WINDOW_SUB');
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
