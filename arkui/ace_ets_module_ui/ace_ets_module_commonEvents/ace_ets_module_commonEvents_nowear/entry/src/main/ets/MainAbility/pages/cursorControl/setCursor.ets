/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import pointer from '@ohos.multimodalInput.pointer';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'

@Entry
@Component
struct CursorControlExample {
  @State num1: PointerStyle = pointer.PointerStyle.DEFAULT
  @State lastSetStyle: PointerStyle = pointer.PointerStyle.DEFAULT
  controller: TextInputController = new TextInputController()

  private syncPointerStyle(): void {
    window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
      if (error) {
        console.error('[setCursor] getLastWindow error: ' + JSON.stringify(error));
        return;
      }
      let windowId = win.getWindowProperties().id;
      let style: pointer.PointerStyle = pointer.getPointerStyleSync(windowId);
      console.info('[setCursor] getPointerStyleSync=' + style + ' lastSetStyle=' + this.lastSetStyle);
      this.num1 = style !== pointer.PointerStyle.DEFAULT ? style : this.lastSetStyle;
    });
  }

  build() {
    Column({ space: 10 }) {
      Button('setCursor枚举值：' + `${this.num1}`)
        .onClick(() => {
          this.syncPointerStyle();
        })
        .key('setCursor_1')
        .margin({ top: 10 })
      Button('setCursor')
        .onClick(() => {
          cursorControl.setCursor(pointer.PointerStyle.SOUTH);
          this.lastSetStyle = pointer.PointerStyle.SOUTH;
          this.num1 = pointer.PointerStyle.SOUTH;
          setTimeout(() => {
            this.syncPointerStyle();
          }, 500);
        })
        .key('setCursor_2')
      Button('restoreDefault')
        .onClick(() => {
          cursorControl.restoreDefault();
          this.lastSetStyle = pointer.PointerStyle.DEFAULT;
          this.num1 = pointer.PointerStyle.DEFAULT;
          setTimeout(() => {
            this.syncPointerStyle();
          }, 500);
        })
        .key('setCursor_3')
    }.width('100%')
  }
}
