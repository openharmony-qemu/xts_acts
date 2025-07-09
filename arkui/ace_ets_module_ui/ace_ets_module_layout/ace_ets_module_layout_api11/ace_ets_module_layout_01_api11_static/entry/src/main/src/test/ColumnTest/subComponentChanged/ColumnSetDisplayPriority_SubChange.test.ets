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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../../hypium/index";
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import {GlobalContext} from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext } from "@ohos.arkui.UIContext";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
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
export default function ColumnSetDisplayPriority_SubChange() {
  describe('ColumnSetDisplayPriorityTest', () => {
    beforeAll(() => {
      console.info("ColumnSetDisplayPriorityTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetDisplayPriorityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetDisplayPriority_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetDisplayPriorityTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ColumnSetDisplayPriorityTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetDisplayPriorityTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetDisplayPriorityTest page error:" + err);
      }
      console.info("ColumnSetDisplayPriorityTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SetDisplayPriority after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1400
     * @tc.name testColumnSetDisplayPriorityWithRateOneTwoThree
     * @tc.desc Subcomponents set display priority(1-2-3) attribute.
     */
    it('testColumnSetDisplayPriorityWithRateOneTwoThree_static', 0, async () => {
      console.info('new testColumnSetDisplayPriorityWithRateOneTwoThree START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'testpriority1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'testpriority2', value: 2
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'testpriority3', value: 3
      });
      await CommonFunc.sleep(2000);
      let setDisplayPriority1: RectValue = CommonFunc.getComponentRect('setDisplayPriority1');
      let setDisplayPriority2: RectValue = CommonFunc.getComponentRect('setDisplayPriority2');
      let setDisplayPriority3: RectValue = CommonFunc.getComponentRect('setDisplayPriority3');
      let setDisplayPriority: RectValue = CommonFunc.getComponentRect('setDisplayPriority');
      expect(Math.abs(setDisplayPriority.top - setDisplayPriority1.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.top - setDisplayPriority2.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.top - setDisplayPriority2.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority.bottom - setDisplayPriority3.bottom - Math.round(uiContext.vp2px(20))) <= 1).assertTrue()

      expect(Math.abs(setDisplayPriority1.right - setDisplayPriority1.left - Math.round(uiContext.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.right - setDisplayPriority2.left - Math.round(uiContext.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.right - setDisplayPriority3.left - Math.round(uiContext.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.bottom - setDisplayPriority1.top - Math.round(uiContext.vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.bottom - setDisplayPriority2.top - Math.round(uiContext.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.bottom - setDisplayPriority3.top - Math.round(uiContext.vp2px(150))) <= 1).assertTrue()
      console.info('new testColumnSetDisplayPriorityWithRateOneTwoThree END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1500
     * @tc.name testColumnSetDisplayPriorityWithRateTwoOneTwo
     * @tc.desc Subcomponents set display priority(1-0.5-1) attribute.
     */
    it('testColumnSetDisplayPriorityWithRateTwoOneTwo_static', 0, async () => {
      console.info('new testColumnSetDisplayPriorityWithRateTwoOneTwo START');
      const uiContext = new UIContext();
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'testpriority1', value: 1
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'testpriority2', value: 0.5
      });
      GlobalContext.getContext().getObject<number>('value')?.message.notify({
        name: 'testpriority3', value: 1
      });
      await CommonFunc.sleep(2000);
      let setDisplayPriority1: RectValue = CommonFunc.getComponentRect('setDisplayPriority1');
      let setDisplayPriority2: RectValue = CommonFunc.getComponentRect('setDisplayPriority2');
      let setDisplayPriority3: RectValue = CommonFunc.getComponentRect('setDisplayPriority3');
      let setDisplayPriority: RectValue = CommonFunc.getComponentRect('setDisplayPriority');
      expect(Math.abs(setDisplayPriority.top - setDisplayPriority1.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.top - setDisplayPriority2.top) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.top - setDisplayPriority2.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority.bottom - setDisplayPriority3.bottom - Math.round(uiContext.vp2px(20))) <= 1).assertTrue()

      expect(Math.abs(setDisplayPriority1.right - setDisplayPriority1.left - Math.round(uiContext.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.right - setDisplayPriority2.left - Math.round(uiContext.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.right - setDisplayPriority3.left - Math.round(uiContext.vp2px(300))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority1.bottom - setDisplayPriority1.top - Math.round(uiContext.vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority2.bottom - setDisplayPriority2.top - Math.round(uiContext.vp2px(200))) <= 1).assertTrue()
      expect(Math.abs(setDisplayPriority3.bottom - setDisplayPriority3.top - Math.round(uiContext.vp2px(150))) <= 1).assertTrue()
      console.info('new testColumnSetDisplayPriorityWithRateTwoOneTwo END');
    });
  })
}
