'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Web,
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'
import { WebNetErrorList } from '@ohos.web.netErrorList';

export class StringFields {
  public str: string = '';
}

const CUSTOM_ERROR_CODE: int = 32159;
const TEST_URL: string = 'ht' + 'tps://w' + 'ww.example.c' + 'om/';
const EXAMPLE_HTTP_URL: string = 'ht' + 'tp://w' + 'ww.example.c' + 'om';

@Entry
@Component
struct webCustomErrorCode {
  stringObj: StringFields = new StringFields();
  @State customErrorCode: int = -1;
  @State isPageEnd: int = -1;
  controller: webview.WebviewController = new webview.WebviewController(undefined)
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private waitAndEmitCustomError(retries: number): void {
    if (this.customErrorCode === CUSTOM_ERROR_CODE) {
      Utils.emitEvent(this.customErrorCode, 8822);
    } else if (retries > 0) {
      setTimeout(() => {
        this.waitAndEmitCustomError(retries - 1);
      }, 500);
    }
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        this.stringObj.str = String(data['ACTION']);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebCustomErrorCode').key('WebCustomErrorCode').onClick((e: ClickEvent) => {
          switch (this.stringObj.str) {
            case 'testDidFailCustomErrorCodeStatic001': {
              try {
                this.customErrorCode = -1;
                this.schemeHandler = new webview.WebSchemeHandler();
                this.schemeHandler.onRequestStart((
                  request: webview.WebSchemeHandlerRequest,
                  resourceHandler: webview.WebResourceHandler) => {
                  try {
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true, CUSTOM_ERROR_CODE);
                  } catch (error) {
                    error = error as BusinessError;
                    console.error(`didFail ErrorCode: ${error.code}, Message: ${error.message}`);
                  }
                  return true;
                });
                this.controller.clearWebSchemeHandler();
                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.isPageEnd = -1;
                this.controller.loadUrl(TEST_URL + '?t=' + Date.now());
                setTimeout(() => {
                  this.waitAndEmitCustomError(20);
                }, 1000);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testDidFail3CompleteFalseStatic001': {
              try {
                let didFailResult: string = 'pending';
                this.schemeHandler = new webview.WebSchemeHandler();
                this.schemeHandler.onRequestStart((
                  request: webview.WebSchemeHandlerRequest,
                  resourceHandler: webview.WebResourceHandler) => {
                  try {
                    let response = new webview.WebSchemeHandlerResponse();
                    response.setUrl(EXAMPLE_HTTP_URL);
                    response.setStatus(200);
                    response.setStatusText('OK');
                    response.setMimeType('text/html');
                    response.setEncoding('utf-8');
                    resourceHandler.didReceiveResponse(response);
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED, false, CUSTOM_ERROR_CODE);
                    didFailResult = 'success';
                  } catch (error) {
                    didFailResult = String((error as BusinessError).code);
                  }
                  Utils.emitEvent(didFailResult, 8825);
                  return true;
                });
                this.controller.clearWebSchemeHandler();
                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.loadUrl(TEST_URL + '?t=' + Date.now());
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testDidFailInvalidHandlerStatic001': {
              try {
                let errorCode: int = 0;
                this.schemeHandler = new webview.WebSchemeHandler();
                this.schemeHandler.onRequestStart((
                  request: webview.WebSchemeHandlerRequest,
                  resourceHandler: webview.WebResourceHandler) => {
                  try {
                    resourceHandler.didFinish();
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true, CUSTOM_ERROR_CODE);
                  } catch (error) {
                    errorCode = (error as BusinessError).code;
                  }
                  Utils.emitEvent(errorCode, 8824);
                  return true;
                });
                this.controller.clearWebSchemeHandler();
                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.loadUrl(TEST_URL + '?t=' + Date.now());
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: TEST_URL, controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onErrorReceive((event) => {
          if (event) {
            this.customErrorCode = event.error.getCustomErrorCode();
          }
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }
  }
}
