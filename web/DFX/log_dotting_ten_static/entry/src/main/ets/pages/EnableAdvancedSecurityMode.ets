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

import { Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct EnableAdvancedSecurityMode {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);

  aboutToAppear() {
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
        Button('EnableAdvancedSecurityMode').key('EnableAdvancedSecurityModeButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitEnableAdvancedSecurityMode001': {
              try {
                const params: webview.SecurityParams = { disableJITCompilation: true };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210001);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode001 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210001);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode002': {
              try {
                const params: webview.SecurityParams = { disableJITCompilation: false };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210002);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode002 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210002);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode003': {
              try {
                const params: webview.SecurityParams = { disableWebAssembly: true };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210003);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode003 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210003);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode004': {
              try {
                const params: webview.SecurityParams = { disableWebAssembly: false };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210004);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode004 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210004);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode005': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({ disableWebGL: true } as webview.SecurityParams);
                Utils.emitEvent(true, 210005);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode005 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210005);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode006': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({ disableWebGL: false } as webview.SecurityParams);
                Utils.emitEvent(true, 210006);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode006 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210006);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode007': {
              try {
                const params: webview.SecurityParams = { disablePDFViewer: true };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210007);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode007 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210007);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode008': {
              try {
                const params: webview.SecurityParams = { disablePDFViewer: false };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210008);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode008 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210008);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode009': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({ disableMathML: true } as webview.SecurityParams);
                Utils.emitEvent(true, 210009);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode009 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210009);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode010': {
              try {
                const params: webview.SecurityParams = { disableMathML: false };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210010);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode010 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210010);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode011': {
              try {
                const params: webview.SecurityParams = { disableServiceWorker: true };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210011);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode011 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210011);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode012': {
              try {
                const params: webview.SecurityParams = { disableServiceWorker: false };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210012);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode012 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210012);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode013': {
              try {
                const params: webview.SecurityParams = { disableNonProxyUDP: true };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210013);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode013 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210013);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode014': {
              try {
                const params: webview.SecurityParams = { disableNonProxyUDP: false };
                webview.WebviewController.enableAdvancedSecurityMode(params);
                Utils.emitEvent(true, 210014);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode014 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210014);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode015': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: true, disableWebAssembly: true, disableWebGL: true,
                  disablePDFViewer: true, disableMathML: true, disableServiceWorker: true, disableNonProxyUDP: true
                } as webview.SecurityParams);
                Utils.emitEvent(true, 210015);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode015 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210015);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode016': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: false, disableWebAssembly: false, disableWebGL: false,
                  disablePDFViewer: false, disableMathML: false, disableServiceWorker: false, disableNonProxyUDP: false
                } as webview.SecurityParams);
                Utils.emitEvent(true, 210016);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode016 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210016);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode017': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: true, disableWebAssembly: true, disableWebGL: true,
                  disablePDFViewer: false, disableMathML: false, disableServiceWorker: false, disableNonProxyUDP: false
                } as webview.SecurityParams);
                Utils.emitEvent(true, 210017);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode017 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210017);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode018': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: false, disableWebAssembly: false, disableWebGL: false,
                  disablePDFViewer: true, disableMathML: true, disableServiceWorker: true, disableNonProxyUDP: true
                } as webview.SecurityParams);
                Utils.emitEvent(true, 210018);
              } catch (error) {
                error = error as BusinessError;
                console.error('emitEnableAdvancedSecurityMode018 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210018);
              }
              break;
            }
            default:
              break;
          }
        })
      }
      Web({ src: 'about:blank', controller: this.controller })
        .width('100%')
        .height('50%')
    }
    .width('100%')
    .height('100%')
  }
}
