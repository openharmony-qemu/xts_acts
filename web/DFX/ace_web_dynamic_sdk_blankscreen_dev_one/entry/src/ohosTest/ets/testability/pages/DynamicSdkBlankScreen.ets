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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';

const EVENT_KEY = 207200;

@Entry
@Component
struct DynamicSdkBlankScreenPage {
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

  private receiveReady(): (err?: Error) => number {
    return (err?: Error) => {
      if (err) {
        console.error(JSON.stringify(err));
      }
      return this.isReceive;
    };
  }

  build() {
    Column() {
      Button('DynamicSdkBlankScreen').id('DynamicSdkBlankScreenBtn').onClick(async () => {
        try {
          await Utils.waitForExist(this.receiveReady(), 'DynamicSdkBlankScreenReceive', 1, 3000);
          const action = this.cmd;
          this.isReceive = -1;
          this.runCase(action);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .blankScreenDetectionConfig({ enable: true, detectionMethods: [0], detectionTiming: [1.0] })
        .width('100%')
        .height('80%')
    }.width('100%').height('100%')
  }

  private applyEnableBlankScreenMonitorParam(enable: boolean | undefined): boolean {
    if (enable === true) {
      return true;
    }
    if (enable === false) {
      return false;
    }
    return enable === undefined;
  }

  private runCase(action: string): void {
    switch (action) {
      case 'testEnableBlankScreenMonitor':
        Utils.emitEvent(this.applyEnableBlankScreenMonitorParam(true), 204330);
        break;
      case 'testEnableBlankScreenMonitorFalse':
        this.applyEnableBlankScreenMonitorParam(false);
        Utils.emitEvent(true, 204331);
        break;
      case 'testEnableBlankScreenMonitorUndefined':
        this.applyEnableBlankScreenMonitorParam(undefined);
        Utils.emitEvent(true, 204332);
        break;
      case 'testEnableBlankScreenMonitorReturnThis':
        Utils.emitEvent(true, 204333);
        break;
      default:
        Utils.emitEvent(false, 204399);
    }
  }
}
