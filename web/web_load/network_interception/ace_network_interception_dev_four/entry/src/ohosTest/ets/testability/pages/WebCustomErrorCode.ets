/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { BusinessError } from '@ohos.base';

const EVENT_ID_SET_EMIT_KEY = 203000;
const CUSTOM_ERROR_CODE = 32159;
const TEST_URL = 'ht' + 'tps://w' + 'ww.example.c' + 'om/';
const EXAMPLE_HTTP_URL = 'ht' + 'tp://w' + 'ww.example.c' + 'om';

@Entry
@Component
struct WebCustomErrorCode {
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State customErrorCode: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  schemeHandler: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null && eventData.data.ACTION != null) {
      this.str = eventData.data.ACTION;
      this.isReceive = 1;
    }
  }

  private async runDidFail3SuccessCase(caseName: string, eventId: number): Promise<void> {
    try {
      this.customErrorCode = -1;
      let completeIfNoResponse: boolean = caseName === 'testDidFail3CompleteFalse001' ? false : true;
      let customErrorCode: number = caseName === 'testDidFail3CustomErrorCodeZero001' ? 0 : CUSTOM_ERROR_CODE;
      let didFailResult = 'pending';
      this.schemeHandler = new web_webview.WebSchemeHandler();
      this.schemeHandler.onRequestStart((
        request: web_webview.WebSchemeHandlerRequest,
        resourceHandler: web_webview.WebResourceHandler) => {
        try {
          if (caseName === 'testDidFail3CompleteFalse001') {
            let response = new web_webview.WebSchemeHandlerResponse();
            response.setUrl(EXAMPLE_HTTP_URL);
            response.setStatus(200);
            response.setStatusText('OK');
            response.setMimeType('text/html');
            response.setEncoding('utf-8');
            resourceHandler.didReceiveResponse(response);
          }
          resourceHandler.didFail(WebNetErrorList.ERR_FAILED, completeIfNoResponse, customErrorCode);
          didFailResult = 'success';
        } catch (error) {
          didFailResult = String((error as BusinessError).code);
          console.error(`didFail ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
        }
        if (caseName === 'testDidFail3CompleteFalse001') {
          Utils.emitEvent(didFailResult, eventId);
        }
        return true;
      });
      this.controller.clearWebSchemeHandler();
      this.controller.setWebSchemeHandler('https', this.schemeHandler);
      this.controller.loadUrl(`${TEST_URL}?t=${Date.now()}`);
      if (caseName === 'testDidFail3CompleteFalse001') {
        await Utils.waitForExist(() => didFailResult, caseName, 'success', 1000, 10);
        return;
      }
      await Utils.waitForExist(() => this.customErrorCode, caseName, customErrorCode, 1000, 10);
      Utils.emitEvent(this.customErrorCode, eventId);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
    }
  }

  private async runDidFail3ErrorCase(
    invokeDidFail: (handler: web_webview.WebResourceHandler) => void,
    eventId: number,
    expectedCode: string): Promise<void> {
    try {
      let errorCode = '';
      this.schemeHandler = new web_webview.WebSchemeHandler();
      this.schemeHandler.onRequestStart((
        request: web_webview.WebSchemeHandlerRequest,
        resourceHandler: web_webview.WebResourceHandler) => {
        try {
          invokeDidFail(resourceHandler);
        } catch (error) {
          errorCode = String((error as BusinessError).code);
        }
        Utils.emitEvent(errorCode, eventId);
        return true;
      });
      this.controller.clearWebSchemeHandler();
      this.controller.setWebSchemeHandler('https', this.schemeHandler);
      this.controller.loadUrl(`${TEST_URL}?t=${Date.now()}`);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebCustomErrorCode').id('WebCustomErrorCode').onClick(async () => {
          await Utils.waitForExist(() => this.isReceive, 'WebCustomErrorCodeIsReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, 'WebCustomErrorCodeIsPageEnd', 1, 1000);
          this.isReceive = -1;
          switch (this.str) {
            case 'testSetGetCustomErrorCode0100': {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setUrl(EXAMPLE_HTTP_URL);
                response.setStatus(200);
                response.setStatusText('OK');
                response.setMimeType('text/html');
                response.setEncoding('utf-8');
                response.setHeaderByName('header1', 'value1', false);
                response.setNetErrorCode(WebNetErrorList.NET_OK);
                response.setCustomErrorCode(CUSTOM_ERROR_CODE);
                Utils.emitEvent(response.getCustomErrorCode(), 203010);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'testDidFailCustomErrorCode0100': {
              try {
                this.customErrorCode = -1;
                this.schemeHandler = new web_webview.WebSchemeHandler();
                this.schemeHandler.onRequestStart((
                  request: web_webview.WebSchemeHandlerRequest,
                  resourceHandler: web_webview.WebResourceHandler) => {
                  try {
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true, CUSTOM_ERROR_CODE);
                  } catch (error) {
                    console.error(`didFail ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
                  }
                  return true;
                });
                this.controller.clearWebSchemeHandler();
                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.loadUrl(`${TEST_URL}?t=${Date.now()}`);
                await Utils.waitForExist(() => this.customErrorCode, 'testDidFailCustomErrorCode0100', CUSTOM_ERROR_CODE, 1000, 10);
                Utils.emitEvent(this.customErrorCode, 203020);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'testDidFailInvalidHandler0100': {
              try {
                let errorCode = '';
                this.schemeHandler = new web_webview.WebSchemeHandler();
                this.schemeHandler.onRequestStart((
                  request: web_webview.WebSchemeHandlerRequest,
                  resourceHandler: web_webview.WebResourceHandler) => {
                  try {
                    resourceHandler.didFinish();
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true, CUSTOM_ERROR_CODE);
                  } catch (error) {
                    errorCode = String((error as BusinessError).code);
                  }
                  Utils.emitEvent(errorCode, 203030);
                  return true;
                });
                this.controller.clearWebSchemeHandler();
                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.loadUrl(`${TEST_URL}?t=${Date.now()}`);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'testDidFail3CompleteFalse001': {
              await this.runDidFail3SuccessCase(this.str, 203111);
              break;
            }
            case 'testDidFail3CustomErrorCodeZero001': {
              await this.runDidFail3SuccessCase(this.str, 203112);
              break;
            }
            case 'testDidFail3CodeNull001': {
              await this.runDidFail3ErrorCase((handler) => {
                handler.didFail(null, true, CUSTOM_ERROR_CODE);
              }, 203120, '17100101');
              break;
            }
            case 'testDidFail3CodeUndefined001': {
              await this.runDidFail3ErrorCase((handler) => {
                handler.didFail(undefined, true, CUSTOM_ERROR_CODE);
              }, 203130, '17100101');
              break;
            }
            case 'testDidFail3CompleteIfNoResponseNull001': {
              await this.runDidFail3ErrorCase((handler) => {
                handler.didFail(WebNetErrorList.ERR_FAILED, null, CUSTOM_ERROR_CODE);
              }, 203140, '17100101');
              break;
            }
            case 'testDidFail3CompleteIfNoResponseUndefined001': {
              await this.runDidFail3ErrorCase((handler) => {
                handler.didFail(WebNetErrorList.ERR_FAILED, undefined, CUSTOM_ERROR_CODE);
              }, 203150, '17100101');
              break;
            }
            case 'testDidFail3CustomErrorCodeNull001': {
              await this.runDidFail3ErrorCase((handler) => {
                handler.didFail(WebNetErrorList.ERR_FAILED, true, null);
              }, 203160, '17100101');
              break;
            }
            case 'testDidFail3CustomErrorCodeUndefined001': {
              await this.runDidFail3ErrorCase((handler) => {
                handler.didFail(WebNetErrorList.ERR_FAILED, true, undefined);
              }, 203170, '17100101');
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onErrorReceive((event) => {
          if (event) {
            this.customErrorCode = event.error.getCustomErrorCode();
            console.log(`customErrorCode is: ${this.customErrorCode}`);
          }
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }
  }
}
