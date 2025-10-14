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
import { attrsManager } from '../../common/AttrsManager';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import { StepperView } from '../../view/alignRules/StepperView';
import {
  Entry,
  Component,
  Text,
  AlphabetIndexer,
  Checkbox,
  CheckboxGroup,
  DataPanel,
  DatePicker,
  Divider,
  Gauge,
  ImageAnimator,
  LoadingProgress,
  Marquee,
  Menu,
  Navigation,
  Progress,
  QRCode,
  Radio,
  Rating,
  ScrollBar,
  Stepper,
  Select,
  Slider,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
  TextTimer,
  TimePicker,
  Toggle,
  Badge,
  Counter,
  GridRow,
  Grid,
  List,
  RelativeContainer,
  Row,
  Refresh,
  TextAlign,
  SideBarContainer,
  Stack,
  Swiper,
  Tabs,
  WaterFlow,
  Circle,
  Ellipse,
  Line,
  Polyline,
  Polygon,
  Path,
  Rect,
  Shape,
  ColumnSplit,
  RowSplit,
  Blank,
  Builder,
  Button,
  DataPanelType,
  Color,
  Image,
  MenuItem,
  ProgressType,
  BarState,
  StepperItem,
  Search,
  SliderStyle,
  Axis,
  ToggleType,
  Column,
  Flex,
  GridRowDirection,
  GridCol,
  GridItem,
  ListItem,
  Scroll,
  SideBarContainerType,
  TabContent,
  FlowItem,
  $r,
  MenuItemOptions,
  Scroller,
  BadgeParamWithNumber,
  BadgeStyle,
  GridColOptions,
  GridColColumnOption,
  AlignRuleOption,

  VerticalAlign,
  HorizontalAlign,
  ColumnOptions,
  FlexAlign,
  ImageFit,
  Position,
  PolylineOptions,
  RectOptions,
  FlexDirection,
  Padding,
  Web,
  WebviewController,
  RichText,
  MenuItemGroup,
  GridRowOptions,
  GutterOption,
  RefreshOptions,
  ForEach,
  BreakpointsReference,
  BreakPoints,
  ListOptions,
  ListItemGroup,
  ProgressOptions,
  CircleOptions,

  EllipseOptions,
  ScrollBarOptions,
  Rectangle,
  TimePickerOptions,
  TextTimerOptions,
  TextPickerOptions,
  TextInputOptions,
  TextAreaOptions,
  MenuItemGroupOptions,
  CheckboxOptions,
  DatePickerOptions,
  RadioOptions,
  SelectOption,
  FlexOptions,
  Margin
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';


/**
 * Test page of common attribute:alignRules
 */
@Entry
@Component
struct FocusControlPage {
  private scroller: Scroller = new Scroller() 
  private arr: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] as Array<number> 
  @State _focusable: boolean = true;
  @State callback: string = '';
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey
  @State referenceComponentKey: string =
    (this.getUIContext().getRouter().getParams() as RouterParams).view.referenceComponentKey

  onPageShow() {
    console.info('[FocusControlPage] page show called ');

    
    attrsManager.registerDataChange((value: boolean) => {
      this._focusable = value;
    })
  }

  /**
   * Set common style.
   */
  
  
  
  
  
  
  

  build() {
    Column() {
      Button(this.callback)
        .key(this.referenceComponentKey)
        .width('100%')
        .height(100)
        .fontSize(30)
        .fontColor(Color.Blue)
        .onFocus(() => {
          console.info('[FocusControlPage] referenceComponent onFocus called');
        })
      if (this.targetView == 'Button') {
        Button('Button').width(200).height(100) 
      } else if (this.targetView == 'TextInput') {
        TextInput().width(200).height(100) 
      } else if (this.targetView == 'TextArea') {
        TextArea().width(200).height(100) 
      } else if (this.targetView == 'Search') {
        Search().width(200).height(100) 
      } else if (this.targetView == 'Text') {
        Text('Text').width(200).height(100) 
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon')).width(200).height(100) 
      } else if (this.targetView == 'List') {
        List() {
          ListItem() {
            Text('item1')
              .focusable(true)
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          }
        }.width(200).height(100).backgroundColor(Color.Blue) 
      } else if (this.targetView == 'Grid') {
        Grid() {
          GridItem() {
            Text('day')
              .backgroundColor(Color.White)
              .focusable(true)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
        }
        .width(200).height(100) 
      } else if (this.targetView == 'Checkbox') {
        Checkbox({ name: 'checkbox1' } as CheckboxOptions).width(200).height(100) 
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup().width(200).height(100) 
      } else if (this.targetView == 'DatePicker') {
        DatePicker({} as DatePickerOptions).width(200).height(100) 
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .backgroundColor(Color.Blue).width(200).height(300)
        
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow).width(200)
        .height(300) 
      } else if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            .width(200).height(300) 
        }.backgroundColor(Color.Yellow).width(200).height(300)
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }) {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          }.width(200).height(300) 
        }.backgroundColor(Color.Yellow).width(200).height(300)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' } as RadioOptions)
          .width(200)
          .height(300)
        
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 })
          .width(200)
          .height(300)
        
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
          { value: 'bbb', icon: '/common/public_icon.svg' }] as Array<SelectOption>)
          .width(200)
          .height(300)
        
      } else if (this.targetView == 'Slider') {
        Slider()
          .width(200)
          .height(300)
        
      } else if (this.targetView == 'Stepper') {
        Stepper() {
          StepperItem() {
            Column() {
              Text('Page One').focusable(true)
            }
          }
        } 
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem() {
            Column() {
              Text('Page One').focusable(true)
            }
          }
          
          .backgroundColor(Color.Red)
          .width('100%')
          .height('100%')
        }.backgroundColor(Color.Yellow).width(200).height(100)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['apple1', 'orange2', 'peach3', 'grape4'] } as TextPickerOptions)
          .width(200)
          .height(300)
        
      } else if (this.targetView == 'TimePicker') {
        TimePicker().width(200).height(300) 
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch }).width(200).height(300)
        
      } else if (this.targetView == 'Web') {
        Web({ src: '', controller: new WebviewController() }) 
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['A', 'B', 'C', 'D'], selected: 0 })
          .width(200)
          .height(300)
        
      } else if (this.targetView == 'Column') {
        Column() {
          Button('Button')
        }
        .width(200)
        .height(300)

        
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1')
            .width('10%')
            .height(100)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
            .focusable(true)
          Text('2')
            .width('10%')
            .height(100)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
            .focusable(true)
        }.width(200).height(300) 
      } else if (this.targetView == 'Counter') {
        Counter() {
          Button('Button')
        }
        .width(200)
        .height(300)

        
      } else if (this.targetView == 'Flex') {
        Flex() {
          Button('Button')
        }
        .width(200)
        .height(300)

        
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        } as GridRowOptions) {
          GridCol() {
            Row() {
              Button('Button')
            }.width('100%').height('20vp')
          }
          
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }.width(200).height(200).backgroundColor(Color.Pink)
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
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue,],
            (color: Color) => {
              GridCol({
                span: {
                  xs: 1,
                  sm: 2,
                  md: 3,
                  lg: 4
                } as GridColColumnOption
              } as GridColOptions) {
                Row() {
                  Button('Button')
                }.width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
        } 
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('GridItem1')
              .backgroundColor(Color.White)
              .focusable(true)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }.width(200).height(300) 
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .backgroundColor(Color.Black)
        .width(200)
        .height(300)
      } else if (this.targetView == 'ListItem') {
        List({ space: 0, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .focusable(true)
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
          } 
        }.width(200).height(300).listDirection(Axis.Vertical)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup() {
            ListItem() {
              Text('item1')
                .focusable(true)
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }
          }.backgroundColor(Color.Yellow) 
        }
        .backgroundColor(Color.Pink)
        .width(300)
        .height(400)
        .listDirection(Axis.Vertical)
      } else if (this.targetView == 'Row') {
        Row() {
          Button('Button')
        }
        .backgroundColor(Color.Blue).width(200).height(300) 
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1')
            .width('10%')
            .height(100)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
            .focusable(true)
          Text('2')
            .width('10%')
            .height(100)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
            .focusable(true)
        }.width(200).height(300) 
      } else if (this.targetView == 'Scroll') {
        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column } as FlexOptions) {
            ForEach(this.arr, (item: number) => {
              Row() {
                Text(item + '')
                  .width(80)
                  .height(20)
                  .backgroundColor('#3366CC')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 } as Margin)
                  .focusable(true)
              }
            }, (item: number) => item + '')
          }.margin({ right: 15 } as Margin)
        }.width(200).height(300) 
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3], (item: Int, index: int) => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon')).width(64).height(64).focusable(true)
                Text('Index0' + item).fontSize(25).focusable(true)
              }
            })
          }.width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content').fontSize(25)
          }.backgroundColor(Color.Orange)
        }.width(200).height(300) 
      } else if (this.targetView == 'Stack') {
        Stack() {
          Button('Button')
        }
        .backgroundColor(Color.Blue).width(200).height(300) 
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3], (item: Int, index: int) => {
            Text('Swiper' + item).width('90%').height(160).focusable(true)
          }, (item: Int, index: int) => item + '')
        }
        .indicator(true)
        .backgroundColor(Color.White)
        .width(200)
        .height(300)

        
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White).focusable(true)
          }.tabBar('Tabs1')
        }.backgroundColor(Color.Blue).width(200).height(300) 
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White).focusable(true)
          }.tabBar('Tabs1') 
        }.width(200).height(300)
      }
    }
    .width('100%')
    .height('100%')
  }
}
