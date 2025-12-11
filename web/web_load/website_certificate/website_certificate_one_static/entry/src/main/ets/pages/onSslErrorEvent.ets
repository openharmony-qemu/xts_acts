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
import {Builder, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { WebLayoutMode } from '@ohos.arkui.component'

@Entry
@Component
struct onCreateNativeMediaPlayer {

  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State mediaPlayGestureAccess: boolean = true;
  @State statusResult: string = '';
  @State url: string = ''
  mode: WebLayoutMode = WebLayoutMode.FIT_CONTENT;

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
      if (eventData.data != null && (eventData.data as Record<string , RecordData>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string , RecordData>)?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('onCreateNativeMediaPlayerTest').key('WebonSslErrorEventButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'onCreateNativeMediaPlayer': {
                Utils.emitEvent(WebLayoutMode.FIT_CONTENT, 2025321)
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/layoutMode.html', controller: this.controller })
        .layoutMode(WebLayoutMode.FIT_CONTENT)

    }
  }
}
