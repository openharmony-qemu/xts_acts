/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { SelectionContainer, SelectionContainerAttribute } from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerNormalEvents {
  @State onTextSelectionChangeFlag: string = 'false';
  @State onWillCopyFlag: string = 'false';
  @State onCopyFlag: string = 'false';

  build() {
    Column({ space: 8 }) {
      SelectionContainer() {
        Column({ space: 4 }) {
          Text('Events text A').fontSize(16).copyOption(CopyOptions.InApp)
          Text('Events text B').fontSize(16).copyOption(CopyOptions.InApp)
        }
      }
      .id('sc_dyn_events_host')
      .copyOption(CopyOptions.InApp)
      .onTextSelectionChange((_value: Array<string>) => {
        this.onTextSelectionChangeFlag = 'true';
      })
      .onWillCopy((_value: string) => {
        this.onWillCopyFlag = 'true';
        return true;
      })
      .onCopy((_value: string) => {
        this.onCopyFlag = 'true';
      })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(8)

      Text(`onTextSelectionChange: ${this.onTextSelectionChangeFlag}`)
        .id('sc_dyn_events_onTextSelectionChange')
        .fontSize(14)
        .width('100%')
      Text(`onWillCopy: ${this.onWillCopyFlag}`)
        .id('sc_dyn_events_onWillCopy')
        .fontSize(14)
        .width('100%')
      Text(`onCopy: ${this.onCopyFlag}`)
        .id('sc_dyn_events_onCopy')
        .fontSize(14)
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}
