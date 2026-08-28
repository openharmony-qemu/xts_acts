
'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, OnTitleReceiveEvent, EmbedOptions, FileSelectorParam } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import Want from '@ohos.app.ability.Want';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import common from '@ohos.app.ability.common';
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''
  @State title: string = 'test';
  @State errorCode: int = 0;
  @State errorMsg: string = 'failed';
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State zoomAccess: boolean = false;
  optionsTrue: EmbedOptions = { supportDefaultIntrinsicSize: true };
  optionsFalse: EmbedOptions = { supportDefaultIntrinsicSize: false };

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
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('FileSelectorParamTestButton')
          .key('FileSelectorParamTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitFileSelectorParamConstructor': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  if (param != null && param != undefined) {
                    console.info('FileSelectorParam constructor success');
                    Utils.emitEvent(true, 115000)
                  } else {
                    Utils.emitEvent(false, 115000)
                  }
                } catch (error) {
                  console.error(`emitFileSelectorParamConstructor ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115000)
                  Utils.emitEvent(this.errorMsg, 115010)
                }
                break;
              }
              case 'emitFileSelectorParamConstructorNullCheck': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  if (param != null) {
                    console.info('FileSelectorParam constructor result is not null');
                    Utils.emitEvent(true, 115020)
                  } else {
                    Utils.emitEvent(false, 115020)
                  }
                } catch (error) {
                  console.error(`emitFileSelectorParamConstructorNullCheck ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115020)
                  Utils.emitEvent(this.errorMsg, 115030)
                }
                break;
              }
              case 'emitFileSelectorParamConstructorUndefinedCheck': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  if (param != undefined) {
                    console.info('FileSelectorParam constructor result is not undefined');
                    Utils.emitEvent(true, 115040)
                  } else {
                    Utils.emitEvent(false, 115040)
                  }
                } catch (error) {
                  console.error(`emitFileSelectorParamConstructorUndefinedCheck ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115040)
                  Utils.emitEvent(this.errorMsg, 115050)
                }
                break;
              }
              case 'emitFileSelectorParamInstanceType': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  let isInstance: boolean = (param instanceof FileSelectorParam);
                  console.info('FileSelectorParam instanceof check: ' + isInstance);
                  Utils.emitEvent(isInstance, 115060)
                } catch (error) {
                  console.error(`emitFileSelectorParamInstanceType ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115060)
                  Utils.emitEvent(this.errorMsg, 115070)
                }
                break;
              }
              case 'emitFileSelectorParamGetTitle': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  let title: string = param.getTitle();
                  console.info('FileSelectorParam getTitle result: ' + title);
                  Utils.emitEvent(title, 115080)
                } catch (error) {
                  console.error(`emitFileSelectorParamGetTitle ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115080)
                  Utils.emitEvent(this.errorMsg, 115090)
                }
                break;
              }
              case 'emitFileSelectorParamGetMode': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  let mode: int = param.getMode();
                  console.info('FileSelectorParam getMode result: ' + mode);
                  Utils.emitEvent(mode, 115100)
                } catch (error) {
                  console.error(`emitFileSelectorParamGetMode ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115100)
                  Utils.emitEvent(this.errorMsg, 115110)
                }
                break;
              }
              case 'emitFileSelectorParamGetAcceptType': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  let acceptTypes: Array<string> = param.getAcceptType();
                  console.info('FileSelectorParam getAcceptType result: ' + JSON.stringify(acceptTypes));
                  Utils.emitEvent(JSON.stringify(acceptTypes), 115120)
                } catch (error) {
                  console.error(`emitFileSelectorParamGetAcceptType ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115120)
                  Utils.emitEvent(this.errorMsg, 115130)
                }
                break;
              }
              case 'emitFileSelectorParamIsCapture': {
                try {
                  let param: FileSelectorParam = new FileSelectorParam();
                  let capture: boolean = param.isCapture();
                  console.info('FileSelectorParam isCapture result: ' + capture);
                  Utils.emitEvent(capture, 115140)
                } catch (error) {
                  console.error(`emitFileSelectorParamIsCapture ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115140)
                  Utils.emitEvent(this.errorMsg, 115150)
                }
                break;
              }
              case 'emitFileSelectorParamMultipleInstances': {
                try {
                  let param1: FileSelectorParam = new FileSelectorParam();
                  let param2: FileSelectorParam = new FileSelectorParam();
                  let bothValid: boolean = (param1 != null && param2 != null && param1 !== param2);
                  console.info('FileSelectorParam multiple instances check: ' + bothValid);
                  Utils.emitEvent(bothValid, 115160)
                } catch (error) {
                  console.error(`emitFileSelectorParamMultipleInstances ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 115160)
                  Utils.emitEvent(this.errorMsg, 115170)
                }
                break;
              }



            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .zoomAccess(this.zoomAccess)
          .enableHapticFeedback(true)
          .enableNativeEmbedMode(true)
          .nativeEmbedOptions(this.optionsFalse)
          .onTitleReceive((event:OnTitleReceiveEvent):void => {
            if (event) {
              console.log('title:' + event.title);
              this.title = event.title
            }
          })

      }
    }
  }
}


