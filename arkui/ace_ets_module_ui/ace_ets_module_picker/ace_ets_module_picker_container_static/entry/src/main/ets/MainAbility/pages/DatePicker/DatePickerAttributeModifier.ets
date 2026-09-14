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
  DatePicker,
  DatePickerAttribute,
  AttributeModifier,
  Optional,
  FontWeight,
  PickerTextStyle,
  CrownSensitivity,
  ColumnOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

class LunarModifier implements AttributeModifier<DatePickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.lunar(this.value)
  }
}

class DisappearTextStyleModifier implements AttributeModifier<DatePickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.disappearTextStyle(this.style)
  }
}

class TextStyleModifier implements AttributeModifier<DatePickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.textStyle(this.style)
  }
}

class SelectedTextStyleModifier implements AttributeModifier<DatePickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.selectedTextStyle(this.style)
  }
}

class EnableHapticFeedbackModifier implements AttributeModifier<DatePickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.enableHapticFeedback(this.value)
  }
}

class CanLoopModifier implements AttributeModifier<DatePickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.canLoop(this.value)
  }
}

class DigitalCrownSensitivityModifier implements AttributeModifier<DatePickerAttribute> {
  private sensitivity: Optional<CrownSensitivity> = undefined

  constructor(sensitivity?: Optional<CrownSensitivity>) {
    this.sensitivity = sensitivity
  }

  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.digitalCrownSensitivity(this.sensitivity)
  }
}

@Entry
@Component
struct DatePickerAttributeModifier {
  private selectedDate: Date = new Date('2026-04-01');
  private startDate: Date = new Date('1970-1-1');
  private endDate: Date = new Date('2100-1-1');

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker1')
            .attributeModifier(new LunarModifier(true))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker2')
            .attributeModifier(new LunarModifier(false))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker3')
            .attributeModifier(new LunarModifier(undefined))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker4')
            .attributeModifier(
              new DisappearTextStyleModifier({ color: Color.Gray, font: { size: 16, weight: FontWeight.Bold } }))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker5')
            .attributeModifier(new DisappearTextStyleModifier(undefined))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker6')
            .attributeModifier(
              new TextStyleModifier({ color: '#ff182431', font: { size: 18, weight: FontWeight.Normal } }))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker7')
            .attributeModifier(new TextStyleModifier(undefined))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker8')
            .attributeModifier(
              new SelectedTextStyleModifier({ color: '#ff0000FF', font: { size: 26, weight: FontWeight.Medium } }))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker9')
            .attributeModifier(new SelectedTextStyleModifier(undefined))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker10')
            .attributeModifier(new EnableHapticFeedbackModifier(true))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker11')
            .attributeModifier(new EnableHapticFeedbackModifier(false))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker12')
            .attributeModifier(new EnableHapticFeedbackModifier(undefined))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker13')
            .attributeModifier(new CanLoopModifier(true))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker14')
            .attributeModifier(new CanLoopModifier(false))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker15')
            .attributeModifier(new CanLoopModifier(undefined))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker16')
            .attributeModifier(new DigitalCrownSensitivityModifier(CrownSensitivity.LOW))
        }

        Row() {
          DatePicker({
            start: this.startDate,
            end: this.endDate,
            selected: this.selectedDate
          })
            .id('datePicker17')
            .attributeModifier(new DigitalCrownSensitivityModifier(undefined))
        }
      }.width('80%')
    }.width('100%').height('100%')
  }
}
