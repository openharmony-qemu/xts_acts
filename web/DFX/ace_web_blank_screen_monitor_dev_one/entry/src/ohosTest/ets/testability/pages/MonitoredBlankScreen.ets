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

const EVENT_KEY = 204300;

enum BlankScreenReason { DNS_RESOLVE_FAILED = 101, WEB_VIEW_ZERO_SIZE = 501 }

interface MonitoredBlankScreenEventInfo {
  url: string;
  reason: BlankScreenReason;
  extraMsg: string;
}

type OnMonitorBlankScreenCallback = (info: MonitoredBlankScreenEventInfo) => void;

@Entry
@Component
struct MonitoredBlankScreenPage {
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

  fireMonitor(cb: OnMonitorBlankScreenCallback) {
    cb({
      url: 'https://www.example.com/path',
      reason: BlankScreenReason.DNS_RESOLVE_FAILED,
      extraMsg: 'dynamic-monitor',
    });
  }

  build() {
    Column() {
      Button('MonitoredBlankScreen').id('MonitoredBlankScreenBtn').onClick(async () => {
        await Utils.waitForExist(() => this.isReceive, 'MonitoredBlankScreenReceive', 1, 3000);
        this.isReceive = -1;
        if (this.cmd === 'info:url') {
          let info: MonitoredBlankScreenEventInfo = {
            url: 'https://www.example.com/',
            reason: BlankScreenReason.DNS_RESOLVE_FAILED,
            extraMsg: 'x',
          };
          Utils.emitEvent(info.url.length > 0, 204310);
        } else if (this.cmd === 'info:reason') {
          Utils.emitEvent(BlankScreenReason.DNS_RESOLVE_FAILED === 101, 204311);
        } else if (this.cmd === 'info:extraMsg') {
          Utils.emitEvent(true, 204312);
        } else if (this.cmd === 'onMonitoredBlankScreen') {
          this.fireMonitor(() => { });
          Utils.emitEvent(true, 204320);
        } else if (this.cmd === 'onMonitorCallback') {
          let handler: OnMonitorBlankScreenCallback = (info) => {
            console.info(info.extraMsg);
          };
          this.fireMonitor(handler);
          Utils.emitEvent(true, 204321);
        } else if (this.cmd === 'runOnDetectedBlankScreen') {
          try {
            this.controller.loadUrl('https://www.example.com/');
          } catch (e) { console.error(JSON.stringify(e)); }
          Utils.emitEvent(true, 204220);
        }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .blankScreenDetectionConfig({ enable: true, detectionMethods: [0], detectionTiming: [1.0] })
        .onDetectedBlankScreen((ev) => { console.info('detected ' + ev.url); })
    }.width('100%').height('100%')
  }
}
