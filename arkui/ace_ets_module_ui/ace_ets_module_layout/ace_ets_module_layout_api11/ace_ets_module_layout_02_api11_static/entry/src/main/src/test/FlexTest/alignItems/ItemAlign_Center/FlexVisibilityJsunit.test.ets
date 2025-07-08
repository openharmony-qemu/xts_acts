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

export default function flexVisibility_CenterJsunit() {
  describe('flexItemAlignCenterTest8', () => {
    beforeAll(() => {
      console.info("flexItemAlignCenterTest8 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignCenterTest8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/ItemAlign_Center_FlexVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignCenterTest8 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get flexItemAlignCenterTest8 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexItemAlignCenterTest8 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexItemAlignCenterTest8 page error:" + err);
      }
      console.info("flexItemAlignCenterTest8 beforeEach end");
    });

    afterEach(async () : Promise<void>=> {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Center_FlexVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_CENTER_1100
     * @tc.name testFlexItemAlignCenterSubSetVisibilityNone_static
     * @tc.desc The first subcomponent set Visibility.None attribute.
     */
    it('testFlexItemAlignCenterSubSetVisibilityNone_static', 0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignCenterSubSetVisibilityNone START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'height', value: 0
          });

        }

        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flexVisible');

        let strJson2 = inspector.getInspectorByKey('ItemAlign_Center_textVisible01');
        const uiContext = new UIContext();
        // expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textVisible01');
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textVisible02');
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textVisible03');
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flexVisible');
        expect(Math.abs(textVisible01.left - textVisible01.right) <= 1).assertTrue()
        expect(Math.abs(textVisible01.left - flexVisible.left) <= 1).assertTrue()
        expect(Math.abs(textVisible02.bottom - textVisible02.top - uiContext.vp2px(100)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.bottom - textVisible03.top - uiContext.vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible02.left - uiContext.vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.right - textVisible03.left - uiContext.vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(flexVisible.right - textVisible03.right - uiContext.vp2px(200)) <= 1).assertTrue()
        expect(Math.abs(textVisible02.top - flexVisible.top - flexVisible.bottom + textVisible02.bottom) <= 1)
          .assertTrue()
        expect(Math.abs(textVisible03.top - flexVisible.top - flexVisible.bottom + textVisible03.bottom) <= 1)
          .assertTrue()
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      } catch (err:Error) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignCenterSubSetVisibilityNone END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_CENTER_1200
     * @tc.name testFlexItemAlignCenterSubSetVisibilityHidden_static
     * @tc.desc The first subcomponent set Visibility.Hidden attribute.
     */
    it('testFlexItemAlignCenterSubSetVisibilityHidden_static', 0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignCenterSubSetVisibilityHidden START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'height', value: 0
          });

        }

        await CommonFunc.sleep(2000);
        let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flexVisible');

        let strJson2 = inspector.getInspectorByKey('ItemAlign_Center_textVisible01');
        const uiContext = new UIContext();
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textVisible01');
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textVisible02');
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textVisible03');
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flexVisible');
        expect(Math.abs(textVisible01.bottom - textVisible01.top - uiContext.vp2px(50)) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible01.left - uiContext.vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible02.bottom - textVisible02.top - uiContext.vp2px(100)) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible02.left - uiContext.vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.bottom - textVisible03.top - uiContext.vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.right - textVisible03.left - uiContext.vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(flexVisible.right - textVisible03.right - uiContext.vp2px(50)) <= 1).assertTrue()
        expect(Math.abs(textVisible01.top - flexVisible.top - flexVisible.bottom + textVisible01.bottom) <= 1)
          .assertTrue()
        expect(Math.abs(textVisible02.top - flexVisible.top - flexVisible.bottom + textVisible02.bottom) <= 1)
          .assertTrue()
        expect(Math.abs(textVisible03.top - flexVisible.top - flexVisible.bottom + textVisible03.bottom) <= 1)
          .assertTrue()
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
        expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      } catch (err:Error) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignCenterSubSetVisibilityHidden END');

    });
  })
}
