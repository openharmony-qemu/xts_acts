/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { attrsManager as AttrsManager } from '../../common/AttrsManager';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import { StepperView } from '../../view/alignRules/StepperView';
import {
  MenuItemGroup,
  MenuItemGroupOptions,
  ImageFit,
  FlowItem,
  TabContent,
  ListItemGroup,
  ListItem,
  StepperItem,
  SliderStyle,
  BadgeParamWithNumber,
  Blank,
  Entry,
  Component,
  $r,
  AlignRuleOption,
  Row,
  Button,
  Margin,
  IDataSource,
  DataChangeListener,
  SwiperController,
  Column,
  ColumnOptions,
  ClickEvent,
  RowOptions,
  LazyForEach,
  Text,
  FlexAlign,
  TextCase,
  TextDecorationType,
  Resource,
  AlignRuleParam,
  VerticalAlign,
  HorizontalAlign,
  RelativeContainer,
  Color,
  Scroller,
  Menu,
  ScrollBar,
  TextTimer,
// Navigator,
  ColumnSplit,
  RowSplit,
  Refresh,
// Panel,
  Shape,
  Rect,
  Path,
  Polygon,
  Polyline,
  Line,
  Ellipse,
  Circle,
  WaterFlow,
  Tabs,
  Swiper,
  Stack,
  SideBarContainer,
  Scroll,
  List,
  GridRow,
  Grid,
  Flex,
  Counter,
  Badge,
  Toggle,
  TimePicker,
  TextPicker,
  TextInput,
  TextClock,
  TextArea,
  Slider,
  Search,
  Rating,
  QRCode,
  Progress,
  AlphabetIndexer,
  ImageAnimator,
  Image,
  Navigation,
  Marquee,
  LoadingProgress,
  Gauge,
  Divider,
  DatePicker,
  DataPanel,
  CheckboxGroup,
  Checkbox,
  Select,
  Radio,
  MenuItem,
  ProgressType,
  ToggleType,
  ForEach,
  GridRowDirection,
  BarState,
  SideBarContainerType,
  TextAlign,
  GridItem,
  BadgeStyle,
  BadgeParamWithString,
  GutterOption,
  BreakPoints,
  BreakpointsReference,
  GridCol,
  GridColOptions,
  GridColColumnOption,
  ColumnOptions,
  // Point,
  MenuItemOptions,
  CheckboxGroupOptions,DataPanelOptions,DatePickerOptions,ProgressOptions,RadioOptions,SliderOptions,
  Stepper
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct StateStylesPageTwo {
  @State _isSelect: boolean = true
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey??''

  onPageShow() {
    console.info('StateStylesPageTwo show called ')
    AttrsManager.registerDataChange((value: boolean) => {
      this._isSelect = value
    })
    console.info('this._isSelect:' + this._isSelect)
  }

  // @Styles
  // selectedStyles() {
  //   .zIndex(2)
  // }
  //
  // @Styles
  // normalStyles() {
  //   .zIndex(1)
  // }
  //
  // @Styles
  // commonStyle(){
  //   .key(this.componentKey)
  //   .stateStyles({
  //     normal: this.normalStyles,
  //     selected: this.selectedStyles
  //   })
  // }

  build() {
    Row() {
      Stack() {
        if (this.targetView == 'Checkbox') {
          Checkbox().select(this._isSelect)//.commonStyle()
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).selectAll(this._isSelect)//.commonStyle()
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).checked(this._isSelect)//.commonStyle()
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: this._isSelect })//.commonStyle()
        } else if (this.targetView == 'MenuItem') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .selected(this._isSelect)//.commonStyle()
          }.backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
      }
      .backgroundColor(Color.Pink)
      .width('100%')
      .width('100%')
    }
    .backgroundColor(Color.Yellow)
  }
}