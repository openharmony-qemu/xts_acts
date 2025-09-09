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
  AdaptiveColor,
  AlphabetIndexer,
  ArrowPosition,
  Axis,
  BackgroundEffectOptions,
  Blank,
  BlurStyle,
  BorderImageOption,
  BorderOptions,
  BorderStyle,
  Button,
  ButtonType,
  CalendarAlign,
  CalendarPicker,
  Checkbox,
  CheckboxGroup,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Counter,
  Curve,
  DataPanel,
  Date,
  DatePicker,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  GradientDirection,
  Image,
  ItemAlign,
  Margin,
  MarkStyle,
  MenuAlignType,
  PickerTextStyle,
  RepeatMode,
  ResourceColor,
  Row,
  Select,
  Swiper,
  SwiperDisplayMode,
  Text,
  TextAlign,
  TextInputController,
  Toggle,
  ToggleType,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct DatePickerExample {
  private selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .key('DatePicker')

    }
    .width('100%')
    .height('100%')
  }
}
