'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach, expect } from '../../../hypium/index';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';

let testAbilityContext: common.UIAbilityContext;

export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      let cmd = "aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptionenhancedtesttwo.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name   testSetNetworkAvailableNullStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_NULL_0100
     * @tc.desc   test setNetworkAvailable with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNetworkAvailableNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetNetworkAvailableNullStatic001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testSetNetworkAvailableNullStatic001", '401', 41022401, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetNetworkAvailableUndefinedStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_UNDEFINED_0100
     * @tc.desc   test setNetworkAvailable with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNetworkAvailableUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetNetworkAvailableUndefinedStatic001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testSetNetworkAvailableUndefinedStatic001", '401', 41022402, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetNetworkAvailableStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_0100
     * @tc.desc   test setNetworkAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetNetworkAvailableStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetNetworkAvailable001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testSetNetworkAvailable001", 'false', 100055, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetNetworkAvailableStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_0200
     * @tc.desc   test setNetworkAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetNetworkAvailableStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetNetworkAvailable002", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testSetNetworkAvailable002", 'true', 100056, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSetNetworkAvailableStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETNETWORKAVAILABLE_0300
     * @tc.desc   test setNetworkAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetNetworkAvailableStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSetNetworkAvailable003", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testSetNetworkAvailable003", 17100001, 100057, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })


  })
}
