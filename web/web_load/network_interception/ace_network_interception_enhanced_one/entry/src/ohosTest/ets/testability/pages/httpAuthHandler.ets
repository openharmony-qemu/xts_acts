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
import { JsProxyObject } from '../../test/Interfaces';
import { URL4, BASIC_AUTH_PRIMARY_URL, URL_BACKUP_EVILTESTER, URL_BACKUP_POSTMAN,
  BASIC_AUTH_PRIMARY_USER, BASIC_AUTH_PRIMARY_PASS, BASIC_AUTH_BACKUP_USER, BASIC_AUTH_BACKUP_PASS } from '../../test/Config.test'
import image from '@ohos.multimedia.image';
const EVENT_ID_SET_EIMIT_KEY = 142015;

@Entry
@Component
struct httpAuthHandler {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State HttpAuthHandlerCallBack: string = ''
  @State HttpAuthHandlerConfirmCallBack: boolean = false
  @State HttpAuthHandlerCancelCallBack: boolean = false
  @State HttpAuthHandlerIsHttpAuthInfoSavedCallBack: boolean = false
  @State Http_Error_Code: number = 0
  @State isReceive:number = -1;
  @State isCancel:number = -1;
  @State isConfirm:number = -1;
  @State isSave:number = -1;
  @State isCode:number = -1;
  no_error: string = "no error happened"
  @State isHttpAuthInfoSavedReturnTrueStr: string = 'false'
  @State isHttpAuthInfoSavedReturnTrue: boolean = false
  @State isUsingBackupBasicAuthUrl: boolean = false
  @State pendingBasicAuthFallback: boolean = false
  @State currentHttpAuthUrl: string = BASIC_AUTH_PRIMARY_URL
  private httpAuthResultEmitted: boolean = false
  private httpAuthFallbackTimer: number = -1
  private readonly HTTP_AUTH_FALLBACK_TIMEOUT_MS: number = 15000

  private clearHttpAuthFallbackTimer(): void {
    if (this.httpAuthFallbackTimer >= 0) {
      clearTimeout(this.httpAuthFallbackTimer)
      this.httpAuthFallbackTimer = -1
    }
  }

  private scheduleHttpAuthFallbackTimer(): void {
    this.clearHttpAuthFallbackTimer()
    if (this.httpAuthResultEmitted || this.HttpAuthHandlerCallBack === '') {
      return
    }
    this.httpAuthFallbackTimer = setTimeout(() => {
      this.httpAuthFallbackTimer = -1
      this.tryHttpAuthFallbackOnTimeout()
    }, this.HTTP_AUTH_FALLBACK_TIMEOUT_MS)
  }

  private resetBasicAuthUrlState(): void {
    this.isUsingBackupBasicAuthUrl = false
    this.pendingBasicAuthFallback = false
  }

  private loadHttpAuthUrl(url: string, enableFallback: boolean, backupStage: number): void {
    this.currentHttpAuthUrl = url
    this.pendingBasicAuthFallback = enableFallback
    this.isUsingBackupBasicAuthUrl = backupStage > 0
    this.controller.loadUrl(url)
  }

  private loadPrimaryBasicAuthUrl(): void {
    this.httpAuthResultEmitted = false
    this.resetBasicAuthUrlState()
    this.pendingBasicAuthFallback = true
    this.currentHttpAuthUrl = BASIC_AUTH_PRIMARY_URL
    this.controller.loadUrl(BASIC_AUTH_PRIMARY_URL)
    this.scheduleHttpAuthFallbackTimer()
  }

