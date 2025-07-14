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
import { Visibility } from '@ohos.arkui.component';
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
export default function flex_AlignContent_SpaceAround_TextVisibilityTest() {
  describe('Flex_AlignContent_SpaceAround_TextVisibilityTest', () => {
    beforeAll(() => {
      console.info("flex_AlignContent_SpaceAround_TextVisibilityTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceAround_TextVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_TextVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceAround_TextVisibilityTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_TextVisibilityTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_AlignContent_SpaceAround_TextVisibilityTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_TextVisibilityTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_TextVisibilityTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.Visible
      });
      console.info("Flex_AlignContent_SpaceAround_TextVisibilityTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1300
     * @tc.name testFlexAlignContentSpaceAroundTextVisibilityHidden
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the subcomponents when the visibility of first subcomponent set to Hidden
     */
    it('testFlexAlignContentSpaceAroundTextVisibilityHidden_static', 0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'visibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextVisibility_Container01');
        let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceAround_TextVisibility_Container01');

        expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceAround');

        let firstTextStrJson = inspector.getInspectorByKey('AlignContent_SpaceAround_TextVisibility01');
        expect(JSON.parseJsonElement(firstTextStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");

        const uiContext = new UIContext();
        expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(uiContext.vp2px(100))) <= 2).assertTrue();
        expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(uiContext.vp2px(50))) <= 2).assertTrue();
        expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(uiContext.vp2px(100))) <= 2).assertTrue();

        expect(Math.abs(Math.round(secondText.left) - Math.round(thirdText.left)) <= 2).assertTrue();
        expect(Math.abs(Math.round(thirdText.left) - Math.round(fourthText.left)) <= 2).assertTrue();

        expect(Math.abs(Math.round(fourthText.left) - Math.round(flexContainer.left)) <= 2).assertTrue();
        expect(Math.abs(Math.round((secondText.top - flexContainer.top) * 100) / 100 - Math.round((distanceBefore * 1.5 + uiContext.vp2px(50)) * 100) / 100) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round((thirdText.top - secondText.bottom) * 10) / 10 - Math.round(distanceBefore * 10) / 10) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((flexContainer.bottom - fourthText.bottom) * 100) / 100 - Math.round((distanceBefore / 2) * 100) / 100) <= 1)
          .assertTrue();

      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1400
     * @tc.name testFlexAlignContentSpaceAroundTextVisibilityNone
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the subcomponents when the visibility of first subcomponent set to None
     */
    it('testFlexAlignContentSpaceAroundTextVisibilityNone_static', 0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let distanceBefore = Math.round(secondText.top - firstText.bottom);
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'visibility', value: Visibility.None
        })
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextVisibility_Container01');
        let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceAround_TextVisibility_Container01');

        expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');
        expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceAround');

        let firstTextStrJson = inspector.getInspectorByKey('AlignContent_SpaceAround_TextVisibility01');
        expect(JSON.parseJsonElement(firstTextStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        const uiContext = new UIContext();
        expect(Math.abs(secondText.bottom - secondText.top) - uiContext.vp2px(100) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - thirdText.top) - uiContext.vp2px(50) <= 1).assertTrue();
        expect(Math.abs(fourthText.bottom - fourthText.top) - uiContext.vp2px(100) <= 1).assertTrue();

        expect(Math.abs(Math.round(secondText.left) - Math.round(thirdText.left)) <= 1).assertTrue();
        expect(Math.abs(Math.round(thirdText.left) - Math.round(fourthText.left)) <= 1).assertTrue();
        expect(Math.abs(Math.round(fourthText.left) - Math.round(flexContainer.left)) <= 1).assertTrue();

        expect(Math.abs(thirdText.top - secondText.bottom) - Math.abs(fourthText.top - thirdText.bottom) <= 1)
          .assertTrue();
        expect(Math.abs(thirdText.top - secondText.bottom) >= distanceBefore).assertTrue();

        expect(Math.abs(secondText.top - flexContainer.top) - Math.abs(flexContainer.bottom - fourthText.bottom) <= 1)
          .assertTrue();
        expect(Math.abs(secondText.top - flexContainer.top) - Math.round((thirdText.top - secondText.bottom) / 2) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityNone] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] END');

    });
  })
}
