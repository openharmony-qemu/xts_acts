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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import animator, { AnimatorResult, AnimatorOptions, PlayMode } from '@ohos.animator';
import {BreakpointsReference,GutterOption,BreakPoints,TabContent,FlowItem,ColumnOptions,SideBarContainerType,HorizontalAlign,VerticalAlign,AlignRuleParam,AlignRuleOption,
BadgeParam,BadgeStyle,GridColColumnOption,GridColOptions,GridItem,GridCol,GridRowDirection,MenuItemGroup,
ToggleType,TimePicker,StepperItem,SliderStyle,FlexDirection,ProgressType,Divider,ScrollBar,BadgeParamWithNumber,
MenuItemOptions,MenuItem,$r,Entry,Column,Component,Button,ClickEvent,ForEach,Text,Row,List,ListItem,Color,FlexAlign,ExpectedFrameRateRange,Scroll,Margin,
// Styles,
  AlphabetIndexer,WebviewController,Blank,Checkbox,CheckboxGroup,DataPanel,DatePicker,Gauge,Image,ImageAnimator,LoadingProgress,Marquee,Menu,Navigation,Progress,QRCode,Radio,Rating,RichText,Scroller,Flex,BarState,ScrollDirection,Search,Select,Slider,Stepper,
  TextArea,TextClock,ImageFit,TextInput,TextPicker,TextTimer,Toggle,Web,Circle,Ellipse,Line,Polyline,Polygon,Path,Rect,Shape,Badge,ColumnSplit,Counter,GridRow,Grid,Refresh,RelativeContainer,RowSplit,TextAlign,SideBarContainer,Stack,Swiper,Tabs,WaterFlow,DataPanelType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import {attrsManager} from '../../common/AttrsManager';
import {SetValue} from '../../common/Utils'
import { RouterParams } from '../../common/Utils';
@Entry
@Component
struct heightPage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling'
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B']
  //Use for Scroll,Grid,DataPanel.
  public valueArr: number[] = new Array<number>(5, 10, 10, 7, 9, 10, 10, 10, 10)
  @State _height: number = 0
  @State _width: number = 0
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? '';
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
  @State parentBackGroundColor: Color = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor ?? Color.White;
  @State BackGroundColor: Color = (this.getUIContext().getRouter().getParams() as RouterParams).view.BackGroundColor ?? Color.White;
  @State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey ?? '';
  onPageShow() {
    console.info('height page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
      this._height = value.height as number
    })
  }

  // @Styles
  // commonStyle(){
  //   .height(this._height)
  //   .key(this.componentKey)
  // }
  build() {
    Column() {
      if (this.targetView == 'Button') {
        Button('button1')
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Text') {
        Text('text1')
//.commonStyle()
.width(100)
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })
          
//.commonStyle()
.width(100)
      } else if (this.targetView == 'BlankRow') {
        Row() {
          Blank().color(this.BackGroundColor)
//.commonStyle()

        }.width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else if (this.targetView == 'BlankColumn') {
        Blank().color(this.BackGroundColor)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Checkbox') {
        Checkbox().backgroundColor(this.BackGroundColor)
//.commonStyle()
.width(100).margin(0)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
          .margin(0)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1')
        })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Divider') {
        Divider().strokeWidth(8).color(Color.Red)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
//.commonStyle()
.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .width(100)
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
//.commonStyle()
.width(110).backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ])
//.commonStyle()
.width(100)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().backgroundColor(this.BackGroundColor)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Number.MAX_VALUE,
          fromStart: true,
          src: this.src
        })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Navigation') {
        Navigation({})
//.commonStyle()
.width(100).expandSafeArea([], [])
      } else if (this.targetView == 'NavRouter') {
        // NavRouter()
//.commonStyle()
// .width(100)
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'QRCode') {
        QRCode(this.src)
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).width(100)
//.commonStyle()
.backgroundColor(this.BackGroundColor)
          .margin(0)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'RichText') {
        RichText('RichText')
//.commonStyle()
.width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller() }) {
          Text().width(10).height(50).backgroundColor('#C0C0C0')
        }
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Search') {
        Search()
//.commonStyle()
.width(100).margin(0)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' },
          { value: 'bbb' }]).backgroundColor(this.BackGroundColor)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50
        }).showTips(true)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'TextArea' })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .fontSize(30)
          
//.commonStyle()

          .backgroundColor(this.BackGroundColor)
          .width(100)
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          
//.commonStyle()
.width(100)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 }).format('mm:ss.SS')
          
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime
        }).useMilitaryTime(true)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch })
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100).margin(0)
      } else if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Circle') {
        Circle()
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Ellipse') {
        Ellipse()
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          
//.commonStyle()

          .width(100)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polyline') {
        Polyline()
          
