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

class MySelectionContainerModifier implements AttributeModifier<SelectionContainerAttribute> {
  public isApplied: boolean = false;

  applyNormalAttribute(instance: SelectionContainerAttribute): void {
    if (this.isApplied) {
      instance.copyOption(CopyOptions.LocalDevice);
      instance.caretColor(Color.Blue);
      instance.selectedBackgroundColor('#33007DFF');
      instance.enableHapticFeedback(false);
      instance.textJoinStyle(SelectionContainerTextJoinStyle.DIRECT);
    } else {
      instance.copyOption(CopyOptions.InApp);
      instance.caretColor(Color.Red);
      instance.selectedBackgroundColor(Color.Red);
      instance.enableHapticFeedback(true);
      instance.textJoinStyle(SelectionContainerTextJoinStyle.NEWLINE);
    }
  }
}

@Entry
@Component
struct SelectionContainerModifier {
  @State modifier: MySelectionContainerModifier = new MySelectionContainerModifier();

  build() {
    Column({ space: 5 }) {
      Button('Change Modifier')
        .id('btn_change_modifier')
        .width('80%')
        .height('5%')
        .onClick(() => {
          this.modifier.isApplied = !this.modifier.isApplied;
        })

      SelectionContainer() {
        Column({ space: 8 }) {
          Text('First text for modifier')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for modifier')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_modifier')
      .attributeModifier(this.modifier)
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
