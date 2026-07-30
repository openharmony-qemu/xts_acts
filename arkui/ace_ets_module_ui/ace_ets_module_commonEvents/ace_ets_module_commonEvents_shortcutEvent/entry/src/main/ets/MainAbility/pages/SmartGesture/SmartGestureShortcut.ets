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
export struct SmartGestureShortcutDemo {
  @State isAction: (GestureShortcut | null | undefined | number)[] = [GestureShortcut.PRIMARY, 0, undefined, null, 1];
  @State isActionIndex: number = 0;
  @State isEnabled: (boolean | null | undefined)[] = [true, false, undefined, null];
  @State isEnabledIndex: number = 0;
  @State isSelectable: (boolean | null | undefined)[] = [true, false, undefined, null];
  @State isSelectableIndex: number = 0;
  @State enable: (boolean | null | undefined)[] = [true, false, undefined, null];
  @State enableIndex: number = 0;

  aboutToAppear(): void {
    this.getUIContext().getSmartGestureController().enableSmartTapAndSlideGestures(true);
  }

  aboutToDisappear(): void {
    this.getUIContext().getSmartGestureController().clearSelected();
  }

  build() {
    Column({ space: 8 }) {
      Row() {
        Text('0/false')
          .id('text_false')
          .onClick(() => {
            this.isActionIndex = 1
            this.isEnabledIndex = 1
            this.isSelectableIndex = 1
          })
          .backgroundColor(Color.Brown)
        Text('un')
          .id('text_un')
          .onClick(() => {
            this.isActionIndex = 2
            this.isEnabledIndex = 2
            this.isSelectableIndex = 2
          })
          .backgroundColor(Color.Brown)
      }

      Row() {
        Text('null')
          .id('text_null')
          .onClick(() => {
            this.isActionIndex = 3
            this.isEnabledIndex = 3
            this.isSelectableIndex = 3
          })
          .backgroundColor(Color.Brown)
        Text('1')
          .id('text_1')
          .onClick(() => {
            this.isActionIndex = 4
          })
          .backgroundColor(Color.Brown)
      }

      Button('控件1')
        .id('button_PA')
        .width('100%')
        .height(28)
        .fontSize(12)
        .onClick(() => {
        })
        .smartGestureShortcut({
          action: this.isAction[this.isActionIndex],
          enabled: this.isEnabled[this.isEnabledIndex],
          selectable: this.isSelectable[this.isSelectableIndex]
        })
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#eef3f8')
  }
}