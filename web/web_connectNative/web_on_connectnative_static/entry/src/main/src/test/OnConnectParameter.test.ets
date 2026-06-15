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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function OnConnectParameter() {
  describe('OnConnectParameter', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      let cmd = 'aa start -a EntryAbility -b com.acts.context.webonconnectnative.static';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(5000);
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testOnConnectParameterStatic001
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnConnect_Parameter_0100
     * @tc.desc   test onConnect callback is invoked with valid ConnectionNativeInfo: verify connectionId is received correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnConnectParameterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("OnConnectParameter001", 10)
        Utils.registerEvent('testOnConnectParameterStatic001', '1', 20260601, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('OnConnectParameterTestButton', 10, '');
      })

    /**
     * @tc.name   testOnFailedPermissionDenyStatic001
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_PermissionDeny_0100
     * @tc.desc   test connectNative without WEB_NATIVE_MESSAGING permission triggers onFailed with PERMISSION_DENY 17100203
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnFailedPermissionDenyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("OnFailedPermissionDenyStatic001", 10)
        Utils.registerEvent('testOnFailedPermissionDenyStatic001', '17100203', 20260602, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('OnConnectParameterTestButton', 10, '');
      })

    /**
     * @tc.name   testOnConnectBundleNameEmptyStatic001
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnConnect_BundleNameEmpty_0100
     * @tc.desc   test connectNative with empty bundleName in want: verify onFailed is triggered due to invalid want or permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnConnectBundleNameEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("OnConnectBundleNameEmptyStatic001", 10)
        Utils.registerEvent('testOnConnectBundleNameEmptyStatic001', '', 20260603, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('OnConnectParameterTestButton', 10, '');
      })

    /**
     * @tc.name   testDisconnectNativePermissionDenyStatic001
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_PermissionDeny_0100
     * @tc.desc   test disconnectNative without WEB_NATIVE_MESSAGING permission: verify error code is 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDisconnectNativePermissionDenyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('DisconnectNativePermissionDenyStatic001', 10);
        Utils.registerEvent('testDisconnectNativePermissionDenyStatic001', 201, 20260604, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('OnConnectParameterTestButton', 10, '');
      })

    /**
     * @tc.name   testDisconnectNativeNullUndefinedParamStatic001
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_NullUndefined_0100
     * @tc.desc   test disconnectNative with null/undefined-equivalent connectionId (0): since the device does not
     *            support WEB_NATIVE_MESSAGING capability, the system rejects with error code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDisconnectNativeNullUndefinedParamStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('DisconnectNativeNullUndefinedParamStatic001', 10);
        Utils.registerEvent('testDisconnectNativeNullUndefinedParamStatic001', 201, 20260605, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('OnConnectParameterTestButton', 10, '');
      })

  })
}
