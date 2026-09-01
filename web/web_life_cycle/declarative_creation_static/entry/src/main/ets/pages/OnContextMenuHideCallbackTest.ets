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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, OnTitleReceiveEvent, EmbedOptions, OnContextMenuHideCallback } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Utils } from '../../src/test/Util.test';
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
        Button('OnContextMenuHideCallbackTestButton')
          .key('OnContextMenuHideCallbackTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitOnContextMenuHideCallbackType': {
                try {
                  let callback: OnContextMenuHideCallback = (): void => {
                    console.info('OnContextMenuHideCallback invoked');
                  };
                  if (callback != null && callback != undefined) {
                    let callbackType: string = typeof callback;
                    let isFunction: boolean = (callbackType === 'function');
                    console.info('OnContextMenuHideCallback typeof: ' + callbackType);
                    Utils.emitEvent(isFunction, 114000)
                  } else {
                    Utils.emitEvent(false, 114000)
                  }
                } catch (error) {
                  console.error(`emitOnContextMenuHideCallbackType ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 114000)
                }
                break;
              }
              case 'emitOnContextMenuHideCallbackNormalInvoke': {
                try {
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = 'false';
                  let callback: OnContextMenuHideCallback = (): void => {
                    resultObj.str = 'true';
                    console.info('OnContextMenuHideCallback normal invoke success');
                  };
                  callback();
                  Utils.emitEvent(resultObj.str === 'true', 114020)
                } catch (error) {
                  console.error(`emitOnContextMenuHideCallbackNormalInvoke ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 114020)
                }
                break;
              }
              case 'emitOnContextMenuHideCallbackParamNull': {
                try {
                  let callback: OnContextMenuHideCallback | undefined = (): void => {
                    console.info('OnContextMenuHideCallback param null check invoke');
                  };
                  if (callback != null) {
                    callback();
                    Utils.emitEvent(true, 114040)
                  } else {
                    Utils.emitEvent(false, 114040)
                  }
                } catch (error) {
                  console.error(`emitOnContextMenuHideCallbackParamNull ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 114040)
                }
                break;
              }
              case 'emitOnContextMenuHideCallbackParamUndefined': {
                try {
                  let callback: OnContextMenuHideCallback | undefined = undefined;
                  if (callback != undefined) {
                    (callback as () => void)();
                    Utils.emitEvent(false, 114060)
                  } else {
                    Utils.emitEvent(true, 114060)
                  }
                } catch (error) {
                  console.error(`emitOnContextMenuHideCallbackParamUndefined ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 114060)
                }
                break;
              }
              case 'emitOnContextMenuHideCallbackOnContextMenuHide': {
                try {
                  let resultObj: StringFields = new StringFields();
                  resultObj.str = 'false';
                  let callback: OnContextMenuHideCallback = (): void => {
                    resultObj.str = 'true';
                    console.info('onContextMenuHide callback invoked');
                  };
                  if (callback != null && callback != undefined) {
                    let callbackType: string = typeof callback;
                    let isFunction: boolean = (callbackType === 'function');
                    console.info('onContextMenuHide callback typeof: ' + callbackType);
                    Utils.emitEvent(isFunction, 114080)
                  } else {
                    Utils.emitEvent(false, 114080)
                  }
                } catch (error) {
                  console.error(`emitOnContextMenuHideCallbackOnContextMenuHide ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 114080)
                }
                break;
              }
              case 'emitOnContextMenuHideCallbackReturnType': {
                try {
                  let callback: OnContextMenuHideCallback = (): void => {
                    console.info('OnContextMenuHideCallback return type test');
                  };
                  let result: void = callback();
                  if (result === undefined) {
                    Utils.emitEvent(true, 114100)
                  } else {
                    Utils.emitEvent(false, 114100)
                  }
                } catch (error) {
                  console.error(`emitOnContextMenuHideCallbackReturnType ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 114100)
                }
                break;
              }

              case 'emitSwitchNextPageWebInitTest': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebInitTest' })
                console.log('push URL success')
              }

              case 'emitSwitchNextPageFileSelectorParamTest': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/FileSelectorParamTest' })
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
          .onContextMenuHide((): void => {
            console.info('onContextMenuHide callback invoked');
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


