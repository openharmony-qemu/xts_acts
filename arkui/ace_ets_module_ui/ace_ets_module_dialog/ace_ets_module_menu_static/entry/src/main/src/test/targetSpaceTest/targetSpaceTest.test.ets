'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, MouseButton, Point } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, Rect } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function targetSpaceTest(): void{
  describe('targetSpaceTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('==============================');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/targetSpace/targetSpaceTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get targetSpaceTest pages:' + JSON.stringify(pages));
        if (!('targetSpaceTest' == pages.name)) {
          console.info('get targetSpaceTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push targetSpaceTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
        console.info('targetSpaceTest after each called');
      } catch (err) {
        console.info('targetSpaceTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   targetSpaceTest_0100
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0100
     * @tc.desc   test the Menu_static targetSpace percent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('targetSpaceTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0100] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button1 = await driver.findComponent(ON.id('percent'));
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn1 = await driver.findComponent(ON.id('menu'));
        expect(btn1 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect1 = await (btn1?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0100 height: ' + JSON.stringify(rect1));
        console.info('targetSpaceTest_0100 top: ' + rect1.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect1.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button1?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0100] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   targetSpaceTest_0200
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0200
     * @tc.desc   test the Menu_static targetSpace vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('targetSpaceTest_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0200] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button2 = await driver.findComponent(ON.id('vp'));
        await (button2?.click() as Promise<void>);
        // await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn2 = await driver.findComponent(ON.id('menu'));
        expect(btn2 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect2 = await (btn2?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0200 height: ' + JSON.stringify(rect2));
        console.info('targetSpaceTest_0200 top: ' + rect2.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect2.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button2?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0200] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   targetSpaceTest_0300
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0300
     * @tc.desc   test the Menu_static targetSpace px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('targetSpaceTest_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0300] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button3 = await driver.findComponent(ON.id('px'));
        await (button3?.click() as Promise<void>);
        // await (button3?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn3 = await driver.findComponent(ON.id('menu'));
        expect(btn3 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect3 = await (btn3?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0300 height: ' + JSON.stringify(rect3));
        console.info('targetSpaceTest_0300 top: ' + rect3.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect3.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button3?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0300] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   targetSpaceTest_0400
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0400
     * @tc.desc   test the Menu_static targetSpace fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('targetSpaceTest_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0400] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button4 = await driver.findComponent(ON.id('fp'));
        await (button4?.click() as Promise<void>);
        // await (button4?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn4 = await driver.findComponent(ON.id('menu'));
        expect(btn4 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect4 = await (btn4?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0400 height: ' + JSON.stringify(rect4));
        console.info('targetSpaceTest_0400 top: ' + rect4.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect4.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button4?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0400] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   targetSpaceTest_0500
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0500
     * @tc.desc   test the Menu_static targetSpace lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('targetSpaceTest_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0500] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button5 = await driver.findComponent(ON.id('lpx'));
        await (button5?.click() as Promise<void>);
        // await (button5?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn5 = await driver.findComponent(ON.id('menu'));
        expect(btn5 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect5 = await (btn5?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0500 height: ' + JSON.stringify(rect5));
        console.info('targetSpaceTest_0500 top: ' + rect5.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect5.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button5?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0500] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   targetSpaceTest_0600
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0600
     * @tc.desc   test the Menu_static targetSpace 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('targetSpaceTest_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0600] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button6 = await driver.findComponent(ON.id('0'));
        await (button6?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn6 = await driver.findComponent(ON.id('menu'));
        expect(btn6 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect6 = await (btn6?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0600 height: ' + JSON.stringify(rect6));
        console.info('targetSpaceTest_0600 top: ' + rect6.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect6.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button6?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0600] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   targetSpaceTest_0700
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0700
     * @tc.desc   test the Menu_static targetSpace -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('targetSpaceTest_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0700] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button7 = await driver.findComponent(ON.id('-1'));
        await (button7?.click() as Promise<void>);
        // await (button7?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn7 = await driver.findComponent(ON.id('menu'));
        expect(btn7 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect7 = await (btn7?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0700 height: ' + JSON.stringify(rect7));
        console.info('targetSpaceTest_0700 top: ' + rect7.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect7.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button7?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0700] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   targetSpaceTest_0800
     * @tc.number SUB_ARKUI_MENU_targetSpaceTest_0800
     * @tc.desc   test the Menu_static targetSpace undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('targetSpaceTest_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[targetSpaceTest_0800] START');
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);

        let button8 = await driver.findComponent(ON.id('undefined'));
        await (button8?.click() as Promise<void>);
        // await (button8?.click() as Promise<void>);
        await CommonFunc.sleep(1500);

        const btn8 = await driver.findComponent(ON.id('menu'));
        expect(btn8 !== null).assertTrue();
        await CommonFunc.sleep(500);

        const rect8 = await (btn8?.getBounds() as Promise<Rect>)
        console.info('targetSpaceTest_0800 height: ' + JSON.stringify(rect8));
        console.info('targetSpaceTest_0800 top: ' + rect8.top);
        await CommonFunc.sleep(1500);

        expect(Math.round(rect8.top) > 0).assertTrue();
        await CommonFunc.sleep(1500);
        await (button8?.click() as Promise<void>);
        await CommonFunc.sleep(1500);
        console.info('[targetSpaceTest_0800] END')
        done();
      } catch (err) {
        console.info('targetSpaceTest err: ' + JSON.stringify(err));
        done();
      }
    });
  })
}