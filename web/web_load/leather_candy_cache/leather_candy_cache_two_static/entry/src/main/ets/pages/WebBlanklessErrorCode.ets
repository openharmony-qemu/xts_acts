/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Text,BlurOnKeyboardHideMode,$rawfile,OnConsoleEvent,Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import { UIContext, Router } from '@ohos.arkui.UIContext'
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "";

  aboutToAppear() {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("Finish aboutToAppear " + this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data["ACTION"] != null) {
        console.info('Received ACTION value: ' + data["ACTION"]);
        let strValue: string = String(data["ACTION"]);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebBlanklessErrorCode click")
          .key('WebBlanklessErrorCodeButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.str);
            switch (this.str) {
              case "testWebBlanklessErrorCode00": {
                try {
                  console.info(`testWebBlanklessErrorCode00: ${web_webview.WebBlanklessErrorCode.SUCCESS}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.SUCCESS == 0, 20260316)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260316)
                }
                break;
              }
              case "testWebBlanklessErrorCode01": {
                try {
                  console.info(`testWebBlanklessErrorCode01: ${web_webview.WebBlanklessErrorCode.ERR_UNKNOWN}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.ERR_UNKNOWN == -1, 20260317)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260317)
                }
                break;
              }
              case "testWebBlanklessErrorCode02": {
                try {
                  console.info(`testWebBlanklessErrorCode02: ${web_webview.WebBlanklessErrorCode.ERR_INVALID_PARAM}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.ERR_INVALID_PARAM == -2, 20260318)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260318)
                }
                break;
              }
              case "testWebBlanklessErrorCode03": {
                try {
                  console.info(`testWebBlanklessErrorCode03: ${web_webview.WebBlanklessErrorCode.ERR_CONTROLLER_NOT_INITED}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.ERR_CONTROLLER_NOT_INITED == -3, 20260319)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260319)
                }
                break;
              }
              case "testWebBlanklessErrorCode04": {
                try {
                  console.info(`testWebBlanklessErrorCode04: ${web_webview.WebBlanklessErrorCode.ERR_KEY_NOT_MATCH}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.ERR_KEY_NOT_MATCH == -4, 20260320)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260320)
                }
                break;
              }
              case "testWebBlanklessErrorCode05": {
                try {
                  console.info(`testWebBlanklessErrorCode05: ${web_webview.WebBlanklessErrorCode.ERR_SIGNIFICANT_CHANGE}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.ERR_SIGNIFICANT_CHANGE == -5, 20260321)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260321)
                }
                break;
              }
              case "testWebBlanklessErrorCode06": {
                try {
                  console.info(`testWebBlanklessErrorCode06: ${web_webview.WebBlanklessErrorCode.ERR_DURATION_OUT_OF_RANGE}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.ERR_DURATION_OUT_OF_RANGE == -6, 20260322)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 20260322)
                }
                break;
              }
              case "testWebBlanklessErrorCode07": {
                try {
                  console.info(`testWebBlanklessErrorCode07: ${web_webview.WebBlanklessErrorCode.ERR_EXPIRATION_TIME_OUT_OF_RANGE}`);
                  Utils.emitEvent(web_webview.WebBlanklessErrorCode.ERR_EXPIRATION_TIME_OUT_OF_RANGE == -7, 20260323)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error, 2026033)
                }
              }
            }
          })
      }
      Web({ src: 'https://www.example.com', controller: this.controller })
        .javaScriptAccess(true)
    }
  }
}