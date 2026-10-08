'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import webView from '@ohos.web.webview';
import { Entry, Component, Column, Row, Button, ClickEvent, Web, EmbedOptions } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';

interface EmbedOptionsCoverage extends EmbedOptions {
  supportTransformRotateAndSkew?: boolean;
}

@Entry
@Component
struct WebNativeEmbedOptionsCoverage {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  embedOptions: EmbedOptionsCoverage | undefined = { supportCssDisplayChange: true } as EmbedOptionsCoverage
  @State isPageEnd: number = -1;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null && (eventData.data as Record<string, RecordData>)?.['ACTION'] != null) {
      this.str = '' + (eventData.data as Record<string, RecordData>)?.['ACTION'];
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebNativeEmbedOptionsCoverage').key('WebNativeEmbedOptionsCoverageButton').onClick((e: ClickEvent) => {
          switch (this.str) {
            case 'testNativeEmbedOptionsCssDisplayFalse': {
              this.embedOptions = { supportCssDisplayChange: false } as EmbedOptionsCoverage;
              this.isPageEnd = -1;
              this.controller.refresh();
              Utils.emitEvent('success', 37101);
              break;
            }
            case 'testNativeEmbedOptionsTransformSkewTrue': {
              this.embedOptions = { supportTransformRotateAndSkew: true } as EmbedOptionsCoverage;
              this.isPageEnd = -1;
              this.controller.refresh();
              Utils.emitEvent('success', 37102);
              break;
            }
            case 'testNativeEmbedOptionsTransformSkewFalse': {
              this.embedOptions = { supportTransformRotateAndSkew: false } as EmbedOptionsCoverage;
              this.isPageEnd = -1;
              this.controller.refresh();
              Utils.emitEvent('success', 37103);
              break;
            }
            case 'testNativeEmbedOptionsUndefined': {
              this.embedOptions = undefined;
              this.isPageEnd = -1;
              this.controller.refresh();
              Utils.emitEvent('success', 37105);
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .enableNativeEmbedMode(true)
        .nativeEmbedOptions(this.embedOptions)
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
        .height('80%')

      Web({ src: 'resource://rawfile/index.html', controller: new webView.WebviewController(undefined) })
        .nativeEmbedOptions()
        .height(1)
        .width(1)
      Web({ src: 'resource://rawfile/index.html', controller: new webView.WebviewController(undefined) })
        .nativeEmbedOptions(undefined)
        .height(1)
        .width(1)
    }
  }
}
