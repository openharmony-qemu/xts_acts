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
import { attrsManager } from '../../common/AttrsManager';
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import animator, { AnimatorResult, AnimatorOptions, PlayMode } from '@ohos.animator';
import {
  ListItemGroup,
  BreakpointsReference,
  BreakPoints,
  GridRowOptions,
  GutterOption,
  TextTimerController,
  TabContent,
  FlowItem,
  ColumnOptions,
  SideBarContainerType,
  HorizontalAlign,
  VerticalAlign,

  AlignRuleOption,
  BadgeParam,
  BadgeStyle,
  GridColColumnOption,
  GridColOptions,
  GridItem,
  GridCol,
  GridRowDirection,
  MenuItemGroup,
  ToggleType,
  TimePicker,
  StepperItem,
  SliderStyle,
  FlexDirection,
  ProgressType,
  Divider,
  ScrollBar,
  BadgeParamWithNumber,
  MenuItemOptions,
  MenuItem,
  $r,
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,
  FlexAlign,
  ExpectedFrameRateRange,
  Scroll,
  Margin,

  AlphabetIndexer,
  WebviewController,
  Blank,
  Checkbox,
  CheckboxGroup,
  DataPanel,
  DatePicker,
  Gauge,
  Image,
  ImageAnimator,
  LoadingProgress,
  Marquee,
  Menu,
  Navigation,
  Progress,
  QRCode,
  Radio,
  Rating,
  RichText,
  Scroller,
  Flex,
  BarState,
  ScrollDirection,
  Search,
  Select,
  Slider,
  Stepper,
  TextArea,
  TextClock,
  ImageFit,
  TextInput,
  TextPicker,
  TextTimer,
  Toggle,
  Web,
  Circle,
  Ellipse,
  Line,
  Polyline,
  Polygon,
  Path,
  Rect,
  Shape,
  Badge,
  ColumnSplit,
  Counter,
  GridRow,
  Grid,
  Refresh,
  RelativeContainer,
  RowSplit,
  TextAlign,
  SideBarContainer,
  Stack,
  Swiper,
  Tabs,
  WaterFlow,
  DataPanelType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { RouterParams } from '../../common/Utils';

@Entry
@Component
struct GridSpanPage {
  @State _gridSpan: number = 1
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? '';
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  @State parentWidth: number =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: number =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
  @State columns: number =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.columns;
  @State gutter: number =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.gutter;

  onPageShow() {
    console.info('gridSpan page show called ')
    attrsManager.registerDataChange((value: number) => {
      this._gridSpan = value
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({
      columns: this.columns as number,
      gutter: { x: this.gutter as number, y: this.gutter as number } as GutterOption,
      breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize } as BreakPoints,
      direction: GridRowDirection.Row
    } as GridRowOptions) {
      if (this.targetView == 'ListItem') {
        List({ space: 0, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          }

          

        }
        .width(this.parentWidth as number).height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup().backgroundColor(Color.Yellow)
          

        }
        .width(this.parentWidth as number).height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      } else if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)

          

        }.width(this.parentWidth as number).height(this.parentHeight as number).backgroundColor(Color.Pink)
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }) {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          }

          

        }.width(this.parentWidth as number).height(this.parentHeight as number).backgroundColor(Color.Pink)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1')

          

        }
        .width(this.parentWidth as number).height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem() {
            Column() {
              Text('Page One')
            }
          }

          

        }
        .width(this.parentWidth as number).height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        }) {
          GridCol() {
            Row().width('100%').height('20vp')
          }

          

        }
        .width(this.parentWidth as number).height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Column() {
              Text('WaterFlow').fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }

          

        }
        .width(this.parentWidth as number).height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('4').backgroundColor(0xFAEEE0).width('100%').height('100%').textAlign(TextAlign.Center)
          }

          

        }
        .width(this.parentWidth as number).height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      } else {
        Row() {
          if (this.targetView == 'Button') {
            Button('button1')
            

          } else if (this.targetView == 'Text') {
            Text('text1')
            

          } else if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
            

          } else if (this.targetView == 'Blank') {
            Blank().backgroundColor(Color.Yellow)
            

          } else if (this.targetView == 'Checkbox') {
            Checkbox()
            

          } else if (this.targetView == 'CheckboxGroup') {
            CheckboxGroup({ group: 'checkboxGroup' })
            

          } else if (this.targetView == 'DataPanel') {
            DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
            

          } else if (this.targetView == 'DatePicker') {
            DatePicker({
              start: new Date('1970-1-1'),
              end: new Date('2100-1-1'),
            })
            

          } else if (this.targetView == 'Divider') {
            Divider()
            

          } else if (this.targetView == 'Gauge') {
            Gauge({ value: 105 })

              .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          } else if (this.targetView == 'Image') {
            Image($r('app.media.icon'))
            

          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator()
              .images([
                {
                  src: $r('app.media.icon')
                }
              ])
            

          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress()
            

          } else if (this.targetView == 'Marquee') {
            Marquee({
              start: true,
              step: 50,
              loop: Number.MAX_VALUE as int,
              fromStart: true,
              src: 'Running Marquee starts rolling'
            })
            

          } else if (this.targetView == 'Navigation') {
            Navigation({}) {
            }

            

          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
            }.backgroundColor(Color.Yellow)

            

          } else if (this.targetView == 'NavRouter') {
            
            
            
            
            
            
            
            
            
            

          } else if (this.targetView == 'Progress') {
            Progress({ value: 10, type: ProgressType.Eclipse })
            

          } else if (this.targetView == 'QRCode') {
            QRCode('Running Marquee starts rolling')
            

          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' })
            

          } else if (this.targetView == 'Rating') {
            Rating({ rating: 3.5, indicator: false })
            

          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
              Text()
                .width(20)
                .height(100)
                .borderRadius(10)
                .backgroundColor('#C0C0C0')
            }

            

          } else if (this.targetView == 'Search') {
            Search()
            

          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' },
              { value: 'bbb' }])
            

          } else if (this.targetView == 'Slider') {
            Slider({
              value: 50,
              min: 0,
              max: 100,
              style: SliderStyle.OutSet
            })
              .showTips(true)

            

          } else if (this.targetView == 'Stepper') {
            Stepper() {
              StepperItem() {
                Column() {
                  Text('Page One')
                }
              }
            }

            

          } else if (this.targetView == 'TextArea') {
            TextArea({
              placeholder: 'The text area can hold an unlimited amount of text. input your word...'
            })
            

          } else if (this.targetView == 'TextClock') {
            TextClock({ timeZoneOffset: -8 })
              .format('hms')

            

          } else if (this.targetView == 'TextInput') {
            TextInput({ placeholder: 'input your word...' })
            

          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
            

          } else if (this.targetView == 'TextTimer') {
            TextTimer({ isCountDown: true, count: 30000 })
              .format('mm:ss.SS')
              .fontColor(Color.Black)

            

          } else if (this.targetView == 'TimePicker') {
            TimePicker({
              selected: new Date('2022-07-22T08:00:00'),
            })
            

          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch, isOn: false })
            

          } else if (this.targetView == 'Web') {
            Web({ src: 'www.example.com', controller: new WebviewController() })
            

          } else if (this.targetView == 'Circle') {
            Circle()
            

          } else if (this.targetView == 'Ellipse') {
            Ellipse()
            

          } else if (this.targetView == 'Line') {
            Line()

              .startPoint([0, 0])
              .endPoint([50, 100])
              .backgroundColor(Color.Black)
          } else if (this.targetView == 'Polyline') {
            Polyline()
            

          } else if (this.targetView == 'Polygon') {
            Polygon()
            

          } else if (this.targetView == 'Path') {
            Path()
            

          } else if (this.targetView == 'Rect') {
            Rect()
            

          } else if (this.targetView == 'Shape') {
            Shape() {
              Rect().width(100).height(50)
            }

            

          } else if (this.targetView == 'Badge') {
            Badge({
              count: 50,
              style: {
                color: 0xFFFFFF,
                fontSize: 16,
                badgeSize: 20,
                badgeColor: Color.Red
              } as BadgeStyle
            } as BadgeParamWithNumber) {
              Button('message')
                .width(100).height(50).backgroundColor(0x317aff)
            }

            

          } else if (this.targetView == 'Column') {
            Column() {
              Column().width('100%').height(30).backgroundColor(0xAFEEEE)
            }

            

          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
            }

            

          } else if (this.targetView == 'Counter') {
            Counter() {
            }

            

          } else if (this.targetView == 'Flex') {
            Flex() {
              Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
            }

            

          } else if (this.targetView == 'GridRow') {
            GridRow({
              columns: 1,
              direction: GridRowDirection.Row
            }) {
              ForEach(new Array<Color>(Color.Red, Color.Orange, Color.Yellow, Color.Green,
                Color.Pink, Color.Grey, Color.Blue, Color.Brown), (color: Color) => {
                GridCol({
                  span: {
                    xs: 1,
                    sm: 2,
                    md: 3,
                    lg: 4
                  } as GridColColumnOption
                } as GridColOptions) {
                  Row().width('100%').height('20vp')
                }.borderColor(color).borderWidth(2)
              })
            }

            

          } else if (this.targetView == 'Grid') {
            Grid() {
              ForEach(['0', '1', '2', '3', '4'], (item: string, index: int) => {
                ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                  GridItem() {
                    Text(day).backgroundColor(Color.White)
                      .width('100%').height('100%').textAlign(TextAlign.Center)
                  }
                })
              }, (item: string, index: int) => item)
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
            .rowsTemplate('1fr 1fr 1fr 1fr 1fr')

            

            .backgroundColor(0xFAEEE0)
          } else if (this.targetView == 'List') {
            List() {
            }
            
            .width("100%").height("100%")
          } else if (this.targetView == 'Navigator') {
            
            
            
            
            
          } else if (this.targetView == 'Panel') {
            
            
            
            

          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: true }) {
              Text('123')
            }

            

          } else if (this.targetView == 'RelativeContainer') {
            RelativeContainer() {
              Row()
                .width(100)
                .height(100)
                .backgroundColor('#FF3333')
                .alignRules({
                  top: { anchor: '__container__', align: VerticalAlign.Top },
                  left: { anchor: '__container__', align: HorizontalAlign.Start }
                })
                .id('constraintSize')
            }

            

          } else if (this.targetView == 'Row') {
            Row()
            

          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Text('Text')
            }

            

          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach(new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number) => {
                  Text('Scroll' + String(item))
                    .width('90%')
                    .height(50)
                    .backgroundColor(Color.White)
                    .textAlign(TextAlign.Center)
                }, (item: number) => String(item))
              }.width('100%')
            }.scrollBar(BarState.On)

            

          } else if (this.targetView == 'SideBarContainer') {
            SideBarContainer(SideBarContainerType.Embed) {
              Column() {
                ForEach(new Array<number>(1, 2, 3), (item: number) => {
                  Column({ space: 5 } as ColumnOptions) {
                    Image($r('app.media.icon')).width(50).height(50)
                    Text('Index0' + item).fontSize(25)
                  }
                })
              }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

              Column() {
                Text('SideBarContainer content').fontSize(25)
              }.backgroundColor(Color.Orange)
            }

            

          } else if (this.targetView == 'Stack') {
            Stack() {
            }

            

          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach(new Array<number>(1, 2, 3), (item: number) => {
                Text('Swiper' + item).width('90%').height(50)
              }, (item: number) => String(item))
            }
            .indicator(true)
            .backgroundColor(Color.White)

            

          } else if (this.targetView == 'Tabs') {
            Tabs() {
              TabContent() {
                Column().width('100%').height('100%').backgroundColor('#00CB87')
              }
            }

            

          } else if (this.targetView == 'WaterFlow') {
            WaterFlow() {
              ForEach(new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number) => {
                FlowItem() {
                  Column() {
                    Text('WaterFlow' + item).fontSize(12).height('16')
                    Image($r('app.media.icon'))
                      .width(50)
                      .height(50)
                      .objectFit(ImageFit.Fill)
                  }
                }
              }, (item: number) => String(item))
            }

            

          }
        }
        .width('100%')
        .height(this.parentHeight as number)
        .backgroundColor(Color.Pink)
      }
    }.width(this.parentWidth as number).height(this.parentHeight as number).backgroundColor(Color.Yellow)
  }
}