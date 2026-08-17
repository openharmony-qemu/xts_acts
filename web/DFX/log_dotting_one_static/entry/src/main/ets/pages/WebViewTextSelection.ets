'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Utils from '../../src/test/Util.test';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { canIUse } from '@internal.full.global';
import web_webview from '@ohos.web.webview';
import router from '@ohos.router';
import { Entry, Component, Column, Button, Web, $rawfile, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct WebViewTextSelection {
  @State str: string = '';
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);

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
        this.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Button('web click')
        .key('WebViewTextSelectionButton')
        .onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitOnTextSelectionChangeBasic': {
              setTimeout(() => {
                this.controller.loadUrl('resource://rawfile/onTextSelectionChange.html')
              }, 1000)
              setTimeout(() => {
                this.controller.runJavaScript('setSelection()');
                console.log('setSelection 已调用');
              }, 3000);
              break;
            }
            case 'emitOnTextSelectionChangeClear': {
              setTimeout(() => {
                this.controller.loadUrl('resource://rawfile/onTextSelectionChange.html')
              }, 1000)
              setTimeout(() => {
                this.controller.runJavaScript('setSelection()');
                console.log('setSelection 已调用');
              }, 3000);
              setTimeout(() => {
                this.controller.runJavaScript('clearSelection()');
                console.log('clearSelection 已调用');
              }, 5000);
              break;
            }
            case 'emitOnTextSelectionChangePartial': {
              setTimeout(() => {
                this.controller.loadUrl('resource://rawfile/onTextSelectionChange.html')
              }, 1000)
              setTimeout(() => {
                this.controller.runJavaScript('setPartialSelection()');
                console.log('setPartialSelection 已调用');
              }, 3000);
              break;
            }

          }
        })

      Web({ src: $rawfile('onTextSelectionChange.html'), controller: this.controller })
        .key('WebViewTextSelectionWeb')
        .javaScriptAccess(true)
        .onTextSelectionChange((selectionText: string) => {
          console.info(`Selected text: '${selectionText}'`);
          if (selectionText && selectionText.length > 0) {
            Utils.emitEvent(selectionText, 202601301);
          } else {
            Utils.emitEvent('empty', 202601302);
          }
        })
    }.height('20%')
  }
}