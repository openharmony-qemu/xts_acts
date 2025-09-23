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
import { Entry,Builder,Component,Scroller,Scroll,GridItem,Grid,List,Video,Image,BarPosition,ButtonAttribute,Resource,$r,FlexAlign,Divider,Tabs,TabContent,TabsController,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef
} from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Utils from '../common/Utils';

import { BusinessError, RecordData } from '@ohos.base';







@Entry
@Component
struct GridNestedScroll {
  scroller: Scroller = new Scroller()
  private numbers: String[] = new Array<string>('0', '1', '2', '3', '4', '5', '7', '8')
  
  
  
  
  
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0

  
  
  
  
  
  
  
  build() {
    Column() {
      Button("NestedScrollOptionsScroll click")
        .key('gridNestedScrollOptionsScrollTestButton')
        .onClick( (e: ClickEvent) => {
          console.info("Grid NestedScrollOptionsScroll  onClick start ");
          try {
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.parentScrollTime > 0 && this.selfScrollTime > 0,
                  "parentScrollTime": this.parentScrollTime,
                  "selfScrollTime": this.selfScrollTime
                } as Record<String, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 77001,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("Grid NestedScrollOptionsScroll start to emit action state");
              events_emitter.emit(backEvent, backData);
            } catch (err) {
              console.info("Grid NestedScrollOptionsScroll emit action state err: " + JSON.stringify(err));
            }
          } catch (error) {
            console.error(`Grid NestedScrollOptionsScroll ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
          }
          console.info("Grid NestedScrollOptionsScroll  onClick end ");
        })

      Scroll(this.scroller) {
        Column() {
          Column().width('100%').height('20%').backgroundColor(Color.Green)

          Grid(this.scroller) {
            ForEach(this.numbers, (day: string) => {
              ForEach(this.numbers, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height(80)
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          
          .height('90%')
          
          
          
          
          
          
          

          Column().width('100%').height('20%').backgroundColor(Color.Red)

        }.width('100%')
      }
      
      
      
      
      
      
      .width('100%')
      .height('70%')
    }.key('ColumnSize')
  }
}