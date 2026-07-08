'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern, Component } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function ShowToastOptionsTest(): void {
  describe('ShowToastOptionsTest', () => {
    beforeAll(async () => {

      console.info("ShowToastOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });

    beforeEach(async () => {

      console.info("ShowToastOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogSystemMaterial/ShowToastOptionsTestPage',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ShowToastOptionsTest state pages:" + JSON.stringify(pages));
        if (!("PopupIndex" == pages.name)) {
          console.info("get ShowToastOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push ShowToastOptionsTest page error:" + err);
      }
      console.info("ShowToastOptionsTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("ShowToastOptionsTest after each called");
    });

    /**
     * @tc.name   ShowToastOptionsTest_Message_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Message_0100
     * @tc.desc   Test ShowToastOptions message parameter with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Message_0100', Level.LEVEL0, async () => {

      console.info('ShowToastOptionsTest_Message_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_system_material'));
      await ((await driver.findComponent(ON.id('PLACEHOLDER'))) as Component).click();
      await CommonFunc.sleep(1000);

      let tt1 = inspector.getInspectorByKey('title_text');
      let obj = JSON.parseJsonElement(tt1);
      let dataE = obj.getElement('$attrs').getString('content');
      expect(dataE).assertEqual('ShowToastOptions Test Page');
      console.info('ShowToastOptionsTest_Message_0100 Popup Undefined is visible');

      await CommonFunc.sleep(500);
      console.info('ShowToastOptionsTest_Message_0100 Menu title is visible');
      console.info('ShowToastOptionsTest_Message_0100 END');
    });
  });
}