//.commonStyle()
.width(100)
          .points([[20,0],[0,100],[100,90]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polygon') {
        Polygon()
          
//.commonStyle()

          .width(100)
          .points([[20,0], [0,100], [100,100],[100,0]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Path') {
        Path()
//.commonStyle()
.width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Rect') {
        Rect()
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Badge') {
        Badge({
          count: 50,
          style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } as BadgeStyle
        } as BadgeParamWithNumber) {
          Button('message')
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Column') {
        Column() {
          Column().width('100%').height(30).backgroundColor(0xAFEEEE)
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'ColumnSplit') {
        Column() {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }
//.commonStyle()
.width(100)
        }
      } else if (this.targetView == 'Counter') {
        Counter() {
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Flex') {
        Flex() {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 } as GutterOption,
          breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize } as BreakPoints,
          direction: GridRowDirection.Row
        }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink], (color: Color) => {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption } as GridColOptions) {
              Row().width('100%').height('20vp')
            }.borderColor(color).borderWidth(2)
          })
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Grid') {
        Grid() {
          ForEach(this.valueArr, (day: number) => {
            GridItem() {
              Text(String(day))
            }
          }, (day: number) => String(day))
        }.columnsTemplate('1fr 1fr 1fr 1fr 1fr')
//.commonStyle()
.width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'List') {
        List() {
        }
//.commonStyle()
.width(200).backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
          }
//.commonStyle()

        }.width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else if (this.targetView == 'Panel') {
        // Panel(true) {
        //   Column() {
        //   }
        // }
//.commonStyle()
// .width(100)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }) {
          Text('Pull Down and refresh:0 ')
        }
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Row') {
        Row() {
          Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        }
//.commonStyle()
.width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1').width('20%').height(100).backgroundColor(0xF5DEB3)
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          List() {
            ForEach(this.valueArr, (item: number) => {
              ListItem() {
                Text('ListItem' + item)
              }.width('100%').height(100)
            }, (item: number) => String(item))
          }.width(200).height(200)
        }
//.commonStyle()
.width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach(new Array<number>(1, 2, 3), (item: number) => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon')).width(50).height(50)
                Text('Index0' + item).fontSize(25)
              }
            })
          }.width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content').fontSize(25)
          }.backgroundColor(Color.Orange)
        }
//.commonStyle()

      } else if (this.targetView == 'Stack') {
        Stack() {
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach(new Array<number>(1, 2, 3), (item: number) => {
            Text('Swiper' + item).width('90%').height(50)
          }, (item: number) => String(item))
        }.indicator(true)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }
        }
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow()
//.commonStyle()
.backgroundColor(this.BackGroundColor).width(100)
      }
      else if (this.targetView == 'Stepper') {
        Stepper() {
          StepperItem()
        }
//.commonStyle()
.width(100)
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem() {
            Text('Page One')
          }
//.commonStyle()

        }.key(this.parentComponentKey).width(this.parentWidth as number).height(this.parentHeight as number)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem()
//.commonStyle()

        }.key(this.parentComponentKey).width(this.parentWidth as number).height(this.parentHeight as number)
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption } as GridColOptions) {
            Row().width('100%').height('20vp')
          }
//.commonStyle()

        }.key(this.parentComponentKey).width(this.parentWidth as number).height(this.parentHeight as number)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem()
//.commonStyle()

        }.key(this.parentComponentKey).width(this.parentWidth as number).height(this.parentHeight as number)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center } as AlignRuleParam<VerticalAlign>,
              middle: { anchor: '__container__', align: HorizontalAlign.Center } as AlignRuleParam<HorizontalAlign>
            })
        }.backgroundColor(Color.Green)
//.commonStyle()
.width(100)
      } else if (this.targetView == 'Navigator') {
        // Navigator()
//.commonStyle()
// .width(100)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow)
//.commonStyle()
.width(100).padding(0)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .height(this._height)
              .key(this.componentKey)
          }
          .backgroundColor(this.BackGroundColor)
          .width(this.parentWidth as number)
          .height(this.parentHeight as number)
          .key(this.parentComponentKey)
          .padding(0)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }.key(this.componentKey).height(this._height)
          }
          .backgroundColor(Color.Yellow)
          .height(this.parentHeight as number)
          .width(this.parentWidth as number)
          .key(this.parentComponentKey)
          .padding(0)
        }
      }
    }
    .height(this.parentHeight as number)
    .width(this.parentWidth as number)
    .backgroundColor(this.parentBackGroundColor)
    .key(this.parentComponentKey)
  }
}