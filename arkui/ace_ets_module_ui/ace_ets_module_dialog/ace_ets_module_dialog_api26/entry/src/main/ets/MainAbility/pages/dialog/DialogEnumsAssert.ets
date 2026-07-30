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
  DialogState,
  DialogBaseAlignment,
  DialogButtonOrientation,
} from '@kit.ArkUI';

@Entry
@Component
struct DialogEnumsAssert {
  @State resultText: string = 'idle';

  private setResult(ok: boolean, detail: string): void {
    this.resultText = (ok ? 'PASS:' : 'FAIL:') + detail;
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('dialog enums coverage').fontSize(18).fontWeight(FontWeight.Bold)
        Text(this.resultText).id('enums_result').fontSize(14)
        Button('DialogState values')
          .id('btn_enum_state')
          .onClick(() => {
            let ok = DialogState.UNINITIALIZED === 0 &&
              DialogState.INITIALIZED === 1 &&
              DialogState.APPEARING === 2 &&
              DialogState.APPEARED === 3 &&
              DialogState.DISAPPEARING === 4 &&
              DialogState.DISAPPEARED === 5;
            this.setResult(ok, 'DialogState');
          })
        Button('DialogBaseAlignment values')
          .id('btn_enum_align')
          .onClick(() => {
            let ok = DialogBaseAlignment.TOP === 0 &&
              DialogBaseAlignment.CENTER === 1 &&
              DialogBaseAlignment.BOTTOM === 2 &&
              DialogBaseAlignment.DEFAULT === 3 &&
              DialogBaseAlignment.TOP_START === 4 &&
              DialogBaseAlignment.TOP_END === 5 &&
              DialogBaseAlignment.CENTER_START === 6 &&
              DialogBaseAlignment.CENTER_END === 7 &&
              DialogBaseAlignment.BOTTOM_START === 8 &&
              DialogBaseAlignment.BOTTOM_END === 9;
            this.setResult(ok, 'DialogBaseAlignment');
          })
        Button('DialogButtonOrientation values')
          .id('btn_enum_btn_orient')
          .onClick(() => {
            let ok = DialogButtonOrientation.AUTO === 0 &&
              DialogButtonOrientation.HORIZONTAL === 1 &&
              DialogButtonOrientation.VERTICAL === 2;
            this.setResult(ok, 'DialogButtonOrientation');
          })
        Button('all enums batch')
          .id('btn_enum_all')
          .onClick(() => {
            let ok = DialogState.APPEARED === 3 &&
              DialogBaseAlignment.CENTER === 1 &&
              DialogButtonOrientation.HORIZONTAL === 1;
            this.setResult(ok, 'AllEnums');
          })
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
