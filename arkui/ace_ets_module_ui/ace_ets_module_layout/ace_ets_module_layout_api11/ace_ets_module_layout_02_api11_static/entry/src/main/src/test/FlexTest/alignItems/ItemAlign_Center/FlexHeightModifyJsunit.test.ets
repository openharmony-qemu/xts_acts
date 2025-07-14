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

export default function flexHeightModify_CenterJsunit() {
  describe('flexItemAlignCenterTest6', () => {

    beforeAll(() => {
      console.info("flexItemAlignCenterTest6 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignCenterTest6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/ItemAlign_Center_FlexHeightModify',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignCenterTest6 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get flexItemAlignCenterTest6 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push flexItemAlignCenterTest6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexItemAlignCenterTest6 page error:" + err);
      }
      console.info("flexItemAlignCenterTest6 beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Center_FlexHeightModify after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_CENTER_0800
     * @tc.name testFlexItemAlignCenterDefaultSize_static
     * @tc.desc Modify the first subcomponent's height.
     */
    it('testFlexItemAlignCenterDefaultSize_static', 0, async () : Promise<void> => {
      console.info('new testFlexItemAlignCenterDefaultSize START');
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flexHeightModify');
      const uiContext = new UIContext();
      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top - flexHeightModify.bottom + textHeightModify01.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify02.top - flexHeightModify.top - flexHeightModify.bottom + textHeightModify02.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify03.top - flexHeightModify.top - flexHeightModify.bottom + textHeightModify03.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top - uiContext.vp2px(75)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - uiContext.vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - uiContext.vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterDefaultSize END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_CENTER_0900
     * @tc.name testFlexItemAlignCenterHeightModify_static
     * @tc.desc Modify the first subcomponent's height.
     */
    it('testFlexItemAlignCenterHeightModify_static', 0, async () : Promise<void> => {
      console.info('new testFlexItemAlignCenterHeightModify START');
      const result = GlobalContext.getContext().getObject<number>('value')
      if (result !== null) {
        (result! as FaceValue<number>).message.notify({
          name: 'height', value: 80
        });

      }

      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Center_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flexHeightModify');
      const uiContext = new UIContext();
      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top - flexHeightModify.bottom + textHeightModify01.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify02.top - flexHeightModify.top - flexHeightModify.bottom + textHeightModify02.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify03.top - flexHeightModify.top - flexHeightModify.bottom + textHeightModify03.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify01.top - flexHeightModify.top - uiContext.vp2px(60)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - uiContext.vp2px(80)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - uiContext.vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - uiContext.vp2px(150)) <= 1).assertTrue()
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterHeightModify END');

    });
  })
}
