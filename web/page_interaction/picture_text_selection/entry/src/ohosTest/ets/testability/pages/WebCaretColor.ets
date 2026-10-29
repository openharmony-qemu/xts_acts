/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_SUITE_KEY = 187001;
const KIND_STRING: number = 1;
const KIND_ENUM: number = 2;
const KIND_NULL: number = 3;
const KIND_UNDEFINED: number = 4;
const KIND_RETURN: number = 5;
const KIND_ERROR: number = 6;

@Entry
@Component
struct WebCaretColor {
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State kind: number = KIND_STRING;
  @State webToken: number = 0;
  @State showWeb: boolean = true;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data?.ACTION != null) {
      this.str = eventData.data?.ACTION;
      this.isReceive = 1;
    }
  }

  private async remount(next: number): Promise<void> {
    this.showWeb = false;
    this.isPageEnd = -1;
    await Utils.sleep(200);
    this.kind = next;
    this.webToken = this.webToken + 1;
    this.showWeb = true;
  }

  private async applyKind(next: number, eventId: number): Promise<void> {
    try {
      await this.remount(next);
      await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 300, 30);
      Utils.emitEvent(this.isPageEnd === 1, eventId);
    } catch (error) {
      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
      Utils.emitEvent(false, eventId);
    }
  }

  private async applyError(eventId: number): Promise<void> {
    try {
      await this.remount(KIND_ERROR);
      await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 300, 30);
      if (this.isPageEnd === 1) {
        Utils.emitEvent(0, eventId);
      } else {
        Utils.emitEvent(-1, eventId);
      }
    } catch (error) {
      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
      Utils.emitEvent(error.code, eventId);
    }
  }

  private async onButtonClick(): Promise<void> {
    console.info('key==>' + this.str);
    await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 200, 15);
    switch (this.str) {
      case 'emitCaretColorString':
        await this.applyKind(KIND_STRING, 187010);
        break;
      case 'emitCaretColorEnum':
        await this.applyKind(KIND_ENUM, 187020);
        break;
      case 'emitCaretColorNull':
        await this.applyKind(KIND_NULL, 187030);
        break;
      case 'emitCaretColorUndefined':
        await this.applyKind(KIND_UNDEFINED, 187040);
        break;
      case 'emitCaretColorReturn':
        await this.applyKind(KIND_RETURN, 187050);
        break;
      case 'emitCaretColorError':
        await this.applyError(187060);
        break;
      default:
        break;
    }
  }

  @Builder
  WebString(color: ResourceColor) {
    Web({ src: $rawfile('caretColor.html'), controller: new web_webview.WebviewController() })
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
  WebNull() {
    Web({ src: $rawfile('caretColor.html'), controller: new web_webview.WebviewController() })
      .caretColor(null)
      .width('100%')
      .height('80%')
      .key('WebCaretColorWeb' + this.webToken)
      .javaScriptAccess(true)
      .onPageEnd(() => {
        this.isPageEnd = 1;
      })
  }

  @Builder
  WebUndefined() {
    Web({ src: $rawfile('caretColor.html'), controller: new web_webview.WebviewController() })
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
        Button('web click').key('WebCaretColorButton').onClick(async () => {
          await this.onButtonClick();
        })
      }
      if (this.showWeb && this.kind === KIND_NULL) {
        this.WebNull()
      } else if (this.showWeb && this.kind === KIND_UNDEFINED) {
        this.WebUndefined()
      } else if (this.showWeb && this.kind === KIND_ENUM) {
        this.WebString(Color.Blue)
      } else if (this.showWeb && this.kind === KIND_RETURN) {
        this.WebString('#FF00AA00')
      } else if (this.showWeb && this.kind === KIND_ERROR) {
        this.WebString('#00000000')
      } else if (this.showWeb) {
        this.WebString('#FFFF0000')
      }
    }
    .width('100%')
    .height('100%')
  }
}
