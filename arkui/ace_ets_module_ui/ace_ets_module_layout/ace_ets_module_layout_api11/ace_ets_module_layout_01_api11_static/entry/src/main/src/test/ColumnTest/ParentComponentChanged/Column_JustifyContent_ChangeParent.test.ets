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
import { FlexAlign } from '@ohos.arkui.component';
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
export default function column_JustifyContent_ChangeParent() {

  describe('Column_JustifyContent_ChangeParentTest', () => {
    beforeAll(() => {
      console.info("Column_JustifyContent_ChangeParentTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Column_JustifyContent_ChangeParentTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ParentComponentChanged/Column_JustifyContent_ChangeParent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Column_JustifyContent_ChangeParentTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Column_JustifyContent_ChangeParentTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Column_JustifyContent_ChangeParentTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_JustifyContent_ChangeParentTest page error:" + err);
      }
      console.info("Column_JustifyContent_ChangeParentTest beforeEach end");
    });


    afterEach(async  () =>{
      await CommonFunc.sleep(1000);
      console.info("Column_JustifyContent_ChangeParent afterEach called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0100
     * @tc.name testColumnJustifyContentChangeParentFlexAlignCenter_static
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.Center. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignCenter_static', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'justifyContent', value: FlexAlign.Center
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.bottom - locationText3.bottom) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignCenter END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0200
     * @tc.name testColumnJustifyContentChangeParentFlexAlignEnd_static
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.End. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignEnd_static', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'justifyContent', value: FlexAlign.End
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(locationText3.bottom - locationColumn.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignEnd END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0300
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceBetween_static
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceBetween. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceBetween_static', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceBetween
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top) - (locationColumn.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom) - (locationColumn.bottom))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - uiContext.vp2px(50))) <= 1)
        .assertTrue();
      //Known issues with use case notes
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceBetween END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0400
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceAround_static
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceAround. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceAround_static', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceAround
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - uiContext.vp2px(100 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - uiContext.vp2px(50 / 3))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceAround END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_JUSTIFYCONTENT_CHANGEPARENT_TEST_0500
     * @tc.name testColumnJustifyContentChangeParentFlexAlignSpaceEvenly_static
     * @tc.desc The parent component is bound to justifyContent property FlexAlign.SpaceEvenly. Other parameters are default
     */
    it('testColumnJustifyContentChangeParentFlexAlignSpaceEvenly_static', 0, async () => {
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'justifyContent', value: FlexAlign.SpaceEvenly
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ColumnJustifyContentChange1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Column');
      let locationText1 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test1');
      let locationText2 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test2');
      let locationText3 : RectValue = CommonFunc.getComponentRect('JustifyContent_Test3');
      let locationColumn : RectValue = CommonFunc.getComponentRect('ColumnJustifyContentChange1');
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.left - locationColumn.left) - (locationColumn.right - locationText1.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.left - locationColumn.left) - (locationColumn.right - locationText2.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.left - locationColumn.left) - (locationColumn.right - locationText3.right))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationColumn.right - locationText1.right) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.top - locationText1.bottom) - (locationText3.top - locationText2.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationColumn.bottom - locationText3.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - (locationText2.top - locationText1.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.top - locationColumn.top) - uiContext.vp2px(25))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.right - locationText1.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.right - locationText2.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.right - locationText3.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText1.bottom - locationText1.top) - uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText2.bottom - locationText2.top) - uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((locationText3.bottom - locationText3.top) - uiContext.vp2px(150))) <= 1)
        .assertTrue();
      console.info('new testColumnJustifyContentChangeParentFlexAlignSpaceEvenly END');
    });
  })
}