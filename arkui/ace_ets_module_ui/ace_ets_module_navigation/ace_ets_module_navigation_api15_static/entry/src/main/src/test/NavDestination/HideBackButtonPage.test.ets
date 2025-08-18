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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
export default function HideBackButtonPage() {
  describe('HideBackButtonPage', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("HideBackButtonPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/HideBackButtonPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get HideBackButtonPage state pages:" + JSON.stringify(pages));
        if (!("HideBackButtonPage" == pages.name)) {
          console.info("get HideBackButtonPage pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push HideBackButtonPage page error:" + err);
      }
      console.info("HideBackButtonPage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("HideBackButtonPage after each called");
    });


    /**
     * @tc.number    HideBackButtonPage_static_0100
     * @tc.name      HideBackButtonPage_static_0100
     * @tc.desc      Test HideBackButtonPage set hideBackButton is false
     * @tc.level     Level 2
     */
    it('HideBackButtonPage_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HideBackButtonPage_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('pushOneId')) as Promise<Component>);
      await btn1.click()
      console.info('[CustomTransitionPage_0100] btn1 click');
      await CommonFunc.sleep(500);

      let button = await (driver.findComponent(ON.type('BackButton')) as Promise<Component>);
      expect(button).assertEqual(null);

      console.info('HideBackButtonPage_static_0100 END');
      done();
    });

    /**
     * @tc.number    HideBackButtonPage_static_0200
     * @tc.name      HideBackButtonPage_static_0200
     * @tc.desc      Test HideBackButtonPage set hideBackButton is true
     * @tc.level     Level 2
     */
    it('HideBackButtonPage_static_0200',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HideBackButtonPage_static_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btnPop = await (driver.findComponent(ON.id('popId')) as Promise<Component>);
      await btnPop.click()
      await CommonFunc.sleep(500);

      let btn1 = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await btn1.click()
      console.info('[HideBackButtonPage_static_0200] btn1 click');
      await CommonFunc.sleep(500);

      await driver.assertComponentExist(ON.type('BackButton'));

      console.info('HideBackButtonPage_static_0200 END');
      done();
    });


    /**
     * @tc.number    HideBackButtonPage_static_0300
     * @tc.name      HideBackButtonPage_static_0300
     * @tc.desc      Test HideBackButtonPage set hideBackButton is null
     * @tc.level     Level 2
     */
    it('HideBackButtonPage_static_0300',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HideBackButtonPage_static_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btnPop = await (driver.findComponent(ON.id('popId')) as Promise<Component>);
      await btnPop.click()
      await CommonFunc.sleep(500);

      let btn1 = await (driver.findComponent(ON.id('pageThreeId')) as Promise<Component>);
      await btn1.click()
      console.info('[HideBackButtonPage_static_0300] btn1 click');
      await CommonFunc.sleep(500);

      await driver.assertComponentExist(ON.type('BackButton'));

      console.info('HideBackButtonPage_static_0300 END');
      done();
    });

    /**
     * @tc.number    HideBackButtonPage_static_0400
     * @tc.name      HideBackButtonPage_static_0400
     * @tc.desc      Test HideBackButtonPage set hideBackButton is undefined
     * @tc.level     Level 2
     */
    it('HideBackButtonPage_static_0400',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HideBackButtonPage_static_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btnPop = await (driver.findComponent(ON.id('popId')) as Promise<Component>);
      await btnPop.click()
      await CommonFunc.sleep(500);

      let btn1 = await (driver.findComponent(ON.id('pushFourId')) as Promise<Component>);
      await btn1.click()
      console.info('[HideBackButtonPage_static_0300] btn1 click');
      await CommonFunc.sleep(500);

      await driver.assertComponentExist(ON.type('BackButton'));

      console.info('HideBackButtonPage_static_0400 END');
      done();
    });

  })
}