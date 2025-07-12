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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function GaugePrivacySensitiveTest() {
  describe('GaugePrivacySensitiveTest', () => {
    beforeAll(() => {
      console.info("GaugePrivacySensitiveTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gauge/GaugePrivacySensitive",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    /* *
    * @tc.number: GaugePrivacySensitiveTest_static_001
    * @tc.name  : GaugePrivacySensitiveTest_static_001
    * @tc.desc  : To test the privacySensitive true
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GaugePrivacySensitiveTest_static_001 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_001 component obj is: ' +
      obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_static_001] END');
      done();
    });
    /* *
    * @tc.number: GaugePrivacySensitiveTest_static_002
    * @tc.name  : GaugePrivacySensitiveTest_static_002
    * @tc.desc  : To test the privacySensitive false
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GaugePrivacySensitiveTest_static_002 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_002 component obj is: ' +
      obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_static_002] END');
      done();
    });
    /* *
    * @tc.number: GaugePrivacySensitiveTest_static_003
    * @tc.name  : GaugePrivacySensitiveTest_static_003
    * @tc.desc  : To test the privacySensitive undefined
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GaugePrivacySensitiveTest_static_003 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_003 component obj is: ' +
      obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_static_003] END');
      done();
    });
    /* *
    * @tc.number: GaugePrivacySensitiveTest_static_004
    * @tc.name  : GaugePrivacySensitiveTest_static_004
    * @tc.desc  : To test the privacySensitive null
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('GaugePrivacySensitiveTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('GaugePrivacySensitiveTest_static_004 START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('nullFlag'));
      await Utils.sleep(1000);
      await (button?.click() as Promise<void>)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_004 component obj is: ' +
      obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_static_004] END');
      done();
    });
  })
}
