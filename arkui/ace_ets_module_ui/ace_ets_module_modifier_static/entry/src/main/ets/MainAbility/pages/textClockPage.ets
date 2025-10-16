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
import { Entry,Component,Video,Resource,$r,TextArea,TextClockController,FlexAlign,TextClock,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';












@Entry
@Component
struct TextClockPage {
  @State accumulateTime: long = 0;
  @State timeZoneOffset: double = -8.0;
  @State format: string = 'hms'
  @State status: string = 'run'
  @State change: string = 'no change'








  controller: TextClockController = new TextClockController()

  build() {
    Column({ space: 5 } as ColumnOptions) {
    Button("change value").onClick((e: ClickEvent) => {

    }).key("changeButton")
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Current milliseconds is ' + this.accumulateTime)
        .fontSize(20)
        .key('accumulateTime')

      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller })
        .margin(20)
        .key('TextClockKey1')
        
        .onDateChange((value: long) => {
          this.change = 'change'
          this.accumulateTime = value
        })
      Button("start TextClock")
        .margin({ bottom: 10 } as Margin)
        .onClick((e: ClickEvent) => {
          this.controller.start()
          this.status = 'start'
        })
      Button("stop TextClock")
        .onClick((e: ClickEvent) => {
          
          this.controller.stop()
          this.status = 'stop'
          this.change = 'no change'
        })
      Text(this.status + ' success').fontSize(20).key('operation')
      Text(this.change + ' success').fontSize(20).key('change')
    }
    .width('100%')
    .height('100%')
    }
    .margin({ top: 5 } as Margin)
  }
}