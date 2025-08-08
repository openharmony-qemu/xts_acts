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
interface WinRound {
  winLeft: number
  winTop: number
}
export default function NavigationEnableDragBar() {
  describe('NavigationEnableDragBar', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("NavigationEnableDragBar beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EnableDragBar/NavigationEnableDragBar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationEnableDragBar state pages:" + JSON.stringify(pages));
        if (!("NavigationEnableDragBar" == pages.name)) {
          console.info("get NavigationEnableDragBar pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NavigationEnableDragBar page error:" + err);
      }
      console.info("NavigationEnableDragBar beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("NavigationEnableDragBar after each called");
    });


    /**
     * @tc.number    NavigationEnableDragBar_static_0100
     * @tc.name      NavigationEnableDragBar_static_0100
     * @tc.desc      Test NavigationEnableDragBar
     * @tc.level     Level 2
     */
    it('NavigationEnableDragBar_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('NavigationEnableDragBar_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      // The pc device does not have a DragBar.
      if (AppStorage.get<WinRound>("winValue")?.winLeft == 0) {
        let btn1 = await (driver.findComponent(ON.id('drag_true')) as Promise<Component>);
        await btn1.click()
        console.info('[NavigationEnableDragBar_static_0100] click drag true');
        await CommonFunc.sleep(1000);
        await driver.assertComponentExist(ON.type('DragBarItem'));

        btn1 = await (driver.findComponent(ON.id('drag_false')) as Promise<Component>);
        await btn1.click()
        console.info('[NavigationEnableDragBar_static_0100] click drag false');
        await CommonFunc.sleep(1000);

        let comps = await (driver.findComponent(ON.type('DragBarItem')) as Promise<Component>);
        expect(comps).assertNull();
      }

      console.info('NavigationEnableDragBar_static_0100 END');
      done();
    });


  })
}