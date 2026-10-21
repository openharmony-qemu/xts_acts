/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';

const EVENT_ID_SET_EMIT_KEY = 203100;
const CUSTOM_ERROR_CODE = 32159;
const EXAMPLE_HTTP_URL = 'ht' + 'tp://w' + 'ww.example.c' + 'om';

@Entry
@Component
struct WebSchemeHandlerDynamic {
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  webSchemeHander: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();
  htmlData: string = '<html><body bgcolor="white">Source:<pre>source</pre></body></html>';
  resourceHandlerDidFail: boolean = false;

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

  build() {
    Column() {
      Row() {
        Button('WebSchemeHandlerDynamic').id('WebSchemeHandlerDynamic').onClick(async () => {
          await Utils.waitForExist(() => this.isReceive, 'WebSchemeHandlerDynamicIsReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, 'WebSchemeHandlerDynamicIsPageEnd', 1, 1000);
          this.isReceive = -1;
          switch (this.str) {
            case 'testWebSchemeHandlerResponseClass0100': {
              try {
                let responseClass = new web_webview.WebSchemeHandlerResponse();
                responseClass.setUrl(EXAMPLE_HTTP_URL);
                Utils.emitEvent(true, 203105);
              } catch (error) {
                console.error(JSON.stringify(error));
              }
              break;
            }
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
                Utils.emitEvent(response.getCustomErrorCode(), 203110);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'testResourceHandlerDidFail0100': {
              this.resourceHandlerDidFail = true;
              try {
                this.controller.loadUrl('https://www.baidu.com/');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onControllerAttached(() => {
          try {
            this.webSchemeHander.onRequestStart((request: web_webview.WebSchemeHandlerRequest,
              resourceHandler: web_webview.WebResourceHandler) => {
              if (request.getRequestUrl() === 'https://www.example.com/') {
                return false;
              }
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.NET_OK);
                response.setStatus(200);
                response.setStatusText('OK');
                response.setMimeType('text/html');
                response.setEncoding('utf-8');
                response.setHeaderByName('header1', 'value1', false);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
              }
              let buf = buffer.from(this.htmlData);
              try {
                resourceHandler.didReceiveResponse(response);
                resourceHandler.didReceiveResponseBody(buf.buffer);
                if (this.resourceHandlerDidFail) {
                  resourceHandler.didFail(WebNetErrorList.ERR_FAILED);
                } else {
                  resourceHandler.didFinish();
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
              }
              this.controller.setWebSchemeHandler('https', this.webSchemeHander);
              return true;
            });
            this.webSchemeHander.onRequestStop(() => {
              if (this.resourceHandlerDidFail) {
                this.resourceHandlerDidFail = false;
                Utils.emitEvent(true, 203120);
              }
            });
            this.controller.setWebSchemeHandler('https', this.webSchemeHander);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`);
          }
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }
  }
}
