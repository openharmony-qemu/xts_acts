/**
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
import { Entry,Builder,Component,Scroller,GridRow,Scroll,BreakpointsReference,GridRowDirection,GridCol,GridItem,Grid,List,Video,Image,BarPosition,ButtonAttribute,Resource,$r,FlexAlign,Divider,Tabs,TabContent,TabsController,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef
} from '@ohos.arkui.stateManagement';












@Entry
@Component
struct GridColExample {
  @State bgColors: Color[] = new Array<Color>(Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown)
  
  
  
  

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        
      }).key("changeButton")

      Column() {
        GridRow({
          columns: 3,
          gutter: { x: 5, y: 10 },
          breakpoints: { value: ["400vp", "600vp", "800vp"],
            reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {
          ForEach(this.bgColors, (color: Color) => {
            GridCol() {
              Row().width("100%").height("20vp")
            }
            .borderColor(color)
            .borderWidth(2)
            .backgroundColor(color)
            
            .key('gridCol')
          })
        }.width("100%").height("100%");
      }
      .margin({ top: 5 } as Margin)
    }
  }
}