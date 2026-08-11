/**
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

import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import { XtsTestServer } from 'library';
import Utils from '../../test/Utils.test';

const EVENT_ID_SET_SUITE_KEY = 127101;

@Entry
@Component
struct WebOnFirstContentfulPaint {
  controller: webView.WebviewController = new webView.WebviewController();
  mServer: XtsTestServer = new XtsTestServer(getContext(this), false);
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State vis: Visibility = Visibility.None
  @State onFirstContentfulPaintCalled: boolean = false;

  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

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

  aboutToDisappear() {
    try {
      this.controller.loadUrl(this.mServer.getShutdownUrl());
    } catch (_e) {
      // page teardown: controller may already be unbound (17100001)
    }
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
    Column() {
      Row() {
        Button("web click").key('WebOnFirstContentfulPaintButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          // await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000, 5);
          switch (this.str) {
            case "emitOnFirstContentfulPaint001": {
              try {
                this.onFirstContentfulPaintCalled = false
                Utils.emitEvent(this.onFirstContentfulPaintCalled, 127110)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnFirstContentfulPaint002": {
              try {
                this.vis = Visibility.Visible
                this.isPageEnd = -1
                this.controller.refresh()
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000, 5);
                let nums=1;
                let tryTime=8
                while(nums < tryTime) {
                  await Utils.sleep(1000);
                  if (this.onFirstContentfulPaintCalled == true) {
                    Utils.emitEvent(this.onFirstContentfulPaintCalled, 127120)
                    console.log('emitOnFirstContentfulPaint002onFirstContentfulPaintCalled---' + tryTime)
                    break;
                  }
                  console.log('emitOnFirstContentfulPaint002---' + nums)
                  nums++;
                }
                Utils.emitEvent(this.onFirstContentfulPaintCalled, 127120)
                if (!this.onFirstContentfulPaintCalled) {
                  console.error('onFirstContentfulPaint not fired after refresh on this device');
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: this.mServer.getAssetUrl('dataSubmit.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .visibility(this.vis)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onFirstContentfulPaint(event => {
          if (event) {
            console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
            event.navigationStartTick + ", [firstContentfulPaintMs]:" + event.firstContentfulPaintMs)
            // 设备上报字段可能为 0，事件触发即视为回调生效
            this.onFirstContentfulPaintCalled = true
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}