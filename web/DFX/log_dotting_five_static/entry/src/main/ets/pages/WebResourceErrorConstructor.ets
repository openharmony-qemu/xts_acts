'use static';
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

import webview from '@ohos.web.webview';
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web,
  WebResourceError
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Utils.test';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebResourceErrorConstructor {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';
  @State errorInfo: string = '';
  @State errorCode: number = 0;

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
    Row() {
      Column() {
        Button("WebResourceErrorConstructor click")
          .key('WebResourceErrorConstructorButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.stringObj.str)
            switch (this.stringObj.str) {
              case "emitConstructor001": {
                try {
                  let error: WebResourceError = new WebResourceError();
                  let info: string = error.getErrorInfo();
                  let code: number = error.getErrorCode();
                  console.info('WebResourceError constructor: errorInfo=' + info + ', errorCode=' + code);
                  Utils.emitEvent('constructorSuccess', 70030)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('constructorError', 70031)
                }
                break;
              }
              case "emitGetErrorInfo001": {
                try {
                  let error: WebResourceError = new WebResourceError();
                  let info: string = error.getErrorInfo();
                  console.info('WebResourceError getErrorInfo: ' + info);
                  Utils.emitEvent(info, 70032)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70033)
                }
                break;
              }
              case "emitGetErrorCode001": {
                try {
                  let error: WebResourceError = new WebResourceError();
                  let code: number = error.getErrorCode();
                  console.info('WebResourceError getErrorCode: ' + code);
                  Utils.emitEvent(code, 70034)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70035)
                }
                break;
              }
              case "emitConstructorReturn001": {
                try {
                  let error: WebResourceError = new WebResourceError();
                  let isObject: boolean = error instanceof Object;
                  console.info('WebResourceError constructor return isObject: ' + isObject);
                  Utils.emitEvent(String(isObject), 70036)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70037)
                }
                break;
              }
            }
          })

        Web({ src: 'resource://rawfile/second.html', controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}