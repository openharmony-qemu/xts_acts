/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level, afterEach, beforeAll } from '../../../../../../hypium/index'
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import {Alignment } from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AlignStart_AddPadding() {
  describe('AlignStart_AddPadding', () => {

    beforeAll(() => {
      console.info("SearchTypeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("richEditorApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddPadding',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get richEditorApi2 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get richEditorApi2 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push richEditorApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi2 page error:" + err);
      }
      console.info("richEditorApi2 beforeEach end");
    });

    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddPadding after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0300
     * @tc.name testFlexAlignStartFlexPadOverflow_static
     * @tc.desc After subtracting the padding from the parent component layout space, the interface display
     * that does not meet the spindle layout of the child component
     */
    it('testFlexAlignStartFlexPadOverflow_static', 0, async () : Promise<void>=> {
      console.info('[testFlexAlignStartFlexPadOverflow] START');
      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'DadPadding', value: 30
        });

      }

      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Start_AddPadding_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let Start_AddPadding_011: RectValue = CommonFunc.getComponentRect('Start_AddPadding_011');
      let Start_AddPadding_012: RectValue = CommonFunc.getComponentRect('Start_AddPadding_012');
      let Start_AddPadding_013: RectValue = CommonFunc.getComponentRect('Start_AddPadding_013');
      let Start_AddPadding_01: RectValue = CommonFunc.getComponentRect('Start_AddPadding_01');
      const uiContext = new UIContext();
      expect(Math.abs(Start_AddPadding_011.top - Start_AddPadding_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.top - Start_AddPadding_013.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.left - Start_AddPadding_011.right) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_013.left - Start_AddPadding_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.left - Start_AddPadding_01.left)) - (Math.round(uiContext.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_01.right - Start_AddPadding_013.right)) - (Math.round(uiContext.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.top - Start_AddPadding_01.top)) - (Math.round(uiContext.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.right - Start_AddPadding_011.left)) - (Math.round(uiContext.vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_012.right - Start_AddPadding_012.left)) - (Math.round(uiContext.vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.right - Start_AddPadding_013.left)) - (Math.round(uiContext.vp2px(440 / 3)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.bottom - Start_AddPadding_011.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Start_AddPadding_012.bottom - Start_AddPadding_012.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.bottom - Start_AddPadding_013.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignStartFlexPadOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0400
     * @tc.name testFlexAlignStartFlexPadMeet_static
     * @tc.desc After subtracting the padding from the parent component layout space, the interface that
     * satisfies the spindle layout of the child component is displayed
     */
    it('testFlexAlignStartFlexPadMeet_static', 0, async () : Promise<void>=> {
      console.info('[testFlexAlignStartFlexPadMeet] START');
      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'DadPadding', value: 20
        });

      }

      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Start_AddPadding_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let Start_AddPadding_011: RectValue = CommonFunc.getComponentRect('Start_AddPadding_011')
      let Start_AddPadding_012: RectValue = CommonFunc.getComponentRect('Start_AddPadding_012')
      let Start_AddPadding_013: RectValue = CommonFunc.getComponentRect('Start_AddPadding_013')
      let Start_AddPadding_01: RectValue = CommonFunc.getComponentRect('Start_AddPadding_01')
      const uiContext = new UIContext();
      expect(Math.abs(Start_AddPadding_011.top - Start_AddPadding_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.top - Start_AddPadding_013.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_012.left - Start_AddPadding_011.right) <= 1).assertTrue();
      expect(Math.abs(Start_AddPadding_013.left - Start_AddPadding_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.left - Start_AddPadding_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_01.right - Start_AddPadding_013.right)) - (Math.round(uiContext.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.top - Start_AddPadding_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.right - Start_AddPadding_011.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_012.right - Start_AddPadding_012.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.right - Start_AddPadding_013.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_011.bottom - Start_AddPadding_011.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Start_AddPadding_012.bottom - Start_AddPadding_012.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Start_AddPadding_013.bottom - Start_AddPadding_013.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignStartFlexPadMeet] END');

    });
  })
}
