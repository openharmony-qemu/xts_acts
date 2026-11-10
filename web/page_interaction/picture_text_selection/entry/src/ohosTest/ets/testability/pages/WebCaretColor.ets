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

@Entry
@Component
struct WebCaretColor {
  private controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State private activeColor: ResourceColor | undefined | null = '#FFFF0000';
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

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

  private async waitPage(): Promise<boolean> {
    try {
      await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 300, 30);
      return this.isPageEnd === 1;
    } catch (error) {
      return false;
    }
  }

  private async emitAfterApply(eventId: number, result: string | number | boolean): Promise<void> {
    try {
      let ready = await this.waitPage();
      if (!ready && eventId !== 187060) {
        Utils.emitEvent(false, eventId);
        return;
      }
      Utils.emitEvent(result, eventId);
    } catch (error) {
      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
      Utils.emitEvent(false, eventId);
    }
  }

  private async onButtonClick(): Promise<void> {
    console.info('key==>' + this.str);
    await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 200, 15);
    this.isReceive = -1;
    switch (this.str) {
      case 'emitCaretColorString':
        this.activeColor = '#FFFF0000';
        await this.emitAfterApply(187010, true);
        break;
      case 'emitCaretColorEnum':
        this.activeColor = Color.Blue;
        await this.emitAfterApply(187020, true);
        break;
      case 'emitCaretColorNull':
        this.activeColor = null;
        await this.emitAfterApply(187030, true);
        break;
      case 'emitCaretColorUndefined':
        this.activeColor = undefined;
        await this.emitAfterApply(187040, true);
        break;
      case 'emitCaretColorReturn':
        this.activeColor = '#FF00AA00';
        await this.emitAfterApply(187050, true);
        break;
      case 'emitCaretColorError':
        this.activeColor = '#00000000';
        await this.emitAfterApply(187060, 0);
        break;
      default:
        break;
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('WebCaretColorButton').onClick(async () => {
          await this.onButtonClick();
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
    }
    .width('100%')
    .height('100%')
  }
}
