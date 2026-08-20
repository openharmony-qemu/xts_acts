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

import webview from '@ohos.web.webview';
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web,
  ScreenCaptureHandler
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct ScreenCaptureHandlerConstructor {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("ScreenCaptureHandlerConstructor click")
          .key('ScreenCaptureHandlerConstructorButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.stringObj.str)
            switch (this.stringObj.str) {
              case "emitConstructor001": {
                try {
                  let handler: ScreenCaptureHandler = new ScreenCaptureHandler();
                  let isObject: boolean = handler instanceof Object;
                  console.info('ScreenCaptureHandler constructor: isObject=' + isObject);
                  Utils.emitEvent('constructorSuccess', 70060)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('constructorError', 70061)
                }
                break;
              }
              case "emitConstructorReturn001": {
                try {
                  let handler: ScreenCaptureHandler = new ScreenCaptureHandler();
                  let isObject: boolean = handler instanceof Object;
                  console.info('ScreenCaptureHandler constructor return isObject: ' + isObject);
                  Utils.emitEvent(String(isObject), 70062)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70063)
                }
                break;
              }
              case "emitGetOrigin001": {
                try {
                  let handler: ScreenCaptureHandler = new ScreenCaptureHandler();
                  let origin: string = handler.getOrigin();
                  console.info('ScreenCaptureHandler getOrigin: ' + origin);
                  Utils.emitEvent(origin, 70064)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70065)
                }
                break;
              }
              case "emitDeny001": {
                try {
                  let handler: ScreenCaptureHandler = new ScreenCaptureHandler();
                  handler.deny();
                  console.info('ScreenCaptureHandler deny success');
                  Utils.emitEvent('denySuccess', 70066)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70067)
                }
                break;
              }

              case 'emitSwitchNextPageStatic07' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebContextMenuResultConstructor' })
                console.log('push URL success')
              }

            }
          })

        Web({ src: 'resource://rawfile/index2.html', controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}

