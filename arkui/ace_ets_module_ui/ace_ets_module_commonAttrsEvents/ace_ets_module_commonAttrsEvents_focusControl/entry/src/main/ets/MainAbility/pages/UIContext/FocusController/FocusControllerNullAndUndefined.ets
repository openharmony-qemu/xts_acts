/*
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

@Entry
@Component
struct FocusControllerNullAndUndefined {
  @State result: string = 'Init';

  build() {
    Column() {
      Text('FocusController Null And Undefined Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.result)
        .id('focusResultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Scroll() {
        Column() {
          Button('activate isActive null').id('btnActivateIsActiveNull').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getFocusController().activate(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('activate isActive undefined').id('btnActivateIsActiveUndefined').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getFocusController().activate(undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('activate autoInactive null').id('btnActivateAutoInactiveNull').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getFocusController().activate(true, null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('activate autoInactive undefined').id('btnActivateAutoInactiveUndefined').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getFocusController().activate(true, undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('setAutoFocusTransfer null').id('btnSetAutoFocusNull').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getFocusController().setAutoFocusTransfer(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('setAutoFocusTransfer undefined').id('btnSetAutoFocusUndefined').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getFocusController().setAutoFocusTransfer(undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
        }
      }
      .width('100%')
      .height('80%')
    }
  }
}
