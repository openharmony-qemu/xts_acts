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

export default function flexMargin_StartJsunit() {
  describe('flexItemAlignStartTest5', () => {

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
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/ItemAlign_Start_FlexMargin',
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
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Start_FlexMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_0500
     * @tc.name testItemAlignStartParentSetMargin_static
     * @tc.desc Parent component set margin attribute.
     */
    it('testItemAlignStartParentSetMargin_static', 0, async () : Promise<void> => {
      console.info('new testItemAlignStartParentSetMargin START');
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Start_flexMargin');

      let textFlexMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlexMargin01');
      let textFlexMargin02: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlexMargin02');
      let textFlexMargin03: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_textFlexMargin03');
      let flexMargin: RectValue = CommonFunc.getComponentRect('ItemAlign_Start_flexMargin');
      const uiContext = new UIContext();
      expect(Math.abs(flexMargin.top - textFlexMargin01.top) <= 1).assertTrue();
      expect(Math.abs(textFlexMargin01.top - textFlexMargin02.top) <= 1).assertTrue();
      expect(Math.abs(textFlexMargin02.top - textFlexMargin03.top) <= 1).assertTrue();

      expect(Math.abs(flexMargin.left - textFlexMargin01.left) <= 1).assertTrue();
      expect(Math.abs(textFlexMargin01.right - textFlexMargin02.left) <= 1).assertTrue();
      expect(Math.abs(textFlexMargin02.right - textFlexMargin03.left) <= 1).assertTrue();

      expect(Math.abs((textFlexMargin01.bottom - textFlexMargin01.top) - uiContext.vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((textFlexMargin02.bottom - textFlexMargin02.top) - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((textFlexMargin03.bottom - textFlexMargin03.top) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textFlexMargin01.right - textFlexMargin01.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textFlexMargin02.right - textFlexMargin02.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textFlexMargin03.right - textFlexMargin03.left) - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row')
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Start')
      console.info('new testItemAlignStartParentSetMargin END');

    });

  })
}
