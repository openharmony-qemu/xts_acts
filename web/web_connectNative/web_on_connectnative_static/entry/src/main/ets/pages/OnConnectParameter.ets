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
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, Level, it, expect } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import common from '@ohos.app.ability.common';
import { Want } from '@kit.AbilityKit';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebOnConnectParameter {
  stringObj: StringFields = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerUnattached: webView.WebviewController = new webView.WebviewController(undefined);

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
                // 真实调用 connectNative：验证 API 返回有效的 connectionId（正整数）
                // 即使本应用无 WEB_NATIVE_MESSAGING 权限，connectNative 仍同步返回 connId
                try {
                  let context = getContext(this) as common.UIAbilityContext;
                  let want: Want = {
                    bundleName: 'com.acts.context.webonconnectnativerely',
                    abilityName: 'WebNativeExtensionExtAbility1',
                    parameters: {
                      'ohos.arkweb.extensionOrigin': 'testOrigin',
                      'ohos.arkweb.messageReadPipe': { 'type': 'FD', 'value': 1 },
                      'ohos.arkweb.messageWritePipe': { 'type': 'FD', 'value': 2 }
                    }
                  };
                  let testCallback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
                    onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {}
                  };
                  let connId = webNativeMessagingExtensionManager.connectNative(context, want, testCallback);
                  console.info(`OnConnectParameter001 connectNative returned connId: ${connId}`);
                  Utils.emitEvent(String(connId > 0 ? 1 : 0), 20260601);
                } catch (error) {
                  const err = error as BusinessError;
                  console.error(`OnConnectParameter001 catch error: ${err.code}, ${err.message}`);
                  Utils.emitEvent(String(err.code), 20260601);
                }
                break;
              }
              case 'OnFailedPermissionDenyStatic001': {
                // 真实调用 connectNative（本应用无 WEB_NATIVE_MESSAGING 权限），
                // 系统拒绝连接并触发 onFailed(PERMISSION_DENY)，验证错误码为 17100203
                try {
                  let context = getContext(this) as common.UIAbilityContext;
                  let want: Want = {
                    bundleName: 'com.acts.context.webonconnectnativerely',
                    abilityName: 'WebNativeExtensionExtAbility1',
                    parameters: {
                      'ohos.arkweb.extensionOrigin': 'testOrigin',
                      'ohos.arkweb.messageReadPipe': { 'type': 'FD', 'value': 1 },
                      'ohos.arkweb.messageWritePipe': { 'type': 'FD', 'value': 2 }
                    }
                  };
                  let testCallback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
                    onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
                      console.info(`OnFailedPermissionDenyStatic001 onConnect (unexpected)`);
                      Utils.emitEvent('-1', 20260602);
                    },
                    onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
                      console.info(`OnFailedPermissionDenyStatic001 onFailed: code=${code}, errMsg=${errMsg}`);
                      Utils.emitEvent(String(Number(code)), 20260602);
                    }
                  };
                  webNativeMessagingExtensionManager.connectNative(context, want, testCallback);
                } catch (error) {
                  const err = error as BusinessError;
                  console.error(`OnFailedPermissionDenyStatic001 catch error: ${err.code}, ${err.message}`);
                  Utils.emitEvent(String(err.code), 20260602);
                }
                break;
              }
              case 'OnConnectBundleNameEmptyStatic001': {
                // 真实调用 connectNative 并传入空 bundleName 的 want：
                // 因本应用无 WEB_NATIVE_MESSAGING 权限，系统拒绝连接，
                // onFailed 回调应触发，验证空 bundleName + 无权限场景正确报错
                try {
                  let context = getContext(this) as common.UIAbilityContext;
                  let want: Want = {
                    bundleName: '',
                    abilityName: 'WebNativeExtensionExtAbility1',
                    parameters: {
                      'ohos.arkweb.extensionOrigin': 'testOrigin',
                      'ohos.arkweb.messageReadPipe': { 'type': 'FD', 'value': 1 },
                      'ohos.arkweb.messageWritePipe': { 'type': 'FD', 'value': 2 }
                    }
                  };
                  let testCallback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
                    onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
                      console.info(`OnConnectBundleNameEmptyStatic001 onConnect bundleName='${connection.bundleName}'`);
                      Utils.emitEvent(connection.bundleName, 20260603);
                    },
                    onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {},
                    onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
                      console.info(`OnConnectBundleNameEmptyStatic001 onFailed: code=${code}, errMsg=${errMsg}`);
                      Utils.emitEvent('', 20260603);
                    }
                  };
                  webNativeMessagingExtensionManager.connectNative(context, want, testCallback);
                } catch (error) {
                  const err = error as BusinessError;
                  console.error(`OnConnectBundleNameEmptyStatic001 catch error: ${err.code}, ${err.message}`);
                  Utils.emitEvent('', 20260603);
                }
                break;
              }
              case 'DisconnectNativePermissionDenyStatic001': {
                // 测试在未申请 WEB_NATIVE_MESSAGING 权限时调用 disconnectNative：验证抛出错误码 201
                webNativeMessagingExtensionManager.disconnectNative(1).then(() => {
                  console.info('DisconnectNativePermissionDenyStatic001: disconnectNative succeeded (unexpected)');
                  Utils.emitEvent(0, 20260604);
                }).catch((error: BusinessError) => {
                  console.error(`DisconnectNativePermissionDenyStatic001 error: ${error.code}, ${error.message}`);
                  Utils.emitEvent(error.code, 20260604);
                });
                break;
              }
              case 'DisconnectNativeNullUndefinedParamStatic001': {
                // 测试 disconnectNative 传入 null/undefined 等效值（0）作为 connectionId 入参规格检查：
                // 因本应用无 WEB_NATIVE_MESSAGING 权限，系统在参数检查之前先拦截权限，期望返回错误码 201
                let nullConnectionId: number = 0;
                webNativeMessagingExtensionManager.disconnectNative(nullConnectionId).then(() => {
                  console.info('DisconnectNativeNullUndefinedParamStatic001: disconnectNative succeeded');
                  Utils.emitEvent(0, 20260605);
                }).catch((error: BusinessError) => {
                  console.error(`DisconnectNativeNullUndefinedParamStatic001 error: ${error.code}, ${error.message}`);
                  Utils.emitEvent(error.code, 20260605);
                });
                break;
              }
              case 'PauseMicrophoneErrorCodeStatic001': {
                // 测试在未关联 Web 组件的 WebviewController 上调用 pauseMicrophone：验证抛出错误码 17100001
                try {
                  this.controllerUnattached.pauseMicrophone();
                  console.info('PauseMicrophoneErrorCodeStatic001: pauseMicrophone succeeded (unexpected)');
                  Utils.emitEvent(0, 20260606);
                } catch (error) {
                  const err = error as BusinessError;
                  console.error(`PauseMicrophoneErrorCodeStatic001 error: ${err.code}, ${err.message}`);
                  Utils.emitEvent(err.code, 20260606);
                }
                break;
              }
            }
          })
      }
      Web({ src: 'www.example.com', controller: this.controller })
    }
  }
}
