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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
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

export default function Grid_RowCol_GridSize() {
  describe('Grid_RowCol_GridSizeTest', () => {
    beforeAll(() => {
      console.info("Grid_RowCol_GridSizeTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Grid_RowCol_GridSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridChange/Grid_RowCol_GridSize',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_RowCol_GridSizeTest state pages: " + JSON.stringify(pages));
        if (!("blank3" == pages.name)) {
          console.info("get Grid_RowCol_GridSizeTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_RowCol_GridSizeTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_RowCol_GridSize after each called")
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0100
     * @tc.name testGridRowColGridSize01_static_01
     * @tc.desc The Width 200 height 200,Grid is divided into 4 equal parts, 4 components
     */
    it('testGridRowColGridSize01_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColGridSize01_static_01] START');
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_GridSize_01');
     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let Grid_RowCol_GridSize_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_011');
      let Grid_RowCol_GridSize_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_012');
      let Grid_RowCol_GridSize_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_013');
      let Grid_RowCol_GridSize_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_014');
      let Grid_RowCol_GridSize_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_01');
      expect(Math.abs(Grid_RowCol_GridSize_011.left - Grid_RowCol_GridSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.left - Grid_RowCol_GridSize_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.right - Grid_RowCol_GridSize_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.right - Grid_RowCol_GridSize_014.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_012.right - Grid_RowCol_GridSize_01.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.right - Grid_RowCol_GridSize_01.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.top - Grid_RowCol_GridSize_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.top - Grid_RowCol_GridSize_01.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.bottom - Grid_RowCol_GridSize_013.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.bottom - Grid_RowCol_GridSize_014.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_013.bottom - Grid_RowCol_GridSize_01.bottom) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.bottom - Grid_RowCol_GridSize_01.bottom) <= 1).assertTrue();
      const uiContext = new UIContext();

      expect(Math.abs(Grid_RowCol_GridSize_011.right - Grid_RowCol_GridSize_011.left - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.right - Grid_RowCol_GridSize_012.left - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.right - Grid_RowCol_GridSize_013.left - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.right - Grid_RowCol_GridSize_014.left - uiContext.vp2px(100)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.bottom - Grid_RowCol_GridSize_011.top - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.bottom - Grid_RowCol_GridSize_012.top - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.bottom - Grid_RowCol_GridSize_013.top - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.bottom - Grid_RowCol_GridSize_014.top - uiContext.vp2px(100)) <= 1).assertTrue();
      console.info('[testGridRowColGridSize01_static_01] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_GRIDTEMPLATESALLSET_GRIDCHANGE_0200
     * @tc.name testGridRowColGridSize02_static_02
     * @tc.desc The Width 200 height 300,Grid is divided into 4 equal parts, 4 components
     */
    it('testGridRowColGridSize02_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColGridSize02_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'changeHeight', value: 300
      });
      await CommonFunc.sleep(3000);
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_GridSize_01');
     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      let Grid_RowCol_GridSize_011: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_011');
      let Grid_RowCol_GridSize_012: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_012');
      let Grid_RowCol_GridSize_013: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_013');
      let Grid_RowCol_GridSize_014: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_014');
      let Grid_RowCol_GridSize_01: RectValue = CommonFunc.getComponentRect('Grid_RowCol_GridSize_01');
      expect(Math.abs(Grid_RowCol_GridSize_011.left - Grid_RowCol_GridSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.left - Grid_RowCol_GridSize_01.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.right - Grid_RowCol_GridSize_012.left) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.right - Grid_RowCol_GridSize_014.left) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_012.right - Grid_RowCol_GridSize_01.right) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.right - Grid_RowCol_GridSize_01.right) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.top - Grid_RowCol_GridSize_01.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.top - Grid_RowCol_GridSize_01.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.bottom - Grid_RowCol_GridSize_013.top) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.bottom - Grid_RowCol_GridSize_014.top) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_013.bottom - Grid_RowCol_GridSize_01.bottom) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.bottom - Grid_RowCol_GridSize_01.bottom) <= 1).assertTrue();

      const uiContext = new UIContext();
      expect(Math.abs(Grid_RowCol_GridSize_011.right - Grid_RowCol_GridSize_011.left - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.right - Grid_RowCol_GridSize_012.left - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.right - Grid_RowCol_GridSize_013.left - uiContext.vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.right - Grid_RowCol_GridSize_014.left - uiContext.vp2px(100)) <= 1).assertTrue();

      expect(Math.abs(Grid_RowCol_GridSize_011.bottom - Grid_RowCol_GridSize_011.top - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_012.bottom - Grid_RowCol_GridSize_012.top - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_013.bottom - Grid_RowCol_GridSize_013.top - uiContext.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(Grid_RowCol_GridSize_014.bottom - Grid_RowCol_GridSize_014.top - uiContext.vp2px(150)) <= 1).assertTrue();
      console.info('[testGridRowColGridSize02_static_02] END');
      done();
    });

  })
}
