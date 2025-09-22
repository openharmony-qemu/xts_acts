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

import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Position,
  Scroll,
  FlexDirection,
  Builder,
  Padding,
  RowOptions,
  PopupOptions,
  CustomPopupOptions,
  Placement,
  PopupStateChangeParam
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct bindPopupOffset {
  @State handlePopup: boolean = false;
  @State handlePopup01: boolean = false;
  @State handlePopup02: boolean = false;
  @State handlePopup03: boolean = false;
  @State handlePopup04: boolean = false;
  @State customPopup: boolean = false;
  @State customPopup01: boolean = false;
  @State customPopup02: boolean = false;
  @State customPopup03: boolean = false;
  @State customPopup04: boolean = false;
  @State offset1: Position = { x: 10, y: 10 } as Position;
  @State offset10: Position = { x: -10, y: -10 } as Position;
  @State offset00: Position = { x: 0, y: 0 } as Position;
  @State offset050: Position = { x: 0, y: 50 } as Position;

  

  @Builder
  popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom Popup')
        .fontSize(12)
        .key('text')
    }
    .width(100)
    .height(50)
    .backgroundColor(Color.White)
  }

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.Column }) {
        Button('PopupOptions')
          .width(200)
          .key('PopupOptions')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.handlePopup = !this.handlePopup
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset1,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12065,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("PopupOptions start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("PopupOptions emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        

        Button('PopupOptions00')
          .width(200)
          .key('PopupOptions00')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.handlePopup01 = !this.handlePopup01
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset00,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12067,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("PopupOptions00 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("PopupOptions00 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        

        Button('PopupOptions050')
          .width(200)
          .key('PopupOptions050')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.handlePopup02 = !this.handlePopup02
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset050,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12068,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("PopupOptions050 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("PopupOptions050 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        
        Button('PopupOptionsnull')
          .width(200)
          .key('PopupOptionsnull')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.handlePopup03 = !this.handlePopup03
            try {
              
              
              
              
              
              
              
              
              
              
              
            } catch (err) {
              console.info("PopupOptionsnull emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        
        Button('PopupOptions10')
          .width(200)
          .key('PopupOptions10')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.handlePopup04 = !this.handlePopup04
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset10,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12070,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("PopupOptions10 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("PopupOptions10 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        


        Button('customPopup')
          .key('customPopup')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.customPopup = !this.customPopup
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset1,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12066,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("customPopup start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("customPopup emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        Button('customPopup10')
          .key('customPopup10')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.customPopup01 = !this.customPopup01
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset10,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12071,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("customPopup10 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("customPopup10 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        Button('customPopup00')
          .key('customPopup00')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.customPopup02 = !this.customPopup02
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset00,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12072,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("customPopup00 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("customPopup00 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        Button('customPopup050')
          .key('customPopup050')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.customPopup03 = !this.customPopup03
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "offset": this.offset050,
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 12073,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("customPopup050 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("customPopup050 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        Button('customPopupnull')
          .key('customPopupnull')
          .margin({ top: 100 } as Margin)
          .onClick((e: ClickEvent) => {
            this.customPopup04 = !this.customPopup04
            try {
              
              
              
              
              
              
              
              
              
              
              
            } catch (err) {
              console.info("customPopupnull emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      }.width('100%').padding({ top: 5 } as Padding)
    }.width('100%').height("85%")

  }
}
