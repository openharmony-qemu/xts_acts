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
import {
  WebResourceResponse,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerNull: webView.WebviewController = new webView.WebviewController(undefined);
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State name: string = 'objName';
  @State steps: number = 1;
  @State step: number = -2;
  @State factor: number = 1;
  @State errorCode: string = '0';

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info(':web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string , object>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string , object>)?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebErrorCode click').key('ErrorCodeTestSuiteButton').onClick((event: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {

            case 'emitZoomIn': {
              try {
                this.controllerNull.zoomIn();
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1012)
              }
              break;
            }

            case 'emitZoomIn2': {
              try {
                this.controller.zoomIn();
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1013)
              }
              break;
            }

            case 'emitZoomOut': {
              try {
                this.controllerNull.zoomOut();
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1028)
              }
              break;
            }

            case 'emitZoomOut2': {
              try {
                this.controller.zoomOut();
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1065)
              }
              break;
            }

            case 'emitSlideScroll': {
              try {
                this.controllerNull.slideScroll(500, 500);
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1033)
              }
              break;
            }

            case 'emitScrollBy': {
              try {
                this.controllerNull.scrollBy(50, 50);
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1034)
              }
              break;
            }

            case 'emitZoom': {
              try {
                this.controllerNull.zoom(this.factor);
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1049)
              }
              break;
            }

            case 'emitZoom2': {
              try {
                this.controller.zoom(1);
              } catch (error: BusinessError) {
                Utils.emitEvent(error.code, 1050)
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewControllerErrorCode' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .zoomAccess(false)
    }
  }
}
