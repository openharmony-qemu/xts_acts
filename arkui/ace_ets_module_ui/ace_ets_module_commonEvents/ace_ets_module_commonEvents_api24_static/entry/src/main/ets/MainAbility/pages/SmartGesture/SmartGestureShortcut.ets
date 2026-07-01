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
import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  Button,
  ClickEvent,
  GestureShortcut,
  Color,
  ColumnOptions
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SmartGestureShortcutStaticDemo {
  @State isAction: (GestureShortcut | undefined)[] = [GestureShortcut.PRIMARY, undefined];
  @State isActionIndex: Int = 0;
  @State isEnabled: (boolean | undefined)[] = [true, undefined, false];
  @State isEnabledIndex: Int = 0;
  @State isSelectable: (boolean | undefined)[] = [true, undefined, false];
  @State isSelectableIndex: Int = 0;
  @State enable: (boolean | undefined)[] = [true, undefined, false];
  @State enableIndex: Int = 0;

  aboutToAppear(): void {
    this.getUIContext().getSmartGestureController().enableSmartTapAndSlideGestures(true);
  }

  aboutToDisappear(): void {
    this.getUIContext().getSmartGestureController().clearSelected();
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('undefined')
        .id('text_undefined_Static')
        .onClick(() => {
          this.isActionIndex = 1
          this.isEnabledIndex = 1
          this.isSelectableIndex = 1
        })
        .backgroundColor(Color.Brown)
      Text('false')
        .id('text_false_Static')
        .onClick(() => {
          this.isEnabledIndex = 2
          this.isSelectableIndex = 2
        })
        .backgroundColor(Color.Brown)

      Button('控件1')
        .id('button_PA_Static')
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