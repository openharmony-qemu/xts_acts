/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Builder, Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { State } from "@ohos.arkui.stateManagement";
import { BusinessError } from '@ohos.base'
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import util from '@ohos.util';
import { UIContext } from '@ohos.arkui.UIContext';
import { Hypium } from '../../../hypium';
import image from '@ohos.multimedia.image';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewControllerPart2 {
  stringObj: StringFields = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelectorParamGetGetAcceptType: Array<String> = new Array<String>()
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<String> = new Array<String>()
  @State enterPageEnd: boolean = false
  @State numberOfMatches: number = 0
  @State searchNext: boolean = false
  no_error: string = "no error happened"

  aboutToAppear() {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("Finish aboutToAppear " + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerPart2 click").key('WebViewControllerPart2Button').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {

            case "testBackOrForward002": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html");
                this.controller.loadUrl("resource://rawfile/second.html");
                this.controller.backOrForward(-1)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37006)
              } catch (error) {
                hilog.info(0X0000, "testTag", `ErrorCode: ` + error);
              }
              break;
            }

            case "testBackOrForward003": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html");
                this.controller.backOrForward(-3)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37007)
              } catch (error) {
                hilog.info(0X0000, "testTag", `ErrorCode: ` + error);
              }
              break;
            }

            case "testBackOrForward004": {
              try {
                this.controller.clearHistory()
                this.controller.loadUrl("resource://rawfile/index.html");
                this.controller.backOrForward(3)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37008)
              } catch (error) {
                hilog.info(0X0000, "testTag", `ErrorCode: ` + error);
              }
              break;
            }
          }
        })
      }

      Web({
        src: 'resource://rawfile/index.html',
        controller: this.controller
      }).javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .key("onShowFileSelectorKey")
    }
  }
}
