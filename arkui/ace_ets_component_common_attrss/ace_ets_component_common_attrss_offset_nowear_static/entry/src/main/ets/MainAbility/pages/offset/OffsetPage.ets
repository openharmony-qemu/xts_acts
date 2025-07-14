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

import { ListItemGroupView } from "../../view/offset/ListItemGroupView";
import { StepperView } from '../../view/offset/StepperView';
import { StepperItemView } from '../../view/offset/StepperItemView';
import { attrsManager } from '../../common/AttrsManager';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import {
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
  MenuItemOptions,
  Position,
  TabContent,
  Axis,
  ListItem,
  FlowItem,
  FlexDirection,
  MenuItemGroup,
  Blank
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

/**
 * Test page of common attribute: offset
 */

@Entry
@Component
struct Offset {
  private scroller: Scroller = new Scroller() //For Scroll and ScrollBar
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15) //For Scroll
  @State show: boolean = false //For Panel
  @State _offset: Position = { x: 0, y: 0 } as Position;
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? ""
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight
  @State subassemblyWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.subassemblyWidth
  @State subassemblyHeight: number =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.subassemblyHeight
  @State parentComponentKey: string =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey
  @State referenceComponentKey: string =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.referenceComponentKey

  onPageShow() {
    console.info('[Offset] page show called ')

    //Register data change call back.
    attrsManager.registerDataChange((value: Position) => {
      this._offset = value
    })
  }

  /**
   * Set common style.
   */
  // @Styles
  ////.commonStyle()(){
  //   .offset(this._offset)
  //   .key(this.componentKey)
  // }

  build() {
    Row() {
      Column() {
        //Create view by config.
        if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()

            ListItem() {
              Text('referenceComponent')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.key(this.referenceComponentKey)
          }.key(this.parentComponentKey)
          .width(this.parentWidth).height(this.parentHeight).listDirection(Axis.Vertical)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1')

            //.commonStyle()().width(this.subassemblyWidth).height(this.subassemblyHeight)

            TabContent() {
              Text('referenceComponent').width('100%').height('100%').backgroundColor(Color.Orange)
            }.tabBar('Tabs2')
            .width(this.subassemblyWidth).height(this.subassemblyHeight)
            .key(this.referenceComponentKey)
          }.width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 5,
            gutter: { x: 5, y: 10 } as GutterOption,
            breakpoints: {
              value: ['400vp', '600vp', '800vp'],
              reference: BreakpointsReference.WindowSize
            } as BreakPoints,
            direction: GridRowDirection.Row
          }) {
            GridCol({
              span: {
                xs: 1,
                sm: 2,
                md: 3,
                lg: 4
              } as GridColColumnOption
            }) {
              Row().width('100%').height('20vp')
            }.borderColor(Color.Green).borderWidth(2) //.commonStyle()()

            GridCol({
              span: {
                xs: 1,
                sm: 2,
                md: 3,
                lg: 4
              } as GridColColumnOption
            }) {
              Row().width('100%').height('20vp')
            }.borderColor(Color.Yellow).borderWidth(2).key(this.referenceComponentKey)
          }.width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            FlowItem() {
              Text('text').fontSize(12).height('16')
            }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()

            FlowItem() {
              Text('text').fontSize(12).height('16')
            }.width(this.subassemblyWidth).height(this.subassemblyHeight).key(this.referenceComponentKey)
          }.width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
        } else if (this.targetView == 'StepperItem') {
          StepperItemView({
            _offset: this._offset,
            componentKey: this.componentKey,
            parentWidth: this.parentWidth,
            parentHeight: this.parentHeight,
            parentComponentKey: this.parentComponentKey,
            referenceComponentKey: this.referenceComponentKey
          })
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('GridItem1').backgroundColor(Color.White)
                .width('100%').height('100%').textAlign(TextAlign.Center)
            } //.commonStyle()()

            GridItem() {
              Text('GridItem2').backgroundColor(Color.White)
                .width('100%').height('100%').textAlign(TextAlign.Center)
            }.key(this.referenceComponentKey)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .backgroundColor(Color.Black)
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions) //.commonStyle()()
              MenuItem({ startIcon: $r('app.media.icon'), content: 'referenceComponent' } as MenuItemOptions)
                .key(this.referenceComponentKey)
            }
            .padding(0)
            .backgroundColor(Color.Yellow)
            .width(this.parentWidth)
            .height(this.parentHeight)
            .key(this.parentComponentKey)
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'MenuItemGroup') {
          Row() {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()

              MenuItem({ startIcon: $r('app.media.icon'), content: 'referenceComponent' } as MenuItemOptions)
                .key(this.referenceComponentKey)
            }
            .padding(0)
            .backgroundColor(Color.Yellow)
            .width(this.parentWidth)
            .height(this.parentHeight)
            .key(this.parentComponentKey)
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else {
          Row() {
            //Set view by page config.
            if (this.targetView == 'Button') {
              Button('button1').width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Radio') {
              Radio({ value: 'Radio1', group: 'radioGroup' })
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Select') {
              Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
                { value: 'bbb', icon: '/common/public_icon.svg' }])
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Blank') {
              Blank().color(Color.Black) //.commonStyle()()
            } else if (this.targetView == 'Checkbox') {
              Checkbox({ name: 'checkbox1' }).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'CheckboxGroup') {
              CheckboxGroup().width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'DataPanel') {
              DataPanel({ values: [25] }).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'DatePicker') {
              DatePicker({}).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Divider') {
              Divider()
                .strokeWidth(10)
                .color(Color.Black)
                .vertical(false)
                .width(this.subassemblyWidth)
                .height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Gauge') {
              Gauge({ value: 0 })
                .colors([[0x317AF7, 1], [0x9C554B, 1]])
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'LoadingProgress') {
              LoadingProgress().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Marquee') {
              Marquee({ start: true, src: 'Marquee' })
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Navigation') {
              Navigation({})
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Image') {
              Image($r('app.media.icon'))
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'ImageAnimator') {
              ImageAnimator()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'AlphabetIndexer') {
              AlphabetIndexer({ arrayValue: ['A', 'B', 'C', 'D'], selected: 0 })
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Progress') {
              Progress({ value: 10, type: ProgressType.Ring })
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'QRCode') {
              QRCode('Hello Harmony').width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Rating') {
              Rating({ rating: 3.5 }).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Search') {
              Search().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Slider') {
              Slider().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Text') {
              Text('Text').width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'TextArea') {
              TextArea().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'TextClock') {
              TextClock().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'TextInput') {
              TextInput().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'TextPicker') {
              TextPicker({ range: ['apple1', 'orange2', 'peach3', 'grape4'] })
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'TimePicker') {
              TimePicker().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Toggle') {
              Toggle({ type: ToggleType.Switch })
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Badge') {
              Badge({ value: '', style: { badgeSize: 6, badgeColor: Color.Red } } as BadgeParamWithString) {
                Button('BadgeContent')
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Column') {
              Column().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Counter') {
              Counter().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Flex') {
              Flex().width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Grid') {
              Grid() {
                ForEach(new Array<string>('0', '1', '2', '3', '4'), (s: string) => {
                  ForEach(new Array<string>('0', '1', '2', '3', '4'), (day: string) => {
                    GridItem() {
                      Text(day).backgroundColor(Color.White)
                        .width('100%').height('100%').textAlign(TextAlign.Center)
                    }
                  })
                })
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'GridRow') {
              GridRow({
                columns: 5,
                gutter: { x: 5, y: 10 } as GutterOption,
                breakpoints: {
                  value: ['400vp', '600vp', '800vp'],
                  reference: BreakpointsReference.WindowSize
                } as BreakPoints,
                direction: GridRowDirection.Row
              }) {
                ForEach(new Array<Color>(Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue),
                  (color: Color) => {
                    GridCol({
                      span: {
                        xs: 1,
                        sm: 2,
                        md: 3,
                        lg: 4
                      } as GridColColumnOption
                    }) {
                      Row().width('100%').height('20vp')
                    }.borderColor(color).borderWidth(2)
                  })
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'List') {
              List()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Row') {
              Row()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Scroll') {
              Scroll(this.scroller) {
                Flex({ direction: FlexDirection.Column }) {
                  ForEach(this.arr, (item: number) => {
                    Row() {
                      Text(String(item))
                        .width(80)
                        .height(20)
                        .backgroundColor('#3366CC')
                        .borderRadius(15)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                        .margin({ top: 5 } as Margin)
                    }
                  }, (item: number) => String(item))
                }.margin({ right: 15 } as Margin)
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'SideBarContainer') {
              SideBarContainer(SideBarContainerType.Embed) {
                Column() {
                  ForEach(new Array<number>(1, 2, 3), (item: number, index: number): void => {
                    Column({ space: 5 } as ColumnOptions) {
                      Image($r('app.media.icon')).width(64).height(64)
                      Text('Index0' + item).fontSize(25)
                    }
                  })
                }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

                Column() {
                  Text('SideBarContainer content').fontSize(25)
                }.backgroundColor(Color.Orange)
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Stack') {
              Stack()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Swiper') {
              Swiper() {
                ForEach(new Array<number>(1, 2, 3), (item: number, index: number): void => {
                  Text('Swiper' + item).width('90%').height(160)
                }, (item: number, index: number): string => String(item))
              }
              .indicator(true)
              .backgroundColor(Color.White)
              .width(this.subassemblyWidth)
              .height(this.subassemblyHeight)

              //.commonStyle()()
            } else if (this.targetView == 'Tabs') {
              Tabs()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'WaterFlow') {
              WaterFlow()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Circle') {
              Circle()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Ellipse') {
              Ellipse()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Line') {
              Line()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Polyline') {
              Polyline()
                .points([[50, 10], [50, 50], [90, 90]])
                .backgroundColor(Color.Blue)
                .width(this.subassemblyWidth)
                .height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Polygon') {
              Polygon()
                .points([[50, 10], [50, 50], [90, 90]])
                .backgroundColor(Color.Blue)
                .width(this.subassemblyWidth)
                .height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Path') {
              Path()
                .commands('M100 0 L200 240 L0 240 Z')
                .backgroundColor(Color.Blue)
                .width(this.subassemblyWidth)
                .height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Rect') {
              Rect()
                .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Shape') {
              Shape() {
                Rect().width('100%').height('100%')
              }
              .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'Panel') {
              // Panel(this.show = true) {
              //   Column() {
              //   }
              // }.width(this.subassemblyWidth).height(this.subassemblyHeight)//.commonStyle()()
            } else if (this.targetView == 'Refresh') {
              Refresh({ refreshing: true }) {
                Text('Refresh').fontSize(30)
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'RowSplit') {
              RowSplit() {
                Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
                Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'ColumnSplit') {
              ColumnSplit() {
                Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
                Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
              }.width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'RelativeContainer') {
              RelativeContainer() {
                Row()
                  .width(100)
                  .height(100)
                  .backgroundColor('#FF3333')
                  .alignRules({
                    top: { anchor: '__container__', align: VerticalAlign.Top } as AlignRuleParam<VerticalAlign>,
                    left: { anchor: '__container__', align: HorizontalAlign.Start } as AlignRuleParam<HorizontalAlign>
                  })
                  .id('offset')
              }
              .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)

              //.commonStyle()()
            } else if (this.targetView == 'Navigator') {
              // Navigator() {
              //   Text('Back to previous page').width('100%').textAlign(TextAlign.Center)
              // }.backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight)
              //.commonStyle()()
            } else if (this.targetView == 'NavRouter') {
              //NavRouterView({ _offset: $_offset, componentKey: this.componentKey })
            } else if (this.targetView == 'TextTimer') {
              TextTimer({ isCountDown: true, count: 30000 })
                .width(this.subassemblyWidth).height(this.subassemblyHeight) //.commonStyle()()
            } else if (this.targetView == 'Stepper') {
              StepperView({ _offset: this._offset, componentKey: this.componentKey });
            } else if (this.targetView == 'ScrollBar') {
              ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
                Text().width(20).height(100).borderRadius(10)
                  .backgroundColor('#C0C0C0')
              }.width(this.subassemblyWidth).height(this.subassemblyHeight).backgroundColor('#ededed')

              //.commonStyle()()
            } else if (this.targetView == 'ListItemGroup') {
              ListItemGroupView({
                _offset: this._offset,
                componentKey: this.componentKey,
                parentWidth: this.parentWidth,
                parentHeight: this.parentHeight,
                subassemblyWidth: this.subassemblyWidth,
                subassemblyHeight: this.subassemblyHeight,
                parentComponentKey: this.parentComponentKey,
                referenceComponentKey: this.referenceComponentKey
              })
            } else if (this.targetView == 'Menu') {
              Menu() {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
              }.backgroundColor(Color.Yellow).width(this.subassemblyWidth)
              .height(this.subassemblyHeight) //.commonStyle()()
            }
            Button('Button').width(this.subassemblyWidth).height(this.subassemblyHeight)
              .key(this.referenceComponentKey)
          }.width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
          .backgroundColor(Color.Gray)
        }
      }.width('100%').height('90%').backgroundColor(Color.Red)
    }.width('100%').height('100%').backgroundColor(Color.Yellow)
  }
}