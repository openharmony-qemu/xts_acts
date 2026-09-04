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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';

import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function ColumnsTemplateAndRowsTemplateNoSet() {
  describe('ColumnsTemplateAndRowsTemplateNoSet', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ColumnsTemplateAndRowsTemplateNoSet beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplateNoSet',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnsTemplateAndRowsTemplateNoSet state pages:" + "");
        if (!("ColumnsTemplateAndRowsTemplateNoSet" == pages.name)) {
          console.info("get ColumnsTemplateAndRowsTemplateNoSet pages.name:" + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push ColumnsTemplateAndRowsTemplateNoSet page error:" + err);
      }
      console.info("ColumnsTemplateAndRowsTemplateNoSet beforeEach end");
    });
    afterEach(async () => {
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('ColumnsTemplateAndRoTest await err: ' + JSON.stringify(err));
      }
      const router = AppStorage.get<Router>("router") as Router
      router.back()
      console.info("ColumnsTemplateAndRowsTemplateNoSet after each called");
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_static_0100
     * @tc.name     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_static_0100
     * @tc.desc     SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_static_0100] START');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('ColumnsTemplateAndRoTest await err: ' + JSON.stringify(err));
      }

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplateNoSet_GridItem_01');
      let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplateNoSet_Grid_1');

      console.log('assert position')
      expect(GridItem_01.left).assertEqual(Grid_1.left);
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('Grid_1.left' + Grid_1.left)

      expect(Math.round(GridItem_01.left - Grid_1.left)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0))));
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.round(GridItem_01.top - Grid_1.top)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(0))));
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))

      console.log('assert size')
      expect(Math.round(GridItem_01.right - GridItem_01.left)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))));
      console.log('GridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.round(GridItem_01.bottom - GridItem_01.top)).assertEqual(Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))));
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))


      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_static_0100] END');
      done();
    });


  })
}
