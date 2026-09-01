'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function EnvBreakpoint22() {
  describe('EnvBreakpoint2', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("EnvBreakpoint2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Env/EnvBreakpoint2",
      }
      try {
        const EnvBreakpoint2 = AppStorage.get<Router>("router") as Router
        EnvBreakpoint2.clear();
        let pages:router.RouterState = EnvBreakpoint2.getState();
        console.info("get EnvBreakpoint2 state pages: " + JSON.stringify(pages));
        if (!("EnvBreakpoint2" == pages.name)) {
          console.info("get EnvBreakpoint2 state pages.name: " + JSON.stringify(pages.name));
          // let result = await EnvBreakpoint2.pushUrl(options);
          EnvBreakpoint2.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push EnvBreakpoint2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EnvBreakpoint2 page error:" + err);
      }
      console.info("EnvBreakpoint2 beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number SUB_ARKUI_API_EnvBreakpoint2_0100
     * @tc.name   SUB_ARKUI_API_EnvBreakpoint2_0100
     * @tc.desc   SUB_ARKUI_API_EnvBreakpoint2_0100
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_EnvBreakpoint2_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_EnvBreakpoint2_0100] START');

      // Get updated num value (should be incremented)
      let strJson2 = inspector.getInspectorByKey('Env_ComponentV2_001');
      await CommonFunc.sleep(1000);
      let ComponentV2_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      await CommonFunc.sleep(1000);
      expect(ComponentV2_width.length).assertEqual(33);

      done();
    });

    /**
     * @tc.number SUB_ARKUI_API_EnvBreakpoint2_0200
     * @tc.name   SUB_ARKUI_API_EnvBreakpoint2_0200
     * @tc.desc   SUB_ARKUI_API_EnvBreakpoint2_0200
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_EnvBreakpoint2_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_EnvBreakpoint2_0200] START');
      let strJson2 = inspector.getInspectorByKey('Env_Component_001');
      await CommonFunc.sleep(1000);
      let Component_width = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));
      await CommonFunc.sleep(1000);
      expect(Component_width.length).assertEqual(31);
      done();
    });
  })
}
