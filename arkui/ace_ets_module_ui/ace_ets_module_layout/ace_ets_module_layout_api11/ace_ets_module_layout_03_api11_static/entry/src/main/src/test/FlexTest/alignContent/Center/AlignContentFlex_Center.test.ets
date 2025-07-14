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
export default function AlignContentFlex_Center() {

  describe('AlignContentFlex_CenterTest', () => {
    beforeAll(() => {
      console.info("AlignContentFlex_CenterTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlignContentFlex_CenterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/Center/AlignContentFlex_Center',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AlignContentFlex_CenterTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get AlignContentFlex_CenterTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AlignContentFlex_CenterTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContentFlex_CenterTest page error:" + err);
      }
      console.info("AlignContentFlex_CenterTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000)
      console.info("AlignContentFlex_Center after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_CENTER_0100
     * @tc.name testAlignContentCenterFlexHeightSatisfy
     * @tc.desc The Flex component alignContent property is set to FlexAlign.Center, and the height of the Flex
     *               component meets the size requirements of the subcomponent.
     */

    it('testAlignContentCenterFlexHeightSatisfy_static', 0, async () => {
      console.info('testAlignContentCenterFlexHeightSatisfy START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 360
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexCenter_flex001');

      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor')));
      let AlignContentFlexCenter_flex001: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001');
      let AlignContentFlexCenter_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_1');
      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_4');

      console.log('AlignContentFlexCenter_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex001));

      console.log('AlignContentFlexCenter_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));
      const uiContext = new UIContext();
      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - uiContext.vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Center");

      expect(Math.abs((AlignContentFlexCenter_flex001.bottom - AlignContentFlexCenter_4.bottom) - (AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex001.top)) <= 1)
        .assertTrue();
      expect(Math.abs(AlignContentFlexCenter_4.top - AlignContentFlexCenter_2.bottom) <= 1).assertTrue();

      console.info('testAlignContentCenterFlexHeightSatisfy END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_Center_0200
     * @tc.name testAlignContentCenterFlexHeightNoSatisfy
     * @tc.desc The AlignContent property of the Flex component is set to FlexAlign.Center, and the height of the
     *               Flex component does not meet the size requirements of the subcomponent.
     */

    it('testAlignContentCenterFlexHeightNoSatisfy_static', 0, async () => {
      console.info('testAlignContentCenterFlexHeightNoSatisfy START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 250
      })
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('AlignContentFlexCenter_flex001');

      let AlignContentFlexCenter_flex002: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001');
      let AlignContentFlexCenter_1: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_1');
      let AlignContentFlexCenter_2: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_2');
      let AlignContentFlexCenter_3: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_3');
      let AlignContentFlexCenter_4: RectValue = CommonFunc.getComponentRect('AlignContentFlexCenter_flex001_4');

      console.log('AlignContentFlexCenter_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_flex002))

      console.log('AlignContentFlexCenter_1 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_1));
      console.log('AlignContentFlexCenter_2 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_2));
      console.log('AlignContentFlexCenter_3 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_3));
      console.log('AlignContentFlexCenter_4 rect_value is:' +
      JSON.stringify(AlignContentFlexCenter_4));
      const uiContext = new UIContext();
      expect(Math.abs((AlignContentFlexCenter_1.bottom - AlignContentFlexCenter_1.top) - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_2.top) - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.bottom - AlignContentFlexCenter_3.top) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.bottom - AlignContentFlexCenter_4.top) - uiContext.vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_1.right - AlignContentFlexCenter_1.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_2.right - AlignContentFlexCenter_2.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_3.right - AlignContentFlexCenter_3.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((AlignContentFlexCenter_4.right - AlignContentFlexCenter_4.left) - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual("FlexDirection.Row");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('alignContent')).assertEqual("FlexAlign.Center");

      expect(Math.abs(AlignContentFlexCenter_1.top - AlignContentFlexCenter_flex002.top) <= 1).assertTrue();
      expect(Math.abs(AlignContentFlexCenter_2.bottom - AlignContentFlexCenter_4.top) <= 1).assertTrue();
      expect(AlignContentFlexCenter_4.bottom).assertLarger(AlignContentFlexCenter_flex002.bottom);

      console.info('testAlignContentCenterFlexHeightNoSatisfy END');

    });
  })
}
