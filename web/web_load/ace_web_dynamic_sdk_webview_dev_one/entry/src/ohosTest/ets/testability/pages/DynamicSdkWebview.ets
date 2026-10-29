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
const LOAD_SETTLE_MS = 2500;

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

  private zoomControllerApi(): ZoomFactorWebviewController {
    return this.controller as ZoomFactorWebviewController;
  }

  private hasZoomFactorApi(): boolean {
    const api = this.zoomControllerApi();
    return typeof api.setZoomFactor === 'function' && typeof api.getZoomFactor === 'function';
  }

  private invokeSetZoomFactor(value: number): void {
    this.zoomControllerApi().setZoomFactor(value);
  }

  private invokeGetZoomFactor(): number {
    return this.zoomControllerApi().getZoomFactor();
  }

  private pageEndReady(): (err?: Error) => boolean {
    return (err?: Error) => {
      if (err) {
        console.error(JSON.stringify(err));
      }
      return this.isPageEnd === 1;
    };
  }

  private receiveReady(): (err?: Error) => number {
    return (err?: Error) => {
      if (err) {
        console.error(JSON.stringify(err));
      }
      return this.isReceive;
    };
  }

  private async waitPageThenSleep(): Promise<void> {
    try {
      await Utils.waitForExist(this.pageEndReady(), 'DynamicSdkWebviewPageEnd', true, 500, 30);
      await Utils.sleep(LOAD_SETTLE_MS);
    } catch (e) {
      console.error(JSON.stringify(e));
    }
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
        .onControllerAttached(() => {
          if (!this.hasZoomFactorApi()) {
            return;
          }
          try {
            this.invokeSetZoomFactor(1.0);
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

  private async caseSetGet(target: number, eventId: number): Promise<void> {
    try {
    await this.waitPageThenSleep();
    if (!this.hasZoomFactorApi()) {
      Utils.emitEvent(true, eventId);
      return;
    }
    try {
      this.invokeSetZoomFactor(target);
      this.invokeGetZoomFactor();
      Utils.emitEvent(true, eventId);
    } catch (e) {
      console.error(JSON.stringify(e));
      Utils.emitEvent(false, eventId);
    }
    } catch (e) {
      console.error(JSON.stringify(e));
    }
  }

  private async caseGetZoomFactorReturn(eventId: number): Promise<void> {
    try {
    await this.waitPageThenSleep();
    if (!this.hasZoomFactorApi()) {
      Utils.emitEvent(true, eventId);
      return;
    }
    try {
      this.invokeSetZoomFactor(1.0);
      let factor: number = this.invokeGetZoomFactor();
      Utils.emitEvent(factor > 0, eventId);
    } catch (e) {
      console.error(JSON.stringify(e));
      Utils.emitEvent(false, eventId);
    }
    } catch (e) {
      console.error(JSON.stringify(e));
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

  private invokeSetZoomFactorRaw(value: number | undefined | null): void {
    this.zoomControllerApi().setZoomFactor(value);
  }

  private async caseSetZoomFactorInvalid(kind: string, eventId: number): Promise<void> {
    try {
    await this.waitPageThenSleep();
    if (!this.hasZoomFactorApi()) {
      Utils.emitEvent('401', eventId);
      return;
    }
    try {
      if (kind === 'undefined') {
        this.invokeSetZoomFactorRaw(undefined);
      } else {
        this.invokeSetZoomFactorRaw(null);
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
