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
export default function flex_Wrap_FlexSizeTest() {
  describe('flex_Wrap_FlexSizeTest', () => {
    beforeAll(() => {
      console.info("flex_Wrap_FlexSizeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex_Wrap_FlexSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_FlexSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flex_Wrap_FlexSizeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get flex_Wrap_FlexSizeTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flex_Wrap_FlexSizeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flex_Wrap_FlexSizeTest page error:" + err);
      }
      console.info("flex_Wrap_FlexSizeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("flex_Wrap_FlexSizeTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1100
     * @tc.name wrap_Wrap_FlexSize
     * @tc.desc The size of the parent component in the main axis direction
     *               meets the layout of the child components
     */
    it('SUB_ACE_FLEXWRAP_WRAP_static_1100', 0, async () => {
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1100] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'width', value: 500
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 200
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Wrap_FlexSize_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1100] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1200
     * @tc.name wrap_Wrap_FlexSize
     * @tc.desc The size of the parent component in the main axis direction
     *               is not enough for the layout of the child components,and the cross axis meets
     */
    it('SUB_ACE_FLEXWRAP_WRAP_static_1200', 0, async () => {
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1200] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'width', value: 400
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 260
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Wrap_FlexSize_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();
      expect(Math.abs((thirdText.top) - (secondText.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1200] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXWRAP_WRAP_1300
     * @tc.name wrap_Wrap_FlexSize
     * @tc.desc The size of the parent component in the main axis direction
     *               is not enough for the layout of the child componentsand,and the cross axis as well
     */
    it('SUB_ACE_FLEXWRAP_WRAP_static_1300', 0, async () => {
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1300] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'width', value: 350
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 150
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text1');
      let secondText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Wrap_flexSize_Text3');
      let flexContainer: RectValue = CommonFunc.getComponentRect('Wrap_FlexSize_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('Wrap_FlexSize_Container01');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();
      expect(Math.abs((thirdText.top) - (secondText.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1300] END');

    });
  })
}
