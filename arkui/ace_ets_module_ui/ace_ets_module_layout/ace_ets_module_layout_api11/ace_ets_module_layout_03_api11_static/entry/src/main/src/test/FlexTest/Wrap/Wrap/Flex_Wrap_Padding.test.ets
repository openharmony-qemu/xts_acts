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
export default function flex_Wrap_PaddingTest() {
  describe('Flex_Wrap_PaddingTest', () => {
    beforeAll(() => {
      console.info("Flex_Wrap_PaddingTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_Wrap_PaddingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_Padding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_Wrap_PaddingTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_Wrap_PaddingTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_Wrap_PaddingTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_PaddingTest page error:" + err);
      }
      console.info("Flex_Wrap_PaddingTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_Padding after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1500
     * @tc.name testWrapWrapFlexPaddingMeet
     * @tc.desc The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set padding
     */
    it('testWrapWrapFlexPaddingMeet_static', 0, async () => {
      console.info('[testWrapWrapFlexPaddingMeet] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_Wrap_Pad_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');

      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - (uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - uiContext.vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.right - thirdText.right) - uiContext.vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - uiContext.vp2px(140))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexPaddingMeet] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1600
     * @tc.name testWrapWrapFlexPaddingOverflow
     * @tc.desc The size of the parent component in the main axis direction
     *               is not enough for the layout of the child components when the parent component set padding
     */
    it('testWrapWrapFlexPaddingOverflow_static', 0, async () => {
      console.info('[testWrapWrapFlexPaddingOverflow] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 30
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_Wrap_Pad_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.right)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - uiContext.vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - uiContext.vp2px(170))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - uiContext.vp2px(20))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexPaddingOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1700
     * @tc.name testWrapWrapFlexMargin
     * @tc.desc The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set margin
     */
    it('testWrapWrapFlexMargin_static', 0, async () => {
      console.info('[testWrapWrapFlexMargin] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Wrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_Wrap_Pad_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - uiContext.vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.top - columnContainer.top) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.top - columnContainer.top) - (firstText.top - columnContainer.top))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - thirdText.right) - uiContext.vp2px(50))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMargin] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1800
     * @tc.name testWrapWrapFlexMarPad
     * @tc.desc The size of the parent component in the main axis direction is not enough for
     *               the layout of the child components when the parent component set margin and padding
     */
    it('testWrapWrapFlexMarPad_static', 0, async () => {
      console.info('[testWrapWrapFlexMarPad] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Flex_Wrap_Pad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Wrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Flex_Wrap_Pad_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');

      expect(Math.floor(Math.abs((flexContainer.top - columnContainer.top) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - columnContainer.top) - uiContext.vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - firstText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - uiContext.vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((flexContainer.bottom - thirdText.bottom) - uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((flexContainer.right - secondText.right) - uiContext.vp2px(170))) <= 1).assertTrue();
      console.info('[testWrapWrapFlexMarPad] END');

    });
  })
}
