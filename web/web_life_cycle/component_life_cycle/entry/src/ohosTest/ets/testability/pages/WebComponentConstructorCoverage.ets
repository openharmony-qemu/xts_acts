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

import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
const EVENT_ID_SET_EMIT_KEY = 138200;

@Entry
@Component
struct WebComponentConstructorCoverage {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null && eventData.data.ACTION != null) {
      this.str = eventData.data.ACTION;
      this.isReceive = 0;
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebComponentConstructorCoverage')
          .id('WebComponentConstructorCoverageButton')
          .onClick(async () => {
            console.info('WebComponentConstructorCoverage key==>' + this.str);
            switch (this.str) {
              case 'testPermissionRequestClassCallDirect001': {
                let request: PermissionRequest = new PermissionRequest();
                Utils.emitEvent(request != null, 138210);
                break;
              }
              case 'testPermissionRequestConstructorCallDirect001': {
                let request: PermissionRequest = new PermissionRequest();
                Utils.emitEvent(typeof request.deny === 'function', 138211);
                break;
              }
              case 'testPermissionRequestConstructorReturnDirect001': {
                let request: PermissionRequest = new PermissionRequest();
                Utils.emitEvent(request instanceof PermissionRequest, 138212);
                break;
              }
              case 'testScreenCaptureHandlerClassCallDirect001': {
                let handler: ScreenCaptureHandler = new ScreenCaptureHandler();
                Utils.emitEvent(handler != null, 138220);
                break;
              }
              case 'testScreenCaptureHandlerConstructorCallDirect001': {
                let handler: ScreenCaptureHandler = new ScreenCaptureHandler();
                Utils.emitEvent(typeof handler.deny === 'function', 138221);
                break;
              }
              case 'testScreenCaptureHandlerConstructorReturnDirect001': {
                let handler: ScreenCaptureHandler = new ScreenCaptureHandler();
                Utils.emitEvent(handler instanceof ScreenCaptureHandler, 138222);
                break;
              }
              case 'testJsGeolocationClassCallDirect001': {
                let geo: JsGeolocation = new JsGeolocation();
                Utils.emitEvent(geo != null, 138230);
                break;
              }
              case 'testJsGeolocationConstructorCallDirect001': {
                let geo: JsGeolocation = new JsGeolocation();
                Utils.emitEvent(typeof geo.invoke === 'function', 138231);
                break;
              }
              case 'testJsGeolocationConstructorReturnDirect001': {
                let geo: JsGeolocation = new JsGeolocation();
                Utils.emitEvent(geo instanceof JsGeolocation, 138232);
                break;
              }
              case 'testEventResultClassCallDirect001': {
                let result: EventResult = new EventResult();
                Utils.emitEvent(result != null, 138240);
                break;
              }
              case 'testEventResultConstructorCallDirect001': {
                let result: EventResult = new EventResult();
                Utils.emitEvent(typeof result.setGestureEventResult === 'function', 138241);
                break;
              }
              case 'testEventResultConstructorReturnDirect001': {
                let result: EventResult = new EventResult();
                Utils.emitEvent(result instanceof EventResult, 138242);
                break;
              }
            }
          })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
    }
  }
}
