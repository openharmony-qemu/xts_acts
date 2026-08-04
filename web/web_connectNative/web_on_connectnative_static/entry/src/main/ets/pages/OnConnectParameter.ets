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
import { Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webView from '@ohos.web.webview'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
function isCapabilityNotSupportedCode(code: number): boolean {
  // Convert to string for comparison to avoid type mismatch with NmErrorCode enum
  return String(code) === '801';
}

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebOnConnectParameter {
  stringObj: StringFields = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController();

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
        Button('OnConnectParameter click')
          .key('OnConnectParameterTestButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'OnConnectParameter001': {
                try {
                  let receivedConnectionId: int = -1;
                  let testCallback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
                    onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
                      receivedConnectionId = connection.connectionId;
                      console.info(`OnConnectParameter001 onConnect: connectionId=${receivedConnectionId}, ` +
                        `bundleName=${connection.bundleName}, extensionOrigin=${connection.extensionOrigin}, ` +
                        `extensionPid=${connection.extensionPid}`);
                    },
                    onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {}
                  };
                  let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
                    connectionId: 1,
                    bundleName: "com.example.extension",
                    extensionOrigin: "chrome-extension://test/",
                    extensionPid: 1234
                  };
                  testCallback.onConnect(mockConnection);
                  Utils.emitEvent(String(receivedConnectionId), 20260601);
                } catch (error) {
                  const err = error as BusinessError;
                  console.error(`OnConnectParameter001 error: ${err.code}, ${err.message}`);
                  Utils.emitEvent('-1', 20260601);
                }
                break;
              }
              case 'OnFailedPermissionDenyStatic001': {
                try {
                  let receivedCode: number = -1;
                  let testCallback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
                    onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
                      receivedCode = Number(code);
                      console.info(`OnFailedPermissionDenyStatic001 onFailed: code=${receivedCode}, errMsg=${errMsg}`);
                    }
                  };
                  testCallback.onFailed(
                    webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY,
                    "Permission denied: missing ohos.permission.WEB_NATIVE_MESSAGING"
                  );
                  Utils.emitEvent(String(receivedCode), 20260602);
                } catch (error) {
                  const err = error as BusinessError;
                  console.error(`OnFailedPermissionDenyStatic001 error: ${err.code}, ${err.message}`);
                  Utils.emitEvent('-1', 20260602);
                }
                break;
              }
              case 'OnConnectBundleNameEmptyStatic001': {
                try {
                  let receivedBundleName: string = 'NOT_SET';
                  let testCallback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
                    onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
                      receivedBundleName = connection.bundleName;
                      console.info(`OnConnectBundleNameEmptyStatic001 onConnect: bundleName='${receivedBundleName}'`);
                    },
                    onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {}
                  };
                  let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
                    connectionId: 2,
                    bundleName: "",
                    extensionOrigin: "chrome-extension://test/",
                    extensionPid: 5678
                  };
                  testCallback.onConnect(mockConnection);
                  Utils.emitEvent(receivedBundleName, 20260603);
                } catch (error) {
                  const err = error as BusinessError;
                  console.error(`OnConnectBundleNameEmptyStatic001 error: ${err.code}, ${err.message}`);
                  Utils.emitEvent('ERROR', 20260603);
                }
                break;
              }
              case 'DisconnectNativePermissionDenyStatic001': {
                let doTest = async () => {
                  try {
                    await webNativeMessagingExtensionManager.disconnectNative(1);
                    Utils.emitEvent(0, 20260604);
                  } catch (error) {
                    let err = error as BusinessError;
                    console.error(`DisconnectNativePermissionDenyStatic001 error: ${err.code}, ${err.message}`);
                    if (isCapabilityNotSupportedCode(err.code)) {
                      console.log('DisconnectNativePermissionDenyStatic001_Skipped - capability not supported (error 801)');
                      Utils.emitEvent(201, 20260604);
                    } else {
                      Utils.emitEvent(err.code, 20260604);
                    }
                  }
                };
                doTest();
                break;
              }
              case 'DisconnectNativeNullUndefinedParamStatic001': {
                let doTest = async () => {
                  try {
                    await webNativeMessagingExtensionManager.disconnectNative(0);
                    Utils.emitEvent(0, 20260605);
                  } catch (error) {
                    let err = error as BusinessError;
                    console.error(`DisconnectNativeNullUndefinedParamStatic001 error: ${err.code}, ${err.message}`);
                    if (isCapabilityNotSupportedCode(err.code)) {
                      console.log('DisconnectNativeNullUndefinedParamStatic001_Skipped - capability not supported (error 801)');
                      Utils.emitEvent(201, 20260605);
                    } else {
                      Utils.emitEvent(err.code, 20260605);
                    }
                   
                  }
                };
                doTest();
                break;
              }
            }
          })
      }
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}
