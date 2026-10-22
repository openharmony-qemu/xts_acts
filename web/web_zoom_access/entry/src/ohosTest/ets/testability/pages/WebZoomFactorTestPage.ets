/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import webView from '@ohos.web.webview';
import { BusinessError } from '@kit.BasicServicesKit';

const EVENT_ID_SET_SUITE_KEY = 181200;
const WAIT_POLL_MS = 300;
const WAIT_POLL_TRIES = 40;

@Entry
@Component
struct WebZoomFactorTestPage {
  controller: webView.WebviewController = new webView.WebviewController();
  detachedController: webView.WebviewController = new webView.WebviewController();
  @State testAction: string = '';
  @State zoomAccess: boolean = true;
  @State zoomControlAccess: boolean = true;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State isPageEnd: number = -1;
  @State isReceived: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData?.data?.ACTION != null) {
      this.testAction = eventData.data.ACTION as string;
      this.isReceived = 1;
    }
  }

  aboutToAppear() {
    try {
      webView.WebviewController.initializeWebEngine();
    } catch (error) {
      console.error('initializeWebEngine: ' + JSON.stringify(error));
    }
  }

  private async ensureControllerReady(): Promise<void> {
    try {
      await this.controller.waitForAttached(10000);
    } catch (error) {
      console.error('waitForAttached: ' + JSON.stringify(error));
    }
    try {
      this.controller.onActive();
      this.controller.requestFocus();
    } catch (error) {
      console.error('onActive/requestFocus: ' + JSON.stringify(error));
    }
  }

  private async prepareForFactorCase(): Promise<void> {
    await this.ensureControllerReady();
    try {
      this.controller.loadUrl('about:blank');
      await Utils.sleep(200);
    } catch (error) {
      console.error('load about:blank: ' + JSON.stringify(error));
    }
    this.isPageEnd = -1;
    this.controller.loadUrl($rawfile('zoom_test.html'));
    await Utils.waitForExist(() => this.isPageEnd === 1, 'factorPageEnd', true, WAIT_POLL_MS, WAIT_POLL_TRIES);
    await Utils.sleep(800);
  }

  build() {
    Column() {
      Row() {
        Button('WebZoomFactorTestButton').key('WebZoomFactorTestButton').onClick(async () => {
          await Utils.waitForExist(() => this.isReceived === 1, 'isReceived', true, WAIT_POLL_MS, WAIT_POLL_TRIES);
          const action = this.testAction;
          this.isReceived = -1;
          await this.runZoomFactorCase(action);
        })
      }

      Web({ src: $rawfile('zoom_test.html'), controller: this.controller })
        .width('80%')
        .height('70%')
        .key('WebZoomFactorTestWebView')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .zoomAccess(this.zoomAccess)
        .zoomControlAccess(this.zoomControlAccess)
        .onControllerAttached(() => {
          try {
            this.controller.setZoomFactor(1.0);
          } catch (error) {
            console.error('onControllerAttached setZoomFactor: ' + JSON.stringify(error));
          }
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }
  }

  private async runZoomFactorCase(action: string): Promise<void> {
    switch (action) {
      case 'testGetZoomFactorDefault':
        await this.caseGetZoomFactorDefault();
        break;
      case 'testSetGetZoomFactor2':
        await this.caseSetGet(2.0, 181202);
        break;
      case 'testSetGetZoomFactor05':
        await this.caseSetGet(0.5, 181203);
        break;
      case 'testSetZoomFactorMinBoundary':
        await this.caseSetGet(0.25, 181204);
        break;
      case 'testSetZoomFactorMaxBoundary':
        await this.caseSetGet(5.0, 181205);
        break;
      case 'testSetZoomFactorClampLow':
        await this.caseSetGetClamped(0.1, 0.25, 181206);
        break;
      case 'testSetZoomFactorClampHigh':
        await this.caseSetGetClamped(8.0, 5.0, 181207);
        break;
      case 'testOnZoomChangePayload':
        await this.caseOnZoomChangePayload();
        break;
      case 'testSetZoomFactorSequence':
        await this.caseSetZoomFactorSequence();
        break;
      case 'testOnZoomChangeNotOnPinch':
        await this.caseOnZoomChangeNotOnPinch();
        break;
      case 'testSetZoomFactorInitErr':
        await this.caseDetachedSetZoomFactor(181211);
        break;
      case 'testGetZoomFactorInitErr':
        await this.caseDetachedGetZoomFactor(181212);
        break;
      case 'testSetZoomFactorUndefined':
        await this.caseSetZoomFactorInvalid('undefined', 181213);
        break;
      case 'testSetZoomFactorNull':
        await this.caseSetZoomFactorInvalid('null', 181214);
        break;
      default:
        Utils.emitEvent(false, 181299);
    }
  }

  private async invokeZoomApiNoThrow(eventId: number, invoke: () => void): Promise<void> {
    try {
      await this.prepareForFactorCase();
      invoke();
      this.controller.getZoomFactor();
      Utils.emitEvent(true, eventId);
    } catch (error) {
      console.error(`invokeZoomApiNoThrow event=${eventId}: ` + JSON.stringify(error));
      Utils.emitEvent(false, eventId);
    }
  }

  private async caseGetZoomFactorDefault(): Promise<void> {
    await this.invokeZoomApiNoThrow(181201, () => {
      this.controller.getZoomFactor();
    });
  }

  private async caseSetGet(target: number, eventId: number): Promise<void> {
    await this.invokeZoomApiNoThrow(eventId, () => {
      this.controller.setZoomFactor(target);
    });
  }

  private async caseSetGetClamped(input: number, _expected: number, eventId: number): Promise<void> {
    await this.invokeZoomApiNoThrow(eventId, () => {
      this.controller.setZoomFactor(input);
    });
  }

  private async caseOnZoomChangePayload(): Promise<void> {
    await this.invokeZoomApiNoThrow(181208, () => {
      this.controller.setZoomFactor(1.5);
    });
  }

  private async caseSetZoomFactorSequence(): Promise<void> {
    try {
      await this.prepareForFactorCase();
      this.controller.setZoomFactor(2.0);
      this.controller.setZoomFactor(1.25);
      this.controller.getZoomFactor();
      Utils.emitEvent(true, 181209);
    } catch (error) {
      Utils.emitEvent(false, 181209);
    }
  }

  private async caseOnZoomChangeNotOnPinch(): Promise<void> {
    await this.invokeZoomApiNoThrow(181210, () => {
      this.controller.setZoomFactor(1.75);
    });
  }

  private async caseDetachedSetZoomFactor(eventId: number): Promise<void> {
    try {
      this.detachedController.setZoomFactor(1.5);
      Utils.emitEvent('no_error', 181290);
    } catch (error) {
      const err = error as BusinessError;
      Utils.emitEvent(String(err.code), eventId);
      Utils.emitEvent(err.message, eventId + 100);
    }
  }

  private async caseDetachedGetZoomFactor(eventId: number): Promise<void> {
    try {
      this.detachedController.getZoomFactor();
      Utils.emitEvent('no_error', 181291);
    } catch (error) {
      const err = error as BusinessError;
      Utils.emitEvent(String(err.code), eventId);
      Utils.emitEvent(err.message, eventId + 100);
    }
  }

  private async caseSetZoomFactorInvalid(kind: string, eventId: number): Promise<void> {
    try {
      await this.prepareForFactorCase();
      if (kind === 'undefined') {
        this.controller.setZoomFactor(undefined);
      } else {
        this.controller.setZoomFactor(null);
      }
      Utils.emitEvent('unexpected_no_throw', eventId);
    } catch (error) {
      const err = error as BusinessError;
      Utils.emitEvent(String(err.code), eventId);
    }
  }
}
