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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, OnTitleReceiveEvent, EmbedOptions, VerifyPinHandler, PinVerifyResult } from '@ohos.arkui.component';
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
        Button('VerifyPinHandlerTestButton')
          .key('VerifyPinHandlerTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitVerifyPinHandlerConstructor': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  if (handler != null && handler != undefined) {
                    console.info('VerifyPinHandler constructor success');
                    Utils.emitEvent(true, 112200)
                  } else {
                    Utils.emitEvent(false, 112200)
                  }
                } catch (error) {
                  console.error(`emitVerifyPinHandlerConstructor ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112200)
                }
                break;
              }
              case 'emitVerifyPinHandlerInstanceType': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  let isInstance: boolean = (handler instanceof VerifyPinHandler);
                  console.info('VerifyPinHandler instanceof check: ' + isInstance);
                  Utils.emitEvent(isInstance, 112220)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerInstanceType ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112220)
                }
                break;
              }
              // 失败
              case 'emitVerifyPinHandlerConfirmSuccess': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  handler.confirm(PinVerifyResult.PIN_VERIFICATION_SUCCESS);
                  console.info('VerifyPinHandler confirm PIN_VERIFICATION_SUCCESS success');
                  Utils.emitEvent(true, 112240)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerConfirmSuccess ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112240)
                }
                break;
              }
              // 失败
              case 'emitVerifyPinHandlerConfirmFailed': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  handler.confirm(PinVerifyResult.PIN_VERIFICATION_FAILED);
                  console.info('VerifyPinHandler confirm PIN_VERIFICATION_FAILED success');
                  Utils.emitEvent(true, 112260)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerConfirmFailed ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112260)
                }
                break;
              }
              case 'emitVerifyPinHandlerMultipleInstances': {
                try {
                  let handler1: VerifyPinHandler = new VerifyPinHandler();
                  let handler2: VerifyPinHandler = new VerifyPinHandler();
                  let bothValid: boolean = (handler1 != null && handler2 != null && handler1 !== handler2);
                  console.info('VerifyPinHandler multiple instances check: ' + bothValid);
                  Utils.emitEvent(bothValid, 112280)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerMultipleInstances ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112280)
                }
                break;
              }
              case 'emitVerifyPinHandlerPinVerifyResultSuccessValue': {
                try {
                  let successValue: int = PinVerifyResult.PIN_VERIFICATION_SUCCESS;
                  console.info('PinVerifyResult.PIN_VERIFICATION_SUCCESS value: ' + successValue);
                  Utils.emitEvent(successValue, 112300)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerPinVerifyResultSuccessValue ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112300)
                }
                break;
              }
              case 'emitVerifyPinHandlerPinVerifyResultFailedValue': {
                try {
                  let failedValue: int = PinVerifyResult.PIN_VERIFICATION_FAILED;
                  console.info('PinVerifyResult.PIN_VERIFICATION_FAILED value: ' + failedValue);
                  Utils.emitEvent(failedValue, 112320)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerPinVerifyResultFailedValue ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112320)
                }
                break;
              }
              case 'emitVerifyPinHandlerClassExportTypeof': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  let handlerType: string = typeof handler;
                  console.info('VerifyPinHandler instance typeof: ' + handlerType);
                  let isObject: boolean = (handlerType === 'object');
                  Utils.emitEvent(isObject, 112400)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerClassExportTypeof ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112400)
                }
                break;
              }
              case 'emitVerifyPinHandlerClassExportConfirmMethodExists': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  let confirmType: string = typeof handler.confirm;
                  console.info('VerifyPinHandler confirm method typeof: ' + confirmType);
                  let isFunction: boolean = (confirmType === 'function');
                  Utils.emitEvent(isFunction, 112420)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerClassExportConfirmMethodExists ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112420)
                }
                break;
              }
              case 'emitVerifyPinHandlerClassExportSharedPrototype': {
                try {
                  let handler1: VerifyPinHandler = new VerifyPinHandler();
                  let handler2: VerifyPinHandler = new VerifyPinHandler();
                  let confirm1Str: string = String(handler1.confirm);
                  let confirm2Str: string = String(handler2.confirm);
                  console.info('VerifyPinHandler confirm1: ' + confirm1Str + ', confirm2: ' + confirm2Str);
                  let isShared: boolean = (confirm1Str === confirm2Str);
                  Utils.emitEvent(isShared, 112440)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerClassExportSharedPrototype ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112440)
                }
                break;
              }
              case 'emitVerifyPinHandlerClassExportInstanceObject': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  let isObject: boolean = (handler instanceof Object);
                  console.info('VerifyPinHandler instanceof Object: ' + isObject);
                  Utils.emitEvent(isObject, 112460)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerClassExportInstanceObject ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112460)
                }
                break;
              }
              //失败
              case 'emitVerifyPinHandlerClassExportConfirmBothEnums': {
                try {
                  let handler1: VerifyPinHandler = new VerifyPinHandler();
                  handler1.confirm(PinVerifyResult.PIN_VERIFICATION_SUCCESS);
                  console.info('VerifyPinHandler confirm PIN_VERIFICATION_SUCCESS done');
                  let handler2: VerifyPinHandler = new VerifyPinHandler();
                  handler2.confirm(PinVerifyResult.PIN_VERIFICATION_FAILED);
                  console.info('VerifyPinHandler confirm PIN_VERIFICATION_FAILED done');
                  Utils.emitEvent(true, 112480)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerClassExportConfirmBothEnums ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112480)
                }
                break;
              }
              case 'emitVerifyPinHandlerClassExportClassAccessible': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  let classAccessible: boolean = (VerifyPinHandler != null && VerifyPinHandler != undefined);
                  console.info('VerifyPinHandler class accessible: ' + classAccessible);
                  Utils.emitEvent(classAccessible, 112500)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerClassExportClassAccessible ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112500)
                }
                break;
              }
              case 'emitVerifyPinHandlerClassExportPrototypeHasConfirm': {
                try {
                  let handler: VerifyPinHandler = new VerifyPinHandler();
                  // let hasConfirm: boolean = ('confirm' in handler);
                  let hasConfirm: boolean = handler.confirm !== undefined;
                  console.info('VerifyPinHandler instance has confirm in: ' + hasConfirm);
                  Utils.emitEvent(hasConfirm, 112520)
                } catch (error) {
                  console.error(`emitVerifyPinHandlerClassExportPrototypeHasConfirm ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112520)
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

