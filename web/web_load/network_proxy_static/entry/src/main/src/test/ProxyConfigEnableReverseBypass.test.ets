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
export default function proxyConfigEnableReverseBypass():void {
  describe('ProxyConfigEnableReverseBypassTestSuite', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.info("proxyConfigEnableReverseBypass beforeAll start");
    })

    /**
     * @tc.name   testEnableReverseBypassTrueStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0100
     * @tc.desc   enableReverseBypass true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
      try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassTrue', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassTrue', true, 202502300, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassTrueStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testEnableReverseBypassFalseStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0200
     * @tc.desc   enableReverseBypass false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassFalse', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassFalse', true, 202502301, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassFalseStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testEnableReverseBypassNullStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0300
     * @tc.desc   enableReverseBypass null 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassNull', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassNull', true, 202502302, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testEnableReverseBypassUndefinedStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0400
     * @tc.desc   enableReverseBypass undefined 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassUndefined', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassUndefined', true, 202502303, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testEnableReverseBypassStringStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0500
     * @tc.desc   enableReverseBypass string 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassString', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassString', true, 202502304, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testEnableReverseBypassNumberStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0600
     * @tc.desc   enableReverseBypass number 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassNumberStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassNumber', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassNumber', true, 202502305, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testEnableReverseBypassObjectStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0700
     * @tc.desc   enableReverseBypass object 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassObjectStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassObject', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassObject', true, 202502306, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testEnableReverseBypassReturnVoidStatic
     * @tc.number SUB_WEB_ENABLEREVERSEBY_PASS_0800
     * @tc.desc   enableReverseBypass return void test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableReverseBypassReturnVoidStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testEnableReverseBypassReturnVoid', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testEnableReverseBypassReturnVoid', true, 202502307, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testOnSwitchNextPageRuleParam
     * @tc.number SUB_WEB_RULE_PARAM_0900
     * @tc.desc   emitOnSwitchNextPageRuleParam test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSwitchNextPageRuleParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('emitOnSwitchNextPageRuleParam', 10);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('enableReverseBypassButton', 10, '');
          await Utils.msSleep(5000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })


  })
}


