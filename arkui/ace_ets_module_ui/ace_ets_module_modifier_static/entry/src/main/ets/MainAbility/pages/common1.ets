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
import { Entry,Builder,Component,Scroller,GridRow,Scroll,ButtonType,BreakpointsReference,GridRowDirection,GridCol,GridItem,Grid,List,Video,Image,BarPosition,ButtonAttribute,Resource,$r,FlexAlign,Divider,Tabs,TabContent,TabsController,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef
} from '@ohos.arkui.stateManagement';
import { CommonModifier } from "@ohos.arkui.modifier";
import matrix4 from '@ohos.matrix4'
import UTD from '@ohos.data.uniformTypeDescriptor';










@Entry
@Component
struct Common1Example {

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  @State buttonTypeValue: ButtonType = ButtonType.Normal;

  build() {
    Column(){
      Button("change value").onClick((e: ClickEvent) => {
        
      }).key("changeButton")

      Text("Modifier自定义")
        
        .key("common1")

      Text("Modifier1自定义")
        
        .key("common2")

      Image($r('app.media.icon'))
        
        .key("common3")

      Button('testid', { type: this.buttonTypeValue, stateEffect: true })
        

      Button('testkey', { type: this.buttonTypeValue, stateEffect: true })
        

      Button('testbutton', { type: this.buttonTypeValue, stateEffect: true })
        
        .id("testbutton")

    }
  }
}
