/**
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

import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import Utils from '../../test/Utils.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 127001;
const driver = Driver.create();

@Entry
@Component
struct WebOnDataResubmitted {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State onDataResubmittedCalled: boolean = false;
  @State resend: boolean = true;
  @State title: string = '';

  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State emitKey: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build() {
    Column() {
      Row() {
        Button("web click").onClick(async () => {
          this.controller.backward();
        });

        Button("web click").key('WebOnDataResubmittedTestButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'WebOnDataResubmittedTestButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;

          switch (this.str) {
            case "emitOnDataResubmitted": {
              try {
                await Utils.waitAndClickComponent(driver,'WebOnDataResubmittedTestWebView')
                this.isPageEnd =-1;
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                this.controller.refresh();
                this.isPageEnd =-1;
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                Utils.emitEvent(this.onDataResubmittedCalled, 127010)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitDataResubmissionHandlerResend": {
              try {
                this.controller.loadUrl("resource://rawfile/dataSubmit.html");
                this.isPageEnd =-1;
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                this.title = ''
                await Utils.clickComponent('WebOnDataResubmittedTestWebView')
                this.isPageEnd =-1;
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                this.controller.refresh();
                this.isPageEnd =-1;
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                Utils.emitEvent(this.title, 127020)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitDataResubmissionHandlerCancel": {
              try {
                this.controller.loadUrl("resource://rawfile/dataSubmit.html");
                this.resend = false
                this.isPageEnd =-1;
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                this.isPageEnd =-1;
                this.title = ''
                await Utils.clickComponent('WebOnDataResubmittedTestWebView')
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                this.isPageEnd =-1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'WebOnDataResubmittedTestWebView', 1, 1000);
                Utils.emitEvent(this.title, 127030)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('dataSubmit.html'), controller: this.controller })
        .key('WebOnDataResubmittedTestWebView')
        .javaScriptAccess(true)
        .onDataResubmitted((event) => {
          this.onDataResubmittedCalled = true
          if (event) {
            if (this.resend) {
              event.handler.resend();
            } else {
              event.handler.cancel();
            }
          }
        })
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.title += event.title
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}