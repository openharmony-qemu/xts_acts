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

export default function flexWrapReverse_fixedParentChildDisplayPriority() {
  describe('FlexWrapReverse_fixedParentChildDisplayPriority', () => {
    beforeAll(() => {
      console.info("FlexWrapReverse_fixedParentChildDisplayPriority beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexWrapReverse_fixedParentChildDisplayPriority beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentChildDisplayPriority',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexWrapReverse_fixedParentChildDisplayPriority state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentChildDisplayPriority pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push FlexWrapReverse_fixedParentChildDisplayPriority page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentChildDisplayPriority page error:" + err);
      }
      console.info("FlexWrapReverse_fixedParentChildDisplayPriority beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentChildDisplayPriority afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1700
     * @tc.name testWrapReverseParentfixedDisplayPriority
     * @tc.desc The layout space of the parent component is fixed, and displayPriority is set for child component
     */
    it('testWrapReverseParentfixedDisplayPriority_static', 0, async () => {
      console.info('new testWrapReverseParentfixedDisplayPriority START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'height', value: 300
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'width', value: 500
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexWrapReverseTest24');
      const uiContext = new UIContext();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest70');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest71');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest72');
      let locationFlexParent: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest24');
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.top - locationFlexParent.top) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.right - locationText1.left) - uiContext.vp2px(250)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.right - locationText2.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.right - locationText3.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - uiContext.vp2px(200)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationFlexParent.left) - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationFlexParent.bottom - locationText2.bottom) - uiContext.vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedDisplayPriority END');

    });
  })
}