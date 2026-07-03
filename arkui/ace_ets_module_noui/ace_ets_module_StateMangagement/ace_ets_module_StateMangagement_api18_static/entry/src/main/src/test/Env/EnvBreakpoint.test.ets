'use static';
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  Level
} from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export default function EnvBreakpoint() {
  describe('EnvBreakpoint', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("EnvBreakpoint beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Env/EnvBreakpoint",
      }
      try {
        const EnvBreakpoint = AppStorage.get<Router>("router") as Router
        EnvBreakpoint.clear();
        let pages:router.RouterState = EnvBreakpoint.getState();
        console.info("get EnvBreakpoint state pages: " + JSON.stringify(pages));
        if (!("EnvBreakpoint" == pages.name)) {
          console.info("get EnvBreakpoint state pages.name: " + JSON.stringify(pages.name));
          // let result = await EnvBreakpoint.pushUrl(options);
          EnvBreakpoint.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push EnvBreakpoint success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnvBreakpoint page error:" + err);
      }
      console.info("EnvBreakpoint beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number SUB_ARKUI_API_EnvBreakpoint_0100
     * @tc.name   SUB_ARKUI_API_EnvBreakpoint_0100
     * @tc.desc   Test addMonitor with wildcard path 'cls.*' to monitor object property changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_EnvBreakpoint_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_EnvBreakpoint_0100] START');

      // Get updated num value (should be incremented)
      let strJson2 = inspector.getInspectorByKey('Env_ComponentV2_001');
      await CommonFunc.sleep(1000);
      let ComponentV2_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      await CommonFunc.sleep(1000);
      expect(ComponentV2_width.length).assertEqual(33);

      done();
    });

    /**
     * @tc.number SUB_ARKUI_API_EnvBreakpoint_0200
     * @tc.name   SUB_ARKUI_API_EnvBreakpoint_0200
     * @tc.desc   Test addMonitor with wildcard path monitoring propB changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_EnvBreakpoint_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_EnvBreakpoint_0200] START');
      let strJson2 = inspector.getInspectorByKey('Env_Component_001');
      await CommonFunc.sleep(1000);
      let Component_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      await CommonFunc.sleep(1000);
      expect(Component_width.length).assertEqual(31);
      done();
    });
  })
}
