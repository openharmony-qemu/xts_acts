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

import {beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function webCookieManagerTest(): void {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        let cmd = 'aa start -a EntryAbility -b com.open.harmony.forwardbackwardcacheonetest.static';
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        abilityDelegator.executeShellCommand(cmd)
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testIsCookieAllowedStatic001
     * @tc.number SUB_WEB_ISCOOKIEALLOWED_0100
     * @tc.desc   test isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsCookieAllowedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testIsCookieAllowed001", 10)
        Utils.registerBaseEvent("testIsCookieAllowed001", true, 30015, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testIsCookieAllowedStatic002
     * @tc.number SUB_WEB_ISCOOKIEALLOWED_0200
     * @tc.desc   test isCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsCookieAllowedStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testIsCookieAllowed002", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testIsCookieAllowed002", false, 30016, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testIsThirdPartyCookieAllowedStatic001
     * @tc.number SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0100
     * @tc.desc   test isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsThirdPartyCookieAllowedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testIsThirdPartyCookieAllowed001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testIsThirdPartyCookieAllowed001", true, 30025, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testIsThirdPartyCookieAllowedStatic002
     * @tc.number SUB_WEB_ISTHIRDPARTYCOOKIEALLOWED_0200
     * @tc.desc   test isThirdPartyCookieAllowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsThirdPartyCookieAllowedStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testIsThirdPartyCookieAllowed002", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testIsThirdPartyCookieAllowed002", false, 30026, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testPutAcceptThirdPartyCookieEnabledStatic001
     * @tc.number SUB_WEB_PUTACCEPTTHIRDPARTYCOOKIEENABLED_0100
     * @tc.desc   test putAcceptThirdPartyCookieEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutAcceptThirdPartyCookieEnabledStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testPutAcceptThirdPartyCookieEnabled001", 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent("testPutAcceptThirdPartyCookieEnabled001", false, 30033, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testPutAcceptThirdPartyCookieEnabledNullStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_PUTACCEPTTHIRDPARTYCOOKIEENABLED_NULL_0100
     * @tc.desc   test putAcceptThirdPartyCookieEnabled null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutAcceptThirdPartyCookieEnabledNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPutAcceptThirdPartyCookieEnabledNullStatic', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testPutAcceptThirdPartyCookieEnabledNullStatic', false, 30034, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testPutAcceptThirdPartyCookieEnabledUndefinedStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_PUTACCEPTTHIRDPARTYCOOKIEENABLED_UNDEFINED_0200
     * @tc.desc   test putAcceptThirdPartyCookieEnabled undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutAcceptThirdPartyCookieEnabledUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testPutAcceptThirdPartyCookieEnabledUndefinedStatic', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testPutAcceptThirdPartyCookieEnabledUndefinedStatic', false, 30035, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
    * @tc.name        emitOnSwitchNextPageStatic
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_30033
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitOnSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testPutAcceptCookieEnabledNullStatic
     * @tc.number SUB_WEB_PUTACCEPTCOOKIEENABLED_0100
     * @tc.desc   test putAcceptCookieEnabled with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutAcceptCookieEnabledNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testPutAcceptCookieEnabledNull", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPutAcceptCookieEnabledNull", 401, 30034, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testPutAcceptCookieEnabledUndefinedStatic
     * @tc.number SUB_WEB_PUTACCEPTCOOKIEENABLED_0200
     * @tc.desc   test putAcceptCookieEnabled with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutAcceptCookieEnabledUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testPutAcceptCookieEnabledUndefined", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPutAcceptCookieEnabledUndefined", 401, 30035, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testPutAcceptThirdPartyCookieEnabledNullStatic
     * @tc.number SUB_WEB_PUTACCEPTTHIRDPARTYCOOKIEENABLED_0200
     * @tc.desc   test putAcceptThirdPartyCookieEnabled with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutAcceptThirdPartyCookieEnabledNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testPutAcceptThirdPartyCookieEnabledNull", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPutAcceptThirdPartyCookieEnabledNull", 401, 30036, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testPutAcceptThirdPartyCookieEnabledUndefinedStatic
     * @tc.number SUB_WEB_PUTACCEPTTHIRDPARTYCOOKIEENABLED_0300
     * @tc.desc   test putAcceptThirdPartyCookieEnabled with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutAcceptThirdPartyCookieEnabledUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testPutAcceptThirdPartyCookieEnabledUndefined", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testPutAcceptThirdPartyCookieEnabledUndefined", 401, 30037, done);
        inspector.sendEventByKey('WebCookieManagerButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })
  })
}
