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
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';

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
import { UtilsTest } from '../../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function flex_AlignContent_SpaceBetween_FlexPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexPadTest', () => {
    beforeAll(() => {
      console.info("flex_AlignContent_SpaceBetween_FlexPadTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/richEditorApi/Flex_AlignContent_SpaceBetween_FlexPadTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexPadTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexPadTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_AlignContent_SpaceBetween_FlexPadTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexPadTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400
     * @tc.name testAlignContentSpaceAroundFlexPadOverflow
     * @tc.desc The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('testAlignContentSpaceAroundFlexPadOverflow_static', 0, async () => {
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'padding', value: 50
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');
      const uiContext = new UIContext();
      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - fourthText.top) - uiContext.vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - uiContext.vp2px(50))) <= 1).assertTrue(); //padding =50
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - uiContext.vp2px(50))) <= 1).assertTrue(); //padding =50
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - fourthText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - flexContainer.bottom) - uiContext.vp2px(10))) <= 1).assertTrue();
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500
     * @tc.name testAlignContentSpaceAroundFlexPadMeet
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding of parent component was changed
     */
    it('testAlignContentSpaceAroundFlexPadMeet_static', 0, async () => {
      console.info('[testAlignContentSpaceAroundFlexPadMeet] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');
      const uiContext = new UIContext();
      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - fourthText.top) - uiContext.vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - uiContext.vp2px(10))) <= 1).assertTrue(); //padding =10
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - fourthText.bottom) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.top - firstText.bottom) - (thirdText.top - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - secondText.bottom) - (fourthText.top - thirdText.bottom))) <= 1)
        .assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] END');

    });
  })
}
