/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { afterEach, beforeEach, describe, expect, it, beforeAll } from '../../../../hypium/index.ets';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Utils.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function qrcodeJsunit() {
  describe('QrcodeTest', () => {

    beforeAll(() => {
      console.info("qrcodeJsunit beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClockApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Qrcode/Qrcode",
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
      console.info("Qrcode after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0980
     * @tc.name testGetQrcodeAttr_static_010
     * @tc.desc aceEtsTest
     */
    it('testGetQrcodeAttr_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('testGetQrcodeAttr START');
      let strJson = inspector.getInspectorByKey('qrcode');
      let obj = JSON.parseJsonElement(strJson);
      console.info("Qrcode component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("qrcode backgroundColor" + obj.getElement('$attrs').getString('backgroundColor'));
      console.info("qrcode width" + obj.getElement('$attrs').getString('width'));
      console.info("qrcode height" + obj.getElement('$attrs').getString('height'));
      console.info("qrcode value" + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual("hello world")
      console.info('testGetQrcodeAttr END');
      done();
    });
  })
}
