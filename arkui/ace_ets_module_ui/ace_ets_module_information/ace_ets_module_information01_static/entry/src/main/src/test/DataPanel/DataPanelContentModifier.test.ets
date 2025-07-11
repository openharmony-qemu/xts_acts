// /**
//  * Copyright (c) 2025 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the 'License');
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an 'AS IS' BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function DataPanelContentModifierTest() {
  describe('DataPanelContentModifierTest', () => {
    beforeAll(() => {
      console.info("DataPanelContentModifierTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/dataPanel/DataPanelContentModifier",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",  Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClockApiTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextClockApiTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    /* *
    * @tc.number: DataPanelContentModifierTest_static_001
    * @tc.name  : DataPanelContentModifierTest_static_001
    * @tc.desc  : To test the contentModifier
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('DataPanelContentModifierTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DataPanelContentModifierTest_static_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('DataPanelContentModifier_max');
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[DataPanelContentModifierTest_static_001] obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Max=140');
      console.info('[DataPanelContentModifierTest_static_001] END');
      done();
    });
  })
}
