'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Row, Button, ClickEvent, EventResult } from '@ohos.arkui.component';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Callback, BusinessError, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import hilog from '@ohos.hilog';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct WebEmbedEventResultConstructor {
  @State str: string = ''

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string, RecordData>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string, RecordData>)?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
        Button('webViewEventResultConstructorButton')
          .key('webViewEventResultConstructorButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'emitEventResultConstructor01': {
                let eventResult: EventResult = new EventResult();
                if (eventResult != null) {
                  Utils.emitEvent(true, 100140);
                } else {
                  Utils.emitEvent(false, 100140);
                }
                break;
              }
              case 'emitEventResultConstructor02': {
                let eventResult: EventResult = new EventResult();
                eventResult.setGestureEventResult(true);
                Utils.emitEvent(true, 100150);
                break;
              }
              case 'emitEventResultConstructor03': {
                let eventResult: EventResult = new EventResult();
                eventResult.setGestureEventResult(false, true);
                Utils.emitEvent(true, 100160);
                break;
              }
              case 'emitEventResultConstructor04': {
                let eventResult: EventResult = new EventResult();
                eventResult.setMouseEventResult(true, true);
                Utils.emitEvent(true, 100170);
                break;
              }
              case 'emitEventResultConstructor05': {
                let eventResult: EventResult = new EventResult();
                eventResult.setMouseEventResult(false, false);
                Utils.emitEvent(true, 100180);
                break;
              }
              case 'emitEventResultConstructor06': {
                let eventResult: EventResult = new EventResult();
                eventResult.setGestureEventResult(false);
                Utils.emitEvent(true, 100190);
                break;
              }
              case 'emitEventResultConstructor07': {
                let eventResult: EventResult = new EventResult();
                eventResult.setGestureEventResult(true, true);
                Utils.emitEvent(true, 100200);
                break;
              }
              case 'emitEventResultConstructor08': {
                let eventResult: EventResult = new EventResult();
                eventResult.setGestureEventResult(true, false);
                Utils.emitEvent(true, 100210);
                break;
              }
              case 'emitEventResultConstructor09': {
                let eventResult: EventResult = new EventResult();
                eventResult.setGestureEventResult(false, false);
                Utils.emitEvent(true, 100220);
                break;
              }
              case 'emitEventResultConstructor10': {
                let eventResult: EventResult = new EventResult();
                eventResult.setMouseEventResult(true);
                Utils.emitEvent(true, 100230);
                break;
              }
              case 'emitEventResultConstructor11': {
                let eventResult: EventResult = new EventResult();
                eventResult.setMouseEventResult(false);
                Utils.emitEvent(true, 100240);
                break;
              }
              case 'emitEventResultConstructor12': {
                let eventResult: EventResult = new EventResult();
                eventResult.setMouseEventResult(true, false);
                Utils.emitEvent(true, 100250);
                break;
              }
              case 'emitEventResultConstructor13': {
                let eventResult: EventResult = new EventResult();
                eventResult.setMouseEventResult(false, true);
                Utils.emitEvent(true, 100260);
                break;
              }
              case 'emitEventResultConstructor14': {
                let eventResult1: EventResult = new EventResult();
                let eventResult2: EventResult = new EventResult();
                eventResult1.setGestureEventResult(true);
                eventResult2.setGestureEventResult(false);
                if (eventResult1 != null && eventResult2 != null) {
                  Utils.emitEvent(true, 100270);
                } else {
                  Utils.emitEvent(false, 100270);
                }
                break;
              }
              case 'emitOnSwitchNextPage03': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebViewWebConstructor' })
                break;
              }
            }
          })
    }
  }
}