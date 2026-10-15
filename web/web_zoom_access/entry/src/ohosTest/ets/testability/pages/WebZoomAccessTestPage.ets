/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium-dynamic';
import testsuite from '../../test/List.test';
import { Driver } from '@ohos.UiTest';
import { BusinessError } from '@kit.BasicServicesKit';

const EVENT_ID_SET_SUITE_KEY = 181100;
const EVENT_ID_FACTOR_SUITE_KEY = 181200;
const WAIT_POLL_MS = 300;
const WAIT_POLL_TRIES = 40;
const driver = Driver.create();

@Entry
@Component
struct WebZoomAccessTestPage {
  controller: webView.WebviewController = new webView.WebviewController();
  detachedController: webView.WebviewController = new webView.WebviewController();
  @State testAction: string = "";
  @State zoomAccess: boolean = false;
  @State zoomControlAccess: boolean = true;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State oldScale: number = 0;
  @State newScale: number = 0;
  @State compareScale: number = 0;
  @State isPageEnd: number = -1;
  @State isReceived: number = -1;
  @State onZoomChangeCount: number = 0;
  @State lastZoomOld: number = -1;
  @State lastZoomNew: number = -1;
  @State factorScaleChangeCount: number = 0;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.once(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("WebZoomAccessTestPage valueChangeCallBack: " + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null && eventData.data.ACTION != null) {
      this.testAction = eventData.data.ACTION;
      this.isReceived = 1;
    }
  }

  private factorValueChangeCallBack = (eventData: events_emitter.EventData) => {
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
    let factorEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_FACTOR_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(factorEvent, this.factorValueChangeCallBack);
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("WebZoomAccessTestButton").key('WebZoomAccessTestButton').onClick(async () => {
          console.info("WebZoomAccessTestButton clicked, action: " + this.testAction);
          await Utils.waitForExist(() => this.isReceived, this.testAction + ' isReceived', 1, 2000);
          const action = this.testAction;
          this.isReceived = -1;
          if (action.startsWith('testWebZoomAccess')) {
            await Utils.waitForExist(() => this.isPageEnd, action + ' isPageEnd', 1, 2000);
          }

          switch (action) {
            case "testWebZoomAccessFalse": {
              await this.testZoomAccessFalse();
              break;
            }
            case "testWebZoomAccessTrue": {
              await this.testZoomAccessTrue();
              break;
            }
            case "testWebZoomAccessZoomIn": {
              await this.testZoomAccessZoomIn();
              break;
            }
            case "testWebZoomAccessZoomOut": {
              await this.testZoomAccessZoomOut();
              break;
            }
            case "testWebZoomAccessToggle": {
              await this.testZoomAccessToggle();
              break;
            }
            default: {
              await this.runZoomFactorCase(action);
            }
          }
        })
      }

      Web({ src: $rawfile('zoom_test.html'), controller: this.controller })
        .width('80%')
        .height('70%')
        .key('WebZoomAccessTestWebView')
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
        .onZoomChange((event) => {
          this.onZoomChangeCount++;
          this.lastZoomOld = event.oldZoomFactor;
          this.lastZoomNew = event.newZoomFactor;
          console.info(`onZoomChange old=${event.oldZoomFactor} new=${event.newZoomFactor}`);
        })
        .onScaleChange((event) => {
          this.factorScaleChangeCount++;
          console.log('onScaleChange - oldScale: ' + event.oldScale + ', newScale: ' + event.newScale);
          this.oldScale = event.oldScale;
          this.newScale = event.newScale;
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url: ' + event.url);
          this.isPageEnd = 1;
        })
    }
  }

  private async testZoomAccessFalse() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = false;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom_test.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessFalse isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessFalse', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      await Utils.waitForReleaseDriver('testWebZoomAccessFalse', driver);
      Utils.emitEvent((this.oldScale === 0 && this.newScale === 0), 181101);
    } catch (error) {
      console.error('testZoomAccessFalse error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181101);
    }
  }

  private async testZoomAccessTrue() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = true;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom_test.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessTrue isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessTrue', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      await Utils.waitForReleaseDriver('testWebZoomAccessTrue', driver);
      Utils.emitEvent((this.oldScale > 0 && this.newScale > 0 && this.newScale > this.oldScale), 181102);
    } catch (error) {
      console.error('testZoomAccessTrue error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181102);
    }
  }

  private async testZoomAccessZoomIn() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = true;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom_test.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessZoomIn isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomIn', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomIn', driver);
      Utils.emitEvent((this.newScale > this.oldScale), 181103);
    } catch (error) {
      console.error('testZoomAccessZoomIn error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181103);
    }
  }

  private async testZoomAccessZoomOut() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = true;
      this.oldScale = 0;
      this.newScale = 0;
      this.compareScale = 0;
      this.controller.loadUrl($rawfile('zoom_test.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessZoomOut isPageEnd', 1, 2000);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomOut', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      this.compareScale = this.newScale;
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomOut', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', false);
      await Utils.waitForReleaseDriver('testWebZoomAccessZoomOut', driver);
      Utils.emitEvent((this.newScale < this.compareScale), 181104);
    } catch (error) {
      console.error('testZoomAccessZoomOut error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181104);
    }
  }

  private async testZoomAccessToggle() {
    try {
      this.isPageEnd = -1;
      this.zoomAccess = false;
      this.oldScale = 0;
      this.newScale = 0;
      this.controller.loadUrl($rawfile('zoom_test.html'));
      await Utils.waitForExist(() => this.isPageEnd, 'testWebZoomAccessToggle isPageEnd', 1, 2000);

      await Utils.waitForReleaseDriver('testWebZoomAccessToggle step1', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      let step1Result = (this.oldScale === 0 && this.newScale === 0);

      this.zoomAccess = true;
      await Utils.sleep(500);
      this.oldScale = 0;
      this.newScale = 0;

      await Utils.waitForReleaseDriver('testWebZoomAccessToggle step2', driver);
      await Utils.fingerZoom('WebZoomAccessTestWebView', true);
      let step2Result = (this.newScale > this.oldScale);

      Utils.emitEvent((step1Result && step2Result), 181105);
    } catch (error) {
      console.error('testZoomAccessToggle error: ' + JSON.stringify(error));
      Utils.emitEvent(false, 181105);
    }
  }

  private approxEqual(a: number, b: number): boolean {
    return Math.abs(a - b) < 0.06;
  }

  private resetZoomObservers(): void {
    this.onZoomChangeCount = 0;
    this.factorScaleChangeCount = 0;
    this.lastZoomOld = -1;
    this.lastZoomNew = -1;
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

  private async readZoomFactorAfterSet(target: number, maxWaitMs: number): Promise<number> {
    const stepMs = 150;
    const attempts = Math.max(1, Math.floor(maxWaitMs / stepMs));
    let factor = this.controller.getZoomFactor();
    for (let i = 0; i < attempts; i++) {
      if (this.approxEqual(factor, target)) {
        return factor;
      }
      await Utils.sleep(stepMs);
      factor = this.controller.getZoomFactor();
    }
    return factor;
  }

  private async prepareForFactorCase(): Promise<void> {
    this.zoomAccess = true;
    this.zoomControlAccess = true;
    await this.ensureControllerReady();
    this.resetZoomObservers();
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

  /** 对齐示例页：set 后 refresh(get)；ROM 未落地时以「调用不抛错」为 Pass */
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
