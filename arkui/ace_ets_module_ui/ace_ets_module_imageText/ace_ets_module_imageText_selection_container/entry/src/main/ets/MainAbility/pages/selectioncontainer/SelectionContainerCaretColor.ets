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
struct SelectionContainerCaretColor {
  build() {
    Column({ space: 5 }) {
      SelectionContainer() {
        Text('Default caretColor')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_caretcolor_default')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CaretColor Color.Red')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_caretcolor_color_red')
      .caretColor(Color.Red)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CaretColor string #FF0000')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_caretcolor_string')
      .caretColor('#FF0000')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CaretColor number 0xFFFF0000')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_caretcolor_number')
      .caretColor(0xFFFF0000)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CaretColor null')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_caretcolor_null')
      .caretColor(null)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CaretColor undefined')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_caretcolor_undefined')
      .caretColor(undefined)
      .copyOption(CopyOptions.InApp)
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
