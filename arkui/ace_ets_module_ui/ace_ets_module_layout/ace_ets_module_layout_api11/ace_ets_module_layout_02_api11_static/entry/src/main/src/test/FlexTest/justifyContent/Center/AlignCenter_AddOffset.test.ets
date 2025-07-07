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

export default function AlignCenter_AddOffset() {
  describe('AlignCenter_AddOffset', () => {

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
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddOffset'
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


    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddOffset after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_0900
     * @tc.name testFlexAlignCenterTextOffset_static
     * @tc.desc the offset of fist subcomponent set to "{ x: 10, y: 15 }"
     */
    it('testFlexAlignCenterTextOffset_static', 0, async () : Promise<void> => {
      console.info('[testFlexAlignCenterTextOffset] START');
      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'height', value:0
          /*{
            x: 10, y: 15
          } */
        });

      }

      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Center_AddAlign_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Center');
      let Center_AddOffset_011: RectValue = CommonFunc.getComponentRect('Center_AddOffset_011');
      let Center_AddOffset_012: RectValue = CommonFunc.getComponentRect('Center_AddOffset_012');
      let Center_AddOffset_013: RectValue = CommonFunc.getComponentRect('Center_AddOffset_013');
      let Center_AddOffset_01: RectValue = CommonFunc.getComponentRect('Center_AddOffset_01');
      const uiContext = new UIContext();
      expect(Math.abs((Math.round((Center_AddOffset_011.top - Center_AddOffset_01.top) * 10) / 10) - (Math.round(uiContext.vp2px(15) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_AddOffset_011.left - Center_AddOffset_01.left) * 10) / 10) - (Math.round(uiContext.vp2px(35) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((Center_AddOffset_01.right - Center_AddOffset_013.right) * 10) / 10) - (Math.round(uiContext.vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      expect(Math.abs((Center_AddOffset_012.top) - (Center_AddOffset_013.top)) <= 1).assertTrue();
      expect(Math.abs((Center_AddOffset_012.top) - (Center_AddOffset_01.top)) <= 1).assertTrue();
      expect(Math.abs((Center_AddOffset_013.left) - (Center_AddOffset_012.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_011.right - Center_AddOffset_011.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_012.right - Center_AddOffset_012.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_013.right - Center_AddOffset_013.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_011.bottom - Center_AddOffset_011.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_012.bottom - Center_AddOffset_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Center_AddOffset_013.bottom - Center_AddOffset_013.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignCenterTextOffset] END');

    });
  })
}
