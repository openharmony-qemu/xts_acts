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

import events_emitter from '@ohos.events.emitter'
import {
  Entry,
  Component,
  Column,
  Text,
  Flex,
  Color,
  Span,
  Padding,
  DecorationStyleInterface,
  TextCase,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  TextDecorationType
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

class CustomEventData {
  fontColorValue?: Color
  textCaseValue?: TextCase
}

@Entry
@Component
struct Span3Example {
  @State decorationValue: DecorationStyleInterface =
    { type: TextDecorationType.None, color: Color.Red } as DecorationStyleInterface
  @State textCaseValue: TextCase = TextCase.Normal
  @State fontSizeValue: number = 40
  @State fontColorValue: Color = 0xCCCCCC as Color
  private stateChangCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData): void => {
      console.info("span page state change called:" + JSON.stringify(eventData));
      const customEventData = eventData.data as CustomEventData | undefined;
      if (eventData !== null && customEventData !== null && customEventData !== undefined) {
        if (customEventData.textCaseValue !== null && customEventData.textCaseValue !== undefined) {
          this.textCaseValue = customEventData.textCaseValue!;
        }
        if (customEventData.fontColorValue !== null && customEventData.fontColorValue !== undefined) {
          this.fontColorValue = customEventData.fontColorValue!;
        }
      }
    }

  onPageShow() {
    console.info('span page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 199,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 200,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);

    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 201,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);

    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 1029,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);

    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 1030,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);

    let stateChangeEvent6: events_emitter.InnerEvent = {
      eventId: 1031,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent6, this.stateChangCallBack);

    let stateChangeEvent7: events_emitter.InnerEvent = {
      eventId: 1032,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent7, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('Basic Usage').fontSize(9).fontColor(this.fontColorValue).key('fontColor')
      Text() {
        Span('This is the Span component').fontSize(this.fontSizeValue).textCase(this.textCaseValue)
          .decoration(this.decorationValue).key('decoration')
      }
    }.width('100%').height(250).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}