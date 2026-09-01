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

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  WebResourceResponse, Header, OnInterceptRequestEvent, ContextMenuEditStateFlags, OnTitleReceiveEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerTwo: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State responseCode: Int = 200
  @State title: string = 'test';
  @State SiteIsolationModeArr: webView.SiteIsolationMode[] = [webView.SiteIsolationMode.PARTIAL,webView.SiteIsolationMode.STRICT]

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
        Button('WebErrorPageButton')
          .key('WebErrorPageButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitSetErrorPageEnabledAndGetErrorPageEnabled01': {
                try {
                  this.controller.setErrorPageEnabled(true);
                  let result = this.controller.getErrorPageEnabled();
                  Utils.emitEvent(result, 60600);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetErrorPageEnabledAndGetErrorPageEnabled02': {
                try {
                  this.controller.setErrorPageEnabled(false);
                  let result = this.controller.getErrorPageEnabled();
                  Utils.emitEvent(result, 60601);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }


              case 'emitSetErrorPageEnabledErrorCode01': {
                try {
                  this.controllerTwo.setErrorPageEnabled(true);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(Number(error.code), 60604);
                }
                break;
              }

              case 'emitGetErrorPageEnabledErrorCode01': {
                try {
                  this.controllerTwo.getErrorPageEnabled();
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(Number(error.code), 60605);
                }
                break;
              }

              case 'emitPrivateNetworkAccess01': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(true);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  Utils.emitEvent(result, 60606);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitPrivateNetworkAccess02': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(false);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  Utils.emitEvent(result, 60607);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetAutoPreconnectFalse': {
                try {
                  webView.WebviewController.setAutoPreconnect(false)
                  let result = webView.WebviewController.isAutoPreconnectEnabled()
                  Utils.emitEvent(result, 60608);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetAutoPreconnectTrue': {
                try {
                  webView.WebviewController.setAutoPreconnect(true)
                  let result = webView.WebviewController.isAutoPreconnectEnabled()
                  Utils.emitEvent(result, 60609);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitWebSiteIsolationMode001': {
                try {
                  webView.WebviewController.setSiteIsolationMode(webView.SiteIsolationMode.PARTIAL)
                  let result1 = webView.WebviewController.getSiteIsolationMode()
                  let result = false;
                  if (this.SiteIsolationModeArr[result1] == webView.SiteIsolationMode.PARTIAL) {
                    result = true;
                  }
                  Utils.emitEvent(result, 60610);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebSiteIsolationMode002': {
                try {
                  webView.WebviewController.setSiteIsolationMode(webView.SiteIsolationMode.STRICT)
                  let result1 = webView.WebviewController.getSiteIsolationMode()
                  let result = false;
                  if (this.SiteIsolationModeArr[result1] == webView.SiteIsolationMode.STRICT) {
                    result = true;
                  }
                  Utils.emitEvent(result, 60611);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 60611);
                }
                break;
              }
              case 'emitEnableAdsBlockErr': {
                try {
                  this.controllerTwo.enableAdsBlock(true)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 60612);
                }
                break;
              }
              case 'emitIsAdsBlockEnabledCheck001': {
                try {
                  this.controller.enableAdsBlock(true)
                  let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                  console.log(' isAdsBlockEnabled:  ', isBlocked);
                  Utils.emitEvent(isBlocked, 60613);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitIsAdsBlockEnabledCheck002': {
                try {
                  this.controller.enableAdsBlock(false)
                  let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                  console.log(' isAdsBlockEnabled:  ', isBlocked);
                  Utils.emitEvent(isBlocked, 60614);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitIsAdsBlockEnabledForCurPage': {
                try {
                  this.controller.enableAdsBlock(false)
                  let isBlocked: boolean = this.controller.isAdsBlockEnabledForCurPage();
                  console.log(' isAdsBlockEnabled:  ', isBlocked);
                  Utils.emitEvent(isBlocked, 60616);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframe01': {
                try {
                  this.controller.setErrorPageEnabled(true, true);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' + (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60620);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.message, 60620);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframe02': {
                try {
                  this.controller.setErrorPageEnabled(true, false);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' + (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60621);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.message, 60621);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframe03': {
                try {
                  this.controller.setErrorPageEnabled(false, true);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' + (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60622);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.message, 60622);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframe04': {
                try {
                  this.controller.setErrorPageEnabled(false, false);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' + (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60623);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.message, 60623);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframeErrorCode01': {
                try {
                  this.controllerTwo.setErrorPageEnabled(true, true);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(Number(error.code), 60624);
                }
                break;
              }

              case 'emitGetSubframeErrorPageEnabledErrorCode01': {
                try {
                  this.controllerTwo.getSubframeErrorPageEnabled();
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(Number(error.code), 60625);
                }
                break;
              }

              case 'emitEnableAdsBlockNull': {
                try {
                  let param: boolean | null = null;
                  this.controller.enableAdsBlock(param as boolean);
                  let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                  Utils.emitEvent(isBlocked, 60626);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60626);
                }
                break;
              }

              case 'emitEnableAdsBlockUndefined': {
                try {
                  let param: boolean | undefined = undefined;
                  this.controller.enableAdsBlock(param as boolean);
                  let isBlocked: boolean = this.controller.isAdsBlockEnabled();
                  Utils.emitEvent(isBlocked, 60627);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60627);
                }
                break;
              }

              case 'emitSetErrorPageEnabledNull': {
                try {
                  let param: boolean | null = null;
                  this.controller.setErrorPageEnabled(param as boolean);
                  let result = this.controller.getErrorPageEnabled();
                  Utils.emitEvent(result, 60628);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60628);
                }
                break;
              }

              case 'emitSetErrorPageEnabledUndefined': {
                try {
                  let param: boolean | undefined = undefined;
                  this.controller.setErrorPageEnabled(param as boolean);
                  let result = this.controller.getErrorPageEnabled();
                  Utils.emitEvent(result, 60629);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60629);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframeNullEnable': {
                try {
                  let param: boolean | null = null;
                  this.controller.setErrorPageEnabled(param as boolean, true);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' +
                    (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60630);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60630);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframeUndefinedEnable': {
                try {
                  let param: boolean | undefined = undefined;
                  this.controller.setErrorPageEnabled(param as boolean, true);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' +
                    (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60631);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60631);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframeNullSubframe': {
                try {
                  let subframe: boolean | null = null;
                  this.controller.setErrorPageEnabled(true, subframe as boolean);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' +
                    (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60632);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60632);
                }
                break;
              }

              case 'emitSetErrorPageEnabledWithSubframeUndefinedSubframe': {
                try {
                  let subframe: boolean | undefined = undefined;
                  this.controller.setErrorPageEnabled(true, subframe as boolean);
                  let enableResult: boolean = this.controller.getErrorPageEnabled();
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  let resultStr: string = (enableResult ? 'true' : 'false') + ',' +
                    (subframeResult ? 'true' : 'false');
                  Utils.emitEvent(resultStr, 60633);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60633);
                }
                break;
              }

              case 'emitGetSubframeErrorPageEnabledStandalone': {
                try {
                  this.controller.setErrorPageEnabled(true, true);
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  Utils.emitEvent(subframeResult, 60634);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.message, 60634);
                }
                break;
              }

              case 'emitGetSubframeErrorPageEnabledReturnFalse': {
                try {
                  this.controller.setErrorPageEnabled(true, false);
                  let subframeResult: boolean = this.controller.getSubframeErrorPageEnabled();
                  Utils.emitEvent(subframeResult, 60642);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(Number(error.code), 60642);
                }
                break;
              }

              case 'emitPrivateNetworkAccessNull': {
                try {
                  let param: boolean | null = null;
                  webView.WebviewController.enablePrivateNetworkAccess(param as boolean);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  Utils.emitEvent(String(result), 60635);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60635);
                }
                break;
              }

              case 'emitPrivateNetworkAccessUndefined': {
                try {
                  let param: boolean | undefined = undefined;
                  webView.WebviewController.enablePrivateNetworkAccess(param as boolean);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  Utils.emitEvent(String(result), 60636);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60636);
                }
                break;
              }

              case 'emitSetAutoPreconnectNull': {
                try {
                  let param: boolean | null = null;
                  webView.WebviewController.setAutoPreconnect(param as boolean);
                  let result = webView.WebviewController.isAutoPreconnectEnabled();
                  Utils.emitEvent(String(result), 60637);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60637);
                }
                break;
              }

              case 'emitSetAutoPreconnectUndefined': {
                try {
                  let param: boolean | undefined = undefined;
                  webView.WebviewController.setAutoPreconnect(param as boolean);
                  let result = webView.WebviewController.isAutoPreconnectEnabled();
                  Utils.emitEvent(String(result), 60638);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60638);
                }
                break;
              }

              case 'emitWebSiteIsolationModeNull': {
                try {
                  webView.WebviewController.setSiteIsolationMode((null as Int) as webView.SiteIsolationMode);
                  Utils.emitEvent(true, 60639);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60639);
                }
                break;
              }

              case 'emitWebSiteIsolationModeUndefined': {
                try {
                  webView.WebviewController.setSiteIsolationMode((undefined as Int) as webView.SiteIsolationMode);
                  Utils.emitEvent(true, 60640);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60640);
                }
                break;
              }

              case 'emitWebSiteIsolationModeInvalid': {
                try {
                  let invalidMode = 99 as webView.SiteIsolationMode;
                  webView.WebviewController.setSiteIsolationMode(invalidMode);
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 60641);
                }
                break;
              }

            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)

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
