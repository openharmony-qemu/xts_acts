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
import {
  WebResourceResponse,
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
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';

export class StringFields {
  public str: string = '';
}

type ResponseBodyData = String | Int | ArrayBuffer;

@Entry
@Component
struct webResourceResponseSetResponseBodyParam {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  response: WebResourceResponse = new WebResourceResponse();
  htmlBody: string = '<!DOCTYPE html><html><body><h1>setResponseBodyStatic</h1></body></html>';
  rawfilePath: string = '$rawfile(\'index.html\')';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174700,
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
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .width('100%')
        .height('80%')

      Row() {
        Button('webResourceResponseSetResponseBodyParamStatic').key('webResourceResponseSetResponseBodyParamStaticButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitSetResponseBodyNullStatic001': {
                try {
                  this.response.setResponseBody(null as ResponseBodyData);
                  Utils.emitEvent('success', 174710);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174710);
                }
                break;
              }
              case 'emitSetResponseBodyUndefinedStatic001': {
                try {
                  this.response.setResponseBody(undefined as ResponseBodyData);
                  Utils.emitEvent('success', 174720);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174720);
                }
                break;
              }
              case 'emitSetResponseBodyEmptyStringStatic001': {
                try {
                  this.response.setResponseBody('');
                  Utils.emitEvent('success', 174730);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174730);
                }
                break;
              }
              case 'emitSetResponseBodyHtmlStringStatic001': {
                try {
                  this.response.setResponseBody(this.htmlBody);
                  Utils.emitEvent('success', 174735);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174735);
                }
                break;
              }
              case 'emitSetResponseBodyNumberStatic001': {
                try {
                  this.response.setResponseBody(123);
                  Utils.emitEvent('success', 174740);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174740);
                }
                break;
              }
              case 'emitSetResponseBodyNumberZeroStatic001': {
                try {
                  this.response.setResponseBody(0);
                  Utils.emitEvent('success', 174750);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174750);
                }
                break;
              }
              case 'emitSetResponseBodyNumberNegativeStatic001': {
                try {
                  this.response.setResponseBody(-1);
                  Utils.emitEvent('success', 174760);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174760);
                }
                break;
              }
              case 'emitSetResponseBodyResourceStatic001': {
                try {
                  this.response.setResponseBody(this.rawfilePath);
                  Utils.emitEvent('success', 174770);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174770);
                }
                break;
              }
              case 'emitSetResponseBodyArrayBufferStatic001': {
                try {
                  let buffer = new ArrayBuffer(8);
                  let view = new Uint8Array(buffer);
                  view[0] = 0x48;
                  this.response.setResponseBody(buffer);
                  Utils.emitEvent('success', 174780);
                } catch (error) {
                  let err = error as BusinessError;
                  Utils.emitEvent(String(err.code), 174780);
                }
                break;
              }
              default:
                console.info('can not match case');
            }
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}
