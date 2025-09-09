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
  Ellipse,
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
  LineCapStyle,
  LineJoinStyle,
  ListItemGroup,
  LoadingProgress,
  Margin,
  MarkStyle,
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
  Position,
  Progress,
  ProgressType,
  Rect,
  RepeatMode,
  ResourceColor,
  RichEditor,
  RichEditorController,
  Row,
  RowOptions,
  Search,
  SearchController,
  Select,
  Shape,
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
struct ShapeExample {
  build() {
    Column({ space: 10 } as ColumnOptions) {

      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")

      Text('basic').fontSize(11).fontColor(0xCCCCCC).width(320)


      Shape() {
        Rect().width(300).height(50)
        Ellipse().width(300).height(50).offset({ x: 0, y: 60 } as Position)
        Path().width(300).height(10).commands('M0 0 L900 0').offset({ x: 0, y: 120 } as Position)
      }
      .width(350)
      .key("ShapeKey1")


      Shape() {
        Rect().width(300).height(50)
      }
      .width(350)
      .height(80)
      .viewPort({
        x: 0,
        y: 0,
        width: 320,
        height: 70
      })
      .fill(0x317AF7)
      .stroke(Color.Black)
      .strokeWidth(10)

      Shape() {
        Rect().width(300).height(50)
      }
      .width(350)
      .height(80)
      .viewPort({
        x: -5,
        y: -5,
        width: 320,
        height: 70
      })
      .fill(0x317AF7)
      .stroke(Color.Black)
      .strokeWidth(10)

      Text('path').fontSize(11).fontColor(0xCCCCCC).width(320)

      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
      .height(20)
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeDashArray([20])

      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
      .height(20)
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeDashArray([20])
      .strokeDashOffset(10)

      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
      .height(20)
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeOpacity(0.5)

      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
      .height(20)
      .viewPort({
        x: 0,
        y: -5,
        width: 300,
        height: 20
      })
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeDashArray([20])
      .strokeLineCap(LineCapStyle.Round)

      Shape() {
        Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
      }
      .width(300)
      .height(200)
      .viewPort({
        x: -20,
        y: -5,
        width: 310,
        height: 90
      })
      .fill(0x317AF7)
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeLineJoin(LineJoinStyle.Miter)
      .strokeMiterLimit(5)
    }.width('100%').margin({ top: 15 } as Margin)
  }
}
