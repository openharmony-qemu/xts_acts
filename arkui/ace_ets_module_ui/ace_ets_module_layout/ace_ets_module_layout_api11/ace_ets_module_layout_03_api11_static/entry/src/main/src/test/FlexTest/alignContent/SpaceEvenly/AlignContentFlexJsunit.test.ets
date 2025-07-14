/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {GlobalContext} from '../../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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
export default function AlignContentFlexJsunit() {

  describe('AlignContentFlexJsunitTest', () => {
    beforeAll(() => {
      console.info("AlignContentFlexJsunitTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContentFlexJsunitTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceEvenly/AlignContentFlex',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContentFlexJsunitTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get AlignContentFlexJsunitTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AlignContentFlexJsunitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlexJsunitTest page error:" + err);
      }
      console.info("AlignContentFlexJsunitTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlexJsunit after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_0100
     * @tc.name testAlignContentSpaceEvenlyFlexHeightSatisfy
     * @tc.desc Set the alignContent property of the flex component to FlexAlign.SpaceEvenly and set the height of
     *               the flex component so that it meets the subcomponent size requirements.
     */

    it('testAlignContentSpaceEvenlyFlexHeightSatisfy_static', 0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexHeightSatisfy START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 360
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexSpaceEvenly_flex001');

      // console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parseJsonElement(strJson)));
      // console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor')));
      let AlignContentFlexSpaceEvenly_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_4');

      console.log('AlignContentFlexSpaceEvenly_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex001));

      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));
      const uiContext = new UIContext();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - Math.round(uiContext.vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.SpaceEvenly");

      expect(Math.abs((AlignContentFlexSpaceEvenly_flex001.bottom - AlignContentFlexSpaceEvenly_4.bottom) - (AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();

      expect(Math.abs((AlignContentFlexSpaceEvenly_4.top - AlignContentFlexSpaceEvenly_2.bottom) - (AlignContentFlexSpaceEvenly_1.top - AlignContentFlexSpaceEvenly_flex001.top)) <= 1)
        .assertTrue();

      console.info('testAlignContentSpaceEvenlyFlexHeightSatisfy END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEEVENLY_0200
     * @tc.name testAlignContentSpaceEvenlyFlexHeightNoSatisfy
     * @tc.desc Set the alignContent property of the flex component to FlexAlign.SpaceEvenly and set the height of
     *               the flex component so that it does not meet the subcomponent size requirements.
     */

    it('testAlignContentSpaceEvenlyFlexHeightNoSatisfy_static', 0, async () => {
      console.info('testAlignContentSpaceEvenlyFlexHeightNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 250
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexSpaceEvenly_flex001');

      let AlignContentFlexSpaceEvenly_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001');
      let AlignContentFlexSpaceEvenly_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_1');
      let AlignContentFlexSpaceEvenly_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_2');
      let AlignContentFlexSpaceEvenly_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_3');
      let AlignContentFlexSpaceEvenly_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexSpaceEvenly_flex001_4');

      console.log('AlignContentFlexSpaceEvenly_flex002 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_flex002))

      console.log('AlignContentFlexSpaceEvenly_1 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_1));
      console.log('AlignContentFlexSpaceEvenly_2 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_2));
      console.log('AlignContentFlexSpaceEvenly_3 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_3));
      console.log('AlignContentFlexSpaceEvenly_4 rect_value is:' +
      JSON.stringify(AlignContentFlexSpaceEvenly_4));
      const uiContext = new UIContext();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.bottom - AlignContentFlexSpaceEvenly_1.top) - Math.round(uiContext.vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.bottom - AlignContentFlexSpaceEvenly_2.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.bottom - AlignContentFlexSpaceEvenly_3.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.bottom - AlignContentFlexSpaceEvenly_4.top) - Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_1.right - AlignContentFlexSpaceEvenly_1.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_2.right - AlignContentFlexSpaceEvenly_2.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_3.right - AlignContentFlexSpaceEvenly_3.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexSpaceEvenly_4.right - AlignContentFlexSpaceEvenly_4.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.SpaceEvenly");

      expect(AlignContentFlexSpaceEvenly_1.top).assertEqual(AlignContentFlexSpaceEvenly_flex002.top);
      expect(AlignContentFlexSpaceEvenly_4.bottom).assertLarger(AlignContentFlexSpaceEvenly_flex002.bottom);
      expect(AlignContentFlexSpaceEvenly_2.bottom).assertEqual(AlignContentFlexSpaceEvenly_4.top);

      console.info('testAlignContentSpaceEvenlyFlexHeightNoSatisfy END');

    });
  })
}
