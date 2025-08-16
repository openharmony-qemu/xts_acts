/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  Component,
  Column,
  Flex,
  GridCol,
  GridRow,
  Row,
  Text,
  AttributeModifier,
  GridColAttribute,
  GridColColumnOption,
  BreakpointsReference,
  GridRowDirection,
  Color,
  Padding
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

































































@Entry
@Component
struct GridColExample {
  
  
  
  
  @State redOffset: number | GridColColumnOption = 0.0
  @State mspan: number | GridColColumnOption = 1.0
  @State morder1: number | GridColColumnOption = 1.0
  @State morder2: number | GridColColumnOption = 2.0
  @State currentBp: string = ''
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Gridcol page state change called:" + JSON.stringify(eventData));
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }
  }

  onPageShow() {
    console.info('gridcol page1 show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 181,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 182,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 184,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 185,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
  }

  build() {
    Column() {
      GridRow({
        columns: 5,
        gutter: { x: 5, y: 10 },
        breakpoints: {
          value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize
        },
        direction: GridRowDirection.Row
      }) {
        GridCol({ span: 1 }) {
          Row() {
            Text('Red')
          }.width("100%").height("20vp")
        }.borderColor(Color.Red).borderWidth(2).key('keykeyoffset')

        
        

        GridCol({ span: 1 }) {
          Row() {
            Text('Orange')
          }.width("100%").height("20vp")
        }.borderColor(Color.Orange).borderWidth(2).key('keykeyspan')

        
        

        GridCol() {
          Row() {
            Text('Red')
          }.width("100%").height("20vp")
        }.borderColor(Color.Red).borderWidth(2).key('keykeyorder1')

        
        

        GridCol() {
          Row() {
            Text('Orange')
          }.width("100%").height("20vp")
        }.borderColor(Color.Orange).borderWidth(2).key('keykeyorder2')

        
        
      }
      .width("100%")
      .height("100%")
      .border({ color: '#880606', width: 2 })
      .padding({
        top: 20,
        bottom: 20,
        left: 5,
        right: 5
      } as Padding)
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }.width('90%')
  }
}