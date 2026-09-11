'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Level, Size, TestType, beforeAll, describe, it, expect } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const CUSTOM_ERROR_CODE: int = 32159;

export default function WebCustomErrorCode(): void {
  describe('WebCustomErrorCodeStatic', () => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
      });
      await Utils.msSleep(2000)
      let cmd = "aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptiondevfourtest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
    });

    /**
     * @tc.name        testSetGetCustomErrorCodeStatic001
     * @tc.number      SUB_WEB_CUSTOMERRORCODE_STATIC_0100
     * @tc.desc        test WebSchemeHandlerResponse setCustomErrorCode and getCustomErrorCode
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testSetGetCustomErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("WebSchemeHandlerResponse_setCustomErrorCode", 10)
        await Utils.msSleep(2000)
        Utils.registerBaseEvent("WebSchemeHandlerResponse_setCustomErrorCode", CUSTOM_ERROR_CODE, 8820, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, Object>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebSchemeHandlerResponse', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name        testDidFailCustomErrorCodeStatic001
     * @tc.number      SUB_WEB_CUSTOMERRORCODE_STATIC_0200
     * @tc.desc        test WebResourceHandler didFail with customErrorCode
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testDidFailCustomErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("testDidFailCustomErrorCodeStatic001", 10)
        await Utils.msSleep(2000)
        Utils.registerBaseEvent("testDidFailCustomErrorCodeStatic001", CUSTOM_ERROR_CODE, 8822, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, Object>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebCustomErrorCode', 10, '');
        await Utils.msSleep(4000);
        done();
      })

    /**
     * @tc.name        testDidFailInvalidHandlerStatic001
     * @tc.number      SUB_WEB_CUSTOMERRORCODE_STATIC_0300
     * @tc.desc        test WebResourceHandler didFail invalid handler error 17100021
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testDidFailInvalidHandlerStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000)
        Utils.emitEvent("testDidFailInvalidHandlerStatic001", 10)
        await Utils.msSleep(2000)
        Utils.registerBaseEvent("testDidFailInvalidHandlerStatic001", 17100021, 8824, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, Object>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000)
        inspector.sendEventByKey('WebCustomErrorCode', 10, '');
        await Utils.msSleep(4000);
        done();
      })
  })
}
