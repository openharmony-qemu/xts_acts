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
import {attrsManager} from '../../common/AttrsManager';
import {SetValue} from '../../common/Utils'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import animator, { AnimatorResult, AnimatorOptions, PlayMode } from '@ohos.animator';
import {TabContent,FlowItem,ColumnOptions,SideBarContainerType,HorizontalAlign,VerticalAlign,AlignRuleParam,AlignRuleOption,
BadgeParam,BadgeStyle,GridColColumnOption,GridColOptions,GridItem,GridCol,GridRowDirection,MenuItemGroup,
ToggleType,TimePicker,StepperItem,SliderStyle,FlexDirection,ProgressType,Divider,ScrollBar,BadgeParamWithNumber,
MenuItemOptions,MenuItem,$r,Entry,Column,Component,Button,ClickEvent,ForEach,Text,Row,List,ListItem,Color,FlexAlign,ExpectedFrameRateRange,Scroll,Margin,
// Styles,
  WebviewController,AlphabetIndexer,Axis,Blank,ListItemGroup,Checkbox,CheckboxGroup,DataPanel,DatePicker,Gauge,Image,ImageAnimator,LoadingProgress,Marquee,Menu,Navigation,Progress,QRCode,Radio,Rating,RichText,Scroller,Flex,BarState,ScrollDirection,Search,Select,Slider,Stepper,
  TextArea,TextClock,ImageFit,TextInput,TextPicker,TextTimer,Toggle,Web,Circle,Ellipse,Line,Polyline,Polygon,Path,Rect,Shape,Badge,ColumnSplit,Counter,GridRow,Grid,Refresh,RelativeContainer,RowSplit,TextAlign,SideBarContainer,Stack,Swiper,Tabs,WaterFlow,DataPanelType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { RouterParams } from '../../common/Utils';

@Entry
@Component
struct MarginPageLength {
  @State _margin: number = 0
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView??''
  @State targetGroupView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetGroupView??''
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey??''
  @State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey??''
  @State referenceComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.referenceComponentKey??''
  @State childWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.childWidth;
  @State childHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.childHeight;
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;

  onPageShow() {
    console.info('Margin page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
      this._margin = value.margin as number
    })
  }
  // @Styles
  // commonStyle(){
  //   .margin(this._margin)
  //   .width(this.childWidth)
  //   .height(this.childHeight)
  //   .key(this.componentKey)
  // }

  build() {
    Row() {
      if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
            Text('item1').width('100%').textAlign(TextAlign.Center).backgroundColor(Color.White)
          }.margin(this._margin).key(this.componentKey)

          ListItem() {
            Text('referenceComponent')
              .width('100%').textAlign(TextAlign.Center).backgroundColor(Color.White)
          }.key(this.referenceComponentKey)
        }
        .listDirection(Axis.Vertical).width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup().backgroundColor(Color.Yellow).margin(this._margin).key(this.componentKey)
          ListItemGroup().backgroundColor(Color.Red).key(this.referenceComponentKey)
        }
        .backgroundColor(Color.Pink)
        .width(this.parentWidth as number)
        .height(this.parentHeight as number)
        .listDirection(Axis.Vertical)
        .key(this.parentComponentKey)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .margin(this._margin).key(this.componentKey).width('100%').height('100%')
          }
          .backgroundColor(Color.Yellow)
          .padding(0)
          .width(this.parentWidth as number)
          .height(this.parentHeight as number)
          .key(this.parentComponentKey)
        }.width('100%').height('100%').backgroundColor(Color.Green)
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }.margin(this._margin).key(this.componentKey).width('100%').height('100%')
          }
          .backgroundColor(Color.Yellow)
          .padding(0)
          .width(this.parentWidth as number)
          .height(this.parentHeight as number)
          .key(this.parentComponentKey)
        }.width('100%').height('100%').backgroundColor(Color.Green)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1').margin(this._margin).key(this.componentKey)

          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1').key(this.referenceComponentKey)
        }
        .width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem() {
            Column() {
              Text('Page One')
            }
          }
          .backgroundColor(Color.Red)
          .margin(this._margin)
          .key(this.componentKey)
          .width('100%')
          .height('100%')
        }
        .backgroundColor(Color.Yellow).width(this.parentWidth as number).height(this.parentHeight as number)
        .key(this.parentComponentKey)
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        }) {
          GridCol() {
            Row().width('100%').height('20vp')
          }
          .margin(this._margin)
          .key(this.componentKey)
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
        .width(this.parentWidth as number).height(this.parentHeight as number).backgroundColor(Color.Pink).key(this.parentComponentKey)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Column() {
              Text('WaterFlow').fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }
          .margin(this._margin)
          .key(this.componentKey)
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
        .backgroundColor(Color.Pink).width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('4').backgroundColor(0xFAEEE0).width('100%').height('100%').textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
          .rowStart(1)
          .rowEnd(4)
          .margin(this._margin)
          .key(this.componentKey)
          .backgroundColor(Color.Yellow)
        }
        .backgroundColor(Color.Pink).width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else {
        Column() {
          if (this.targetView == 'Button') {
            Button('button1')
// .commonStyle()

          } else if (this.targetView == 'Text') {
            Text('text1')
// .commonStyle()

          } else if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
// .commonStyle()

          } else if (this.targetView == 'Blank') {
            Blank().backgroundColor(Color.Yellow)
// .commonStyle()

          } else if (this.targetView == 'Checkbox') {
            Checkbox()
// .commonStyle()

          } else if (this.targetView == 'CheckboxGroup') {
            CheckboxGroup({ group: 'checkboxGroup' })
// .commonStyle()

          } else if (this.targetView == 'DataPanel') {
            DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
// .commonStyle()

          } else if (this.targetView == 'DatePicker') {
            DatePicker({
              start: new Date('1970-1-1'),
              end: new Date('2100-1-1'),
            })
// .commonStyle()

          } else if (this.targetView == 'Divider') {
            Divider()
// .commonStyle()

          } else if (this.targetView == 'Gauge') {
            Gauge({ value: 105 })
              
// .commonStyle()

              .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          } else if (this.targetView == 'Image') {
            Image($r('app.media.icon'))
// .commonStyle()

          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator()
              .images([{ src: $r('app.media.icon') }
              ])
// .commonStyle()

          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress()
// .commonStyle()

          } else if (this.targetView == 'Marquee') {
            Marquee({
              start: true,
              step: 50,
              loop: Number.MAX_VALUE,
              fromStart: true,
              src: 'Running Marquee starts rolling'
            })
// .commonStyle()

          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
            }.backgroundColor(Color.Yellow)
// .commonStyle()

          } else if (this.targetView == 'Navigation') {
            Navigation({}) {
            }
// .commonStyle()

          } else if (this.targetView == 'NavRouter') {
            // NavRouter() {
            //   Row() {
            //     Image($r('app.media.icon'))
            //   }
            //
            //   NavDestination() {
            //     Text('NavDestination').fontSize(10)
            //   }
            // }
// .commonStyle()

          } else if (this.targetView == 'Progress') {
            Progress({ value: 10, type: ProgressType.Eclipse })
// .commonStyle()

          } else if (this.targetView == 'QRCode') {
            QRCode('Running Marquee starts rolling')
// .commonStyle()

          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' })
// .commonStyle()

          } else if (this.targetView == 'Rating') {
            Rating({ rating: 3.5, indicator: false })
// .commonStyle()

          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
              Text().width(20).height(100).borderRadius(10).backgroundColor('#C0C0C0')
            }
