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
export default function webOnVerifyPinCallback():void {
  describe('WebOnVerifyPinCallbackTestSuite', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.info("webOnVerifyPinCallback beforeAll start");
    })

    /**
     * @tc.name   testOnVerifyPinCallbackInterfaceCallStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0100
     * @tc.desc   OnVerifyPinCallback interface call test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnVerifyPinCallbackInterfaceCallStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testOnVerifyPinCallbackInterfaceCall', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnVerifyPinCallbackInterfaceCall', true, 202502600, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testOnVerifyPinEventHandlerStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0200
     * @tc.desc   OnVerifyPinCallback event handler test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnVerifyPinEventHandlerStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testOnVerifyPinEventHandler', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnVerifyPinEventHandler', true, 202502601, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testOnVerifyPinEventIdentityStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0300
     * @tc.desc   OnVerifyPinCallback event identity test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnVerifyPinEventIdentityStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testOnVerifyPinEventIdentity', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnVerifyPinEventIdentity', true, 202502602, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testOnVerifyPinHandlerConfirmSuccessStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0400
     * @tc.desc   VerifyPinHandler confirm PIN_VERIFICATION_SUCCESS test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnVerifyPinHandlerConfirmSuccessStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testOnVerifyPinHandlerConfirmSuccess', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnVerifyPinHandlerConfirmSuccess', true, 202502603, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testOnVerifyPinHandlerConfirmFailedStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0500
     * @tc.desc   VerifyPinHandler confirm PIN_VERIFICATION_FAILED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnVerifyPinHandlerConfirmFailedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testOnVerifyPinHandlerConfirmFailed', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnVerifyPinHandlerConfirmFailed', true, 202502604, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    // /**
    //  * @tc.name   testOnVerifyPinHandlerConfirmNullStatic
    //  * @tc.number SUB_WEB_ONVERIFYPINCALLBACK_0600
    //  * @tc.desc   VerifyPinHandler confirm null 401 test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testOnVerifyPinHandlerConfirmNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> =>  {
    //     try {
    //       await Utils.msSleep(2000);
    //       Utils.emitEvent('testOnVerifyPinHandlerConfirmNull', 10)
    //       await Utils.msSleep(2000);
    //       Utils.registerEvent('testOnVerifyPinHandlerConfirmNull', true, 202502605, done);
    //       await Utils.msSleep(2000);
    //       inspector.sendEventByKey('onVerifyPinButton', 10, '');
    //       await Utils.msSleep(2000);
    //     } catch(err) {
    //       console.log('testEnableReverseBypassNullStatic' + err)
    //     }
    //     done();
    //   })

    // /**
    //  * @tc.name   testOnVerifyPinHandlerConfirmUndefinedStatic
    //  * @tc.number SUB_WEB_ONVERIFYPINCALLBACK_0700
    //  * @tc.desc   VerifyPinHandler confirm undefined 401 test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testOnVerifyPinHandlerConfirmUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> =>  {
    //     try {
    //       await Utils.msSleep(2000);
    //       Utils.emitEvent('testOnVerifyPinHandlerConfirmUndefined', 10)
    //       await Utils.msSleep(2000);
    //       Utils.registerEvent('testOnVerifyPinHandlerConfirmUndefined', true, 202502606, done);
    //       await Utils.msSleep(2000);
    //       inspector.sendEventByKey('onVerifyPinButton', 10, '');
    //       await Utils.msSleep(2000);
    //     } catch(err) {
    //       console.log('testEnableReverseBypassNullStatic' + err)
    //     }
    //     done();
    //   })

    /**
     * @tc.name   testOnVerifyPinCallbackReturnVoidStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0800
     * @tc.desc   OnVerifyPinCallback return void test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnVerifyPinCallbackReturnVoidStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testOnVerifyPinCallbackReturnVoid', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnVerifyPinCallbackReturnVoid', true, 202502607, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   testOnVerifyPinChainedReturnStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0900
     * @tc.desc   onVerifyPin chained return this test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnVerifyPinChainedReturnStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>  {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('testOnVerifyPinChainedReturn', 10)
          await Utils.msSleep(2000);
          Utils.registerEvent('testOnVerifyPinChainedReturn', true, 202502608, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })

    /**
     * @tc.name   emitOnSwitchNextPageStatic
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_1000
     * @tc.desc   emitonSwitchNextPage test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent('emitonSwitchNextPage', 10);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('onVerifyPinButton', 10, '');
          await Utils.msSleep(5000);
        } catch(err) {
          console.log('testEnableReverseBypassNullStatic' + err)
        }
        done();
      })
  })
}


