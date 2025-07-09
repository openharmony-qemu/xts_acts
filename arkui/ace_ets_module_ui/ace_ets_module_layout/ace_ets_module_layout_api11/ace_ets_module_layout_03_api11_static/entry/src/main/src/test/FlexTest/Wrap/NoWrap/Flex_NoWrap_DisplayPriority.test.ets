/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
 * limitations under the License.'../../../../../../hypium/index';
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function flex_NoWrap_DisplayPriorityTest() {
  describe('Flex_NoWrap_DisplayPriorityTest', () => {
    beforeAll(() => {
      console.info("Flex_NoWrap_DisplayPriorityTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_NoWrap_DisplayPriorityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_DisplayPriority',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_NoWrap_DisplayPriorityTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_NoWrap_DisplayPriorityTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_NoWrap_DisplayPriorityTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_DisplayPriorityTest page error:" + err);
      }
      console.info("Flex_NoWrap_DisplayPriorityTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_DisplayPriority after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0100
     * @tc.name testWrapNoWrapTextDisplayPriority
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *               of the child components when display_priority of the child components set different values
     */
    it('testWrapNoWrapTextDisplayPriority_static', 0, async () => {
      console.info('[testWrapNoWrapTextDisplayPriority] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'firstTextPriority', value: 1
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'secondTextPriority', value: 2
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'thirdTextPriority', value: 3
      });
      await CommonFunc.sleep(3000);
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_DisplayPriority02');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_DisplayPriority03');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_DisplayPriority_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_DisplayPriority_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(uiContext.vp2px(250)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((flexContainer.bottom) - (thirdText.bottom)) <= 1).assertTrue();
      console.info('[testWrapNoWrapTextDisplayPriority] END');

    });
  })
}
