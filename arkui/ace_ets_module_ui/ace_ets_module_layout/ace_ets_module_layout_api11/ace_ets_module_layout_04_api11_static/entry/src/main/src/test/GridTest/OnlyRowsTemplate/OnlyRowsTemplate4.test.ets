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
import { Driver, ON} from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function OnlyRowsTemplate4() {
  describe('OnlyRowsTemplate4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("OnlyRowsTemplate4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnlyRowsTemplate4 state pages:" + "");
        if (!("OnlyRowsTemplate1" == pages.name)) {
          console.info("get OnlyRowsTemplate4 pages.name:" + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate4 page error:" + err);
      }
      console.info("OnlyRowsTemplate4 beforeEach end");
    });
    afterEach(async () => {
      console.info("OnlyRowsTemplate4 after each called");
    });

/**
     * @tc.number   SUB_ACE_GRID_OnlyRowsTemplate4_static_0400
     * @tc.name     SUB_ACE_GRID_OnlyRowsTemplate4_static_0400
     * @tc.desc     SUB_ACE_GRID_OnlyRowsTemplate4_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_OnlyRowsTemplate4_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate4_static_0400] START');
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'rowStart1', value: -1
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'rowEnd1', value: 1
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'rowStart2', value: -1
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'rowEnd2', value: 1
      })
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('OnlyRowsTemplate4Test await err: ' + JSON.stringify(err));
      }

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_02');

      console.log('assert space')
      expect(Math.abs(GridItem_02.top - GridItem_01.bottom - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10))) <= 1).assertTrue();
      console.log('GridItem_02.top - GridItem_01.bottom' + (GridItem_02.top - GridItem_01.bottom))


      console.log('assert size')
      expect(Math.abs(GridItem_01.right - GridItem_01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(GridItem_01.bottom - GridItem_01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(72))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('OnlyRowsTemplate4Test await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create();
      try {
      await CommonFunc.sleep(300);
      } catch (err) {
      console.info('OnlyRowsTemplate4Test await err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1' + '_button'));
      try {
      await (button?.click() as Promise<void>);
      } catch (err) {
      console.info('OnlyRowsTemplate4Test await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('OnlyRowsTemplate4Test await err: ' + JSON.stringify(err));
      }
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate4_static_0400] END');
      done();
    });


  })
}
