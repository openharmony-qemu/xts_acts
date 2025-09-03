/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Row, Button, ClickEvent, Web, WebResourceResponse } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback, BusinessError } from '@ohos.base'
class StringFields {
  str: string = '';
}
@Entry
@Component
struct WebDataBase {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  stringObj: StringFields  = new StringFields ();
  @State str: string = 'testDeleteHttpAuthCredentials001'
  @State username_password: string = '';
  @State host: string = 'www.baidu.com';
  @State realm: string = 'example';

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, string | boolean | number | object | Int>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }
  build() {
    Column() {
      Row() {
        Button('WebDataBase click').key('WebDataBaseButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testSaveHttpAuthCredentials001': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'StrOmgGol', 'LaRoChe');
                Utils.emitEvent(true, 30040)
              } catch (e: BusinessError) {
                Utils.emitEvent(e.code, 30040)
              }
              break;
            }
            case 'testGetHttpAuthCredentials001': {
              try {
                web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'StrOmgGol', 'LaRoChe');
                let arr: string[] = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm)
                setTimeout(() => {
                  if (arr) {
                    this.username_password = arr[0]
                    Utils.emitEvent(this.username_password, 30045)
                  } else {
                    Utils.emitEvent(false, 30045)
                  }
                }, 2000)
              } catch (e: BusinessError) {
                console.error('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30045)
              }
              break;
            }
            case 'testExistHttpAuthCredentials001': {
              try {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                setTimeout(() => {
                  Utils.emitEvent(result, 30046)
                }, 2000)
              } catch (e: BusinessError) {
                console.info('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30046)
              }
              break;
            }
            case 'testDeleteHttpAuthCredentials001': {
              try {
                web_webview.WebDataBase.deleteHttpAuthCredentials();
                setTimeout(() => {
                  let result = web_webview.WebDataBase.existHttpAuthCredentials();
                  setTimeout(() => {
                    Utils.emitEvent(result, 30050)
                  }, 2000)
                }, 2000)
              } catch (e: BusinessError) {
                console.info('==>' + JSON.stringify(e))
                Utils.emitEvent(e.code, 30050)
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
    }
  }
}