// .commonStyle()

          } else if (this.targetView == 'Search') {
            Search()
// .commonStyle()

          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' },
              { value: 'bbb' }])
// .commonStyle()

          } else if (this.targetView == 'Slider') {
            Slider({
              value: 50,
              min: 0,
              max: 100,
              style: SliderStyle.OutSet
            }).showTips(true)
// .commonStyle()

          } else if (this.targetView == 'Stepper') {
            Stepper() {
              StepperItem() {
                Column() {
                  Text('Page One')
                }
              }
            }
// .commonStyle()

          } else if (this.targetView == 'TextArea') {
            TextArea({
              placeholder: 'The text area can hold an unlimited amount of text. input your word...'
            })
// .commonStyle()

          } else if (this.targetView == 'TextClock') {
            TextClock({ timeZoneOffset: -8 })
              .format('hms')
// .commonStyle()

          } else if (this.targetView == 'TextInput') {
            TextInput({ placeholder: 'input your word...' })
// .commonStyle()

          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
// .commonStyle()

          } else if (this.targetView == 'TextTimer') {
            TextTimer({ isCountDown: true, count: 30000 })
              .format('mm:ss.SS').fontColor(Color.Black)
// .commonStyle()

          } else if (this.targetView == 'TimePicker') {
            TimePicker({
              selected: new Date('2022-07-22T08:00:00')
            })
// .commonStyle()

          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch, isOn: false })
