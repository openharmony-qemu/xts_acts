/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import RectValue from '../../../ets/MainAbility/common/Rect';
import text from "@ohos.graphics.text"
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function RelativeContainerApi1() {
  describe('RelativeContainerApi1', (): void => {
    beforeAll(() => {
      console.info("RelativeContainerApi1 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("RelativeContainerApi1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainerApi1",
      }
      try {

        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeContainerApi1 state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerApi1" == pages.name)) {
          console.info("get RelativeContainerApi1 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RelativeContainerApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainerApi1 page error:" + err);
      }
      console.info("RelativeContainerApi1 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeContainerApi1 after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_Text_0010
     * @tc.name       : RelativeContainerApi1_001
     * @tc.desc       : Text Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('RelativeContainerApi1_static_001',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RelativeContainerApi1_001] START');
      await CommonFunc.sleep(1000);

      let row: RectValue = CommonFunc.getComponentRectOnScreen('row1');
      let row11: RectValue = CommonFunc.getComponentRectOnScreen('row11');
      let rel: RectValue = CommonFunc.getComponentRectOnScreen('RelativeContainerApi1');
      let rel2: RectValue = CommonFunc.getComponentRectOnScreen('RelativeContainerApi2');
      await CommonFunc.sleep(1000);

      console.info("[RelativeContainerApi1_001] RelativeContainerTop is: " + row.top);
      console.info("[RelativeContainerApi1_001] RelativeContainer left is: " + rel.top);
      console.info("[RelativeContainerApi1_001] RelativeContainerTop is: " + row11.top);
      console.info("[RelativeContainerApi1_001] RelativeContainer left is: " + rel2.top);
      expect(Math.abs(Math.round(row.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row11.top - rel2.top)) <= 1).assertTrue();
      await CommonFunc.sleep(1000);

      console.info('[RelativeContainerApi1_001] END');
      done();
    });







  })
}
