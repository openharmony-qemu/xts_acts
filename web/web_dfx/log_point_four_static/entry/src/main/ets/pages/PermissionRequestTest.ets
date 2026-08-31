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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, OnTitleReceiveEvent, EmbedOptions, PermissionRequest } from '@ohos.arkui.component';
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
        Button('PermissionRequestTestButton')
          .key('PermissionRequestTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitPermissionRequestConstructor': {
                try {
                  let request: PermissionRequest = new PermissionRequest();
                  if (request != null && request != undefined) {
                    console.info('PermissionRequest constructor success');
                    Utils.emitEvent(true, 112000)
                  } else {
                    Utils.emitEvent(false, 112000)
                  }
                } catch (error) {
                  console.error(`emitPermissionRequestConstructor ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112000)
                  Utils.emitEvent(this.errorMsg, 112010)
                }
                break;
              }
              case 'emitPermissionRequestInstanceType': {
                try {
                  let request: PermissionRequest = new PermissionRequest();
                  let isInstance: boolean = (request instanceof PermissionRequest);
                  console.info('PermissionRequest instanceof check: ' + isInstance);
                  Utils.emitEvent(isInstance, 112020)
                } catch (error) {
                  console.error(`emitPermissionRequestInstanceType ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112020)
                  Utils.emitEvent(this.errorMsg, 112030)
                }
                break;
              }
              case 'emitPermissionRequestGetOrigin': {
                try {
                  let request: PermissionRequest = new PermissionRequest();
                  let origin: string = request.getOrigin();
                  console.info('PermissionRequest getOrigin result: ' + origin);
                  Utils.emitEvent(origin, 112040)
                } catch (error) {
                  console.error(`emitPermissionRequestGetOrigin ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112040)
                  Utils.emitEvent(this.errorMsg, 112050)
                }
                break;
              }
              case 'emitPermissionRequestGetAccessibleResource': {
                try {
                  let request: PermissionRequest = new PermissionRequest();
                  let resources: Array<string> = request.getAccessibleResource();
                  console.info('PermissionRequest getAccessibleResource result: ' + JSON.stringify(resources));
                  Utils.emitEvent(JSON.stringify(resources), 112060)
                } catch (error) {
                  console.error(`emitPermissionRequestGetAccessibleResource ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112060)
                  Utils.emitEvent(this.errorMsg, 112070)
                }
                break;
              }
              case 'emitPermissionRequestDeny': {
                try {
                  let request: PermissionRequest = new PermissionRequest();
                  request.deny();
                  console.info('PermissionRequest deny success');
                  Utils.emitEvent(true, 112080)
                } catch (error) {
                  console.error(`emitPermissionRequestDeny ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112080)
                  Utils.emitEvent(this.errorMsg, 112090)
                }
                break;
              }
              case 'emitPermissionRequestGrantEmpty': {
                try {
                  let request: PermissionRequest = new PermissionRequest();
                  request.grant([]);
                  console.info('PermissionRequest grant empty array success');
                  Utils.emitEvent(true, 112100)
                } catch (error) {
                  console.error(`emitPermissionRequestGrantEmpty ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112100)
                  Utils.emitEvent(this.errorMsg, 112110)
                }
                break;
              }
              case 'emitPermissionRequestGrantResources': {
                try {
                  let request: PermissionRequest = new PermissionRequest();
                  request.grant(['TYPE_VIDEO_CAPTURE', 'TYPE_AUDIO_CAPTURE']);
                  console.info('PermissionRequest grant resources success');
                  Utils.emitEvent(true, 112120)
                } catch (error) {
                  console.error(`emitPermissionRequestGrantResources ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112120)
                  Utils.emitEvent(this.errorMsg, 112130)
                }
                break;
              }
              case 'emitPermissionRequestMultipleInstances': {
                try {
                  let request1: PermissionRequest = new PermissionRequest();
                  let request2: PermissionRequest = new PermissionRequest();
                  let bothValid: boolean = (request1 != null && request2 != null && request1 !== request2);
                  console.info('PermissionRequest multiple instances check: ' + bothValid);
                  Utils.emitEvent(bothValid, 112140)
                } catch (error) {
                  console.error(`emitPermissionRequestMultipleInstances ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 112140)
                  Utils.emitEvent(this.errorMsg, 112150)
                }
                break;
              }

              case 'emitSwitchNextPageVerifyPinHandlerTest': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/VerifyPinHandlerTest' })
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

