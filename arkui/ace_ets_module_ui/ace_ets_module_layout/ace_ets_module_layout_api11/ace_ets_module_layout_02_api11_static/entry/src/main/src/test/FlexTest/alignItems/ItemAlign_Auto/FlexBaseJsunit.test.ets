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
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function flexBase_AutoJsunit() {
  describe('flexItemAlignAutoTest3', () => {
    beforeAll(() => {
      console.info("flexItemAlignAutoTest3 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });



    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignAutoTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/ItemAlign_Auto_FlexBase',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignAutoTest3 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get flexItemAlignAutoTest3 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexItemAlignAutoTest3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexItemAlignAutoTest3 page error:" + err);
      }
      console.info("flexItemAlignAutoTest3 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Auto_FlexBase after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_0100
     * @tc.name testFlexItemAlignAutoFlexWidHeiMeet_static
     * @tc.desc The subcomponent is inside the parent component when the width of parent component set to 500,
     *               the height of parent component set to 200.
     */
    it('testFlexItemAlignAutoFlexWidHeiMeet_static', 0, async () => {
      console.info('new testFlexItemAlignAutoFlexWidHeiMeet_static START');
      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'height', value: 200
        });
        (result! as FaceValue<number>).message.notify({
          name: 'width', value: 500
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flex01');
      let textFlex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flex01');
      expect(Math.abs(flex01.top - textFlex01.top) <= 1).assertTrue();
      expect(Math.abs(textFlex01.top - textFlex02.top) <= 1).assertTrue();
      expect(Math.abs(textFlex02.top - textFlex03.top) <= 1).assertTrue();

      expect(Math.abs(textFlex01.right - textFlex02.left) <= 1).assertTrue();
      expect(Math.abs(textFlex02.right - textFlex03.left) <= 1).assertTrue();
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(flex01.right - textFlex03.right) - Math.round(uiContext.vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(textFlex01.bottom - textFlex01.top) - Math.round(uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex02.bottom - textFlex02.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex03.bottom - textFlex03.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex01.right - textFlex01.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex02.right - textFlex02.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex03.right - textFlex03.left) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoFlexWidHeiMeet END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_0200
     * @tc.name testFlexItemAlignAutoFlexWidHeiOverflow_static
     * @tc.desc The subcomponent exceeds the parent component when the width of parent component set to 420,
     *               the height of parent component set to 140.
     */
    it('testFlexItemAlignAutoFlexWidHeiOverflow_static', 0, async (): Promise<void> => {
      console.info('new testFlexItemAlignAutoFlexWidHeiOverflow_static START');

      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'height', value: 140
        });
        (result! as FaceValue<number>).message.notify({
          name: 'width', value: 420
        });
      }

      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flex01');
      let textFlex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlex01');
      let textFlex02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlex02');
      let textFlex03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textFlex03');
      let flex01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flex01');
      expect(Math.abs(flex01.top - textFlex01.top) <= 1).assertTrue();
      expect(Math.abs(textFlex01.top - textFlex02.top) <= 1).assertTrue();
      expect(Math.abs(textFlex02.top - textFlex03.top) <= 1).assertTrue();

      expect(Math.abs(textFlex03.right - flex01.right) <= 1).assertTrue();
      expect(textFlex03.bottom).assertLarger(flex01.bottom);
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(textFlex01.bottom - textFlex01.top) - Math.round(uiContext.vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex02.bottom - textFlex02.top) - Math.round(uiContext.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex03.bottom - textFlex03.top) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex01.right - textFlex01.left) - Math.round(uiContext.vp2px(140))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex02.right - textFlex02.left) - Math.round(uiContext.vp2px(140))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textFlex03.right - textFlex03.left) - Math.round(uiContext.vp2px(140))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoFlexWidHeiOverflow_static END');

    });
  })
}
