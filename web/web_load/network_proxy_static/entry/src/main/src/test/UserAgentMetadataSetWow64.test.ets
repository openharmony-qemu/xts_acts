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
export default function userAgentMetadataSetWow64():void {
  describe('UserAgentMetadataSetWow64TestSuite', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.info("userAgentMetadataSetWow64 beforeAll start");
    })

    /**
     * @tc.name   testSetWow64TrueStatic
     * @tc.number SUB_WEB_SETWOW64_0100
     * @tc.desc   setWow64 true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64TrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64True', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64True', true, 202502500, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testSetWow64FalseStatic
     * @tc.number SUB_WEB_SETWOW64_0200
     * @tc.desc   setWow64 false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64FalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64False', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64False', true, 202502501, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testSetWow64NullStatic
     * @tc.number SUB_WEB_SETWOW64_0300
     * @tc.desc   setWow64 null 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64NullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64Null', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64Null', true, 202502502, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testSetWow64UndefinedStatic
     * @tc.number SUB_WEB_SETWOW64_0400
     * @tc.desc   setWow64 undefined 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64UndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64Undefined', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64Undefined', true, 202502503, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testSetWow64StringStatic
     * @tc.number SUB_WEB_SETWOW64_0500
     * @tc.desc   setWow64 string 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64StringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64String', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64String', true, 202502504, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testSetWow64NumberStatic
     * @tc.number SUB_WEB_SETWOW64_0600
     * @tc.desc   setWow64 number 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64NumberStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64Number', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64Number', true, 202502505, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testSetWow64ObjectStatic
     * @tc.number SUB_WEB_SETWOW64_0700
     * @tc.desc   setWow64 object 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64ObjectStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64Object', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64Object', true, 202502506, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testSetWow64ReturnVoidStatic
     * @tc.number SUB_WEB_SETWOW64_0800
     * @tc.desc   setWow64 return void test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWow64ReturnVoidStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testSetWow64ReturnVoid', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testSetWow64ReturnVoid', true, 202502507, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testOnSwitchNextPagePinCallback
     * @tc.number SUB_WEB_PIN_CALLBACK_0900
     * @tc.desc   emitOnSwitchNextPagePinCallback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSwitchNextPagePinCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('emitOnSwitchNextPagePinCallback', 10);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('setWow64Button', 10, '');
          await Utils.msSleep(5000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })
  })
}



