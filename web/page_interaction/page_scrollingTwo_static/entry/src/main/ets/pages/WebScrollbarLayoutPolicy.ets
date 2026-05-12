/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

'use static'
import { Entry, Component, Column, Row, Button, Web, ScrollbarLayoutPolicy, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { Callback, RecordData } from '@ohos.base';

@Entry
@Component
struct WebScrollbarLayoutPolicy {
  @State str: string = "";
  @State policyValue: ScrollbarLayoutPolicy = ScrollbarLayoutPolicy.CONTENT;
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  aboutToAppear(): void {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(): void {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    const data = eventData?.data as Record<string, RecordData>;
    if (data != null && data['ACTION'] != null) {
      this.str = String(data['ACTION']);
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('ScrollbarLayoutPolicyButton').onClick((e: ClickEvent) => {
          switch (this.str) {
            case "emitScrollbarLayoutPolicy001": {
              this.policyValue = ScrollbarLayoutPolicy.CONTENT;
              Utils.emitEvent(true, 184010);
              break;
            }
            case "emitScrollbarLayoutPolicy002": {
              this.policyValue = ScrollbarLayoutPolicy.SYSTEM;
              Utils.emitEvent(true, 184020);
              break;
            }
            case "emitSwitchToWebScrollDirectionalLockPage": {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebScrollDirectionalLock' })
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: 'resource://rawfile/indexFive.html', controller: this.controller })
        .key('WebScrollbarLayoutPolicyWeb')
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .scrollbarLayoutPolicy(this.policyValue)
        .height('95%')
    }.width('100%').height('100%')
  }
}
