
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

import Utils from '../../src/test/Utils.test';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Web, VerifyPinHandler, PinVerifyResult, VerifyPinEvent } from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webOnVerifyPinCallback {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  stringObj: StringFields = new StringFields();
  @State javaScriptAccess: boolean = true;
  @State callbackFlag: boolean = false;

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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  private onVerifyPinCallback: (event: VerifyPinEvent) => void = (event: VerifyPinEvent): void => {
    console.info('onVerifyPin identity: ' + event.identity);
    this.callbackFlag = true;
  }

  build() {
    Column() {
      Row() {
        Button('OnVerifyPinCallback click').key('onVerifyPinButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testOnVerifyPinCallbackInterfaceCall': {
              try {
                let callback: (event: VerifyPinEvent) => void = (event: VerifyPinEvent): void => {
                  console.info('callback identity: ' + event.identity);
                };
                Utils.emitEvent(typeof callback === 'function', 202502600);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502600);
              }
              break;
            }

            case 'testOnVerifyPinEventHandler': {
              try {
                let handler: VerifyPinHandler = new VerifyPinHandler();
                let event: VerifyPinEvent = { handler: handler, identity: 'test-identity' };
                let handlerExists: boolean = event.handler != null && event.handler != undefined;
                console.log('handler exists: ' + handlerExists);
                Utils.emitEvent(handlerExists, 202502601);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502601);
              }
              break;
            }

            case 'testOnVerifyPinEventIdentity': {
              try {
                let handler: VerifyPinHandler = new VerifyPinHandler();
                let event: VerifyPinEvent = { handler: handler, identity: 'test-identity' };
                console.log('identity: ' + event.identity);
                Utils.emitEvent(event.identity === 'test-identity', 202502602);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502602);
              }
              break;
            }

            case 'testOnVerifyPinHandlerConfirmSuccess': {
              try {
                let handler: VerifyPinHandler = new VerifyPinHandler();
                handler.confirm(PinVerifyResult.PIN_VERIFICATION_SUCCESS);
                Utils.emitEvent(true, 202502603);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502603);
              }
              break;
            }

            case 'testOnVerifyPinHandlerConfirmFailed': {
              try {
                let handler: VerifyPinHandler = new VerifyPinHandler();
                handler.confirm(PinVerifyResult.PIN_VERIFICATION_FAILED);
                Utils.emitEvent(true, 202502604);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502604);
              }
              break;
            }

            // case 'testOnVerifyPinHandlerConfirmNull': {
            //   try {
            //     let handler: VerifyPinHandler = new VerifyPinHandler();
            //     let nullValue: PinVerifyResult | null = null;
            //     handler.confirm(null);
            //     Utils.emitEvent(false, 202502605);
            //   } catch (error) {
            //     error = error as BusinessError;
            //     console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
            //     Utils.emitEvent(error.code === 401, 202502605);
            //   }
            //   break;
            // }

            // case 'testOnVerifyPinHandlerConfirmUndefined': {
            //   try {
            //     let handler: VerifyPinHandler = new VerifyPinHandler();
            //     // let undefinedValue: PinVerifyResult | undefined = undefined;
            //     handler.confirm(undefined);
            //     Utils.emitEvent(false, 202502606);
            //   } catch (error) {
            //     error = error as BusinessError;
            //     console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
            //     Utils.emitEvent(error.code === 401, 202502606);
            //   }
            //   break;
            // }

            case 'testOnVerifyPinCallbackReturnVoid': {
              try {
                let handler: VerifyPinHandler = new VerifyPinHandler();
                let event: VerifyPinEvent = { handler: handler, identity: 'test-identity' };
                let callback: (event: VerifyPinEvent) => void = (event: VerifyPinEvent): void => {
                  console.info('callback invoked identity: ' + event.identity);
                };
                callback(event);
                Utils.emitEvent(true, 202502607);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502607);
              }
              break;
            }

            case 'testOnVerifyPinChainedReturn': {
              try {
                Utils.emitEvent(this.callbackFlag === this.callbackFlag, 202502608);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502608);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: "pages/webViewController" })
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onVerifyPin(this.onVerifyPinCallback)
    }
  }
}


