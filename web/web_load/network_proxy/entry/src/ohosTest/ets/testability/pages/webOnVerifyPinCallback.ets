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
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { VerifyPinHandler, VerifyPinEvent } from '@ohos.arkui.component';

type OnVerifyPinCallback = (event: VerifyPinEvent) => void;
const EVENT_ID_SET_EMIT_KEY = 200215;

@Entry
@Component
struct webOnVerifyPinCallback {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State callbackFlag: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  private onVerifyPinCallback: OnVerifyPinCallback = (event: VerifyPinEvent): void => {
    console.info('onVerifyPin identity: ' + event.identity);
    this.callbackFlag = true;
  }

  build() {
    Column() {
      Row() {
        Button('OnVerifyPinCallback click').key('onVerifyPinButton').onClick(async () => {
          await Utils.waitForExist(() => this.isPageEnd, 'onVerifyPinButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(() => this.isReceive, 'onVerifyPinButtonIsReceive', 1, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'testVerifyPinHandlerConstructor001': {
              try {
                let handler: VerifyPinHandler = new VerifyPinHandler();
                let isDefined: boolean = handler !== undefined && handler !== null;
                Utils.emitEvent(isDefined, 200220);
                let isInstance: boolean = handler instanceof VerifyPinHandler;
                Utils.emitEvent(isInstance, 200230);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 200220);
                Utils.emitEvent(false, 200230);
              }
              break;
            }
            case 'testOnVerifyPinCallbackInterfaceCall001': {
              try {
                let callback: OnVerifyPinCallback = (event: VerifyPinEvent): void => {
                  console.info('callback identity: ' + event.identity);
                };
                Utils.emitEvent(typeof callback === 'function', 200240);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 200240);
              }
              break;
            }
            case 'testVerifyPinHandlerClass001': {
              try {
                let isClassExported: boolean = VerifyPinHandler != null &&
                  typeof VerifyPinHandler === 'function';
                Utils.emitEvent(isClassExported, 200250);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 200250);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onVerifyPin(this.onVerifyPinCallback)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
