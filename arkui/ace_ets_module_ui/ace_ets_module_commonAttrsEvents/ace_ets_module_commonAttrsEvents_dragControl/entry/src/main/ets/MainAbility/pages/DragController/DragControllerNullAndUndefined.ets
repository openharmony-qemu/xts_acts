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
struct DragControllerNullAndUndefined {
  @State result: string = 'Init';

  build() {
    Column() {
      Text('DragController Null And Undefined Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.result)
        .id('dragResultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Scroll() {
        Column() {
          Button('notifyDragStartRequest null').id('btnNotifyDragNull').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getDragController().notifyDragStartRequest(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('notifyDragStartRequest undefined').id('btnNotifyDragUndefined').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getDragController().notifyDragStartRequest(undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('notifyDragStartRequest outOfRange').id('btnNotifyDragOutOfRange').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getDragController().notifyDragStartRequest(2);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('setDragEventStrictReportingEnabled null').id('btnStrictReportingNull').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getDragController().setDragEventStrictReportingEnabled(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('setDragEventStrictReportingEnabled undefined').id('btnStrictReportingUndefined').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getDragController().setDragEventStrictReportingEnabled(undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('enableDropDisallowedBadge null').id('btnEnableDropNull').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getDragController().enableDropDisallowedBadge(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('enableDropDisallowedBadge undefined').id('btnEnableDropUndefined').width('100%').height('5%').onClick(() => {
            try {
              this.getUIContext().getDragController().enableDropDisallowedBadge(undefined);
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
