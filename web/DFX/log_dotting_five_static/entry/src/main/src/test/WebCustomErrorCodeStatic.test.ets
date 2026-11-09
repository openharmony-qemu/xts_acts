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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium-static/src/main/indexStatic';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import wifiMg from '@ohos.wifiManager';

let testAbilityContext:common.UIAbilityContext;

export default function webCustomErrorCodeStatic() {
  describe('webCustomErrorCodeStaticTestSuite', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
      });
      await Utils.msSleep(2000)
      let cmd = "aa start -a EntryAbility -b com.open.harmony.logdottingfivetest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
    });

    /**
     * @tc.number     SUB_WEB_GETCUSTOMERRORCODE_STATIC_0100
     * @tc.name       testGetCustomErrorCodeStatic001
     * @tc.desc       test WebResourceError getCustomErrorCode static
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testGetCustomErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStaticWebCustomErrorCode', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
        await Utils.msSleep(2000);
        Utils.emitEvent('testGetCustomErrorCodeStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testGetCustomErrorCodeStatic001', 32159, 36025, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, Object>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCustomErrorCodeStaticButton', 10, '');
      })
  })
}
