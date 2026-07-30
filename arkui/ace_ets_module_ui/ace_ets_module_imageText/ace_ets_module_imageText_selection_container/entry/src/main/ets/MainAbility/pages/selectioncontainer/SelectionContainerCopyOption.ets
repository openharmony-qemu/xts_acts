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
struct SelectionContainerCopyOption {
  build() {
    Column({ space: 5 }) {
      SelectionContainer() {
        Text('Default copyOption')
          .fontSize(18)
      }
      .id('selectioncontainer_copyoption_default')
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CopyOptions.InApp')
          .fontSize(18)
      }
      .id('selectioncontainer_copyoption_inapp')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CopyOptions.LocalDevice')
          .fontSize(18)
      }
      .id('selectioncontainer_copyoption_localDevice')
      .copyOption(CopyOptions.LocalDevice)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CopyOption null')
          .fontSize(18)
      }
      .id('selectioncontainer_copyoption_null')
      .copyOption(null)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Text('CopyOption undefined')
          .fontSize(18)
      }
      .id('selectioncontainer_copyoption_undefined')
      .copyOption(undefined)
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
