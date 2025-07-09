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
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON, loadAndSetUpUiTest } from '@ohos.UiTest';
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

export default function OnlyRowsTemplate1() {
  describe('OnlyRowsTemplate1', () => {
    beforeAll(() => {
      console.info("OnlyRowsTemplate1 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnlyRowsTemplate1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnlyRowsTemplate1 state pages:" + "");
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyRowsTemplate1 pages.name:" + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push OnlyRowsTemplate1 page result:" + "");
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate1 page error:" + err);
      }
      console.info("OnlyRowsTemplate1 beforeEach end");
    });
    afterEach(async () => {
      console.info("OnlyRowsTemplate1 after each called");
    });


    /**
     * @tc.number SUB_ACE_GRID_OnlyRowsTemplate1_0100
     * @tc.name testGrid
     * @tc.desc GridItem1 and GridItem2 have the same rowStart and rowEnd settings
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate1_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_static_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_02');

      console.log('assert position')
      expect(Math.abs(GridItem_01.top - GridItem_02.top) <= 1).assertTrue();
      console.log('GridItem_01.top' + GridItem_01.top)
      console.log('GridItem_02.top' + GridItem_02.top)
      const uiContext = new UIContext();
      console.log('assert space')
      expect(Math.abs(GridItem_02.left - GridItem_01.right - uiContext.vp2px(10)) <= 1).assertTrue();
      console.log('GridItem_02.left - GridItem_01.right' + (GridItem_02.left - GridItem_01.right))

      console.log('assert size')
      expect(Math.abs(GridItem_01.right - GridItem_01.left - uiContext.vp2px(100)) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(GridItem_01.bottom - GridItem_01.top - uiContext.vp2px(154)) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1_button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_static_0100] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_OnlyRowsTemplate1_0200
     * @tc.name testGrid
     * @tc.desc GridItem set rowStart to 0
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate1_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_static_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'rowStart1', value: 0
      })
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'rowEnd1', value: 1
      })
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'rowStart2', value: 2
      })
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'rowEnd2', value: 3
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');
      const uiContext = new UIContext();
      console.log('assert size')
      expect(Math.abs(GridItem_01.right - GridItem_01.left - uiContext.vp2px(100)) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(GridItem_01.bottom - GridItem_01.top - uiContext.vp2px(154)) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1_button'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_static_0200] END');
      done();
    });
  })
}
