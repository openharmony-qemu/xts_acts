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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
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

export default function Row_Space() {
  describe('row_SpaceTest', () => {
    beforeAll(() => {
      console.info("Row_Space beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("row_SpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/spaceChanged/Row_Space",
      };
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Row_Space state pages:" + "");
        if (!("Row_Space" == pages.name)) {
          console.info("get Row_Space pages.name:" + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Row_Space page result:" + "");
        }
      } catch (err) {
        console.error("push Row_Space page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("row_SpaceTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_Space after each called")
    });
    /**
     * @tc.number SUB_ACE_ROW_SPACE_TEST_0100
     * @tc.name testRowSpaceUnfill
     * @tc.desc The space of parent component set to 10,The child component is not fully filled with
     *               the parent component
     */
    it('testRowSpaceUnfill_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('[testRowSpaceUnfill_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'addSpace', value: 10
      });
      await CommonFunc.sleep(3000);
      let Row_Space_011: RectValue = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012: RectValue = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013: RectValue = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01: RectValue = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1)
        .assertTrue();
      const uiContext = new UIContext();
      expect(Math.round(Row_Space_012.left - Row_Space_011.right) - uiContext.vp2px(10) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Row_Space_013.right).assertLess(Row_Space_01.right);
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testRowSpaceUnfill_static_01] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_ROW_SPACE_TEST_0200
     * @tc.name testRowSpaceFill
     * @tc.desc The space of parent component set to 25,The child component is filled with
     *               the parent component
     */
    it('testRowSpaceFill_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('[testRowSpaceFill_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'addSpace', value: 25
      });
      await CommonFunc.sleep(3000);
      let Row_Space_011: RectValue = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012: RectValue = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013: RectValue = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01: RectValue = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1)
        .assertTrue();
      const uiContext = new UIContext();
      expect(Math.abs(Math.round((Row_Space_012.left - Row_Space_011.right) * 10) / 10 - Math.round(uiContext.vp2px(25) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.right) - Math.round(Row_Space_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testRowSpaceFill_static_02] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_ROW_SPACE_TEST_0300
     * @tc.name testRowSpaceOverflow
     * @tc.desc The space of parent component set to 30,The child component is overflow with
     *               the parent component
     */
    it('testRowSpaceOverflow_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('[testRowSpaceOverflow_static_03] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'addSpace', value: 30
      });
      await CommonFunc.sleep(3000);
      let Row_Space_011: RectValue = CommonFunc.getComponentRect('Row_Space_011');
      let Row_Space_012: RectValue = CommonFunc.getComponentRect('Row_Space_012');
      let Row_Space_013: RectValue = CommonFunc.getComponentRect('Row_Space_013');
      let Row_Space_01: RectValue = CommonFunc.getComponentRect('Row_Space_01');
      expect(Math.abs(Math.round(Row_Space_011.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_013.top - Row_Space_01.top) - Math.round(Row_Space_01.bottom - Row_Space_013.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_Space_012.left - Row_Space_011.right) - Math.round(Row_Space_013.left - Row_Space_012.right)) <= 1)
        .assertTrue();
      const uiContext = new UIContext();
      expect(Math.abs(Row_Space_012.left - Row_Space_011.right - uiContext.vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Row_Space_01.left) - Math.round(Row_Space_011.left)) <= 1).assertTrue();
      expect(Row_Space_013.right).assertLarger(Row_Space_01.right);
      expect(Math.abs((Math.round(Row_Space_011.bottom - Row_Space_011.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.bottom - Row_Space_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.bottom - Row_Space_013.top)) - (Math.round(uiContext.vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_011.right - Row_Space_011.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_012.right - Row_Space_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_Space_013.right - Row_Space_013.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testRowSpaceOverflow_static_03] END');
      done();
    });
  })
}
