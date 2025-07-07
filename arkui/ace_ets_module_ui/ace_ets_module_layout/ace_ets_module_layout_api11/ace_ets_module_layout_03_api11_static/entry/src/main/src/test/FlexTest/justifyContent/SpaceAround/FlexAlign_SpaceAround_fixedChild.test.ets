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
import { GlobalContext } from '../../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
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
export default function flexAlign_SpaceAround_fixedChild() {
  describe('FlexAlign_SpaceAround_fixedChild', () => {
    beforeAll(() => {
      console.info("FlexAlign_SpaceAround_fixedChild beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexAlign_SpaceAround_fixedChild beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedChild',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexAlign_SpaceAround_fixedChild state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedChild pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push FlexAlign_SpaceAround_fixedChild page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedChild page error:" + err);
      }
      console.info("FlexAlign_SpaceAround_fixedChild beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedChild afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0100
     * @tc.name testAlignSpaceAroundRowNoWrapOutRange
     * @tc.desc The child component is fixed, and parent component is bound with width and height attributes,
     *               the layout space of parent is insufficient to meet the spindle layout requirements of child
     */
    it('testAlignSpaceAroundRowNoWrapOutRange_static', 0, async () => {
      console.info('new testAlignSpaceAroundRowNoWrapOutRange START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 200
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'width', value: 400
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceAround1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceAround');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceAround1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceAround2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceAround3');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceAround1');
      const uiContext = new UIContext();
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left) <= 2).assertTrue();
      expect(Math.abs(locationText1.right - locationText2.left) <= 2).assertTrue();
      expect(Math.abs(locationText2.right - locationText3.left) <= 2).assertTrue();
      expect(Math.abs(locationText3.right - locationFlex.right) <= 2).assertTrue();

      expect(Math.abs(locationText1.right - locationText1.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left -
        (locationText2.right - locationText2.left)) <= 2).assertTrue();
      expect(Math.abs(locationText2.right - locationText2.left - uiContext.vp2px(400 / 3)) <= 2).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapOutRange END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0200
     * @tc.name testAlignSpaceAroundRowNoWrapInRange
     * @tc.desc The child component is fixed, and parent component is bound with width and height attributes,
     *               the layout space of parent meets the spindle layout requirements of child
     */
    it('testAlignSpaceAroundRowNoWrapInRange_static', 0, async () => {
      console.info('new testAlignSpaceAroundRowNoWrapInRange START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 200
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'width', value: 500
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceAround1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceAround');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceAround1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceAround2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceAround3');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceAround1');
      const uiContext = new UIContext();
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText1.right - locationText1.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText2.right - locationText2.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right -
        (locationText3.left - locationText2.right)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right - uiContext.vp2px(50 / 3)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left -
        (locationFlex.right - locationText3.right)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left - uiContext.vp2px(25 / 3)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right -
        2 * (locationFlex.right - locationText3.right)) <= 2).assertTrue(); //
      console.info('new testAlignSpaceAroundRowNoWrapInRange END');

    });
  })
}