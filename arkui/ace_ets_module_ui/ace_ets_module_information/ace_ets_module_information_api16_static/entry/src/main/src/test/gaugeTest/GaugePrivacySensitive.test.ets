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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function GaugePrivacySensitiveTest() {
  describe('GaugePrivacySensitiveTest', () => {
    beforeAll(() => {
      console.info("GaugePrivacySensitiveTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('GaugePrivacySensitiveTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/GaugePrivacySensitive',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get GaugePrivacySensitiveTest state pages:' + JSON.stringify(pages));
        if (!('GaugePrivacySensitive' == pages.name)) {
          console.info('get GaugePrivacySensitiveTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push GaugePrivacySensitiveTest page error:' + err);
      }
      console.info('GaugePrivacySensitiveTest beforeEach end');
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
      Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('trueFlag'));
      Utils.sleep(1000);
      button?.click()
      Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_001 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
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
      Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('falseFlag'));
      Utils.sleep(1000);
      button?.click()
      Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_002 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
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
      Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('undefinedFlag'));
      Utils.sleep(1000);
      button?.click()
      Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_003 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
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
      Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('nullFlag'));
      Utils.sleep(1000);
      button?.click()
      Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey('gauge');
      let obj = JSON.parseJsonElement(strJson);
      console.info('GaugePrivacySensitiveTest_static_004 component obj is: ' + obj.getElement('$attrs').getString('privacySensitive'));
      expect(obj.getElement('$attrs').getString('privacySensitive')).assertEqual('false');
      console.info('[GaugePrivacySensitiveTest_static_004] END');
      done();
    });
  })
}
