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
  RepeatMode,
  ResourceColor,
  Row,
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


@Entry
@Component
struct PolygonExample {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {

      }).key("changeButton")

      Polygon({ width: 200, height: 150 })

        .fill(Color.Green)
        .key('polygon1')
    }.width('100%')
  }
}

