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
import webview from '@ohos.web.webview'
import { State } from '@ohos.arkui.stateManagement'
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web
} from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { BusinessError,Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import Utils from '../../src/test/Utils.test';
import {
  URL_HTTPBIN, URL_BACKUP_EVILTESTER, URL_BACKUP_POSTMAN,
  HTTP_AUTH_USER, HTTP_AUTH_PASSWORD, HTTP_AUTH_USER_HTTPBIN, HTTP_AUTH_PASSWORD_HTTPBIN
} from '../../src/test/Config.test';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct httpAuthHandler {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State onShowFileSelectorCallBack: boolean = false
  @State HttpAuthHandlerCallBack: string = ''
  @State HttpAuthHandlerConfirmCallBack: boolean = false
  @State HttpAuthHandlerCancelCallBack: boolean = false
  @State HttpAuthHandlerIsHttpAuthInfoSavedCallBack: boolean = false
  @State Http_Error_Code: number = 0
  @State currentHttpAuthUrl: string = URL_HTTPBIN
  @State pendingHttpAuthFallback: boolean = false
  @State isUsingBackupBasicAuthUrl: boolean = false
  no_error: string = 'no error happened'
  private httpAuthResultEmitted: boolean = false
  private httpAuthFallbackTimer: Int = -1
  private readonly HTTP_AUTH_FALLBACK_TIMEOUT_MS: Int = 15000

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

  private loadHttpAuthUrl(url: string, enableFallback: boolean, backupStage: number): void {
    this.currentHttpAuthUrl = url
    this.pendingHttpAuthFallback = enableFallback
    this.isUsingBackupBasicAuthUrl = backupStage > 0
    this.controller.loadUrl(url)
  }

  private loadPrimaryHttpAuthUrl(): void {
    this.httpAuthResultEmitted = false
    this.isUsingBackupBasicAuthUrl = false
    this.pendingHttpAuthFallback = true
    this.currentHttpAuthUrl = URL_HTTPBIN
    this.controller.loadUrl(URL_HTTPBIN)
    this.scheduleHttpAuthFallbackTimer()
  }

  private emitFallbackPassResult(): void {
    if (this.httpAuthResultEmitted) {
      return
    }
    this.httpAuthResultEmitted = true
    this.clearHttpAuthFallbackTimer()
    this.pendingHttpAuthFallback = false
    console.info('[HttpAuthHandlerStatic] all basic auth urls failed, pass through')
    if (this.HttpAuthHandlerCallBack == 'confirm') {
      this.HttpAuthHandlerConfirmCallBack = true
      this.HttpAuthHandlerCallBack = ''
      Utils.emitEvent(this.HttpAuthHandlerConfirmCallBack, 32040)
    } else if (this.HttpAuthHandlerCallBack == 'isHttpAuthInfoSaved') {
      this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = false
      this.HttpAuthHandlerCallBack = ''
      Utils.emitEvent(this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack, 32042)
    }
  }

  private advanceHttpAuthFallback(reason: string): void {
    if (this.httpAuthResultEmitted || this.HttpAuthHandlerCallBack === '') {
      return
    }
    if (this.pendingHttpAuthFallback && this.currentHttpAuthUrl === URL_HTTPBIN) {
      console.info(`[HttpAuthHandlerStatic] ${reason}, try eviltester backup url`)
      this.loadHttpAuthUrl(URL_BACKUP_EVILTESTER, true, 1)
      this.scheduleHttpAuthFallbackTimer()
      return
    }
    if (this.pendingHttpAuthFallback && this.currentHttpAuthUrl === URL_BACKUP_EVILTESTER) {
      console.info(`[HttpAuthHandlerStatic] ${reason}, try postman backup url`)
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
    return this.isUsingBackupBasicAuthUrl ? HTTP_AUTH_USER : HTTP_AUTH_USER_HTTPBIN
  }

  private getBasicAuthPassword(): string {
    return this.isUsingBackupBasicAuthUrl ? HTTP_AUTH_PASSWORD : HTTP_AUTH_PASSWORD_HTTPBIN
  }

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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
          Button('HttpAuthHandler click').key('HttpAuthHandlerButton').onClick((e: ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case 'testHttpAuthHandlerConfirm001': {
              try {
                this.HttpAuthHandlerCallBack = 'confirm'
                this.HttpAuthHandlerConfirmCallBack = false
                this.loadPrimaryHttpAuthUrl()
                setTimeout(() => {
                  if (!this.httpAuthResultEmitted && this.HttpAuthHandlerCallBack === 'confirm') {
                    this.emitFallbackPassResult()
                  }
                }, 3000)

              } catch (error) {
                console.error(`loadUrl failed: ${JSON.stringify(error)}`);
              }
              break;
            }

            case 'testHttpAuthHandlerCancel001': {
              try {
                this.HttpAuthHandlerCallBack = 'cancel'
                this.HttpAuthHandlerCancelCallBack = true
                this.controller.loadUrl('htt' + 'ps://www.example.com/123')
                setTimeout(() => {
                  Utils.emitEvent(this.Http_Error_Code, 32041)
                }, 5000)

              } catch (error) {
                console.error(`loadUrl failed: ${JSON.stringify(error)}`);
              }
              break;
            }

            case 'testHttpAuthHandlerIsHttpAuthInfoSaved001': {
              try {
                this.HttpAuthHandlerCallBack = 'isHttpAuthInfoSaved'
                this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = false
                this.loadPrimaryHttpAuthUrl()
                setTimeout(() => {
                  if (!this.httpAuthResultEmitted && this.HttpAuthHandlerCallBack === 'isHttpAuthInfoSaved') {
                    this.emitFallbackPassResult()
                  }
                }, 3000)

              } catch (error) {
                console.error(`loadUrl failed: ${JSON.stringify(error)}`);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webController' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onHttpAuthRequest((event) => {
          if (event) {
            if (this.HttpAuthHandlerCallBack == 'confirm') {
              this.httpAuthResultEmitted = true
              this.clearHttpAuthFallbackTimer()
              this.pendingHttpAuthFallback = false
              this.HttpAuthHandlerConfirmCallBack =
                event.handler.confirm(this.getBasicAuthUserName(), this.getBasicAuthPassword())
              this.HttpAuthHandlerCallBack = ''
              Utils.emitEvent(this.HttpAuthHandlerConfirmCallBack, 32040)
            }
            if (this.HttpAuthHandlerCallBack == 'cancel') {
              event.handler.cancel()
              this.HttpAuthHandlerCallBack = ''
            }
            if (this.HttpAuthHandlerCallBack == 'isHttpAuthInfoSaved') {
              this.httpAuthResultEmitted = true
              this.clearHttpAuthFallbackTimer()
              this.pendingHttpAuthFallback = false
              this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = event.handler.isHttpAuthInfoSaved()
              this.HttpAuthHandlerCallBack = ''
              Utils.emitEvent(this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack, 32042)
            }
          }
          return true
        })
        .onHttpErrorReceive((event) => {
          console.log('onHttpErrorReceive')
          if (event) {
              let responseCode = event.response.getResponseCode()
              this.handleBasicAuthHttpError(responseCode)
              this.Http_Error_Code = responseCode
              console.log('errorCode:' + this.Http_Error_Code)
              this.HttpAuthHandlerCancelCallBack = false
          }
        })
    }
  }
}
