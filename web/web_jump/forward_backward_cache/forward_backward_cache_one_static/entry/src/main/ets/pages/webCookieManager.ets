'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { OnTitleReceiveEvent, OnDataResubmittedEvent, OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { JsProxyObject } from '../../src/test/Interfaces';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import { UIContext, Router } from '@ohos.arkui.UIContext';
export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct webCookieManager {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State webResult: string = ' ';
  @State str: string = ""
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
        Button('web click')
          .key('WebCookieManagerButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case "testIsCookieAllowed001": {
                webview.WebCookieManager.putAcceptCookieEnabled(true);
                setTimeout(() => {
                  Utils.emitEvent(webview.WebCookieManager.isCookieAllowed(), 30015)
                }, 3000)
                break;
              }
              case "testIsCookieAllowed002": {
                webview.WebCookieManager.putAcceptCookieEnabled(false);
                setTimeout(() => {
                  Utils.emitEvent(webview.WebCookieManager.isCookieAllowed(), 30016)
                }, 3000)
                break;
              }
              case "testIsThirdPartyCookieAllowed001": {
                webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(true);
                setTimeout(() => {
                  let result = webview.WebCookieManager.isThirdPartyCookieAllowed();
                  
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30025)
                }, 3000)
                break;
              }

              case "testIsThirdPartyCookieAllowed002": {
                webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
                setTimeout(() => {
                  let result = webview.WebCookieManager.isThirdPartyCookieAllowed();
                  
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30026)
                }, 3000)
                break;
              }
              case "testPutAcceptThirdPartyCookieEnabled001": {
                webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
                setTimeout(() => {
                  let result = webview.WebCookieManager.isThirdPartyCookieAllowed();
                  
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30033)
                }, 3000)
                break;
              }
              case "testPutAcceptCookieEnabledNull": {
                try {
                  webview.WebCookieManager.putAcceptCookieEnabled(null as boolean);
                  Utils.emitEvent(true, 30034);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(error.code, 30034);
                }
                break;
              }
              case "testPutAcceptCookieEnabledUndefined": {
                try {
                  webview.WebCookieManager.putAcceptCookieEnabled(undefined as boolean);
                  Utils.emitEvent(true, 30035);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(error.code, 30035);
                }
                break;
              }
              case "testPutAcceptThirdPartyCookieEnabledNull": {
                try {
                  webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(null as boolean);
                  Utils.emitEvent(true, 30036);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(error.code, 30036);
                }
                break;
              }
              case "testPutAcceptThirdPartyCookieEnabledUndefined": {
                try {
                  webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(undefined as boolean);
                  Utils.emitEvent(true, 30037);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  Utils.emitEvent(error.code, 30037);
                }
                break;
              }

              case 'testPutAcceptThirdPartyCookieEnabledNullStatic': {
                try {
                  let v: boolean | null = null;
                  webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(v as boolean);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                setTimeout(() => {
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30034)
                }, 3000)
                break;
              }

              case 'testPutAcceptThirdPartyCookieEnabledUndefinedStatic': {
                try {
                  let v: boolean | undefined = undefined;
                  webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(v as boolean);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                setTimeout(() => {
                  Utils.emitEvent(webview.WebCookieManager.isThirdPartyCookieAllowed(), 30035)
                }, 3000)
                break;
              }

              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webEumClass' })
                console.log('push URL success')
              }


            }
          })
      }
      Web({ src: "resource://rawfile/index.html", controller: this.controller })
        .fileAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .javaScriptAccess(true)

    }
  }
}
