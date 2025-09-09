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
  Blank,
  BlurStyle,
  Button,
  ButtonType,
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
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  ItemAlign,
  Margin,
  MenuAlignType,
  PickerTextStyle,
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
import { ButtonModifier } from '@ohos.arkui.modifier';


@Entry
@Component
struct ButtonExample {
  @State buttonTypeValue: ButtonType = ButtonType.Normal;
  @State fontSizeValue: string = '20px';
  @State fontColorValue: Color = Color.Black;
  @State text: string = '';
  @State onClickValue: boolean = false;

  onPageShow() {
    console.info('Button page show called');
  }

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {


      }).key("changeButton")

      Button('Ok', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button')


      Button('Ok2', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button2')

    }

  }
}