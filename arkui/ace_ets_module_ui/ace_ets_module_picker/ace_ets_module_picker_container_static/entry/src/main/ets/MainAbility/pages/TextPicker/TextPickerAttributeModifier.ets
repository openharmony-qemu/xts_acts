'use static';
/*
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
  Entry,
  Scroll,
  Column,
  Component,
  Row,
  Color,
  Text,
  TextAlign,
  TextPicker,
  TextPickerAttribute,
  AttributeModifier,
  Optional,
  FontWeight,
  PickerTextStyle,
  TextPickerTextStyle,
  CrownSensitivity,
  DividerOptions,
  PickerBackgroundStyle,
  TextOverflow,
  ColumnOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

class DefaultPickerItemHeightModifier implements AttributeModifier<TextPickerAttribute> {
  private value: Optional<double | string> = undefined

  constructor(value?: Optional<double | string>) {
    this.value = value
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.defaultPickerItemHeight(this.value)
  }
}

class DisappearTextStyleModifier implements AttributeModifier<TextPickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.disappearTextStyle(this.style)
  }
}

class TextStyleModifier implements AttributeModifier<TextPickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.textStyle(this.style)
  }
}

class SelectedTextStyleModifier implements AttributeModifier<TextPickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.selectedTextStyle(this.style)
  }
}

class SelectedIndexModifier implements AttributeModifier<TextPickerAttribute> {
  private value: Optional<int> = undefined

  constructor(value?: Optional<int>) {
    this.value = value
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.selectedIndex(this.value)
  }
}

class CanLoopModifier implements AttributeModifier<TextPickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.canLoop(this.value)
  }
}

class DividerModifier implements AttributeModifier<TextPickerAttribute> {
  private value: DividerOptions | null | undefined = undefined

  constructor(value?: DividerOptions | null) {
    this.value = value
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.divider(this.value)
  }
}

class GradientHeightModifier implements AttributeModifier<TextPickerAttribute> {
  private value: Optional<number> = undefined

  constructor(value?: Optional<number>) {
    this.value = value
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.gradientHeight(this.value)
  }
}

class DisableTextStyleAnimationModifier implements AttributeModifier<TextPickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.disableTextStyleAnimation(this.value)
  }
}

class DefaultTextStyleModifier implements AttributeModifier<TextPickerAttribute> {
  private style: Optional<TextPickerTextStyle> = undefined

  constructor(style?: Optional<TextPickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.defaultTextStyle(this.style)
  }
}

class EnableHapticFeedbackModifier implements AttributeModifier<TextPickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.enableHapticFeedback(this.value)
  }
}

class DigitalCrownSensitivityModifier implements AttributeModifier<TextPickerAttribute> {
  private sensitivity: Optional<CrownSensitivity> = undefined

  constructor(sensitivity?: Optional<CrownSensitivity>) {
    this.sensitivity = sensitivity
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.digitalCrownSensitivity(this.sensitivity)
  }
}

class SelectedBackgroundStyleModifier implements AttributeModifier<TextPickerAttribute> {
  private style: Optional<PickerBackgroundStyle> = undefined

  constructor(style?: Optional<PickerBackgroundStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.selectedBackgroundStyle(this.style)
  }
}

@Entry
@Component
struct TextPickerAttributeModifier {
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4'];
  private select: int = 1;

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker1')
            .attributeModifier(new DefaultPickerItemHeightModifier(50))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker2')
            .attributeModifier(new DefaultPickerItemHeightModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker3')
            .attributeModifier(
              new DisappearTextStyleModifier({ color: Color.Gray, font: { size: 16, weight: FontWeight.Bold } }))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker4')
            .attributeModifier(new DisappearTextStyleModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker5')
            .attributeModifier(
              new TextStyleModifier({ color: Color.Black, font: { size: 20, weight: FontWeight.Normal } }))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker6')
            .attributeModifier(new TextStyleModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker7')
            .attributeModifier(
              new SelectedTextStyleModifier({ color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } }))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker8')
            .attributeModifier(new SelectedTextStyleModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker9')
            .attributeModifier(new SelectedIndexModifier(2))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker10')
            .attributeModifier(new SelectedIndexModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker11')
            .attributeModifier(new CanLoopModifier(true))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker12')
            .attributeModifier(new CanLoopModifier(false))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker13')
            .attributeModifier(new CanLoopModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker14')
            .attributeModifier(new DividerModifier({
              strokeWidth: 10,
              color: Color.Red,
              startMargin: 10,
              endMargin: 20
            } as DividerOptions))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker15')
            .attributeModifier(new DividerModifier(null))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker16')
            .attributeModifier(new DividerModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker17')
            .attributeModifier(new GradientHeightModifier(100))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker18')
            .attributeModifier(new GradientHeightModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker19')
            .attributeModifier(new DisableTextStyleAnimationModifier(true))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker20')
            .attributeModifier(new DisableTextStyleAnimationModifier(false))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker21')
            .attributeModifier(new DisableTextStyleAnimationModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker22')
            .attributeModifier(new DefaultTextStyleModifier({
              color: Color.Black,
              font: { size: 20, weight: FontWeight.Normal },
              minFontSize: 18,
              maxFontSize: 28,
              overflow: TextOverflow.Ellipsis
            }))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker23')
            .attributeModifier(new EnableHapticFeedbackModifier(true))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker24')
            .attributeModifier(new EnableHapticFeedbackModifier(false))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker25')
            .attributeModifier(new EnableHapticFeedbackModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker26')
            .attributeModifier(new DigitalCrownSensitivityModifier(CrownSensitivity.LOW))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker27')
            .attributeModifier(new DigitalCrownSensitivityModifier(undefined))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker28')
            .attributeModifier(new SelectedBackgroundStyleModifier({
              color: '#FFD5D5D5',
              borderRadius: {
                topLeft: 8,
                topRight: 8,
                bottomLeft: 8,
                bottomRight: 8
              }
            }))
        }

        Row() {
          TextPicker({ range: this.fruits, selected: this.select })
            .id('textPicker29')
            .attributeModifier(new SelectedBackgroundStyleModifier(undefined))
        }
      }.width('80%')
    }.width('100%').height('100%')
  }
}
