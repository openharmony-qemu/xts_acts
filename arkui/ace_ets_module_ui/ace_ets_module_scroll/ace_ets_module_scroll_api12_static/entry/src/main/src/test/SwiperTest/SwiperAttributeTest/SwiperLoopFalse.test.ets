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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import text from "@ohos.graphics.text"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest} from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function SwiperLoopFalse() {
  describe('SwiperLoopFalse', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperLoopFalse beforeEach start");
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperLoopFalse state pages:" + JSON.stringify(pages));
        if (!("SwiperLoopFalse" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperLoopFalse"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperLoopFalse page result:");
        }
      } catch (err) {
        console.error("push SwiperLoopFalse page error:" + err);
      }
      console.info("SwiperLoopFalse foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperLoopFalse after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_3400
     * @tc.name       : SwiperLoopFalse_3400
     * @tc.desc       : set autoPlay and loop to true
     * @tc.level      : Level 1
     * @tc.type       : Function
     * @tc.size       :
     */
    it('SwiperLoopFalse_3400', 0, async (done: () => void): Promise<void> => {
      console.info('[SwiperLoopFalse_3400] START');

      let strJson = inspector.getInspectorByKey('swiperLoopFalse');
      console.info("[SwiperLoopFalse_3400] The loop value is " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('false');

      console.info('[SwiperLoopFalse_3400] END');
      done();
    });

  })
}
