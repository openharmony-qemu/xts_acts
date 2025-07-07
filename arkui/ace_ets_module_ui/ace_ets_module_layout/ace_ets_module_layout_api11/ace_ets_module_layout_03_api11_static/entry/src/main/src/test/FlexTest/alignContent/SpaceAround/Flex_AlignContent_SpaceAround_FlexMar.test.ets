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
export default function flex_AlignContent_SpaceAround_FlexMarTest() {
  describe('Flex_AlignContent_SpaceAround_FlexMarTest', () => {
    beforeAll(() => {
      console.info("Flex_AlignContent_SpaceAround_FlexMarTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Flex_AlignContent_SpaceAround_FlexMarTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_FlexMar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Flex_AlignContent_SpaceAround_FlexMarTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_FlexMarTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Flex_AlignContent_SpaceAround_FlexMarTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_FlexMarTest page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_FlexMarTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceAround_FlexMarTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0100
     * @tc.name testFlexAlignContentSpaceAroundFlexMargin
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the child components when the margin of parent component set to 10
     */
    it('testFlexAlignContentSpaceAroundFlexMargin_static', 0, async () => {
      console.info('[testFlexAlignContentSpaceAroundFlexMargin] START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'margin', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_FlexMar_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Align_SpaceAround_FlexMar_Container01');
      let flexContainerStrJson = inspector.getInspectorByKey('FlexAlign_SpaceAround_FlexMar_Container01');

      expect(JSON.parseJsonElement(flexContainerStrJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$type').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.Wrap');
      expect(JSON.parseJsonElement(flexContainerStrJson).getElement('$type').getElement('constructor').getString('alignContent')).assertEqual('FlexAlign.SpaceAround');
      const uiContext = new UIContext();
      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.bottom - fourthText.top - uiContext.vp2px(100))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(flexContainer.top - columnContainer.top - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.left - flexContainer.left)) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondText.top - firstText.bottom)) - Math.abs(Math.round(thirdText.top - secondText.bottom)) <= 2)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom)) - Math.abs(Math.round(fourthText.top - thirdText.bottom)) <= 2)
        .assertTrue();

      expect(Math.abs(Math.round(firstText.top - flexContainer.top)) - Math.abs(Math.round(flexContainer.bottom - fourthText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(firstText.top - flexContainer.top)) - Math.abs(Math.round((secondText.top - firstText.bottom) / 2)) <= 1)
        .assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexMargin] END');

    });
  })
}
