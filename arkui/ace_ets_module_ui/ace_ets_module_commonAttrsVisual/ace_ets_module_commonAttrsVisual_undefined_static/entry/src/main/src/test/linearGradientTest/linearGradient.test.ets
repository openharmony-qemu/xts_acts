'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {
  Driver, ON
} from '@ohos.UiTest';

export default function LinearGradientTest() {
  describe('LinearGradientTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("LinearGradientTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/linearGradient/linearGradient',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get LinearGradientTest state pages:" + JSON.stringify(pages));
        if (!("linearGradient" == pages.name)) {
          console.info("get LinearGradientTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push LinearGradientTest page error:" + err);
      }
      console.info("LinearGradientTest beforeEach end");
    });
    /**
     * @tc.number    LinearGradientUndefinedTest_static_0100
     * @tc.name      LinearGradientUndefinedTest_static_0100
     * @tc.desc      LinearGradientUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('LinearGradientUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[LinearGradientUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('LinearGradientUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('linearGradientTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('LinearGradientUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }

      console.info("[LinearGradientUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[LinearGradientUndefinedTest_static_0100] linearGradient: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('linearGradient')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('linearGradient')))
        .assertEqual('{"angle":"90.00px","direction":"GradientDirection.Left","colors":[["#FFFF0000","0.000000"],["#FF0000FF","0.300000"],["#FFFFFF00","1.000000"]],"repeating":"true"}');
      let changeBtn = await driver.findComponent(ON.id('linearGradient'));
      try {
        await (changeBtn?.click() as Promise<void>);
      } catch (err) {
        console.info('LinearGradientUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('LinearGradientUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      console.info("[LinearGradientUndefinedTest_static_0100] click linearGradient");
      strJson = inspector.getInspectorByKey('linearGradientTest');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('LinearGradientUndefinedTest_static_0100 err: ' + JSON.stringify(err));
      }
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('linearGradient')))
        .assertEqual('{"direction":"GradientDirection.None","colors":[],"repeating":"false"}');
      console.info('[LinearGradientUndefinedTest_static_0100] END');
      done();
    });
  })
}
