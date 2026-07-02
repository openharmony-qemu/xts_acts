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
struct SelectionContainerSelectedBackgroundColor {
  build() {
    Column({ space: 5 }) {
      SelectionContainer() {
        Text('Default selectedBackgroundColor')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_selectedbgcolor_default')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('SelectedBgColor string #33007DFF')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_selectedbgcolor_string')
      .selectedBackgroundColor('#33007DFF')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('SelectedBgColor Color.Blue')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_selectedbgcolor_color_blue')
      .selectedBackgroundColor(Color.Blue)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('SelectedBgColor number 0x33007DFF')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_selectedbgcolor_number')
      .selectedBackgroundColor(0x33007DFF)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('SelectedBgColor null')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_selectedbgcolor_null')
      .selectedBackgroundColor(null)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('SelectedBgColor undefined')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_selectedbgcolor_undefined')
      .selectedBackgroundColor(undefined)
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
