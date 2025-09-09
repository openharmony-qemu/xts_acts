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
  Alignment,
  AlphabetIndexer,
  animateTo,
  ArrowPosition,
  Axis,
  BackgroundEffectOptions,
  Blank,
  BlurStyle,
  BorderImageOption,
  BorderOptions,
  BorderStyle,
  BreakpointsReference,
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
  DatePicker,
  Divider,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  FormComponent,
  FormDimension,
  Gauge,
  GradientDirection,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  GridRowDirection,
  Image,
  ItemAlign,
  Margin,
  MarkStyle,
  MenuAlignType,
  Padding,
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
  TextOverflow,
  Toggle,
  ToggleType,
  Visibility,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct GridRowExample {
  @State bgColors: Color[] =
    [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")

      GridRow({
        columns: 3,
        gutter: { x: 5, y: 10 },
        breakpoints: {
          value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize
        },
        direction: GridRowDirection.Row
      }) {
        GridCol({
          span: {
            xs: 1,
            sm: 2,
            md: 3,
            lg: 4
          },
          offset: 0,
          order: 0
        }) {
          Row() {
            Text("t")
          }.width("100%").height("20vp")
        }.borderColor(Color.Brown).borderWidth(2).backgroundColor(Color.Brown).key("gridRow")

        ForEach(this.bgColors, (color: Color) => {
          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            },
            offset: 0,
            order: 0
          }) {
            Row() {
              Text("t")
            }.width("100%").height("20vp")
          }.borderColor(color).borderWidth(2).backgroundColor(color)
        })
      }.width("100%").height("100%")

    }
    .margin({ top: 5 } as Margin)
  }
}