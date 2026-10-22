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

const EVENT_KEY = 205100;

@Entry
@Component
struct WebResourceErrorPage {
  @State cmd: string = '';
  @State isReceive: number = -1;
  @State pendingAction: string = '';
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  onPageShow() {
    events_emitter.on({ eventId: EVENT_KEY, priority: events_emitter.EventPriority.LOW }, (ev) => {
      if (ev?.data?.ACTION != null) {
        this.cmd = ev.data.ACTION as string;
        this.isReceive = 1;
      }
    });
  }

  build() {
    Column() {
      Button('WebResourceError').id('WebResourceError').onClick(async () => {
        await Utils.waitForExist(() => this.isReceive, 'WebResourceErrorReceive', 1, 3000);
        this.isReceive = -1;
        if (this.cmd === 'constructor') {
          this.pendingAction = 'constructor';
          try {
            this.controller.loadUrl('https://invalid.invalid.example.test/');
          } catch (err) { console.error(JSON.stringify(err)); }
        } else if (this.cmd === 'getCustomErrorCode') {
          this.pendingAction = 'getCustomErrorCode';
          try {
            this.controller.loadUrl('https://invalid.invalid.example.test/');
          } catch (err) { console.error(JSON.stringify(err)); }
        }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onErrorReceive((event) => {
          if (this.pendingAction === 'constructor') {
            event.error.getErrorInfo();
            Utils.emitEvent(true, 205111);
            this.pendingAction = '';
          } else if (this.pendingAction === 'getCustomErrorCode') {
            event.error.getCustomErrorCode();
            Utils.emitEvent(true, 205112);
            this.pendingAction = '';
          }
        })
    }.width('100%').height('100%')
  }
}
