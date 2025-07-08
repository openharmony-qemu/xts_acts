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
import { Visibility } from '@ohos.arkui.component';
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
export default function flexAlign_SpaceBetween_fixedParentVisibility() {
  describe('FlexAlign_SpaceBetween_fixedParentVisibility', () => {
    beforeAll(() => {
      console.info("FlexAlign_SpaceBetween_fixedParentVisibility beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexAlign_SpaceBetween_fixedParentVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedParentVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexAlign_SpaceBetween_fixedParentVisibility state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedParentVisibility pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push FlexAlign_SpaceBetween_fixedParentVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedParentVisibility page error:" + err);
      }
      console.info("FlexAlign_SpaceBetween_fixedParentVisibility beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedParentVisibility afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1000
     * @tc.name testAlignSpaceBetweenRowNoWrapVisibilityNone
     * @tc.desc Parent component fixed, child component binding visibility none properties
     */
    it('testAlignSpaceBetweenRowNoWrapVisibilityNone_static', 0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapVisibilityNone START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.None
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceBetween10');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceBetween');
      let strJson2 = inspector.getInspectorByKey('AlignSpaceBetween28');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween28');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween29');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween30');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween10');
      const uiContext = new UIContext();
      expect(Math.abs((locationText1.top) - (locationText2.top)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationFlex.top)) - (uiContext.vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationFlex.left)) - (uiContext.vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.left - locationText2.right)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapVisibilityNone END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_1100
     * @tc.name testAlignSpaceBetweenRowNoWrapVisibilityHidden
     * @tc.desc Parent component fixed, child component binding visibility hidden properties
     */
    it('testAlignSpaceBetweenRowNoWrapVisibilityHidden_static', 0, async () => {
      console.info('new testAlignSpaceBetweenRowNoWrapVisibilityHidden START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.Hidden
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexAlignSpaceBetween10');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.NoWrap');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceBetween');
      let strJson2 = inspector.getInspectorByKey('AlignSpaceBetween28');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Hidden');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween28');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween29');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignSpaceBetween30');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexAlignSpaceBetween10');
      const uiContext = new UIContext();
      expect(Math.abs((locationText1.top) - (locationText2.top)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationFlex.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.left) - (locationFlex.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(locationText2.right - locationText2.left))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationText1.right)) - (Math.round(locationText3.left - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round((locationText2.left - locationText1.right) * 10) / 10) - (Math.round(uiContext.vp2px(25) * 10) / 10)) <= 1)
        .assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapVisibilityHidden END');

    });
  })
}