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
import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext';

class StringFields {
  private str: string = '';
}

@Entry
@Component
struct WebOnDataResubmitted {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State webResult: string = ' ';
  @State str: string = ''
  @State receivedFromHtml: string = 'Display received message send from HTML';
  @State ports: Array<webview.WebMessagePort> = new Array<webview.WebMessagePort>()

  aboutToAppear() {
    webview.WebviewController.setWebDebuggingAccess(true);
    console.info('setWebDebuggingAccess success');
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
        Button('web click')
          .key('ErrorCodeTestSuiteButton')
          .onClick( (e:ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case "emitPostMessage": {
                try {
                  this.controllerNull.createWebMessagePorts()[1].onMessageEvent((result: webview.WebMessage) => {
                    let msg = 'Got msg from HTML:';
                    if (typeof (result) == "string") {
                      console.log("received string message from html5, string is:" + result);
                      msg = msg + result;
                    } else if (typeof (result) == "object") {
                      if (result instanceof ArrayBuffer) {
                        console.log("received arraybuffer from html5, length is:" + result.byteLength);
                        msg = msg + "lenght is " + result.byteLength;
                      } else {
                        console.log("not support");
                      }
                    } else {
                      console.log("not support");
                    }
                    this.receivedFromHtml = msg;
                  })
                  this.controllerNull.postMessage('__init_port__', [this.controllerNull.createWebMessagePorts()[0]], '*');
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 1022)
                }
                break;
              }
              case 'testCloseError001': {
                try {
                  this.ports = this.controller.createWebMessagePorts(true);
                  this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                  this.ports[1].close();
                  this.ports[1].postMessageEvent('post message from ets to html5');
                  Utils.emitEvent('no_error', 20360)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 20360)
                }
                break;
              }

              case 'emitClearMatches': {
                try {
                  this.controllerNull.clearMatches();
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 1007)
                }
                break;
              }
              case 'emitCreateWebMessagePort': {
                try {
                  this.controllerNull.createWebMessagePorts();
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 1021)
                }
                break;
              }
              case 'testPrepareForPageLoadError001': {
                try {
                  webview.WebviewController.prepareForPageLoad('https://www.example.com/', true, 7);
                  Utils.emitEvent(true, 50025)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 50025)
                }
                break;
              }

              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/jsMessageExtErrorCode' })
                console.log('push URL success')
              }

            }
          })
      }
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .fileAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .key('ErrorCodeTestSuiteKey')
        .javaScriptAccess(true)

    }
  }
}

