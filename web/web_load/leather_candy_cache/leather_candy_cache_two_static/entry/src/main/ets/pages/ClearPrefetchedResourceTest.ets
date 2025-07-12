/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import { BusinessError, Callback } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct clearPrefetchedResourceTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = ''

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data?.['ACTION'] != null) {
        this.str = '' + eventData.data?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Button('clearPrefetchedResourceTest click')
        .key('clearPrefetchedResourceTestButton')
        .onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testClearPrefetchedResource001': {
              let msg = 'testClearPrefetchedResource001'
              try {
                let requestInfo: web_webview.RequestInfo = {
                  url: '',
                  method: 'POST',
                  formData: 'a=x&b=y'
                } as web_webview.RequestInfo
                web_webview.WebviewController.prefetchResource(
                  requestInfo,
                  [
                    {
                      headerKey: 'Accept',
                      headerValue: 'application/json',
                    },
                    {
                      headerKey: 'Content-Type',
                      headerValue: 'application/x-www-form-urlencoded',
                    },
                  ],
                  'KeyX', 500);
                Utils.emitEvent(true, 10110)
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 10110)
                console.error(`${msg} prefetchResource ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                try {
                  web_webview.WebviewController.clearPrefetchedResource(['KeyX']);
                  Utils.emitEvent(true, 10112)
                } catch (err: BusinessError) {
                  Utils.emitEvent(err.code, 10112)
                  console.error(msg + 'clearPrefetchedResource error: ' + err.code + ' Message: ' + err.message);
                }
              }, 1000)
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/InjectOfflineResourcesTest' })
            }
          }
        })
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
    }
  }
}