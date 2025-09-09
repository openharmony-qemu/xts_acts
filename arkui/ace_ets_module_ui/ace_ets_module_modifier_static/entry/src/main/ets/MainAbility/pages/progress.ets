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
  Builder,
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
  Dimension,
  Divider,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  Font,
  FontStyle,
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
  HorizontalAlign,
  Hyperlink,
  Image,
  ImageAnimator,
  ImageSpan,
  ItemAlign,
  List,
  ListItem,
  ListItemGroup,
  LoadingProgress,
  Margin,
  MarkStyle,
  Marquee,
  Menu,
  MenuAlignType,
  MenuItem,
  MenuItemOptions,
  NavDestination,
  Navigation,
  NavPathStack,
  Padding,
  Path,
  PickerTextStyle,
  Polygon,
  Polyline,
  Progress,
  ProgressType,
  RepeatMode,
  ResourceColor,
  Row,
  RowOptions,
  Select,
  StickyStyle,
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
import inspector from '@ohos.arkui.inspector';


@Entry
@Component
struct ProgressExample {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Button('Log Json Data')
          .onClick((e: ClickEvent) => {
            console.log(inspector.getInspectorByKey('ProgressKey1'))
          })
        Text("progress-Style")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("styleText")
        Row({ space: 40 } as RowOptions) {
          Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
            .width(100)
            .key("ProgressKey1")

        }
      }.width("100%").height("100%")
    }
    .margin({ top: 5 } as Margin)
  }
}

