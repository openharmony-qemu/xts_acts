/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function BorderOptionsTest1() {
  describe('BorderOptionsTest1', () => {
    beforeAll(() => {
      console.info("BorderOptionsTest1 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(() =>  {
      console.info("BorderOptionsTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BorderOptions/BorderOptionsTest1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BorderOptionsTest1 state pages:" + JSON.stringify(pages));
        if (!("BorderOptionsTest1" == pages.name)) {
          console.info("get BorderOptionsTest1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          // await CommonFunc.sleep(2000);
          // console.info("push BorderOptionsTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BorderOptionsTest1 page error:" + err);
      }
      console.info("BorderOptionsTest1 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("BorderOptionsTest1 after each called");
    });


    /**
     * @tc.number    BorderOptionsTest1_static_0100
     * @tc.name      BorderOptionsTest1_static_0100
     * @tc.desc      Test BorderOptions
     * @tc.level     Level 2
     */
    it('BorderOptionsTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('BorderOptionsTest1_static_0100 START');
      await CommonFunc.sleep(1000);

      let strJson: string = inspector.getInspectorByKey('BorderOptionsTest1_text');
      console.info("[BorderOptionsTest1_static_0100] component border is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getElement('border'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('border').getString('dashGap')).assertEqual('5.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('border').getString('dashWidth')).assertEqual('10.00vp');

      console.info('BorderOptionsTest1_static_0100 END');
      done();
    });


  })
}