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

import { TextSelectionClearPolicy,TextMenuController  } from '@kit.ArkUI';

@Entry
@Component
struct SetTextSelectionClearPolicy {
  @State selectionStart: number = -1;
  @State selectionEnd: number = -1;
  @State selectionChangeCount: number = 0;
  @State currentPolicy: string = 'KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH';
  @State testText: string = 'This is test text for selection. Please long press to select.';
  uiContext: UIContext | undefined = undefined;

  onPrepareMenu = () => {
    return [];
  }
  onCreateMenu = () => {
    return [];
  }
  onMenuItemClick = () => {
    return false;
  }
  @State editMenuOptions: EditMenuOptions = {
    onCreateMenu: this.onCreateMenu,
    onMenuItemClick: this.onMenuItemClick,
    onPrepareMenu: this.onPrepareMenu
  };
  aboutToAppear(): void {
    this.uiContext = this.getUIContext();
  }


  build() {
    Column() {
      Text('setTextSelectionClearPolicy Test')
        .height('5%')
        .fontWeight(FontWeight.Bold)
        .clip(true)
      Row(){
        Text(`Current Policy: ${this.currentPolicy}`)
          .id('text_current_policy')
          .width('30%')
          .clip(true)

        Text(`Selection: [${this.selectionStart}, ${this.selectionEnd}]`)
          .id('text_selection_range')
          .width('30%')
          .clip(true)

        Text(`Change Count: ${this.selectionChangeCount}`)
          .id('text_selection_count')
          .width('30%')
          .clip(true)
      }.height('5%')
      Divider()
      Text(this.testText)
        .id('text_selectable')
        .copyOption(CopyOptions.LocalDevice)
        .width('90%')
        .height('10%')
        .border({ width: 1, color: Color.Blue })
        .maxLines(1)
        .editMenuOptions(this.editMenuOptions)
        .onTextSelectionChange((start: number, end: number) => {
          this.selectionStart = start;
          this.selectionEnd = end;
          this.selectionChangeCount++;
        })
      Divider()
      Column() {
        Text('External Touch Area')
          .fontSize(16)
          .fontColor(Color.Gray)
      }
      .id('external_touch_area')
      .width('90%')
      .height('30%')
      .backgroundColor('#E0E0E0')
      .justifyContent(FlexAlign.Center)
      .borderRadius(10)
      Divider()
      Row() {
        Button('Set CLEAR_SELECTED_TEXT')
          .id('btn_clear_policy')
          .width('25%')
          .onClick(() => {
            this.uiContext?.setTextSelectionClearPolicy(
              TextSelectionClearPolicy.CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH
            );
            this.currentPolicy = 'CLEAR_SELECTED_TEXT_ON_EXTERNAL_TOUCH';
            this.selectionChangeCount = 0;
          })

        Button('Set KEEP_SELECTED_TEXT')
          .id('btn_keep_policy')
          .width('25%')
          .onClick(() => {
            this.uiContext?.setTextSelectionClearPolicy(
              TextSelectionClearPolicy.KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH
            );
            this.currentPolicy = 'KEEP_SELECTED_TEXT_ON_EXTERNAL_TOUCH';
            this.selectionChangeCount = 0;
          })

        Button('Set null (default)')
          .id('btn_null_policy')
          .width('25%')
          .onClick(() => {
            this.uiContext?.setTextSelectionClearPolicy(null);
            this.currentPolicy = 'null (default)';
            this.selectionChangeCount = 0;
          })

        Button('Set undefined (default)')
          .id('btn_undefined_policy')
          .width('25%')
          .onClick(() => {
            this.uiContext?.setTextSelectionClearPolicy(undefined);
            this.currentPolicy = 'undefined (default)';
            this.selectionChangeCount = 0;
          })
      }
      .height('5%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}