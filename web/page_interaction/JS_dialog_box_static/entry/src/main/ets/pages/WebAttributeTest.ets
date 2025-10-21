/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import webview from '@ohos.web.webview'
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Text, Web, } from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium';
import Utils from '../../src/test/Utils.test';

class StringFields {
  private str: string = '';
}
@Entry
@Component
struct webViewController {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ""
  @State initialScale: number = 100
  @State newScale: number = 0
  @State oldScale: number = 0
  @State geolocationAccess: boolean = true
  @State blockNetwork: boolean = false
  @State progress: string = ""
  @State pageBegin: string = ""
  @State pageEnd: string = ""
  @State alert: string = ""
  @State confirm: string = ""
  @State prompt: string = ""
  @State newUrl: string = ""
  @State isRefreshed: boolean = false
  @State searchResultCount: number = -1
  @State onInterceptKeyEventCode: number = 0;
  @State onFaviconReceivedCalled: boolean = false
  @State handleCancel: boolean = false;
  @State title: string = ''
  @State onRequestSelectedCalled: boolean = false

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
      }
    }
  }

  build() {
    Column() {
      Row() {
          Button("WebViewController click").key('WebAttributeTestButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitJsResultHandleCancel001": {
              try {
                this.handleCancel = true
                this.controller.loadUrl("resource://rawfile/confirm.html");
                this.controller.runJavaScript("confirmTest()", (error, result) => {
                  if (error) {
                    console.info('confirmTest() return error: ' + error)
                  }
                  if (result) {
                    console.info('confirmTest() return result: ' + result)
                      Utils.emitEvent(result, 70021)
                  }
                })
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: "resource://rawfile/confirm.html", controller: this.controller })
        .key('webView')
        .height('50%')
        .fileAccess(true)
        .width('100%')
        .javaScriptAccess(true)
        .horizontalScrollBarAccess(true)
        .verticalScrollBarAccess(true)
        .initialScale(this.initialScale)
        .geolocationAccess(this.geolocationAccess)
        .databaseAccess(true)
        .blockNetwork(this.blockNetwork)
        .onRefreshAccessedHistory((event) => {
          console.info("onRefreshAccessedHistory==>")
          if (event) {
            this.newUrl = event.url
            this.isRefreshed = event.isRefreshed
          }
        })
        .onScaleChange((event) => {
          console.log('onScaleChange called oldScale :' + event.oldScale)
          console.log('onScaleChange called newScale :' + event.newScale)
          this.oldScale = event.oldScale
          this.newScale = event.newScale
        })
        .onPageBegin((event) => {
          if (event) {
            this.pageBegin = event.url
            console.log("onPageBegin==> event.url:" + event.url)
          }
        })
        .onProgressChange((event) => {
          if (event) {
            this.progress = event.newProgress + ""
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.pageEnd = event.url
            console.log("onPageEnd==> event.url:" + event.url)
            console.log("onPageEnd==> this.pageEnd:" + this.pageEnd)
          }
        })
        .onRequestSelected(() => {
          console.log("onRequestSelected==>")
          this.onRequestSelectedCalled = true
        })
        .onFocus(() => {
          console.log("WebOnFocus==>")
        })
        .onAlert((event) => {
          if (event) {
            console.log("event.url:" + event.url)
            console.log("event.message:" + event.message)
            this.alert = event.message
          }
          return false
        })
        .onConfirm((event) => {
          if (event) {
            console.log("event.url:" + event.url)
            console.log("event.message:" + event.message)
            this.confirm = event.message;
            if (this.handleCancel) {
              event.result.handleCancel()
            } else {
              event.result.handleConfirm()
            }
          }
          return true
        })
        .onPrompt((event) => {
          if (event) {
            console.log("event.url:" + event.url)
            console.log("event.message:" + event.message)
            console.log("event.value:" + event.value)
            this.prompt = event.message;
            event.result.handlePromptConfirm('handlePromptConfirm')
          }
          return true
        })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            this.searchResultCount = ret.numberOfMatches
          }
        })
        .onInterceptKeyEvent((event) => {
          console.log("onInterceptKeyEvent==>")
          if (event) {
            this.onInterceptKeyEventCode = event.keyCode
          }
          return false;
        })
        .onTouchIconUrlReceived((event) => {
          if (event) {
            console.log('onTouchIconUrlReceived:' + JSON.stringify(event))
          }
        })
        .onFaviconReceived((event) => {
          this.onFaviconReceivedCalled = true
          if (event) {
            console.log('onFaviconReceived' + JSON.stringify(event));
          }
        })
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.title = event.title
          }
        })
    }
  }
}
