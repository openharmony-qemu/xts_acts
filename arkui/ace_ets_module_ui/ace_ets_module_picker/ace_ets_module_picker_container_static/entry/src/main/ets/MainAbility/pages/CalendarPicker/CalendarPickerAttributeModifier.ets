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
  CalendarPicker,
  CalendarPickerAttribute,
  CalendarAlign,
  AttributeModifier,
  Optional,
  FontWeight,
  PickerTextStyle,
  Offset,
  ColumnOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

class EdgeAlignModifier implements AttributeModifier<CalendarPickerAttribute> {
  private alignType: Optional<CalendarAlign> = undefined
  private offset: Offset | undefined = undefined

  constructor(alignType?: Optional<CalendarAlign>, offset?: Offset) {
    this.alignType = alignType
    this.offset = offset
  }

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    if (this.offset !== undefined) {
      instance.edgeAlign(this.alignType, this.offset)
    } else {
      instance.edgeAlign(this.alignType)
    }
  }
}

class TextStyleModifier implements AttributeModifier<CalendarPickerAttribute> {
  private style: Optional<PickerTextStyle> = undefined

  constructor(style?: Optional<PickerTextStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.textStyle(this.style)
  }
}

class MarkTodayModifier implements AttributeModifier<CalendarPickerAttribute> {
  private enabled: Optional<boolean> = undefined

  constructor(enabled?: Optional<boolean>) {
    this.enabled = enabled
  }

  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance.markToday(this.enabled)
  }
}

@Entry
@Component
struct CalendarPickerAttributeModifier {
  private selectedDate: Date = new Date('2026-04-01');

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker1')
            .attributeModifier(new EdgeAlignModifier(CalendarAlign.START))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker2')
            .attributeModifier(new EdgeAlignModifier(CalendarAlign.CENTER))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker3')
            .attributeModifier(new EdgeAlignModifier(CalendarAlign.END))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker4')
            .attributeModifier(new EdgeAlignModifier(undefined))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker5')
            .attributeModifier(new EdgeAlignModifier(CalendarAlign.START, { dx: 10, dy: 10 }))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker6')
            .attributeModifier(
              new TextStyleModifier({ color: Color.Blue, font: { size: 20, weight: FontWeight.Bold } }))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker7')
            .attributeModifier(
              new TextStyleModifier({ color: Color.Red, font: { size: 30, weight: FontWeight.Normal } }))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker8')
            .attributeModifier(new TextStyleModifier(undefined))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker9')
            .attributeModifier(new MarkTodayModifier(true))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker10')
            .attributeModifier(new MarkTodayModifier(false))
        }

        Row() {
          CalendarPicker({ selected: this.selectedDate })
            .id('calendarPicker11')
            .attributeModifier(new MarkTodayModifier(undefined))
        }
      }
    }.width('100%').height('100%')
  }
}
