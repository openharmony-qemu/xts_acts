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
import { Entry, Component, Column, Scroller, Row, /*WebController,*/ TextTimerController } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router';
import { AlphabetIndexer, Blank, Button, Checkbox, CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator, LoadingProgress, Marquee,
  Menu, Navigation, Progress, QRCode, Radio, Rating, RichText, ScrollBar, Search, Select, Slider, Stepper, Text,
  TextArea, TextClock, TextInput, TextPicker, TextTimer, TimePicker, Toggle, Web, Badge, ColumnSplit, Counter, Flex, WaterFlow, GridRow,
  Grid, List, Refresh, RelativeContainer, RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, Circle,
  Ellipse, Line, Polyline, Polygon, Path, Rect, Shape, Color, $r, MenuItem, MenuItemGroup, StepperItem, ToggleType, TextAlign, FlowItem, GridCol, GridItem,
  ListItem, ListItemGroup, SideBarContainerType, NavPathStack, TabContent, MenuItemOptions, BadgeParam, BadgeStyle, BadgeParamWithString } from '@ohos.arkui.component'

@Entry
@Component
struct DefaultPage {
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? ''
  @State targetGroupView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetGroupView ?? ''
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  private Marquee_src: string = 'Running Marquee starts rolling A B C D E F G H I J K L'; //Use by Marquee QRCode
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller() //Use by ScrollBar Scroll

  onPageShow() {
    console.info('DefaultPage show called ')
  }


  //Draw screen
  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 as int })
      } else if (this.targetView == 'Blank') {
        Blank()
      } else if (this.targetView == 'Button') {
        Button('button')
      } else if (this.targetView == 'Checkbox') {
        Checkbox()
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup()
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: [25] })
      } else if (this.targetView == 'DatePicker') {
        DatePicker()
      } else if (this.targetView == 'Divider') {
        Divider()
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 75 })
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          src: this.Marquee_src
        })
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
      } else if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }) {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          }
        }
      } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack())
      } else if (this.targetView == 'NavRouter') {
        
      } else if (this.targetView == 'Progress') {
        Progress({ value: 20 })
      } else if (this.targetView == 'QRCode') {
        QRCode(this.Marquee_src)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
      } else if (this.targetView == 'Rating') {
        Rating()
      } else if (this.targetView == 'RichText') {
        RichText('RichText')
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: this.scroller })
      } else if (this.targetView == 'Search') {
        Search()
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }])
      } else if (this.targetView == 'Slider') {
        Slider()
      } else if (this.targetView == 'Stepper') {
        Stepper() {
          StepperItem()
        }
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem()
        }
      } else if (this.targetView == 'Text') {
        Text('text')
      } else if (this.targetView == 'TextArea') {
        TextArea()
      } else if (this.targetView == 'TextClock') {
        TextClock()
      } else if (this.targetView == 'TextInput') {
        TextInput()
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value })
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ controller: this.textTimerController })
      } else if (this.targetView == 'TimePicker') {
        TimePicker()
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch })
      } else if (this.targetView == 'Web') {
        
      } else if (this.targetView == 'Badge') {
        Badge({
          value: '',
          style: { badgeSize: 6, badgeColor: '#FA2A2D' } as BadgeStyle
        } as BadgeParamWithString)
      } else if (this.targetView == 'Column') {
        Column()
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
          Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }
      } else if (this.targetView == 'Counter') {
        Counter()
      } else if (this.targetView == 'Flex') {
        Flex()
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem()
        }
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol()
        }
      } else if (this.targetView == 'GridRow') {
        GridRow()
      } else if (this.targetView == 'Grid') {
        Grid()
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem()
        }
      } else if (this.targetView == 'List') {
        List().width(100).height(100)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem()
            
        }.width(100).height(100)
      } else if (this.targetView == 'ListItemGroup') {
        List() {
          ListItemGroup()
            
        }.width(100).height(100)
      } else if (this.targetView == 'Navigator') {
      } else if (this.targetView == 'Panel') {
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false })
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer()
      } else if (this.targetView == 'Row') {
        Row()
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1')
          Text('2')
        }
      } else if (this.targetView == 'Scroll') {
        Scroll(this.scroller)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed)
      } else if (this.targetView == 'Stack') {
        Stack()
      } else if (this.targetView == 'Swiper') {
        Swiper()
      } else if (this.targetView == 'Tabs') {
        Tabs()
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent()
        }
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow()
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
      } else if (this.targetView == 'Polygon') {
        Polygon()
      } else if (this.targetView == 'Path') {
        Path()
      } else if (this.targetView == 'Rect') {
        Rect()
      } else if (this.targetView == 'Shape') {
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
  }
}