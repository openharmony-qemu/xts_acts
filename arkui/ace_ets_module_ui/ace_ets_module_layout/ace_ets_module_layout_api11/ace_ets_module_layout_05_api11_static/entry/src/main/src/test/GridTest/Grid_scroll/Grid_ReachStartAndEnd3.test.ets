/**
 * Copyright (c) 2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function Grid_ReachStartAndEnd3() {
  describe('Grid_ReachStartAndEnd3', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_ReachStartAndEnd3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_scroll/Grid_ReachStartAndEnd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_ReachStartAndEnd3 state pages: " + JSON.stringify(pages));
        if (!("blank3" == pages.name)) {
          console.info("get Grid_ReachStartAndEnd3 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_ReachStartAndEnd3 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      //router.back()
      // init the state
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let btn = await driver.findComponent(ON.id('grid_Reset_bt'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(3000);

      console.info("Grid_ReachStartAndEnd2 after each called");
    });

    /**
     * @tc.number SUB_ACE_Grid_ReachStartAndEnd3_0400
     * @tc.name Grid_ReachStartAndEnd3_static_0400
     * @tc.desc When initializing the Grid, an initialIndex of 0 will trigger an onReachStart event
     */
    it('Grid_ReachStartAndEnd3_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('[Grid_ReachStartAndEnd3_static_0400] START');
      let strJson = inspector.getInspectorByKey('Grid_ReachStartAndEnd_tex1');
     console.info("[Grid_ReachStartAndEnd3_static_0400] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)))
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onReachStart1');

      console.info('[Grid_ReachStartAndEnd3_static_0400] END');
      done();
    });


  })
}
