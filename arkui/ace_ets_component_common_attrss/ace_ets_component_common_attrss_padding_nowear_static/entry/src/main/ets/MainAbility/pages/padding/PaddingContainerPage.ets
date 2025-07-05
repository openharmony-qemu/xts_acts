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
  Component,
  Text,
  AlphabetIndexer,Checkbox,CheckboxGroup,DataPanel,DatePicker,Divider,Gauge,ImageAnimator,LoadingProgress,Marquee,Menu,Navigation,
  Progress,QRCode,Radio,Rating,ScrollBar,Stepper,Select,Slider,TextArea,TextClock,TextInput,TextPicker,TextTimer,TimePicker,Toggle,Badge,
  Counter,GridRow,Grid,List,RelativeContainer,Row,Refresh,TextAlign,SideBarContainer,Stack,Swiper,Tabs,WaterFlow,
  Circle,Ellipse,Line,Polyline,Polygon,Path,Rect,Shape,ColumnSplit,RowSplit,Blank
,Builder,Button,DataPanelType,Color,Image,MenuItem,ProgressType,BarState,StepperItem,Search,SliderStyle,Axis,ToggleType,Column,Flex,GridRowDirection,GridCol
,GridItem,ListItem,Scroll,SideBarContainerType,TabContent,FlowItem,$r,MenuItemOptions,Scroller,BadgeParamWithNumber,BadgeStyle,GridColOptions,GridColColumnOption,
  AlignRuleOption,AlignRuleParam,VerticalAlign,HorizontalAlign,ColumnOptions,FlexAlign,ImageFit,Position,PolylineOptions,RectOptions,FlexDirection
,Padding,Web,WebviewController,RichText,MenuItemGroup,GridRowOptions,GutterOption,RefreshOptions,ForEach,BreakpointsReference,BreakPoints,ListOptions,
  ListItemGroup,AlphabetIndexerOptions,MenuItemGroupOptions
} from '@ohos.arkui.component'
import {
  State,
  // StateDecoratedVariable,
  MutableState,
  stateOf,
  observableProxy,
  AppStorage

} from '@ohos.arkui.stateManagement'
// import { NavRouter } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { Color,Padding } from '@ohos.arkui.component'



@Entry
@Component
struct paddingPage {
  //Use for Grid.
  public valueArr: Array<number> = [5, 10, 10, 7, 9, 10, 10, 10, 10] as Array<number>
  @State _padding: Padding = { left: 0, right: 0, top: 0, bottom: 0 } as Padding;
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey
  @State parentBackGroundColor: Color = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor
  @State referenceComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.referenceComponentKey

  onPageShow() {
    console.info('padding page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
      this._padding = value.padding as Padding
    })
  }


  // @Styles
  // commonStyle(){
  //   .padding(this._padding)
  //   .key(this.componentKey)
  // }

  build() {
    Row() {
      if (this.targetView == 'Badge') {
        Badge({
          count: 50,
          style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } as BadgeStyle
        } as BadgeParamWithNumber ) {
          Button('message')
            .backgroundColor(0x317aff)
        }//.commonStyle()
      } else if (this.targetView == 'Column') {
        Column() {
          Button('message').backgroundColor(0x317aff)
        }//.commonStyle()
      } else if (this.targetView == 'Counter') {
        Counter() {
          Text('1')
        }//.commonStyle()
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 } as GutterOption,
          direction: GridRowDirection.Row
        } as GridRowOptions) {
          GridCol({ span: 5 } as GridColOptions) {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
          }.width('100%').height('100%').key(this.referenceComponentKey)
        }//.commonStyle()
      } else if (this.targetView == 'Grid') {
        Grid() {
          GridItem() {
            Text('day')
              .backgroundColor(0xF9CF93)
              .textAlign(TextAlign.Center)
          }
        }//.commonStyle()
      } else if (this.targetView == 'List') {
        List() {
          ListItem() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
          }.width('100%').height('100%').key(this.referenceComponentKey)
        }//.commonStyle()
        .width('100%').height('100%')
      } else if (this.targetView == 'Panel') {
        // Panel(true) {
        //   Column() {
        //     Text('1').height('100%').width('100%')
        //   }.height('100%').width('100%').key(this.referenceComponentKey).backgroundColor(Color.Black)
        // }
        // .mode(PanelMode.Full)
        // //.commonStyle()
        // .dragBar(false)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false } as RefreshOptions) {
        }//.commonStyle()
      } else if (this.targetView == 'Row') {
        Row() {
          Button('message')
            .backgroundColor(0x317aff)
        }//.commonStyle()
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          Button('message')
            .backgroundColor(0x317aff)
        }//.commonStyle()
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach(new Array<number>(1, 2, 3), (item:number,index:number) => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon'))
                  .width(64)
                  .height(64)
                Text('Index0' + item)
                  .fontSize(25)
              }
            })
          }.width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content')
              .fontSize(25)
          }.backgroundColor(Color.Orange)
          .width('100%')
          .height('100%')
          .key(this.referenceComponentKey)
        }//.commonStyle()
      } else if (this.targetView == 'Stack') {
        Stack() {
          Button('message')
            .backgroundColor(0x317aff)
        }//.commonStyle()
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          Button('message')
            .backgroundColor(0x317aff)
        }//.commonStyle()
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Row()
              .height('100%')
              .width('100%')
              .backgroundColor('#FF3333')
          }
          .height('100%')
          .width('100%')
          .key(this.referenceComponentKey)
        }
        //.commonStyle()
        .height('50%')
        .width('50%')
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Row()
              .height('100%')
              .width('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }//.commonStyle()
        }.height('50%').width('50%')
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow() {
          FlowItem() {
          }.height('100%').width('100%').key(this.referenceComponentKey)
        }//.commonStyle()
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height('100%')
            .backgroundColor(0xF5DEB3).key(this.referenceComponentKey)
        }//.commonStyle()
      } else if (this.targetView == 'Flex') {
        Flex() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .key(this.referenceComponentKey)
        }//.commonStyle()
        .width('50%').height('50%')
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }//.commonStyle()
        }
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 } as GutterOption,
          breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize } as BreakPoints,
          direction: GridRowDirection.Row
        }) {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption } as GridColOptions) {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }//.commonStyle()
        }
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem()//.commonStyle()
        }
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 20 } as ListOptions) {
          ListItemGroup() {
            ListItem() {
              Row()
                .width('100%')
                .height('100%')
                .backgroundColor('#FF3333')
            }.width('100%').height('100%').key(this.referenceComponentKey)
          }//.commonStyle()
        }.width('100%').height('100%')
      } else if (this.targetView == 'Navigator') {
        // Navigator()//.commonStyle()
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .key(this.referenceComponentKey)
        }.height('50%')
        .width('50%')
        .backgroundColor(Color.Green)
        //.commonStyle()
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1')
            .width('100%')
            .height('100%')
            .backgroundColor(0xF5DEB3)
            .key(this.referenceComponentKey)
        }//.commonStyle()
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }
          //.commonStyle()
          .height('50%')
          .width('50%')
          .backgroundColor(Color.Green)
        }
        .width('100%')
        .height('100%')
      }
    }.backgroundColor(this.parentBackGroundColor)
  }
}