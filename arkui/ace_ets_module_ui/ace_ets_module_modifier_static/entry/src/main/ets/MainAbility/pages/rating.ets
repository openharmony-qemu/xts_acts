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
  QRCode,
  Rating,
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
struct RatingPage {
  @State rating: number = 3.5
  @State indicator: boolean = true
  @State stars: number = 5
  @State stepSize: number = 0.5
  @State text: string = 'no change'
  @State backgroundUri: string = 'resources/base/media/star_1.png'
  @State foregroundUri: string = 'resources/base/media/star_2.png'
  @State secondaryUri: string = 'resources/base/media/star_3.png'

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {

      })
        .key("changeButton")
      Column() {
        Rating({ rating: this.rating, indicator: this.indicator })
          .key('rating1')
          .margin({ top: 24 } as Margin)

      }.width(360).height(150).backgroundColor('#FFFFFF').margin({ top: 68 } as Margin)
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}