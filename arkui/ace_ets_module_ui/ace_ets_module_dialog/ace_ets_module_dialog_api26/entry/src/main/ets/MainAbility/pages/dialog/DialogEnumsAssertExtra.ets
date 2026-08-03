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

import dialog, {
  DialogBaseAlignment,
  DialogButtonOrientation,
} from '@ohos.arkui.dialog';

@Entry
@Component
struct DialogEnumsAssertExtra {
  @State resultText: string = 'idle';

  private setResult(ok: boolean, detail: string): void {
    this.resultText = (ok ? 'PASS:' : 'FAIL:') + detail;
  }

  build() {
    Column({ space: 6 }) {
      Text('dialog enums part2').fontSize(16).fontWeight(FontWeight.Bold)
      Text(this.resultText).id('enums_extra_result').fontSize(14)
      Button('align TOP_END').id('btn_enum_align_5').onClick(() => {
        this.setResult(DialogBaseAlignment.TOP_END === 5, 'TOP_END');
      })
      Button('align CENTER_START').id('btn_enum_align_6').onClick(() => {
        this.setResult(DialogBaseAlignment.CENTER_START === 6, 'CENTER_START');
      })
      Button('align CENTER_END').id('btn_enum_align_7').onClick(() => {
        this.setResult(DialogBaseAlignment.CENTER_END === 7, 'CENTER_END');
      })
      Button('align BOTTOM_START').id('btn_enum_align_8').onClick(() => {
        this.setResult(DialogBaseAlignment.BOTTOM_START === 8, 'BOTTOM_START');
      })
      Button('align BOTTOM_END').id('btn_enum_align_9').onClick(() => {
        this.setResult(DialogBaseAlignment.BOTTOM_END === 9, 'BOTTOM_END');
      })
      Button('orient AUTO').id('btn_enum_orient_0').onClick(() => {
        this.setResult(DialogButtonOrientation.AUTO === 0, 'AUTO');
      })
      Button('orient HORIZONTAL').id('btn_enum_orient_1').onClick(() => {
        this.setResult(DialogButtonOrientation.HORIZONTAL === 1, 'HORIZONTAL');
      })
      Button('orient VERTICAL').id('btn_enum_orient_2').onClick(() => {
        this.setResult(DialogButtonOrientation.VERTICAL === 2, 'VERTICAL');
      })
      Button('DialogTextStyleOptions cover').id('btn_enum_text_style').onClick(() => {
        let msg: dialog.DialogMessage = {
          content: 'TextStyleCover',
          wordBreak: WordBreak.BREAK_ALL
        };
        this.setResult(msg.wordBreak === WordBreak.BREAK_ALL, 'DialogTextStyleOptions');
      })
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}
