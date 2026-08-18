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
import Utils from './Utils.test';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

export default function webResourceErrorConstructor():void {

  describe('WebResourceErrorConstructorTest', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    /**
     * @tc.name   testWebResourceErrorConstructorStatic001
     * @tc.number SUB_WEB_CONSTRUCTOR_RETURN_0100
     * @tc.desc   WebResourceError constructor return value test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceErrorConstructorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
       try {
          await Utils.msSleep(1000);
          Utils.emitEvent("SwitchNextPageStaticWebResourceError", 10)
          await Utils.msSleep(3000);
          Utils.emitEvent("emitConstructorReturn001", 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testWebResourceErrorConstructorStatic001", "true", 70036, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('WebResourceErrorConstructorButton', 10, '');
          await Utils.msSleep(3000);
        } catch (err) {
          console.log('testWebResourceErrorConstructorStatic001' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebResourceErrorConstructorStatic002
     * @tc.number SUB_WEB_CONSTRUCTOR_RETURN_0200
     * @tc.desc   WebResourceError constructor invocation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceErrorConstructorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticWebResourceError", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitConstructor001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebResourceErrorConstructorStatic002", "constructorSuccess", 70030, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceErrorConstructorButton', 10, '');
        await Utils.msSleep(3000);
      } catch(err) {
        console.log('testWebResourceErrorConstructorStatic002' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebResourceErrorConstructorStatic003
     * @tc.number SUB_WEB_CONSTRUCTOR_RETURN_002
     * @tc.desc   WebResourceError getErrorInfo method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceErrorConstructorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(1000);
          Utils.emitEvent("SwitchNextPageStaticWebResourceError", 10)
          await Utils.msSleep(3000);
          Utils.emitEvent("emitGetErrorInfo001", 10)
          await Utils.msSleep(2000);
          Utils.registerEvent("testWebResourceErrorConstructorStatic003", "", 70032, done);
          await Utils.msSleep(2000);
          inspector.sendEventByKey('WebResourceErrorConstructorButton', 10, '');
          await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebResourceErrorConstructorStatic003' + err)
        }
        done();
      })

    /**
     * @tc.name   testWebResourceErrorConstructorStatic004
     * @tc.number SUB_WEB_CONSTRUCTOR_RETURN_003
     * @tc.desc   WebResourceError getErrorCode method test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebResourceErrorConstructorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent("SwitchNextPageStaticWebResourceError", 10)
        await Utils.msSleep(3000);
        Utils.emitEvent("emitGetErrorCode001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebResourceErrorConstructorStatic004", 0, 70034, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebResourceErrorConstructorButton', 10, '');
        await Utils.msSleep(3000);
        } catch(err) {
          console.log('testWebResourceErrorConstructorStatic004' + err)
        }
        done();
      })




  })
}
