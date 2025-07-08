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

export default function OnlyRowsTemplate2() {
  describe('OnlyRowsTemplate2', () => {
    beforeAll(() => {
      console.info("OnlyRowsTemplate2 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnlyRowsTemplate2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnlyRowsTemplate2 state pages:" + "");
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyRowsTemplate2 pages.name:" + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push OnlyRowsTemplate2 page result:" + "");
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate2 page error:" + err);
      }
      console.info("OnlyRowsTemplate2 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnlyRowsTemplate2 after each called");
    });
    /**
     * @tc.number SUB_ACE_GRID_OnlyRowsTemplate2_0100
     * @tc.name testGrid
     * @tc.desc GridItem only sets rowStart
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate2_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate2_static_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate2_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate2_GridItem_02');

      console.log('assert size')
      const uiContext = new UIContext();
      expect(Math.round(GridItem_01.right - GridItem_01.left)).assertEqual(Math.round(uiContext.vp2px(100)));
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.round(GridItem_01.bottom - GridItem_01.top)).assertEqual(Math.round(uiContext.vp2px(60)));
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      console.info('[SUB_ACE_GRID_OnlyRowsTemplate2_static_0100] END');
      done();
    });

  })
}
