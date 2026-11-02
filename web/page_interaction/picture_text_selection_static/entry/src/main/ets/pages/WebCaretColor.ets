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

import { Entry, Component, Column, Row, Button, Web, ClickEvent, Color, ResourceColor, $rawfile } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData, BusinessError } from '@ohos.base';

@Entry
@Component
struct WebCaretColor {
  private controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State private activeColor: ResourceColor | undefined = '#FFFF0000';
  @State str: string = '';
  @State isPageEnd: int = -1;

  aboutToAppear(): void {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> =
    (eventData: events_emitter.EventData): void => {
      const data = eventData?.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        this.str = String(data['ACTION']);
      }
    }

  private async waitPage(): Promise<boolean> {
    for (let i: int = 0; i < 30; i++) {
      if (this.isPageEnd === 1) {
        return true;
      }
      await Utils.msSleep(300);
    }
    return this.isPageEnd === 1;
  }

  private async waitAction(expected: string): Promise<boolean> {
    for (let i: int = 0; i < 15; i++) {
      if (this.str === expected) {
        return true;
      }
      await Utils.msSleep(200);
    }
    return this.str === expected;
  }

  private async emitAfterApply(eventId: int, result: Object): Promise<void> {
    try {
      let ready: boolean = this.isPageEnd === 1;
      if (!ready) {
        ready = await this.waitPage();
      }
      if (!ready && eventId !== 187150) {
        Utils.emitEvent(false, eventId);
        return;
      }
      Utils.emitEvent(result, eventId);
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error(`ErrorCode: ${err.code}, Message: ${err.message}`);
      Utils.emitEvent(false, eventId);
    }
  }

  private async handleClick(): Promise<void> {
    switch (this.str) {
      case 'emitCaretColorString': {
        if (!(await this.waitAction('emitCaretColorString'))) {
          Utils.emitEvent(false, 187110);
          break;
        }
        this.activeColor = '#FFFF0000';
        await this.emitAfterApply(187110, true);
        break;
      }
      case 'emitCaretColorEnum': {
        if (!(await this.waitAction('emitCaretColorEnum'))) {
          Utils.emitEvent(false, 187120);
          break;
        }
        this.activeColor = Color.Blue;
        await this.emitAfterApply(187120, true);
        break;
      }
      case 'emitCaretColorUndefined': {
        if (!(await this.waitAction('emitCaretColorUndefined'))) {
          Utils.emitEvent(false, 187130);
          break;
        }
        this.activeColor = undefined;
        await this.emitAfterApply(187130, true);
        break;
      }
      case 'emitCaretColorReturn': {
        if (!(await this.waitAction('emitCaretColorReturn'))) {
          Utils.emitEvent(false, 187140);
          break;
        }
        this.activeColor = '#FF00AA00';
        await this.emitAfterApply(187140, true);
        break;
      }
      case 'emitCaretColorError': {
        if (!(await this.waitAction('emitCaretColorError'))) {
          Utils.emitEvent(-1, 187150);
          break;
        }
        this.activeColor = '#00000000';
        await this.emitAfterApply(187150, 0);
        break;
      }
      default:
        break;
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('WebCaretColorButton').onClick((e: ClickEvent) => {
          this.handleClick();
        })
      }
      Web({ src: $rawfile('caretColor.html'), controller: this.controller })
        .caretColor(this.activeColor)
        .width('100%')
        .height('80%')
        .javaScriptAccess(true)
        .fileAccess(true)
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }.width('100%').height('100%')
  }
}
