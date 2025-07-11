/**
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
import { Component, Driver } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from "@ohos.arkui.inspector";
// import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { Driver,  ON} from '@ohos.UiTest';
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
export default function ProgressPrivacySensitiveTest() {
  describe('ProgressPrivacySensitiveTest', () => {
    beforeAll(() => {
      console.info("ProgressPrivacySensitiveTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    /* *
    * @tc.number: ProgressPrivacySensitiveTest_static_001
    * @tc.name  : ProgressPrivacySensitiveTest_static_001
    * @tc.desc  : To test the privacySensitive true
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressPrivacySensitiveTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_static_001 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_static_001 component obj is: ' + obj.getElement('$attrs').getElement('privacySensitive'));
      expect(obj.getElement('$attrs').getElement('privacySensitive')).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_static_001] END');
      done();
    });
    /* *
    * @tc.number: ProgressPrivacySensitiveTest_static_002
    * @tc.name  : ProgressPrivacySensitiveTest_static_002
    * @tc.desc  : To test the privacySensitive false
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressPrivacySensitiveTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_static_002 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_static_002 component obj is: ' + obj.getElement('$attrs').getElement('privacySensitive'));
      expect(obj.getElement('$attrs').getElement('privacySensitive')).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_static_002] END');
      done();
    });
    /* *
    * @tc.number: ProgressPrivacySensitiveTest_static_003
    * @tc.name  : ProgressPrivacySensitiveTest_static_003
    * @tc.desc  : To test the privacySensitive undefined
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressPrivacySensitiveTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_static_003 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_static_003 component obj is: ' + obj.getElement('$attrs').getElement('privacySensitive'));
      expect(obj.getElement('$attrs').getElement('privacySensitive')).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_static_003] END');
      done();
    });
    /* *
    * @tc.number: ProgressPrivacySensitiveTest_static_004
    * @tc.name  : ProgressPrivacySensitiveTest_static_004
    * @tc.desc  : To test the privacySensitive null
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressPrivacySensitiveTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressPrivacySensitiveTest_static_004 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('nullFlag'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('progress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ProgressPrivacySensitiveTest_static_004 component obj is: ' + obj.getElement('$attrs').getElement('privacySensitive'));
      expect(obj.getElement('$attrs').getElement('privacySensitive')).assertEqual('false');
      console.info('[ProgressPrivacySensitiveTest_static_004] END');
      done();
    });
  })
}
