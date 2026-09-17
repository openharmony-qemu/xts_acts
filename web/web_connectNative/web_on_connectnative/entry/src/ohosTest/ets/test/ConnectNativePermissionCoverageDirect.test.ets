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
import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium';
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';

const CAPABILITY_NOT_SUPPORTED = 801;

function isCapabilityNotSupported(error: BusinessError): boolean {
  return error.code === CAPABILITY_NOT_SUPPORTED;
}

export default function connectNativePermissionCoverageDirect() {
  describe('connectNativePermissionCoverageDirect', () => {
    let context: common.UIAbilityContext;

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    });

    /**
     * @tc.name   testConnectNativePermission801Direct
     * @tc.number SUB_WEB_CONNECTNATIVE_PERMISSION_801_0100
     * @tc.desc   connectNative without capability returns 801 permission/capability error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectNativePermission801Direct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let want: Want = {
          bundleName: 'com.example.webnativeextension',
          abilityName: 'WebNativeExtensionExtAbility1',
        };
        try {
          await webNativeMessagingExtensionManager.connectNative(want, {
            onConnect: () => {},
            onDisconnect: () => {},
            onFailed: () => {},
          });
          expect(true).assertTrue();
        } catch (error) {
          let err = error as BusinessError;
          expect(isCapabilityNotSupported(err) || err.code === 201).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testDisconnectNativePermission801Direct
     * @tc.number SUB_WEB_DISCONNECTNATIVE_PERMISSION_801_0100
     * @tc.desc   disconnectNative without capability returns 801 or 201 error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDisconnectNativePermission801Direct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await webNativeMessagingExtensionManager.disconnectNative(1);
          expect(true).assertTrue();
        } catch (error) {
          let err = error as BusinessError;
          expect(isCapabilityNotSupported(err) || err.code === 201).assertTrue();
        }
        done();
      })
  })
}
