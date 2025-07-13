/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import inspector from '@ohos.arkui.inspector'
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "../../../hypium/index";
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../ets/MainAbility/common/Common';
import bundle from '@ohos.bundle.bundleManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from './Utils.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function qrCodeJsunit() {
  describe('qrCodeTest', () => {
    beforeAll(() => {
      console.info("qrCodeJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/qrCode",
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
          await CommonFunc.sleep(2000);
          // console.info("push TextClockApiTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextClockApiTest page error:" + err);
      }
      console.info("TextClockApiTest beforeEach end");
    });

    /**
     * @tc.number test_qrCode_001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_qrCode_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_001] START');

      let strJson =  inspector.getInspectorByKey('QrCodeColorKey1')

      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_qrCode_static_001] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      expect(Math.abs(obj.getElement('$attrs').getDouble('opacity') as number - 0.1) < 0.000001).assertTrue();
      console.info('[test_qrCode_static_001] END');
      done();
    });

    /**
     * @tc.number test_qrCode_002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_qrCode_static_002', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_002] START');
      let strJson =inspector.getInspectorByKey('QrCodeColorKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_qrCode_static_002] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('color')).assertEqual("#FF0011FF");

      console.info('[test_qrCode_static_002] END');
      done();
    });

    /**
     * @tc.number test_qrCode_003
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_qrCode_static_003', 0, async (done: () => void): Promise<void> => {
      console.info('[test_qrCode_static_003] START');
      let strJson = inspector.getInspectorByKey('QrCodeColorKey1');

      let obj = JSON.parseJsonElement(strJson);
      console.info("[test_qrCode_static_003] obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual("#FF008000");
      console.info('[test_qrCode_static_003] END');
      done();
    });
  })
}
