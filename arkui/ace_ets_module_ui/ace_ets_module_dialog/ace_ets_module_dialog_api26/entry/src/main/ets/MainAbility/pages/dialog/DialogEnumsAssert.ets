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
    Column({ space: 6 }) {
      Text('dialog enums part1').fontSize(16).fontWeight(FontWeight.Bold)
      Text(this.resultText).id('enums_result').fontSize(14)
      Row(){
        Button('DialogState values').id('btn_enum_state').onClick(() => {
          let ok = DialogState.UNINITIALIZED === 0 && DialogState.INITIALIZED === 1 &&
            DialogState.APPEARING === 2 && DialogState.APPEARED === 3 &&
            DialogState.DISAPPEARING === 4 && DialogState.DISAPPEARED === 5;
          this.setResult(ok, 'DialogState');
        })
        Button('DialogBaseAlignment values').id('btn_enum_align').onClick(() => {
          let ok = DialogBaseAlignment.TOP === 0 && DialogBaseAlignment.CENTER === 1 &&
            DialogBaseAlignment.BOTTOM === 2 && DialogBaseAlignment.DEFAULT === 3 &&
            DialogBaseAlignment.TOP_START === 4 && DialogBaseAlignment.TOP_END === 5 &&
            DialogBaseAlignment.CENTER_START === 6 && DialogBaseAlignment.CENTER_END === 7 &&
            DialogBaseAlignment.BOTTOM_START === 8 && DialogBaseAlignment.BOTTOM_END === 9;
          this.setResult(ok, 'DialogBaseAlignment');
        })
      }

      Row(){
        Button('DialogButtonOrientation values').id('btn_enum_btn_orient').onClick(() => {
          let ok = DialogButtonOrientation.AUTO === 0 &&
            DialogButtonOrientation.HORIZONTAL === 1 &&
            DialogButtonOrientation.VERTICAL === 2;
          this.setResult(ok, 'DialogButtonOrientation');
        })
        Button('all enums batch').id('btn_enum_all').onClick(() => {
          let ok = DialogState.APPEARED === 3 && DialogBaseAlignment.CENTER === 1 &&
            DialogButtonOrientation.HORIZONTAL === 1;
          this.setResult(ok, 'AllEnums');
        })
      }
      Row(){
        Button('state UNINITIALIZED').id('btn_enum_state_0').onClick(() => {
          this.setResult(DialogState.UNINITIALIZED === 0, 'UNINITIALIZED');
        })
        Button('state INITIALIZED').id('btn_enum_state_1').onClick(() => {
          this.setResult(DialogState.INITIALIZED === 1, 'INITIALIZED');
        })
      }

      Row(){
        Button('state APPEARING').id('btn_enum_state_2').onClick(() => {
          this.setResult(DialogState.APPEARING === 2, 'APPEARING');
        })
        Button('state APPEARED').id('btn_enum_state_3').onClick(() => {
          this.setResult(DialogState.APPEARED === 3, 'APPEARED');
        })
      }
      Row(){
        Button('state DISAPPEARING').id('btn_enum_state_4').onClick(() => {
          this.setResult(DialogState.DISAPPEARING === 4, 'DISAPPEARING');
        })
        Button('state DISAPPEARED').id('btn_enum_state_5').onClick(() => {
          this.setResult(DialogState.DISAPPEARED === 5, 'DISAPPEARED');
        })
      }
      Row(){
        Button('align TOP').id('btn_enum_align_0').onClick(() => {
          this.setResult(DialogBaseAlignment.TOP === 0, 'TOP');
        })
        Button('align CENTER').id('btn_enum_align_1').onClick(() => {
          this.setResult(DialogBaseAlignment.CENTER === 1, 'CENTER');
        })
      }
      Row(){
        Button('align BOTTOM').id('btn_enum_align_2').onClick(() => {
          this.setResult(DialogBaseAlignment.BOTTOM === 2, 'BOTTOM');
        })
        Button('align DEFAULT').id('btn_enum_align_3').onClick(() => {
          this.setResult(DialogBaseAlignment.DEFAULT === 3, 'DEFAULT');
        })
      }

      Button('align TOP_START').id('btn_enum_align_4').onClick(() => {
        this.setResult(DialogBaseAlignment.TOP_START === 4, 'TOP_START');
      })
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}
