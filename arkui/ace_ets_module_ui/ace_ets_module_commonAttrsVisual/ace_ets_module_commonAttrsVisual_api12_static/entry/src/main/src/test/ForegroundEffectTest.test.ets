'use static';
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

import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function foregroundEffect() {

  describe('foregroundEffect', () => {
    beforeEach(async () => {
      console.info("foregroundEffect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/foregroundEffect',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get foregroundEffect state pages: " + JSON.stringify(pages));
        if (!("foregroundEffect" == pages.name)) {
          console.info("get foregroundEffect state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push foregroundEffect page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('foregroundEffect afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("foregroundEffect after each called");
    });


    
    /**
     * @tc.number   foregroundEffect_static_0100
     * @tc.name     foregroundEffect_static_0100
     * @tc.desc     foregroundEffect_static_0100
     * @tc.level    Level.LEVEL2
     */
it('foregroundEffect_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('foregroundEffect_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('foregroundEffect sleep err: ' + JSON.stringify(err));
      }
      let button1 = await driver.findComponent(ON.id('foregroundEffect1'));
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('foregroundEffect sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('foregroundEffect1');
      console.info("foregroundEffect_0100 obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("foregroundEffect_0100 " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('foregroundEffect')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('foregroundEffect').getString('radius'))
        .assertEqual('20.000000');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('foregroundEffect sleep err: ' + JSON.stringify(err));
      }

      console.info('[foregroundEffect_0100] END');
      done();
    });


  })
}
