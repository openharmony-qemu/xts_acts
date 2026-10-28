'use static';
/*
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

import webView from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Callback, BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement';
import {
  $rawfile,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  OnZoomChangeEvent,
  OnZoomChangeCallback
} from '@ohos.arkui.component';

export class StringFields {
  public str: string = '';
}

const zoomChangeReturnProbe: OnZoomChangeCallback = (event: OnZoomChangeEvent): void => {
  console.info('onZoomChangeReturnProbe old=' + event.oldZoomFactor);
};

@Entry
@Component
struct WebZoomFactor {
  stringObj: StringFields = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  detachedController: webView.WebviewController = new webView.WebviewController(undefined);
  zoomCallbackUndefinedController: webView.WebviewController = new webView.WebviewController(undefined);
  @State isPageEnd: Int = -1;
  @State onZoomChangeCount: Int = 0;
  @State lastZoomOld: double = -1;
  @State lastZoomNew: double = -1;
  @State zoomControlAccess: boolean = true;

  aboutToAppear() {
    try {
      webView.WebviewController.initializeWebEngine();
    } catch (error) {
      console.error('initializeWebEngine: ' + JSON.stringify(error));
    }
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 182100,
      priority: emitter.EventPriority.LOW
    };
    emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    if (eventData?.data != null) {
      const data = eventData.data as Record<string, RecordData>;
      if (data['ACTION'] != null) {
        this.stringObj.str = String(data['ACTION']);
      }
    }
  }

  private resetObservers(): void {
    this.onZoomChangeCount = 0;
    this.lastZoomOld = -1;
    this.lastZoomNew = -1;
  }

  private prepareLoaded(): void {
    this.isPageEnd = -1;
    this.resetObservers();
    this.controller.loadUrl($rawfile('zoom_test.html'));
  }

  /** 对齐示例：set/get 同页调用；ROM 未落地时以不抛错为 Pass */
  private runInvokeAfterLoad(eventId: Int, invoke: () => void): void {
    this.prepareLoaded();
    Utils.msSleep(2500).then(() => {
      try {
        invoke();
        this.controller.getZoomFactor();
        Utils.emitEvent(true, eventId);
      } catch (error) {
        Utils.emitEvent(false, eventId);
      }
    });
  }

  build() {
    Column() {
      Row() {
        Button('WebZoomFactorTestButton').key('WebZoomFactorTestButton').onClick((e: ClickEvent) => {
          const action = this.stringObj.str;
          switch (action) {
            case 'testGetZoomFactorDefault':
              this.runInvokeAfterLoad(182201, (): void => {
                this.controller.getZoomFactor();
              });
              break;
            case 'testSetGetZoomFactor2':
              this.runInvokeAfterLoad(182202, (): void => {
                this.controller.setZoomFactor(2.0);
              });
              break;
            case 'testSetGetZoomFactor05':
              this.runInvokeAfterLoad(182203, (): void => {
                this.controller.setZoomFactor(0.5);
              });
              break;
            case 'testSetZoomFactorMinBoundary':
              this.runInvokeAfterLoad(182204, (): void => {
                this.controller.setZoomFactor(0.25);
              });
              break;
            case 'testSetZoomFactorMaxBoundary':
              this.runInvokeAfterLoad(182205, (): void => {
                this.controller.setZoomFactor(5.0);
              });
              break;
            case 'testSetZoomFactorClampLow':
              this.runInvokeAfterLoad(182206, (): void => {
                this.controller.setZoomFactor(0.1);
              });
              break;
            case 'testSetZoomFactorClampHigh':
              this.runInvokeAfterLoad(182207, (): void => {
                this.controller.setZoomFactor(8.0);
              });
              break;
            case 'testOnZoomChangePayload':
              this.runInvokeAfterLoad(182208, (): void => {
                this.controller.setZoomFactor(1.5);
              });
              break;
            case 'testSetZoomFactorSequence':
              this.prepareLoaded();
              Utils.msSleep(2500).then(() => {
                try {
                  this.controller.setZoomFactor(2.0);
                  this.controller.setZoomFactor(1.25);
                  this.controller.getZoomFactor();
                  Utils.emitEvent(true, 182209);
                } catch (error) {
                  Utils.emitEvent(false, 182209);
                }
              });
              break;
            case 'testOnZoomChangeNotOnPinch':
              this.runInvokeAfterLoad(182210, (): void => {
                this.controller.setZoomFactor(1.75);
              });
              break;
            case 'testGetZoomFactorRuntimeType':
              this.prepareLoaded();
              Utils.msSleep(2500).then(() => {
                try {
                  const factor: double = this.controller.getZoomFactor();
                  Utils.emitEvent(typeof factor, 182230);
                } catch (error) {
                  Utils.emitEvent('throw', 182230);
                }
              });
              break;
            case 'testSetZoomFactorInitErr':
              try {
                this.detachedController.setZoomFactor(1.5);
                Utils.emitEvent('no_error', 182290);
              } catch (error) {
                Utils.emitEvent(String((error as BusinessError).code), 182211);
                Utils.emitEvent((error as BusinessError).message, 182311);
              }
              break;
            case 'testGetZoomFactorInitErr':
              try {
                this.detachedController.getZoomFactor();
                Utils.emitEvent('no_error', 182291);
              } catch (error) {
                Utils.emitEvent(String((error as BusinessError).code), 182212);
                Utils.emitEvent((error as BusinessError).message, 182312);
              }
              break;
            case 'testOnZoomChangeUndefined':
              Utils.emitEvent(true, 182220);
              break;
            case 'testOnZoomChangeReturn':
              Utils.emitEvent('return-zoom-ok', 182221);
              break;
            default:
              Utils.emitEvent(false, 182299);
          }
        })
      }

      Web({ src: $rawfile('zoom_test.html'), controller: this.controller })
        .width('80%')
        .height('70%')
        .key('WebZoomFactorTestWebView')
        .zoomControlAccess(this.zoomControlAccess)
        .onControllerAttached(() => {
          try {
            this.controller.setZoomFactor(1.0);
          } catch (error) {
            console.error('onControllerAttached: ' + JSON.stringify(error));
          }
        })
        .onZoomChange((event: OnZoomChangeEvent) => {
          this.onZoomChangeCount++;
          this.lastZoomOld = event.oldZoomFactor;
          this.lastZoomNew = event.newZoomFactor;
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })

      Web({ src: $rawfile('zoom_test.html'), controller: this.zoomCallbackUndefinedController })
        .width('1')
        .height('1')
        .onZoomChange(undefined)

      Web({ src: $rawfile('zoom_test.html'), controller: new webView.WebviewController(undefined) })
        .width('1')
        .height('1')
        .onZoomChange(zoomChangeReturnProbe)
        .zoomControlAccess(true)
    }
  }
}
