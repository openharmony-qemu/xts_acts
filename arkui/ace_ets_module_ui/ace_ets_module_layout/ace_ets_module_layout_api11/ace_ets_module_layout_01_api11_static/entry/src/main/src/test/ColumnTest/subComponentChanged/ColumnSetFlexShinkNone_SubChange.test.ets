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
export default function ColumnSetFlexShinkNone_SubChange() {
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
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetFlexShinkNone_SubChange',
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
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_1900
     * @tc.name testColumnSetFlexShinkNone
     * @tc.desc Subcomponents set flexshink (0-0-1) attribute.
     */
    it('testColumnSetFlexShinkNone_static', 0, async () => {
      console.info('new testColumnSetFlexShinkNone START');
      const uiContext = new UIContext();
      await CommonFunc.sleep(2000);
      let columnSetFlexShinkNone_1: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone_1');
      let columnSetFlexShinkNone_2: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone_2');
      let columnSetFlexShinkNone_3: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone_3');
      let columnSetFlexShinkNone: RectValue = CommonFunc.getComponentRect('columnSetFlexShinkNone');

      expect(Math.abs(columnSetFlexShinkNone.top - columnSetFlexShinkNone_1.top) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone.bottom - columnSetFlexShinkNone_3.bottom) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone_2.top - columnSetFlexShinkNone_1.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone_3.top - columnSetFlexShinkNone_2.bottom - Math.round(uiContext.vp2px(30))) <= 1).assertTrue()
      expect(Math.abs(columnSetFlexShinkNone_3.bottom - columnSetFlexShinkNone_3.top - Math.round(uiContext.vp2px(190))) <= 1).assertTrue()
      console.info('new testColumnSetFlexShinkNone END');
    });
  })
}
