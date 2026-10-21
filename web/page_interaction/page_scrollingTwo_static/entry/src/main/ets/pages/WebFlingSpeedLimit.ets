'use static'
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { Entry, Component, Column, Row, Button, Web, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base';
import { deviceInfo } from '@kit.BasicServicesKit';

function isApi262OrNewer(): boolean {
  if (deviceInfo.sdkApiVersion > 26) {
    return true;
  }
  if (deviceInfo.sdkApiVersion < 26) {
    return false;
  }
  return deviceInfo.sdkMinorApiVersion >= 2;
}

@Entry
@Component
struct WebFlingSpeedLimit {
  @State str: string = '';
  @State speedLimit: double = 9000;
  private api262: boolean = isApi262OrNewer();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  aboutToAppear(): void {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(): void {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> =
    (eventData: events_emitter.EventData): void => {
      const data = eventData?.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        this.str = String(data['ACTION']);
      }
    }

  private handleClick(): void {
    switch (this.str) {
      case 'emitFlingSpeedLimit001': {
        if (this.api262) {
          this.speedLimit = 9000;
        }
        Utils.emitEvent(true, 186010);
        break;
      }
      case 'emitFlingSpeedLimit002': {
        if (this.api262) {
          this.speedLimit = 17000;
        }
        Utils.emitEvent(true, 186020);
        break;
      }
      case 'emitFlingSpeedLimit003': {
        if (this.api262) {
          this.speedLimit = 0;
        }
        Utils.emitEvent(true, 186030);
        break;
      }
      case 'emitFlingSpeedLimit004': {
        if (this.api262) {
          this.speedLimit = -1;
        }
        Utils.emitEvent(true, 186040);
        break;
      }
      case 'emitFlingSpeedLimit005': {
        if (this.api262) {
          this.speedLimit = 9000;
          this.speedLimit = 17000;
        }
        Utils.emitEvent(true, 186050);
        break;
      }
      default:
        break;
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('FlingSpeedLimitButton').onClick((e: ClickEvent) => {
          this.handleClick();
        })
      }
      if (this.api262) {
        Web({ src: 'resource://rawfile/indexFive.html', controller: this.controller })
          .key('WebFlingSpeedLimitWeb')
          .javaScriptAccess(true)
          .fileAccess(true)
          .imageAccess(true)
          .domStorageAccess(true)
          .onlineImageAccess(true)
          .databaseAccess(true)
          .flingSpeedLimit(this.speedLimit)
          .height('95%')
      } else {
        Web({ src: 'resource://rawfile/indexFive.html', controller: this.controller })
          .key('WebFlingSpeedLimitWeb')
          .javaScriptAccess(true)
          .fileAccess(true)
          .imageAccess(true)
          .domStorageAccess(true)
          .onlineImageAccess(true)
          .databaseAccess(true)
          .height('95%')
      }
    }.width('100%').height('100%')
  }
}
