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

import Utils from '../../src/test/Utils.test';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Web } from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct userAgentMetadataSetWow64 {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  stringObj: StringFields = new StringFields();
  @State javaScriptAccess: boolean = true;

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
        Button('UserAgentMetadataSetWow64 click').key('setWow64Button').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testSetWow64True': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setWow64(true);
                let isWow64 = metadata.getWow64();
                console.log('isWow64:' + isWow64);
                Utils.emitEvent(isWow64, 202502500);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502500);
              }
              break;
            }

            case 'testSetWow64False': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setWow64(false);
                let isWow64 = metadata.getWow64();
                console.log('isWow64:' + isWow64);
                Utils.emitEvent(!isWow64, 202502501);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502501);
              }
              break;
            }

            case 'testSetWow64Null': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                let nullValue: boolean | null = null;
                metadata.setWow64(nullValue as boolean);
                Utils.emitEvent(false, 202502502);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code === 401, 202502502);
              }
              break;
            }

            case 'testSetWow64Undefined': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                let undefinedValue: boolean | undefined = undefined;
                metadata.setWow64(undefinedValue as boolean);
                Utils.emitEvent(false, 202502503);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code === 401, 202502503);
              }
              break;
            }

            case 'testSetWow64String': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                let stringValue: boolean | string = 'true';
                metadata.setWow64(stringValue as boolean);
                Utils.emitEvent(false, 202502504);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code === 401, 202502504);
              }
              break;
            }

            case 'testSetWow64Number': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                let numberValue: boolean | number = 1;
                metadata.setWow64(numberValue as boolean);
                Utils.emitEvent(false, 202502505);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code === 401, 202502505);
              }
              break;
            }

            case 'testSetWow64Object': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                let objectValue: Object = new webview.UserAgentMetadata();
                metadata.setWow64(objectValue as boolean);
                Utils.emitEvent(false, 202502506);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code === 401, 202502506);
              }
              break;
            }

            case 'testSetWow64ReturnVoid': {
              try {
                let metadata: webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setWow64(true);
                Utils.emitEvent(true, 202502507);
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 202502507);
              }
              break;
            }

            case 'emitOnSwitchNextPagePinCallback': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: "pages/webOnVerifyPinCallback" })
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
    }
  }
}


