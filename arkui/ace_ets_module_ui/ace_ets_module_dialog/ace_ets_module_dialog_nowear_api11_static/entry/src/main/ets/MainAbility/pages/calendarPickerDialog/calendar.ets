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
  Axis,
  Color,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ItemAlign,
  Margin,
  Padding
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CalendarComponentExample {
  @State colSpace: number = 5;
  @State dailyFiveRowSpace: number = 4;
  @State dailySixRowSpace: number = 5;
  @State lunarHeight: number = 20;
  @State underscoreWidth: number = 10;
  @State underscoreLength: number = 6;
  @State scheduleMarkerRadius: number = 3;
  @State boundaryRowOffset: number = 3;
  @State weekAndDayRowSpace: number = 3;
  @State direction1: Axis = Axis.Horizontal;

  onPageShow() {
    console.info('Calendar page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 74,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {

    }.height(400).padding({ left: 35, right: 35, top: 35 } as Padding)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {

  }
}