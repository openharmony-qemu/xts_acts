/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

class RichEditorModifierEnableHapticFeedback1 implements AttributeModifier<RichEditorAttribute> {
  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.enableHapticFeedback(true);
  }
}

class RichEditorModifierEnableHapticFeedback2 implements AttributeModifier<RichEditorAttribute> {
  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.enableHapticFeedback(false);
  }
}

@Entry
@Component
struct RichEditorEnableHapticFeedbackModifier {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  options2: RichEditorOptions = { controller: this.controller2 };

  build() {
    Column() {
      RichEditor(this.options1)
        .attributeModifier(new RichEditorModifierEnableHapticFeedback1())
        .id('RichEditorModifier_enableHapticFeedback_true')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller1.addTextSpan('enableHapticFeedback_true')
        })

      RichEditor(this.options2)
        .attributeModifier(new RichEditorModifierEnableHapticFeedback2())
        .id('RichEditorModifier_enableHapticFeedback_false')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller2.addTextSpan('enableHapticFeedback_false')
        })
    }.justifyContent(FlexAlign.Center)
  }
}
