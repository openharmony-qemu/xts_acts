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
export default function NavigationBindToScrollable() {
  describe('NavigationBindToScrollable', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("NavigationBindToScrollable beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindToScrollable/NavigationBindToScrollable',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationBindToScrollable state pages:" + JSON.stringify(pages));
        if (!("NavigationBindToScrollable" == pages.name)) {
          console.info("get NavigationBindToScrollable pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NavigationBindToScrollable page error:" + err);
      }
      console.info("NavigationBindToScrollable beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("NavigationBindToScrollable after each called");
    });


    /**
     * @tc.number    NavigationBindToScrollable_static_0100
     * @tc.name      NavigationBindToScrollable_static_0100
     * @tc.desc      Test NavigationBindToScrollable
     * @tc.level     Level 2
     */
    it('NavigationBindToScrollable_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('NavigationBindToScrollable_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await (driver.findComponent(ON.text('push pageOne')) as Promise<Component>);
      await btn1.click()
      console.info('[NavigationBindToScrollable_static_0100] click push pageOne');
      await CommonFunc.sleep(1000);

      let navigation = await (driver.findComponent(ON.type('Navigation')) as Promise<Component>);
      let rect = await navigation.getBounds();
      let navigationWidth = rect.right;
      console.info('[NavigationBindToScrollable_static_0100] navigationWidth is ', navigationWidth);

      await driver.assertComponentExist(ON.type('TitleBar'));
      if (navigationWidth < 1500) {
        await driver.assertComponentExist(ON.type('ToolBar'));
        console.info('[NavigationBindToScrollable_static_0100] ToolBar is exist');
        await driver.delayMs(1000);
      }

      let scrollBar = await (driver.findComponent(ON.type('List')) as Promise<Component>);
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(5000);

      await driver.assertComponentExist(ON.type('TitleBar'));
      if (navigationWidth < 1500) {
        await driver.assertComponentExist(ON.type('ToolBar'));
        console.info('[NavigationBindToScrollable_static_0100] ToolBar is exist');
        await driver.delayMs(1000);
      }

      console.info('NavigationBindToScrollable_static_0100 END');
      done();
    });


  })
}