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
import {
  $r,
  AlphabetIndexer,
  ArrowPosition,
  Axis,
  BlurStyle,
  Button,
  CalendarAlign,
  CalendarPicker,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  Date,
  EdgeEffect,
  EffectComponent,
  EffectType,
  Entry,
  Flex,
  FlexDirection,
  FontWeight,
  ForEach,
  ItemAlign,
  Margin,
  MenuAlignType,
  PickerTextStyle,
  Position,
  Row,
  Select,
  Stack,
  Swiper,
  SwiperDisplayMode,
  Text,
  TextAlign,
  TextInputController,
  Week
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';

// import { CalendarPickerModifier } from "@ohos.arkui.modifier";

// class CustomModifier extends CalendarPickerModifier {
//   applyNormalAttribute(instance: CalendarPickerAttribute): void {
//     super.applyNormalAttribute?.(instance);
//   }
//
//   onChange1() {
//     this.edgeAlign(CalendarAlign.START,{dx: 10, dy: 10})
//   }
// }

@Entry
@Component
struct CalendarPickerExample {
  // @State customModifier: CustomModifier = new CustomModifier()
  //   .edgeAlign(CalendarAlign.END, { dx: 10, dy: 15 })
  //   .textStyle({ color: '#FF182431', font: { size: 8, weight: FontWeight.Lighter } })
  private selectedDate: Date = new Date('2026-02-11')

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        // (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      CalendarPicker({ selected: this.selectedDate })
        .key('CalendarPickerKey1')
      // .attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
    .height('100%')
  }
}
