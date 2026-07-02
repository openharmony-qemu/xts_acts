'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  Button,
  ClickEvent,
  Column,
  Row,
  Entry,
  Component,
  ScrollDirectionalLockType,
  ScrollbarLayoutPolicy,
  Web,
  WebKeyboardAppearanceMode,
  AISessionEvent,
  AISessionResultType,
  AISessionType,
  OnAISessionCallback
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct WebAttributeTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'emitWebKeyboardAppearanceModeNone001';
  @State enableDragValue: boolean = true;
  @State scrollBarPolicy: ScrollbarLayoutPolicy = ScrollbarLayoutPolicy.CONTENT;
  @State lockEnabled: boolean = true;
  @State lockType: ScrollDirectionalLockType = ScrollDirectionalLockType.ALL;
  @State keyboardMode: WebKeyboardAppearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
  @State aiSessions: Array<AISessionEvent> | undefined = undefined;
  @State isPageEnd: number = -1;
  private aiSessionEvent: AISessionEvent = {
    aiSessionType: AISessionType.PROMPT,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 2026051110);
      result(AISessionResultType.SUCCESS, 'ok');
      return true;
    },
    onExecuteAIAction: (): void => {
    },
    onDestroyAISession: (): void => {
    }
  };

  aboutToAppear() {
    console.info('WebAttributeTest aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  aboutToDisappear() {
    emitter.off(10)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('WebAttributeTest page valueChangeCallBack');
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
        Button('web click').key('webAttributeButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitWebKeyboardAppearanceModeNone001': {
              this.keyboardMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
              Utils.emitEvent(true, 2026051101);
              break;
            }
            case 'emitWebKeyboardAppearanceModeImmersive002': {
              this.keyboardMode = WebKeyboardAppearanceMode.IMMERSIVE;
              Utils.emitEvent(true, 2026051102);
              break;
            }
            case 'emitWebKeyboardAppearanceModeLight003': {
              this.keyboardMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
              Utils.emitEvent(true, 2026051103);
              break;
            }
            case 'emitWebKeyboardAppearanceModeDark004': {
              this.keyboardMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
              Utils.emitEvent(true, 2026051104);
              break;
            }
            case 'emitEnableDrag005': {
              this.enableDragValue = false;
              Utils.emitEvent(true, 2026051105);
              break;
            }
            case 'emitScrollbarLayoutPolicy006': {
              this.scrollBarPolicy = ScrollbarLayoutPolicy.SYSTEM;
              Utils.emitEvent(true, 2026051106);
              break;
            }
            case 'emitEnableScrollDirectionalLock007': {
              this.lockEnabled = false;
              this.lockType = ScrollDirectionalLockType.NESTED_SCROLL;
              Utils.emitEvent(true, 2026051107);
              break;
            }
            case 'emitAiSessionOptions008': {
              this.aiSessions = [this.aiSessionEvent];
              Utils.emitEvent(true, 2026051108);
              break;
            }
            case 'emitOnInputmethodAttached009': {
              Utils.emitEvent(true, 2026051109);
              break;
            }
            case 'emitKeyboardAppearanceSwitch010': {
              this.keyboardMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
              this.keyboardMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
              Utils.emitEvent(true, 2026051111);
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: 'resource://rawfile/webAttributeTest.html', controller: this.controller })
        .key('webAttributeWeb')
        .enableDrag(this.enableDragValue)
        .scrollbarLayoutPolicy(this.scrollBarPolicy)
        .enableScrollDirectionalLock(this.lockEnabled, this.lockType)
        .aiSessionOptions(this.aiSessions)
        .keyboardAppearance(this.keyboardMode)
        .onInputmethodAttached(() => {
          if (this.str === 'emitOnInputmethodAttached009') {
            Utils.emitEvent(true, 2026051109);
          }
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
        .height('95%')
    }.width('100%').height('100%')
  }
}
