'use static';
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

import { Entry, Component, Column, Row, Button, Web, ScrollDirectionalLockType, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base';

@Entry
@Component
struct WebScrollDirectionalLock {
  @State str: string = "";
  @State lockEnabled: boolean = true;
  @State lockType: ScrollDirectionalLockType = ScrollDirectionalLockType.ALL;
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
        Button("web click").key('WebScrollDirectionalLockButton').onClick((e: ClickEvent) => {
          switch (this.str) {
            case "emitScrollDirectionalLock001": {
              this.lockEnabled = true;
              this.lockType = ScrollDirectionalLockType.ALL;
              Utils.emitEvent(true, 185010);
              break;
            }
            case "emitScrollDirectionalLock002": {
              this.lockEnabled = true;
              this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
              Utils.emitEvent(true, 185020);
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: 'resource://rawfile/indexFive.html', controller: this.controller })
        .key('WebScrollDirectionalLockWeb')
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .enableScrollDirectionalLock(this.lockEnabled, this.lockType)
        .height('95%')
    }.width('100%').height('100%')
  }
}
