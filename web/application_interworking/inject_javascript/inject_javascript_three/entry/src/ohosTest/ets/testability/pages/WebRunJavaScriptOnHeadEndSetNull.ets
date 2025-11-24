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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebRunJavaScriptOnHeadEndSetNull {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 2511222,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(2511222)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('RunJavaScriptOnHeadEndSetNull')
          .key('RunJavaScriptOnHeadEndSetNull')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, "RunJavaScriptOnHeadEndSetNull_isReceive", 0);
            await waitForExist(() => this.isPageEnd, "RunJavaScriptOnHeadEndSetNull_isPageEnd", 0);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'testRunJavaScriptOnHeadEndSetNull': {
                try {
                  this.controller.runJavaScript('getTestValue()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnHeadEndSetNull getTestValue() return error: ' + error)
                      Utils.emitEvent(error.code,25112406);
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnHeadEndSetNull getTestValue() return result: ' + result)
                      Utils.emitEvent(result,25112406);
                    }
                  });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                   Utils.emitEvent(error.code,25112406);
                }
                break;
              }

            }
         })
      }
      Web({ src: $rawfile('runJavaScriptOnHeadEnd.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .runJavaScriptOnHeadEnd(null)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('runJavaScriptOnHeadEnd onPageEnd url:' + event.url);
           }
        })
        .onConsole((event) => {
          if (event) {
            console.log('runJavaScriptOnHeadEnd message===>' + event.message.getMessage());
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
