/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  private customDialogComponentId: number = 0;
  @State showInSubWindowValue: boolean = true;
  @State modeArray: DialogDisplayMode[] = [
    DialogDisplayMode.SCREEN_BASED,
    DialogDisplayMode.WINDOW_BASED];

  @Builder
  customDialogComponent() {
    Column() {
      Text('弹窗').fontSize(16)
      Row() {
        Button('确认').onClick(() => {
          try {
            promptAction.closeCustomDialog(this.customDialogComponentId)
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
          }
        })
          .height('5%')
          .width('30%')
        Button('取消').onClick(() => {
          try {
            promptAction.closeCustomDialog(this.customDialogComponentId)
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
          }
        })
          .height('5%')
          .width('30%')
      }
    }
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Row() {
      Column() {
        Button('showInSubWindowValue is true')
          .id('trueBtn')
          .onClick(() => {
            this.showInSubWindowValue = true
          })
          .height('5%')
          .width('30%')
        Button('showInSubWindowValue is false')
          .id('falseBtn')
          .onClick(() => {
            this.showInSubWindowValue = false
          })
          .height('5%')
          .width('30%')

        Text('弹窗SCREEN_BASED')
          .fontSize(20)
          .onClick(() => {
            promptAction.openCustomDialog({
              showInSubWindow: this.showInSubWindowValue,
              displayModeInSubWindow: this.modeArray[0],
              builder: () => {
                this.customDialogComponent()
              },
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason));
                console.info('dialog onWillDismiss');
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.customDialogComponentId = dialogId;
            })
              .catch((error: BusinessError) => {
                console.error(`openCustomDialog error code is ${error.code}, message is ${error.message}`);
              })
          })
        Text('弹窗WINDOW_BASED')
          .fontSize(20)
          .onClick(() => {
            promptAction.openCustomDialog({
              showInSubWindow: this.showInSubWindowValue,
              displayModeInSubWindow: this.modeArray[1],
              builder: () => {
                this.customDialogComponent()
              },
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason));
                console.info('dialog onWillDismiss');
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.customDialogComponentId = dialogId;
            })
              .catch((error: BusinessError) => {
                console.error(`openCustomDialog error code is ${error.code}, message is ${error.message}`);
              })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}