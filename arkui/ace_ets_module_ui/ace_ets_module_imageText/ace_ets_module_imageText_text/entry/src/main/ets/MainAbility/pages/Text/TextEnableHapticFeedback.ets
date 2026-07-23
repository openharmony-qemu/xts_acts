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

class TextModifierEnableHapticFeedback1 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.enableHapticFeedback(true)
  }
}

class TextModifierEnableHapticFeedback2 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.enableHapticFeedback(false)
  }
}

@Entry
@Component
struct TextEnableHapticFeedback {
  @State TextModifierEnableHapticFeedback1: TextModifierEnableHapticFeedback1 = new TextModifierEnableHapticFeedback1()
  @State TextModifierEnableHapticFeedback2: TextModifierEnableHapticFeedback2 = new TextModifierEnableHapticFeedback2()

  build() {
    Column({ space: 1 }) {
      Text('Text：enableHapticFeedback(true)')
        .id('Text_enableHapticFeedback_true')
        .key('Text_enableHapticFeedback_true')
        .enableHapticFeedback(true)
        .height('5%')

      Text('Text：enableHapticFeedback(false)')
        .id('Text_enableHapticFeedback_false')
        .key('Text_enableHapticFeedback_false')
        .enableHapticFeedback(false)
        .height('5%')

      Text('TextModifier: true')
        .attributeModifier(this.TextModifierEnableHapticFeedback1)
        .id('TextModifier_enableHapticFeedback_true')
        .key('TextModifier_enableHapticFeedback_true')
        .height('5%')
        .borderWidth(1)

      Text('TextModifier: false')
        .attributeModifier(this.TextModifierEnableHapticFeedback2)
        .id('TextModifier_enableHapticFeedback_false')
        .key('TextModifier_enableHapticFeedback_false')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}
