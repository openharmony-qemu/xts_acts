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
export default function flex_NoWrap_FlexMarPad_TextMarPadTest() {
  describe('Flex_NoWrap_FlexMarPad_TextMarPadTest', () => {
    beforeAll(() => {
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_FlexMarPad_TextMarPad',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_NoWrap_FlexMarPad_TextMarPadTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_NoWrap_FlexMarPad_TextMarPadTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_NoWrap_FlexMarPad_TextMarPadTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_FlexMarPad_TextMarPadTest page error:" + err);
      }
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'firstTextMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'secondTextMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'thirdTextMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'firstTextPadding', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'secondTextPadding', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'thirdTextPadding', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 0
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_FlexMarPad_TextMarPadText after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0500
     * @tc.name testWrapNoWrapFlexMarPadTextPad
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set padding
     */
    it('testWrapNoWrapFlexMarPadTextPad_static', 0, async () => {
      console.info('[testWrapNoWrapFlexMarPadTextPad] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'firstTextPadding', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'secondTextPadding', value: 20
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'thirdTextPadding', value: 30
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.floor(Math.abs(flexContainer.left - columnContainer.left - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flexContainer.top - columnContainer.top - uiContext.vp2px(10))) <= 1).assertTrue(); //margin = 10

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - uiContext.vp2px(30))) <= 1).assertTrue(); //padding=30

      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - uiContext.vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.right - firstText.left - uiContext.vp2px(440) / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - uiContext.vp2px(30))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexMarPadTextPad] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0600
     * @tc.name testWrapNoWrapFlexMarPadTextMar
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when the parent components set padding and margin,and the child components set margin
     */
    it('testWrapNoWrapFlexMarPadTextMar_static', 0, async () => {
      console.info('[testWrapNoWrapFlexMarPadTextMar] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'firstTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'secondTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'thirdTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.floor(Math.abs(flexContainer.top - columnContainer.top - uiContext.vp2px(10))) <= 1).assertTrue(); //margin = 10
      expect(Math.floor(Math.abs(flexContainer.left - columnContainer.left - uiContext.vp2px(10))) <= 1).assertTrue(); //margin = 10

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - uiContext.vp2px(30))) <= 1).assertTrue(); //padding+margin=30

      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - uiContext.vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.right - firstText.left - uiContext.vp2px(400) / 3)) <= 2).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (thirdText.right - thirdText.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - firstText.right - uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - uiContext.vp2px(30))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - uiContext.vp2px(30))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexMarPadTextMar] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_NOWRAP_0700
     * @tc.name testWrapNoWrapFlexMarPadTextMarPad
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *   of the child components when all of components set padding and margin
     */
    it('testWrapNoWrapFlexMarPadTextMarPad_static', 0, async () => {
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'firstTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'secondTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'thirdTextMargin', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'firstTextPadding', value: 10
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'secondTextPadding', value: 20
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'thirdTextPadding', value: 30
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexMargin', value: 20
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'flexPadding', value: 30
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('NoWrap_FlexMarPad_TextPad3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexNoWrap_FlexMarPad_TextMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexNoWrap_FlexMarPad_TextMarPad_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.NoWrap');
      const uiContext = new UIContext();
      expect(Math.floor(Math.abs(flexContainer.top - columnContainer.top - uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flexContainer.left - columnContainer.left - uiContext.vp2px(20))) <= 1)
        .assertTrue(); //margin = 20

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - uiContext.vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - uiContext.vp2px(40))) <= 1)
        .assertTrue(); //flex_padding + margin=40
      expect(Math.floor(Math.abs(firstText.top - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.top - thirdText.top)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - uiContext.vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.right - firstText.left - uiContext.vp2px(380) / 3)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(firstText.right - firstText.left - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(secondText.left - firstText.right - uiContext.vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - secondText.right - uiContext.vp2px(20))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(flexContainer.right - thirdText.right - uiContext.vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - flexContainer.bottom - uiContext.vp2px(40))) <= 1).assertTrue();
      console.info('[testWrapNoWrapFlexMarPadTextMarPad] END');

    });
  })
}