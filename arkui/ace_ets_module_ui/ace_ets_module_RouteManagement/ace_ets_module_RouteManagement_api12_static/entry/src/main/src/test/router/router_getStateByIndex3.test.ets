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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test'

export default function router_getStateByIndex3() {
  describe('router_getStateByIndex3', () => {
    beforeAll(() => {
      console.info("router_getStateByIndex3 beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.RouteManagement.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("router_getStateByIndex3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/router_getStateByIndex3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get router_getStateByIndex3 state pages:" + JSON.stringify(pages));
        if (!("router_getStateByIndex3" == pages.name)) {
          console.info("get router_getStateByIndex3 pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push router_getStateByIndex3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push router_getStateByIndex3 page error:" + err);
      }
      console.info("router_getStateByIndex3 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("router_getStateByIndex3 after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_ABILITY_ROUTER_0030
     * @tc.name testGetStateByIndex
     * @tc.desc Retrieve the status information of the corresponding page through index values.
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it('router_getStateByIndex3_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[router_getStateByIndex3_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('router_getStateByIndex3_btn'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let text1 = inspector.getInspectorByKey('router_getStateByIndex3_text');
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))
        .assertEqual('index=2;name=router_getStateByIndex3;path=MainAbility/pages/router/;params={};');

      console.info('[router_getStateByIndex3_static_0100] END');
      done();
    });

  })
}
