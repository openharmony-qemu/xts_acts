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

type OnVerifyPinCallback = (event: object) => void;
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

  private onVerifyPinCallback: OnVerifyPinCallback = (event: object): void => {
    console.info('onVerifyPin identity: ' + (event as Record<string, string>)['identity']);
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
            case 'testVerifyPinHandlerConstructor001':
            case 'testVerifyPinHandlerConstructorReturn001': {
              Utils.emitEvent(typeof this.onVerifyPinCallback === 'function', 200220);
              Utils.emitEvent(typeof this.onVerifyPinCallback === 'function', 200230);
              break;
            }
            case 'testOnVerifyPinCallbackInterfaceCall001': {
              let callback: OnVerifyPinCallback = (event: object): void => {
                console.info('callback identity: ' + (event as Record<string, string>)['identity']);
              };
              Utils.emitEvent(typeof callback === 'function', 200240);
              break;
            }
            case 'testVerifyPinHandlerClass001': {
              Utils.emitEvent(typeof this.onVerifyPinCallback === 'function', 200250);
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
