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
export default function ColumnSetFlexShink_SubChange() {
  describe('ColumnSetFlexShinkTest', () => {
    beforeAll(() => {
      console.info("ColumnSetFlexShinkTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetFlexShinkTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetFlexShink_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetFlexShinkTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ColumnSetFlexShinkTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetFlexShinkTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetFlexShinkTest page error:" + err);
      }
      console.info("ColumnSetFlexShinkTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SetFlexShink after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1800
     * @tc.name testColumnSetFlexShink
     * @tc.desc Subcomponents set flexshink (3-2-1) attribute.
     */
    it('testColumnSetFlexShink_static', 0, async () => {
      console.info('new testColumnSetFlexShink START');
      const uiContext = new UIContext();
      await CommonFunc.sleep(2000);
      let columnSetFlexShink_1: RectValue = CommonFunc.getComponentRect('columnSetFlexShink_1');
      let columnSetFlexShink_2: RectValue = CommonFunc.getComponentRect('columnSetFlexShink_2');
      let columnSetFlexShink_3: RectValue = CommonFunc.getComponentRect('columnSetFlexShink_3');
      let columnSetFlexShink: RectValue = CommonFunc.getComponentRect('columnSetFlexShink');

      expect(Math.abs(columnSetFlexShink.top - columnSetFlexShink_1.top) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShink_2.top - columnSetFlexShink_1.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShink_3.top - columnSetFlexShink_2.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShink.bottom - columnSetFlexShink_3.bottom - Math.round(uiContext.vp2px(40))) <= 1).assertTrue()
      console.info('new testColumnSetFlexShink END');
    });
  })
}
