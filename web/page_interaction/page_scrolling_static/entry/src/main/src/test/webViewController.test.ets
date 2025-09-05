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

import { expect, afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;
let emitKey = 'webViewController01';

export default function webViewController() {


  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('beforeEach start');
    })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0100
    * @tc.name       : testOnOverScrollStatic001
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testOnOverScrollStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000)
        Utils.emitEvent('testOnOverScroll001', 10)
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000)
        driver.swipe(100, 40, 100, 160);
        await Utils.msSleep(1000);
        Utils.registerEvent('testOnOverScroll001', true, 31038, done);
        await Utils.msSleep(3000)
        let button = await driver.findComponent(ON.id('WebViewControllerButton'));
        await Utils.msSleep(3000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0200
    * @tc.name       : testOnOverScrollStatic002
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testOnOverScrollStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testOnOverScroll002', 10)
        let driver: Driver = Driver.create();
        await Utils.msSleep(3000);
        driver.swipe(100, 160, 100, 40);
        await Utils.msSleep(3000);
        Utils.registerEvent('testOnOverScroll002', true, 100034, done);
        await Utils.msSleep(3000)
        let button = await driver.findComponent(ON.id('WebViewControllerButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();

      })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0300
    * @tc.name       : testOnOverScrollStatic003
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testOnOverScrollStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testOnOverScroll003', 10)
        let driver: Driver = Driver.create();
        await Utils.msSleep(3000)
        driver.swipe(160, 100, 40, 100);
        await Utils.msSleep(3000);
        Utils.registerEvent('testOnOverScroll003', true, 100035, done);
        await Utils.msSleep(3000)
        let button = await driver.findComponent(ON.id('WebViewControllerButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_ONOVERSCROLL_0400
    * @tc.name       : testOnOverScrollStatic004
    * @tc.desc       : test onOverScroll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testOnOverScrollStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testOnOverScroll004', 10)
        let driver: Driver = Driver.create();
        await Utils.msSleep(3000)
        driver.swipe(40, 100, 160, 100);
        await Utils.msSleep(3000);
        Utils.registerEvent('testOnOverScroll004', true, 100036, done);
        await Utils.msSleep(3000)
        let button = await driver.findComponent(ON.id('WebViewControllerButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
  })
}