// .commonStyle()

          } else if (this.targetView == 'Web') {
            Web({ src: 'www.example.com', controller: new WebviewController() })
// .commonStyle()

          } else if (this.targetView == 'Circle') {
            Circle()
// .commonStyle()

          } else if (this.targetView == 'Ellipse') {
            Ellipse()
// .commonStyle()

          } else if (this.targetView == 'Line') {
            Line()
// .commonStyle()
.startPoint([0, 0]).endPoint([50, 100]).backgroundColor(Color.Black)
          } else if (this.targetView == 'Polyline') {
            Polyline()
// .commonStyle()

          } else if (this.targetView == 'Polygon') {
            Polygon()
// .commonStyle()

          } else if (this.targetView == 'Path') {
            Path()
// .commonStyle()

          } else if (this.targetView == 'Rect') {
            Rect()
// .commonStyle()

          } else if (this.targetView == 'Shape') {
            Shape() {
              Rect().width(100).height(50)
            }
// .commonStyle()

          } else if (this.targetView == 'Badge') {
            Badge({
              count: 50,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } as BadgeStyle,
            } as BadgeParamWithNumber) {
              Button('message')
                .width(100).height(50).backgroundColor(0x317aff)
            }
// .commonStyle()

          } else if (this.targetView == 'Column') {
            Column() {
              Column().width('100%').height(30).backgroundColor(0xAFEEEE)
            }
// .commonStyle()

          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
            }
// .commonStyle()

          } else if (this.targetView == 'Counter') {
            Counter() {
            }
// .commonStyle()

          } else if (this.targetView == 'Flex') {
            Flex() {
              Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
            }
// .commonStyle()

          } else if (this.targetView == 'GridRow') {
            GridRow()
// .commonStyle()

          } else if (this.targetView == 'Grid') {
            Grid() {
              ForEach(new Array<string>('0', '1', '2', '3', '4'), (i: string) => {
                ForEach(new Array<string>('0', '1', '2', '3', '4'), (day: string) => {
                  GridItem() {
                    Text(day).backgroundColor(Color.White)
                      .width('100%').height('100%').textAlign(TextAlign.Center)
                  }
                })
              })
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr').rowsTemplate('1fr 1fr 1fr 1fr 1fr').backgroundColor(0xFAEEE0)
            
// .commonStyle()

          } else if (this.targetView == 'List') {
            List()
// .commonStyle()

          } else if (this.targetView == 'Navigator') {
            // Navigator() {
            //   Text('Go to back page').width('100%').height(20)
            // }
// .commonStyle()
// .backgroundColor(Color.Red)
          } else if (this.targetView == 'Panel') {
            // Panel(true) {
            //   Text('Text')
            // }.backgroundColor(Color.Yellow)
// .commonStyle()

          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: false }) {
              Text('123')
            }
// .commonStyle()

          } else if (this.targetView == 'RelativeContainer') {
            RelativeContainer() {
              Row()
                .width(100)
                .height(50)
                .backgroundColor('#FF3333')
                .alignRules({
                  top: { anchor: '__container__', align: VerticalAlign.Top } as AlignRuleParam<VerticalAlign>,
                  left: { anchor: '__container__', align: HorizontalAlign.Start } as AlignRuleParam<HorizontalAlign>
                })
                .id('marginLength')
            }
// .commonStyle()

          } else if (this.targetView == 'Row') {
            Row()
// .commonStyle()

          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Text('Text')
            }
// .commonStyle()

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
// .commonStyle()

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
// .commonStyle()

          } else if (this.targetView == 'Stack') {
            Stack() {
            }
// .commonStyle()

          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach(new Array<number>(1, 2, 3), (item: number) => {
                Text('Swiper' + item).width('90%').height(50)
              }, (item: number) => String(item))
            }.indicator(true).backgroundColor(Color.White)
// .commonStyle()

          } else if (this.targetView == 'Tabs') {
            Tabs() {
              TabContent() {
                Column().width('100%').height('100%').backgroundColor('#00CB87')
              }
            }
// .commonStyle()

          } else if (this.targetView == 'WaterFlow') {
            WaterFlow() {
              ForEach(new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number) => {
                FlowItem() {
                  Column() {
                    Text('WaterFlow' + item).fontSize(12).height('16')
                    Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
                  }
                }
              }, (item: number) => String(item))
            }
// .commonStyle()

          }
        }
        .key(this.parentComponentKey)
        .backgroundColor(Color.Red)
      }
    }.backgroundColor(Color.Yellow)
  }
}