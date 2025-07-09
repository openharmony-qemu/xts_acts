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
import { Component, UiWindow, ON, Driver, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function swiperCustomJsunit() {
  describe('swiperCustomJsunit', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("swiperCustomJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperCustom',
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get swiperCustomJsunit state pages: " + JSON.stringify(pages));
        if (!("swiperCustom" == pages.name)) {
          console.info("get swiperCustomJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperCustomJsunit success: ");
        }
      } catch (err) {
        console.error("push swiperCustomJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" swiperCustomJsunit after each called");
    });

    /* *
    * @tc.number: SUB_ACE_SWIPER_swiperCustomJsunit_static_0100
    * @tc.name  : swiperCustomJsunit_static_0100
    * @tc.desc  : Set to disable component navigation point interaction function.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('swiperCustomJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('swiperCustomJsunit_static_0100 START');
      let swiperOffset = CommonFunc.getComponentRectOnScreen('Swiper_Length');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("scrollOffsetJsunit_static_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await (driver?.swipe(Math.round(left + width*0.8),Math.round(bottom - height/2),Math.round(left + width*0.1),Math.round(bottom - height/2)) as Promise<void>);
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Swiper_Length');
      let strJson1 = inspector.getInspectorByKey('swiper_mess');
      let strJson2 = inspector.getInspectorByKey('swiper_texts');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[swiperCustomJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[swiperCustomJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[swiperCustomJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj.getElement('$attrs').getString('indicatorInteractive')).assertEqual('true');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onContentDidScroll');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('mainAxisLength');
      console.info('[swiperCustomJsunit_static_0100] END');
      done();
    });

  })
}
