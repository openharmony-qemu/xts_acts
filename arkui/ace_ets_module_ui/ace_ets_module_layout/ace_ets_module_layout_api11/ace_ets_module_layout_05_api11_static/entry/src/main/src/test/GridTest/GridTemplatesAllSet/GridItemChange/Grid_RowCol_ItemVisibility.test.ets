/**
 * Copyright (c) 2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../../../hypium/index";
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { Visibility } from '@ohos.arkui.component'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function grid_RowCol_ItemVisibilityTest() {
  describe('Grid_RowCol_ItemVisibilityTest', () => {
    beforeAll(() => {
      console.info("grid_RowCol_ItemVisibilityTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("grid_RowCol_ItemVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get grid_RowCol_ItemVisibilityTest state pages: " + JSON.stringify(pages));
        if (!("blank3" == pages.name)) {
          console.info("get grid_RowCol_ItemVisibilityTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push grid_RowCol_ItemVisibilityTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Grid_RowCol_ItemVisibilityTest after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0600
     * @tc.name testGridRowColItemVisibilityNone_static_01
     * @tc.desc The second griditem set visibility to Visibility.None
     */
    it('testGridRowColItemVisibilityNone_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemVisibilityNone_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'secondGridItemVisibility', value: Visibility.None
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemVisibility_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let secondGridItemStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemVisibility02');
     expect(JSON.parseJsonElement(secondGridItemStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();
      const uiContext = new UIContext();
      expect(Math.abs(firstGridItem.right - firstGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemVisibilityNone_static_01] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0700
     * @tc.name testGridRowColItemVisibilityHidden_static_02
     * @tc.desc The second griditem set visibility to Visibility.Hidden
     */
    it('testGridRowColItemVisibilityHidden_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemVisibilityHidden_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'secondGridItemVisibility', value: Visibility.Hidden
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemVisibility_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let secondGridItemStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemVisibility02');
     expect(JSON.parseJsonElement(secondGridItemStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      const uiContext = new UIContext();
      expect(Math.abs(firstGridItem.right - firstGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemVisibilityHidden_static_02] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDITEMCHANGE_0800
     * @tc.name testGridRowColItemVisibilityVisible_static_03
     * @tc.desc The second griditem set visibility to Visibility.Visible
     */
    it('testGridRowColItemVisibilityVisible_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemVisibilityVisible_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'secondGridItemVisibility', value: Visibility.Visible
      });
      await CommonFunc.sleep(3000);
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility01');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemVisibility_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemVisibility_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let secondGridItemStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemVisibility02');
     expect(JSON.parseJsonElement(secondGridItemStrJson).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.left - firstGridItem.right) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      const uiContext = new UIContext();
      expect(Math.abs(firstGridItem.right - firstGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - uiContext.vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemVisibilityVisible_static_03] END');
      done();
    });
  })
}
