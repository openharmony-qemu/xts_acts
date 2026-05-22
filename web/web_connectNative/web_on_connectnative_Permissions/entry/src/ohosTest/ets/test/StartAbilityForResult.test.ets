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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, afterEach, Level, it, expect } from '@ohos/hypium';
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
import { commonEventManager } from '@kit.BasicServicesKit';
import testNapi from 'libentry.so';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import fs from '@ohos.file.fs';

let context: common.UIAbilityContext;
let sub: commonEventManager.CommonEventSubscriber;
let pipeRead: testNapi.PipeResult = { readFd: -1, writeFd: -1 };
let pipeWrite: testNapi.PipeResult = { readFd: -1, writeFd: -1 };
let connId: number = 0;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => resolve('ok'), time);
  });
}

function closePipe(pipe: testNapi.PipeResult) {
  if (pipe.readFd != -1) {
    fs.close(pipe.readFd);
    pipe.readFd = -1;
  }
  if (pipe.writeFd != -1) {
    fs.close(pipe.writeFd);
    pipe.writeFd = -1;
  }
}

export default function startAbilityForResultPermissionTest() {
  describe('ActsStartAbilityForResultPermissionTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsStartAbilityForResultPermissionTest beforeAll');
    });

    afterEach(async () => {
      closePipe(pipeRead);
      closePipe(pipeWrite);
      try {
        commonEventManager.unsubscribe(sub);
      } catch (e) {
      }
      if (connId != 0) {
        webNativeMessagingExtensionManager.disconnectNative(connId).then(() => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id: ${connId} succeed`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id: ${connId} error: ${JSON.stringify(err)}`);
        });
        connId = 0;
      }
    });

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300
     * @tc.desc   Test startAbilityForResult without ohos.permission.WEB_NATIVE_MESSAGING:
     *            The extension ability (permission_rely, lacks WEB_NATIVE_MESSAGING) calls
     *            this.context.startAbilityForResult in onConnectNative, should get error 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300', Level.LEVEL0,
      async (done: Function) => {
        await sleep(3000);
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult_0300';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

        try {
          pipeRead = testNapi.createPipe();
          pipeWrite = testNapi.createPipe();
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          return;
        }

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['webNativeMessaging2_startAbilityForResult_permission']
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          sub = subscriber;
          hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} subscribe callback: ${JSON.stringify(commonEventData)}`);
            expect(commonEventData.parameters?.result).assertEqual(201);
            done();
          });
        });

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'WebNativeExtensionExtAbility1',
          parameters: {
            'ohos.arkweb.extensionOrigin': 'startAbilityForResult_permission',
            'ohos.arkweb.messageReadPipe': { 'type': 'FD', 'value': pipeWrite.readFd },
            'ohos.arkweb.messageWritePipe': { 'type': 'FD', 'value': pipeRead.writeFd }
          }
        };

        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          },
          onDisconnect(connection) {
            hilog.info(0x0000, 'testTag',
              `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          },
          onFailed(code, errMsg) {
            hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
            expect(Number(code)).assertEqual(17100203);
            done();
          }
        };

        try {
          connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
          hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} connect failed: ${JSON.stringify(err)}`);
          connId = 0;
          expect(Number(err.code)).assertEqual(801);
          done();
        }
      });
  });
}
