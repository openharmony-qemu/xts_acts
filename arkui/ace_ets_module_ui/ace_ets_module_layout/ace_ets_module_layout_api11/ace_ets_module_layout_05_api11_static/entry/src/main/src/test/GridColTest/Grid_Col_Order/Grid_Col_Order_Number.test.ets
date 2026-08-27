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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import GlobalContext from '../../../../ets/MainAbility/common/GlobalContext'
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function Grid_Col_Order_Number() {
  describe('Grid_Col_Order_Number', () => {

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Col_Order_Number beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridCol/Grid_Col_Order/Grid_Col_Order_Number',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Col_Order_Number state pages: " + JSON.stringify(pages));
        if (!("Grid_Col_Order_Number" == pages.name)) {
          console.info("get Grid_Col_Order_Number state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Col_Order_Number page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Col_Order_NumberTest await err: ' + JSON.stringify(err));
      }
      console.info("Grid_Col_Order_Number after each called")
    });
    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_Number_TEST_static_0100
     * @tc.name     SUB_ACE_Grid_Col_Order_Number_TEST_static_0100
     * @tc.desc     SUB_ACE_Grid_Col_Order_Number_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_Number_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_static_0100] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'addOrder', value: -1
      });
            try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('Grid_Col_Order_NumberTest await err: ' + JSON.stringify(err));
      }

      console.log('get Initial value')
      let Grid_Col_Order_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_01');
      let Grid_Col_Order_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_02');
      let Grid_Col_Order_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_03');
      let Grid_Col_Order_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_04');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_Number_02.top - Grid_Col_Order_Number_01.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_03.top - Grid_Col_Order_Number_02.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_04.top - Grid_Col_Order_Number_03.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_Number_TEST_static_0200
     * @tc.name     SUB_ACE_Grid_Col_Order_Number_TEST_static_0200
     * @tc.desc     SUB_ACE_Grid_Col_Order_Number_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_Number_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_static_0200] START');
      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'addOrder', value: 0
      });
            try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('Grid_Col_Order_NumberTest await err: ' + JSON.stringify(err));
      }
      console.log('get Initial value')
      let Grid_Col_Order_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_01');
      let Grid_Col_Order_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_02');
      let Grid_Col_Order_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_03');
      let Grid_Col_Order_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_04');
      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_Number_02.top - Grid_Col_Order_Number_01.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_03.top - Grid_Col_Order_Number_02.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_04.top - Grid_Col_Order_Number_03.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_static_0200] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_Grid_Col_Order_Number_TEST_static_0300
     * @tc.name     SUB_ACE_Grid_Col_Order_Number_TEST_static_0300
     * @tc.desc     SUB_ACE_Grid_Col_Order_Number_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_Grid_Col_Order_Number_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_static_0200] START');

      AppStorage.get<MessageManager<Int>>('messageManager')?.notify({
        name: 'addOrder', value: 2
      });
            try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('Grid_Col_Order_NumberTest await err: ' + JSON.stringify(err));
      }
      console.log('get Initial value')
      let Grid_Col_Order_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_01');
      let Grid_Col_Order_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_02');
      let Grid_Col_Order_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_03');
      let Grid_Col_Order_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Number' + '_04');
      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_Number_03.top - Grid_Col_Order_Number_02.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_04.top - Grid_Col_Order_Number_03.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Order_Number_01.top - Grid_Col_Order_Number_04.bottom) -
      UIContext.resolveUIContext()!.vp2px(10)) <= 1).assertTrue();
      console.info('[SUB_ACE_Grid_Col_Order_Number_TEST_static_0200] END');
      done();
    });

  })
}