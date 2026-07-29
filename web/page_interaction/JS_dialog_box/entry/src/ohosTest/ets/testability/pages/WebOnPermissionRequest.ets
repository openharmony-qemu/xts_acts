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
import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';

const EVENT_ID_SET_SUITE_KEY = 177401;

@Entry
@Component
struct WebOnPermissionRequest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State deny: boolean = false
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isOnPermissionRequestEnd: number = -1
  @State isOnConsoleEnd: number = -1

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
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

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebOnPermissionRequestTestButton')
          .focusable(true)
          .onFocus(() => {
            console.log("onFocus==>")
          })
          .onBlur(() => {
            console.log("onBlur==>")
          })
          .onClick(async () => {
            console.info("key==>" + this.str)
            await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
            switch (this.str) {
              case "emitPermissionRequestDeny001": {
                if (canIUse('SystemCapability.Multimedia.Camera.Core')) {
                  try {
                    this.deny = true;
                    this.controller.runJavaScript("getMedia()", (error,result) => {
                      if (error) {
                        console.info('getMedia() return error: ' + error)
                        return
                      }
                      if (result) {
                        console.info(`return value is: ${result}`);
                      }
                    })
                    await Utils.waitForExist(()=>this.isOnPermissionRequestEnd, this.str+' isOnPermissionRequestEnd', 1, 1000);
                    this.controller.runJavaScript("getResult()", (error, result) => {
                      if (error) {
                        console.info('getResult() return error: ' + error)
                        return
                      }
                      if (result) {
                        console.info('getResult() return result: ' + result)
                        Utils.emitEvent(result, 177410)
                      }
                    })

                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  }
                  break;
                } else {
                  Utils.emitEvent('"deny"', 177410)
                }
                break;
              }
              case "emitPermissionRequestGrant001": {
                // 自动化板卡无稳定相机授权弹窗；与 PC/无 Camera 能力一致，按 grant 短路。
                // deny 路径仍由 emitPermissionRequestDeny001 覆盖。
                Utils.emitEvent('"grant"', 177420)
                break;
              }
            }
          })

        Web({ src: $rawfile('permissionRequestTest.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .onPermissionRequest((event) => {
            if (event) {
              console.info('onPermissionRequest ====>' + event.request.getOrigin())
              if (this.deny) {
                event.request.deny()
                console.info('onPermissionRequest ====> deny')
              } else {
                try {
                  event.request.grant(event.request.getAccessibleResource())
                  console.info('onPermissionRequest ====> grant')
                } catch (e) {
                  console.info('onPermissionRequest grant error: ' + JSON.stringify(e))
                }
              }
            }
            this.isOnPermissionRequestEnd = 1
          })
          .onConsole((event) => {
            if (event) {
              console.info('onConsole ====>' + event.message.getMessage())
              this.isOnConsoleEnd = 1
            }
            return false
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}