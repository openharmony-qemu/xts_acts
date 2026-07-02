'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Callback, RecordData } from '@ohos.base';
import { Entry, Column, Component, Button, ClickEvent, Row } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { Web } from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test.ets';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebEnableFullscreenVideoOverlay {
  stringObj: StringFields = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State enableOverlay: boolean | undefined = true;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isPageEnd: number = -1;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web test').key('EnableFullscreenVideoOverlayTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitEnableFullscreenVideoOverlayTrue': {
              try {
                this.enableOverlay = true;
                this.isPageEnd = -1;
                this.controller.refresh();
                setTimeout(() => {
                  Utils.emitEvent('success', 20260601)
                }, 3000);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('fail', 20260601)
              }
              break;
            }
            case 'emitEnableFullscreenVideoOverlayFalse': {
              try {
                this.enableOverlay = false;
                this.isPageEnd = -1;
                this.controller.refresh();
                setTimeout(() => {
                  Utils.emitEvent('success', 20260602)
                }, 3000);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('fail', 20260602)
              }
              break;
            }
            case 'emitEnableFullscreenVideoOverlayUndefined': {
              try {
                this.enableOverlay = undefined;
                this.isPageEnd = -1;
                this.controller.refresh();
                setTimeout(() => {
                  Utils.emitEvent('success', 20260603)
                }, 3000);
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('fail', 20260603)
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/videoTest1.html', controller: this.controller })
        .key('EnableFullscreenVideoOverlayTestWeb')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .enableFullscreenVideoOverlay(this.enableOverlay)
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }
  }
}
