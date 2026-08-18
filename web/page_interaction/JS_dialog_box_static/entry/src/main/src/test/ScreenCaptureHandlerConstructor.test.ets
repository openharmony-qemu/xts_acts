'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

export default function screenCaptureHandlerConstructor():void {

  describe('ScreenCaptureHandlerConstructorTest', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    /**
     * @tc.name   testScreenCaptureHandlerConstructorStatic001
     * @tc.number SUB_WEB_CONSTRUCTOR_RETURN_001
     * @tc.desc   ScreenCaptureHandler constructor return value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScreenCaptureHandlerConstructorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticScreenCaptureHandler", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitConstructorReturn001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testScreenCaptureHandlerConstructorStatic001", "true", 70062, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ScreenCaptureHandlerConstructorButton', 10, '');
        await Utils.msSleep(3000);
      } catch(err) {
         console.log('testScreenCaptureHandlerConstructorStatic001' + err)
        }
        done();
      })

    /**
     * @tc.name   testScreenCaptureHandlerConstructorStatic002
     * @tc.number SUB_WEB_CONSTRUCTOR_PARAM_001
     * @tc.desc   ScreenCaptureHandler constructor invocation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScreenCaptureHandlerConstructorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticScreenCaptureHandler", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitConstructor001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testScreenCaptureHandlerConstructorStatic002", "constructorSuccess", 70060, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ScreenCaptureHandlerConstructorButton', 10, '');
        await Utils.msSleep(3000);
      } catch(err) {
        console.log('testScreenCaptureHandlerConstructorStatic002' + err)
      }
      done();
      })

    /**
     * @tc.name   testScreenCaptureHandlerConstructorStatic003
     * @tc.number SUB_WEB_CONSTRUCTOR_RETURN_002
     * @tc.desc   ScreenCaptureHandler getOrigin method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureHandlerConstructorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticScreenCaptureHandler", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitGetOrigin001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testScreenCaptureHandlerConstructorStatic003", "", 70064, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('ScreenCaptureHandlerConstructorButton', 10, '');
        await Utils.msSleep(3000);
        } catch(err) {
          console.log('testScreenCaptureHandlerConstructorStatic003' + err)
        }
        done();
      })

    /**
     * @tc.name   testScreenCaptureHandlerConstructorStatic004
     * @tc.number SUB_WEB_CONSTRUCTOR_RETURN_003
     * @tc.desc   ScreenCaptureHandler deny method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureHandlerConstructorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(1000);
          Utils.emitEvent("SwitchNextPageStaticScreenCaptureHandler", 10)
          await Utils.msSleep(3000);
          Utils.emitEvent("emitDeny001", 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testScreenCaptureHandlerConstructorStatic004", "denySuccess", 70066, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('ScreenCaptureHandlerConstructorButton', 10, '');
          await Utils.msSleep(3000);
        } catch(err) {
          console.log('testScreenCaptureHandlerConstructorStatic004' + err)
        }
        done();
      })



    /**
     * @tc.name   testSwitchNextPageStatic07
     * @tc.number SUB_WEB_NEXT_PAGE_0500
     * @tc.desc   switchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSwitchNextPageStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(1000);
          Utils.emitEvent('emitSwitchNextPageStatic07', 10)
          await Utils.msSleep(1000);
          inspector.sendEventByKey('ScreenCaptureHandlerConstructorButton', 10, '');
          await Utils.msSleep(4000)
        } catch(err) {
          console.log('testSwitchNextPageStatic07' + err)
        }
        done()
      })

  })
}

