'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, RenderMode } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base';
import router from '@ohos.router';
import web_webview from '@ohos.web.webview';
import { UIContext, Router } from '@ohos.arkui.UIContext';


export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewWebConstructor {
  stringObj: StringFields = new StringFields();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerAsync: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerSync: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerEmulateFalse: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerUndefined: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerNull: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;

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
        Button('webConstructorTest').key('webViewWebConstructor').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitRenderModeAsync': {
              try {
                this.controllerAsync.loadUrl('resource://rawfile/index.html');
                Utils.emitEvent('renderModeAsync', 1701)
              } catch (error) {
                console.error(`emitRenderModeAsync ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 1701)
              }
              break;
            }
            case 'emitRenderModeSync': {
              try {
                this.controllerSync.loadUrl('resource://rawfile/index.html');
                Utils.emitEvent('renderModeSync', 1702)
              } catch (error) {
                console.error(`emitRenderModeSync ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 1702)
              }
              break;
            }
            case 'emitEmulateTouchFromMouseEventFalse': {
              try {
                this.controllerEmulateFalse.loadUrl('resource://rawfile/index.html');
                Utils.emitEvent('emulateTouchFromMouseEventFalse', 1703)
              } catch (error) {
                console.error(`emitEmulateTouchFromMouseEventFalse ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 1703)
              }
              break;
            }
            case 'emitRenderModeUndefined': {
              try {
                this.controllerUndefined.loadUrl('resource://rawfile/index.html');
                Utils.emitEvent('renderModeUndefined', 1704)
              } catch (error) {
                console.error(`emitRenderModeUndefined ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 1704)
              }
              break;
            }
            case 'emitEmulateTouchNull': {
              try {
                this.controllerNull.loadUrl('resource://rawfile/index.html');
                Utils.emitEvent('emulateTouchNull', 1705)
              } catch (error) {
                console.error(`emitEmulateTouchNull ErrorCode: ${error.code}`);
                Utils.emitEvent(error.code, 1705)
              }
              break;
            }

            case 'emitOnSwitchNextPage04': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebViewTextSelection' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller, renderMode: RenderMode.ASYNC_RENDER })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)

      Web({ src: 'resource://rawfile/index.html', controller: this.controllerSync, renderMode: RenderMode.SYNC_RENDER })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)

      Web({ src: 'resource://rawfile/index.html', controller: this.controllerEmulateFalse, emulateTouchFromMouseEvent: false })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)

      Web({ src: 'resource://rawfile/index.html', controller: this.controllerUndefined })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)

      Web({ src: 'resource://rawfile/index.html', controller: this.controllerNull })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)


      Web({ src: 'resource://rawfile/index.html', controller: this.controllerAsync })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}