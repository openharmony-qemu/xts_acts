/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';

const EVENT_KEY = 205300;

interface WebResourceResponseBody {
  setResponseBody?(data: string): void;
  setResponseData(data: string | ArrayBuffer): void;
}

@Entry
@Component
struct WebResourceResponsePage {
  @State cmd: string = '';
  @State isReceive: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  onPageShow() {
    events_emitter.on({ eventId: EVENT_KEY, priority: events_emitter.EventPriority.LOW }, (ev) => {
      if (ev?.data?.ACTION != null) {
        this.cmd = ev.data.ACTION as string;
        this.isReceive = 1;
      }
    });
  }

  applyResponseBody(resp: WebResourceResponse) {
    let ext = resp as WebResourceResponseBody;
    if (ext.setResponseBody) {
      ext.setResponseBody('<html></html>');
    } else {
      resp.setResponseData('<html></html>');
    }
  }

  build() {
    Column() {
      Button('WebResourceResponse').id('WebResourceResponse').onClick(async () => {
        await Utils.waitForExist(() => this.isReceive, 'WebResourceResponseReceive', 1, 3000);
        this.isReceive = -1;
        if (this.cmd === 'setResponseBody') {
          try {
            this.controller.loadUrl('https://www.example.com/');
          } catch (e) { console.error(JSON.stringify(e)); }
        }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onInterceptRequest((event) => {
          let resp = new WebResourceResponse();
          this.applyResponseBody(resp);
          resp.setResponseMimeType('text/html');
          resp.setResponseIsReady(true);
          Utils.emitEvent(true, 205312);
          return resp;
        })
    }.width('100%').height('100%')
  }
}
