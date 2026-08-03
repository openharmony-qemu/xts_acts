'use static';
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
import {
  AttributeModifier, Color, Column, ColumnOptions, Component, CopyOptions, Entry, Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import {
  SelectionContainer, SelectionContainerAttribute, SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

class StaticSelectionContainerModifier implements AttributeModifier<SelectionContainerAttribute> {
  applyNormalAttribute(instance: SelectionContainerAttribute): void {
    instance.copyOption(CopyOptions.InApp);
    instance.caretColor(Color.Blue);
    instance.selectedBackgroundColor('#33FF0000');
    instance.enableHapticFeedback(true);
    instance.textJoinStyle(SelectionContainerTextJoinStyle.NEWLINE);
  }
}

@Entry
@Component
struct SelectionContainerNormalModifier {
  @State modifier: StaticSelectionContainerModifier = new StaticSelectionContainerModifier();

  build() {
    Column({ space: 8 } as ColumnOptions) {
      SelectionContainer() {
        Column({ space: 4 } as ColumnOptions) {
          Text('modifier text A').fontSize(16).copyOption(CopyOptions.InApp)
          Text('modifier text B').fontSize(16).copyOption(CopyOptions.InApp)
        }
      }
      .id('sc_static_modifier_host')
      .attributeModifier(this.modifier)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(8)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}
