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

export default function flexVisibility_AutoJsunit() {
  describe('flexItemAlignAutoTest8', () => {

    beforeAll(() => {
      console.info("flexItemAlignAutoTest8 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });


    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignAutoTest8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/ItemAlign_Auto_FlexVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignAutoTest8 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get flexItemAlignAutoTest8 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexItemAlignAutoTest8 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexItemAlignAutoTest8 page error:" + err);
      }
      console.info("flexItemAlignAutoTest8 beforeEach end");
    });



    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Auto_FlexVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_1100
     * @tc.name testFlexItemAlignAutoFlexVisibilityNone_static
     * @tc.desc The first subcomponent set Visibility.None attribute.
     */
    it('testFlexItemAlignAutoFlexVisibilityNone_static', 0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignAutoFlexVisibilityNone START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'visibility', value: 0
          });

        }

        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexVisible');

        let strJson2 = inspector.getInspectorByKey('ItemAlign_Auto_textVisible01');

        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textVisible01')
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textVisible02')
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textVisible03')
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexVisible')

        expect(Math.abs(textVisible01.left - textVisible01.right) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - flexVisible.left) <= 1).assertTrue()
        expect(Math.abs(textVisible02.top - textVisible03.top) <= 1).assertTrue()
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue()
        const uiContext = new UIContext();
        expect(Math.abs(Math.round(textVisible02.bottom - textVisible02.top) - Math.round(uiContext.vp2px(100))) <= 1)
          .assertTrue()
        expect(Math.abs(Math.round(textVisible03.bottom - textVisible03.top) - Math.round(uiContext.vp2px(150))) <= 1)
          .assertTrue()
        expect(Math.abs(Math.round(textVisible02.right - textVisible02.left) - Math.round(uiContext.vp2px(150))) <= 1)
          .assertTrue()
        expect(Math.abs(Math.round(textVisible03.right - textVisible03.left) - Math.round(uiContext.vp2px(150))) <= 1)
          .assertTrue()
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto')
      } catch (err:Error) {
        console.error('[testFlexItemAlignAutoFlexVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignAutoFlexVisibilityNone END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_AUTO_1200
     * @tc.name testFlexItemAlignAutoFlexVisibilityHidden_static
     * @tc.desc The first subcomponent set Visibility.Hidden attribute.
     */
    it('testFlexItemAlignAutoFlexVisibilityHidden_static', 0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignAutoFlexVisibilityHidden START');
      try {
        // const router = AppStorage.get<Router>("ImageSpanVisibility") as Router
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'visibility',
            value: 0
          });

        }
        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexVisible');


        let strJson2 = inspector.getInspectorByKey('ItemAlign_Auto_textVisible01');

        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");

        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textVisible01');
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textVisible02');
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textVisible03');
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexVisible');
        const uiContext = new UIContext();
        expect(Math.abs(textVisible01.left - flexVisible.left) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible02.left) <= 1).assertTrue()
        expect(Math.abs(textVisible02.top - textVisible03.top) <= 1).assertTrue()
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue()

        expect(Math.abs(Math.round(textVisible01.bottom - textVisible01.top) - Math.round(uiContext.vp2px(50))) <= 1).assertTrue()
        expect(Math.abs(Math.round(textVisible02.bottom - textVisible02.top) - Math.round(uiContext.vp2px(100))) <= 1)
          .assertTrue()
        expect(Math.abs(Math.round(textVisible03.bottom - textVisible03.top) - Math.round(uiContext.vp2px(150))) <= 1)
          .assertTrue()
        expect(Math.abs(Math.round(textVisible01.right - textVisible01.left) - Math.round(uiContext.vp2px(150))) <= 1)
          .assertTrue()
        expect(Math.abs(Math.round(textVisible02.right - textVisible02.left) - Math.round(uiContext.vp2px(150))) <= 1)
          .assertTrue()
        expect(Math.abs(Math.round(textVisible03.right - textVisible03.left) - Math.round(uiContext.vp2px(150))) <= 1)
          .assertTrue()
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto')
      } catch (err:Error) {
        console.error('[testFlexItemAlignAutoFlexVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignAutoFlexVisibilityHidden END');

    });
  })
}
