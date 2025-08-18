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
  Component,
  Scroller,
  ScrollState,
  Column,
  WaterFlow,
  LazyForEach,
  FlowItem,
  Padding,
  Text,
  BarState,
  TextAlign,
  OnScrollFrameBeginCallback,
  WaterFlowOptions,
  OnScrollFrameBeginHandlerResult
} from '@ohos.arkui.component';
import events_emitter from '@ohos.events.emitter';
import { WaterFlowDataSource } from './WaterFlowDataSource';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct cachedCountShowFlowExample {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State colors: double[] | int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  scroller: Scroller = new Scroller()
  @State clip1: boolean = false
  @State show1: boolean | undefined = true

  onPageShow() {
    console.info('[WaterFlow] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 125,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangClipShow);
  }

  private stateChangClipShow: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info('[stateChangClipShow] stateChangeEvent');
    if (eventData != null) {
      console.info('[stateChangClipShow] state change called:' + JSON.stringify(eventData));
      
        
      
      
    }
  }

  build() {
    Column() {
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}