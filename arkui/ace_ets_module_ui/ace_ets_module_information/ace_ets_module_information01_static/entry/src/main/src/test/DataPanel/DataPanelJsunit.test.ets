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
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  });
}

export default function datapanelJsunit() {

  describe('datapanelJsunit', () => {
    beforeAll(() => {
      console.info("datapanelJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DataPanel/DataPanel",
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
          await sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    afterEach(async () => {
      await sleep(1);
      console.info("DataPanel after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0730
     * @tc.name testDataPanelinspector.getInspectorByKey_static_010
     * @tc.desc aceEtsTest
     */
    it('testDataPanelinspector.getInspectorByKey_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('testinspector.getInspectorByKey START');
      let strJson = inspector.getInspectorByKey('DataPanel');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringifyJsonElement(obj));
      console.log("cd DataPanel type " + obj.getString('$type'));
      console.log("cd DataPanel values1 " + typeof ([20, 40, 20]));
      console.log("cd DataPanel values " + typeof (obj.getElement('$attrs').getString('values')));
      console.log("cd DataPanel values" + obj.getElement('$attrs').getString('values'));
      console.log("cd DataPanel dataPanelType" + obj.getElement('$attrs').getString('DataPanelType'));
      console.log("cd  DataPanel max" + obj.getElement('$attrs').getString('max'));
      console.log("panel closeEffect" + obj.getElement('$attrs').getString('closeEffect'));
      expect(obj.getElement('$attrs').getString('closeEffect')).assertEqual("false");
      expect(obj.getString('$type')).assertEqual("DataPanel");
      expect(obj.getElement('$attrs').getString('values')).assertEqual('[20,40,20]')
      expect(obj.getElement('$attrs').getDouble('max')).assertEqual(100.000000.toFixed(6));
      console.info('cd dataPanelInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0740
     * @tc.name testDataPanelinspector.getInspectorByKey_static_020
     * @tc.desc aceEtsTest
     */
    it('testDataPanelinspector.getInspectorByKey_static_020', 0, async (done: () => void): Promise<void> => {
      console.info('testinspector.getInspectorByKey START');
      let strJson = inspector.getInspectorByKey('DataPanel2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringifyJsonElement(obj));
      console.log("cd DataPanel dataPanelType" + obj.getString('$attrs'));
      console.log("cd DataPanel Type" + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual("DataPanelType.Circle");
      console.log("panel closeEffect" + JSON.stringify(obj.getElement('$attrs').getString('closeEffect')));
      expect(obj.getElement('$attrs').getString('closeEffect')).assertEqual("true");
      console.info('cd dataPanelInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0740
     * @tc.name testDataPanelinspector.getInspectorByKey_static_020
     * @tc.desc aceEtsTest
     */
    it('testDataPanelinspector.getInspectorByKey_static_030', 0, async (done: () => void): Promise<void> => {
      console.info('testinspector.getInspectorByKey START');
      let strJson = inspector.getInspectorByKey('DataPanel3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringifyJsonElement(obj));
      console.log("cd DataPanel type " + obj.getString('$type'));
      console.log("cd DataPanel values1 " + typeof ([20, 40, 20]));
      console.log("cd DataPanel values " + typeof (obj.getElement('$attrs').getString('values')));
      console.log("cd DataPanel values" + obj.getElement('$attrs').getString('values'));
      console.log("cd  DataPanel max" + obj.getElement('$attrs').getDouble('max'));
      console.log("panel closeEffect" + obj.getElement('$attrs').getString('closeEffect'))
      expect(obj.getElement('$attrs').getString('closeEffect')).assertEqual("false");
      expect(obj.getString('$type')).assertEqual("DataPanel");
      expect(obj.getElement('$attrs').getString('values')).assertEqual('[20,40,20]');
      expect(obj.getElement('$attrs').getDouble('max')).assertEqual(100.000000.toFixed(6));
      console.info('cd dataPanelInspectorByKey END');
      done();
    });
  })
}
