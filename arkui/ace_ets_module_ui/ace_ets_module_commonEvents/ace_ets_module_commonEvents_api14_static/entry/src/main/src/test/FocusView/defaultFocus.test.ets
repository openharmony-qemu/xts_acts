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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON ,Component} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function defaultFocus() {

  describe('defaultFocus', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("defaultFocus beforeEach start");
      const searchRouter = AppStorage.get<Router>("router", Type.from<Router>()) as Router
      console.info("defaultFocus beforeEach start222");
      try {
        searchRouter.pushUrl({
          url: 'MainAbility/pages/FocusView/defaultFocus',
        });
        await CommonFunc.sleep(2000);
        console.info("push defaultFocus success: ");
      } catch (err) {
        console.error("push defaultFocus page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("defaultFocus after each called");
    });

    /**
     * @tc.number    defaultFocus_0010
     * @tc.name      defaultFocus_0010
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('defaultFocus_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('defaultFocus_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[defaultFocus_0010] attrs is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[defaultFocus_0010] content is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[defaultFocus_0010] END');
      done();
    });
    /**
     * @tc.number    defaultFocus_0020
     * @tc.name      defaultFocus_0020
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('defaultFocus_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('defaultFocus_0020 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await (driver.findComponent(ON.id('btn')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text');
      console.info("[defaultFocus_0020] attrs is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[defaultFocus_0020] content is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[defaultFocus_0020] END');
      done();
    });

  })
}
