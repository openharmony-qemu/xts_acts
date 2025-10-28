/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist, waitForAssert } from '../../test/WaitTest.test';
import business_error from '@ohos.base';
import { URL } from '../../test/Config.test';

export enum ThreatType {
  UNKNOWN = -1,
  THREAT_ILLEGAL = 0,
  THREAT_FRAUD = 1,
  THREAT_RISK = 2,
  THREAT_WARNING = 3,
  THREAT_NONE = 4,
  THREAT_UNPROCESSED = 5,
}

export class OnSafeBrowsingCheckResultCallback {
  threatType: ThreatType = ThreatType.UNKNOWN;
}


@Entry
@Component
struct onSafeBrowsingCheckFinishTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State webType: number = 666;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 125,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(125)
  }



  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('onSafeBrowsingCheckFinish').key('onSafeBrowsingCheckFinishButton').onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitOnSafeBrowsingCheckFinish01': {
              try {
                this.controller.loadUrl(URL);
                await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2;
                }
                await waitForAssert(()=>this.webType, check, 5, 2025102812, this.str, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: '', controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isPageEnd = 0;
        })
        .onSafeBrowsingCheckFinish((callback) => {
          let jsonData = JSON.stringify(callback);
          let json: OnSafeBrowsingCheckResultCallback = JSON.parse(jsonData);
          console.info('onSafeBrowsingCheckFinish: [threatType]= ' + json.threatType);
          this.webType = json.threatType;
        })
    }
  }
}
