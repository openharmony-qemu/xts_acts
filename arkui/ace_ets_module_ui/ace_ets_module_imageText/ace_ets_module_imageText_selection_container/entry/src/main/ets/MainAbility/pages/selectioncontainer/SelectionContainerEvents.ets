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
  ColorMetrics,
  OnMenuItemClickWithTextCallback,
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerEditMenuOptions,
  SelectionContainerInstance,
  SelectionContainerMenuOptions,
  SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerEvents {
  @State onTextSelectionChangeTriggered: boolean = false;
  @State onWillCopyTriggered: boolean = false;
  @State onCopyTriggered: boolean = false;

  build() {
    Column({ space: 5 }) {
      SelectionContainer() {
        Column({ space: 8 }) {
          Text('First text for events')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for events')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_events')
      .copyOption(CopyOptions.InApp)
      .onTextSelectionChange((value: Array<string>) => {
        this.onTextSelectionChangeTriggered = true;
      })
      .onWillCopy((value: string) => {
        this.onWillCopyTriggered = true;
        return true;
      })
      .onCopy((value: string) => {
        this.onCopyTriggered = true;
      })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      Text(`onTextSelectionChange: ${this.onTextSelectionChangeTriggered}`)
        .id('text_onselectionchange_result')
        .fontSize(16)
        .width('100%')

      Text(`onWillCopy: ${this.onWillCopyTriggered}`)
        .id('text_onwillcopy_result')
        .fontSize(16)
        .width('100%')

      Text(`onCopy: ${this.onCopyTriggered}`)
        .id('text_oncopy_result')
        .fontSize(16)
        .width('100%')

      SelectionContainer() {
        Text('Events null test')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_events_null')
      .copyOption(CopyOptions.InApp)
      .onTextSelectionChange(null)
      .onWillCopy(null)
      .onCopy(null)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('Events undefined test')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_events_undefined')
      .copyOption(CopyOptions.InApp)
      .onTextSelectionChange(undefined)
      .onWillCopy(undefined)
      .onCopy(undefined)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}
