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
export default function ColumnSetLayoutWeight_SubChange() {
  describe('ColumnSetLayoutWeightTest', () => {
    beforeAll(() => {
      console.info("ColumnSetLayoutWeightTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetLayoutWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetLayoutWeight_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetLayoutWeightTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ColumnSetLayoutWeightTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetLayoutWeightTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetLayoutWeightTest page error:" + err);
      }
      console.info("ColumnSetLayoutWeightTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("SetLayoutWeight after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1700
     * @tc.name testColumnSetLayoutWeightWithRateThreeTwoOne
     * @tc.desc Subcomponents set layout weight(3-2-1) attribute.
     */
    it('testColumnSetLayoutWeightWithRateThreeTwoOne_static', 0, async () => {
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoOne START');
      const uiContext = new UIContext();
      await CommonFunc.sleep(1000);
      let layoutExpectHeight1 = 510 / 3;
      let layoutExpectHeight2 = 340 / 3;
      let layoutExpectHeight3 = 170 / 3;
      let setLayoutWeight1: RectValue = CommonFunc.getComponentRect('setLayoutWeight1');
      let setLayoutWeight2: RectValue = CommonFunc.getComponentRect('setLayoutWeight2');
      let setLayoutWeight3: RectValue = CommonFunc.getComponentRect('setLayoutWeight3');
      let setLayoutWeight: RectValue = CommonFunc.getComponentRect('setLayoutWeight');

      expect(Math.abs(setLayoutWeight1.top - setLayoutWeight.top) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight2.top - setLayoutWeight1.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight3.top - setLayoutWeight2.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight.bottom - setLayoutWeight3.bottom) <= 1).assertTrue()

      expect(Math.abs(setLayoutWeight1.bottom - setLayoutWeight1.top - Math.round(uiContext.vp2px(510 / 3))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight2.bottom - setLayoutWeight2.top - Math.round(uiContext.vp2px(340 / 3))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeight3.bottom - setLayoutWeight3.top - Math.round(uiContext.vp2px(170 / 3))) <= 1).assertTrue()
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoOne END');
    });
  })
}
