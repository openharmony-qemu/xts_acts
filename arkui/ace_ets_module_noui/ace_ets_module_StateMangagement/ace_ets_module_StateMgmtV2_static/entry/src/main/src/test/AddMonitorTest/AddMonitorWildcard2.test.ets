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

export default function AddMonitorWildcard2() {
  describe('AddMonitorWildcard2', () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.StateMgmtV2.static", "EntryAbility");
      await UtilsTest.msSleep(1000);
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("AddMonitorWildcard2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorWildcard2",
      }
      try {
        const AddMonitorWildcard2 = AppStorage.get<Router>("router") as Router
        AddMonitorWildcard2.clear();
        let pages:router.RouterState = AddMonitorWildcard2.getState();
        console.info("get AddMonitorWildcard2 state pages: " + JSON.stringify(pages));
        if (!("AddMonitorWildcard2" == pages.name)) {
          console.info("get AddMonitorWildcard2 state pages.name: " + JSON.stringify(pages.name));
          // let result = await AddMonitorWildcard2.pushUrl(options);
          AddMonitorWildcard2.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AddMonitorWildcard2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AddMonitorWildcard2 page error:" + err);
      }
      console.info("AddMonitorWildcard2 beforeEach end");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number SUB_ARKUI_API_AddMonitorWildcard2_0100
     * @tc.name   SUB_ARKUI_API_AddMonitorWildcard2_0100
     * @tc.desc   Test addMonitor with wildcard path 'cls.*' to monitor object property changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_AddMonitorWildcard2_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_AddMonitorWildcard2_0100] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      // Click button to change propA - this should trigger onClsChanged callback
      let changePropABtn = await driver.findComponent(ON.id('synchronous_monitoring_001'));
      await CommonFunc.sleep(1000);
      await (changePropABtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Get updated num value (should be incremented)
      let strJson2 = inspector.getInspectorByKey('synchronous_text');
      await CommonFunc.sleep(1000);
      let updatedNum = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));

      expect(updatedNum).assertEqual('"Synchronous monitoring value:2,2"');

      done();
    });

    /**
     * @tc.number SUB_ARKUI_API_AddMonitorWildcard2_0200
     * @tc.name   SUB_ARKUI_API_AddMonitorWildcard2_0200
     * @tc.desc   Test addMonitor with wildcard path monitoring propB changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_ARKUI_API_AddMonitorWildcard2_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_AddMonitorWildcard2_0200] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);


      // Click first button to change propB
      let changePropBBtn1 = await driver.findComponent(ON.id('asynchronous_monitoring_001'));
      await CommonFunc.sleep(1000);
      await (changePropBBtn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // Get updated num value (should be incremented)
      let strJson2 = inspector.getInspectorByKey('asynchronous_text');
      //await CommonFunc.sleep(1000);
      let updatedNum = JSON.stringifyJsonElement(JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('content'));

      expect(updatedNum).assertEqual('"Asynchronous monitoring value:2,1"');

      done();
    });
  })
}
