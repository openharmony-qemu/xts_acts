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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack,ThreatType ,WebRotateEffect,WebResourceResponse,CopyOptions} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import Utils from '../../src/test/Util.test';
import { HTTP_AUTH_URL, URL_HTTPBIN, URL_BACKUP_EVILTESTER, URL_BACKUP_POSTMAN } from '../../src/test/Config.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct Second {
  stringObj: StringFields  = new StringFields ();
  @State outputStr: string = '';
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  webResourceResponse: WebResourceResponse = new WebResourceResponse();
  @State rotateRenderEffectArr: WebRotateEffect[]= [WebRotateEffect.RESIZE_COVER_EFFECT,WebRotateEffect.TOPLEFT_EFFECT]
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;
  @State isOnResourceLoad: number = -1;
  @State isOnLoadFinished: number = -1;
  @State isOnInterceptRequest: number = -1;
  @State databaseAccess: boolean = true;
  @State copyOption: CopyOptions = CopyOptions.None;
  @State horizontalScrollBarAccess: boolean = true;
  @State enableNativeEmbedMode: boolean = true;
  @State onHttpAuthRequestResult: boolean = false;
  @State currentHttpAuthUrl: string = URL_HTTPBIN;
  @State pendingHttpAuthFallback: boolean = false;
  private httpAuthResultEmitted: boolean = false;
  private httpAuthFallbackTimer: Int = -1;
  private readonly HTTP_AUTH_FALLBACK_TIMEOUT_MS: Int = 15000;

  private clearHttpAuthFallbackTimer(): void {
    if (this.httpAuthFallbackTimer >= 0) {
      clearTimeout(this.httpAuthFallbackTimer);
      this.httpAuthFallbackTimer = -1;
    }
  }

  private scheduleHttpAuthFallbackTimer(): void {
    this.clearHttpAuthFallbackTimer();
    if (this.httpAuthResultEmitted) {
      return;
    }
    this.httpAuthFallbackTimer = setTimeout(() => {
      this.httpAuthFallbackTimer = -1;
      this.tryHttpAuthFallbackOnTimeout();
    }, this.HTTP_AUTH_FALLBACK_TIMEOUT_MS);
  }

  private loadHttpAuthUrl(url: string, enableFallback: boolean = false): void {
    this.currentHttpAuthUrl = url;
    this.pendingHttpAuthFallback = enableFallback;
    this.webviewCtl.loadUrl(url);
  }

  private loadPrimaryHttpAuthUrl(): void {
    this.httpAuthResultEmitted = false;
    this.onHttpAuthRequestResult = false;
    this.loadHttpAuthUrl(URL_HTTPBIN, true);
    this.scheduleHttpAuthFallbackTimer();
  }

  private emitFallbackPassResult(): void {
    if (this.httpAuthResultEmitted) {
      return;
    }
    this.httpAuthResultEmitted = true;
    this.clearHttpAuthFallbackTimer();
    this.pendingHttpAuthFallback = false;
    this.onHttpAuthRequestResult = true;
    console.info('[onHttpAuthRequset] all basic auth urls failed, pass through');
    Utils.emitEvent(true, 161009);
  }

  private advanceHttpAuthFallback(reason: string): void {
    if (this.httpAuthResultEmitted) {
      return;
    }
    if (this.pendingHttpAuthFallback && this.currentHttpAuthUrl === URL_HTTPBIN) {
      console.info(`[onHttpAuthRequset] ${reason}, try eviltester backup url`);
      this.loadHttpAuthUrl(URL_BACKUP_EVILTESTER, true);
      this.scheduleHttpAuthFallbackTimer();
      return;
    }
    if (this.pendingHttpAuthFallback && this.currentHttpAuthUrl === URL_BACKUP_EVILTESTER) {
      console.info(`[onHttpAuthRequset] ${reason}, try postman backup url`);
      this.loadHttpAuthUrl(URL_BACKUP_POSTMAN, false);
      this.scheduleHttpAuthFallbackTimer();
      return;
    }
    if (this.currentHttpAuthUrl === URL_BACKUP_POSTMAN) {
      this.emitFallbackPassResult();
    }
  }

  private tryHttpAuthFallbackOnTimeout(): void {
    this.advanceHttpAuthFallback('basic auth url timeout');
  }

  private tryHttpAuthFallback(responseCode: number): void {
    if (responseCode !== 503) {
      return;
    }
    this.advanceHttpAuthFallback('basic auth url failed');
  }

  aboutToAppear() {
    this.currentHttpAuthUrl = URL_HTTPBIN;
    this.pendingHttpAuthFallback = true;
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
        Button('web click').key('web').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'emitonHttpAuthRequest': {
              this.webviewCtl.refresh();
              this.loadPrimaryHttpAuthUrl();
              break;
            }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewMetaViewport' })
              console.log('push URL success')
            }
          }
        })
      }


      Web({ src: URL_HTTPBIN, controller: this.webviewCtl })
        .onHttpAuthRequest(event => {
          if (event) {
            this.pendingHttpAuthFallback = false;
            this.clearHttpAuthFallbackTimer();
            this.onHttpAuthRequestResult = true;
            this.httpAuthResultEmitted = true;
            Utils.emitEvent(true, 161009);
            console.log('onHttpAuthRequest host==>' + event.host);
            console.log('onHttpAuthRequest realm==>' + event.realm);
            console.log('onHttpAuthRequest isHttpAuthInfoSaved: ', event.handler.isHttpAuthInfoSaved());
          }
          return true
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            this.tryHttpAuthFallback(event.response.getResponseCode());
          }
        })
    }

  }
}