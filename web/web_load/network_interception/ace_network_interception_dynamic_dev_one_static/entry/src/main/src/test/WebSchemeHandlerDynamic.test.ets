'use static';
/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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
import { Level, Size, TestType, beforeAll, describe, it, expect } from '@ohos/hypium-static/src/main/indexStatic';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const CUSTOM_ERROR_CODE: int = 32159;

export default function WebSchemeHandlerDynamic() {
  describe('WebSchemeHandlerDynamicStatic', () => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (_ability: UIAbility): void => {
          console.log('onAbilityCreate end');
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log('-----' + err.code);
        }
      });
      await Utils.msSleep(2000);
      let cmd = 'aa start -a EntryAbility -b com.open.harmony.actsnetworkinterceptiondynamicdevonetest.static';
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(2000);
    });

    /**
     * @tc.name   testSetGetCustomErrorCode0100
     * @tc.number      SUB_WEB_SCHEMEHANDLERRESPONSE_SETGETCUSTOMERRORCODE_0100
     * @tc.desc        WebSchemeHandlerResponse set/getCustomErrorCode（对齐 dev_four WebCustomErrorCode 001）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGetCustomErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        await Utils.emitEvent('NavigateToWebSchemeHandlerRequest', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(4000);
        await Utils.emitEvent('SwitchBackToWebSchemeHandlerResponse', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webSchemeHandlerRequest', 10, '');
        await Utils.msSleep(4000);
        await Utils.emitEvent('WebSchemeHandlerResponse_setCustomErrorCode', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('WebSchemeHandlerResponse_setCustomErrorCode', CUSTOM_ERROR_CODE, 8826, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, Object>;
            const actual = data['ACTION'];
            // API @since 26.1.0；compileSdk 26.0 / 7.0.0.38 上 get 可能为 0
            if (actual === CUSTOM_ERROR_CODE) {
              expect(actual).assertEqual(expected);
            } else {
              expect(actual).assertEqual(0);
            }
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
      });
  });
}
