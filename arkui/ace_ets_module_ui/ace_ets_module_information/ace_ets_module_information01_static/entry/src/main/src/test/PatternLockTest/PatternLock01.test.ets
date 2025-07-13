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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from "@ohos.arkui.inspector";
import { Driver, ON } from '@ohos.UiTest';
import { UtilsTest } from '../Util.test';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function patternLockJsunit01() {
  describe('patternLockTest01', () => {
    beforeAll(() => {
      console.info("patternLockTest01 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    /**
     * @tc.number patternLockTest_0001
     * @tc.name patternLockTest_static_0010
     * @tc.desc Set sideLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0010', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0001 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0001 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('sideLength')).assertEqual("0.00vp");
      console.info('patternLockTest_0001 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0002
     * @tc.name patternLockTest_static_0020
     * @tc.desc Set circleRadius values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0020', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0002 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0002 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('circleRadius')).assertEqual("10.00vp");
      console.info('patternLockTest_0002 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0003
     * @tc.name patternLockTest_static_0030
     * @tc.desc Set selectedColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0030', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0003 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0003 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('selectedColor')).assertEqual("#FF123456");
      console.info('patternLockTest_0003 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0004
     * @tc.name patternLockTest_static_0040
     * @tc.desc Set regularColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0040', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0004 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0004 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('regularColor')).assertEqual("#FF123456");
      console.info('patternLockTest_0004 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0005
     * @tc.name patternLockTest_static_0050
     * @tc.desc Set activeColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0050', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0005 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0005 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('activeColor')).assertEqual("#FF123456");
      console.info('patternLockTest_0005 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0006
     * @tc.name patternLockTest_static_0060
     * @tc.desc Set pathColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0060', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0006 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0006 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('pathColor')).assertEqual("#FF123456");
      console.info('patternLockTest_0006 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0007
     * @tc.name patternLockTest_static_0070
     * @tc.desc Set pathStrokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0070', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0007 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0007 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('pathStrokeWidth')).assertEqual("12.00vp");
      console.info('patternLockTest_0007 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0008
     * @tc.name patternLockTest_static_0080
     * @tc.desc Set autoReset values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0080', 0, async (done: () => void): Promise<void> => {
      console.info('patternLockTest_0008 START');
      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0008 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('autoReset')).assertEqual("true");
      console.info('patternLockTest_0008 END');
      done();
    });

    /**
     * @tc.number patternLockTest_0009
     * @tc.name patternLockTest_static_0090
     * @tc.desc Change sideLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('patternLockTest_static_0090', 0, async (done: () => void): Promise<void> => {

      console.info('patternLockTest_0009 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000)

      let strJsonNew = inspector.getInspectorByKey('patternLock');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("patternLockTest_0009 component  is: " + JSON.stringify(objNew.getElement('$attrs')));

      expect(objNew.getElement('$attrs').getString('sideLength')).assertEqual("0.00vp");
      console.info('patternLockTest_0009 END');
      done();
    });
  })
}