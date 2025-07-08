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

export default function flexWrapReverse_fixedParentChildVisibility() {
  describe('FlexWrapReverse_fixedParentChildVisibility', () => {
    beforeAll(() => {
      console.info("FlexWrapReverse_fixedParentChildVisibility beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split03.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("FlexWrapReverse_fixedParentChildVisibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/Wrap/WrapReverse/FlexWrapReverse_fixedParentChildVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FlexWrapReverse_fixedParentChildVisibility state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get FlexWrapReverse_fixedParentChildVisibility pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push FlexWrapReverse_fixedParentChildVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexWrapReverse_fixedParentChildVisibility page error:" + err);
      }
      console.info("FlexWrapReverse_fixedParentChildVisibility beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FlexWrapReverse_fixedParentChildVisibility afterEach called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1200
     * @tc.name testWrapReverseParentfixedVisibilityNoneAndOtherOutRange
     * @tc.desc The layout space of the parent component is fixed, and the visibility none is set for the child
     *               component, and the layout range of remaining components exceeds the container space
     */
    it('testWrapReverseParentfixedVisibilityNoneAndOtherOutRange_static', 0, async () => {
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherOutRange START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'test1Width', value: 150
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'test2Width', value: 300
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.None
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexWrapReverseTest19');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let strJson2 = inspector.getInspectorByKey('WrapReverseTest55');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest55');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest56');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest57');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest19');
      const uiContext = new UIContext();
      expect(Math.abs(locationText2.left - locationText3.left) <= 1).assertTrue()
      expect(Math.abs(locationText2.right - locationText3.right) <= 1).assertTrue()
      expect(Math.abs(locationText2.right - locationFlex.right) <= 1).assertTrue()
      expect(Math.abs((locationText2.left - locationFlex.left) - uiContext.vp2px(200)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationFlex.top) <= 1).assertTrue()
      expect(Math.abs(locationText3.top - locationText2.bottom) <= 1).assertTrue()
      expect(Math.abs((locationFlex.bottom - locationText3.bottom) - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150)) <= 1).assertTrue();
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherOutRange END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1300
     * @tc.name testWrapReverseParentfixedVisibilityNoneAndOtherInRange
     * @tc.desc The layout space of the parent component is fixed, and the visibility none is set for the child
     *               component, and the remaining component layout range does not exceed the container space
     */
    it('testWrapReverseParentfixedVisibilityNoneAndOtherInRange_static', 0, async () => {
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherInRange START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'test1Width', value: 200
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'test2Width', value: 200
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.None
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexWrapReverseTest19');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let strJson2 = inspector.getInspectorByKey('WrapReverseTest55');

      //expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.None');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest55');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest56');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest57');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest19');
      const uiContext = new UIContext();
      expect(Math.abs(locationText2.right - locationFlex.right) <= 1).assertTrue()
      expect(Math.abs(locationText2.left - locationText3.right) <= 1).assertTrue()
      expect(Math.abs((locationText3.left - locationFlex.left) - uiContext.vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(locationText3.top - locationText2.top) <= 1).assertTrue()
      expect(Math.abs(locationText3.top - locationFlex.top) <= 1).assertTrue()
      expect(Math.abs((locationFlex.bottom - locationText3.bottom) - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((locationText2.right - locationText2.left) - uiContext.vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100)) <= 1).assertTrue()
      expect(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150)) <= 1).assertTrue()
      console.info('new testWrapReverseParentfixedVisibilityNoneAndOtherInRange END');

    });

    /**
     * @tc.number SUB_ACE_FLEX_WRAPREVERSE_PARENTFIXED_TEST_1400
     * @tc.name testWrapReverseParentfixedVisibilityHiddenAndOtherInRange
     * @tc.desc The layout space of the parent component is fixed, and visibility hidden is set for child component
     */
    it('testWrapReverseParentfixedVisibilityHiddenAndOtherInRange_static', 0, async () => {
      console.info('new testWrapReverseParentfixedVisibilityHiddenAndOtherInRange START');
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'test1Width', value: 200
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'test2Width', value: 200
      })
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'visibility', value: Visibility.Hidden
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('FlexWrapReverseTest19');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('wrap')).assertEqual('FlexWrap.WrapReverse');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
      let strJson2 = inspector.getInspectorByKey('WrapReverseTest55');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual('Visibility.Hidden');
      let locationText1: RectValue = CommonFunc.getComponentRect('WrapReverseTest55');
      let locationText2: RectValue = CommonFunc.getComponentRect('WrapReverseTest56');
      let locationText3: RectValue = CommonFunc.getComponentRect('WrapReverseTest57');
      let locationFlex: RectValue = CommonFunc.getComponentRect('FlexWrapReverseTest19');
      const uiContext = new UIContext();
      expect(Math.abs(locationText1.right - locationFlex.right) <= 1).assertTrue()
      expect(Math.abs(locationText1.left - locationText2.right) <= 1).assertTrue()
      expect(Math.abs((locationText2.left - locationFlex.left) - uiContext.vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(locationText3.left - locationText1.left) <= 1).assertTrue()
      expect(Math.abs(locationText3.right - locationFlex.right) <= 1).assertTrue()
      expect(Math.abs(locationText1.top - locationText2.top) <= 1).assertTrue()
      expect(Math.abs(locationText2.top - locationFlex.top) <= 1).assertTrue()
      expect(Math.abs(locationText3.top - locationText2.bottom) <= 1).assertTrue()
      expect(Math.abs((locationFlex.bottom - locationText3.bottom) - uiContext.vp2px(50)) <= 1).assertTrue()
      expect(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((locationText2.right - locationText2.left) - uiContext.vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((locationText1.bottom - locationText1.top) - uiContext.vp2px(50)) <= 1).assertTrue()
      expect(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100)) <= 1).assertTrue()
      expect(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150)) <= 1).assertTrue()
      console.info('new testWrapReverseParentfixedVisibilityHiddenAndOtherInRange END');

    });
  })
}