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
struct SelectionContainerTextJoinStyleTest {
  build() {
    Column({ space: 5 }) {
      SelectionContainer() {
        Text('Default textJoinStyle')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_joinstyle_default')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('TextJoinStyle NEWLINE')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_joinstyle_newline')
      .textJoinStyle(SelectionContainerTextJoinStyle.NEWLINE)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('TextJoinStyle DIRECT')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_joinstyle_direct')
      .textJoinStyle(SelectionContainerTextJoinStyle.DIRECT)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('TextJoinStyle null')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_joinstyle_null')
      .textJoinStyle(null)
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('TextJoinStyle undefined')
          .fontSize(18)
          .copyOption(CopyOptions.InApp)
      }
      .id('selectioncontainer_joinstyle_undefined')
      .textJoinStyle(undefined)
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
