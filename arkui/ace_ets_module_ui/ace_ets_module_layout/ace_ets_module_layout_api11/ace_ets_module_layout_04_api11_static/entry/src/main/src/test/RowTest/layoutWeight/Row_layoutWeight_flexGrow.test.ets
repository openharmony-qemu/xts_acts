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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
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

export default function Row_layoutWeight_flexGrow() {
  describe('Row_layoutWeight_flexGrow', () => {
    beforeAll(() => {
      console.info("Row_layoutWeight_flexGrow beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_layoutWeight_flexGrow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/layoutWeight/Row_layoutWeight_flexGrow",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_layoutWeight_flexGrow state pages:" + "");
        if (!("Row_layoutWeight_flexGrow" == pages.name)) {
          console.info("get Row_layoutWeight_flexGrow pages.name:" + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Row_layoutWeight_flexGrow page result:" + "");
        }
      } catch (err) {
        console.error("push Row_layoutWeight_flexGrow page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_layoutWeight_flexGrow after each called")
    });

    /**
     * @tc.number SUB_ACE_Row_layoutWeight_flexGrow_TEST_0100
     * @tc.name testLayoutWeight
     * @tc.desc row1, row2 and row3 set  layoutWeight(1),the layoutWeight property takes precedence over flexGrow
     */
    it('SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0100] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'addLayoutWeight', value: 1
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_layoutWeight_flexGrow_011: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_011');
      let Row_layoutWeight_flexGrow_012: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_012');
      let Row_layoutWeight_flexGrow_013: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_013');
      let Row_layoutWeight_flexGrow_01: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_011.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_012.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_013.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_013.bottom)) <= 1)
        .assertTrue();
      const uiContext = new UIContext();
      console.log('assert space')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right', Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right)
      console.log('Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right', Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_011.bottom - Row_layoutWeight_flexGrow_011.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.bottom - Row_layoutWeight_flexGrow_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.bottom - Row_layoutWeight_flexGrow_013.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_011.right - Row_layoutWeight_flexGrow_011.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.right - Row_layoutWeight_flexGrow_012.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.right - Row_layoutWeight_flexGrow_013.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_layoutWeight_flexGrow_TEST_0200
     * @tc.name testLayoutWeight
     * @tc.desc row1, row2 and row3 set  layoutWeight(2),the layoutWeight property takes precedence over flexGrow
     */
    it('SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'addLayoutWeight', value: 2
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_layoutWeight_flexGrow_011: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_011');
      let Row_layoutWeight_flexGrow_012: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_012');
      let Row_layoutWeight_flexGrow_013: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_013');
      let Row_layoutWeight_flexGrow_01: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_011.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_012.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_013.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_013.bottom)) <= 1)
        .assertTrue();
      const uiContext = new UIContext();
      console.log('assert space')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right', Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right)
      console.log('Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right', Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_011.bottom - Row_layoutWeight_flexGrow_011.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.bottom - Row_layoutWeight_flexGrow_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.bottom - Row_layoutWeight_flexGrow_013.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_011.right - Row_layoutWeight_flexGrow_011.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.right - Row_layoutWeight_flexGrow_012.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.right - Row_layoutWeight_flexGrow_013.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Row_layoutWeight_flexGrow_TEST_0300
     * @tc.name testLayoutWeight
     * @tc.desc row1, row2 and row3 set  layoutWeight(3),the layoutWeight property takes precedence over flexGrow
     */
    it('SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0300] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'addLayoutWeight', value: 3
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_layoutWeight_flexGrow_011: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_011');
      let Row_layoutWeight_flexGrow_012: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_012');
      let Row_layoutWeight_flexGrow_013: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_013');
      let Row_layoutWeight_flexGrow_01: RectValue = CommonFunc.getComponentRect('Row_layoutWeight_flexGrow_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_011.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_012.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_layoutWeight_flexGrow_013.top - Row_layoutWeight_flexGrow_01.top) - Math.round(Row_layoutWeight_flexGrow_01.bottom - Row_layoutWeight_flexGrow_013.bottom)) <= 1)
        .assertTrue();
      const uiContext = new UIContext();
      console.log('assert space')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right)) - (Math.round(uiContext.vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right', Row_layoutWeight_flexGrow_012.left - Row_layoutWeight_flexGrow_011.right)
      console.log('Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right', Row_layoutWeight_flexGrow_013.left - Row_layoutWeight_flexGrow_012.right)


      console.log('assert height')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_011.bottom - Row_layoutWeight_flexGrow_011.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.bottom - Row_layoutWeight_flexGrow_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.bottom - Row_layoutWeight_flexGrow_013.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_011.right - Row_layoutWeight_flexGrow_011.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_012.right - Row_layoutWeight_flexGrow_012.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_layoutWeight_flexGrow_013.right - Row_layoutWeight_flexGrow_013.left)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_layoutWeight_flexGrow_TEST_static_0300] END');
      done();
    });

  })
}