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

import { beforeEach, afterEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { RenderStrategy } from '@ohos.arkui.component';

export default function BorderRadiusRenderStrategyTest() {
  describe('BorderRadiusRenderStrategyTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("BorderRadiusRenderStrategyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/borderRadius/BorderRadiusRenderStrategy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BorderRadiusRenderStrategyTest state pages:" + JSON.stringify(pages));
        if (!("BorderRadiusRenderStrategyTest" == pages.name)) {
          console.info("get BorderRadiusRenderStrategyTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push BorderRadiusRenderStrategyTest page error:" + err);
      }
      console.info("BorderRadiusRenderStrategyTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BorderRadiusRenderStrategyTest afterEach err: ' + JSON.stringify(err));
      }
      console.info("BorderRadiusRenderStrategyTest after each called");
    });

    /**
     * @tc.number   BorderRadiusRenderStrategyTest_static_0100
     * @tc.name     BorderRadiusRenderStrategyTest_static_0100
     * @tc.desc     BorderRadiusRenderStrategyTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('BorderRadiusRenderStrategyTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('BorderRadiusRenderStrategyTest_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BorderRadiusRenderStrategyTest_static_0100 err: ' + JSON.stringify(err));
      }

      console.info('[BorderRadiusRenderStrategyTest_static_0100] click undefined');
      try {
        let button1 = await driver.findComponent(ON.id('RenderStrategyUndefined'));
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BorderRadiusRenderStrategyTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('BorderRadiusRenderStrategy');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('renderStrategy')).assertEqual('FAST')

      console.info('[BorderRadiusRenderStrategyTest_static_0100] click Fast');
      try {
        let button2 = await driver.findComponent(ON.id('RenderStrategyFast'));
        await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BorderRadiusRenderStrategyTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('BorderRadiusRenderStrategy');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('renderStrategy')).assertEqual('FAST')

      console.info('[BorderRadiusRenderStrategyTest_static_0100] click OFFSCREEN');
      try {
        let button3 = await driver.findComponent(ON.id('RenderStrategyOffscreen'));
        await (button3?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BorderRadiusRenderStrategyTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson3 = inspector.getInspectorByKey('BorderRadiusRenderStrategy');
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj3.getElement('$attrs').getString('renderStrategy')).assertEqual('OFFSCREEN')

      console.info('BorderRadiusRenderStrategyTest_static_0100 END');
      done();
    });

    /**
     * @tc.number   BorderRadiusRenderStrategyTest_static_0200
     * @tc.name     BorderRadiusRenderStrategyTest_static_0200
     * @tc.desc     BorderRadiusRenderStrategyTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('BorderRadiusRenderStrategyTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('BorderRadiusRenderStrategyTest_static_0200 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BorderRadiusRenderStrategyTest_static_0200 err: ' + JSON.stringify(err));
      }

      expect(RenderStrategy.FAST).assertEqual(0);
      expect(RenderStrategy.OFFSCREEN).assertEqual(1);

      console.info('BorderRadiusRenderStrategyTest_static_0200 END');
      done();
    });
  })
}
