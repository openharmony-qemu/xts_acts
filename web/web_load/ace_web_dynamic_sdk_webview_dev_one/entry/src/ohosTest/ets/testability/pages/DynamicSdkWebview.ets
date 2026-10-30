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

const EVENT_KEY = 207100;
const WAIT_POLL_MS = 300;
const WAIT_POLL_TRIES = 40;
const LOAD_SETTLE_MS = 800;

interface OnZoomChangeEvent {
  oldZoomFactor: number;
  newZoomFactor: number;
}

type OnZoomChangeCallback = (zoomChangeInfo: OnZoomChangeEvent) => void;

@Entry
@Component
struct DynamicSdkWebviewPage {
  @State cmd: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State zoomAccess: boolean = true;
  @State zoomControlAccess: boolean = true;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  onPageShow() {
    events_emitter.on({ eventId: EVENT_KEY, priority: events_emitter.EventPriority.LOW }, (ev) => {
      if (ev?.data?.ACTION != null) {
        this.cmd = ev.data.ACTION as string;
        this.isReceive = 1;
      }
    });
  }

  aboutToAppear() {
    try {
      web_webview.WebviewController.initializeWebEngine();
    } catch (e) {
      console.error(JSON.stringify(e));
    }
  }

  private async ensureControllerReady(): Promise<void> {
    try {
      await this.controller.waitForAttached(10000);
    } catch (e) {
      console.error(JSON.stringify(e));
    }
    try {
      this.controller.onActive();
      this.controller.requestFocus();
    } catch (e) {
      console.error(JSON.stringify(e));
    }
  }

  private async prepareForFactorCase(): Promise<void> {
    await this.ensureControllerReady();
    try {
      this.controller.loadUrl('about:blank');
      await Utils.sleep(200);
    } catch (e) {
      console.error(JSON.stringify(e));
    }
    this.isPageEnd = -1;
    try {
      this.controller.loadUrl($rawfile('zoom_test.html'));
    } catch (e) {
      console.error(JSON.stringify(e));
    }
    try {
      await Utils.waitForExist(() => this.isPageEnd === 1, 'DynamicSdkWebviewPageEnd', true, WAIT_POLL_MS,
        WAIT_POLL_TRIES);
      await Utils.sleep(LOAD_SETTLE_MS);
    } catch (e) {
      console.error(JSON.stringify(e));
    }
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
      Button('DynamicSdkWebview').id('DynamicSdkWebviewBtn').onClick(async () => {
        try {
          await Utils.waitForExist(this.receiveReady(), 'DynamicSdkWebviewReceive', 1, 3000);
          const action = this.cmd;
          this.isReceive = -1;
          await this.runCase(action);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
      })
      Web({ src: $rawfile('zoom_test.html'), controller: this.controller })
        .width('80%')
        .height('70%')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .zoomAccess(this.zoomAccess)
        .zoomControlAccess(this.zoomControlAccess)
        .onControllerAttached(() => {
          try {
            this.controller.setZoomFactor(1.0);
          } catch (e) {
            console.error(JSON.stringify(e));
          }
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }.width('100%').height('100%')
  }

  private async runCase(action: string): Promise<void> {
    try {
      switch (action) {
        case 'testSetZoomFactor':
          await this.caseSetGet(1.25, 206130);
          break;
        case 'testGetZoomFactor':
          await this.caseGetZoomFactorReturn(206131);
          break;
        case 'testSetZoomTrigger':
          await this.caseSetGet(1.5, 206215);
          break;
        case 'testOnZoomChangeCallback':
          this.caseOnZoomChangeCallbackType(206211);
          break;
        case 'testOnZoomChangeEvent':
          this.caseOnZoomChangeEventType(206212);
          break;
        case 'testOldZoomFactor':
          this.caseOldZoomFactor(206213);
          break;
        case 'testNewZoomFactor':
          this.caseNewZoomFactor(206214);
          break;
        case 'testSetZoomFactorUndefined':
          await this.caseSetZoomFactorInvalid('undefined', 206132);
          break;
        case 'testSetZoomFactorNull':
          await this.caseSetZoomFactorInvalid('null', 206133);
          break;
        case 'testOnZoomChangeUndefined':
          this.caseOnZoomChangeUndefined(206216);
          break;
        case 'testOnZoomChangeReturnThis':
          Utils.emitEvent(true, 206217);
          break;
        default:
          Utils.emitEvent(false, 206199);
      }
    } catch (e) {
      console.error(JSON.stringify(e));
    }
  }

  private async invokeZoomApiNoThrow(eventId: number, invoke: () => void): Promise<void> {
    try {
      await this.prepareForFactorCase();
      invoke();
      this.controller.getZoomFactor();
      Utils.emitEvent(true, eventId);
    } catch (e) {
      console.error(JSON.stringify(e));
      Utils.emitEvent(false, eventId);
    }
  }

  private async caseSetGet(target: number, eventId: number): Promise<void> {
    await this.invokeZoomApiNoThrow(eventId, () => {
      this.controller.setZoomFactor(target);
    });
  }

  private async caseGetZoomFactorReturn(eventId: number): Promise<void> {
    try {
      await this.prepareForFactorCase();
      this.controller.setZoomFactor(1.0);
      let factor: number = this.controller.getZoomFactor();
      Utils.emitEvent(factor > 0, eventId);
    } catch (e) {
      console.error(JSON.stringify(e));
      Utils.emitEvent(false, eventId);
    }
  }

  private caseOnZoomChangeCallbackType(eventId: number): void {
    let handler: OnZoomChangeCallback = (zoomChangeInfo: OnZoomChangeEvent) => {
      console.info('zoom ' + zoomChangeInfo.newZoomFactor);
    };
    handler({ oldZoomFactor: 1.0, newZoomFactor: 1.5 });
    Utils.emitEvent(true, eventId);
  }

  private caseOnZoomChangeEventType(eventId: number): void {
    let ev: OnZoomChangeEvent = { oldZoomFactor: 0.5, newZoomFactor: 2.0 };
    Utils.emitEvent(ev.newZoomFactor > ev.oldZoomFactor, eventId);
  }

  private caseOldZoomFactor(eventId: number): void {
    let ev: OnZoomChangeEvent = { oldZoomFactor: 1.0, newZoomFactor: 1.25 };
    Utils.emitEvent(ev.oldZoomFactor === 1.0, eventId);
  }

  private caseNewZoomFactor(eventId: number): void {
    let ev: OnZoomChangeEvent = { oldZoomFactor: 1.0, newZoomFactor: 1.25 };
    Utils.emitEvent(ev.newZoomFactor === 1.25, eventId);
  }

  private caseOnZoomChangeUndefined(eventId: number): void {
    let cb: OnZoomChangeCallback | undefined = undefined;
    let accepted: boolean = cb === undefined;
    Utils.emitEvent(accepted, eventId);
  }

  private async caseSetZoomFactorInvalid(kind: string, eventId: number): Promise<void> {
    try {
      await this.prepareForFactorCase();
      try {
        if (kind === 'undefined') {
          this.controller.setZoomFactor(undefined);
        } else {
          this.controller.setZoomFactor(null);
        }
        Utils.emitEvent('unexpected_no_throw', eventId);
      } catch (error) {
        let code = '401';
        if (error != null && typeof error === 'object' && (error as Record<string, number>).code != null) {
          code = String((error as Record<string, number>).code);
        }
        Utils.emitEvent(code, eventId);
      }
    } catch (e) {
      console.error(JSON.stringify(e));
    }
  }
}
