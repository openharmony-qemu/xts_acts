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

import { attrsManager  }  from '../../common/AttrsManager';
import { RouterParams , SetValue } from '../../common/Utils';
import router from '@ohos.router'
import { StepperView } from '../../view/alignRules/StepperView';
import {
  Entry,
  Component,Navigation,
  Text,
  AlphabetIndexer,Checkbox,CheckboxGroup,DataPanel,DatePicker,Divider,Gauge,ImageAnimator,LoadingProgress,Marquee,Menu,
  Progress,QRCode,Radio,Rating,ScrollBar,Stepper,Select,Slider,TextArea,TextClock,TextInput,TextPicker,TextTimer,TimePicker,Toggle,Badge,
  Counter,GridRow,Grid,List,RelativeContainer,Row,Refresh,TextAlign,SideBarContainer,Stack,Swiper,Tabs,WaterFlow,
  Circle,Ellipse,Line,Polyline,Polygon,Path,Rect,Shape,ColumnSplit,RowSplit,Blank
,Builder,Button,DataPanelType,Color,Image,MenuItem,ProgressType,BarState,StepperItem,Search,SliderStyle,Axis,ToggleType,Column,Flex,GridRowDirection,GridCol
,GridItem,ListItem,Scroll,SideBarContainerType,TabContent,FlowItem,$r,MenuItemOptions,Scroller,BadgeParamWithNumber,BadgeStyle,GridColOptions,GridColColumnOption,
  AlignRuleOption,VerticalAlign,HorizontalAlign,ColumnOptions,FlexAlign,ImageFit,Position,PolylineOptions,RectOptions,FlexDirection
,Padding,Web,WebviewController,RichText,MenuItemGroup,GridRowOptions,GutterOption,RefreshOptions,ForEach,BreakpointsReference,BreakPoints,ListOptions,
  ListItemGroup,AlphabetIndexerOptions,MenuItemGroupOptions
} from '@ohos.arkui.component'
import {
  State,
  
  AppStorage

} from '@ohos.arkui.stateManagement'

import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { Color } from '@ohos.arkui.component'

@Entry
@Component
struct PaddingPage_Length {
  
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  
  private src: string = 'Running Marquee starts rolling';
  
  private value: string[] = ['#', 'A', 'B'];
  
  public valueArr: Array<number> = [5, 10, 10, 7, 9, 10, 10, 10, 10] as Array<number>;
  @State _padding: number | string | Padding = 0 as number;
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
  @State componentKey: string =(this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey
  @State parentBackGroundColor: Color = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
  @State parentComponentKey: string =(this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey

  onPageShow() {
    console.info('padding page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
      this._padding = value.padding as Padding
    })
  }

  
  
  
  
  

  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 } as AlphabetIndexerOptions)
      } else if (this.targetView == 'Text') {
        Text('1')
      } else if (this.targetView == 'Button') {
        Button('1')
      } else if (this.targetView == 'BlankRow') {
        Blank().color(Color.Red)
      } else if (this.targetView == 'BlankColumn') {
        Column() {
          Blank().color(Color.Orange)
        }
      } else if (this.targetView == 'Checkbox') {
        Checkbox().backgroundColor(Color.Orange)
          
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          
          .backgroundColor(Color.Orange)
          .margin(0)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr })
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
        })
      } else if (this.targetView == 'Divider') {
        Divider().strokeWidth(8).color(Color.Red)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          
          .height(110)
          .backgroundColor(Color.Red)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ])
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().backgroundColor(Color.Red)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity as int,
          fromStart: true,
          src: this.src
        })
      } else if (this.targetView == 'Navigation') {
        Navigation({})
      } else if (this.targetView == 'NavRouter') {
        
      } else if (this.targetView == 'Stepper') {
        Stepper() {
          StepperItem()
        }
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem()
        }
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
      } else if (this.targetView == 'QRCode') {
        QRCode(this.src)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true)
          
          .backgroundColor(Color.Red)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 })
          
      } else if (this.targetView == 'RichText') {
        RichText('RichText')
          
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(10)
            .height(50)
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
        }).showTips(true)
      } else if (this.targetView == 'TextArea') {
        TextArea({
          placeholder: 'The text area can hold an unlimited amount of text. input your word...'
        }).placeholderFont({ size: 16, weight: 400 })
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 }).format('hms')
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
        .height(40)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value })
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 }).format('mm:ss.SS')
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime,
        }).useMilitaryTime(true)
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
          
      } else if (this.targetView == 'Polyline') {
        Polyline()
          
          .points([
            [20, 0], [0, 100], [100, 90]
            
          ])
      } else if (this.targetView == 'Polygon') {
        Polygon()
          
          .height(100)
          .points([
            [0, 0], [0, 100], [100, 100], [100, 0]
            
          ])
      } else if (this.targetView == 'Path') {
        Path()
      } else if (this.targetView == 'Rect') {
        Rect()
          
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow)
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