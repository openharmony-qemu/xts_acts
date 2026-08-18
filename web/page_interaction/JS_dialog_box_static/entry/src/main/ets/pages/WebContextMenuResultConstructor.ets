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
  WebContextMenuResult
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
struct WebContextMenuResultConstructor {
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
        Button("WebContextMenuResultConstructor click")
          .key('WebContextMenuResultConstructorButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.stringObj.str)
            switch (this.stringObj.str) {
              case "emitConstructor001": {
                try {
                  let result: WebContextMenuResult = new WebContextMenuResult();
                  let isObject: boolean = result instanceof Object;
                  console.info('WebContextMenuResult constructor: isObject=' + isObject);
                  Utils.emitEvent('constructorSuccess', 70040)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('constructorError', 70041)
                }
                break;
              }
              case "emitConstructorReturn001": {
                try {
                  let result: WebContextMenuResult = new WebContextMenuResult();
                  let isObject: boolean = result instanceof Object;
                  console.info('WebContextMenuResult constructor return isObject: ' + isObject);
                  Utils.emitEvent(String(isObject), 70042)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70043)
                }
                break;
              }
              case "emitCloseContextMenu001": {
                try {
                  let result: WebContextMenuResult = new WebContextMenuResult();
                  result.closeContextMenu();
                  console.info('WebContextMenuResult closeContextMenu success');
                  Utils.emitEvent('closeContextMenuSuccess', 70044)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70045)
                }
                break;
              }
              case "emitCopyImage001": {
                try {
                  let result: WebContextMenuResult = new WebContextMenuResult();
                  result.copyImage();
                  console.info('WebContextMenuResult copyImage success');
                  Utils.emitEvent('copyImageSuccess', 70046)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70047)
                }
                break;
              }
              case "emitCopy001": {
                try {
                  let result: WebContextMenuResult = new WebContextMenuResult();
                  result.copy();
                  console.info('WebContextMenuResult copy success');
                  Utils.emitEvent('copySuccess', 70048)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70049)
                }
                break;
              }
              case "emitCut001": {
                try {
                  let result: WebContextMenuResult = new WebContextMenuResult();
                  result.cut();
                  console.info('WebContextMenuResult cut success');
                  Utils.emitEvent('cutSuccess', 70050)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70051)
                }
                break;
              }
              case "emitSelectAll001": {
                try {
                  let result: WebContextMenuResult = new WebContextMenuResult();
                  result.selectAll();
                  console.info('WebContextMenuResult selectAll success');
                  Utils.emitEvent('selectAllSuccess', 70052)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent('error', 70053)
                }
                break;
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

