'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import { Driver } from '@ohos.UiTest';
import Utils from '../../src/test/Util.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import {
  $rawfile,
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Web
} from '@ohos.arkui.component'

@Entry
@Component
struct WebViewSetScrollbarModeParamTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Button("SetScrollbarModeParamTest click")
        .key('SetScrollbarModeParamTestButton')
        .onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {

            // case "testSetScrollbarModeParamNull001": {
            //   try {
            //     webView.WebviewController.setScrollbarMode(null);
            //     Utils.emitEvent('no error', 202608261)
            //   } catch (error) {
            //     console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
            //     Utils.emitEvent(String(error.code), 202608261)
            //   }
            //   break;
            // }

            // case "testSetScrollbarModeParamUndefined001": {
            //   try {
            //     webView.WebviewController.setScrollbarMode(undefined);
            //     Utils.emitEvent('no error', 202608262)
            //   } catch (error) {
            //     console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
            //     Utils.emitEvent(String(error.code), 202608262)
            //   }
            //   break;
            // }

            case "testSetScrollbarModeParamInvalidEnum001": {
              try {
                webView.WebviewController.setScrollbarMode(3 as webView.ScrollbarMode);
                Utils.emitEvent('no error', 202608263)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202608263)
              }
              break;
            }

            case "testSetScrollbarModeParamInvalidEnum002": {
              try {
                webView.WebviewController.setScrollbarMode(-1 as webView.ScrollbarMode);
                Utils.emitEvent('no error', 202608264)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202608264)
              }
              break;
            }



          }
        })

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .width('100%')
        .height('100%')
    }
    .key('SetScrollbarModeParamTestColumn')
  }
}
