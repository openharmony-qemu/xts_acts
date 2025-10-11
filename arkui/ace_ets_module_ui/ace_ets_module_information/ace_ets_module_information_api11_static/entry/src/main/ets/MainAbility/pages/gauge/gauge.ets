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

import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Gauge, Margin} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct GaugeExample {
  @State gaugeValue: double = 50;
  @State strokeWidthValue: string = '20';
  @State startAngleValue: double = 210;
  @State endAngleValue: double = 150;
  @State colorValues: string = JSON.stringify([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1], [0xD94838, 1]]);
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("gauge page state change called:" + JSON.stringify(eventData));
      if (((eventData.data) as ESObject ).getProperty('gaugeValue') != null) {
        this.gaugeValue = ((eventData.data) as ESObject ).getProperty('gaugeValue').toNumber();
      }
      if (((eventData.data) as ESObject ).getProperty('strokeWidthValue') != null) {
        this.strokeWidthValue = ((eventData.data) as ESObject ).getProperty('strokeWidthValue').toString();
      }
      if (((eventData.data) as ESObject ).getProperty('startAngleValue') != null) {
        this.startAngleValue = ((eventData.data) as ESObject ).getProperty('startAngleValue').toNumber();
      }
      if (((eventData.data) as ESObject ).getProperty('endAngleValue') != null) {
        this.endAngleValue = ((eventData.data) as ESObject ).getProperty('endAngleValue').toNumber();
      }
      if (((eventData.data) as ESObject ).getProperty('colorValues') != null) {
        this.colorValues = ((eventData.data) as ESObject ).getProperty('colorValues').toString();
      }
    }
  }

  onPageShow() {
    console.info('gauge page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 102,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 103,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack);

    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 904,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);

    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 905,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);

    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 906,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
  }

  build() {
    Column() {
      Gauge({ value: 0, min: 0, max: 100 })
        .key("gauge")
        .value(this.gaugeValue)
        .startAngle(this.startAngleValue)
        .endAngle(this.endAngleValue)
        .strokeWidth(`${this.strokeWidthValue}`)
        .width(200)
        .height(200)
    }
    .width('100%')
    .margin({ top: 300 } as Margin)
  }
}

