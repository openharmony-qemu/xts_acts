/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function FrameNodeTest() {
  describe('FrameNodeTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi20.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/framenode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get FrameNodeTest state pages: ' + JSON.stringify(pages));
        if (!('framenode' == pages.name)) {
          console.info('get FrameNodeTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error('push FrameNodeTest page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('FrameNodeTest after each called');
    });


    /*
     * @tc.number   FrameNodeTest_0010
     * @tc.name     FrameNodeTest_0010
     * @tc.desc     FrameNodeTest_0010
     * @tc.level    Level.LEVEL1
     */
    it('FrameNodeTest_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FrameNodeTest_0010 START');
      let driver = Driver.create();

      let button1 = await (driver.findComponent(ON.id('buttonTest')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('buttonTest');
      let obj = JSON.parseJsonElement(strJson);

      console.info('[FrameNodeTest_0010] label: ' + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('NORMAL');
      console.info('[FrameNodeTest_0010] END');
      done();
    });


    /*
     * @tc.number   FrameNodeTest_0020
     * @tc.name     FrameNodeTest_0020
     * @tc.desc     FrameNodeTest_0020
     * @tc.level    Level.LEVEL1
     */
    it('FrameNodeTest_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FrameNodeTest_0020 START');
      let driver1 = Driver.create();

      let button1 = await (driver1.findComponent(ON.id('buttonTest')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('buttonTest');
      let obj1 = JSON.parseJsonElement(strJson1);

      console.info('[FrameNodeTest_0020] backgroundColor: ' +
      JSON.stringify(obj1.getElement('$attrs').getString('backgroundColor')));
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');
      console.info('[FrameNodeTest_0020] END');
      done();
    });


    /*
     * @tc.number   FrameNodeTest_0030
     * @tc.name     FrameNodeTest_0030
     * @tc.desc     FrameNodeTest_0030
     * @tc.level    Level.LEVEL1
     */
    it('FrameNodeTest_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FrameNodeTest_0030 START');
      let driver2 = Driver.create();
      await driver2.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let button1 = await (driver2.findComponent(ON.id('buttonTest')) as Promise<Component>);
      let strJson2 = inspector.getInspectorByKey('buttonTest');
      let obj2 = JSON.parseJsonElement(strJson2);

      console.info('[FrameNodeTest_0030] label: ' + JSON.stringify(obj2.getElement('$attrs').getString('label')));
      expect(obj2.getElement('$attrs').getString('label')).assertEqual('FOCUSED');
      console.info('[FrameNodeTest_0030] END');
      done();
    });


    /*
     * @tc.number   FrameNodeTest_0040
     * @tc.name     FrameNodeTest_0040
     * @tc.desc     FrameNodeTest_0040
     * @tc.level    Level.LEVEL1
     */
    it('FrameNodeTest_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FrameNodeTest_0040 START');
      let driver3 = Driver.create();

      let button2 = await (driver3.findComponent(ON.id('buttonDis')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(1000);

      let button1 = await (driver3.findComponent(ON.id('buttonTest')) as Promise<Component>);
      let strJson3 = inspector.getInspectorByKey('buttonTest');
      let obj3 = JSON.parseJsonElement(strJson3);

      console.info('[FrameNodeTest_0040] label: ' + JSON.stringify(obj3.getElement('$attrs').getString('label')));
      expect(obj3.getElement('$attrs').getString('label')).assertEqual('DISABLED');
      console.info('[FrameNodeTest_0040] END');
      done();
    });


    /*
     * @tc.number   FrameNodeTest_0050
     * @tc.name     FrameNodeTest_0050
     * @tc.desc     FrameNodeTest_0050
     * @tc.level    Level.LEVEL1
     */
    it('FrameNodeTest_0050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FrameNodeTest_0050 START');
      let driver4 = Driver.create();

      let button2 = await (driver4.findComponent(ON.id('buttonDis')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(1000);

      let button3 = await (driver4.findComponent(ON.id('remove')) as Promise<Component>);
      await button3.click();
      await CommonFunc.sleep(1000);

      let button1 = await (driver4.findComponent(ON.id('buttonTest')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson4 = inspector.getInspectorByKey('buttonTest');
      let obj4 = JSON.parseJsonElement(strJson4);

      console.info('[FrameNodeTest_0050] label: ' + JSON.stringify(obj4.getElement('$attrs').getString('label')));
      expect(obj4.getElement('$attrs').getString('label')).assertEqual('NORMAL');
      console.info('[FrameNodeTest_0050] END');
      done();
    });
  })
}