/**
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

import { Component, Driver } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from "@ohos.arkui.inspector";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ProgressCapsuleRadius() {
 describe('ProgressCapsuleRadius', () => {
   beforeAll(() => {
     console.info("ProgressCapsuleRadius beforeEach start");
     await UtilsTest.loadAndSetUpUiTest();
     await UtilsTest.msSleep(4000)
     await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
     await UtilsTest.msSleep(4000)
   });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProgressCapsuleRadius after each called");
    });

    /**
     * @tc.number    testProgressCapsuleRadius0001
     * @tc.name      testProgressCapsuleRadius_static_0001
     * @tc.desc      Test progress capsule radius attributes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testProgressCapsuleRadius_static_0001', 0, async (done: () => void): Promise<void> => {
      console.info('testProgressCapsuleRadius0001 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let strJson = inspector.getInspectorByKey('ProgressCapsuleRadius');
      await driver.delayMs(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressCapsuleRadius0001] component width strJson:" + strJson);
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderRadius')).assertEqual("10.00px");
      console.info("[testProgressCapsuleRadius0001] borderRadius value :" + obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderRadius'));
      done();
    });

    /**
     * @tc.number    testProgressCapsuleRadius0002
     * @tc.name      testProgressCapsuleRadius_static_0002
     * @tc.desc      Test progress capsule radius attributes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testProgressCapsuleRadius_static_0002', 0, async (done: () => void): Promise<void> => {
      console.info('testProgressCapsuleRadius0002 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let strJson = inspector.getInspectorByKey('ProgressCapsuleRadius_negative');
      await driver.delayMs(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressCapsuleRadius0002] component width strJson:" + strJson);
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderRadius')).assertEqual("20.00px");
      console.info("[testProgressCapsuleRadius0002] borderRadius value :" + obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderRadius'));
      done();
    });

    /**
     * @tc.number    testProgressCapsuleRadius0003
     * @tc.name      testProgressCapsuleRadius_static_0003
     * @tc.desc      Test progress capsule radius attributes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testProgressCapsuleRadius_static_0003', 0, async (done: () => void): Promise<void> => {
      console.info('testProgressCapsuleRadius0003 START');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let strJson = inspector.getInspectorByKey('ProgressCapsuleRadius_big');
      await driver.delayMs(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testProgressCapsuleRadius0003] component width strJson:" + strJson);
      expect(obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderRadius')).assertEqual("20.00px");
      console.info("[testProgressCapsuleRadius0003] borderRadius value :" + obj.getElement('$attrs').getElement('capsuleStyle').getElement('borderRadius'));
      done();
    });
  })
}
