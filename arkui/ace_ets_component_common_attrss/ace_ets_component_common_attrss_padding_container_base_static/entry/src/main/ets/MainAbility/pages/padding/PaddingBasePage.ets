/*
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
  Entry,Web,
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
  MenuItemGroupOptions,
  MenuItemGroup,
  Padding,
  Blank,
  RichText,
  Stepper,
  StepperItem,
  ListItem,
// NavPathStack
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
import { attrsManager, GrowValue } from '../../common/AttrsManager';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import inspector from '@ohos.arkui.inspector';

class View {
  targetView: string = '';
  componentKey: string = '';
  parentBackGroundColor: string = '';
  parentComponentKey: string = '';
}

class RouterParams {
  view: View = new View()
}

@Entry
@Component
struct paddingPage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling';
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B'];
  //Use for DataPanel.
  public valueArr: Array<number> = new Array<number>(5, 10, 10, 7, 9, 10, 10, 10, 10);
  @State _padding: Padding = { left: 0, right: 0, top: 0, bottom: 0 } as Padding;
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey
  @State parentBackGroundColor: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
  @State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey

  onPageShow() {
    console.info('padding page show called ')
    attrsManager.registerDataChange((value: GrowValue) => {
      this._padding = value.padding
    })
  }

  // @Styles
  // commonStyle(){
  //   .padding(this._padding)
  //   .key(this.componentKey)
  // }

  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })/* .commonStyle() */
      } else if (this.targetView == 'Text') {
        Text('1')/* .commonStyle() */
      } else if (this.targetView == 'Button') {
        Button('1')/* .commonStyle() */
      } else if (this.targetView == 'BlankRow') {
        Row() {
          Blank().color(Color.Red)/* .commonStyle() */
        }
      } else if (this.targetView == 'BlankColumn') {
        Column() {
          Blank().color(Color.Orange)/* .commonStyle() */
        }
      } else if (this.targetView == 'Checkbox') {
        Checkbox().backgroundColor(Color.Orange)/* .commonStyle() */
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })/* .commonStyle() */.backgroundColor(Color.Orange)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr })/* .commonStyle() */
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
        })/* .commonStyle() */
      } else if (this.targetView == 'Divider') {
        Divider().strokeWidth(8).color(Color.Red)/* .commonStyle() */
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })/* .commonStyle() */.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))/* .commonStyle() */.height(110).backgroundColor(Color.Red)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ])/* .commonStyle() */
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().backgroundColor(Color.Red)/* .commonStyle() */
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity,
          fromStart: true,
          src: this.src
        })/* .commonStyle() */
      } else if (this.targetView == 'Navigation') {
        Navigation({})/* .commonStyle() */
      } else if (this.targetView == 'NavRouter') {
        // NavRouter()/* .commonStyle() */
      } else if (this.targetView == 'Stepper') {
        Stepper() {
          StepperItem()
        }/* .commonStyle() */
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem()/* .commonStyle() */
        }
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })/* .commonStyle() */
      } else if (this.targetView == 'QRCode') {
        QRCode(this.src)/* .commonStyle() */
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true)
          /* .commonStyle() */
          .backgroundColor(Color.Red)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 })/* .commonStyle() */
      } else if (this.targetView == 'RichText') {
        RichText('RichText')/* .commonStyle() */
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(10)
            .height(50)
            .backgroundColor('#C0C0C0')
        }
        /* .commonStyle() */
      } else if (this.targetView == 'Search') {
        Search()
          /* .commonStyle() */
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' },
          { value: 'bbb' }])
          /* .commonStyle() */
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50,
        }).showTips(true)/* .commonStyle() */
      } else if (this.targetView == 'TextArea') {
        TextArea({
          placeholder: 'The text area can hold an unlimited amount of text. input your word...'
        }).placeholderFont({ size: 16, weight: 400 })/* .commonStyle() */
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 }).format('hms')/* .commonStyle() */
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })/* .commonStyle() */.height(40)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value })/* .commonStyle() */
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 }).format('mm:ss.SS')/* .commonStyle() */
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime,
        }).useMilitaryTime(true)/* .commonStyle() */
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })/* .commonStyle() */
      } else if (this.targetView == 'Web') {
        // Web({ src: 'www.example.com', controller: new WebController() })/* .commonStyle() */
      } else if (this.targetView == 'Circle') {
        Circle()/* .commonStyle() */
      } else if (this.targetView == 'Ellipse') {
        Ellipse()/* .commonStyle() */
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          /* .commonStyle() */
      } else if (this.targetView == 'Polyline') {
        Polyline()
          /* .commonStyle() */
          .points([[0, 0], [20, 60], [100, 100]])
      } else if (this.targetView == 'Polygon') {
        Polygon()
          /* .commonStyle() */
          .points([[50, 0], [0, 50], [20, 100], [80, 100], [100, 50]])
      } else if (this.targetView == 'Path') {
        Path()
          /* .commonStyle() */
      } else if (this.targetView == 'Rect') {
        Rect()
          /* .commonStyle() */
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }
        // /* .commonStyle() */
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow)/* .commonStyle() */
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .padding(this._padding)
              .key(this.componentKey)
          }
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' } as MenuItemGroupOptions) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }.key(this.componentKey).padding(this._padding)
          }
        }
      }
    }.backgroundColor(this.parentBackGroundColor)
  }
}