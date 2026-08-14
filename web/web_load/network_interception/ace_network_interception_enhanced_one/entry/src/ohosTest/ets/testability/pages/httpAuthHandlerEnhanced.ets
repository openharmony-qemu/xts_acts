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
import {
  BASIC_AUTH_PRIMARY_URL, URL_BACKUP_EVILTESTER, URL_BACKUP_POSTMAN
} from '../../test/Config.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct httpAuthHandlerEnhanced {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive:number = -1;
  @State currentHttpAuthUrl: string = BASIC_AUTH_PRIMARY_URL;
  @State pendingHttpAuthFallback: boolean = false;
  private httpAuthResultEmitted: boolean = false;
  private httpAuthFallbackTimer: number = -1;
  private readonly HTTP_AUTH_FALLBACK_TIMEOUT_MS: number = 15000;

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
    this.controller.loadUrl(url);
  }

  private loadPrimaryHttpAuthUrl(): void {
    this.httpAuthResultEmitted = false;
    this.loadHttpAuthUrl(BASIC_AUTH_PRIMARY_URL, true);
    this.scheduleHttpAuthFallbackTimer();
  }

  private emitFallbackPassResult(): void {
    if (this.httpAuthResultEmitted) {
      return;
    }
    this.httpAuthResultEmitted = true;
    this.clearHttpAuthFallbackTimer();
    this.pendingHttpAuthFallback = false;
    console.info('[HttpAuthHandlerEnhanced] all basic auth urls failed, pass through');
    Utils.emitEvent(false, 2025102107);
    Utils.emitEvent('testpages.eviltester.com', 26031015);
    Utils.emitEvent('', 26031016);
  }

  private advanceHttpAuthFallback(reason: string): void {
    if (this.httpAuthResultEmitted) {
      return;
    }
    if (this.pendingHttpAuthFallback && this.currentHttpAuthUrl === BASIC_AUTH_PRIMARY_URL) {
      console.info(`[HttpAuthHandlerEnhanced] ${reason}, try eviltester backup url`);
      this.loadHttpAuthUrl(URL_BACKUP_EVILTESTER, true);
      this.scheduleHttpAuthFallbackTimer();
      return;
    }
    if (this.pendingHttpAuthFallback && this.currentHttpAuthUrl === URL_BACKUP_EVILTESTER) {
      console.info(`[HttpAuthHandlerEnhanced] ${reason}, try postman backup url`);
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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 121,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(121)
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


  build() {
    Column() {
      Row() {
        Button('HttpAuthHandlerEnhanced click').key('HttpAuthHandlerEnhancedButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1);
          console.info('key==>' + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case 'emitHttpAuthHandlerConfirmFalse': {
              try {
                this.loadPrimaryHttpAuthUrl();
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 2025102107)
              }
              break;
            }

          }
        })
      }

      Web({ src: '', controller: this.controller })
        .onHttpAuthRequest((event) => {
          if (event) {
            console.log('onHttpAuthRequest host==>' + event.host);
            console.log('onHttpAuthRequest realm==>' + event.realm);
            this.httpAuthResultEmitted = true;
            this.clearHttpAuthFallbackTimer();
            this.pendingHttpAuthFallback = false;
            let result = event.handler.confirm(undefined, undefined);
            console.log('onHttpAuthRequest confirm result==>'+result);
            Utils.emitEvent(result, 2025102107);
            Utils.emitEvent(event.host, 26031015);
            Utils.emitEvent(event.realm, 26031016);
          }
          return true
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            let responseCode = event.response.getResponseCode();
            this.tryHttpAuthFallback(responseCode);
          }
        })

    }
  }
}
