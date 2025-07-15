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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from './Util.test';

export default function foregroundEffect() {

  describe('foregroundEffect', () => {
    beforeAll(() => {
      console.info("foregroundEffect beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("foregroundEffect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/foregroundEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get foregroundEffect state pages: " + JSON.stringify(pages));
        if (!("foregroundEffect" == pages.name)) {
          console.info("get foregroundEffect state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          // await CommonFunc.sleep(2000);
          // console.info("push foregroundEffect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push foregroundEffect page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("foregroundEffect after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0100
     * @tc.name testGetImageAttr010
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('foregroundEffect_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('foregroundEffect_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('foregroundEffect1'));
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('foregroundEffect1');
      console.info("foregroundEffect_0100 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("foregroundEffect_0100 " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('foregroundEffect')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('foregroundEffect').getString('radius')).assertEqual('20.000000');
      await CommonFunc.sleep(1000);

      console.info('[foregroundEffect_0100] END');
      done();
    });


  })
}
