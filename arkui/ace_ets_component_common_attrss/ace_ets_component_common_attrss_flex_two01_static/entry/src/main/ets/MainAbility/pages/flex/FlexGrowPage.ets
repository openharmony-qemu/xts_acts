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
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Scroll,
  Flex,
  FlexDirection,
  FlexAlign,
  TextAlign,
  FontWeight,
  AlphabetIndexer,
  Checkbox,
  CheckboxGroup,
  DataPanel,
  DatePicker,
  Divider,
  Gauge,
  Image,
  ImageAnimator,
  LoadingProgress,
  Marquee,
  Menu,
  Progress,
  QRCode,
  Radio,
  Rating,
  ScrollBar,
  Stepper,
  Search,
  Select,
  Slider,
  Text,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
  TextTimer,
  TimePicker,
  Toggle,
  Badge,
  Counter,
  Flex,
  GridRow,
  Grid,
  List,
  RelativeContainer,
  Row,
  Refresh,
  Scroll,
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
  GridCol,
  AlphabetIndexer,
  HorizontalAlign,
  Color,
  Builder,
  DataPanelType,
  $r,
  MenuItem,
  ProgressType,
  BarState,
  StepperItem,
  Scroller,
  Axis,
  ToggleType,
  GridRowDirection,
  GridItem,
  ListItem,
  SliderStyle,
  SideBarContainerType,
  TabContent,
  FlowItem,
  ImageFit,
  MenuItemOptions,
  AlignRuleParam,
  VerticalAlign,
  AlignRuleParam,
  AlignRuleOption,
  // Point,
  GridColColumnOption,
  GridColOptions,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
import router from '@ohos.router'
import { attrsManager, GrowValue } from '../../common/AttrsManager';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import inspector from '@ohos.arkui.inspector';

class View {
  targetView: string = '';
  componentKey: string = '';
  containerView: string = '';
  compareWidth: number = 0;
  compareHeight: number = 0;
  standardWidth: number = 0;
  standardHeight: number = 0;
  compareComponentKey: string = '';
  standardComponentKey: string = '';
  targetWidth: number = 0;
  targetHeight: number = 0;
}

class RouterParams {
  view: View = new View()
}

@Entry
@Component
struct FlexGrowPage {
  @State _flexGrow: number = 2
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey
  @State containerView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.containerView
  @State _parentWidth: number = 500
  @State _parentHeight: number = 500
  @State compareWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.compareWidth
  @State compareHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.compareHeight
  @State standardWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.standardWidth
  @State standardHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.standardHeight
  @State compareComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.compareComponentKey
  @State standardComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.standardComponentKey
  @State targetWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetWidth
  @State targetHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetHeight
  @State _compareFlexGrow: number = 1

  onPageShow() {
    console.info('[FlexGrow] page show called')
    attrsManager.registerDataChange((value: GrowValue) => {
      if (value.flexGrow) {
        this._flexGrow = value.flexGrow
      }
      if (value.parentWidth) {
        this._parentWidth = value.parentWidth
      }
      if (value.parentHeight) {
        this._parentHeight = value.parentHeight
      }
      if (value.compareFlexGrow) {
        this._compareFlexGrow = value.compareFlexGrow
      }
    })
  }

  // @Styles commonStyle(){
  //   .margin(0)
  //   .flexGrow(this._flexGrow)
  //   .width(this.targetWidth)
  //   .height(this.targetHeight)
  //   .backgroundColor(Color.White)
  //   .key(this.componentKey)
  // }

