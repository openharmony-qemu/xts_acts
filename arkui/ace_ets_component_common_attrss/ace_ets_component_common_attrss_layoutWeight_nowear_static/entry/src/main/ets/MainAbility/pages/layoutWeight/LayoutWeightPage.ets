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
  BadgeParamWithNumber,
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
  ToggleType,
  TimePicker,
  WebviewController,
  StepperItem,
  SliderStyle,
  FlexDirection,
  ProgressType,
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
import { SetValue } from '../../common/Utils'
import { RouterParams } from '../../common/Utils';

@Entry
@Component
struct LayoutWeightPage {
  @State _layoutWeight: number = 0;
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView;
  @State targetGroupView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetGroupView;
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  @State childWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.childWidth;
  @State childHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.childHeight;
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;

  onPageShow() {
    console.info('LayoutWeight page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
      this._layoutWeight = value.layoutWeight as number
    })
  }

  
  commonStyle() {
    
    
    
    
  }

  
  sizeProperty() {
    
    
    
  }

  build() {
    Row() {
      Column() {
        if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          

        } else if (this.targetView == 'Text') {
          Text('text1')
          

        } else if (this.targetView == 'Blank') {
          Blank().color(Color.Red)
          

        } else if (this.targetView == 'Button') {
          Button('button1')
          

        } else if (this.targetView == 'Checkbox') {
          Checkbox().select(true).selectedColor(Color.Red).margin(0)
          

        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).selectedColor('#ffcd175f').margin(0)
          

        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10], max: 100, type: DataPanelType.Line })
          

        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          })
          

        } else if (this.targetView == 'Divider') {
          Text('1')
          

        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon'))
          

        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator().images([{ src: $r('app.media.icon') }])
          

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
          

        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow)

          

        } else if (this.targetView == 'Navigation') {
          
          
          

        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
          

        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
          

        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
          

        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).margin(0)
          

        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
          

        } else if (this.targetView == 'RichText') {
          RichText('RichText')
          

        } else if (this.targetView == 'ScrollBar') {
          Scroll(new Scroller()) {
            Flex({ direction: FlexDirection.Column }) {
              ForEach(new Array<number>(5, 10, 10, 7, 9, 10, 10, 10, 10), (item: number) => {
                Row() {
                  Text(String(item))
                }
              }, (item: number) => String(item))
            }
          }.scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)

          

        } else if (this.targetView == 'Search') {
          Search({ placeholder: 'Type to search...' })
            .backgroundColor(Color.White)
            .searchButton('SEARCH')
            .margin(0)

          

        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
            { value: 'bbb', icon: '/common/public_icon.svg' }])
          

        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          }).showTips(true)
          

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
          

        } else if (this.targetView == 'TextInput') {
          TextInput({ placeholder: 'input your word...' })
          

        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          

        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')

          

        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00')
          }).useMilitaryTime(true)
          

        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false }).margin(0)
          

        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          

        } else if (this.targetView == 'Circle') {
          Circle()
          

        } else if (this.targetView == 'Ellipse') {
          Ellipse()
          

        } else if (this.targetView == 'Line') {
          Line()
            .backgroundColor(Color.Pink)
            .startPoint([0, 0])
            .endPoint([50, 100])

          

        } else if (this.targetView == 'Polyline') {
          Polyline().points([[20, 0], [0, 100], [100, 90]])
          

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
            count: 1,
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
          }

          

        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
            Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
            Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
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
            ForEach(new Array<Color>(Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey,
              Color.Blue, Color.Brown), (color: Color) => {
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
            ForEach(new Array<string>('0', '1', '2', '3', '4'), (item: string) => {
              ForEach(new Array<string>('0', '1', '2', '3', '4'), (day: string) => {
                GridItem() {
                  Text(day).backgroundColor(Color.White)
                    .width('100%').height('100%').textAlign(TextAlign.Center)
                }
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')

          

          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }

          

        } else if (this.targetView == 'Navigator') {
          
          
          
          
          
        }
        
        
        
        
        

        
        else if (this.targetView == 'Refresh') {
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
              } as AlignRuleOption)
              .id('layoutWeight')
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
          }.indicator(true).backgroundColor(Color.White)

          

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
        Button('button')
        
      }
      .width(this.parentWidth as number)
      .height(this.parentHeight as number)
    }
    .backgroundColor(Color.Yellow)
  }
}