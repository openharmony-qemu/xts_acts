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
export default function RelativeContainer_Level() {
  describe('RelativeContainer_Level', () => {
    beforeEach(async (): Promise<void> => {
      console.info("RelativeContainer_Level beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RelativeContainer/RelativeContainer_Level/RelativeContainer_Level",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RelativeContainer_Level state pages:" + "");
        if (!("RelativeContainer_Level" == pages.name)) {
          console.info("get RelativeContainer_Level pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RelativeContainer_Level page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('RelativeContainer_LeTest await err: ' + JSON.stringify(err));
      }
      console.info("RelativeContainer_Level after each called")
    });
    
    
    

/**
     * @tc.number   SUB_ACE_RelativeContainer_Level_TEST_static_0100
     * @tc.name     SUB_ACE_RelativeContainer_Level_TEST_static_0100
     * @tc.desc     SUB_ACE_RelativeContainer_Level_TEST_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_RelativeContainer_Level_TEST_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_RelativeContainer_Level_TEST_static_0100] START');
      AppStorage.get<MessageManager<HorizontalAlign>>("messageManager")?.notify({
        name: 'addalign', value: HorizontalAlign.Start
      });

      try {
      await CommonFunc.sleep(3000);
      } catch (err) {
      console.info('RelativeContainer_LeTest await err: ' + JSON.stringify(err));
      }
      console.log('get Initial value')
      let RelativeContainer_Level_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_bt1');
      let RelativeContainer_Level_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Level_tx2.top - RelativeContainer_Level_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Level_tx2.right - RelativeContainer_Level_bt1.left) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Level_TEST_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   SUB_ACE_RelativeContainer_Level_TEST_static_0200
     * @tc.name     SUB_ACE_RelativeContainer_Level_TEST_static_0200
     * @tc.desc     SUB_ACE_RelativeContainer_Level_TEST_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_RelativeContainer_Level_TEST_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_RelativeContainer_Level_TEST_static_0200] START');
      AppStorage.get<MessageManager<HorizontalAlign>>("messageManager")?.notify({
        name: 'addalign', value: HorizontalAlign.Center
      });

      try {
      await CommonFunc.sleep(3000);
      } catch (err) {
      console.info('RelativeContainer_LeTest await err: ' + JSON.stringify(err));
      }
      console.log('get Initial value')
      let RelativeContainer_Level_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_bt1');
      let RelativeContainer_Level_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Level_tx2.top - RelativeContainer_Level_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Level_tx2.right - ((RelativeContainer_Level_bt1.right - RelativeContainer_Level_bt1.left) / 2 + RelativeContainer_Level_bt1.left)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Level_TEST_static_0200] END');
      done();

    });

    
    
    

/**
     * @tc.number   SUB_ACE_RelativeContainer_Level_TEST_static_0300
     * @tc.name     SUB_ACE_RelativeContainer_Level_TEST_static_0300
     * @tc.desc     SUB_ACE_RelativeContainer_Level_TEST_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_RelativeContainer_Level_TEST_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_RelativeContainer_Level_TEST_static_0300] START');
      AppStorage.get<MessageManager<HorizontalAlign>>("messageManager")?.notify({
        name: 'addalign', value: HorizontalAlign.End
      });

      try {
      await CommonFunc.sleep(3000);
      } catch (err) {
      console.info('RelativeContainer_LeTest await err: ' + JSON.stringify(err));
      }
      console.log('get Initial value')
      let RelativeContainer_Level_bt1: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_bt1');
      let RelativeContainer_Level_tx2: RectValue = CommonFunc.getComponentRect('RelativeContainer_Level_tx2');


      console.log('assert position')
      expect(Math.abs(RelativeContainer_Level_tx2.top - RelativeContainer_Level_bt1.bottom) <= 1).assertTrue();
      expect(Math.abs(RelativeContainer_Level_tx2.right - RelativeContainer_Level_bt1.right) <= 1).assertTrue();

      console.info('[SUB_ACE_RelativeContainer_Level_TEST_static_0300] END');
      done();

    });
  })
}