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
import { Visibility,Position } from '@ohos.arkui.component';
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
export default function flex_AlignContent_SpaceBetween_TextOffsetTest() {
  describe('Flex_AlignContent_SpaceBetween_TextOffsetTest', () => {
    beforeAll(() => {
      console.info("flex_AlignContent_SpaceBetween_TextOffsetTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceBetween_TextOffsetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextOffset',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextOffsetTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextOffsetTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_AlignContent_SpaceBetween_TextOffsetTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_TextOffsetTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_TextOffsetTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_TextOffsetTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1000
     * @tc.name testFlexAlignContentSpaceAroundTextOffset
     * @tc.desc the offset of first subcomponent set to {x:10, y:10}
     */
    it('testFlexAlignContentSpaceAroundTextOffset_static', 0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextOffset] START');
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset02');
      let distanceBefore = secondText.top - firstText.bottom;
      let secondTextTop = secondText.top - firstText.top;
      GlobalContext.getContext().getObject<Position>('value')?.message.notify({
        name: 'offset', value: {
          x: 10, y: 10
        }
      })
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset01');
      secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextOffset_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceBetween_TextOffset_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('warp')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceBetween');
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(firstText.bottom - firstText.top) - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.bottom - secondText.top) - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - uiContext.vp2px(100)) <= 1).assertTrue();

      expect(Math.abs(firstText.top - flexContainer.top - uiContext.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(firstText.left - flexContainer.left - uiContext.vp2px(10)) <= 1).assertTrue(); //offset =10
      expect(Math.abs(flexContainer.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.bottom - flexContainer.bottom) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(distanceBefore)) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextOffset] END');

    });
  })
}
