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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index";
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import {UtilsTest} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function tabsTransition() {
  describe('tabsTransition', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsTransition beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsTransition",
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get tabsTransition state pages:" + JSON.stringify(pages));
        if (!("tabsTransition" == pages.name)) {
          console.info("get tabsTransition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsTransition page result:");
        }
      } catch (err) {
        console.error("push tabsTransition page error:" + err);
      }
      console.info("tabsTransition beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("tabsCallBack3 after each called");
    });

    /**
     * @tc.number    tabsTransition_static_001
     * @tc.name      tabsTransition_static_0100
     * @tc.desc      Finger sliding can not trigger customContentTransition.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsTransition_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[tabsTransition_static_0100] START');
      let swiperTabs = CommonFunc.getComponentRectOnScreen('callback_tabs_tran');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabsTransition_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await driver.swipe(Math.round(left + width*0.9),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2));
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabs_callback_tran');
      console.info("[tabsTransition_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[tabsTransition_static_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('111');
      console.info('[tabsTransition_static_0100] END');
      done();
    });

    /**
     * @tc.number    tabsTransition_static_0200
     * @tc.name      tabsTransition_static_0200
     * @tc.desc      Clicking on the index to trigger the onTabBarClick event.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsTransition_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[tabsTransition_static_0200] START');
      let driver = Driver.create();
      let btn= await driver.findComponent(ON.text('3'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('tabs_tran_mes');
      console.info("[tabsTransition_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[tabsTransition_static_0200] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('tabs: onTabBarClick-');
      console.info('[tabsTransition_static_0200] END');
      done();
    });

  })
}
