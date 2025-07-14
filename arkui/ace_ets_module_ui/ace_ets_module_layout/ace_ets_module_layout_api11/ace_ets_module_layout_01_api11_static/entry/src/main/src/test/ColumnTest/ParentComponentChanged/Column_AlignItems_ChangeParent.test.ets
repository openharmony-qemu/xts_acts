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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../../hypium/index";
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {GlobalContext} from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext } from "@ohos.arkui.UIContext";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { HorizontalAlign } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function column_AlignItems_ChangeParent() {

  describe('Column_AlignItems_ChangeParentTest', () => {
    beforeAll(() => {
      console.info("Column_AlignItems_ChangeParentTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Column_AlignItems_ChangeParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_AlignItems_ChangeParent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Column_AlignItems_ChangeParentTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Column_AlignItems_ChangeParentTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Column_AlignItems_ChangeParentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_AlignItems_ChangeParentTest page error:" + err);
      }
      console.info("Column_AlignItems_ChangeParentTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Column_AlignItems_ChangeParent afterEach called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_ALIGNITEMS_CHANGEPARENT_TEST_0100
     * @tc.name testColumnAlignItemsChangeParentHorizontalAlignStart_static
     * @tc.desc The parent component is bound to alignItems property HorizontalAlign.Start. Other parameters are default
     */
    it('testColumnAlignItemsChangeParentHorizontalAlignStart_static', 0, async () => {
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignStart START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'alignItems', value: HorizontalAlign.Start
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnAlignItemsChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignItems_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignItems_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignItems_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnAlignItemsChange1');
      expect(Math.abs((locationText1.left) - (locationColumn.left)) <= 1).assertTrue();
      expect(Math.abs((locationText1.left) - (locationText2.left)) <= 1).assertTrue();
      expect(Math.abs((locationText2.left) - (locationText3.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.right - locationText1.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) - (Math.round(uiContext.vp2px(40)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(uiContext.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(uiContext.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(uiContext.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(uiContext.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignStart END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_ALIGNITEMS_CHANGEPARENT_TEST_0200
     * @tc.name testColumnAlignItemsChangeParentHorizontalAlignEnd_static
     * @tc.desc The parent component is bound to alignItems property HorizontalAlign.End. Other parameters are default
     */
    it('testColumnAlignItemsChangeParentHorizontalAlignEnd_static', 0, async () => {
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignEnd START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'alignItems', value: HorizontalAlign.End
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnAlignItemsChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1: RectValue = CommonFunc.getComponentRect('AlignItems_Test1');
      let locationText2: RectValue = CommonFunc.getComponentRect('AlignItems_Test2');
      let locationText3: RectValue = CommonFunc.getComponentRect('AlignItems_Test3');
      let locationColumn: RectValue = CommonFunc.getComponentRect('ColumnAlignItemsChange1');
      expect(Math.abs((locationText1.right) - (locationColumn.right)) <= 1).assertTrue();
      expect(Math.abs((locationText1.right) - (locationText2.right)) <= 1).assertTrue();
      expect(Math.abs((locationText2.right) - (locationText3.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.left - locationColumn.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((locationText1.top) - (locationColumn.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationColumn.bottom - locationText3.bottom)) - (Math.round(uiContext.vp2px(40)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.top - locationText1.bottom)) - (Math.round(uiContext.vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(uiContext.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(uiContext.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(uiContext.vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('new testColumnAlignItemsChangeParentHorizontalAlignEnd END');
    });
  })
}