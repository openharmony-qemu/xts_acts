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
  TimePicker,
  TimePickerAttribute,
  AttributeModifier,
  Optional,
  FontWeight,
  PickerTextStyle,
  CrownSensitivity,
  ColumnOptions,
  DateTimeOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

class UseMilitaryTimeModifier implements AttributeModifier<TimePickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.useMilitaryTime(this.value)
  }
}

class DisappearTextStyleModifier implements AttributeModifier<TimePickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.disappearTextStyle(this.style)
  }
}

class TextStyleModifier implements AttributeModifier<TimePickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.textStyle(this.style)
  }
}

class SelectedTextStyleModifier implements AttributeModifier<TimePickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.selectedTextStyle(this.style)
  }
}

class LoopModifier implements AttributeModifier<TimePickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.loop(this.value)
  }
}

class DateTimeOptionsModifier implements AttributeModifier<TimePickerAttribute> {
  private value: Optional<DateTimeOptions> = undefined

  constructor(value?: Optional<DateTimeOptions>) {
    this.value = value
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.dateTimeOptions(this.value)
  }
}

class EnableHapticFeedbackModifier implements AttributeModifier<TimePickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.enableHapticFeedback(this.value)
  }
}

class EnableCascadeModifier implements AttributeModifier<TimePickerAttribute> {
  private value: Optional<boolean> = undefined

  constructor(value?: Optional<boolean>) {
    this.value = value
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.enableCascade(this.value)
  }
}

class DigitalCrownSensitivityModifier implements AttributeModifier<TimePickerAttribute> {
  private sensitivity: Optional<CrownSensitivity> = undefined

  constructor(sensitivity?: Optional<CrownSensitivity>) {
    this.sensitivity = sensitivity
  }

  applyNormalAttribute(instance: TimePickerAttribute): void {
    instance.digitalCrownSensitivity(this.sensitivity)
  }
}

@Entry
@Component
struct TimePickerAttributeModifier {
  private selectedTime: Date = new Date('2022-07-22T08:00:00');

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker1')
            .attributeModifier(new UseMilitaryTimeModifier(true))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker2')
            .attributeModifier(new UseMilitaryTimeModifier(false))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker3')
            .attributeModifier(new UseMilitaryTimeModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker4')
            .attributeModifier(
              new DisappearTextStyleModifier({ color: Color.Gray, font: { size: 16, weight: FontWeight.Bold } }))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker5')
            .attributeModifier(new DisappearTextStyleModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker6')
            .attributeModifier(
              new TextStyleModifier({ color: Color.Black, font: { size: 26, weight: FontWeight.Normal } }))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker7')
            .attributeModifier(new TextStyleModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker8')
            .attributeModifier(
              new SelectedTextStyleModifier({ color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } }))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker9')
            .attributeModifier(new SelectedTextStyleModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker10')
            .attributeModifier(new LoopModifier(true))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker11')
            .attributeModifier(new LoopModifier(false))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker12')
            .attributeModifier(new LoopModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker13')
            .attributeModifier(
              new DateTimeOptionsModifier({ hour: '2-digit', minute: '2-digit', second: '2-digit' } as DateTimeOptions))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker14')
            .attributeModifier(new DateTimeOptionsModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker15')
            .attributeModifier(new EnableHapticFeedbackModifier(true))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker16')
            .attributeModifier(new EnableHapticFeedbackModifier(false))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker17')
            .attributeModifier(new EnableHapticFeedbackModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker18')
            .attributeModifier(new EnableCascadeModifier(true))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker19')
            .attributeModifier(new EnableCascadeModifier(false))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker20')
            .attributeModifier(new EnableCascadeModifier(undefined))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker21')
            .attributeModifier(new DigitalCrownSensitivityModifier(CrownSensitivity.LOW))
        }

        Row() {
          TimePicker({ selected: this.selectedTime })
            .id('timePicker22')
            .attributeModifier(new DigitalCrownSensitivityModifier(undefined))
        }
      }.width('80%')
    }.width('100%').height('100%')
  }
}
