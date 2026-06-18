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
struct SelectionContainerBindSelectionMenu {
  @State menuVisible: boolean = false;

  @Builder selectionMenuBuilder() {
    Column() {
      Text('Custom Selection Menu')
        .fontSize(16)
        .padding(10)
        .id('custom_selection_menu_text')
    }
  }

  build() {
    Column({ space: 5 }) {
      SelectionContainer() {
        Column({ space: 8 }) {
          Text('First text for bindSelectionMenu')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for bindSelectionMenu')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_bindselectionmenu')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.selectionMenuBuilder, TextResponseType.LONG_PRESS)
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
