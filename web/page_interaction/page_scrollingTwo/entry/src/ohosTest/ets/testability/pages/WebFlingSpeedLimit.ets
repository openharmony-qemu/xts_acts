/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import { deviceInfo } from '@kit.BasicServicesKit';

const EVENT_ID_SET_SUITE_KEY = 186001;

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
  @State isReceive: number = -1;
  @State speedLimit: number = 9000;
  @State isPageEnd: number = -1;
  private api262: boolean = isApi262OrNewer();
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data?.ACTION != null) {
      this.str = eventData.data?.ACTION;
      this.isReceive = 1;
    }
  }

  private applySpeed(speed: number, eventId: number): void {
    try {
      if (this.api262) {
        this.speedLimit = speed;
      } else {
        console.info('WebFlingSpeedLimit API < 26.2.0, skip apply');
      }
      Utils.emitEvent(true, eventId);
    } catch (error) {
      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
      Utils.emitEvent(false, eventId);
    }
  }

  private async onButtonClick(): Promise<void> {
    console.info('key==>' + this.str)
    await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 1000);
    await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000, 5);
    switch (this.str) {
      case 'emitFlingSpeedLimit001':
        this.applySpeed(9000, 186010);
        break;
      case 'emitFlingSpeedLimit002':
        this.applySpeed(17000, 186020);
        break;
      case 'emitFlingSpeedLimit003':
        this.applySpeed(0, 186030);
        break;
      case 'emitFlingSpeedLimit004':
        this.applySpeed(-1, 186040);
        break;
      case 'emitFlingSpeedLimit005': {
        try {
          if (this.api262) {
            this.speedLimit = 9000;
            this.speedLimit = 17000;
          }
          Utils.emitEvent(true, 186050);
        } catch (error) {
          console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
          Utils.emitEvent(false, 186050);
        }
        break;
      }
      default:
        break;
    }
  }

  @Builder
  WebWithFling() {
    Web({ src: $rawfile('indexFive.html'), controller: this.controller })
      .key('WebFlingSpeedLimitWeb')
      .javaScriptAccess(true)
      .fileAccess(true)
      .imageAccess(true)
      .domStorageAccess(true)
      .onlineImageAccess(true)
      .databaseAccess(true)
      .flingSpeedLimit(this.speedLimit)
      .onPageEnd(() => {
        this.isPageEnd = 1;
      })
      .height('95%')
  }

  @Builder
  WebWithoutFling() {
    Web({ src: $rawfile('indexFive.html'), controller: this.controller })
      .key('WebFlingSpeedLimitWeb')
      .javaScriptAccess(true)
      .fileAccess(true)
      .imageAccess(true)
      .domStorageAccess(true)
      .onlineImageAccess(true)
      .databaseAccess(true)
      .onPageEnd(() => {
        this.isPageEnd = 1;
      })
      .height('95%')
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('FlingSpeedLimitButton').onClick(async () => {
          await this.onButtonClick();
        })
      }
      if (this.api262) {
        this.WebWithFling()
      } else {
        this.WebWithoutFling()
      }
    }
  }
}
