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
import events_emitter from '@ohos.events.emitter';
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
export default function flex_NoWrap_PaddingTest() {
  describe('Flex_NoWrap_PaddingTest', () => {
    beforeAll(() => {
      console.info("Flex_NoWrap_PaddingTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_NoWrap_PaddingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_Padding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_NoWrap_PaddingTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_NoWrap_PaddingTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_NoWrap_PaddingTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_PaddingTest page error:" + err);
      }
      console.info("Flex_NoWrap_PaddingTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 0
      })
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_Padding after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_1500
     * @tc.name testWrapNoWrapFlexPaddingOverflow
     * @tc.desc The size of the parent component in the main axis direction is not enough for
     *               the layout of the child components when the parent component set padding
     */
    it('testWrapNoWrapFlexPaddingOverflow_static', 0, async () => {
      console.info('[testWrapNoWrapFlexPaddingOverflow] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 60
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(uiContext.vp2px(60)))) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(380) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(uiContext.vp2px(60)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexPaddingOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_1600
     * @tc.name testWrapNoWrapFlexPaddingMeet
     * @tc.desc The size of the parent component in the main axis direction meets
     *               the layout of the child components when the parent component set padding
     */
    it('testWrapNoWrapFlexPaddingMeet_static', 0, async () => {
      console.info('[testWrapNoWrapFlexPaddingMeet] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.abs((Math.round(firstText.left - flexContainer.left)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(450) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(uiContext.vp2px(40)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(uiContext.vp2px(40)))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexPaddingMeet] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_1700
     * @tc.name testWrapNoWrapFlexMargin
     * @tc.desc The size of the parent component in the main axis direction meets
     *               the layout of the child components when the parent component set margin
     */
    it('testWrapNoWrapFlexMargin_static', 0, async () => {
      console.info('[testWrapNoWrapFlexMargin] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();

      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(firstText.top - columnContainer.top))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(450) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexMargin] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_1800
     * @tc.name testWrapNoWrapFlexMarPad
     * @tc.desc The size of the parent component in the main axis direction
     *               meets the layout of the child components when the parent component set margin and padding
     */
    it('testWrapNoWrapFlexMarPad_static', 0, async () => {
      console.info('[testWrapNoWrapFlexMarPad] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_flex_pad3');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_NoWrap_FlexPad_Container');
      let flexContainer: RectValue = CommonFunc.getComponentRect('NoWrap_FlexPad_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('NoWrap_FlexPad_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.top - columnContainer.top)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(firstText.top - columnContainer.top)) - (Math.round(uiContext.vp2px(40)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(440) / 3))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(uiContext.vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      console.info('[testWrapNoWrapFlexMarPad] END');

    });
  })
}
