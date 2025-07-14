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

export default function flexExceed_AutoJsunit() {
  describe('flexItemAlignAutoTest2', () => {

    beforeAll(() => {
      console.info("flexItemAlignAutoTest2 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });


    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignAutoTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/ItemAlign_Auto_FlexExceed',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignAutoTest2 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get flexItemAlignAutoTest2 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexItemAlignAutoTest2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexItemAlignAutoTest2 page error:" + err);
      }
      console.info("flexItemAlignAutoTest2 beforeEach end");
    });


    afterEach(async (): Promise<void>  => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Auto_FlexExceed after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_0600
     * @tc.name testFlexItemAlignAutoFlexPadMarMeet_static
     * @tc.desc Subcomponent inside when parent component set margin and padding.
     */
    it('testFlexItemAlignAutoFlexPadMarMeet_static', 0, async (): Promise<void> => {
      console.info('new testFlexItemAlignAutoFlexPadMarMeet_static START');

      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'height', value: 10
        });
        (result! as FaceValue<number>).message.notify({
          name: 'width', value: 10
        });
      }

      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexExceed01');
      const uiContext = new UIContext();
      expect(Math.abs(textExceed01.left - flexExceed01.left - uiContext.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(textExceed01.right - textExceed02.left) <= 1).assertTrue();
      expect(Math.abs(textExceed02.right - textExceed03.left) <= 1).assertTrue();

      expect(Math.abs(textExceed01.top - flexExceed01.top - uiContext.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(textExceed01.top - textExceed02.top) <= 1).assertTrue();
      expect(Math.abs(textExceed02.top - textExceed03.top) <= 1).assertTrue();

      expect(Math.abs(textExceed01.bottom - textExceed01.top - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(textExceed02.bottom - textExceed02.top - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(textExceed03.bottom - textExceed03.top - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textExceed01.right - textExceed01.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textExceed02.right - textExceed02.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textExceed03.right - textExceed03.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoFlexPadMarMeet_static END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_0700
     * @tc.name testFlexItemAlignAutoFlexPadMarOverflow_static
     * @tc.desc Subcomponent outside when parent component set margin and padding.
     */
    it('testFlexItemAlignAutoFlexPadMarOverflow_static', 0, async (): Promise<void> => {
      console.info('new testFlexItemAlignAutoFlexPadMarOverflow_static START');
      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'height', value: 30
        });
        (result! as FaceValue<number>).message.notify({
          name: 'width', value: 30
        });
      }
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexExceed01');
      const uiContext = new UIContext();
      expect(Math.abs(textExceed01.left - flexExceed01.left - uiContext.vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(textExceed01.right - textExceed02.left) <= 1).assertTrue();
      expect(Math.abs(textExceed02.right - textExceed03.left) <= 1).assertTrue();

      expect(Math.abs(textExceed01.top - flexExceed01.top - uiContext.vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(textExceed01.top - textExceed02.top) <= 1).assertTrue();
      expect(Math.abs(textExceed02.top - textExceed03.top) <= 1).assertTrue();

      expect(Math.abs(textExceed01.bottom - textExceed01.top - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(textExceed02.bottom - textExceed02.top - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(textExceed03.bottom - textExceed03.top - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(textExceed01.right - textExceed01.left - uiContext.vp2px(440 / 3)) <= 1).assertTrue();
      expect(Math.abs(textExceed02.right - textExceed02.left - uiContext.vp2px(440 / 3)) <= 1).assertTrue();
      expect(Math.abs(textExceed03.right - textExceed03.left - uiContext.vp2px(440 / 3)) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoFlexPadMarOverflow_static END');

    });
  })
}
