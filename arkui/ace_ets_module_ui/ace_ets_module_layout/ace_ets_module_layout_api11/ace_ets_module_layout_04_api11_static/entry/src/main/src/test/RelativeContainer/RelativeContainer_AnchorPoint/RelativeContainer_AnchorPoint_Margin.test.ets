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
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { HorizontalAlign } from '@ohos.arkui.component'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function RelativeContainer_AnchorPoint_Margin() {
  describe('RelativeContainer_AnchorPoint_Margin', () => {
    beforeEach(async (): Promise<void> => {
      console.info("RelativeContainer_AnchorPoint_Margin beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Margin",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get RelativeContainer_AnchorPoint_Margin state pages:" + JSON.stringify(pages));
        if (!("RelativeContainer_AnchorPoint_Margin" == pages?.name)) {
          console.info("get RelativeContainer_AnchorPoint_Margin pages.name:" + JSON.stringify(pages?.name));
            routerInstance?.pushUrl(options)
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push RelativeContainer_AnchorPoint_Margin page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('RelativeContainer_AnTest await err: ' + JSON.stringify(err));
      }
      console.info("RelativeContainer_AnchorPoint_Margin after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_RelativeContainer_AnchorPoint_Margin_TEST_static_0100
     * @tc.name     SUB_ACE_RelativeContainer_AnchorPoint_Margin_TEST_static_0100
     * @tc.desc     SUB_ACE_RelativeContainer_AnchorPoint_Margin_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_RelativeContainer_AnchorPoint_Margin_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Margin_TEST_0100] START');

      try {
      await CommonFunc.sleep(3000);
      } catch (err) {
      console.info('RelativeContainer_AnTest await err: ' + JSON.stringify(err));
      }
      console.log('get Initial value')
      let RelativeContainer_AnchorPoint_Margin_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Margin_bt1');
      let RelativeContainer_AnchorPoint_Margin_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Margin_tx2');
      let RelativeContainer_AnchorPoint_Margin_r1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Margin_r1');
      let RelativeContainer_AnchorPoint_Margin_row1: RectValue = CommonFunc.getComponentRect('RelativeContainer_AnchorPoint_Margin_row1');
      let RelativeContainer_AnchorPoint_Margin_row2: RectValue = CommonFunc.getComponentRect('row_marginTest');

      console.log('assert position')
      expect(Math.abs(RelativeContainer_AnchorPoint_Margin_row1.left - RelativeContainer_AnchorPoint_Margin_row2.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Margin_r1.left - RelativeContainer_AnchorPoint_Margin_row1.left) <= 1)
        .assertTrue();

      expect(Math.abs(RelativeContainer_AnchorPoint_Margin_tx2.top - RelativeContainer_AnchorPoint_Margin_bt1.bottom) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Margin_tx2.bottom - RelativeContainer_AnchorPoint_Margin_r1.bottom) <= 1)
        .assertTrue();
      expect(Math.abs(RelativeContainer_AnchorPoint_Margin_tx2.right - ((RelativeContainer_AnchorPoint_Margin_bt1.right - RelativeContainer_AnchorPoint_Margin_bt1.left) / 2 + RelativeContainer_AnchorPoint_Margin_bt1.left)) <= 1)
        .assertTrue();


      console.info('[SUB_ACE_RelativeContainer_AnchorPoint_Margin_TEST_0100] END');
      done();
    });


  })
}