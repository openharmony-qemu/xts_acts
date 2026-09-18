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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium';
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';

const PERMISSION_DENIED_ERROR = 201;
const CAPABILITY_NOT_SUPPORTED_ERROR = 801;
const WEB_NATIVE_MESSAGING_PERMISSION = 'ohos.permission.WEB_NATIVE_MESSAGING';
const DISCONNECT_TEST_CONNECTION_ID = 1;
const PERMISSION_CHECK_WAIT_MS = 2000;

function sleep(time: number): Promise<void> {
  return new Promise((resolve: () => void) => {
    setTimeout(resolve, time);
  });
}

function assertPermissionOrCapabilityError(err: BusinessError): void {
  if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
    expect(err.code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
  } else {
    expect(err.code).assertEqual(PERMISSION_DENIED_ERROR);
  }
}

export default function connectNativePermissionCoverageDirect() {
  describe('connectNativePermissionCoverageDirect', () => {
    let context: common.UIAbilityContext;

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    });

    /**
     * @tc.name   testConnectNativePermission201Direct
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectNative_PermissionDeny_0100
     * @tc.desc   connectNative without ohos.permission.WEB_NATIVE_MESSAGING in module.json5 returns 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectNativePermission201Direct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtension_ConnectNative_PermissionDeny_0100';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin, permission=${WEB_NATIVE_MESSAGING_PERMISSION} not declared`);

        let want: Want = {
          bundleName: 'com.acts.context.webonconnectnativerelypermission',
          abilityName: 'WebNativeExtensionExtAbility1',
          parameters: {
            'ohos.arkweb.extensionOrigin': 'testOrigin',
          }
        };

        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect: () => {
            hilog.info(0x0000, 'testTag', `${tcNumber} onConnect unexpected without permission`);
          },
          onDisconnect: () => {},
          onFailed: (code: number, errMsg: string) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          }
        };

        try {
          webNativeMessagingExtensionManager.connectNative(context, want, callback);
          await sleep(PERMISSION_CHECK_WAIT_MS);
          hilog.info(0x0000, 'testTag', `${tcNumber} connectNative returned without throwing 201`);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} connectNative error: ${JSON.stringify(err)}`);
          assertPermissionOrCapabilityError(err as BusinessError);
          done();
        }
      })

    /**
     * @tc.name   testDisconnectNativePermission201Direct
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_PermissionDeny_0200
     * @tc.desc   disconnectNative without ohos.permission.WEB_NATIVE_MESSAGING in module.json5 returns 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDisconnectNativePermission201Direct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const tcNumber = 'SUB_WEB_WebNativeMessagingExtension_DisconnectNative_PermissionDeny_0200';
        hilog.info(0x0000, 'testTag', `${tcNumber} Begin, permission=${WEB_NATIVE_MESSAGING_PERMISSION} not declared`);

        try {
          await webNativeMessagingExtensionManager.disconnectNative(DISCONNECT_TEST_CONNECTION_ID).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed without error`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative error: ${JSON.stringify(err)}`);
            assertPermissionOrCapabilityError(err);
            done();
          });
        } catch (err) {
          hilog.info(0x0000, 'testTag', `${tcNumber} catch error: ${JSON.stringify(err)}`);
          assertPermissionOrCapabilityError(err as BusinessError);
          done();
        }
      })

    /**
     * @tc.name   testConnectNativeError801Direct
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_801_0300
     * @tc.desc   connectNative invalid bundle returns error code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectNativeError801Direct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let want: Want = {
          bundleName: 'com.example.nonexistent.bundle.invalid',
          abilityName: 'NonexistentAbility',
          parameters: {
            'ohos.arkweb.extensionOrigin': 'testOrigin',
          }
        };
        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect: () => {},
          onDisconnect: () => {},
          onFailed: (code: number, errMsg: string) => {
            if (code === CAPABILITY_NOT_SUPPORTED_ERROR) {
              expect(code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
            } else {
              expect(code).assertLarger(0);
            }
            done();
          }
        };
        try {
          webNativeMessagingExtensionManager.connectNative(context, want, callback);
          await sleep(PERMISSION_CHECK_WAIT_MS);
          done();
        } catch (err) {
          assertPermissionOrCapabilityError(err as BusinessError);
          done();
        }
      })
  })
}
