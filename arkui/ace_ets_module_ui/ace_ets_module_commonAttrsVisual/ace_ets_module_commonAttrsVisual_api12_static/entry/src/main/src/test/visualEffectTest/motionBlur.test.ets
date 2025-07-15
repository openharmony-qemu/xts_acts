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

export default function motionBlurTest() {
  describe('motionBlurTest', () => {
    beforeAll(() => {
      console.info("motionBlurTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(() => {
      console.info("motionBlurTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/visualEffect/motionBlur',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get motionBlurTest state pages: " + JSON.stringify(pages));
        if (!("motionBlur" == pages.name)) {
          console.info("get motionBlurTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          // await CommonFunc.sleep(2000);
          // console.info("push motionBlurTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push motionBlurTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number motionBlurTest_static_0100
     * @tc.name motionBlurTest_static_0100
     * @tc.desc api: motionBlur
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('motionBlurTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('motionBlurTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('motionBlur_id');
      console.log('motionBlurTest_static_0100', JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')))
      console.log('motionBlurTest_static_0100', JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('motionBlur')))
      expect(JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('motionBlur'))).assertEqual('{"radius":0,"anchor":{"x":0,"y":0}}');
      console.info('motionBlurTest_static_0100 END');
      done();
    });
  })
}
