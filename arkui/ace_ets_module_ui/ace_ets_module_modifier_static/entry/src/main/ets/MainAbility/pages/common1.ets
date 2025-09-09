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
  $rawfile,
  AlphabetIndexer,
  ArrowPosition,
  Axis,
  BarPosition,
  BlurStyle,
  BreakpointsReference,
  Builder,
  Button,
  ButtonAttribute,
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
  Divider,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  GridRowDirection,
  Image,
  ItemAlign,
  List,
  Margin,
  MenuAlignType,
  PickerTextStyle,
  PlaybackSpeed,
  Resource,
  Row,
  Scroll,
  Scroller,
  Select,
  Swiper,
  SwiperDisplayMode,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextAreaController,
  TextInputController,
  TextPicker,
  Video,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State } from '@ohos.arkui.stateManagement';
import { CommonModifier } from '@ohos.arkui.modifier';
import matrix4 from '@ohos.matrix4'
import UTD from '@ohos.data.uniformTypeDescriptor';


@Entry
@Component
struct Common1Example {
  @State buttonTypeValue: ButtonType = ButtonType.Normal;

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")

      Text("Modifier自定义")

        .key("common1")

      Text("Modifier1自定义")

        .key("common2")

      Image($r('app.media.icon'))

        .key("common3")

      Button('testid', { type: this.buttonTypeValue, stateEffect: true })


      Button('testkey', { type: this.buttonTypeValue, stateEffect: true })


      Button('testbutton', { type: this.buttonTypeValue, stateEffect: true })

        .id("testbutton")

    }
  }
}
