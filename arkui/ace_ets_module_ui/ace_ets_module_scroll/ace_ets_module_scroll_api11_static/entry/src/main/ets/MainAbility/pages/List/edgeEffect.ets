/**
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
import events_emitter from '@ohos.events.emitter';
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
  EdgeEffect,
  Stack,
  Alignment,
  ForEach,
  Axis,
  Padding,
  ListItem,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ListExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  @State editFlag: boolean = false
  @State edgeEffect: EdgeEffect = EdgeEffect.None

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
        .listDirection(Axis.Vertical) 
        .divider({
          strokeWidth: 2,
          color: 0xFFFFFF,
          startMargin: 20,
          endMargin: 20
        }) 
        .edgeEffect(this.edgeEffect) 
        .chainAnimation(false) 
        .onScrollIndex((firstIndex: int, lastIndex: int, center: int): void => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        
        
        
        
        
        
        
        
        .width('90%')
      }.width('100%')

      Button('edit list')
        .onClick((e: ClickEvent) => {
          this.editFlag = !this.editFlag
        }).margin({ top: 5, left: 20 } as Margin)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 } as Padding)
  }

  onPageShow() {
    console.info('edgeEffect page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 91,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("edgeEffect page state change called:" + JSON.stringify(eventData));
      const edgeEffect = (eventData.data as ESObject).getPropertySafe('edgeEffect')
      if (!(edgeEffect.isNull() || edgeEffect.isUndefined())) {
        this.edgeEffect = edgeEffect.toStaticObject() as EdgeEffect;
      }
    }
  }
}

