/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  OnConsoleEvent,Color,Builder, OnPermissionRequestEvent,NativeEmbedDataInfo, PermissionRequest,
  OnTitleReceiveEvent,
  OnDataResubmittedEvent,
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces';
import { Callback } from '@ohos.base'
import { Callback, RecordData } from '@ohos.base'
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
class StringFields {
  private str: string = '';
}
@Entry
@Component
struct WebOnDataResubmitted {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isPrivacy: boolean = false;
  @State geolocationAccess: boolean = true;
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
        Button('web click')
          .key('webViewIncognitoModeButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitWebViewIncognitoMode01': {
                try {
                  this.controller.loadUrl('https://m.weibo.cn');
                  setTimeout(() => {
                    let result = this.controller.isIncognitoMode();
                    if (result === true) {
                      Utils.emitEvent('success', 8019);
                    } else {
                      Utils.emitEvent('fail', 8019);
                    }
                  }, 2000)

                } catch (error) {
                  hilog.info(0X0000,"testTag",`ErrorCode: ` + error );
                }
                break;
              }
            }
          })
      }
        Web({ src: 'www.baidu.com', controller: this.controller, incognitoMode: true })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
    }
  }
}

