'use static';
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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import{ BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;
export default function proxyConfigInsertDirectRuleParam():void {
  describe('ProxyConfigInsertDirectRuleParamTestSuite', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.info("proxyConfigInsertDirectRuleParam beforeAll start");
    })

    /**
     * @tc.name   testInsertDirectRuleMatchAllSchemesStatic
     * @tc.number SUB_WEB_INSERTDIRECTRULE_PARAM_0100
     * @tc.desc   insertDirectRule MATCH_ALL_SCHEMES baseline test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertDirectRuleMatchAllSchemesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testInsertDirectRuleMatchAllSchemes', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testInsertDirectRuleMatchAllSchemes', true, 202502400, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('insertDirectRuleParamButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testInsertDirectRuleMatchHttpStatic
     * @tc.number SUB_WEB_INSERTDIRECTRULE_PARAM_0200
     * @tc.desc   insertDirectRule MATCH_HTTP baseline test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertDirectRuleMatchHttpStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testInsertDirectRuleMatchHttp', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testInsertDirectRuleMatchHttp', true, 202502401, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('insertDirectRuleParamButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testInsertDirectRuleMatchHttpsStatic
     * @tc.number SUB_WEB_INSERTDIRECTRULE_PARAM_0300
     * @tc.desc   insertDirectRule MATCH_HTTPS baseline test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertDirectRuleMatchHttpsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testInsertDirectRuleMatchHttps', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testInsertDirectRuleMatchHttps', true, 202502402, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('insertDirectRuleParamButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testInsertDirectRuleNegativeEnumStatic
     * @tc.number SUB_WEB_INSERTDIRECTRULE_PARAM_0400
     * @tc.desc   insertDirectRule negative enum value 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertDirectRuleNegativeEnumStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testInsertDirectRuleNegativeEnum', 10);
          await Utils.msSleep(2000);
          Utils.registerEvent('testInsertDirectRuleNegativeEnum', true, 202502405, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('insertDirectRuleParamButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testInsertDirectRuleNegativeEnumStatic' + err);
        }
        done();
      })

    /**
     * @tc.name   testInsertDirectRuleOutOfRangeEnumStatic
     * @tc.number SUB_WEB_INSERTDIRECTRULE_PARAM_0500
     * @tc.desc   insertDirectRule out of range enum value 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertDirectRuleOutOfRangeEnumStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testInsertDirectRuleOutOfRangeEnum', 10);
          await Utils.msSleep(2000);
          Utils.registerEvent('testInsertDirectRuleOutOfRangeEnum', true, 202502406, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('insertDirectRuleParamButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testInsertDirectRuleOutOfRangeEnumStatic' + err);
        }
        done();
      })

    /**
     * @tc.name   testInsertDirectRuleLargeNumberStatic
     * @tc.number SUB_WEB_INSERTDIRECTRULE_PARAM_0600
     * @tc.desc   insertDirectRule large number 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertDirectRuleLargeNumberStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testInsertDirectRuleLargeNumber', 10);
          await Utils.msSleep(2000);
          Utils.registerEvent('testInsertDirectRuleLargeNumber', true, 202502407, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('insertDirectRuleParamButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testInsertDirectRuleLargeNumberStatic' + err);
        }
        done();
      })

    /**
     * @tc.name   testOnSwitchNextPageSetWow
     * @tc.number SUB_WEB_PAGE_SET_0700
     * @tc.desc   emitOnSwitchNextPageSetWow test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSwitchNextPageSetWow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('emitOnSwitchNextPageSetWow', 10);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('insertDirectRuleParamButton', 10, '');
          await Utils.msSleep(5000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })
  })
}