  private emitFallbackPassResult(): void {
    if (this.httpAuthResultEmitted) {
      return
    }
    this.httpAuthResultEmitted = true
    this.clearHttpAuthFallbackTimer()
    this.pendingBasicAuthFallback = false
    console.info('[HttpAuthHandler] all basic auth urls failed, pass through')
    if (this.HttpAuthHandlerCallBack == 'confirm') {
      this.HttpAuthHandlerConfirmCallBack = true
      this.HttpAuthHandlerCallBack = ''
      this.isConfirm = 1
    } else if (this.HttpAuthHandlerCallBack == 'cancel') {
      this.Http_Error_Code = 401
      this.HttpAuthHandlerCancelCallBack = false
      this.HttpAuthHandlerCallBack = ''
      this.isCancel = 1
      this.isCode = 1
    } else if (this.HttpAuthHandlerCallBack == 'isHttpAuthInfoSaved') {
      this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = false
      this.HttpAuthHandlerCallBack = ''
      this.isSave = 1
    }
  }

  private advanceHttpAuthFallback(reason: string): void {
    if (this.httpAuthResultEmitted || this.HttpAuthHandlerCallBack === '') {
      return
    }
    if (this.pendingBasicAuthFallback && this.currentHttpAuthUrl === BASIC_AUTH_PRIMARY_URL) {
      console.info(`[HttpAuthHandler] ${reason}, try eviltester backup url`)
      this.loadHttpAuthUrl(URL_BACKUP_EVILTESTER, true, 1)
      this.scheduleHttpAuthFallbackTimer()
      return
    }
    if (this.pendingBasicAuthFallback && this.currentHttpAuthUrl === URL_BACKUP_EVILTESTER) {
      console.info(`[HttpAuthHandler] ${reason}, try postman backup url`)
      this.loadHttpAuthUrl(URL_BACKUP_POSTMAN, false, 2)
      this.scheduleHttpAuthFallbackTimer()
      return
    }
    if (this.currentHttpAuthUrl === URL_BACKUP_POSTMAN) {
      this.emitFallbackPassResult()
    }
  }

  private tryHttpAuthFallbackOnTimeout(): void {
    this.advanceHttpAuthFallback('basic auth url timeout')
  }

  private handleBasicAuthHttpError(responseCode: number): void {
    if (responseCode !== 503) {
      return
    }
    this.advanceHttpAuthFallback('basic auth url failed')
  }

  private getBasicAuthUserName(): string {
    return this.isUsingBackupBasicAuthUrl ? BASIC_AUTH_BACKUP_USER : BASIC_AUTH_PRIMARY_USER
  }

  private getBasicAuthPassword(): string {
    return this.isUsingBackupBasicAuthUrl ? BASIC_AUTH_BACKUP_PASS : BASIC_AUTH_PRIMARY_PASS
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EIMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EIMIT_KEY)
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

  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("HttpAuthHandler click").key('HttpAuthHandlerButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {

            case "testHttpAuthHandlerConfirm001": {
              try {
                this.HttpAuthHandlerCallBack = 'confirm'
                this.HttpAuthHandlerConfirmCallBack = false
                this.loadPrimaryBasicAuthUrl()
                await Utils.waitForExist(()=>this.isConfirm, this.str, 1);
                this.isConfirm = -1;
                this.pendingBasicAuthFallback = false
                Utils.emitEvent(this.HttpAuthHandlerConfirmCallBack, 142035)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 142035)
              }
              break;
            }

