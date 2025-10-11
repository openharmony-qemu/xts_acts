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
import {
  Entry,
  Component,
  Column,
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  Axis,
  EdgeEffect,
  Stack,
  Padding,
  Alignment,
  ForEach,
  ListItem,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct ListExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[];
  @State listDirection: Axis = Axis.Vertical;
  @State editMode: boolean = false;
  @State edgeEffect: EdgeEffect = EdgeEffect.None;
  @State chainAnimation: boolean = false;
  @State strokeWidth: number = 2.000000;
  @State color: string = '#FFFFFF';
  @State startMargin: number = 20.000000;
  @State endMargin: number = 20.000000;

  onPageShow() {
    console.info('[list] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 124,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 125,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBackTwo);

    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 901,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBackTwo);

    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 902,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBackTwo);

    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 903,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBackTwo);
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[stateChangCallBack] stateChangCallBack");
    if (eventData != null) {
      console.info("[stateChangCallBack] state change called:" + JSON.stringify(eventData));
      
      
      
      
      
      
      
      
      
      
      
      
    }
  }
  private stateChangCallBackTwo: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      console.info("[stateChangCallBackTwo] stateChangCallBack");
      if (eventData != null) {
        console.info("[stateChangCallBackTwo] state change called:" + JSON.stringify(eventData));
        
        
        
        
        
        
        
        
        
        
        
        
      }
    }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number, index: int) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }

            
          }, (item: number) => item.toString())
        }
        .key('list')
        .listDirection(this.listDirection)
        .divider({
          strokeWidth: this.strokeWidth,
          color: this.color,
          startMargin: this.startMargin,
          endMargin: this.endMargin
        })
        .edgeEffect(this.edgeEffect)
        .chainAnimation(this.chainAnimation)
        .multiSelectable(true)
        .onScrollIndex((firstIndex: number, lastIndex: number, center: number): void => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        .onDidScroll((scrollOffset: number, scrollState: ScrollState): void => {
          console.info('scrollOffset:' + scrollOffset)
          console.info('scrollState:' + scrollState)
        })
        
        
        
        
        
        
        
        .width('90%')
      }.width('100%')

      Button('edit list')
        .onClick((e: ClickEvent) => {
          this.editMode = !this.editMode
        }).margin({ top: 5, left: 20 } as Margin)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}