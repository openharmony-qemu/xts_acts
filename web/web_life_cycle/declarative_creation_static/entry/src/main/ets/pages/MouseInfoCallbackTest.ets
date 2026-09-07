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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, OnTitleReceiveEvent, EmbedOptions, NativeEmbedMouseInfo, EventResult, MouseInfoCallback } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import Want from '@ohos.app.ability.Want';
import { Utils } from '../../src/test/Util.test';
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
        Button('MouseInfoCallbackTestButton')
          .key('MouseInfoCallbackTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitMouseInfoCallbackType': {
                try {
                  let callback: MouseInfoCallback = (event: NativeEmbedMouseInfo): void => {
                    console.info('MouseInfoCallback invoked');
                  };
                  if (callback != null && callback != undefined) {
                    let callbackType: string = typeof callback;
                    let isFunction: boolean = (callbackType === 'function');
                    console.info('MouseInfoCallback typeof: ' + callbackType);
                    Utils.emitEvent(isFunction, 113000)
                  } else {
                    Utils.emitEvent(false, 113000)
                  }
                } catch (error) {
                  console.error(`emitMouseInfoCallbackType ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 113000)
                }
                break;
              }
              case 'emitMouseInfoCallbackNormalEvent': {
                try {
                  let eventResult: EventResult = new EventResult();
                  let mouseInfo: NativeEmbedMouseInfo = {
                    embedId: 'testEmbedId',
                    result: eventResult
                  };
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = 'false';
                  let callback: MouseInfoCallback = (event: NativeEmbedMouseInfo): void => {
                    if (event != null && event != undefined) {
                      resultObj.str = 'true';
                      console.info('MouseInfoCallback normal event embedId: ' + event.embedId);
                    }
                  };
                  callback(mouseInfo);
                  Utils.emitEvent(resultObj.str === 'true', 113020)
                } catch (error) {
                  console.error(`emitMouseInfoCallbackNormalEvent ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 113020)
                }
                break;
              }
              case 'emitMouseInfoCallbackEventNullCheck': {
                try {
                  let eventResult: EventResult = new EventResult();
                  let mouseInfo: NativeEmbedMouseInfo = {
                    embedId: 'testEmbedId',
                    result: eventResult
                  };
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = 'false';
                  let callback: MouseInfoCallback = (event: NativeEmbedMouseInfo): void => {
                    if (event != null) {
                      resultObj.str = 'true';
                      console.info('MouseInfoCallback event is not null');
                    } else {
                      resultObj.str = 'false';
                      console.info('MouseInfoCallback event is null');
                    }
                  };
                  callback(mouseInfo);
                  Utils.emitEvent(resultObj.str === 'true', 113040)
                } catch (error) {
                  console.error(`emitMouseInfoCallbackEventNullCheck ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 113040)
                }
                break;
              }
              case 'emitMouseInfoCallbackEventUndefinedCheck': {
                try {
                  let eventResult: EventResult = new EventResult();
                  let mouseInfo: NativeEmbedMouseInfo = {
                    embedId: 'testEmbedId',
                    result: eventResult
                  };
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = 'false';
                  let callback: MouseInfoCallback = (event: NativeEmbedMouseInfo): void => {
                    if (event != undefined) {
                      resultObj.str = 'true';
                      console.info('MouseInfoCallback event is not undefined');
                    } else {
                      resultObj.str = 'false';
                      console.info('MouseInfoCallback event is undefined');
                    }
                  };
                  callback(mouseInfo);
                  Utils.emitEvent(resultObj.str === 'true', 113060)
                } catch (error) {
                  console.error(`emitMouseInfoCallbackEventUndefinedCheck ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 113060)
                }
                break;
              }
              case 'emitMouseInfoCallbackWithEmbedId': {
                try {
                  let mouseInfo: NativeEmbedMouseInfo = {
                    embedId: 'nativeEmbedId_001'
                  };
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = '';

                  let callback: MouseInfoCallback = (event: NativeEmbedMouseInfo): void => {
                    if (event != null && event.embedId != null && event.embedId != undefined) {
                      // 使用 ?? 确保类型安全
                      resultObj.str = event.embedId ?? '';
                      console.info('MouseInfoCallback embedId: ' + event.embedId);
                    } else {
                      resultObj.str = '';
                    }
                  };
                  callback(mouseInfo);
                  Utils.emitEvent(resultObj.str, 113080)
                } catch (error) {
                  console.error(`emitMouseInfoCallbackWithEmbedId ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 113080)
                }
                break;
              }
              case 'emitMouseInfoCallbackWithEventResult': {
                try {
                  let eventResult: EventResult = new EventResult();
                  let mouseInfo: NativeEmbedMouseInfo = {
                    embedId: 'testEmbedId',
                    result: eventResult
                  };
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = 'false';
                  let callback: MouseInfoCallback = (event: NativeEmbedMouseInfo): void => {
                    if (event != null && event != undefined && event.result != null && event.result != undefined) {
                      const result = event.result;
                      if (result != null) {
                        result.setMouseEventResult(true);
                        resultObj.str = 'true';
                        console.info('MouseInfoCallback setMouseEventResult success');
                      }
                      console.info('MouseInfoCallback setMouseEventResult success');
                    }
                  };
                  callback(mouseInfo);
                  Utils.emitEvent(resultObj.str === 'true', 113100)
                } catch (error) {
                  console.error(`emitMouseInfoCallbackWithEventResult ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 113100)
                }
                break;
              }
              case 'emitMouseInfoCallbackOnNativeEmbedMouseEvent': {
                try {
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = 'false';
                  let mouseInfoCallback: MouseInfoCallback = (event: NativeEmbedMouseInfo): void => {
                    if (event != null && event != undefined) {
                      resultObj.str = 'true';
                      console.info('onNativeEmbedMouseEvent callback invoked');
                    }
                  };
                  if (mouseInfoCallback != null && mouseInfoCallback != undefined) {
                    let callbackType: string = typeof mouseInfoCallback;
                    let isFunction: boolean = (callbackType === 'function');
                    console.info('onNativeEmbedMouseEvent callback typeof: ' + callbackType);
                    Utils.emitEvent(isFunction, 113120)
                  } else {
                    Utils.emitEvent(false, 113120)
                  }
                } catch (error) {
                  console.error(`emitMouseInfoCallbackOnNativeEmbedMouseEvent ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 113120)
                }
                break;
              }

              case 'emitSwitchNextPageWebInitTest': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebInitTest' })
                console.log('push URL success')
              }

              case 'emitSwitchNextPageOnContextMenuHideCallbackTest': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/OnContextMenuHideCallbackTest' })
                console.log('push URL success')
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
          .onNativeEmbedMouseEvent((event: NativeEmbedMouseInfo): void => {
            if (event != null && event != undefined) {
              console.info('onNativeEmbedMouseEvent event embedId: ' + event.embedId);
            }
          })
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

