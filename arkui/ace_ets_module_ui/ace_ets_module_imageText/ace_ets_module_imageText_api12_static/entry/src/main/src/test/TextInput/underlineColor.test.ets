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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '../../../../hypium/index'
import {Component, Driver, UiWindow, ON, loadAndSetUpUiTest, loadAndSetUpUiTest} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest,  startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function underlineColor() {

  describe('underlineColor', () => {
    beforeAll(() => {
      console.info("underlineColor beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("underlineColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/underlineColor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get underlineColor state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get underlineColor pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push underlineColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push underlineColor page error:" + err);
      }
      console.info("underlineColor beforeEach end");
    }); 


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("underlineColor after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0100
     * @tc.name      testGetImageAttr010
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */


    it('underlineColor_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('underlineColor_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('underlineColor1');
      let obj = JSON.parseJsonElement(strJson);
      let underlineColor = JSON.parseJsonElement(obj.getElement('$attrs').getString('underlineColor'))
      expect(underlineColor.getString('normal')).assertEqual('#FF808080');
      await CommonFunc.sleep(1000);
      console.info('[underlineColor_0100] END');
      done();
    });





  })
}
