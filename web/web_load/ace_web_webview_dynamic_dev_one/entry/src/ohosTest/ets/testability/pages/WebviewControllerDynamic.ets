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

const EVENT_KEY = 206100;

@Entry
@Component
struct WebviewControllerDynamic {
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

  build() {
    Column() {
      Button('WebviewControllerDynamic').id('WebviewControllerDynamic').onClick(async () => {
        await Utils.waitForExist(() => this.isReceive, 'WebviewControllerDynamicReceive', 1, 2000);
        this.isReceive = -1;
        if (this.cmd === 'testSetUrlTrustList') {
          try {
            this.controller.setUrlTrustList('*');
            Utils.emitEvent(true, 206120);
          } catch (e) {
            console.error(JSON.stringify(e));
            Utils.emitEvent(true, 206120);
          }
        } else if (this.cmd === 'testLoadUrl') {
          try {
            this.controller.loadUrl('https://www.example.com/');
            Utils.emitEvent(true, 206110);
          } catch (e) {
            console.error(JSON.stringify(e));
            Utils.emitEvent(true, 206110);
          }
        }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd(() => {
          console.info('page end');
        })
    }.width('100%').height('100%')
  }
}
