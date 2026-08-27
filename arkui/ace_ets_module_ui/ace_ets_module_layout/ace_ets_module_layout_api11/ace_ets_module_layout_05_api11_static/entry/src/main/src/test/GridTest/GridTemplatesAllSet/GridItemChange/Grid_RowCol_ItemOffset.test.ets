'use static';
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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../../../hypium/index";
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager } from '../../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { Position } from '@ohos.arkui.component'
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function grid_RowCol_ItemOffsetTest() {
  describe('Grid_RowCol_ItemOffsetTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("grid_RowCol_ItemOffsetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridTemplatesAllSet/GridItemChange/Grid_RowCol_ItemOffset',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get grid_RowCol_ItemOffsetTest state pages: " + JSON.stringify(pages));
        if (!("Grid_RowCol_ItemOffset" == pages.name)) {
          console.info("get grid_RowCol_ItemOffsetTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push grid_RowCol_ItemOffsetTest page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('Grid_RowCol_ItemOffsetTestTest await err: ' + JSON.stringify(err));
      }
      console.info("Grid_RowCol_ItemOffsetTest after each called");
    });
    
    
    

/**
     * @tc.number   testGridRowColItemOffset_static_01
     * @tc.name     testGridRowColItemOffset_static_01
     * @tc.desc     testGridRowColItemOffset_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridRowColItemOffset_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridRowColItemOffset_static_01] START');
      let secondGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset02');
      let secondGridItemTop: number = secondGridItem.top;
      let secondGridItemLeft: number = secondGridItem.left;
      AppStorage.get<MessageManager<Position>>('messageManager')?.notify({
        name: 'secondGridItemOffset', value: {
          x: 20, y: 20
        }
      });
            try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('Grid_RowCol_ItemOffsetTestTest await err: ' + JSON.stringify(err));
      }
      let firstGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset01');
      secondGridItem = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset02');
      let thirdGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset03');
      let fourthGridItem: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset04');
      let gridContainer: RectValue = CommonFunc.getComponentRect('Grid_RowCol_ItemOffset' + '_Container01');
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_RowCol_ItemOffset' + '_Container01');

     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');

      expect(Math.abs(secondGridItem.left - secondGridItemLeft - UIContext.resolveUIContext()!.vp2px(20)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.top - secondGridItemTop - UIContext.resolveUIContext()!.vp2px(20)) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.top - gridContainer.top) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.left - gridContainer.left) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.top - firstGridItem.bottom) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.left - thirdGridItem.right) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.top - thirdGridItem.top) <= 1).assertTrue();

      expect(Math.abs(firstGridItem.right - firstGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(firstGridItem.bottom - firstGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(secondGridItem.right - secondGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(secondGridItem.bottom - secondGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(thirdGridItem.right - thirdGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(thirdGridItem.bottom - thirdGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      expect(Math.abs(fourthGridItem.right - fourthGridItem.left - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(fourthGridItem.bottom - fourthGridItem.top - UIContext.resolveUIContext()!.vp2px(150)) <= 1).assertTrue();

      console.info('[testGridRowColItemOffset_static_01] END');
      done();
    });
  })
}
