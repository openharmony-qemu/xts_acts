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

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  OnPageVisibleEvent, OnPermissionRequestEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import webView from '@ohos.web.webview';
class StringFields {
  public str: string = '';
}

@Entry
@Component
struct setBlanklessLoadingWithParamsTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State title: string = 'test';
  @State stateRst: string = "Xts test result"
  @State msg2: string = ""
  updateFlag: boolean = false


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
        Button('setBlanklessLoadingWithParamsTestButton')
          .key('setBlanklessLoadingWithParamsTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'testSetBlanklessLoadingWithParams001': {
                let msg = 'testSetBlanklessLoadingWithParams001'
                let key = 'setBlanklessLoadingWithParams001';
                try {
                  console.log(msg, 'first loadUrl finish');
                  webView.WebviewController.clearBlanklessLoadingCache([key]);
                  let infoOne = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, `getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoOne)}`,
                    `预期值：0`,
                    `实际值${infoOne.errCode}`);
                  console.log(msg, 'getBlankless infoOne success', `infoOne.similarity==${JSON.stringify(infoOne.similarity)}`);
                  this.controller.refresh();
                  setTimeout(() => {
                  console.log(msg, 'second loadUrl finish');
                  let infoTwo = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 2 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoTwo)}`,
                    `预期值：0`,
                    `实际值${infoTwo.errCode}`);
                  console.log(msg, 'getBlankless infoTwo success', `infoTwo.similarity==${JSON.stringify(infoTwo.similarity)}`);
                  this.controller.refresh();
                    setTimeout(() => {
                      console.log(msg, 'third loadUrl finish');
                  let infoThree = this.controller.getBlanklessInfoWithKey(key);
                  console.log(msg, ` 3 getBlanklessInfoWithKey 入参:${key}`, `返回值:${JSON.stringify(infoThree)}`,
                    `预期值：0`,
                    `实际值${infoThree.errCode}`);
                  console.log(msg, 'getBlankless infoThree success', `infoThree.similarity==${JSON.stringify(infoThree.similarity)}`);
                  let param: webView.BlanklessLoadingParam = {
                    enable: true,
                    duration: 500,
                    expirationTime: 0,
                    callback: (info: webView.BlanklessFrameInterpolationInfo) => {
                      // 数据监控
                      console.log(msg +
                        ` callback key: ${info.key} , state: ${info.state} timestamp: ${info.timestamp} reason: ${info.reason}`)
                      // 插帧成功
                      if (info.state == webView.BlanklessFrameInterpolationState.FRAME_INTERPOLATION_SUCCEEDED) {
                        console.log(msg + `callback 插帧成功`);
                      }
                    }
                  }
                  let result = this.controller.setBlanklessLoadingWithParams(key, param);
                  Utils.emitEvent(result, 148510);
                    }, 2000);
                    }, 2000);
                } catch (error) {
                  console.log(msg, 'ErrorCode: ' + error.code, ' Message: ' + error.message);
                  if (Number(error.code) == 801) {
                    Utils.emitEvent(0, 148510)
                    console.log(msg, ' 801 Capability not supported');
                  } else {
                    Utils.emitEvent(401, 148510)
                  }
                }
                break;
              }


            }
          })

        Web({ src: 'resource://rawfile/indexPhoto.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onLoadIntercept((event) => {
            try {
              let info = this.controller.getBlanklessInfoWithKey("https://www.baidu.com");
              if (info.errCode == webview.WebBlanklessErrorCode.SUCCESS) {
                console.log(`info.similarity==${JSON.stringify(info.similarity)}`)
                console.log(`info.loadingTime==${JSON.stringify(info.loadingTime)}`)
                let data = new Date(2026, 5, 10, 0, 0, 0, 0);
                let param: webview.BlanklessLoadingParam = {
                  enable: info.similarity > 0.4 && info.loadingTime < 2000,
                  duration: info.loadingTime,
                  expirationTime: data.getTime() as int,
                  callback: (info: webview.BlanklessFrameInterpolationInfo)=>{
                  },
                };
                let result = this.controller.setBlanklessLoadingWithParams("https://www.baidu.com", param);
                console.log(this.msg2 + ` 实际值 result: ${result} 预期值 0`);
              } else {
                console.info('getBlankless info err');
              }
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},
                Message: ${(error as BusinessError).message}`);
            }
            return false;
          })


      }
    }
  }
}
