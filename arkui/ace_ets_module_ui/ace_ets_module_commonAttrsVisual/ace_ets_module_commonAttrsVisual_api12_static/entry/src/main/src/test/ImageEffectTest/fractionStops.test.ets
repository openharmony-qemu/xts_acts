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

import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function fractionStops() {

  describe('fractionStops', () => {
    beforeEach(async (): Promise<void> => {
      console.info("fractionStops beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ImageEffect/fractionStops",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get fractionStops state pages: " + JSON.stringify(pages));
        if (!("fractionStops" == pages.name)) {
          console.info("get fractionStops state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push fractionStops page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('fractionStops afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("fractionStops after each called");
    });


    
    
/**
      * @tc.number   fractionStops_static_0100
      * @tc.name     fractionStops_static_0100
      * @tc.desc     fractionStops_static_0100
      * @tc.level    Level.LEVEL2
      */
it('fractionStops_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('fractionStops_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('fractionStops sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('fractionStops');
      console.info("[fractionStops_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[fractionStops_static_0100] content obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('linearGradientBlur')));
      console.info("[fractionStops_static_0100] content fractionStops is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('linearGradientBlur')
        .getElement('options')
        .getElement('fractionStops')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('linearGradientBlur')
        .getElement('options')
        .getElement('fractionStops')))
        .assertEqual('["0.000000,0.000000","0.000000,0.330000","1.000000,0.660000","1.000000,1.000000"]');
      console.info('[fractionStops_static_0100] END');
      done();
    });
  })
}
