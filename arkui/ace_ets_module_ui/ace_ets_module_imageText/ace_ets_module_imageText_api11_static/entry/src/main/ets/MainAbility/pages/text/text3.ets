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
import {
  Entry,
  Component,
  Flex,
  Text,
  Padding,
  $rawfile,
  TextAlign,
  TextOverflow,
  TextDecorationType,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Color,
  Image
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct Text3Example {
  @State fontSize: number = 9;
  @State fontColor: string = "#330A59F8";
  @State textAlign: TextAlign = TextAlign.Start;
  @State textOverflow: TextOverflow = TextOverflow.Clip;
  @State decoration: TextDecorationType = TextDecorationType.None;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('lineHeightt')
        .fontSize(this.fontSize)
        .fontColor(this.fontColor)
        .textAlign(this.textAlign)
        .textOverflow({ overflow: this.textOverflow })
        .decoration({ type: this.decoration, color: Color.Red })
        .key('text')
      Image($rawfile('test.png'))
        .key('image')
    }
    .height(600)
    .width(350)
    .padding({ left: 35, right: 35, top: 35 } as Padding)
  }

  onPageShow() {
    console.info('text page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 226,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 227,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 228,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 229,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)

    let stateChangeEventFour: events_emitter.InnerEvent = {
      eventId: 230,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFour, this.stateChangCallBack)

    let stateChangeEventFive: events_emitter.InnerEvent = {
      eventId: 231,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFive, this.stateChangCallBack)

    let stateChangeEventSix: events_emitter.InnerEvent = {
      eventId: 232,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventSix, this.stateChangCallBack)

    let stateChangeEventSeven: events_emitter.InnerEvent = {
      eventId: 233,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventSeven, this.stateChangCallBack)
  }

  private stateChangCallBack:(eventData: events_emitter.EventData)=>void = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      console.info("text page state change called:" + JSON.stringify(eventData));
      if (eventData.data !== null && ((eventData.data) as ESObject).getProperty('fontSize') != null) {
        this.fontSize = ((eventData.data) as ESObject).getProperty('fontSize').toNumber() ;
      }
      if (((eventData.data) as ESObject).getProperty('fontColor') != null) {
        this.fontColor = ((eventData.data) as ESObject).getProperty('fontColor').toString();
      }
      if (((eventData.data) as ESObject).getProperty('textAlign') != null) {
        this.textAlign = ((eventData.data) as ESObject).getProperty('textAlign').toStaticObject() as TextAlign;
      }
      if (((eventData.data) as ESObject).getProperty('textOverflow') != null) {
        this.textOverflow = ((eventData.data) as ESObject).getProperty('textOverflow').toStaticObject() as TextOverflow;
      }
    }
  }
}
