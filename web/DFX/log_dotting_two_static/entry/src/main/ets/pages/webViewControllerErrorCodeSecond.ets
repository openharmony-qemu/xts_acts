/*
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
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError,Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("click").key('WebViewControllerErrorCodeSecondButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {

            case 'testGetDefaultUserAgent001': {
              try {
                let isGetDefaultUserAgent = false;
                let userAgent = webview.WebviewController.getDefaultUserAgent();
                console.log('getDefaultUserAgent userAgent===>' + userAgent)
                if (userAgent.includes('Mozilla')) {
                  isGetDefaultUserAgent = true
                }
                Utils.emitEvent(isGetDefaultUserAgent, 202503209);
              } catch (error:BusinessError) {
                console.error(`testGetDefaultUserAgentError001 ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202503209);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .zoomAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}
