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
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
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

export default function row_TextFlexShrinkTest() {
  describe('Row_TextFlexShrinkTest', () => {
    beforeAll(() => {
      console.info("row_TextFlexShrinkTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("row_TextFlexShrinkTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextFlexShrink',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_TextFlexShrink state pages:" + "");
        if (!("Row_TextFlexShrink" == pages.name)) {
          console.info("get Row_TextFlexShrink pages.name:" + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Row_TextFlexShrink page result:" + "");
        }
      } catch (err) {
        console.error("push Row_TextFlexShrink page error:" + err);
      }
      console.info("Row_TextFlexShrink beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Row_TextFlexShrinkTest after each called");
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_1700
     * @tc.name testRowTextFlexShrink
     * @tc.desc The flexshink of the child components set to 1
     */
    it('testRowTextFlexShrink_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('[testRowTextFlexShrink_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'secondTextFlexShrink', value: 1
      });
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'thirdTextFlexShrink', value: 1
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink1');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink_Container01');
      let rowContainerStrJson = inspector.getInspectorByKey('Row_TextFlexShrink_Container01');

      let obj: Record<string, Object> = JSON.parse<Object>(rowContainerStrJson, Type.of(new String() as Object)) as Record<string, Object>;
      expect(obj['$type']).assertEqual('Row');
      const uiContext = new UIContext();
      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(uiContext.vp2px(90)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(uiContext.vp2px(90)))) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(secondText.top - rowContainer.top) - Math.round(rowContainer.bottom - secondText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(firstText.left - rowContainer.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left - firstText.right) - Math.round(thirdText.left - secondText.right)) <= 1)
        .assertTrue();

      expect(Math.abs(rowContainer.right - thirdText.right) <= 1).assertTrue();
      console.info('[testRowTextFlexShrink_static_01] END');
      done();
    });
  })
}
