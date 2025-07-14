/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function grid_rowOnBreakpointChange_static_Jsunit() {
  describe('grid_rowOnBreakpointChange_static_Test', () => {
    beforeAll(() => {
      console.info("grid_rowOnBreakpointChange_static_Test beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("grid_rowOnBreakpointChange_static_Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridRow/grid_row',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get grid_rowOnBreakpointChange_static_Test state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get grid_rowOnBreakpointChange_static_Test pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push grid_rowOnBreakpointChange_static_Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid_rowOnBreakpointChange_static_Test page error:" + err);
      }
      console.info("grid_rowOnBreakpointChange_static_Test beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("grid_rowOnBreakpointChange_static_ after each called");
    });

    /*
     * @tc.number    SUB_ACE_BASIC_ETS_API_001
     * @tc.name      testgrid_rowOnBreakpointChange_static_001
     * @tc.desic     acegrid_rowOnBreakpointChange_static_EtsTest001
     */
    it('testgrid_rowOnBreakpointChange_static_001', 0, async () => {
      console.info('grid_rowOnBreakpointChange_static_ testgrid_rowOnBreakpointChange_static_001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange_static_001] component width strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement("$type")).assertEqual('GridRow');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString('width')).assertEqual("100vp");
      console.info("[testgrid_rowOnBreakpointChange_static_001] width value :" + JSON.parseJsonElement(strJson).getElement("$attrs").getString('width'));

    });

    /*
     * @tc.number    SUB_ACE_BASIC_ETS_API_002
     * @tc.name      testgrid_rowOnBreakpointChange_static_002
     * @tc.desic     acegrid_rowOnBreakpointChange_static_EtsTest002
     */
    it('testgrid_rowOnBreakpointChange_static_002', 0, async () => {
      console.info('grid_rowOnBreakpointChange_static_ testgrid_rowOnBreakpointChange_static_002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange_static_002] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement("$type")).assertEqual('GridRow');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString('height')).assertEqual("100vp");
      console.info("[testgrid_rowOnBreakpointChange_static_002] height value :" + JSON.parseJsonElement(strJson).getElement("$attrs").getString('height'));

    });

    /*
     * @tc.number    SUB_ACE_BASIC_ETS_API_003
     * @tc.name      testgrid_rowOnBreakpointChange_static_003
     * @tc.desic     acegrid_rowOnBreakpointChange_static_EtsTest003
     */
    it('testgrid_rowOnBreakpointChange_static_003', 0, async () => {
      console.info('grid_rowOnBreakpointChange_static_ testgrid_rowOnBreakpointChange_static_003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('GridRow');
      console.info("[testgrid_rowOnBreakpointChange_static_003] component backgroundColor strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement("$type")).assertEqual('GridRow');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString('backgroundColor')).assertEqual("0xFF0000");
      console.info("[testgrid_rowOnBreakpointChange_static_003] backgroundColor value :" + JSON.parseJsonElement(strJson)
        .getElement("$attrs").getString('backgroundColor'));

    });
  })
}
