/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import webview from '@ohos.web.webview';
import { BusinessError } from '@ohos.base';
import { CommonConstants } from '../../test/constant.test'

const EVENT_ID_SET_EMIT_KEY = 251107;

@Entry
@Component
struct WebResourceType {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isWebInitPageEnd: number = -1;
  @State WebResourceType_MAIN_FRAME: number = -1;
  @State WebResourceType_SUB_FRAME: number = -1;
  @State WebResourceType_STYLE_SHEET: number = -1;
  @State WebResourceType_SCRIPT: number = -1;
  @State WebResourceType_IMAGE: number = -1;
  @State WebResourceType_FONT_RESOURCE: number = -1;
  @State WebResourceType_MEDIA: number = -1;
  @State WebResourceType_FAVICON: number = -1;
  @State WebResourceType_XHR: number = -1;
  @State WebResourceType_PING: number = -1;
  @State WebResourceType_SERVICE_WORKER: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebResourceTypeButton").id('WebResourceTypeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebResourceTypeButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isWebInitPageEnd, 'WebResourceTypeButtonIsWebInitPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          if (this.isPageEnd == 1) {
            this.controller.loadUrl(CommonConstants.IQIYI_URL)
            await Utils.waitForExist(()=>this.isPageEnd, 'WebResourceTypeIsPageEnd', 2, 1000);
          }
          this.isReceive = -1;
          switch (this.str) {
            case "WebResourceType_MAIN_FRAME": {
              try {
                Utils.emitEvent(this.WebResourceType_MAIN_FRAME, 25110700)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_SUB_FRAME": {
              this.isPageEnd = 0
              try {
                this.controller.loadUrl($rawfile("iframe1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'WebResourceType_SUB_FRAME', 2, 1000);
                Utils.emitEvent(this.WebResourceType_SUB_FRAME, 25110701)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_STYLE_SHEET": {
              try {
                Utils.emitEvent(this.WebResourceType_STYLE_SHEET, 25110702)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_SCRIPT": {
              try {
                Utils.emitEvent(this.WebResourceType_SCRIPT, 25110703)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_IMAGE": {
              try {
                Utils.emitEvent(this.WebResourceType_IMAGE, 25110704)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_FONT_RESOURCE": {
              try {
                Utils.emitEvent(this.WebResourceType_FONT_RESOURCE, 25110705)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_MEDIA": {
              this.isPageEnd = 0
              try {
                this.controller.loadUrl($rawfile("webResourceType.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'WebResourceType_MEDIA', 2, 1000);
                Utils.emitEvent(this.WebResourceType_MEDIA, 25110708)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_FAVICON": {
              try {
                Utils.emitEvent(this.WebResourceType_FAVICON, 25110712)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_XHR": {
              try {
                Utils.emitEvent(this.WebResourceType_XHR, 25110713)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_PING": {
              try {
                Utils.emitEvent(this.WebResourceType_PING, 25110714)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "WebResourceType_SERVICE_WORKER": {
              try {
                Utils.emitEvent(this.WebResourceType_SERVICE_WORKER, 25110715)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: CommonConstants.EXAMPLE_URL, controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
              console.log("[schemeHandler] onRequestStart")
              try {
                console.log("[schemeHandler] onRequestStart getRequestUrl:" + request.getRequestUrl())
                console.log("[schemeHandler] onRequestStart resource type:" + request.getRequestResourceType())
                if (request.getRequestResourceType() === webview.WebResourceType.MAIN_FRAME) {
                    this.WebResourceType_MAIN_FRAME = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.SUB_FRAME) {
                    this.WebResourceType_SUB_FRAME = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.STYLE_SHEET) {
                    this.WebResourceType_STYLE_SHEET = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.SCRIPT) {
                    this.WebResourceType_SCRIPT = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.IMAGE) {
                    this.WebResourceType_IMAGE = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.FONT_RESOURCE) {
                    this.WebResourceType_FONT_RESOURCE = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.MEDIA) {
                    this.WebResourceType_MEDIA = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.FAVICON) {
                    this.WebResourceType_FAVICON = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.XHR) {
                    this.WebResourceType_XHR = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.PING) {
                    this.WebResourceType_PING = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.SERVICE_WORKER) {
                    this.WebResourceType_SERVICE_WORKER = request.getRequestResourceType()
                }

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              return false;
            })
            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
            });
            this.controller.setWebSchemeHandler("http", this.schemeHandler);
            this.controller.setWebSchemeHandler("https", this.schemeHandler);
            webview.WebviewController.setServiceWorkerWebSchemeHandler("http", this.schemeHandler);
            webview.WebviewController.setServiceWorkerWebSchemeHandler("https", this.schemeHandler);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${error as BusinessError}.message`);
          }
        })
        .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
            this.isWebInitPageEnd = 1
            if (this.isPageEnd == -1) {
                this.isPageEnd = 1
            } else {
                this.isPageEnd = 2
            }
        })
    }
  }
}