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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
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

export default function tabsAnimationDuration() {
  describe('tabsAnimationDuration', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabsAnimationDuration beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsAnimationDuration',
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get tabsAnimationDuration state pages: " + JSON.stringify(pages));
        if (!("tabsAnimationDuration" == pages.name)) {
          console.info("get tabsAnimationDuration state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsAnimationDuration success: ");
        }
      } catch (err) {
        console.error("push tabsAnimationDuration page error: " + err);
        expect().assertFail();
      }
    });

    /**
    * @tc.number: SUB_ACE_Tabs_ANIMATIOnDuration_static_0100
    * @tc.name  : tabsAnimationDuration_static_0100
    * @tc.desc  : Set animationDuration for tabs switch animation
    * @tc.level : Level 1
    * @tc.type :
    * @tc.size :
    */
    it('tabsAnimationDuration_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('tabsAnimationDuration_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('animationDuration_1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[tabsAnimationDuration_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[tabsAnimationDuration_static_0100] animationDuration1: " + JSON.stringify(obj1.getElement('$attrs').getDouble('animationDuration')));
      expect(obj1.getElement('$attrs').getDouble('animationDuration')).assertEqual(300);

      let strJson2 = inspector.getInspectorByKey('animationDuration_2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[tabsAnimationDuration_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getDouble('animationDuration')).assertEqual(600);
      console.info('[tabsAnimationDuration_static_0100] END');
      done();
    });
  })
}