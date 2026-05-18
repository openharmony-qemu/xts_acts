'use static'
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, AISessionEvent, AISessionType, AISessionResultType, OnAISessionCallback } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'

@Entry
@Component
struct WebViewAISessionType {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = '';
  @State callbackResult: string = '';
  @State hasAiSessions: boolean = false;

  promptSession: AISessionEvent = {
    aiSessionType: AISessionType.PROMPT,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      result(AISessionResultType.SUCCESS, 'onCreateAISession');
      this.callbackResult = 'onCreateAISession';
      return true;
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      result(AISessionResultType.RUNNING, 'onExecuteAIAction');
      this.callbackResult = 'onExecuteAIAction';
    },
    onDestroyAISession: (id: string): void => {
      this.callbackResult = 'onDestroyAISession';
    }
  };

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        this.str = String(data['ACTION']);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewAISessionType click')
          .key('WebViewAISessionTypeButton')
          .onClick((e: ClickEvent) => {
            switch (this.str) {
              case 'testAiSessionOptionsStatic00': {
                this.hasAiSessions = true;
                Utils.emitEvent(this.hasAiSessions, 2026060100)
                break;
              }
              case 'testAiSessionTypeStatic01': {
                Utils.emitEvent(AISessionType.LANGUAGE_DETECTOR, 2026060101)
                break;
              }
              case 'testAiSessionTypeStatic02': {
                Utils.emitEvent(AISessionType.SUMMARIZER, 2026060102)
                break;
              }
              case 'testAiSessionTypeStatic03': {
                Utils.emitEvent(AISessionType.WRITER, 2026060103)
                break;
              }
              case 'testAiSessionTypeStatic04': {
                Utils.emitEvent(AISessionType.REWRITER, 2026060104)
                break;
              }
              case 'testAiSessionTypeStatic05': {
                Utils.emitEvent(AISessionType.PROMPT, 2026060105)
                break;
              }
              case 'testAiSessionTypeStatic06': {
                Utils.emitEvent(AISessionType.PROOFREADER, 2026060106)
                break;
              }
              case 'testAiSessionResultTypeStatic07': {
                Utils.emitEvent(AISessionResultType.SUCCESS, 2026060107)
                break;
              }
              case 'testAiSessionResultTypeStatic08': {
                Utils.emitEvent(AISessionResultType.FAILURE, 2026060108)
                break;
              }
              case 'testAiSessionResultTypeStatic09': {
                Utils.emitEvent(AISessionResultType.RUNNING, 2026060109)
                break;
              }
              case 'testAiSessionEventStatic10': {
                Utils.emitEvent(this.promptSession.aiSessionType == AISessionType.PROMPT, 2026060110)
                break;
              }
              case 'testAiSessionEventStatic11': {
                let ret = this.promptSession.onCreateAISession?.('1', 'p', (state: AISessionResultType, content: string) => {});
                Utils.emitEvent(ret === true && this.callbackResult == 'onCreateAISession', 2026060111)
                break;
              }
              case 'testAiSessionEventStatic12': {
                this.promptSession.onExecuteAIAction?.('1', 'p', (state: AISessionResultType, content: string) => {});
                Utils.emitEvent(this.callbackResult == 'onExecuteAIAction', 2026060112)
                break;
              }
              case 'testAiSessionEventStatic13': {
                this.promptSession.onDestroyAISession?.('1');
                Utils.emitEvent(this.callbackResult == 'onDestroyAISession', 2026060113)
                break;
              }
              default:
                break;
            }
          })
      }
      Web({ src: 'https://www.baidu.com', controller: this.controller })
        .aiSessionOptions(this.hasAiSessions ? [this.promptSession] : undefined)
        .javaScriptAccess(true)
    }.width('100%').height('100%')
  }
}
