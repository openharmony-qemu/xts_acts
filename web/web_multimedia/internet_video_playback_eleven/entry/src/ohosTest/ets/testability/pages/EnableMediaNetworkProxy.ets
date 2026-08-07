/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct EnableMediaNetworkProxy {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = 'enableMediaNetworkProxyTrue';
  /** Docs: default off when unset; cases cover true/false/null/undefined. */
  @State proxy: boolean | null | undefined = false;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State statusResult: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 132860,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(132860);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data?.ACTION != null) {
      this.str = eventData.data?.ACTION as string;
      this.isReceive = 0;
    }
  };

  private setProxy(enabled: boolean | null | undefined): string {
    try {
      this.proxy = enabled;
      console.info(`enableMediaNetworkProxy proxy=${String(this.proxy)}`);
      if (enabled === null) {
        return 'null';
      }
      if (enabled === undefined) {
        return 'undefined';
      }
      return enabled ? 'true' : 'false';
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error(`ErrorCode: ${err.code}, Message: ${err.message}`);
      return `error_${err.code}`;
    }
  }

  private replyOk(payload: string) {
    this.statusResult = payload;
    Utils.emitEvent(payload, 132870);
  }

  private runCase() {
    switch (this.str) {
      case 'enableMediaNetworkProxyTrue': {
        this.replyOk(this.setProxy(true));
        break;
      }
      case 'enableMediaNetworkProxyFalse': {
        this.replyOk(this.setProxy(false));
        break;
      }
      case 'enableMediaNetworkProxyToggle': {
        this.setProxy(true);
        this.replyOk(this.setProxy(false));
        break;
      }
      case 'enableMediaNetworkProxyNull': {
        this.replyOk(this.setProxy(null));
        break;
      }
      case 'enableMediaNetworkProxyUndefined': {
        this.replyOk(this.setProxy(undefined));
        break;
      }
      default: {
        this.replyOk('unknown');
        break;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web test').key('EnableMediaNetworkProxy_Button').onClick(async () => {
          console.info('key==>' + this.str);
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          this.runCase();
        })
      }
      Text(this.statusResult.length > 0 ? this.statusResult : 'enableMediaNetworkProxy')
        .fontSize(14)
        .id('textContent')
      // Local page for stable onPageEnd; attribute targets HLS per docs.
      Web({ src: $rawfile('common_index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .mediaPlayGestureAccess(true)
        .enableMediaNetworkProxy(this.proxy as boolean)
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })

      // [ARKWEB_COV] null/undefined attribute coverage
      Web({ src: $rawfile('common_index.html'), controller: new web_webview.WebviewController() })
        .enableMediaNetworkProxy(null)
        .height(1)
        .width(1)
      Web({ src: $rawfile('common_index.html'), controller: new web_webview.WebviewController() })
        .enableMediaNetworkProxy(undefined)
        .height(1)
        .width(1)

      Web({ src: $rawfile('common_index.html'), controller: new web_webview.WebviewController() })
        .enableMediaNetworkProxy(true)
        .height(1)
        .width(1)
      Web({ src: $rawfile('common_index.html'), controller: new web_webview.WebviewController() })
        .enableMediaNetworkProxy(false)
        .height(1)
        .width(1)

    }
  }
}
