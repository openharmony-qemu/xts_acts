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
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import {GlobalContext} from '../../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { Visibility } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function AlignContent_Start_FlexP_Fixed_Visibility() {

  describe('AlignContent_Start_FlexP_Fixed_Visibility', () => {
    beforeAll(() => {
      console.info("AlignContent_Start_FlexP_Fixed_Visibility beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContent_Start_FlexP_Fixed_Visibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Start/AlignContent_Start_FlexP_Fixed_Visibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContent_Start_FlexP_Fixed_Visibility state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get AlignContent_Start_FlexP_Fixed_Visibility pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AlignContent_Start_FlexP_Fixed_Visibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_Start_FlexP_Fixed_Visibility page error:" + err);
      }
      console.info("AlignContent_Start_FlexP_Fixed_Visibility beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_Start_FlexP_Fixed_Visibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_START_1300
     * @tc.name testAlignContentStartFlexfixedVisibilityHidden
     * @tc.desc Set the visibility property of the child component to Visibility.Hidden.
     */

    it('testAlignContentStartFlexfixedVisibilityHidden_static', 0, async () => {
      console.info('testAlignContentStartFlexfixedVisibilityHidden START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.Hidden
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_flex001');

      let textStrJson = inspector.getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_1');

      // console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parseJsonElement(strJson)));
      // console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor')));
      let AlignContentFlexStart_flex001: RectValue =
      CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Start_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex001));
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));
      const uiContext = new UIContext();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Start");
      //expect(JSON.parseJsonElement(textStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");

      expect(Math.abs(Math.round(AlignContentFlexStart_2.top) - Math.round(AlignContentFlexStart_3.top)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_2.top) - Math.round(AlignContentFlexStart_flex001.top)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(AlignContentFlexStart_2.left - AlignContentFlexStart_flex001.left) - Math.round(uiContext.vp2px(150))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(AlignContentFlexStart_4.top - AlignContentFlexStart_flex001.top) - Math.round(uiContext.vp2px(150))) <= 1)
        .assertTrue();


      console.info('testAlignContentStartFlexfixedVisibilityHidden END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_START_1400
     * @tc.name testAlignContentStartFlexfixedVisibilityNone
     * @tc.desc Set the visibility property of the child component to Visibility.None.
     */

    it('testAlignContentStartFlexfixedVisibilityNone_static', 0, async () => {
      console.info('testAlignContentStartFlexfixedVisibilityNone START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.None
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_flex001');

      let textStrJson = inspector.getInspectorByKey('AlignContent_Start_FlexP_Fixed_Visibility_1');

      let AlignContentFlexStart_flex002: RectValue =
      CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexStart_2: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_2');
      let AlignContentFlexStart_3: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_3');
      let AlignContentFlexStart_4: RectValue = CommonFunc.getComponentRect('AlignContent_Start_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_Start_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_flex002))
      console.log('AlignContentFlexStart_2 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_2));
      console.log('AlignContentFlexStart_3 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_3));
      console.log('AlignContentFlexStart_4 rect_value is:' +
      JSON.stringify(AlignContentFlexStart_4));
      const uiContext = new UIContext();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.bottom - AlignContentFlexStart_2.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.bottom - AlignContentFlexStart_3.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.bottom - AlignContentFlexStart_4.top) - Math.round(uiContext.vp2px(200))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_2.right - AlignContentFlexStart_2.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_3.right - AlignContentFlexStart_3.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(AlignContentFlexStart_4.right - AlignContentFlexStart_4.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Start");
      //expect(JSON.parseJsonElement(textStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");

      expect(AlignContentFlexStart_2.top).assertEqual(AlignContentFlexStart_3.top);
      expect(AlignContentFlexStart_4.top).assertEqual(AlignContentFlexStart_3.top);
      expect(AlignContentFlexStart_2.top).assertEqual(AlignContentFlexStart_flex002.top);
      expect(AlignContentFlexStart_2.left).assertEqual(AlignContentFlexStart_flex002.left);

      console.info('testAlignContentStartFlexfixedVisibilityNone END');

    });
  })
}
