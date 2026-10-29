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

import { Entry, Component, Column, Row, Button, Web, ClickEvent, Color } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData, BusinessError } from '@ohos.base';

const KIND_STRING: int = 1;
const KIND_ENUM: int = 2;
const KIND_UNDEFINED: int = 4;
const KIND_RETURN: int = 5;
const KIND_ERROR: int = 6;

@Entry
@Component
struct WebCaretColor {
  @State str: string = '';
  @State isPageEnd: int = -1;
  @State kind: int = KIND_STRING;
  @State webToken: int = 0;
  @State showWeb: boolean = true;

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

  private async remount(next: int): Promise<void> {
    this.showWeb = false;
    this.isPageEnd = -1;
    await Utils.msSleep(200);
    this.kind = next;
    this.webToken = this.webToken + 1;
    this.showWeb = true;
  }

  private async applyKind(next: int, eventId: int): Promise<void> {
    try {
      await this.remount(next);
      let ready: boolean = await this.waitPage();
      Utils.emitEvent(ready, eventId);
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error(`ErrorCode: ${err.code}, Message: ${err.message}`);
      Utils.emitEvent(false, eventId);
    }
  }

  private async applyError(eventId: int): Promise<void> {
    try {
      await this.remount(KIND_ERROR);
      let ready: boolean = await this.waitPage();
      if (ready) {
        Utils.emitEvent(0, eventId);
      } else {
        Utils.emitEvent(-1, eventId);
      }
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error(`ErrorCode: ${err.code}, Message: ${err.message}`);
      Utils.emitEvent(err.code, eventId);
    }
  }

  private async handleClick(): Promise<void> {
    switch (this.str) {
      case 'emitCaretColorString':
        await this.applyKind(KIND_STRING, 187110);
        break;
      case 'emitCaretColorEnum':
        await this.applyKind(KIND_ENUM, 187120);
        break;
      case 'emitCaretColorUndefined':
        await this.applyKind(KIND_UNDEFINED, 187130);
        break;
      case 'emitCaretColorReturn':
        await this.applyKind(KIND_RETURN, 187140);
        break;
      case 'emitCaretColorError':
        await this.applyError(187150);
        break;
      default:
        break;
    }
  }

  @Builder
  WebColored(color: string): void {
    Web({ src: 'resource://rawfile/caretColor.html', controller: new web_webview.WebviewController(undefined) })
      .caretColor(color)
      .width('100%')
      .height('80%')
      .key('WebCaretColorWeb' + this.webToken)
      .javaScriptAccess(true)
      .onPageEnd(() => {
        this.isPageEnd = 1;
      })
  }

  @Builder
  WebEnum(): void {
    Web({ src: 'resource://rawfile/caretColor.html', controller: new web_webview.WebviewController(undefined) })
      .caretColor(Color.Blue)
      .width('100%')
      .height('80%')
      .key('WebCaretColorWeb' + this.webToken)
      .javaScriptAccess(true)
      .onPageEnd(() => {
        this.isPageEnd = 1;
      })
  }

  @Builder
  WebUndefined(): void {
    Web({ src: 'resource://rawfile/caretColor.html', controller: new web_webview.WebviewController(undefined) })
      .caretColor(undefined)
      .width('100%')
      .height('80%')
      .key('WebCaretColorWeb' + this.webToken)
      .javaScriptAccess(true)
      .onPageEnd(() => {
        this.isPageEnd = 1;
      })
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('WebCaretColorButton').onClick((e: ClickEvent) => {
          this.handleClick();
        })
      }
      if (this.showWeb && this.kind === KIND_ENUM) {
        this.WebEnum()
      } else if (this.showWeb && this.kind === KIND_UNDEFINED) {
        this.WebUndefined()
      } else if (this.showWeb && this.kind === KIND_RETURN) {
        this.WebColored('#FF00AA00')
      } else if (this.showWeb && this.kind === KIND_ERROR) {
        this.WebColored('#00000000')
      } else if (this.showWeb) {
        this.WebColored('#FFFF0000')
      }
    }.width('100%').height('100%')
  }
}
