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
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router';
import { Entry, Component, TextTimerController, Scroller, Row, MenuItemOptions, AlphabetIndexer, Button, Checkbox,
  CheckboxGroup, DatePicker, Image, ImageAnimator, Menu, Radio, Rating, Search, Select, Slider, Stepper, Text,
  TextArea, TextInput, TextPicker, TimePicker, Toggle, Column, ColumnSplit, Counter, Flex, GridRow, Grid, List,
  RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, Color, $r, MenuItem, MenuItemGroup, StepperItem,
  ToggleType, TextAlign, GridCol, GridItem, ListItem, ListItemGroup, SideBarContainerType, ForEach, TabContent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct DefaultFocusValuePage {
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? ''
  @State targetGroupView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetGroupView ?? ''
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller() //Use by Scroll

  onPageShow() {
    console.info('DefaultFocusValuePage show called ')
  }


  //Draw screen
  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 as int })
      } else if (this.targetView == 'Button') {
        Button('button')
      } else if (this.targetView == 'Checkbox') {
        Checkbox()
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup()
      } else if (this.targetView == 'DatePicker') {
        DatePicker()
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          
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
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
      } else if (this.targetView == 'Rating') {
        Rating()
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
      } else if (this.targetView == 'TextInput') {
        TextInput()
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value })
      } else if (this.targetView == 'TimePicker') {
        TimePicker()
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch })
      } else if (this.targetView == 'Web') {
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
          ListItem() {
            Text('ListItem')
          }
            
        }.width(100).height(100)
      } else if (this.targetView == 'ListItemGroup') {
        List() {
          ListItemGroup()
            
        }.width(100).height(100)
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
        Swiper() {
          ForEach([1, 2, 3], (item: Int, index: int) => {
            Text('Swiper' + item)
          }, (item: Int, index: int) => String(item))
        }
        .indicator(true)
        .backgroundColor(Color.Pink)
        
      } else if (this.targetView == 'Tabs') {
        Tabs()
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent()
        }
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
  }
}