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
export default function OnlyColumnsTemplate4() {
  describe('OnlyColumnsTemplate4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("OnlyColumnsTemplate4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyColumnsTemplate/OnlyColumnsTemplate1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnlyColumnsTemplate4 state pages:" + "");
        if (!("OnlyColumnsTemplate1" == pages.name)) {
          console.info("get OnlyColumnsTemplate4 pages.name:" + "");
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push OnlyColumnsTemplate4 page error:" + err);
      }
      console.info("OnlyColumnsTemplate4 beforeEach end");
    });
    afterEach(async () => {
      console.info("OnlyColumnsTemplate4 after each called");
    });
/**
     * @tc.number   SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300
     * @tc.name     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300
     * @tc.desc     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300] START');
      let driver = Driver.create();
      try {
      await CommonFunc.sleep(300);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      try {
      await driver.findComponent(ON.id('OnlyColumnsTemplate1' + '_button'));
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      try {
      await (button?.click() as Promise<void>);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(300);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart1', value: 5
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd1', value: 1
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart2', value: 5
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd2', value: 1
      })
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }

      console.log('get Initial value')
      let GridItem_011: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_022: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');


      console.log('assert size')
	  expect(Math.abs(Math.round(GridItem_011.right - GridItem_011.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(52)))) <= 1).assertTrue();
      console.log('GridItem_011.right - GridItem_011.left' + (GridItem_011.right - GridItem_011.left))
	  expect(Math.abs(Math.round(GridItem_011.bottom - GridItem_011.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      console.log('GridItem_011.bottom - GridItem_011.top' + (GridItem_011.bottom - GridItem_011.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0300] END');
      done();
    });

/**
     * @tc.number   SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500
     * @tc.name     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500
     * @tc.desc     SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500] START');
      let driver = Driver.create();
      try {
      await CommonFunc.sleep(300);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      try {
      await driver.findComponent(ON.id('OnlyColumnsTemplate1' + '_button'));
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      try {
      await (button?.click() as Promise<void>);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');
      try {
      await CommonFunc.sleep(300);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart1', value: 2
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd1', value: 1
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnStart2', value: 2
      })
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'columnEnd2', value: 1
      })
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('OnlyColumnsTemplate4Test await err: ' + JSON.stringify(err));
      }

      console.log('get Initial value')
      let GridItem_011: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_022: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');


      console.log('assert size')
	  expect(Math.abs(Math.round(GridItem_011.right - GridItem_011.left) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(52)))) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_011.right - GridItem_011.left))
	  expect(Math.abs(Math.round(GridItem_011.bottom - GridItem_011.top) - Math.round(Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_011.bottom - GridItem_011.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_static_0500] END');
      done();
    });
  })
}