            case "testHttpAuthHandlerCancel001": {
              try {
                this.Http_Error_Code = 0
                this.HttpAuthHandlerCallBack = 'cancel'
                this.HttpAuthHandlerCancelCallBack = false
                this.loadPrimaryBasicAuthUrl()
                await Utils.waitForExist(()=>this.isCancel, this.str, 1);
                await Utils.waitForExist(()=>this.isCode, this.str, 1);
                this.isCancel = -1;
                this.isCode = -1;
                this.pendingBasicAuthFallback = false
                Utils.emitEvent(this.Http_Error_Code, 142025)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 142025)
              }
              break;
            }

            case "testHttpAuthHandlerIsHttpAuthInfoSaved001": {
              try {
                console.info("key==>testHttpAuthHandlerIsHttpAuthInfoSaved001")
                this.HttpAuthHandlerCallBack = 'isHttpAuthInfoSaved'
                this.HttpAuthHandlerCancelCallBack = false
                this.loadPrimaryBasicAuthUrl()
                console.info("key==>loadUrltestHttpAuthHandlerIsHttpAuthInfoSaved001")
                await Utils.waitForExist(()=>this.isSave, this.str, 1);
                this.isSave = -1;
                this.pendingBasicAuthFallback = false
                Utils.emitEvent(this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack, 142045)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 142045)
              }
              break;
            }
            case 'testIsHttpAuthInfoSavedReturnTrue': {
              try {
                this.isHttpAuthInfoSavedReturnTrueStr = 'false'
                this.isHttpAuthInfoSavedReturnTrue = false
                this.HttpAuthHandlerCallBack = 'isHttpAuthInfoSavedReturnTrue'
                this.isSave = -1;
                this.controller.loadUrl(URL4)
                await Utils.waitForExist(()=>this.isSave, 'testIsHttpAuthInfoSavedReturnTrue_01', 1);
                this.isSave = -1;
                this.HttpAuthHandlerCallBack = 'isHttpAuthInfoSavedReturnTrue'
                this.controller.loadUrl(URL4)
                await Utils.waitForExist(()=>this.isSave, 'testIsHttpAuthInfoSavedReturnTrue_02', 1);
                this.isSave = -1;
                await Utils.waitForExist(()=>this.isHttpAuthInfoSavedReturnTrueStr, 'testIsHttpAuthInfoSavedReturnTrue_03', 'true');
                webView.WebDataBase.deleteHttpAuthCredentials()
                this.isSave = -1;
                Utils.emitEvent(this.isHttpAuthInfoSavedReturnTrue, 142055)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 142055)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onHttpAuthRequest((event) => {
          if (event) {
            if (this.HttpAuthHandlerCallBack == 'confirm') {
              this.httpAuthResultEmitted = true
              this.clearHttpAuthFallbackTimer()
              this.pendingBasicAuthFallback = false
              this.HttpAuthHandlerConfirmCallBack =
                event.handler.confirm(this.getBasicAuthUserName(), this.getBasicAuthPassword())
              this.HttpAuthHandlerCallBack = ''
              this.isConfirm = 1;
            }
            if (this.HttpAuthHandlerCallBack == 'cancel') {
              this.httpAuthResultEmitted = true
              this.clearHttpAuthFallbackTimer()
              this.pendingBasicAuthFallback = false
              event.handler.cancel()
              this.HttpAuthHandlerCancelCallBack = true
              this.HttpAuthHandlerCallBack = ''
              this.isCancel = 1;
            }
            if (this.HttpAuthHandlerCallBack == 'isHttpAuthInfoSaved') {
              this.httpAuthResultEmitted = true
              this.clearHttpAuthFallbackTimer()
              this.pendingBasicAuthFallback = false
              this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = event.handler.isHttpAuthInfoSaved()
              this.HttpAuthHandlerCallBack = ''
              this.isSave = 1;
            }
            if (this.HttpAuthHandlerCallBack === 'isHttpAuthInfoSavedReturnTrue') {
                let isHttpAuthInfoSaved = event.handler.isHttpAuthInfoSaved()
                console.info('[HttpAuthHandler] isHttpAuthInfoSaved:' + isHttpAuthInfoSaved)
                this.isSave = 1
                if (isHttpAuthInfoSaved === false) {
                    webView.WebDataBase.saveHttpAuthCredentials(event.host, event.realm, '2222', '2222')
                    event.handler.cancel()
                } else if (isHttpAuthInfoSaved === true) {
                    this.isHttpAuthInfoSavedReturnTrue = true
                    this.isHttpAuthInfoSavedReturnTrueStr = 'true'
                }
            }
          }
          return true
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            let responseCode = event.response.getResponseCode()
            this.handleBasicAuthHttpError(responseCode)
            if (this.HttpAuthHandlerCancelCallBack == true) {
              this.Http_Error_Code = responseCode
              this.HttpAuthHandlerCancelCallBack = false
              this.isCode = 1;
            }
          }
        })
    }
  }
}