  @Builder buildTargetView() {
    if (this.targetView == 'AlphabetIndexer') {
      AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
    } else if (this.targetView == 'Button') {
      Button('button1')
    } else if (this.targetView == 'Checkbox') {
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
    } else if (this.targetView == 'CheckboxGroup') {
      CheckboxGroup({ group: 'checkboxGroup' })
    } else if (this.targetView == 'DataPanel') {
      DataPanel({ values: [25], max: 100, type: DataPanelType.Circle })
    } else if (this.targetView == 'DatePicker') {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: new Date()
      })
    } else if (this.targetView == 'Divider') {
      Divider().strokeWidth(8).vertical(true)
    } else if (this.targetView == 'Gauge') {
      Gauge({ value: 75 }).colors([[Color.White, 1], [Color.Black, 1]])
    } else if (this.targetView == 'Image') {
      Image($r('app.media.icon'))
    } else if (this.targetView == 'ImageAnimator') {
      ImageAnimator().images([{ src: $r('app.media.icon') }])
    } else if (this.targetView == 'LoadingProgress') {
      LoadingProgress().color(Color.Blue)
    } else if (this.targetView == 'Marquee') {
      Marquee({ start: true, step: 50, src: 'Running Marquee starts rolling' })
        .fontWeight(700).fontColor(Color.White).fontSize(48)
    } else if (this.targetView == 'Menu') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
      }
    }
    // else if (this.targetView == 'Navigation') {
    //   Navigation()
    // } else if (this.targetView == 'NavRouter') {
    //   NavRouter() {
    //     Row() {
    //       Image($r('app.media.icon'))
    //     }
    //
    //     NavDestination() {
    //       Text('NavDestination').fontSize(10)
    //     }
    //   }
    // }
    else if (this.targetView == 'Progress') {
      Progress({ value: 50, type: ProgressType.Linear })
    } else if (this.targetView == 'QRCode') {
      QRCode('QRCode').color(0xF7CE00)
    } else if (this.targetView == 'Radio') {
      Radio({ value: 'Radio1', group: 'radioGroup' })
    } else if (this.targetView == 'Rating') {
      Rating({ rating: 4 }).stars(5)
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
        Text().width(20).height(20).borderRadius(10)
      }.width(20)
    } else if (this.targetView == 'Stepper') {
      Stepper() {
        StepperItem() {
          Column() {
            Text('Page One')
          }
        }
      }
    } else if (this.targetView == 'Search') {
      Search({ placeholder: 'Type to search...' })
        .searchButton('SEARCH')
        
    } else if (this.targetView == 'Select') {
      Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
        { value: 'bbb', icon: '/common/public_icon.svg' }])
    } else if (this.targetView == 'Slider') {
      Slider({ value: 50, style: SliderStyle.OutSet, direction: Axis.Vertical })
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        
    } else if (this.targetView == 'Text') {
      Text('text').fontColor(Color.White).fontSize(30)
    } else if (this.targetView == 'TextArea') {
      TextArea({ placeholder: 'TextArea', })
    } else if (this.targetView == 'TextClock') {
      TextClock({ timeZoneOffset: -8 }).format('hms')
    } else if (this.targetView == 'TextInput') {
      TextInput({ placeholder: 'TextInput' })
    } else if (this.targetView == 'TextPicker') {
      TextPicker({ range: ['apple1', 'orange2', 'peach3'], selected: 1 })
    } else if (this.targetView == 'TextTimer') {
      TextTimer({ count: 30000 })
    } else if (this.targetView == 'TimePicker') {
      TimePicker()
    } else if (this.targetView == 'Toggle') {
      Toggle({ type: ToggleType.Switch })
    } else if (this.targetView == 'Badge') {
      // Badge({
      //   value: '',
      //   style: { badgeSize: 6, badgeColor: Color.Red }
      // }) {
      //   Button('BadgeContent')
      // }
    } else if (this.targetView == 'Column') {
      Column()
    } else if (this.targetView == 'Counter') {
      Counter() {
        Text('1')
      }
    } else if (this.targetView == 'Flex') {
      Flex()
    } else if (this.targetView == 'GridRow') {
      GridRow({
        columns: 5,
        direction: GridRowDirection.Row
      }) {

        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption } as GridColOptions) {
          Row().width('100%').height('20vp')
        }
      }
    } else if (this.targetView == 'Grid') {
      Grid() {
        GridItem() {
          Text()
            .width('100%').height('100%').textAlign(TextAlign.Center)
        }
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      
    } else if (this.targetView == 'List') {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('')
            .width('100%')
            .textAlign(TextAlign.Center)
        }
      }
      .listDirection(Axis.Vertical)
      
    }
    // else if (this.targetView == 'Navigator') {
    //   Navigator({ target: 'MainAbility/pages/index/Index' }) {
    //     Text('Navigator Go to index page')
    //       .width('100%').textAlign(TextAlign.Center)
    //   }
    // }
    else if (this.targetView == 'RelativeContainer') {
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top } as AlignRuleParam<VerticalAlign>,
            left: { anchor: '__container__', align: HorizontalAlign.Start } as AlignRuleParam<HorizontalAlign>
          } as AlignRuleOption)
      }
    } else if (this.targetView == 'Row') {
      Row()
    } 
    else if (this.targetView == 'Panel') {
      // Panel(true) {
      //   Column() {
      //     Text('Panel')
      //   }
      // }
      // .mode(PanelMode.Half)

    }
    else if (this.targetView == 'Refresh') {
      Refresh({ refreshing: true }) {
        Text('Refresh').fontSize(30)
      }
      
    } else if (this.targetView == 'Scroll') {
      Scroll() {
        Column() {
          Text('Scroll')
            .width('90%')
            .height(10)
            .textAlign(TextAlign.Center)
        }.width('100%')
      }
      .scrollBar(BarState.On)
      
    } else if (this.targetView == 'SideBarContainer') {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Column() {
            Image($r('app.media.icon')).width(64).height(64)
            Text('Index0').fontSize(25)
          }
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)

        Column() {
          Text('SideBarContainer content').fontSize(25)
        }
      }
    } else if (this.targetView == 'Stack') {
      Stack() {
        Text('Stack').fontColor(Color.White)
      }
    } else if (this.targetView == 'Swiper') {
      Swiper() {
        Text('Swiper').width('90%').height(160)
      }
    } else if (this.targetView == 'Tabs') {
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }
      }
    } else if (this.targetView == 'WaterFlow') {
      WaterFlow() {
        FlowItem() {
          Column() {
            Text('WaterFlow').fontSize(12).height('16')
            Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
          }
        }
      }
    } else if (this.targetView == 'Circle') {
      Circle({ width: 150, height: 150 })
    } else if (this.targetView == 'Ellipse') {
      Ellipse({ width: 150, height: 80 })
    } else if (this.targetView == 'Line') {
      Line()
        .startPoint([0, 0])
        .endPoint([50, 100])
        .stroke(Color.Black)
        
    } else if (this.targetView == 'Polyline') {
      Polyline({ width: 100, height: 100 })
        .points([[0, 0], [20, 60], [100, 100]])
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)
        
    } else if (this.targetView == 'Polygon') {
      Polygon()
        .points([[50, 0], [0, 50], [20, 100], [80, 100], [100, 50]])
        .fill(Color.Red)
        .fillOpacity(0.6)
        
    } else if (this.targetView == 'Path') {
      Path()
        .commands('M0 100 A30 20 20 0 0 200 100 Z')
        .fillOpacity(0)
        .stroke(Color.Black)
        .strokeWidth(3)
        
    } else if (this.targetView == 'Rect') {
      Rect()
        .radius(20)
        .fill(Color.Pink)
        .stroke(Color.Transparent)
        
    } else if (this.targetView == 'Shape') {
      // Shape() {
      //   Path().width(20).height(20).commands('M0 0 L400 0 L400 150 Z')
      // }
      // .viewPort({ x: -20, y: -5, width: 310, height: 90 })
      // .fill(0x317AF7)
      // .stroke(0xEE8443)
      // .strokeWidth(10)
      // .strokeLineJoin(LineJoinStyle.Miter)
      // .strokeMiterLimit(5)
      
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(20).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }
      
      .borderWidth(1)
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
      }
    } else if (this.targetView == 'Blank') {
      Blank()
    }
  }

  build() {
    Column() {
      if (this.targetView == 'GridCol') {
        GridRow({ columns: 3 }) {
          GridCol({ span: 1 }) {
            Row().width('100%').height('20vp')
          }.width(this.standardWidth).height(this.standardHeight).key(this.standardComponentKey)

          GridCol({ span: 1 }) {
            Row().width('100%').height('20vp')
          }.width(this.compareWidth).height(this.compareHeight).key(this.compareComponentKey)
          .flexGrow(this._compareFlexGrow)

          GridCol({ span: 1 }) {
            Row().width('100%').height('20vp')
          }
        }
        .width(this._parentWidth)
        .height(this._parentHeight)
        .backgroundColor(Color.Green)
      } else {
        //For different parent Component
        if (this.containerView == 'Row') {
          Row() {
            Button('button1').width(this.standardWidth).height(this.standardHeight).key(this.standardComponentKey)
            Button('button2').width(this.compareWidth).height(this.compareHeight).key(this.compareComponentKey)
              .flexGrow(this._compareFlexGrow)
            this.buildTargetView();
          }
          .width(this._parentWidth)
          .height(this._parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'Column') {
          Column() {
            Button('button1').width(this.standardWidth).height(this.standardHeight).key(this.standardComponentKey)
            Button('button2').width(this.compareWidth).height(this.compareHeight).key(this.compareComponentKey)
              .flexGrow(this._compareFlexGrow)
            this.buildTargetView();
          }
          .width(this._parentWidth)
          .height(this._parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexRow') {
          Flex({ direction: FlexDirection.Row }) {
            Button('button1').width(this.standardWidth).height(this.standardHeight).key(this.standardComponentKey)
            Button('button2').width(this.compareWidth).height(this.compareHeight).key(this.compareComponentKey)
              .flexGrow(this._compareFlexGrow)
            this.buildTargetView();
          }
          .width(this._parentWidth)
          .height(this._parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexRowReverse') {
          Flex({ direction: FlexDirection.RowReverse }) {
            Button('button1').width(this.standardWidth).height(this.standardHeight).key(this.standardComponentKey)
            Button('button2').width(this.compareWidth).height(this.compareHeight).key(this.compareComponentKey)
              .flexGrow(this._compareFlexGrow)
            this.buildTargetView();
          }
          .width(this._parentWidth)
          .height(this._parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexColumn') {
          Flex({ direction: FlexDirection.Column }) {
            Button('button1').width(this.standardWidth).height(this.standardHeight).key(this.standardComponentKey)
            Button('button2').width(this.compareWidth).height(this.compareHeight).key(this.compareComponentKey)
              .flexGrow(this._compareFlexGrow)
            this.buildTargetView();
          }
          .width(this._parentWidth)
          .height(this._parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexColumnReverse') {
          Flex({ direction: FlexDirection.ColumnReverse }) {
            Button('button1').width(this.standardWidth).height(this.standardHeight).key(this.standardComponentKey)
            Button('button2').width(this.compareWidth).height(this.compareHeight).key(this.compareComponentKey)
              .flexGrow(this._compareFlexGrow)
            this.buildTargetView();
          }
          .width(this._parentWidth)
          .height(this._parentHeight)
          .backgroundColor(Color.Green)
        }
      }
    }.backgroundColor(Color.Yellow).width('100%').height('100%').alignItems(HorizontalAlign.Start)
  }
}